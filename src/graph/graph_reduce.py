import json
import argparse
import networkx as nx

# ─────────────────────────────────────────────
# STEP 0: tree JSON -> flat nodes/edges
# ─────────────────────────────────────────────

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


def build_networkx(graph_json):
    G = nx.DiGraph()
    for n in graph_json["nodes"]:
        G.add_node(n["id"], **n)
    for e in graph_json["edges"]:
        G.add_edge(e["source"], e["target"])
    return G


# ─────────────────────────────────────────────
# STEP 1: collapse comb-logic chains into register-to-register edges
# ─────────────────────────────────────────────

SEQUENTIAL_KINDS = {"flipflop", "input", "clock", "reset"}

def collapse_to_register_graph(G):
    RG = nx.DiGraph()
    for n, data in G.nodes(data=True):
        if data.get("kind") in SEQUENTIAL_KINDS:
            RG.add_node(n, **data)

    for n, data in G.nodes(data=True):
        if data.get("kind") not in SEQUENTIAL_KINDS:
            continue
        stack = [(m, [n]) for m in G.successors(n)]
        while stack:
            m, path = stack.pop()
            m_data = G.nodes[m]
            new_path = path + [m]
            if m_data.get("kind") in SEQUENTIAL_KINDS:
                via = new_path[1:-1]
                if RG.has_edge(n, m):
                    RG[n][m]["via"].append(via)
                else:
                    RG.add_edge(n, m, via=[via])
            else:
                stack.extend((k, new_path) for k in G.successors(m))
    return RG


# ─────────────────────────────────────────────
# STEP 2: fold clock/reset out of the graph structure
# ─────────────────────────────────────────────

def fold_clock_reset(RG):
    clocks = [n for n, d in RG.nodes(data=True) if d.get("kind") == "clock"]
    resets = [n for n, d in RG.nodes(data=True) if d.get("kind") == "reset"]

    print(f"Distinct clocks: {clocks}")
    print(f"Distinct resets: {resets}")

    RG = RG.copy()
    if len(clocks) <= 1 and len(resets) <= 1:
        for n in clocks + resets:
            RG.remove_node(n)
    else:
        print("Multiple clock/reset domains found — keeping them as graph "
              "structure, since that's likely relevant, not noise.")
    return RG


# ─────────────────────────────────────────────
# STEP 3: prune to only what feeds the target
# ─────────────────────────────────────────────

def prune_to_ancestors(RG, target="success"):
    keep = nx.ancestors(RG, target) | {target}
    return RG.subgraph(keep).copy()


# ─────────────────────────────────────────────
# STEP 4: transitive reduction, tolerant of feedback loops
# ─────────────────────────────────────────────

def transitive_reduce_safe(RG):
    condensation = nx.condensation(RG)
    reduced = nx.transitive_reduction(condensation)

    sccs = [condensation.nodes[n]["members"] for n in condensation.nodes]
    loops = [s for s in sccs if len(s) > 1]
    print(f"Found {len(loops)} feedback loop(s), sizes: {[len(s) for s in loops]}")

    return reduced, condensation


# ─────────────────────────────────────────────
# QUERY HELPERS
# ─────────────────────────────────────────────

def inputs_reaching(RG, target="success"):
    return sorted(
        n for n in nx.ancestors(RG, target)
        if RG.nodes[n].get("kind") in ("input", "clock", "reset")
    )


def explain_path(RG, source, target="success"):
    reg_path = nx.shortest_path(RG, source=source, target=target)
    print(" -> ".join(reg_path))
    for a, b in zip(reg_path, reg_path[1:]):
        for chain in RG[a][b]["via"]:
            label = " -> ".join(chain) if chain else "(direct)"
            print(f"    {a} --[{label}]--> {b}")


# ─────────────────────────────────────────────
# OUTPUT — condensed graph, preserving name/kind per node
# ─────────────────────────────────────────────

def save_condensed_graph_json(reduced_dag, condensation, RG, path):
    """Serialise the condensed + transitively-reduced graph. Nodes are
    frozensets of merged register names (from feedback loops), flattened
    into a stable id/label/name, with 'kind' preserved — single value
    when every merged register shares the same kind, 'mixed' otherwise
    (with per-member kinds kept in 'merged_kinds' either way)."""

    def node_id(scc_frozenset):
        return "+".join(sorted(scc_frozenset))

    nodes_out = []
    for n in reduced_dag.nodes():
        members = condensation.nodes[n]["members"]
        kinds = {RG.nodes[m].get("kind") for m in members}
        name = node_id(members)
        kind = kinds.pop() if len(kinds) == 1 else "mixed"

        nodes_out.append({
            "id": name,
            "label": name,
            "name": name,
            "kind": kind,
            "merged_from": sorted(members),
            "merged_kinds": {m: RG.nodes[m].get("kind") for m in members},
        })

    edges_out = []
    for u, v in reduced_dag.edges():
        u_members = condensation.nodes[u]["members"]
        v_members = condensation.nodes[v]["members"]
        via = []
        for a in u_members:
            for b in v_members:
                if RG.has_edge(a, b):
                    via.extend(RG[a][b].get("via", []))
        edges_out.append({
            "source": node_id(u_members),
            "target": node_id(v_members),
            "via": via,
        })

    with open(path, "w", encoding="utf-8") as f:
        json.dump({"nodes": nodes_out, "edges": edges_out}, f, indent=2)


# ─────────────────────────────────────────────
# RUN IT
# ─────────────────────────────────────────────

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Reduce a verilog netlist tree JSON into a "
                     "condensed register-level dependency graph."
    )
    parser.add_argument(
        "-i", "--input", required=True,
        help="Path to the input tree JSON file (nested 'children' format).",
    )
    parser.add_argument(
        "-o", "--output", required=True,
        help="Path to write the reduced/condensed nodes/edges JSON to.",
    )
    parser.add_argument(
        "-t", "--target", default="success",
        help="Signal to reduce/trace back from (default: success).",
    )
    args = parser.parse_args()

    with open(args.input, encoding="utf-8") as f:
        tree = json.load(f)

    graph_json = tree_to_graph(tree)
    G = build_networkx(graph_json)
    print(f"Full gate graph:        {G.number_of_nodes()} nodes, {G.number_of_edges()} edges")

    RG = collapse_to_register_graph(G)
    print(f"Register graph:         {RG.number_of_nodes()} nodes, {RG.number_of_edges()} edges")

    RG = fold_clock_reset(RG)
    print(f"After folding clk/rst:  {RG.number_of_nodes()} nodes, {RG.number_of_edges()} edges")

    RG = prune_to_ancestors(RG, args.target)
    print(f"After pruning to '{args.target}' ancestors: {RG.number_of_nodes()} nodes, {RG.number_of_edges()} edges")

    reduced_dag, condensation = transitive_reduce_safe(RG)
    print(f"Condensed + transitively reduced DAG: "
          f"{reduced_dag.number_of_nodes()} nodes, {reduced_dag.number_of_edges()} edges")

    save_condensed_graph_json(reduced_dag, condensation, RG, args.output)

    print(f"\nInputs/clocks/resets reaching {args.target}:")
    print(inputs_reaching(RG, args.target))