#!/usr/bin/env python3
import re
import sys
from pathlib import Path


def process_file(input_path: str, output_path: str) -> None:
    seen = set()
    out_lines = []

    with open(input_path, "r", encoding="utf-8", errors="replace") as f:
        for line in f:
            original = line.rstrip("\n")

            if original.startswith("WARNING"):
                # Remove trailing " ( ... )" part (including parentheses contents)
                final_line = re.sub(r"\s*\([^)]*\)\s*$", "", original)
            else:
                final_line = original

            # Remove duplicated entries (keep first occurrence)
            if final_line not in seen:
                seen.add(final_line)
                out_lines.append(final_line)

    Path(output_path).write_text(
        "\n".join(out_lines) + ("\n" if out_lines else ""),
        encoding="utf-8"
    )


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} INPUT_FILE OUTPUT_FILE")
        sys.exit(1)

    process_file(sys.argv[1], sys.argv[2])
