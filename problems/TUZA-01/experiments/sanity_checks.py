#!/usr/bin/env python3
"""Bounded, standard-library-only TUZA-01 sanity checks.

Run from this directory with `python3 sanity_checks.py`.
The graph searches are finite corroboration, not premises of the infinite proof.
All triangles are enumerated directly from graph edges. Packing and covering
are solved independently by exact recursions over those triangle edge sets.
"""

from functools import lru_cache
from itertools import combinations
from pathlib import Path
import hashlib
import json
import time


def edge(a, b):
    assert a != b
    return tuple(sorted((a, b)))


def complete(n):
    return n, set(combinations(range(n), 2))


def cycle(n):
    return n, {edge(i, (i + 1) % n) for i in range(n)}


def mycielski(graph):
    """Original vertices, their twins, and one new apex, in that order."""
    n, old_edges = graph
    new_edges = set(old_edges)
    for a, b in old_edges:
        new_edges.add(edge(a, n + b))
        new_edges.add(edge(b, n + a))
    new_edges.update(edge(n + a, 2 * n) for a in range(n))
    return 2 * n + 1, new_edges


def triangles(graph):
    n, edges = graph
    return [t for t in combinations(range(n), 3)
            if all(e in edges for e in combinations(t, 2))]


def exact_parameters(graph):
    n, edges = graph
    ordered_edges = sorted(edges)
    edge_index = {e: i for i, e in enumerate(ordered_edges)}
    ts = triangles(graph)
    masks = tuple(sum(1 << edge_index[e] for e in combinations(t, 2))
                  for t in ts)

    @lru_cache(None)
    def pack(remaining):
        if not remaining:
            return ()
        first = remaining[0]
        omit = pack(remaining[1:])
        compatible = tuple(j for j in remaining[1:]
                           if masks[j] & masks[first] == 0)
        take = (first,) + pack(compatible)
        return take if len(take) > len(omit) else omit

    @lru_cache(None)
    def cover(remaining):
        if not remaining:
            return ()
        first_mask = masks[remaining[0]]
        choices = []
        for i in range(len(ordered_edges)):
            if first_mask & (1 << i):
                uncovered = tuple(j for j in remaining
                                  if not masks[j] & (1 << i))
                choices.append((i,) + cover(uncovered))
        return min(choices, key=len)

    domain = tuple(range(len(ts)))
    p, c = pack(domain), cover(domain)
    assert all(masks[a] & masks[b] == 0 for a, b in combinations(p, 2))
    assert len(c) == len(set(c))
    assert all(any(m & (1 << i) for i in c) for m in masks)
    return {
        "vertices": n,
        "edges": len(edges),
        "triangles": len(ts),
        "nu": len(p),
        "tau": len(c),
        "packing_witness": [list(ts[i]) for i in p],
        "cover_witness": [list(ordered_edges[i]) for i in c],
        "packing_recursion_states": pack.cache_info().currsize,
        "cover_recursion_states": cover.cache_info().currsize,
    }


class SearchLimit(Exception):
    pass


def bounded_coloring(graph, k, max_nodes=1_000_000, seconds=15):
    """Exhaustive DSATUR search with valid unused-color symmetry breaking.

    Vertex order is adaptive, but no branch with an existing available color
    is omitted. Of unused colors, only the least one needs consideration:
    permuting unused labels preserves every proper-coloring extension.
    `unsatisfiable` is returned only after the complete search finishes.
    """
    n, edges = graph
    adj = [set() for _ in range(n)]
    for a, b in edges:
        adj[a].add(b)
        adj[b].add(a)
    colors = [-1] * n
    nodes = 0
    start = time.monotonic()

    def visit(colored, largest_color):
        nonlocal nodes
        nodes += 1
        if nodes > max_nodes or time.monotonic() - start > seconds:
            raise SearchLimit
        if colored == n:
            return colors.copy()
        candidates = []
        for v in range(n):
            if colors[v] == -1:
                forbidden = {colors[w] for w in adj[v] if colors[w] >= 0}
                candidates.append((len(forbidden), len(adj[v]), -v, forbidden))
        _, _, negative_v, forbidden = max(candidates, key=lambda q: q[:3])
        v = -negative_v
        for color in range(min(k - 1, largest_color + 1) + 1):
            if color not in forbidden:
                colors[v] = color
                result = visit(colored + 1, max(largest_color, color))
                if result is not None:
                    return result
                colors[v] = -1
        return None

    try:
        witness = visit(0, -1)
        status = "satisfiable" if witness is not None else "unsatisfiable"
    except SearchLimit:
        witness, status = None, "limit_reached_no_verdict"
    if witness is not None:
        assert all(witness[a] != witness[b] for a, b in edges)
    return {"colors": k, "status": status, "search_nodes": nodes,
            "elapsed_seconds": round(time.monotonic() - start, 6),
            "node_limit": max_nodes, "time_limit_seconds": seconds,
            "witness": witness}


def rainbow_witness(graph, labels):
    n, edges = graph
    assert set(labels) == edges
    assert set(labels.values()) <= {0, 1, 2}
    ts = triangles(graph)
    assert all({labels[e] for e in combinations(t, 2)} == {0, 1, 2}
               for t in ts)
    return {"verified": True, "triangles_checked": len(ts),
            "edge_labels": [[a, b, labels[a, b]] for a, b in sorted(edges)]}


