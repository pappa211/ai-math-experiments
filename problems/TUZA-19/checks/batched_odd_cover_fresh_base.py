#!/usr/bin/env python3
"""Independent literal K_(2,2,2,2) base check; no large-graph or census claim.

Reproduce on the authorized Darwin host from the mission workspace:
  source LOCAL_ENVIRONMENT
  python checks/batched_odd_cover_fresh_base.py

The eight triples are transcribed from the proof, not loaded from its certificate.
The all-size Latin blowup is an ordinary proof in the review, not a finite test.
"""
from collections import Counter
from datetime import datetime, timezone
from itertools import combinations
import json
import platform
import sys


def main():
    if platform.system() != "Darwin":
        raise SystemExit("TUZA-19 computation is authorized only on the Darwin host")
    parts = (("a0", "a1"), ("i0", "i1"), ("b0", "b1"), ("c0", "c1"))
    triangles = (
        ("a0", "b0", "c0"),
        ("a1", "b1", "c1"),
        ("i0", "b0", "c1"),
        ("i1", "b1", "c0"),
        ("i0", "c0", "a1"),
        ("i1", "a0", "c1"),
        ("i0", "a0", "b1"),
        ("i1", "b0", "a1"),
    )
    owner = {vertex: number for number, part in enumerate(parts) for vertex in part}
    expected = {
        tuple(sorted((left, right)))
        for left, right in combinations(owner, 2)
        if owner[left] != owner[right]
    }
    if len(expected) != 24:
        raise AssertionError("The independently generated four-partite graph must have 24 edges")
    for triangle in triangles:
        if len(set(triangle)) != 3 or len({owner[v] for v in triangle}) != 3:
            raise AssertionError("A claimed triangle does not meet three distinct parts")
    multiplicity = Counter(
        tuple(sorted(edge))
        for triangle in triangles
        for edge in combinations(triangle, 2)
    )
    if set(multiplicity) != expected:
        raise AssertionError({"missing": sorted(expected-set(multiplicity)),
                              "extraneous": sorted(set(multiplicity)-expected)})
    if any(count != 1 for count in multiplicity.values()):
        raise AssertionError("Some cross edge is repeated")
    result = {
        "verdict": "PASS",
        "executed_utc": datetime.now(timezone.utc).isoformat(timespec="seconds").replace("+00:00", "Z"),
        "host": platform.system(),
        "python": sys.version.split()[0],
        "scope": "Only the eight displayed K_(2,2,2,2) base triples; not the large graph or all-size Latin blowup",
        "parts": parts,
        "base_triangles": triangles,
        "base_triangle_count": len(triangles),
        "expected_cross_edge_count": len(expected),
        "used_edge_count_with_multiplicity": sum(multiplicity.values()),
        "all_cross_edges_exactly_once": True,
        "all_triangles_meet_three_distinct_parts": True,
        "cross_edges": sorted(expected),
        "large_graph_generated": False,
        "census": False,
    }
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
