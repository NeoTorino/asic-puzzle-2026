#!/usr/bin/env python3
"""
trace.py - backward logic tracer for a sky130 gate-level Verilog netlist.

Usage:
    python3 trace.py NODE_NAME --value 1 --depth 2 [--netlist top.v]

Examples:
    python3 trace.py success --value 1 --depth 2
    python3 trace.py '$148' --value 0 --depth 3
"""
import argparse
from trace_utils import load_netlist, norm


def eval_expr(node, env):
    from trace_utils import Var, Const, Not, And, Or, Xor
    if isinstance(node, Var):
        return env[node.name]
    if isinstance(node, Const):
        return node.value
    if isinstance(node, Not):
        return 1 - eval_expr(node.arg, env)
    if isinstance(node, And):
        return int(all(eval_expr(a, env) for a in node.args))
    if isinstance(node, Or):
        return int(any(eval_expr(a, env) for a in node.args))
    if isinstance(node, Xor):
        v = 0
        for a in node.args:
            v ^= eval_expr(a, env)
        return v
    raise TypeError(type(node))


def parse_ignore_spec(raw):
    raw = raw.strip()
    if len(raw) >= 2 and raw[0] == raw[-1] and raw[0] in ("'", '"'):
        raw = raw[1:-1]
    if "=" in raw:
        net, val = raw.split("=", 1)
        return net.strip(), int(val.strip())
    return raw.strip(), None


def trace(nl, net, value, depth, ignore=None, indent=0, seen=None):
    ignore = ignore or {}
    seen = seen or set()
    pad = "  " * indent

    driver = nl.driver_for(net)
    if driver is None:
        print(f"{pad}{net} = {value}   [leaf: primary input / unconnected]")
        return

    key = (net, value)
    if key in seen:
        print(f"{pad}{net} = {value}   [already expanded above, skipping]")
        return
    seen = seen | {key}

    print(f"{pad}{net} = {value}   <- {driver.describe()}")

    if depth <= 0:
        print(f"{pad}  ... (depth limit reached)")
        return

    results, dropped = driver.branches(value, ignore)

    if not results:
        print(f"{pad}  UNSATISFIABLE: no combination of the remaining inputs "
              f"guarantees {net}={value} given the --ignore constraints")
        return

    if dropped:
        desc = [f"{d}={ignore[norm(d)]}" if ignore.get(norm(d)) is not None else d
                for d in dropped]
        print(f"{pad}  (ignoring: {', '.join(desc)})")

    total = len(results)
    for i, assignment in enumerate(results, 1):
        tag = "requires" if total == 1 else f"branch {i}/{total}"
        print(f"{pad}  [{tag}] {assignment}")
        for sig, val in assignment.items():
            trace(nl, sig, val, depth - 1, ignore, indent + 2, seen)


def main():
    ap = argparse.ArgumentParser(
        description="Trace backward through a sky130 gate-level netlist to "
                     "find what makes a node take a given value."
    )
    ap.add_argument("node", help='Net name, e.g. "success" or "$148"')
    ap.add_argument("--value", type=int, choices=[0, 1], default=1)
    ap.add_argument("--depth", type=int, default=2)
    ap.add_argument("--netlist", default="puzzle_logic.v")
    ap.add_argument("--ignore", action="append", default=[],
                        help='Net to ignore/collapse in branches, e.g. --ignore success '
                        '--ignore "$4255". Repeatable.')
    ap.add_argument("--ignore-file",
                        help="File with one net name per line to ignore (# comments allowed)")
    args = ap.parse_args()

    nl = load_netlist(args.netlist)

    node = args.node
    if node not in nl.drivers and ("$" + node.lstrip("$")) in nl.drivers:
        node = "$" + node.lstrip("$")

    ignore = {}
    for raw in args.ignore:
        n, v = parse_ignore_spec(raw)
        ignore[norm(n)] = v
    if args.ignore_file:
        with open(args.ignore_file, encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#"):
                    n, v = parse_ignore_spec(line)
                    ignore[norm(n)] = v

    trace(nl, node, args.value, args.depth, ignore=ignore)


if __name__ == "__main__":
    main()