#!/usr/bin/env python3
"""
Builds a net -> (driver, loads) graph so we can trace signals
without manually grepping the .cir file every time.
"""

import sys
from collections import defaultdict

# Known SKY130 standard-cell output pin names, by convention.
# Anything not the output is treated as an input for our purposes.
OUTPUT_PIN_NAMES = {"X", "Y", "Q", "COUT", "SUM"}


def parse_subckt_defs(lines):
    """Return dict: cell_type -> list of pin names (in order), excluding
    the trailing implicit substrate/global node."""
    defs = {}
    for line in lines:
        if line.startswith(".SUBCKT"):
            parts = line.split()
            # parts[0] = ".SUBCKT", parts[1] = cell name, rest = pins
            cell_type = parts[1]
            pins = parts[2:]
            defs[cell_type] = pins
    return defs


def parse_instances(lines):
    """Return list of (instance_name, nets, cell_type)."""
    instances = []
    i = 0
    n = len(lines)
    while i < n:
        line = lines[i]
        if line.startswith("X$") or line.startswith("X"):
            full = line
            # Handle continuation lines starting with '+'
            j = i + 1
            while j < n and lines[j].startswith("+"):
                full += " " + lines[j][1:].strip()
                j += 1
            tokens = full.split()
            inst_name = tokens[0]
            rest = tokens[1:]
            cell_type = rest[-1]
            nets = rest[:-1]
            instances.append((inst_name, nets, cell_type))
            i = j
        else:
            i += 1
    return instances


def unescape(net):
    return net.replace("\\$", "$")