def main():
    started = time.time()
    cases = {}
    for name, graph, expected in [
        ("K4", complete(4), (1, 2, 4)),
        ("K5", complete(5), (2, 4, 10)),
        ("C5", cycle(5), (0, 0, 0)),
    ]:
        result = exact_parameters(graph)
        assert (result["nu"], result["tau"], result["triangles"]) == expected
        cases[name] = result

    coloring_solver_sanity = {}
    for name, graph, k, expected in [
        ("K4_three_colors", complete(4), 3, "unsatisfiable"),
        ("K4_four_colors", complete(4), 4, "satisfiable"),
        ("K5_four_colors", complete(5), 4, "unsatisfiable"),
        ("C5_two_colors", cycle(5), 2, "unsatisfiable"),
        ("C5_three_colors", cycle(5), 3, "satisfiable"),
    ]:
        search = bounded_coloring(graph, k)
        assert search["status"] == expected
        coloring_solver_sanity[name] = search

    m1 = mycielski(cycle(5))
    m2 = mycielski(m1)
    assert m1[0] == 11 and len(m1[1]) == 20 and not triangles(m1)
    assert m2[0] == 23 and len(m2[1]) == 71 and not triangles(m2)
    color4 = bounded_coloring(m2, 4)
    # Explicit proper five-coloring inherited through both Mycielski steps.
    c5_colors = [0, 1, 0, 1, 2]
    m1_colors = c5_colors + c5_colors + [3]
    m2_colors = m1_colors + m1_colors + [4]
    assert all(m2_colors[a] != m2_colors[b] for a, b in m2[1])

    k4_vertices = (23, 24, 25, 26)
    t_vertices = (27, 28, 29)
    t_edges = set(combinations(t_vertices, 2))
    bridges = {(0, 23), (26, 27)}
    g_edges = m2[1] | set(combinations(k4_vertices, 2)) | t_edges | bridges
    g = (30, g_edges)
    h = (30, g_edges - t_edges)
    assert len(g_edges) == 82 and len(h[1]) == 79

    g_parameters, h_parameters = exact_parameters(g), exact_parameters(h)
    assert (g_parameters["triangles"], g_parameters["nu"],
            g_parameters["tau"]) == (5, 2, 3)
    assert (h_parameters["triangles"], h_parameters["nu"],
            h_parameters["tau"]) == (4, 1, 2)
    assert all(not (set(e) <= set(t_vertices)) for e in h[1])

    # Opposite K4 edges receive the same label; non-triangular edges can be 0.
    labels_h = {e: 0 for e in h[1]}
    for label, pair in enumerate([
        ((23, 24), (25, 26)),
        ((23, 25), (24, 26)),
        ((23, 26), (24, 25)),
    ]):
        for e in pair:
            labels_h[e] = label
    labels_g = dict(labels_h)
    labels_g.update({e: i for i, e in enumerate(sorted(t_edges))})
    graph_colors = m2_colors + [1, 0, 2, 3] + [0, 1, 2]
    assert all(graph_colors[a] != graph_colors[b] for a, b in g_edges)

    cases["Mycielski_component"] = {
        "construction": "M(M(C5)); original vertices, twins, then apex at each step",
        "vertices": m2[0], "edges": len(m2[1]), "triangles": 0,
        "four_color_search": color4,
        "explicit_five_coloring_verified": True,
        "five_coloring": m2_colors,
        "chromatic_number": 5 if color4["status"] == "unsatisfiable" else None,
    }
    cases["G_Mycielski_K4_T"] = {
        "construction": "M(M(C5)) on 0..22, K4 on 23..26, T on 27..29; bridges 0-23 and 26-27",
        "G": g_parameters, "H_equals_G_minus_E_T": h_parameters,
        "distinguished_triangle": list(t_vertices),
        "U_independent_in_H_verified": True,
        "H_triangle_hypergraph_three_partite_witness": rainbow_witness(h, labels_h),
        "G_triangle_hypergraph_three_partite_witness": rainbow_witness(g, labels_g),
        "explicit_five_coloring_G_and_H_verified": True,
        "five_coloring": graph_colors,
        "G_and_H_not_four_colorable_computationally_certified": color4["status"] == "unsatisfiable",
        "scope": "Shows that H need not be four-colorable. G also has a tripartite triangle hypergraph; this example alone does not separate the new theorem from all previous tripartite-hypergraph applications.",
    }
    result = {
        "status": "all_parameter_and_witness_assertions_passed",
        "started_utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime(started)),
        "elapsed_seconds": round(time.time() - started, 6),
        "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "methods": {
            "triangles": "direct enumeration of all three-vertex subsets",
            "packing": "exact include/exclude recursion on triangles",
            "covering": "exact recursion branching on the three edges of an uncovered triangle",
            "non_four_colorability": "bounded exhaustive DSATUR search; only unused color labels identified by symmetry",
            "formal_status": "Ordinary Python computation, not a Lean or independently checked proof certificate",
        },
        "coloring_solver_sanity": coloring_solver_sanity,
        "cases": cases,
    }
    destination = Path(__file__).with_name("sanity_results.json")
    destination.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"status": result["status"], "elapsed_seconds": result["elapsed_seconds"],
                      "four_color_search": color4, "output": str(destination)}, indent=2))


if __name__ == "__main__":
    main()
