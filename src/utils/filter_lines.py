import sys

def filter_file(filename):
    skip_prefixes = ("//", "module", "endmodule", "reg", "wire", "assign", "always")

    counts = {prefix: 0 for prefix in skip_prefixes}
    counts["empty"] = 0

    found_matches = False

    with open(filename, "r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            stripped = line.strip()

            # Skip empty lines
            if not stripped:
                counts["empty"] += 1
                continue

            # Skip unwanted line types
            matched = False
            for prefix in skip_prefixes:
                if stripped.startswith(prefix):
                    counts[prefix] += 1
                    matched = True
                    break

            if matched:
                continue

            print(line.rstrip())
            found_matches = True

    if not found_matches:
        print("<no matches>")

    print("\nExcluded line counts:")
    for key, value in counts.items():
        print(f"{key}: {value}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <input_file>")
        sys.exit(1)

    filter_file(sys.argv[1])