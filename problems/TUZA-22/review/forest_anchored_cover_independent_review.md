> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent adversarial review: existential forest anchor

Verdict: ACCEPT, ORDINARY PROOF at the exact existential scope. Reviewed2026-11-16 by source_audit. Frozen source `notes/challenger_forest_anchored_cover_v1.md`, SHA256 `0ee6da23aa6d2601604c10c5080e4f1be6378dab53b66d8e95f6d3367c9c2277`.

Before reading the frozen proof I independently reconstructed the leaf-induction interface and the three matching cases. The load-bearing condition is: when the link matching uses the selected parent vertex w, its auxiliary cover must contain w. This is supplied in every such case. The proof does not use CS, finite computation, Gallai–Edmonds, Konig, or Kotzig as an unproved premise.

## Elementary matching decomposition

For a fixed maximum matching in a forest, even and odd alternating paths reaching the same vertex would, after removing their common final tail, give an augmenting path between distinct unmatched roots. One root cannot have distinct routes in a forest. Thus even/odd/unreached sets are disjoint. Every even-reached vertex's neighbor is odd-reached: its matching edge is a predecessor edge, while each other edge extends the path and cannot return to an earlier vertex without a cycle. Every odd-reached vertex is matched and its mate is even-reached. Unreached vertices are matched internally. These facts prove exactly the decomposition used, without importing a stronger general-graph structure theorem.

For nonempty unreached Z, its induced forest has at most |Z|-1 edges. Removing its |Z|/2 matching edges leaves at most |Z|/2-1 edges; one endpoint per remaining edge supplies the strict saving. This works even when F[Z] is disconnected. Forest cover/matching equality is independently justified by the correct leaf recurrence, including isolated vertices.

## All pointed cases

If w sees an even-reachable u, flip the even path to expose u and add wu. A vertex cover of F minus that matching has size at most the original matching number; adding w pays the new matching edge and enforces the anchor. If w has no such neighbor but Z is nonempty, the strict saving inside Z pays for w in Q while M avoids w. If Z is empty, all w-neighbors lie in the odd-reached set A, which covers the forest and apex edges; M again avoids w. The cases include empty F and isolated vertices and require no minimum degree.

## Full-graph induction and anchor

At a selected forest leaf v with parent w, every link edge ab avoiding w must itself lie in C, because its triangle vab has neither spoke selected. Therefore the FULL link minus w is a forest. Deleting all v-edges and M strictly reduces the number of selected edges, so induction applies to the restricted forest cover.

Each appended hub triangle uses only deleted edges; M guarantees pairwise edge-disjointness. The local loss cover M plus vQ directly covers arbitrary outside pages on deleted rim edges, and meets every other lost triangle through its full-link edge. Thus all actual triangles are included.

A selected rim edge of a new packed triangle is in M and directly in D. The only selected spoke can be vw; it is used exactly when M meets w, and the pointed condition then places vw in vQ. The induction anchors every surviving packed selected edge. Counts give |D|<=2|I| for an existential packing, with no maximum-packing assertion.

## Weighted TREE consequence

A triangle cannot meet two cover components because any two of its edges share a vertex. Internal triangles on a tree component's vertex set are covered by that component; assigned external triangles have exactly one selected base and an apex outside that set. The accepted forest external-family minmax therefore applies to pages whose bases are outside D. Their packing is disjoint from I: internal selected bases are anchored in D, while every external spoke has an endpoint outside the internal vertex set.

Replacing the selected component by D plus an optimum external-family edge cover gives |C_i|<=|D|+q by minimum-cover optimality, even if replacement edges overlap retained cover edges. Hence 2|I|+q>=|C_i| is the required weighted target. This uses the separately reviewed minmax exactly at its outside-apex scope.

The stronger fixed-choice assertion tau(H-(C intersect E(P)))<=p1 for EVERY maximum/minimum-p2 P remains unproved. The new theorem neither assumes nor proves it; the earlier universal-choice guardrails remain valid. Arbitrary cyclic minimum-cover components remain outside this availability claim.
