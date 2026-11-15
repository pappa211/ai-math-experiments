#!/usr/bin/env python3
"""Independent literal review; standard library; no producer imports or output reads."""
from collections import defaultdict
from datetime import datetime, timezone
from hashlib import sha256
from itertools import combinations, permutations
from pathlib import Path
import json
import platform
import sys

W = Path(__file__).resolve().parents[1]
EXPECTED = "f7ce814b0d747ad8011cc896e65253a9230cc814f156d0cf5da2a276f7aafc93"
source = W / "notes/global_routes_barycentric_transfer.md"
raw = source.read_bytes()
assert sha256(raw).hexdigest() == EXPECTED, "producer statement changed"
out = W / "evidence/barycentric_independent_review"
out.mkdir(parents=True, exist_ok=True)
frozen = out / "reviewed_note_f7ce814b.md"
if frozen.exists():
    assert frozen.read_bytes() == raw
else:
    frozen.write_bytes(raw)
assert platform.system() == "Darwin"

def triangles(n, edges):
    es = set(edges)
    return [t for t in combinations(range(n), 3)
            if all(e in es for e in combinations(t, 2))]

def directed(cycle):
    return {(cycle[i], cycle[(i+1) % 3]) for i in range(3)}

def coherent(edges, tris, orientation):
    incid = defaultdict(list)
    for t in tris:
        assert set(orientation[t]) == set(t)
        arcs = directed(orientation[t])
        for e in combinations(t, 2):
            incid[e].append(1 if e in arcs else -1)
    assert set(incid) == set(edges)
    assert all(sorted(v) == [-1, 1] for v in incid.values())

def subdivide(n, edges, orientation, label):
    oldtris = triangles(n, edges)
    coherent(edges, oldtris, orientation)
    faces = [(v,) for v in range(n)] + list(edges) + oldtris
    faces.sort(key=lambda f: (len(f), f))
    ranks = [len(f) for f in faces]
    sets = [set(f) for f in faces]
    newedges = [(i, j) for i, j in combinations(range(len(faces)), 2)
                if sets[i] < sets[j] or sets[j] < sets[i]]
    actual = triangles(len(faces), newedges)
    expected = [(i, j, k) for i in range(len(faces))
                for j in range(i+1, len(faces))
                for k in range(j+1, len(faces))
                if ranks[i] == 1 and ranks[j] == 2 and ranks[k] == 3
                and sets[i] < sets[j] < sets[k]]
    assert actual == expected
    colors = []
    neworientation = {}
    for t in actual:
        i, j, k = t
        v = faces[i][0]
        other = next(a for a in faces[j] if a != v)
        color = int((v, other) in directed(orientation[faces[k]]))
        colors.append(color)
        neworientation[t] = t if color else (i, k, j)
    incid = defaultdict(list)
    for q, t in enumerate(actual):
        for e in combinations(t, 2):
            incid[e].append(q)
    assert set(incid) == set(newedges)
    assert all(len(qs) == 2 and colors[qs[0]] != colors[qs[1]]
               for qs in incid.values())
    packing = [q for q, c in enumerate(colors) if c]
    for e, qs in incid.items():
        assert sum(q in packing for q in qs) == 1
    cover = [e for e in newedges if (ranks[e[0]], ranks[e[1]]) == (1, 2)]
    for t in actual:
        assert sum(e in cover for e in combinations(t, 2)) == 1
    assert len(packing) == len(cover) == 2*len(edges) == 3*len(oldtris)
    coherent(newedges, actual, neworientation)
    weighted_certificates = []
    potential_families = {
        "all_zero": [0]*len(actual),
        "one_bipartition_twice": [2*c for c in colors],
        "mixed_integer_multiplicities": [q % 4 for q in range(len(actual))],
    }
    for name, potential in potential_families.items():
        weight = {e: sum(potential[q] for q in qs) for e, qs in incid.items()}
        packing_value = sum(potential)
        cover_cost = sum(weight[e] for e in cover)
        assert packing_value == cover_cost
        weighted_certificates.append({
            "name": name, "triangle_multiplicities": potential,
            "edge_capacities": [weight[e] for e in newedges],
            "equal_primal_dual_value": packing_value,
        })
    result = {
        "label": label, "old_counts": [n, len(edges), len(oldtris)],
        "new_counts": [len(faces), len(newedges), len(actual)],
        "faces": faces, "edges": newedges, "all_actual_triangles": actual,
        "flag_colors": colors, "edge_triangle_incidence": [incid[e] for e in newedges],
        "packing_triangle_indices": packing, "cover_edges": cover,
        "exact_unweighted_nu_and_tau": len(packing),
        "coherent_triangle_orientations": [neworientation[t] for t in actual],
        "selected_weight_certificates": weighted_certificates,
        "weighted_scope": "Selected feasible equal-valued primal-dual certificates only; universal claim rests on the ordinary TU proof.",
    }
    return len(faces), newedges, neworientation, result

baseedges = list(combinations(range(4), 2))
basetris = triangles(4, baseedges)
baseorientation = {
    (1, 2, 3): (1, 2, 3), (0, 2, 3): (0, 3, 2),
    (0, 1, 3): (0, 1, 3), (0, 1, 2): (0, 2, 1),
}
assert all(set(combinations(a, 2)) & set(combinations(b, 2))
           for a, b in combinations(basetris, 2))
assert min(len(c) for k in range(7) for c in combinations(baseedges, k)
           if all(set(c) & set(combinations(t, 2)) for t in basetris)) == 2
n1, e1, o1, r1 = subdivide(4, baseedges, baseorientation, "X(K4)")
parities = []
for t in r1["all_actual_triangles"]:
    v, e, face = [r1["faces"][i] for i in t]
    p = [v[0], next(a for a in e if a != v[0]),
         next(a for a in face if a not in e), next(a for a in range(4) if a not in face)]
    parities.append(sum(p[i] > p[j] for i, j in combinations(range(4), 2)) % 2)
assert len(set(a ^ b for a, b in zip(parities, r1["flag_colors"]))) == 1
n2, e2, o2, r2 = subdivide(n1, e1, o1, "X(X(K4))")
assert r1["new_counts"] == [14, 36, 24]
assert r2["new_counts"] == [74, 216, 144]
receipt = {
    "created_utc": datetime.now(timezone.utc).isoformat(),
    "host": platform.system(), "python": sys.version,
    "script_sha256": sha256(Path(__file__).read_bytes()).hexdigest(),
    "reviewed_note": str(source), "reviewed_note_sha256": EXPECTED,
    "producer_code_or_output_read": False,
    "base": {"vertices": list(range(4)), "edges": baseedges,
             "all_actual_triangles": basetris, "nu": 1, "tau": 2},
    "checks": [r1, r2],
    "limits": "Finite literal check of two iterations and three constructed integer-weight families per graph. Universal weights and arbitrary iteration count are ordinary proofs, not enumerated or formally verified.",
}
path = out / "literal_check.json"
path.write_text(json.dumps(receipt, indent=2) + "\n")
print(json.dumps({"status": "PASS", "counts": [r1["new_counts"], r2["new_counts"]],
                  "unweighted_optima": [r1["exact_unweighted_nu_and_tau"], r2["exact_unweighted_nu_and_tau"]],
                  "receipt": str(path), "receipt_sha256": sha256(path.read_bytes()).hexdigest(),
                  "script_sha256": receipt["script_sha256"]}, indent=2))
