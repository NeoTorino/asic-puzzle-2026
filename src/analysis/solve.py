#!/usr/bin/env python3
"""
solve.py - single-cycle consistency solver for a sky130 gate-level netlist.

Finds one assignment of primary inputs + flip-flop states that makes a
target net equal a target value, honouring every combinational constraint
in the design simultaneously (no per-branch guessing, no contradictions).

Usage:
    python3 solve.py success --value 1 --netlist puzzle_logic.v
    python3 solve.py success --value 1 --netlist puzzle_logic.v --num-solutions 3
    python3 solve.py success --value 1 --netlist puzzle_logic.v --full
"""

import argparse
import z3

from trace_utils import (
    load_netlist, leaves_of,
    CombDriver, FFDriver,
)
from z3encode import to_z3


def build_solver(nl):
    s = z3.Solver()
    zvars = {}

    def zvar(name):
        if name not in zvars:
            zvars[name] = z3.Bool(name)
        return zvars[name]

    ff_nets = set()
    primary_inputs = set()

    for net, driver in nl.drivers.items():
        if isinstance(driver, CombDriver):
            s.add(zvar(net) == to_z3(driver.expr, zvar))
        elif isinstance(driver, FFDriver):
            ff_nets.add(net)
            q = zvar(net)
            if driver.reset_signal:
                rst = zvar(driver.reset_signal)
                primary_inputs.add(driver.reset_signal)
                asserted = z3.Not(rst) if driver.reset_active_low else rst
                # When reset is asserted, Q is forced to reset_value.
                # When reset is deasserted, Q is unconstrained here (depends on
                # last cycle's D, which single-cycle mode doesn't model).
                s.add(z3.Implies(asserted, q == bool(driver.reset_value)))
            zvar(driver.d_net)

    # Anything referenced but never driven by an assign/always is a true
    # primary input (I, clk, enable, rst_n, or an unconnected net).
    driven = set(nl.drivers.keys())
    for driver in nl.drivers.values():
        if isinstance(driver, CombDriver):
            for leaf in leaves_of(driver.expr, set()):
                if leaf not in driven and leaf not in ("1'b0", "1'b1"):
                    zvar(leaf)
                    primary_inputs.add(leaf)
        elif isinstance(driver, FFDriver):
            if driver.d_net not in driven:
                zvar(driver.d_net)
                primary_inputs.add(driver.d_net)

    return s, zvars, ff_nets, primary_inputs


def solve(nl, target, value, num_solutions=1, show_full=False):
    s, zvars, ff_nets, primary_inputs = build_solver(nl)

    if target not in zvars:
        print(f"Error: net {target!r} never appears in the netlist "
              f"(check spelling / try with or without leading $).")
        return

    s.add(zvars[target] == bool(value))

    found = 0
    while found < num_solutions:
        if s.check() != z3.sat:
            if found == 0:
                print("UNSATISFIABLE: no consistent assignment makes "
                      f"{target} = {value}.")
            else:
                print(f"\n(No further distinct solutions beyond the {found} found.)")
            return

        model = s.model()
        found += 1
        print(f"\n=== Solution {found} ===")

        print("\n-- Primary inputs --")
        for name in sorted(primary_inputs):
            v = model.eval(zvars[name], model_completion=True)
            print(f"  {name} = {1 if z3.is_true(v) else 0}")

        print("\n-- Flip-flop states (this cycle) --")
        for name in sorted(ff_nets):
            v = model.eval(zvars[name], model_completion=True)
            print(f"  {name} = {1 if z3.is_true(v) else 0}")

        if show_full:
            print("\n-- All nets --")
            for name in sorted(zvars):
                v = model.eval(zvars[name], model_completion=True)
                print(f"  {name} = {1 if z3.is_true(v) else 0}")

        # Block this exact combination of primary inputs + FF states so the
        # next iteration is forced to find a genuinely different one.
        block_vars = primary_inputs | ff_nets
        block = []
        for name in block_vars:
            v = model.eval(zvars[name], model_completion=True)
            block.append(zvars[name] != v if not z3.is_true(v) else zvars[name] != v)
        # simpler/robust form:
        block = [zvars[name] != model.eval(zvars[name], model_completion=True)
                 for name in block_vars]
        s.add(z3.Or(block))

    print(f"\n(Reached requested --num-solutions {num_solutions}; "
          f"more may exist — increase the flag to see them.)")


def main():
    ap = argparse.ArgumentParser(
        description="Single-cycle Z3 solver: find primary-input/FF-state "
                     "assignments that make a target net take a given value."
    )
    ap.add_argument("node", help='Net name, e.g. "success" or "$148"')
    ap.add_argument("--value", type=int, choices=[0, 1], default=1)
    ap.add_argument("--netlist", default="top.v")
    ap.add_argument("--num-solutions", type=int, default=1,
                     help="How many distinct solutions to search for (default 1)")
    ap.add_argument("--full", action="store_true",
                     help="Also print every intermediate net's value")
    args = ap.parse_args()

    nl = load_netlist(args.netlist)

    node = args.node
    if node not in nl.drivers and node not in ("success",) \
            and ("$" + node.lstrip("$")) in nl.drivers:
        node = "$" + node.lstrip("$")

    solve(nl, node, args.value, args.num_solutions, args.full)


if __name__ == "__main__":
    main()