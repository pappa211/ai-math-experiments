#!/usr/bin/env python3
"""Fresh standard-library verification of TUZA-12 A; no source solver imports.

Finite domain: full C9-square graph, all 1296 sufficient residue-class orders,
exact symbolic parameter arithmetic, and two small assembly/augmentation controls.
The 2**96-vertex existence statement is proved in INDEPENDENT_PROOF_A.md,
not simulated by this program. Run from any directory; the receipt is written
only inside this new verification workspace.
"""
from __future__ import annotations
from collections import Counter
from datetime import datetime, timezone
from fractions import Fraction
from functools import lru_cache
from hashlib import sha256
from itertools import combinations, permutations, product
from math import comb, factorial
from pathlib import Path
import json
import platform
import signal
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
START = time.monotonic()
signal.alarm(110)


def edge(a, b):
    assert a != b
    return tuple(sorted((a, b)))


def full_triangles(vertices, edges):
    return tuple(t for t in combinations(sorted(vertices), 3)
                 if all(edge(a, b) in edges for a, b in combinations(t, 2)))


def actual_system(triangles):
    return tuple(frozenset(edge(a, b) for a, b in combinations(t, 2))
                 for t in triangles)


def lift_system(triangles, order):
    rank = {v: i for i, v in enumerate(order)}
    assert len(rank) == len(order)
    result = []
    for triangle in triangles:
        a, b, c = sorted(triangle, key=rank.__getitem__)
        result.append(frozenset(((edge(a, b), "low"),
                                 (edge(b, c), "high"),
                                 (edge(a, c), "outer"))))
    return tuple(result)


def exact_optima(hyperedges):
    """Exact combinatorial recurrences, returning independently checked witnesses."""
    resources = sorted(set().union(*hyperedges)) if hyperedges else []
    incidence = {r: sum(1 << i for i, h in enumerate(hyperedges) if r in h)
                 for r in resources}
    all_triangles = (1 << len(hyperedges)) - 1
    conflict = []
    for h in hyperedges:
        mask = 0
        for r in h:
            mask |= incidence[r]
        conflict.append(mask)

    @lru_cache(None)
    def pack(mask):
        if not mask:
            return ()
        i = (mask & -mask).bit_length() - 1
        take = (i,) + pack(mask & ~conflict[i])
        skip = pack(mask & ~(1 << i))
        return take if len(take) >= len(skip) else skip

    @lru_cache(None)
    def cover(mask):
        if not mask:
            return ()
        i = (mask & -mask).bit_length() - 1
        choices = [(r,) + cover(mask & ~incidence[r])
                   for r in sorted(hyperedges[i])]
        return min(choices, key=lambda x: (len(x), x))

    packing = pack(all_triangles)
    covering = cover(all_triangles)
    used = set()
    for i in packing:
        assert not used.intersection(hyperedges[i])
        used.update(hyperedges[i])
    assert len(covering) == len(set(covering))
    assert all(set(covering).intersection(h) for h in hyperedges)
    assert len(packing) <= len(covering)
    return {"nu": len(packing), "tau": len(covering),
            "packing_triangle_indices": packing, "cover_resources": covering}


vertices = tuple(range(9))
edges = frozenset((a, b) for a, b in combinations(vertices, 2)
                  if min(b - a, 9 - (b - a)) in (1, 2))
triangles = full_triangles(vertices, edges)
consecutive = {tuple(sorted((i, (i + 1) % 9, (i + 2) % 9))) for i in vertices}
assert set(triangles) == consecutive
assert len(edges) == 18 and len(triangles) == 9
actual = actual_system(triangles)
base = exact_optima(actual)
assert (base["nu"], base["tau"]) == (4, 5)
incidence_counts = Counter(sum(e in h for h in actual) for e in edges)
assert incidence_counts == {1: 9, 2: 9}
index_of = {tuple(sorted((i, (i + 1) % 9, (i + 2) % 9))): i for i in vertices}
conflicts = sorted((index_of[triangles[i]], index_of[triangles[j]])
                   for i, j in combinations(range(9), 2) if actual[i] & actual[j])
assert {edge(i, j) for i, j in conflicts} == {edge(i, (i + 1) % 9) for i in vertices}

# Explicit source-independent ordinary certificates: T_0,T_2,T_4,T_6 and
# the distance-one edges indexed 0,2,4,6,8. These also explain the optima.
explicit_packing = [tuple(sorted((i, (i + 1) % 9, (i + 2) % 9))) for i in (0, 2, 4, 6)]
explicit_cover = [edge(i, (i + 1) % 9) for i in (0, 2, 4, 6, 8)]
assert all(not (actual_system((a,))[0] & actual_system((b,))[0])
           for a, b in combinations(explicit_packing, 2))
assert all(set(explicit_cover) & h for h in actual)