class Netlist:
    def __init__(self, path):
        with open(path) as f:
            raw_lines = [l.rstrip("\n") for l in f]
        # Strip comments/blank lines for subckt/instance scanning
        lines = [l for l in raw_lines if l and not l.startswith("*")]

        self.subckt_defs = parse_subckt_defs(lines)
        self.instances = parse_instances(lines)

        # net -> list of (inst_name, cell_type, pin_name)
        self.drivers = defaultdict(list)
        self.loads = defaultdict(list)

        for inst_name, nets, cell_type in self.instances:
            pins = self.subckt_defs.get(cell_type)
            if pins is None or len(pins) != len(nets):
                # Unknown/mismatched cell type (e.g. via/tap pseudo-devices) - skip pin naming
                for net in nets:
                    net = unescape(net)
                    self.loads[net].append((inst_name, cell_type, "?"))
                continue
            for pin_name, net in zip(pins, nets):
                net = unescape(net)
                if pin_name in OUTPUT_PIN_NAMES:
                    self.drivers[net].append((inst_name, cell_type, pin_name))
                else:
                    self.loads[net].append((inst_name, cell_type, pin_name))

    def get_inst_pins(self, inst_name):
        """Return (cell_type, dict pin_name->net) for a given instance."""
        for name, nets, cell_type in self.instances:
            if name == inst_name:
                pins = self.subckt_defs.get(cell_type, [])
                if len(pins) == len(nets):
                    return cell_type, dict(zip(pins, [unescape(n) for n in nets]))
                return cell_type, {"?": [unescape(n) for n in nets]}
        return None, None

    def explain_net(self, net):
        print(f"=== Net: {net} ===")
        print("Driven by:")
        for inst_name, cell_type, pin_name in self.drivers.get(net, []):
            _, pinmap = self.get_inst_pins(inst_name)
            print(f"  {inst_name} ({cell_type}) pin {pin_name}")
            for p, n in pinmap.items():
                print(f"      {p} = {n}")
        print("Loads (consumed by):")
        for inst_name, cell_type, pin_name in self.loads.get(net, []):
            print(f"  {inst_name} ({cell_type}) pin {pin_name}")

    def trace_back(self, net, depth=3, _seen=None, _indent=0):
        """Recursively print the fan-in logic tree driving `net`."""
        if _seen is None:
            _seen = set()
        prefix = "  " * _indent
        if net in _seen:
            print(f"{prefix}{net}  (already shown above)")
            return
        _seen.add(net)

        drivers = self.drivers.get(net, [])
        if not drivers:
            print(f"{prefix}{net}  [no driver found - likely a top-level input/pad]")
            return

        for inst_name, cell_type, pin_name in drivers:
            _, pinmap = self.get_inst_pins(inst_name)
            input_pins = {p: n for p, n in pinmap.items()
                          if p not in OUTPUT_PIN_NAMES
                          and n not in ("VPWR", "VGND")}
            print(f"{prefix}{net} = {inst_name} ({cell_type})  inputs: {input_pins}")
            if _indent < depth:
                for p, n in input_pins.items():
                    self.trace_back(n, depth=depth, _seen=_seen, _indent=_indent + 1)

    def find_dependents_of(self, target_net, cell_type_filter="dfrtp_2"):
        """Find all instances of `cell_type_filter` whose D-input net,
        when traced back one level, directly consumes `target_net`."""
        results = []
        for inst_name, nets, cell_type in self.instances:
            if cell_type_filter not in cell_type:
                continue
            _, pinmap = self.get_inst_pins(inst_name)
            d_net = pinmap.get("D")
            if d_net is None:
                continue
            for drv_inst, drv_type, drv_pin in self.drivers.get(d_net, []):
                _, drv_pinmap = self.get_inst_pins(drv_inst)
                if target_net in drv_pinmap.values():
                    results.append((inst_name, d_net, drv_inst, drv_type))
        return results

    def trace_forward(self, net, depth=4, _seen=None, _indent=0):
        """Recursively print what consumes `net` going forward through logic."""
        if _seen is None:
            _seen = set()
        prefix = "  " * _indent
        if net in _seen:
            print(f"{prefix}{net}  (already shown above)")
            return
        _seen.add(net)
        loads = self.loads.get(net, [])
        if not loads:
            print(f"{prefix}{net}  [no loads - dead end or top-level output]")
            return
        for inst_name, cell_type, pin_name in loads:
            if "VIA" in cell_type or "TAP" in cell_type.upper():
                continue
            _, pinmap = self.get_inst_pins(inst_name)
            out_pins = {p: n for p, n in pinmap.items() if p in OUTPUT_PIN_NAMES}
            print(f"{prefix}{net} -> {inst_name} ({cell_type}) pin {pin_name}, outputs: {out_pins}")
            if _indent < depth:
                for p, n in out_pins.items():
                    self.trace_forward(n, depth=depth, _seen=_seen, _indent=_indent + 1)

    def find_flops(self, cell_types=("dfrtp_2", "dfstp_2", "dfxtp_2")):
        """Return dict: flop_inst -> {'Q': net, 'D_inputs': set(nets feeding D-logic)}"""
        flops = {}
        for inst_name, nets, cell_type in self.instances:
            if not any(ct in cell_type for ct in cell_types):
                continue
            _, pinmap = self.get_inst_pins(inst_name)
            q_net = pinmap.get("Q")
            d_net = pinmap.get("D")
            if q_net is None or d_net is None:
                continue
            d_inputs = set()
            for drv_inst, drv_type, drv_pin in self.drivers.get(d_net, []):
                _, drv_pinmap = self.get_inst_pins(drv_inst)
                for p, n in drv_pinmap.items():
                    if p not in OUTPUT_PIN_NAMES and n not in ("VPWR", "VGND"):
                        d_inputs.add(n)
            flops[inst_name] = {"Q": q_net, "D_inputs": d_inputs}
        return flops

    def build_shift_chain(self, seed="I"):
        """BFS forward from `seed`, following any flop whose D-logic
        depends on the current net, chaining via each flop's Q."""
        flops = self.find_flops()
        chain = []
        visited_flops = set()
        frontier = {seed}
        step = 0
        while frontier and step < 200:
            next_frontier = set()
            found_this_round = []
            for inst_name, info in flops.items():
                if inst_name in visited_flops:
                    continue
                if frontier & info["D_inputs"]:
                    found_this_round.append((inst_name, info["Q"]))
                    visited_flops.add(inst_name)
                    next_frontier.add(info["Q"])
            if found_this_round:
                chain.append((step, found_this_round))
            frontier = next_frontier
            step += 1
        return chain

    def find_all_chains(self):
        """Build Q->D adjacency across ALL flops, then split into strictly
        linear chains (branch/merge points end a chain)."""
        flops = self.find_flops()

        # Map Q-net -> flop instance (each Q should be unique)
        q_to_flop = {info["Q"]: inst for inst, info in flops.items()}

        # successors[A] = list of flops B where B's D depends on A's Q
        successors = defaultdict(list)
        predecessors = defaultdict(list)
        for inst, info in flops.items():
            for d_input in info["D_inputs"]:
                if d_input in q_to_flop:
                    src_flop = q_to_flop[d_input]
                    if src_flop != inst:  # ignore self-loops (holding latches)
                        successors[src_flop].append(inst)
                        predecessors[inst].append(src_flop)

        # A flop starts a new chain if it has 0 or >1 predecessors
        chain_starts = [inst for inst in flops
                         if len(predecessors[inst]) != 1]

        chains = []
        visited = set()
        for start in chain_starts:
            if start in visited:
                continue
            chain = [start]
            visited.add(start)
            current = start
            # Extend forward only while exactly one successor,
            # and that successor has exactly one predecessor (us).
            while len(successors[current]) == 1:
                nxt = successors[current][0]
                if len(predecessors[nxt]) != 1 or nxt in visited:
                    break
                chain.append(nxt)
                visited.add(nxt)
                current = nxt
            chains.append(chain)

        # Anything left over (pure self-loop latches with no fwd/back links)
        for inst in flops:
            if inst not in visited:
                chains.append([inst])
                visited.add(inst)

        return chains, flops


    def print_chain_summary(self):
        chains, flops = self.find_all_chains()
        chains.sort(key=len, reverse=True)
        for chain in chains:
            q_first = flops[chain[0]]["Q"]
            q_last = flops[chain[-1]]["Q"]
            print(f"Length {len(chain)}: {chain[0]}(Q={q_first}) -> ... -> {chain[-1]}(Q={q_last})")

    def order_by_carry_chain(self, exclude_qs=None):
        """Topologically layer flops by longest path from a root (no
        predecessors), which should correspond to bit position in a
        ripple-carry structure. exclude_qs: set of Q nets to ignore
        (e.g. the already-identified shift register and flag latches)."""
        if exclude_qs is None:
            exclude_qs = set()

        flops = self.find_flops()
        q_to_flop = {info["Q"]: inst for inst, info in flops.items()
                     if info["Q"] not in exclude_qs}

        successors = defaultdict(set)
        predecessors = defaultdict(set)
        for inst, info in flops.items():
            if info["Q"] in exclude_qs:
                continue
            for d_input in info["D_inputs"]:
                src_flop = q_to_flop.get(d_input)
                if src_flop and src_flop != inst:
                    successors[src_flop].add(inst)
                    predecessors[inst].add(src_flop)

        cluster = set(q_to_flop.values())
        layer = {}
        # Roots: no predecessors within the cluster
        frontier = [inst for inst in cluster if not predecessors[inst]]
        for inst in frontier:
            layer[inst] = 0

        changed = True
        while changed:
            changed = False
            for inst in cluster:
                preds = predecessors[inst]
                if not preds:
                    continue
                pred_layers = [layer[p] for p in preds if p in layer]
                if len(pred_layers) == len(preds):
                    new_layer = max(pred_layers) + 1
                    if layer.get(inst) != new_layer:
                        layer[inst] = new_layer
                        changed = True

        by_layer = defaultdict(list)
        for inst, l in layer.items():
            by_layer[l].append(inst)
        unassigned = cluster - set(layer.keys())

        for l in sorted(by_layer):
            print(f"Layer {l}:")
            for inst in by_layer[l]:
                print(f"    {inst}  Q={flops[inst]['Q']}  D_inputs={flops[inst]['D_inputs']}")
        if unassigned:
            print(f"Unassigned (cyclic or missing pred data): {len(unassigned)}")
            for inst in unassigned:
                print(f"    {inst}  Q={flops[inst]['Q']}  D_inputs={flops[inst]['D_inputs']}")


