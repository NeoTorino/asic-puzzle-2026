#!/usr/bin/env python3
"""solve_multicycle.py — bounded-unrolling Z3 solver for serial-input puzzles."""

import argparse
import z3

from trace_utils import load_netlist, CombDriver, FFDriver
from solve import to_z3  # reuse your existing expression translator


def build_multicycle_solver(nl, io_bits, total_cycles, reset_cycles=3, idle_cycles=1):
    s = z3.Solver()
    zvars = {}

    def zvar(net, t):
        key = (net, t)
        if key not in zvars:
            zvars[key] = z3.Bool(f"{net}@{t}")
        return zvars[key]

    ff_nets = [n for n, d in nl.drivers.items() if isinstance(d, FFDriver)]
    comb_nets = [n for n, d in nl.drivers.items() if isinstance(d, CombDriver)]

    I_bits = [z3.Bool(f"I_bit_{k}") for k in range(io_bits)]

    pre = reset_cycles + idle_cycles      # cycles before real input starts
    full_cycles = pre + total_cycles

    for t in range(full_cycles):
        in_reset = t < reset_cycles
        io_t = t - pre                     # index into the real I/enable schedule

        s.add(zvar("rst_n", t) == z3.BoolVal(not in_reset))
        s.add(zvar("enable", t) ==
              z3.BoolVal((not in_reset) and (0 <= io_t < io_bits)))
        s.add(zvar("I", t) ==
              (I_bits[io_t] if (not in_reset and 0 <= io_t < io_bits) else z3.BoolVal(False)))

        for net in comb_nets:
            expr = nl.drivers[net].expr
            s.add(zvar(net, t) == to_z3(expr, lambda n, t=t: zvar(n, t)))

        for net in ff_nets:
            d = nl.drivers[net]
            q_next = zvar(net, t + 1)
            d_val = zvar(d.d_net, t)
            if d.reset_signal:
                rst = zvar(d.reset_signal, t)
                asserted = z3.Not(rst) if d.reset_active_low else rst
                s.add(q_next == z3.If(asserted, z3.BoolVal(bool(d.reset_value)), d_val))
            else:
                s.add(q_next == d_val)

    return s, zvars, I_bits, pre


def bits_to_hex(bitstring):
    # pad on the left so length is a multiple of 4 for clean hex
    padded = bitstring.rjust((len(bitstring) + 3) // 4 * 4, '0')
    return f"{int(padded, 2):0{len(padded)//4}x}"


def solve(nl, target, value, io_bits, settle_cycles, num_solutions):
    total_cycles = io_bits + settle_cycles
    s, zvars, I_bits, pre = build_multicycle_solver(nl, io_bits, total_cycles)

    def zvar(net, t):
        return zvars[(net, t)]

    s.add(z3.Or([zvar(target, t + pre) == bool(value)
                 for t in range(io_bits, total_cycles)]))

    found = 0
    while found < num_solutions:
        if s.check() != z3.sat:
            if found == 0:
                print(f"UNSATISFIABLE over {total_cycles} cycles "
                      f"({io_bits} input + {settle_cycles} settle). "
                      "Try increasing --settle-cycles.")
            else:
                print(f"\n(No further distinct solutions beyond the {found} found.)")
            return

        m = s.model()
        found += 1
        bitstring = ''.join(
            '1' if z3.is_true(m.eval(b, model_completion=True)) else '0'
            for b in I_bits
        )
        print(f"\n=== Solution {found} ===")
        print(f"  I sequence (MSB-first) : {bitstring}")
        print(f"  hex                    : 0x{bits_to_hex(bitstring)}")

        # block this exact 121-bit combination so the next iteration differs
        block = [b != m.eval(b, model_completion=True) for b in I_bits]
        s.add(z3.Or(block))

    print(f"\n(Reached requested --num-solutions {num_solutions}; "
          f"more may exist — increase the flag to see them.)")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("node")
    ap.add_argument("--value", type=int, choices=[0, 1], default=1)
    ap.add_argument("--netlist", default="top.v")
    ap.add_argument("--io-bits", type=int, default=121)
    ap.add_argument("--settle-cycles", type=int, default=10)
    ap.add_argument("--num-solutions", type=int, default=1)
    args = ap.parse_args()

    nl = load_netlist(args.netlist)
    solve(nl, args.node, args.value, args.io_bits, args.settle_cycles, args.num_solutions)


if __name__ == "__main__":
    main()