classes = tuple(tuple(v for v in vertices if v % 3 == c) for c in range(3))
pattern_orders = set()
pattern_values = Counter()
pattern_digester = sha256()
for class_order in permutations(range(3)):
    for interiors in product(*(tuple(permutations(classes[c])) for c in class_order)):
        order = tuple(v for group in interiors for v in group)
        assert order not in pattern_orders
        pattern_orders.add(order)
        lifted = lift_system(triangles, order)
        roles = {e: set() for e in edges}
        for h in lifted:
            for e, role in h:
                roles[e].add(role)
        assert all(len(s) == 1 for s in roles.values())
        # Explicit incidence isomorphism, not merely equality of two numbers.
        translated = tuple(frozenset((e, next(iter(roles[e]))) for e in h) for h in actual)
        assert translated == lifted
        result = exact_optima(lifted)
        assert (result["nu"], result["tau"]) == (4, 5)
        pattern_values[(result["nu"], result["tau"])] += 1
        pattern_digester.update(bytes(order))
assert len(pattern_orders) == factorial(3) ** 4 == 1296
p = Fraction(len(pattern_orders), factorial(9))
assert p == Fraction(1, 280)
natural_order = exact_optima(lift_system(triangles, vertices))
assert (natural_order["nu"], natural_order["tau"]) == (7, 7)

N, M = 2 ** 96, 2 ** 128
mu = p * M
delta = Fraction(M, 1120)
pair_contains = Fraction(9 * 8, N * (N - 1))
pair_union = comb(M, 2) * comb(9, 2) * pair_contains
triple_union = comb(M, 3) * N * (N - 1) * (N - 2) * pair_contains ** 3
pair_coarse = Fraction(2592 * M * M, N * N)
triple_coarse = Fraction(124416 * M ** 3, N ** 3)
expectation_coarse = pair_coarse + triple_coarse
checks = {
    "pair_inclusion_probability": pair_contains == Fraction(comb(N - 2, 7), comb(N, 9)),
    "pair_union_bound_coarse": pair_union <= pair_coarse,
    "triple_union_bound_coarse": triple_union <= triple_coarse,
    "three_vertex_witness_bound": N * (N - 1) * (N - 2) * pair_contains ** 3 <= Fraction(746496, N ** 3),
    "defect_expectation_below_2_114": expectation_coarse < 2 ** 114,
    "deletion_allowance_above_2_117": delta > 2 ** 117,
    "markov_failure_below_one_eighth": expectation_coarse / delta < Fraction(1, 8),
    "chernoff_mu_half": mu / 2 == Fraction(M, 560),
    "chernoff_exponent": mu / 8 == Fraction(M, 2240),
    "exp_half_lower_bound": Fraction(1) + Fraction(1, 2) + Fraction(1, 8) > Fraction(8, 5),
    "N_logN_upper_bound_via_log2_lt1": 96 * N < 2 ** 103,
    "chernoff_exponent_above_2_116": mu / 8 > 2 ** 116,
    "union_exponent_above_2_115": mu / 8 - 96 * N > 2 ** 115,
    "exp_3_lower_bound_above_8": 1 + 3 + Fraction(9, 2) > 8,
    "union_failure_below_one_eighth_by_exponent": 2 ** 115 > 3,
    "connected_gap_exceeds_6N": delta > 6 * N,
    "connected_gap_equivalent_small_integer_test": 2 ** 32 > 6720,
    "new_role_bound_strict": 3 * (2 * N - 1) < 6 * N,
    "survivors_exceed_half_M": M - delta > Fraction(M, 2),
    "ordinary_certificate_added_edges_at_most_3r": 2 * N < 3 * (M - delta),
}
assert all(checks.values()), checks

# Small assembly control. Two C9-square copies share just vertex 0; the
# omitted vertex 17 also tests connecting an isolated background vertex.
block_maps = [tuple(range(9)), (0,) + tuple(range(9, 17))]
assembly_vertices = tuple(range(18))
assembly_edges = frozenset(edge(mapping[a], mapping[b])
                           for mapping in block_maps for a, b in edges)
expected_triangles = {tuple(sorted(mapping[v] for v in t))
                      for mapping in block_maps for t in triangles}
assembly_triangles = full_triangles(assembly_vertices, assembly_edges)
assert set(assembly_triangles) == expected_triangles
assert len(assembly_triangles) == 18
assembly_optima = exact_optima(actual_system(assembly_triangles))
assert (assembly_optima["nu"], assembly_optima["tau"]) == (8, 10)
connector_edges = {edge(0, v) for v in assembly_vertices if v != 0} - assembly_edges
apex = 18
spokes = {edge(v, apex) for v in assembly_vertices}
added_edges = connector_edges | spokes
augmented_edges = assembly_edges | added_edges
augmented_triangles = full_triangles(tuple(range(19)), augmented_edges)
assert len(added_edges) <= 2 * len(assembly_vertices) - 1
new_triangles = set(augmented_triangles) - set(assembly_triangles)
assert all(any(edge(a, b) in added_edges for a, b in combinations(t, 2))
           for t in new_triangles)
ordinary_cover = set(assembly_optima["cover_resources"]) | added_edges
assert all(any(edge(a, b) in ordinary_cover for a, b in combinations(t, 2))
           for t in augmented_triangles)