if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else "puzzle.cir"
    net = sys.argv[2] if len(sys.argv) > 2 else None
    nl = Netlist(path)
    print(f"Parsed {len(nl.instances)} instances, {len(nl.subckt_defs)} cell types.")
    if net == "find_I":
        results = nl.find_dependents_of("I")
        for inst_name, d_net, drv_inst, drv_type in results:
            print(f"{inst_name}: D={d_net}  <-  {drv_inst} ({drv_type})")
    elif net == "chain_I":
        chain = nl.build_shift_chain("I")
        for step, flops_found in chain:
            print(f"Step {step}:")
            for inst_name, q_net in flops_found:
                print(f"    {inst_name}  Q={q_net}")
    elif net == "chains":
        nl.print_chain_summary()
    elif net == "carry":
        shift_chain_qs = {q for _, group in nl.build_shift_chain("I") for _, q in group}
        known_qs = {
            "$2265", "$689",                    # flag latches
            "$340", "$27", "$425", "$864",      # primary counter
            "$417", "$416", "$418",             # secondary counter
            "$347", "$3159", "success",         # state/terminal latches
            "$3813", "$3981",                   # output-gate + twin latch
        }
        nl.order_by_carry_chain(exclude_qs=shift_chain_qs | known_qs)
    elif net and net.startswith("fwd:"):
        nl.trace_forward(net[4:], depth=4)
    elif net:
        nl.trace_back(net, depth=6)
