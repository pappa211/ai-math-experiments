> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: tight-component boundary confinement

**PASS at the stated hypotheses.** Reviewed `notes/residual_matching_component_confinement.md`, SHA-256 `18834cbf2159411947e6086e172fe2a934b25a086f5d7a028ce7b2894ed71abc`. The exact cover formula, arbitrary vertex sharing, retained background, and resilience descent all check. This is an actual triangle-region transfer; it does not prove a fresh gluing certificate or classify the retained region.

## Complete boundary accounting

For an external-apex restored page abz with z outside A, a completing K4 cannot contain both disjoint matching edges ab,cd: those four endpoints would already exhaust its vertices. Thus its K4-ab diamond survives wholly in R=J-M. That diamond belongs to one R triangle component containing a,b. It cannot be a tight literal clique component because ab is absent, so it lies in the unique active component C. Both old page spokes therefore lie in C. The cd case is identical.

Every J triangle absent from R uses exactly one matching edge, since the two are disjoint. If its apex is in A, its old edges are A-crossedges. A new x-page has only its base as an old edge, and a matching-edge base does not belong to R. Old R triangles in different components share no edge. These cases exhaust every H triangle and prove that any Q edge used by an outside triangle is among ac,ad,bc,bd.

A literal Q cannot contain both a,b or both c,d because those edges are absent in R. It contains at most two A vertices, one from each pair, hence at most one crossedge. If it had no outside triangle boundary, its triangles would remain a separate H component, contradicting connected H support and the presence of active C. Thus every Q boundary consists of exactly one edge. Different R components have disjoint edge supports, so the boundaries are distinct and there are at most four tight components. Arbitrary shared vertices do not change this edge-based argument.

## Exact graph and packing transfer

Delete only each Q's nonboundary edges. By definition none of those edges occurs in an outside triangle. Conversely the one retained Q edge cannot support any Q triangle. Therefore the actual triangles of K are exactly all outside H triangles, with none lost and none created. All vertices and background edges remain.

Choose a maximum packing in each Q avoiding its sole boundary edge. Its used edges are outside K and disjoint from every other Q. Append these packings to any K packing. In the opposite direction, partition an arbitrary H packing into its Q triangles and outside triangles. These two bounds give nu(H)=r+nu(K).

For every e in E(K), the same argument gives nu(H-e)=r+nu(K-e). If e is a boundary edge, the corresponding Q still has a maximum packing avoiding it; all other Q packings are unchanged. If it is not a boundary edge, it lies in none of the removed Q edge sets. Hence H one-edge resilience implies K one-edge resilience, including for boundary edges. Exact additivity also proves the conditional inheritance of every-triangle extension by restricting a maximum H packing containing a prescribed K triangle.

## Exact cover transfer

Fix the restriction D of a prospective H cover to E(K). It must cover K. Its intersection with a given Q is either the sole boundary edge f_Q or empty. A minimum K4/K5 cover can be chosen both to include f_Q and to omit it. Therefore the optimal additional cost in Q's removed edges is exactly 2nu(Q)-1 if f_Q belongs to D, and 2nu(Q) otherwise. The lower bound follows by restricting any H cover to Q; the corresponding local covers attain it. Edge-disjoint Q supports allow all choices simultaneously, irrespective of shared vertices.

Thus tau(H)=2r+min_D(|D|-|D intersect F|). Every F edge has zero cost in this objective and can be included freely. Once all F are selected, precisely the actual triangles of K-F remain to be covered with unit-cost edges. Therefore

    tau(H) = 2r + tau(K-F).

This does not assume that one unmarked minimum K cover contains all boundary edges. The zero-cost minimization is what makes the simultaneous formula valid.

## Connectivity, retained K5, and limits

All outside triangles adjacent to a removed Q use the same boundary edge, so they are already mutually connected in K through that edge. Such a Q cannot connect two different K triangle components. Connected H support therefore forces connected K support. K is nonempty: every A triangle uses a matching edge absent from R and every x-triangle is new, so none belongs to a Q piece. All triangles and edges of the literal K5 on A union {x} survive.

When H has defect one, exact accounting yields tau(K-F)=2nu(K)-1. Monotonicity and the explicit CS(K) premise give tau(K) between that value and 2nu(K), hence defect zero or one. CS does not classify K in the defect-one case. If at least one Q is removed, it loses five or nine private support edges, so supported-edge count strictly decreases. If there are no tight pieces, K=H and no descent occurs.

The retained graph may share additional vertices with each Q and may retain substantial background. A single triangle-boundary edge is not a statement that the full vertex overlap consists of its endpoints. Reconstructing through F, proving family membership, or excluding a zero-gain parent still requires a further argument. None is implied by this transfer alone.

No mathematical discrepancy remains in the frozen proposition. No numerical or external theorem is needed beyond the explicitly cited clique parameters, component accounting, and proper-CS premise.
