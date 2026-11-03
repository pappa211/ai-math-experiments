#!/usr/bin/env python3
"""Independent exact TUZA-12 C check: only the stated eight-vertex graph.

Fresh implementation from the K4/page/tip-edge definition. No author or review
code, third-party solver, external service, or mathematical input file is used.
The enumeration visits every triangle subset and every actual-edge subset for
both G and H. It also checks source certificates and the ordinary lower bounds.

Run from any directory after sourcing migration/env.sh:
    python /absolute/path/to/checks/check_c.py
Output is evidence/check_c.json relative to this script's workspace.
"""
from collections import Counter
from datetime import datetime, timezone
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json
import platform
import sys
import time


def edge(u, v):
    assert u != v
    return tuple(sorted((u, v)))


def triangle_edges(t):
    return frozenset(edge(u, v) for u, v in combinations(t, 2))


def edge_names(es):
    return ["".join(map(str, e)) for e in sorted(es)]


def triangle_names(ts):
    return ["".join(map(str, t)) for t in sorted(ts)]


def full_triangles(vertices, edges):
    return tuple(t for t in combinations(vertices, 3) if triangle_edges(t) <= edges)


def verify_graph(vertices, edges, expected_triangles, packing, cover):
    edges = frozenset(edges)
    ordered_edges = sorted(edges)
    triangles = full_triangles(vertices, edges)
    assert triangle_names(triangles) == expected_triangles
    tsets = [triangle_edges(t) for t in triangles]
    edge_index = {e: i for i, e in enumerate(ordered_edges)}
    tmasks = [sum(1 << edge_index[e] for e in es) for es in tsets]
    packing_counts = Counter()
    first_packing = {}
    # Exhaustive triangle-subset test, with direct set intersections.
    for selection in range(1 << len(triangles)):
        selected = [i for i in range(len(triangles)) if selection & (1 << i)]
        used = set()
        valid = True
        for i in selected:
            if used.intersection(tsets[i]):
                valid = False
                break
            used.update(tsets[i])
        if valid:
            size = len(selected)
            packing_counts[size] += 1
            first_packing.setdefault(size, [triangles[i] for i in selected])
    nu = max(packing_counts)
    cover_counts = Counter()
    first_cover = {}
    # Exhaustive graph-edge-subset test, independent of the packing enumeration.
    for selection in range(1 << len(ordered_edges)):
        if all(selection & tmask for tmask in tmasks):
            size = selection.bit_count()
            cover_counts[size] += 1
            first_cover.setdefault(size, [e for i, e in enumerate(ordered_edges)
                                          if selection & (1 << i)])
    tau = min(cover_counts)
    assert all(t in triangles for t in packing)
    assert all(triangle_edges(a).isdisjoint(triangle_edges(b))
               for a, b in combinations(packing, 2))
    assert set(cover) <= edges
    cover_hits = {"".join(map(str, t)): edge_names(set(cover) & triangle_edges(t))
                  for t in triangles}
    assert all(cover_hits.values())
    assert len(packing) == nu
    assert len(cover) == tau
    degrees = {v: sum(v in e for e in edges) for v in vertices}
    return {
        "vertices": list(vertices), "edges": edge_names(edges),
        "edge_count": len(edges), "triangles": triangle_names(triangles),
        "triangle_count": len(triangles), "nu": nu, "tau": tau,
        "degree_sequence_by_vertex": degrees,
        "odd_degree_vertices": [v for v in vertices if degrees[v] % 2],
        "triangle_subsets_tested": 1 << len(triangles),
        "edge_subsets_tested": 1 << len(edges),
        "valid_packing_count_by_size": dict(sorted(packing_counts.items())),
        "valid_cover_count_by_size": dict(sorted(cover_counts.items())),
        "first_maximum_packing": triangle_names(first_packing[nu]),
        "first_minimum_cover": edge_names(first_cover[tau]),
        "source_packing": triangle_names(packing),
        "source_cover": edge_names(cover), "source_cover_hits": cover_hits,
        "source_packing_is_maximum": True, "source_cover_is_minimum": True,
        "tuza_holds": tau <= 2 * nu,
    }


