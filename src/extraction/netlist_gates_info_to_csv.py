import csv

INPUT_FILE = "../../netlist/puzzle_logic.v"
OUTPUT_FILE = "../../data/gates/gates.csv"

rows = []
max_pins = 0

with open(INPUT_FILE, "r", encoding="utf-8", errors="ignore") as f:
    lines = f.readlines()

i = 0

while i < len(lines):

    line = lines[i].strip()

    if line.startswith(".SUBCKT"):

        full_line = line

        # Append continuation lines starting with "+"
        j = i + 1

        while j < len(lines):
            nxt = lines[j].strip()

            if nxt.startswith("+"):
                full_line += " " + nxt[1:].strip()
                j += 1
            else:
                break

        parts = full_line.split()

        gate_name = parts[1]
        pins = parts[2:]

        rows.append([gate_name] + pins)

        max_pins = max(max_pins, len(pins))

        i = j

    else:
        i += 1

header = ["gate"] + [f"pin{i}" for i in range(1, max_pins + 1)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)

    writer.writerow(header)

    for row in rows:
        row += [""] * (len(header) - len(row))
        writer.writerow(row)

print(f"Extracted {len(rows)} gates.")