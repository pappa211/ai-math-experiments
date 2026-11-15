"""One literal C7-square control for the star-terminal identification repair."""

from itertools import combinations
from pathlib import Path
import hashlib
import json

from criticality_identification_wheel import edge, exact


ROOT = Path(__file__).resolve().parents[1]


def star_number(ts, center):
    candidates = [t for t in ts if center in t]
    best = 0
    for mask in range(1 << len(candidates)):
        chosen = [t for i, t in enumerate(candidates) if mask & (1 << i)]
        used = set()
        for t in chosen:
            edges = {edge(*e) for e in combinations(t, 2)}
            if used.intersection(edges):
                break
            used.update(edges)
        else:
            best = max(best, len(chosen))
    return best


def main():
    vs = set(range(7))
    es = {edge(i, (i + d) % 7) for i in range(7) for d in (1, 2)}
    original = exact(vs, es)
    expected_triangles = sorted(tuple(sorted((i, (i + 1) % 7, (i + 2) % 7)))
                                for i in range(7))
    assert list(original["triangles"]) == expected_triangles
    assert (original["nu"], original["tau"], original["defect"]) == (3, 4, -2)
    stars = {v: star_number(original["triangles"], v) for v in vs}
    assert set(stars.values()) == {2}
    rows = []
    counts = {1: 0, 2: 0, 3: 0}
    for a, b in combinations(range(7), 2):
        image = {u: (a if u == b else u) for u in vs}
        quotient_edges = {edge(image[u], image[w]) for u, w in es
                          if image[u] != image[w]}
        row = exact(set(image.values()), quotient_edges)
        distance = min(b - a, 7 - (b - a))
        counts[distance] += 1
        assert len(row["triangles"]) == {1: 6, 2: 9, 3: 7}[distance]
        assert (row["nu"], row["tau"], row["defect"]) == (3, 3, -3)
        assert row["defect"] < original["defect"]
        row.update({"identified_pair": (a, b), "cyclic_distance": distance})
        rows.append(row)
    assert counts == {1: 7, 2: 7, 3: 7}
    solver = ROOT / "checks" / "criticality_identification_wheel.py"
    result = {
        "status": "PASS", "scope": "one literal C7 square and all twenty-one quotients",
        "method": "independent literal full-triangle reconstruction and exhaustive tiny optima",
        "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "literal_solver_sha256": hashlib.sha256(solver.read_bytes()).hexdigest(),
        "original": original, "largest_star_by_vertex": stars,
        "distance_counts": counts, "quotients": rows,
        "claims": {
            "outside_clique_block_and_maximum_star_terminal_classes": True,
            "VI_star_repair_universal_availability_false": True,
            "ordinary_Tuza_counterexample": False,
            "positive_defect_only_availability_resolved": False,
        },
    }
    output = ROOT / "evidence" / "criticality_identification_star_repair.json"
    output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"status": "PASS", "quotients": len(rows),
                      "largest_star": 2, "output": str(output)}, sort_keys=True))


if __name__ == "__main__":
    main()
