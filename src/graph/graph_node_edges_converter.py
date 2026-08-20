import json
import argparse


def tree_to_graph(root, include_clock_reset=True):
    nodes = {}
    edges = set()

    def ensure_input_node(name, kind):
        if name not in nodes:
            nodes[name] = {"id": name, "label": name, "name": name, "kind": kind}

    def add_or_merge_node(n):
        name = n["name"]
        kind = n.get("kind")

        if kind == "cycle":
            return

        attrs = {"id": name, "label": name, "name": name, "kind": kind}
        for key in ("expression", "clock", "reset", "reset_value", "gate_type"):
            if n.get(key) is not None:
                attrs[key] = n[key]

        existing = nodes.get(name)
        if existing is None:
            nodes[name] = attrs
        else:
            for k, v in attrs.items():
                existing.setdefault(k, v)

        if include_clock_reset and kind == "flipflop":
            if n.get("clock"):
                ensure_input_node(n["clock"], "clock")
                edges.add((n["clock"], name))
            if n.get("reset"):
                ensure_input_node(n["reset"], "reset")
                edges.add((n["reset"], name))

    def walk(n, parent_name=None):
        name = n["name"]
        kind = n.get("kind")

        add_or_merge_node(n)

        if parent_name is not None:
            edges.add((name, parent_name))

        if kind == "cycle":
            return

        for child in n.get("children", []):
            walk(child, parent_name=name)

    walk(root)

    return {
        "nodes": list(nodes.values()),
        "edges": [{"source": s, "target": t} for s, t in edges],
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Convert a verilog netlist tree JSON into a "
                     "flat nodes/edges dependency graph."
    )
    parser.add_argument(
        "-i", "--input", required=True,
        help="Path to the input tree JSON file (nested 'children' format).",
    )
    parser.add_argument(
        "-o", "--output", required=True,
        help="Path to write the flat nodes/edges JSON to.",
    )
    args = parser.parse_args()

    with open(args.input, encoding="utf-8") as f:
        tree = json.load(f)

    graph = tree_to_graph(tree)

    with open(args.output, "w", encoding="utf-8") as f:
        json.dump(graph, f, indent=2)

    print(f"{len(graph['nodes'])} nodes, {len(graph['edges'])} edges")