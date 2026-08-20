#!/usr/bin/env python3
"""
Convert the LVS-extracted SPICE netlist (extracted_puzzle.cir) into a
structural Verilog netlist for gate-level simulation with Icarus Verilog.
"""

import sys


def sanitize(net):
    """Turn a SPICE net name into a valid Verilog identifier."""
    net = net.replace("\\$", "$")
    if net in ("VPWR", "VGND"):
        return net
    if net.startswith("$"):
        net = "n_" + net[1:]
    # Avoid ambiguity with Verilog vector bit-select syntax
    net = net.replace("[", "_").replace("]", "")
    return net

def parse_subckt_defs(lines):
    defs = {}
    i, n = 0, len(lines)
    while i < n:
        line = lines[i]
        if line.startswith(".SUBCKT"):
            full = line
            j = i + 1
            while j < n and lines[j].startswith("+"):
                full += " " + lines[j][1:].strip()
                j += 1
            parts = full.split()
            cell_type = parts[1]
            pins = parts[2:]
            defs[cell_type] = pins
            i = j
        else:
            i += 1
    return defs


def parse_instances(lines):
    instances = []
    i, n = 0, len(lines)
    while i < n:
        line = lines[i]
        if line.startswith("X$") or line.startswith("X"):
            full = line
            j = i + 1
            while j < n and lines[j].startswith("+"):
                full += " " + lines[j][1:].strip()
                j += 1
            tokens = full.split()
            inst_name = tokens[0].replace("$", "_")
            rest = tokens[1:]
            cell_type = rest[-1]
            nets = rest[:-1]
            instances.append((inst_name, nets, cell_type))
            i = j
        else:
            i += 1
    return instances


def main():
    cir_path = sys.argv[1]
    out_path = sys.argv[2]

    with open(cir_path) as f:
        raw_lines = [l.rstrip("\n") for l in f]
    lines = [l for l in raw_lines if l and not l.startswith("*")]

    subckt_defs = parse_subckt_defs(lines)
    instances = parse_instances(lines)

    all_nets = set()
    verilog_instances = []
    skipped_types = set()

    for inst_name, nets, cell_type in instances:
        if not cell_type.startswith("sky130_fd_sc_hd__"):
            skipped_types.add(cell_type)
            continue
        pins = subckt_defs.get(cell_type)
        if pins is None or len(pins) != len(nets):
            print(f"WARNING: pin count mismatch for {inst_name} ({cell_type}), skipping")
            continue

        conns = []
        for pin_name, net in zip(pins, nets):
            clean_pin = pin_name.split("|")[0]
            if clean_pin.startswith("$") or clean_pin.startswith("\\$"):
                continue  # anonymous/parasitic pin - not a real logical port
            if clean_pin in ("VPB", "VNB", "sky130_gnd", "VPWR", "VGND"):
                continue  # supply nets are implicit in the behavioral models, not real ports
            net_v = sanitize(net)
            all_nets.add(net_v)
            conns.append(f".{clean_pin}({net_v})")

        verilog_instances.append(
            f"    {cell_type} {inst_name} (\n        " +
            ",\n        ".join(conns) +
            "\n    );"
        )

    top_ports = {"clk", "rst_n", "enable", "I", "success"}
    top_ports |= {f"n_O_{i}_" if False else f"O_{i}" for i in range(8)}
    # O[n] nets are literally named "O[0]".."O[7]" in the .cir - sanitize brackets
    o_nets = [f"O[{i}]".replace("[", "_").replace("]", "") for i in range(8)]

    top_level_port_names = {"clk", "rst_n", "enable", "I", "success"}
    decls = []
    for net in sorted(all_nets):
        if net in ("VPWR", "VGND") or net in top_level_port_names:
            continue
        decls.append(f"    wire {net};")

    with open(out_path, "w") as f:
        f.write("// Auto-generated structural netlist from extracted_puzzle.cir\n")
        f.write("`default_nettype none\n\n")
        f.write("module puzzle_gl (\n")
        f.write("    input clk,\n")
        f.write("    input rst_n,\n")
        f.write("    input enable,\n")
        f.write("    input I,\n")
        f.write("    output success,\n")
        f.write("    output [7:0] O\n")
        f.write(");\n\n")
        f.write("    supply1 VPWR;\n    supply0 VGND;\n\n")
        f.write("\n".join(decls) + "\n\n")
        for i in range(8):
            f.write(f"    assign O[{i}] = O_{i};\n")
        f.write("\n")
        f.write("\n\n".join(verilog_instances))
        f.write("\n\nendmodule\n")

    print(f"Wrote {len(verilog_instances)} instances, {len(all_nets)} nets to {out_path}")
    print(f"Skipped non-logic cell types: {skipped_types}")


if __name__ == "__main__":
    main()
