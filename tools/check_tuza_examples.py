#!/usr/bin/env python3
"""Independent exact checks of fixed TUZA-07--10 examples, standard library only.

Usage: python3 tools/check_tuza_examples.py --output /tmp/tuza-examples.json
No discovery solver is imported. The domain is the explicitly named graphs,
cover-subset levels, matching sets and edge colorings recorded in the receipt.
This is neither a graph census nor a proof of an unrestricted conjecture.
"""
from __future__ import annotations

import argparse
from datetime import datetime, timezone
from fractions import Fraction
from itertools import combinations, product
import json
from pathlib import Path
import signal
import time

_DEADLINE = float("inf")


def bounded() -> None:
    if time.monotonic() >= _DEADLINE:
        raise TimeoutError("fixed-example check exceeded its wall-clock limit")


def parse_edges(s: str) -> set[tuple[int, int]]:
    return {tuple(map(int, edge)) for edge in s.split()}


def full_triangles(n: int, edge_set: set[tuple[int, int]]):
    return [t for t in combinations(range(n), 3)
            if set(combinations(t, 2)) <= edge_set]


def exact_graph(n: int, edge_set: set[tuple[int, int]], expected: tuple[int, int]):
    """Direct subset lower/upper tests; parity is an optional packing upper bound."""
    edge_list = sorted(edge_set)
    positions = {e: i for i, e in enumerate(edge_list)}
    triangles = full_triangles(n, edge_set)
    masks = [sum(1 << positions[e] for e in combinations(t, 2)) for t in triangles]
    nu, tau = expected
    cover = None
    upper_count = 0
    for candidate in combinations(range(len(edge_list)), tau):
        upper_count += 1
        if upper_count % 1024 == 0:
            bounded()
        mask = sum(1 << e for e in candidate)
        if all(mask & triangle for triangle in masks):
            cover = candidate
            break
    assert cover is not None, "claimed cover upper bound is missing"
    lower_count = 0
    for candidate in combinations(range(len(edge_list)), tau - 1):
        lower_count += 1
        if lower_count % 1024 == 0:
            bounded()
        mask = sum(1 << e for e in candidate)
        assert any(not (mask & triangle) for triangle in masks), "smaller cover found"
    packing = None
    packing_lower_count = 0
    for candidate in combinations(range(len(masks)), nu):
        packing_lower_count += 1
        if packing_lower_count % 1024 == 0:
            bounded()
        used = 0
        for i in candidate:
            if used & masks[i]:
                break
            used |= masks[i]
        else:
            packing = candidate
            break
    assert packing is not None, "claimed packing lower bound is missing"
    degrees = [sum(v in e for e in edge_list) for v in range(n)]
    odd_count = sum(d % 2 for d in degrees)
    # Unused edges retain degree parities of the original graph. At least
    # odd_count/2 unused edges are required, since each has two endpoints.
    parity_bound = (len(edge_list) - odd_count // 2) // 3
    packing_upper_count = 0
    if parity_bound > nu:
        for candidate in combinations(range(len(masks)), nu + 1):
            packing_upper_count += 1
            if packing_upper_count % 1024 == 0:
                bounded()
            used = 0
            for i in candidate:
                if used & masks[i]:
                    break
                used |= masks[i]
            else:
                raise AssertionError("larger packing found")
    bounded()
    return {
        "n": n, "edges": edge_list, "triangles": triangles, "nu": nu, "tau": tau,
        "cover": [edge_list[i] for i in cover],
        "packing": [triangles[i] for i in packing],
        "cover_lower_subset_size": tau - 1,
        "cover_lower_subsets_checked": lower_count,
        "cover_upper_subsets_checked_until_witness": upper_count,
        "packing_lower_subsets_checked_until_witness": packing_lower_count,
        "packing_upper_subsets_checked": packing_upper_count,
        "parity_packing_upper_bound": parity_bound,
    }


def fractional_certificate(case, primal, dual, multicover=None):
    """Check exact nonnegative triangle packing / edge cover with equal objectives."""
    edges = [tuple(e) for e in case["edges"]]
    triangles = [tuple(t) for t in case["triangles"]]
    assert set(primal) == set(triangles) and set(dual) == set(edges)
    assert all(v >= 0 for v in primal.values())
    assert all(v >= 0 for v in dual.values())
    for e in edges:
        assert sum(primal[t] for t in triangles if set(e) <= set(t)) <= 1
    for t in triangles:
        assert sum(dual[e] for e in combinations(t, 2)) >= 1
    value = sum(primal.values())
    assert value == sum(dual.values())
    result = {
        "nu_star_equals_tau_star": str(value),
        "fractional_packing": [{"triangle": t, "weight": str(primal[t])} for t in triangles],
        "fractional_cover": [{"edge": e, "weight": str(dual[e])} for e in edges],
        "method": "exact rational feasible primal and dual with identical objective",
    }
    if multicover is not None:
        assert set(multicover) == set(edges)
        assert all(isinstance(v, int) and v >= 0 for v in multicover.values())
        assert all(sum(multicover[e] for e in combinations(t, 2)) >= 2 for t in triangles)
        cost = sum(multicover.values())
        assert cost == 2 * value
        result["M2"] = cost
        result["multicover"] = [{"edge": e, "multiplicity": multicover[e]} for e in edges]
        result["M2_lower_certificate"] = (
            "For any integer two-cover m, sum(m) >= sum_T z_T*load_m(T) "
            ">= 2*sum_T z_T; feasibility of z was checked exactly."
        )
    return result


def cone(n, edge_set):
    return n + 1, set(edge_set) | {(v, n) for v in range(n)}


def run_checks():
    w7 = parse_edges("02 03 05 12 13 16 23 24 25 26 34 35 36 45 46")
    w8 = parse_edges("02 03 06 07 12 13 14 15 23 24 25 26 27 34 35 36 37 45 47 56 57 67")
    pair_a, pair_b = parse_edges("02 12"), parse_edges("03 13")
    cases = {"W7": exact_graph(7, w7, (4, 5)), "W8": exact_graph(8, w8, (6, 8))}
    for name, edge_set, n, pair_expected, cross_expected in [
        ("W7", w7, 7, (3, 3), None), ("W8", w8, 8, (5, 7), (6, 6))
    ]:
        for label, removed in [("A", pair_a), ("B", pair_b)]:
            cases[name + "-" + label] = exact_graph(n, edge_set - removed, pair_expected)
        if cross_expected:
            for a, b in product(sorted(pair_a), sorted(pair_b)):
                label = "{}{}-{}{}".format(*a, *b)
                cases[name + "-cross-" + label] = exact_graph(n, edge_set - {a, b}, cross_expected)
    # Complete minimum-cover family of the fixed W7 graph.
    w7_covers = [c for c in combinations(sorted(w7), 5)
                 if all(set(c) & set(combinations(t, 2)) for t in cases["W7"]["triangles"])]
    assert len(w7_covers) == 7
    assert not any(set(c) & pair_a and set(c) & pair_b for c in w7_covers)
    assert len([c for c in w7_covers if pair_a <= set(c)]) == 1
    assert len([c for c in w7_covers if pair_b <= set(c)]) == 1

    # Proper Petersen coloring and literal forced-coordinate row identity.
    classes = [parse_edges(s) for s in [
        "01 23 49", "04 12 38", "05 16 79", "27 58 69", "34 57 68"
    ]]
    petersen = set().union(*classes)
    assert len(petersen) == 15 and sum(map(len, classes)) == 15
    assert all(len(set().union(*(set(e) for e in color))) == 6 for color in classes)
    assert not full_triangles(10, petersen)
    assert (0, 1) in classes[0] and (1, 2) in classes[1] and (2, 3) in classes[0]
    assert (0, 3) not in petersen
    assert all(sum(v in e for e in petersen) == 3 for v in range(10))
    assert all(sum(Fraction(1, 3) for e in color) == 1 for color in classes)
    vertex_coeff = {0: 1, 1: 1, 2: -1, 4: -1, 5: -1, 6: -1}
    color_coeff = {0: 1, 3: 1, 4: 1}
    identity = [{"edge": e,
                 "coefficient": sum(vertex_coeff.get(v, 0) for v in e) +
                 sum(k for j, k in color_coeff.items() if e in classes[j])}
                for e in sorted(petersen)]
    assert all(r["coefficient"] == (3 if r["edge"] == (0, 1) else 0) for r in identity)
    assert sum(vertex_coeff.values()) + sum(color_coeff.values()) == 1
    independent_sets = [s for s in combinations(range(10), 4)
                        if not any(set(e) <= set(s) for e in petersen)]
    assert independent_sets
    assert not any(not any(set(e) <= set(s) for e in petersen)
                   for s in combinations(range(10), 5))
    rainbow, perfect = [], []
    for size in [4, 5]:
        for matching in combinations(sorted(petersen), size):
            if len(set().union(*(set(e) for e in matching))) != 2 * size:
                continue
            colors = [next(i for i, color in enumerate(classes) if e in color) for e in matching]
            if size == 5:
                perfect.append({"edges": matching, "colors": colors})
            if len(set(colors)) == size:
                assert size == 4, "rainbow perfect matching contradicts claim"
                rainbow.append(matching)
    assert len(perfect) == 6 and rainbow

    # Fixed K5/K6 singleton multicovers: all singleton-copy two-colorings.
    splitting = {}
    for n, zeros in [(5, {(0, 1), (2, 3)}), (6, {(0, 1), (2, 3), (4, 5)})]:
        edge_set = set(combinations(range(n), 2))
        singles = sorted(edge_set - zeros)
        triangles = [set(combinations(t, 2)) for t in combinations(range(n), 3)]
        assert all(len(t & set(singles)) >= 2 for t in triangles)
        feasible = 0
        for bits in product([0, 1], repeat=len(singles)):
            colors = dict(zip(singles, bits))
            feasible += all(len({colors[e] for e in t if e in colors}) == 2 for t in triangles)
        assert feasible == 0
        cases["K" + str(n)] = exact_graph(n, edge_set, (2, 4) if n == 5 else (4, 6))
        splitting["K" + str(n)] = {
            "zero_edges": sorted(zeros), "singleton_edges": singles,
            "unnormalized_cost": len(singles), "two_colorings_checked": 2 ** len(singles),
            "splits": feasible,
            "scope": "Feasibility and nonsplitting of this vector; M2 optimality is proved in the ordinary proof note.",
        }

    # Two disjoint C5 cones: integer optima and matching exact LP/M2 certificates.
    c5 = {(i, i + 1) for i in range(4)} | {(0, 4)}
    n, cone_c5_edges = cone(5, c5)
    two_cones = cone_c5_edges | {(a + n, b + n) for a, b in cone_c5_edges}
    cases["two-C5-cones"] = exact_graph(2 * n, two_cones, (4, 6))
    c = cases["two-C5-cones"]
    spokes = {(v, 5) for v in range(5)} | {(v + 6, 11) for v in range(5)}
    primal = {tuple(t): Fraction(1, 2) for t in c["triangles"]}
    dual = {tuple(e): Fraction(1, 2) if tuple(e) in spokes else Fraction(0) for e in c["edges"]}
    multicover = {tuple(e): int(tuple(e) in spokes) for e in c["edges"]}
    c["fractional_and_multicover"] = fractional_certificate(c, primal, dual, multicover)
    assert c["fractional_and_multicover"]["M2"] == 10
    assert c["fractional_and_multicover"]["nu_star_equals_tau_star"] == "5"
    assert c["tau"] > (10 + 1) // 2

    # Petersen cone: half-spoke dual and integral matching primal, both value 5.
    n, cone_p_edges = cone(10, petersen)
    cases["Petersen-cone"] = exact_graph(n, cone_p_edges, (5, 6))
    c = cases["Petersen-cone"]
    selected = {tuple(sorted((v, v + 5, 10))) for v in range(5)}
    primal = {tuple(t): Fraction(int(tuple(t) in selected)) for t in c["triangles"]}
    dual = {tuple(e): Fraction(1, 2) if 10 in e else Fraction(0) for e in c["edges"]}
    c["fractional"] = fractional_certificate(c, primal, dual)
    assert c["fractional"]["nu_star_equals_tau_star"] == "5"
    bounded()
    return {
        "status": "PASS",
        "scope": "Fixed named examples only; independent exact subset and row checks; no graph census, random search, Lean proof or CKSU implementation reproduction.",
        "cases": cases,
        "W7_minimum_covers": w7_covers,
        "petersen_colored": {
            "color_classes": [sorted(color) for color in classes],
            "uniform_fractional_weight": "1/3",
            "vertex_row_coefficients": vertex_coeff, "color_row_coefficients": color_coeff,
            "forced_identity_edge_coefficients": identity,
            "identity": "V0+V1-V2-V4-V5-V6+C0+C3+C4 = 3*x01 = 1",
            "forced_x01": "1/3", "vc": 6, "rho": 4,
            "independent_set_witness": independent_sets[0],
            "perfect_matchings": perfect, "rainbow_witness": rainbow[0],
            "graph_realizability_negative_control": {
                "path": [0, 1, 2, 3], "colors": [0, 1, 0],
                "missing_closing_edge": [0, 3],
                "scope": "Violates the necessary repeated-color path closure of the TUZA-09 graph-support representation.",
            },
        },
        "nonsplitting": splitting,
    }


def main() -> int:
    global _DEADLINE
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True, help="JSON receipt destination")
    parser.add_argument("--max-seconds", type=int, default=120, choices=range(1, 121), metavar="1..120")
    args = parser.parse_args()
    started = time.monotonic()
    _DEADLINE = started + args.max_seconds
    # Unix alarm enforces the bound even inside an accidentally lengthy loop;
    # portable monotonic checks also guard all substantial enumerations.
    def timed_out(signum, frame):
        raise TimeoutError("fixed-example check exceeded its wall-clock limit")
    if hasattr(signal, "SIGALRM"):
        signal.signal(signal.SIGALRM, timed_out)
        signal.alarm(args.max_seconds)
    try:
        receipt = run_checks()
        exit_code = 0
    except Exception as exc:
        receipt = {"status": "FAIL", "error_type": type(exc).__name__, "error": str(exc)}
        exit_code = 1
    finally:
        if hasattr(signal, "SIGALRM"):
            signal.alarm(0)
    receipt["checked_utc"] = datetime.now(timezone.utc).isoformat()
    receipt["elapsed_seconds"] = round(time.monotonic() - started, 6)
    receipt["wall_clock_limit_seconds"] = args.max_seconds
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(receipt, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"status": receipt["status"], "elapsed_seconds": receipt["elapsed_seconds"]}))
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
