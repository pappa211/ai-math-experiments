"""Literal wheel control: all actual quotient triangles, exact tiny optima.

Pure standard library; no graph corpus, external solver, or graph-order search.
"""

from itertools import combinations
from pathlib import Path
import hashlib
import json


ROOT = Path(__file__).resolve().parents[1]


def edge(a, b):
    return tuple(sorted((a, b)))


def triangles(vertices, edges):
    return tuple(t for t in combinations(sorted(vertices), 3)
                 if all(edge(*e) in edges for e in combinations(t, 2)))


def exact(vertices, edges):
    ts = triangles(vertices, edges)
    te = [frozenset(edge(*e) for e in combinations(t, 2)) for t in ts]
    best_packing = ()
    for mask in range(1 << len(ts)):
        chosen = tuple(i for i in range(len(ts)) if mask & (1 << i))
        if len(chosen) <= len(best_packing):
            continue
        used = set()
        for i in chosen:
            if used.intersection(te[i]):
                break
            used.update(te[i])
        else:
            best_packing = chosen
    es = tuple(sorted(edges))
    best_cover = None
    for size in range(len(es) + 1):
        for chosen in combinations(es, size):
            if all(set(chosen).intersection(t) for t in te):
                best_cover = chosen
                break
        if best_cover is not None:
            break
    assert best_cover is not None
    nu, tau = len(best_packing), len(best_cover)
    return {
        "vertices": sorted(vertices), "edges": es, "triangles": ts,
        "nu": nu, "tau": tau, "defect": tau - 2 * nu,
        "packing": tuple(ts[i] for i in best_packing),
        "cover": best_cover,
        "packing_subsets_inspected": 1 << len(ts),
    }


def main():
    vertices = set(range(6))
    edges = {edge(i, (i + 1) % 5) for i in range(5)}
    edges.update(edge(5, i) for i in range(5))
    original = exact(vertices, edges)
    assert (original["nu"], original["tau"], original["defect"]) == (2, 3, -1)
    assert original["triangles"] == ((0, 1, 5), (0, 4, 5), (1, 2, 5), (2, 3, 5), (3, 4, 5))
    rows = []
    counts = {"adjacent_rim": 0, "nonadjacent_rim": 0, "hub_rim": 0}
    for a, b in combinations(range(6), 2):
        # Identify b with a; remove loops and simplify parallel edges by a set.
        image = {u: (a if u == b else u) for u in vertices}
        quotient_vertices = {image[u] for u in vertices}
        quotient_edges = {
            edge(image[u], image[w]) for u, w in edges if image[u] != image[w]
        }
        row = exact(quotient_vertices, quotient_edges)
        if b == 5:
            kind = "hub_rim"
            expected_triangles = 3
        elif edge(a, b) in edges:
            kind = "adjacent_rim"
            expected_triangles = 4
        else:
            kind = "nonadjacent_rim"
            expected_triangles = 5
        counts[kind] += 1
        assert len(row["triangles"]) == expected_triangles
        assert (row["nu"], row["tau"], row["defect"]) == (2, 2, -2)
        assert row["defect"] < original["defect"]
        row.update({"identified_pair": (a, b), "symmetry_type": kind})
        rows.append(row)
    assert counts == {"adjacent_rim": 5, "nonadjacent_rim": 5, "hub_rim": 5}
    result = {
        "status": "PASS", "scope": "one literal six-vertex wheel and its fifteen quotients",
        "method": "all actual triangles; exhaustive packing subsets and increasing cover subsets",
        "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "original": original, "symmetry_counts": counts, "quotients": rows,
        "claims": {
            "VI_universal_availability_false": True,
            "ordinary_Tuza_counterexample": False,
            "repaired_terminal_class_availability_resolved": False,
        },
    }
    output = ROOT / "evidence" / "criticality_identification_wheel.json"
    output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"status": "PASS", "quotients": len(rows), "counts": counts,
                      "output": str(output)}, sort_keys=True))


if __name__ == "__main__":
    main()
