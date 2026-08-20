"""trace_utils.py - shared netlist parsing and boolean AST.

Used by both trace.py (backward tracer) and the Z3 solvers
(solve.py, solve_multicycle.py). Nothing tracer-specific or
solver-specific lives here.
"""

import re
from itertools import product


# --------------------------------------------------------------------------
# AST for boolean expressions
# --------------------------------------------------------------------------

class Var:
    __slots__ = ("name",)
    def __init__(self, name):
        self.name = name

class Const:
    __slots__ = ("value",)
    def __init__(self, value):
        self.value = value

class Not:
    __slots__ = ("arg",)
    def __init__(self, arg):
        self.arg = arg

class And:
    __slots__ = ("args",)
    def __init__(self, args):
        self.args = args

class Or:
    __slots__ = ("args",)
    def __init__(self, args):
        self.args = args

class Xor:
    __slots__ = ("args",)
    def __init__(self, args):
        self.args = args


def leaves_of(node, out):
    if isinstance(node, Var):
        out.add(node.name)
    elif isinstance(node, Const):
        pass
    elif isinstance(node, Not):
        leaves_of(node.arg, out)
    elif isinstance(node, (And, Or, Xor)):
        for a in node.args:
            leaves_of(a, out)
    return out


# --------------------------------------------------------------------------
# Tokeniser / parser for "assign X = ...;" right-hand sides
# --------------------------------------------------------------------------

TOKEN_RE = re.compile(r"\\\S+|1'b[01]|[A-Za-z_]\w*(?:\[\d+\])?|[&|^~()?:]")


def clean_signal(tok):
    if tok.startswith("\\"):
        return tok[1:]
    return tok

class ExprParser:
    def __init__(self, tokens):
        self.toks = tokens
        self.i = 0

    def peek(self):
        return self.toks[self.i] if self.i < len(self.toks) else None

    def eat(self, tok=None):
        t = self.peek()
        if tok is not None and t != tok:
            raise ValueError(f"expected {tok!r}, got {t!r}")
        self.i += 1
        return t

    def parse(self):
        return self.parse_ternary()

    def parse_ternary(self):
        cond = self.parse_or()
        if self.peek() == "?":
            self.eat("?")
            true_val = self.parse_ternary()
            self.eat(":")
            false_val = self.parse_ternary()
            return Or([And([cond, true_val]), And([Not(cond), false_val])])
        return cond

    def parse_or(self):
        args = [self.parse_xor()]
        while self.peek() == "|":
            self.eat("|")
            args.append(self.parse_xor())
        return args[0] if len(args) == 1 else Or(args)

    def parse_xor(self):
        args = [self.parse_and()]
        while self.peek() == "^":
            self.eat("^")
            args.append(self.parse_and())
        return args[0] if len(args) == 1 else Xor(args)

    def parse_and(self):
        args = [self.parse_unary()]
        while self.peek() == "&":
            self.eat("&")
            args.append(self.parse_unary())
        return args[0] if len(args) == 1 else And(args)

    def parse_unary(self):
        if self.peek() == "~":
            self.eat("~")
            return Not(self.parse_unary())
        return self.parse_primary()

    def parse_primary(self):
        t = self.peek()
        if t == "(":
            self.eat("(")
            node = self.parse_ternary()
            self.eat(")")
            return node
        self.eat()
        sig = clean_signal(t)
        if sig in ("1'b0", "1'b1"):
            return Const(int(sig[-1]))
        return Var(sig)

def parse_expr(text):
    return ExprParser(TOKEN_RE.findall(text)).parse()

def norm(net):
    return net.lstrip("$")


# --------------------------------------------------------------------------
# Netlist model
# --------------------------------------------------------------------------

class CombDriver:
    def __init__(self, net, instance, cell, expr):
        self.net, self.instance, self.cell, self.expr = net, instance, cell, expr

    def describe(self):
        return f"{self.instance} ({self.cell})"

    def branches(self, value, ignore=None):
        # Tracer-only: enumerates input combinations that force this net to
        # `value`. Solvers don't call this — they hand the expr straight to
        # Z3 via to_z3() instead. Kept here rather than split out because
        # it's a method on this class; see trace.py for eval_expr(), its
        # only caller.
        from trace import eval_expr  # local import: avoids a hard dependency
                                       # for callers that never use branches()
        ignore = ignore or {}
        leaves = sorted(leaves_of(self.expr, set()))

        pinned = {leaf: ignore[norm(leaf)] for leaf in leaves
                  if norm(leaf) in ignore and ignore[norm(leaf)] is not None}
        quantified = [leaf for leaf in leaves
                      if norm(leaf) in ignore and ignore[norm(leaf)] is None]
        free_vars = [leaf for leaf in leaves
                     if leaf not in pinned and leaf not in quantified]

        results = []
        for free_combo in product([0, 1], repeat=len(free_vars)):
            free_env = dict(zip(free_vars, free_combo))
            holds_for_all = True
            for q_combo in product([0, 1], repeat=len(quantified)):
                env = dict(free_env)
                env.update(zip(quantified, q_combo))
                env.update(pinned)
                if eval_expr(self.expr, env) != value:
                    holds_for_all = False
                    break
            if holds_for_all:
                results.append(free_env)

        dropped = sorted(set(pinned) | set(quantified))
        return results, dropped


