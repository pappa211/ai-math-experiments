> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Combined CS from a perfect actual triangle-intersection graph

Frozen v1, 2026-11-16. Status: ORDINARY_PROOF_CANDIDATE, fresh review requested. This is a sufficient class theorem using actual triangle closure and a classical perfect-graph minmax whose needed proof is already supplied and freshly reviewed in this workspace. No historical-priority claim is made, and no general perfection availability is asserted.

## Statement

For a finite simple graph G, let X(G) have one vertex for every actual G triangle and adjacency when two such triangles share a graph edge. Suppose X(G) is perfect: every induced subgraph has chromatic number equal to clique number. Then τ(G)≤2ν(G), with equality if and only if all nonempty triangle components have literal K4 support. Arbitrary triangle-free background and shared graph vertices are allowed.

The class is edge-subgraph hereditary. For H⊆G, every actual H triangle is an actual G triangle, and intersections between surviving triangles are unchanged. Thus X(H) is the induced subgraph of X(G) on the surviving triangle vertices.

## Perfect-graph input at its proved scope

Section3 of `notes/challenger_forest_external_minmax_v1.md` proves that a perfect graph Y has a cover of its vertices by α(Y) cliques. Its self-contained proof uses adjacent-twin replication, then replication counts from all maximum independent sets to find a clique meeting all such sets, followed by induction. It was independently checked in `review/forest_external_minmax_independent_review.md`. No unproved strong-perfect-graph characterization is used here, and the definition of perfection is the explicit graph-class hypothesis.

An independent set in X(G) is exactly an edge-disjoint triangle packing, so write k=α(X(G))=ν(G). Choose a cover of the triangle vertices by k cliques Q1,...,Qk. Overlaps between these cliques are allowed and cause no difficulty; alternatively they may be trimmed to a partition.

## Actual clique families cost one or two graph edges

Every Qi is a pairwise edge-intersecting family of actual graph triangles. Such a family either has a common graph edge, or its union is the six edges of a literal K4 and it consists of three or four of its faces. To verify the latter alternative, start with triangles abc,abd. A triangle meeting both but avoiding their common edge ab must be acd or bcd. These three faces supply all six K4 edges. Any further triangle meeting all three either is another K4 face or would need to share their nonexistent common edge; a direct endpoint check excludes an outside vertex. Actual closure supplies the fourth K4 face in G even if it was assigned to another clique.

A common-edge family, including a singleton, has a one-edge cover. Every other Qi has a two-edge cover, and we may cover its entire literal K4 by a pair of opposite edges. Thus τ(G)≤2k. If any Qi is a common-edge family, this construction already gives τ(G)≤2k−1.

## Equality forces disjoint literal K4 supports

Assume τ(G)=2k and k>0. Every chosen Qi therefore has a literal K4 support. If two of these supports share a graph edge e, choose for each of those two K4s an opposite-edge-pair cover containing e. Their union uses at most three edges. Use arbitrary two-edge covers for all other supports. Since every actual triangle belongs to some Qi, this covers G with at most 2k−1 edges, contradiction.

Consequently the k K4 supports are pairwise edge-disjoint. Every actual triangle lies within one of them, because every triangle vertex was covered by the Qi. Their actual four-face families are therefore exactly the nonempty triangle components. Conversely a union of these literal triangle components has packing k and covering 2k by additivity over their disjoint graph-edge supports. If G has no triangles, both parameters are zero and the statement is vacuous.

This proof accounts for all actual crossing triangles: the clique cover assigns every one, and the final disjoint-support conclusion excludes any additional component interaction through shared edges. It does not confuse graph-vertex sharing with triangle adjacency.

## Available role and limits

Any nonclassified graph with perfect X(G) has the integer strict inequality τ(G)≤2ν(G)−1. Literal K5 is outside the class: its triangle-intersection graph is the line graph of K5, whose clique number is four but whose chromatic number is at least five, because each color class is a matching with at most two of the ten K5 edges.

This hereditary class may be used as a base in the reviewed high-codegree four-core localization theorem. Under the original H-D premises, one triangle residual with perfect actual triangle-intersection graph is tight and hence classified, so the accepted one-classified-residual theorem supplies an H-D blocker. Neither application gives perfection for an arbitrary graph or residual.

No claim is made here about inclusion relations with the rainbow edge-three-color class. The proof architecture is different: it uses a minimum clique cover of the actual triangle intersection graph, graph-endpoint closure of each nonbook clique, and a simultaneous cover-overlap saving. No finite computation, census, graph-realization oracle, or external topological theorem is a premise.