augmented_system = actual_system(augmented_triangles)
seen = {0}
pending = [0]
while pending:
    i = pending.pop()
    for j in range(len(augmented_system)):
        if j not in seen and augmented_system[i] & augmented_system[j]:
            seen.add(j)
            pending.append(j)
assert len(seen) == len(augmented_system)
# Inserting an apex in all nineteen possible positions preserves every old
# triangle's three resources; check both forward and reversed old orders.
restriction_tests = 0
for old_order in (assembly_vertices, tuple(reversed(assembly_vertices))):
    old_lift = lift_system(assembly_triangles, old_order)
    for position in range(19):
        enlarged = old_order[:position] + (apex,) + old_order[position:]
        assert lift_system(assembly_triangles, enlarged) == old_lift
        for t, lifted in zip(augmented_triangles, lift_system(augmented_triangles, enlarged)):
            if t in new_triangles:
                assert any(e in added_edges for e, role in lifted)
        restriction_tests += 1

# Negative closure control: three blocks meet pairwise in three different
# vertices. Their union has the cross-block triangle (0,1,2); this verifies
# that forbidding only pair intersections of size >=2 would be insufficient.
berge_maps = [(0, 1) + tuple(range(3, 10)),
              (1, 2) + tuple(range(10, 17)),
              (2, 0) + tuple(range(17, 24))]
berge_edges = frozenset(edge(mapping[a], mapping[b])
                        for mapping in berge_maps for a, b in edges)
berge_vertices = set().union(*(set(m) for m in berge_maps))
berge_expected = {tuple(sorted(mapping[v] for v in t))
                  for mapping in berge_maps for t in triangles}
berge_full = set(full_triangles(berge_vertices, berge_edges))
assert all(len(set(a) & set(b)) == 1 for a, b in combinations(berge_maps, 2))
assert (0, 1, 2) in berge_full - berge_expected

# Private administrative source-manifest comparisons are replaced by the
# public source-to-publication manifest; mathematical checks above are unchanged.
input_hashes = {}

def rational(q):
    q = Fraction(q)
    return {"numerator": str(q.numerator), "denominator": str(q.denominator)}

receipt = {
    "status": "PASS", "component": "A", "utc": datetime.now(timezone.utc).isoformat(),
    "python": sys.version, "platform": platform.platform(),
    "script_sha256": sha256(Path(__file__).read_bytes()).hexdigest(),
    "input_sha256": input_hashes,
    "scope": "Exact finite checks only; all-orders enormous-graph existence is an ordinary analytic proof.",
    "base": {"vertices": vertices, "edges": sorted(edges), "full_triangles": triangles,
             "cyclic_triangle_conflicts": conflicts, "edge_triangle_multiplicity_histogram": dict(incidence_counts),
             "exact_optima": base, "explicit_packing": explicit_packing, "explicit_cover": explicit_cover},
    "sufficient_orders": {"count": len(pattern_orders), "total_nine_orders": factorial(9),
                          "probability": rational(p), "all_resource_incidence_isomorphisms_checked": True,
                          "optima_histogram": {str(k): v for k, v in pattern_values.items()},
                          "order_stream_sha256": pattern_digester.hexdigest(),
                          "claim_of_all_bad_orders": False},
    "natural_order_control": natural_order,
    "constants": {"N": str(N), "M": str(M), "expected_bad_blocks": rational(mu),
                  "delta": rational(delta), "pair_union_bound": rational(pair_union),
                  "triple_union_bound": rational(triple_union),
                  "coarse_expected_defects": rational(expectation_coarse),
                  "markov_failure_bound": rational(expectation_coarse / delta), "checks": checks},
    "assembly_control": {"vertices": len(assembly_vertices), "block_maps": block_maps,
                         "edges": len(assembly_edges), "triangles": len(assembly_triangles),
                         "exact_optima": assembly_optima, "augmented_edges": len(augmented_edges),
                         "augmented_triangles": len(augmented_triangles), "added_edge_count": len(added_edges),
                         "full_augmented_conflict_connected": True,
                         "old_resource_restriction_tests": restriction_tests,
                         "ordinary_cover_valid": True,
                         "finite_control_asserts_Tuza_via_this_cover": False},
    "berge_triangle_negative_control": {"pairwise_linear": True, "block_triangles": len(berge_expected),
                                         "full_triangles": len(berge_full),
                                         "unintended_triangles": sorted(berge_full - berge_expected)},
    "elapsed_seconds": time.monotonic() - START,
}
output = ROOT / "evidence" / "check_a.json"
output.write_text(json.dumps(receipt, indent=2) + "\n")
signal.alarm(0)
print(json.dumps({"status": receipt["status"], "receipt": str(output),
                  "sufficient_orders": len(pattern_orders), "base_nu_tau": [base["nu"], base["tau"]],
                  "exact_parameter_checks": len(checks), "elapsed_seconds": receipt["elapsed_seconds"]}, indent=2))
