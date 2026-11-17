> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Role-assignment controls and status repair

Frozen for independent review. Original role.py is preserved in sources/claude_programs; its source hash will be checked at closeout. scripts/role_status_corrected.py changes only status discipline: never query values unless status is OPTIMAL or FEASIBLE; require the baseline ordinary packing optimum before using its size; propagate missing incumbents as UNKNOWN. A feasible larger role family still licenses a valid blocking constraint, but a feasible-only small role family never certifies success. The patch is evidence/role_status_correction.diff. ORTools is absent from the pinned Python; the patched original algorithm is NOT_RUN, no installation attempted. A mock status test checks the repaired control flow but is not a solver replay.

## Ordinary K5 obstruction

Suppose triangle-by-triangle role bijections make the maximum role-disjoint family equal to the ordinary nu(K5)=2. Two triangles abc and abd share ab. The triangle cde is edge-disjoint from both. Therefore the two occurrences of ab must receive the same role, or these three triangles form a role-disjoint family. Relabeling proves that every graph edge has one consistent role across all its incident triangles. The four edges incident to a vertex of K5 must then have four distinct roles, because any pair lies in a triangle and each triangle's three edges must have different roles. Three roles cannot suffice. Thus no assignment achieves2. This is a self-contained ordinary obstruction; no SAT outcome is a premise.

## K2 joined to C5

The graph has rim0..4, hubs5,6, all ten hub-rim edges and edge56. Its15 actual triangles have ordinary nu4 and tau6 (explicit witnesses in evidence/role_forced_constraints.json). A pure-Python independent method encodes every5-triangle family: at least one pair sharing a graph edge must give that edge the same role in both triangles. These are exactly the conditions forbidding a role-disjoint family of size5.

scripts/role_k2c5_csp.py constructs all3003 families from the actual graph, reduces duplicate/superset clauses without changing solutions, and searches permutation domains with sound equality propagation. Global role permutation fixes the first triangle's bijection to0 without loss. It obtains UNSAT_EXHAUSTIVE in15 search nodes (8 failed nodes), with41 minimal clauses. Thus every role assignment has a role-disjoint family of at least5, exceeding ordinary nu4. This is a finite exact computation awaiting a fresh independently implemented checker, not an ordinary universal theorem. The 120-second timeout would produce UNKNOWN_TIMEOUT, never UNSAT.

The earlier forced-pair-equality relaxation alone was satisfiable for this graph and is explicitly insufficient; evidence/role_forced_constraints.json preserves that result. It proves the K5 obstruction but does not prove the K2-join-C5 obstruction by itself. The full five-family constraints supply the latter. Neither graph is a Tuza counterexample. No full claimed connected-graph role census is reproduced.
