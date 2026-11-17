> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Why the doublecone cover-exchange control is fragile

Frozen ordinary diagnosis of the parent's prescribed seven-vertex control, 2026-11-16. This uses no new graph search or optimization. It does not assert that a general balanced exchange component has doublecone geometry.

Let Q be the join of the hub edge 23 with the five-cycle 0-1-6-4-5-0, and delete e=01. Then K is the join of 23 with path 0-5-4-6-1. The actual triangles are exactly: one hub together with a path edge (eight rim triangles), or both hubs together with a path vertex (five spine triangles).

A packing uses at most one spine triangle, since all spine triangles share 23. A packing without a spine triangle uses at most four rim triangles, one per path edge. Taking all four is possible by alternating their hubs along the path. Such a four-packing uses path edges45 and46, and uses both spokes24 and34 at the middle vertex4.

If a packing uses a spine triangle23x, it cannot use a rim triangle on either path edge incident with x: every such triangle uses one of 2x,3x. If x is an internal path vertex, at most two path edges remain available, so the packing has at most three triangles. Thus any four-packing with a spine triangle has x at an endpoint, and must use all remaining three path edges. Their hub labels must alternate. This again uses45,46 and both24,34.

Consequently EVERY maximum K packing uses each of24,34,45,46. These edges are packing-critical. Deleting any of them lowers nu from four to three: the upper bound follows from the preceding classification, and a three-packing is obtained by deleting the triangle using that edge from any four-packing. Thus the actual minimum-Q predecessor's single-edge resilience rules out this exact obstruction, without any invalid conversion of a cover-edge matching into a triangle packing.

## General path statement

More generally let D be the join of a hub edge ab with a path v0-...-v_l, with l>=3. Alternating hubs gives a packing of l rim triangles. A packing has at most one spine triangle, and if it has one at v_i it loses every incident path edge. Hence no packing exceeds l. Equality with a spine triangle is possible only at a path endpoint and then requires every other path edge.

It follows that every path edge other than the two endpoint edges is present in EVERY maximum packing of D. Such an edge exists for l>=3, so D is fragile. For l>=4, every path vertex at distance at least two from each endpoint contributes both hub spokes to every maximum packing as well. This is an all-size, ordinary exclusion of literal two-hub path predecessors under resilience.

This lemma requires the WHOLE actual triangle family of D to be the stated one. It cannot be applied to an induced path-shaped portion of K without a complete outside-triangle boundary argument or a paid response replacement. Arbitrary external triangles can protect these locally critical edges.

## Exact relation to the balanced exchange graph

For the prescribed K, the two page-pair minimum covers are

    F_2={02,12,24,35,36}, F_3={03,13,25,26,34}.

Their intersection is empty. Every actual K triangle contains exactly one F_2 edge, exactly one F_3 edge, and exactly one remaining edge. The remaining edges are {05,16,23,45,46}. Hence the bipartite disagreement graph admits an exact edge-color interpretation: a cross edge is labeled by the third actual graph edge of its triangle. Triangle packings are precisely matchings whose third-edge labels are also distinct. Ordinary perfect matchings need not satisfy this extra condition.

The label23 forms five pairwise disjoint cross edges, while each of05,16,45,46 labels two cross edges. The ordinary criticality proof above respects these collisions by working with actual rim/spine triangles. It explains the failure of the cover-only close-exchange principle in this control.

To promote this diagnosis to an operation in the unknown Q, one still needs to show that the forced balanced exchange component contains a region with the complete path response, and to account for ALL triangles crossing its boundary. The current component lemma alone supplies neither such a region nor a packing bound outside it. That availability step remains OPEN.

Sources: evidence/codegree_two_cover_falsifier_n7.json for the exact prescribed edge set and covers; notes/matching26_book_exchange_v1.md for the balanced-component definition. The supplied packing and cover optimum metadata are not needed for the ordinary packing-criticality proof above.