class FFDriver:
    def __init__(self, net, instance, cell, clk, d_net,
                 reset_signal=None, reset_active_low=True, reset_value=None):
        self.net, self.instance, self.cell, self.clk, self.d_net = \
            net, instance, cell, clk, d_net
        self.reset_signal = reset_signal
        self.reset_active_low = reset_active_low
        self.reset_value = reset_value

    def describe(self):
        extra = f", clk={self.clk}"
        if self.reset_signal:
            extra += f", reset={self.reset_signal}"
        return f"{self.instance} ({self.cell}{extra})"

    def _raw(self, value):
        out = []
        if self.reset_signal is not None:
            if self.reset_value == value:
                asserted = 0 if self.reset_active_low else 1
                out.append({self.reset_signal: asserted})
            deasserted = 1 if self.reset_active_low else 0
            out.append({self.reset_signal: deasserted, self.d_net: value})
        else:
            out.append({self.d_net: value})
        return out

    def branches(self, value, ignore=None):
        ignore = ignore or {}
        raw = self._raw(value)
        kept = []
        for b in raw:
            if any(norm(k) in ignore and ignore[norm(k)] is not None and ignore[norm(k)] != v
                   for k, v in b.items()):
                continue
            filtered = {k: v for k, v in b.items() if norm(k) not in ignore}
            if filtered not in kept:
                kept.append(filtered)
        dropped = sorted({k for b in raw for k in b if norm(k) in ignore})
        return kept, dropped


class Netlist:
    def __init__(self):
        self.drivers = {}

    def driver_for(self, net):
        return self.drivers.get(net)


# --------------------------------------------------------------------------
# Verilog parsing
# --------------------------------------------------------------------------

INSTANCE_COMMENT_RE = re.compile(r"^\s*//\s*(\S+)\s+(sky130_\S+)")
ASSIGN_RE = re.compile(r"assign\s+(.+?)\s*=\s*(.+?);", re.DOTALL)
ALWAYS_RE = re.compile(
    r"always\s*@\s*\(\s*posedge\s+(\S+)"
    r"(?:\s+or\s+negedge\s+(\S+))?\s*\)\s*begin(.*?)end",
    re.DOTALL,
)


def load_netlist(path):
    lines = open(path, "r").read().splitlines(keepends=True)
    nl = Netlist()
    pending_instance = None
    idx, n = 0, len(lines)

    while idx < n:
        line = lines[idx]

        m = INSTANCE_COMMENT_RE.match(line)
        if m:
            pending_instance = (m.group(1), m.group(2))
            idx += 1
            continue

        if "assign" in line:
            stmt = line
            while ";" not in stmt:
                idx += 1
                stmt += lines[idx]
            am = ASSIGN_RE.search(stmt)
            if am:
                lhs = clean_signal(am.group(1).strip())
                try:
                    expr = parse_expr(am.group(2))
                    inst_name, cell = pending_instance or ("?", "?")
                    nl.drivers[lhs] = CombDriver(lhs, inst_name, cell, expr)
                except Exception as e:
                    print(f"[warn] skipping {lhs}: could not parse ({e})")
                    print(f"        RHS: {am.group(2).strip()}")
            pending_instance = None
            idx += 1
            continue

        if "always" in line:
            stmt = line
            while "end" not in stmt:
                idx += 1
                stmt += lines[idx]
            try:
                handle_always(stmt, pending_instance, nl)
            except Exception as e:
                print(f"[warn] skipping always block near instance {pending_instance}: {e}")
            pending_instance = None
            idx += 1
            continue

        idx += 1

    return nl


def handle_always(stmt, pending_instance, nl):
    m = ALWAYS_RE.search(stmt)
    if not m:
        return
    clk_raw, reset_sig_raw, body = m.group(1), m.group(2), m.group(3)
    clk = clean_signal(clk_raw)
    inst_name, cell = pending_instance or ("?", "?")

    if reset_sig_raw is None:
        mm = re.search(r"(\S+)\s*<=\s*(\S+?)\s*;", body)
        if not mm:
            return
        q, d = clean_signal(mm.group(1)), clean_signal(mm.group(2))
        nl.drivers[q] = FFDriver(q, inst_name, cell, clk, d)
        return

    reset_sig = clean_signal(reset_sig_raw)
    reset_branch = re.search(
        r"if\s*\(\s*(!?)\s*" + re.escape(reset_sig_raw) +
        r"\s*\)\s*(\S+)\s*<=\s*1'b([01])\s*;", body)
    else_branch = re.search(r"else\s*(\S+)\s*<=\s*(\S+?)\s*;", body)
    if not (reset_branch and else_branch):
        return

    active_low = reset_branch.group(1) == "!"
    q = clean_signal(reset_branch.group(2))
    reset_value = int(reset_branch.group(3))
    d = clean_signal(else_branch.group(2))

    nl.drivers[q] = FFDriver(
        q, inst_name, cell, clk, d,
        reset_signal=reset_sig,
        reset_active_low=active_low,
        reset_value=reset_value,
    )