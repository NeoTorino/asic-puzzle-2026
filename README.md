## Jane Street ASIC Puzzle 2026 — My Solution

Jane Street published an anonymised ASIC layout with all net and cell labels stripped out, along with sample inputs and outputs. The challenge was to derive the specific input that made a `success` signal go high.

The project was carried out on `FreeBSD 15.0`. `KLayout 0.30.10` was used to inspect the physical layout and extract a flat gate-level SPICE netlist of standard `SKY130` cells. The Metal-3 labels revealed the top-level pins, such as clk, rst_n, enable, I, O[7:0], and success. The 121-bit input length was derived from the shift-enable window (n933): shifting runs from cycle 1 ($t = 65,000\text{ ps}$) until the unlock condition (n3159=1) locks it at $t = 1,275,000\text{ ps}$, giving 121 active cycles, one input bit sampled per cycle.

Several custom Python scripts were created:

1. One Python script was created to convert the `SPICE netlist` into a `Verilog HDL` representation.

2. A second Python script was created to walk the netlist from any given gate outward, building a tree representation of a node and its upstream logic, used here starting from success, though the script works from any node.

3. An HTML page was created to visualise combinational logic, flip-flops, and multiplexers as a node graph, using the JS library Cytoscape. For this graphical representation, two additional Python scripts were created: one to visualise the entire mesh, and another to combine combinational logic to reduce the number of elements in the graph while maintaining the same structure.

4. Lastly, the Z3 SAT solver library was used in combination with custom Python scripts to represent the combinational logic gates, flip-flops, and multiplexers.

The state machine was modelled formally with the Z3 SAT solver, which computed the required 121-bit input sequence. If the wrong input was entered, the message `TRY AGAIN` could be seen on the output bus. If the correct 121-bit key was entered, the `success` signal asserted high, confirming the puzzle was solved.

The original puzzle included an `example_inputs.vcd` file that, when opened with a text editor, showed the following note:

`Leave no stone unturned! But for this file, consider looking at it in a waveform viewer instead.`

As suggested, opening the file in GTKWave allowed me to adjust the testbench to match the circuit's expected behaviour, including the number of cycles and the signals activated on the rising or falling edge of the clock.

A handful of tooling obstacles came up, but none of these blocked progress:

1. KLayout's Net Tracer misbehaved on FreeBSD due to a technology-file caching bug that wiped out layer connectivity rules; net naming was also non-deterministic, causing netlists to differ between operating systems (verified correct behaviour with Ubuntu 26.04).
2. A misconfigured `sky130_fd_sc_hd__clkbuf_4` cell with no output pin exposed in its extracted `.SUBCKT` definition.
3. An abandoned attempt to use the HAL reverse-engineering framework, as it did not compile on FreeBSD.

A private repository has been created on my GitHub account containing all relevant materials, including the SKY130 PDK, Python scripts, screenshots of command-line results, and the testbenches developed to solve the puzzle. The repository will be made public after the deadline; if you would like early access, please contact me by email.

### Solution

Input (121 bits, MSB (leftmost character) first):
```
00000001 01010000 10000000 00000101 01010000 00000000 00101000 00010000 01000000 10000010 10000100 00000100 00001001 00010100 00000
```

Output:

| Timestamp | Signal / Output | Binary   | Hex  | ASCII   | Success |
| --------- | ---------------- | -------- | ---- | ------- | ------- |
| 30000     | rst_n -> 1        | -        | -    | -       | -       |
| 40000     | enable -> 1       | -        | -    | -       | -       |
| 1250000   | enable -> 0       | -        | -    | -       | -       |
| 1260000   | s1 -> O           | 00101000 | 0x28 | (       | 1       |
| 1270000   | s1 -> O           | 00101010 | 0x2a | *       | 1       |
| 1280000   | s1 -> O           | 00100000 | 0x20 | *space* | 1       |
| 1290000   | s1 -> O           | 01010100 | 0x54 | T       | 1       |
| 1300000   | s1 -> O           | 01010111 | 0x57 | W       | 1       |
| 1310000   | s1 -> O           | 01001111 | 0x4f | O       | 1       |
| 1320000   | s1 -> O           | 00100000 | 0x20 | *space* | 1       |
| 1330000   | s1 -> O           | 01010011 | 0x53 | S       | 1       |
| 1340000   | s1 -> O           | 01010100 | 0x54 | T       | 1       |
| 1350000   | s1 -> O           | 01000001 | 0x41 | A       | 1       |
| 1360000   | s1 -> O           | 01010010 | 0x52 | R       | 1       |
| 1370000   | s1 -> O           | 01010011 | 0x53 | S       | 1       |
| 1380000   | s1 -> O           | 00100000 | 0x20 | *space* | 1       |
| 1390000   | s1 -> O           | 00101010 | 0x2a | *       | 1       |
| 1400000   | s1 -> O           | 00101001 | 0x29 | )       | 1       |
| 1410000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1420000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1430000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1440000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1450000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1460000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1470000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1480000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1490000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1500000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1510000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1520000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1530000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1540000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1550000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| 1560000   | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |
| -         | s1 -> O           | 00000000 | 0x00 | NUL     | 1       |

---