def main():
    started = datetime.now(timezone.utc).isoformat()
    timer = time.perf_counter()
    vertices = tuple(range(8))
    q = frozenset(range(4))
    q_edges = frozenset(combinations(sorted(q), 2))
    # Construct input semantically, without loading any source/checker data.
    page_endpoints = {4: (0, 1), 5: (1, 2), 6: (2, 3), 7: (0, 3)}
    tip_edges = frozenset({edge(4, 5), edge(4, 7), edge(5, 6)})
    page_edges = frozenset(edge(tip, endpoint)
                           for tip, endpoints in page_endpoints.items()
                           for endpoint in endpoints)
    g_edges = q_edges | page_edges | tip_edges
    inactive_diagonals = frozenset({edge(0, 2), edge(1, 3)})
    h_edges = g_edges - inactive_diagonals
    assert edge_names(g_edges) == [
        "01", "02", "03", "04", "07", "12", "13", "14", "15",
        "23", "25", "26", "36", "37", "45", "47", "56"]
    packing = [(0, 1, 4), (1, 2, 5), (2, 3, 6), (0, 3, 7)]
    g_cover = [edge(0, 1), edge(2, 3), edge(0, 7), edge(1, 5), edge(2, 5)]
    h_cover = [edge(0, 1), edge(0, 7), edge(1, 5), edge(2, 6)]
    g = verify_graph(vertices, g_edges,
        ["012", "013", "014", "023", "037", "047", "123", "125", "145", "236", "256"],
        packing, g_cover)
    h = verify_graph(vertices, h_edges,
        ["014", "037", "047", "125", "145", "236", "256"],
        packing, h_cover)
    assert (g["nu"], g["tau"], h["nu"], h["tau"]) == (4, 5, 4, 4)
    triangles = full_triangles(vertices, g_edges)
    external = [t for t in triangles if not set(t) <= q]
    active_witnesses = {"".join(map(str, e)): triangle_names(
        [t for t in external if e in triangle_edges(t)]) for e in sorted(q_edges)}
    active = [name for name, witnesses in active_witnesses.items() if witnesses]
    assert active == ["01", "03", "12", "23"]
    assert active_witnesses["02"] == active_witnesses["13"] == []
    assert set(triangles) - set(full_triangles(vertices, h_edges)) == set(combinations(sorted(q), 3))
    # Verify all ingredients of the parity proof, including the maximum number
    # of odd-degree vertices any pair of leftover actual edges can have.
    odd_pair_counts = Counter()
    for leftover in combinations(sorted(g_edges), 2):
        odd_count = sum(sum(v in e for e in leftover) % 2 for v in vertices)
        odd_pair_counts[odd_count] += 1
    assert g["edge_count"] == 17
    assert g["odd_degree_vertices"] == [0, 1, 2, 3, 6, 7]
    assert max(odd_pair_counts) == 4 < len(g["odd_degree_vertices"])
    assert 3 * 5 == g["edge_count"] - 2
    # Verify disjoint counting obligations for tau(G) >= 2 + 3.
    q_faces = list(combinations(sorted(q), 3))
    q_edge_face_counts = {"".join(map(str, e)): sum(e in triangle_edges(t) for t in q_faces)
                          for e in sorted(q_edges)}
    assert set(q_edge_face_counts.values()) == {2}
    lower_bound_external = [(1, 4, 5), (0, 4, 7), (2, 5, 6)]
    lower_bound_edge_sets = [triangle_edges(t) for t in lower_bound_external]
    assert all(t in triangles for t in lower_bound_external)
    assert all(es.isdisjoint(q_edges) for es in lower_bound_edge_sets)
    assert all(a.isdisjoint(b) for a, b in combinations(lower_bound_edge_sets, 2))
    # Scoped negative control: this G falls outside B's claw-free-X hypothesis.
    claw_center = (0, 1, 2)
    claw_leaves = [(0, 1, 4), (1, 2, 5), (0, 2, 3)]
    assert all(t in triangles for t in [claw_center, *claw_leaves])
    assert all(triangle_edges(claw_center) & triangle_edges(t) for t in claw_leaves)
    assert all(triangle_edges(a).isdisjoint(triangle_edges(b))
               for a, b in combinations(claw_leaves, 2))
    # Intentional invalid certificate must be rejected: remove 25 from G's cover.
    false_cover = set(g_cover) - {edge(2, 5)}
    uncovered = [t for t in triangles if triangle_edges(t).isdisjoint(false_cover)]
    assert triangle_names(uncovered) == ["256"]
    receipt = {
        "schema": "TUZA-12-independent-C-v1",
        "status": "PASS", "claim_status": "VERIFIED_ORDINARY_AND_FINITE_CHECKED",
        "auxiliary_neutral_restoration_implication": "REFUTED",
        "domain": "Only the stated eight-vertex G and its specified diagonal deletion H",
        "method": "All vertex triples; all triangle subsets for packing; all actual-edge subsets for covering",
        "third_party_packages": [], "mathematical_input_files": [],
        "source_or_reviewer_code_imported": False,
        "started_utc": started,
        "completed_utc": datetime.now(timezone.utc).isoformat(),
        "elapsed_seconds": time.perf_counter() - timer,
        "python_executable": sys.executable, "python_version": sys.version,
        "platform": platform.platform(),
        "checker_sha256": sha256(Path(__file__).read_bytes()).hexdigest(),
        "G": g, "H": h,
        "activity": {"q_edges_external_triangle_witnesses": active_witnesses,
                     "active_q_edges": active, "inactive_diagonals": ["02", "13"]},
        "parity_certificate": {
            "G_odd_vertices": g["odd_degree_vertices"],
            "all_two_edge_leftover_pairs_tested": sum(odd_pair_counts.values()),
            "leftover_pair_count_by_odd_vertex_count": dict(sorted(odd_pair_counts.items())),
            "maximum_odd_vertices_on_two_edges": max(odd_pair_counts)},
        "cover_lower_bound_certificate": {
            "Q_faces": triangle_names(q_faces), "Q_edge_face_counts": q_edge_face_counts,
            "external_edge_disjoint_triangles": triangle_names(lower_bound_external),
            "external_triangle_edges_disjoint_from_Q": True, "lower_bound": 5},
        "scope_negative_control": {
            "XG_has_induced_claw": True, "center": "012",
            "leaves": triangle_names(claw_leaves)},
        "invalid_cover_negative_control": {
            "cover": edge_names(false_cover), "uncovered_triangles": triangle_names(uncovered),
            "rejected": True},
    }
    output = Path(__file__).resolve().parents[1] / "evidence" / "check_c.json"
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"status": receipt["status"], "G": [g["nu"], g["tau"]],
                      "H": [h["nu"], h["tau"]], "receipt": str(output),
                      "elapsed_seconds": receipt["elapsed_seconds"]}, sort_keys=True))


if __name__ == "__main__":
    main()
