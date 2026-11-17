> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two full apices on each disjoint triangle supply twice as many pages

Status: ORDINARY_PROOF_CANDIDATE; independent reconstruction of the coordinator's combinatorial candidate. TUZA-22 challenger, 2026-11-16 local date. Availability of the two full apices is an explicit hypothesis.

## Statement

Let T_1,...,T_t be pairwise vertex-disjoint actual triangles in a finite simple graph. For each i, let x_i,y_i be distinct vertices outside T_i, each adjacent to all three vertices of T_i. The apices may lie in other triangle cores, and the same vertex may serve as an apex at several cores. Then there are2t pairwise edge-disjoint actual triangles, two pages on each T_i, one with apex x_i and one with apex y_i.

These pages are private relative to C_0=the union of the core-triangle edge sets. No assertion of privacy relative to a larger unspecified cover is made. If C_0 happens to be a minimum triangle cover, the packing gives tau=3t<4t<=2nu for t>0.

## Excluded labels and the complete conflict list

For a slot at core i with apex x, choose an excluded vertex e_i(x) in T_i, and take the page on the opposite core edge. Require the two slots of each core to have distinct excluded vertices. Their core edges then differ, and the two apices differ, so the two local pages share no edge.

Across distinct cores i,j, core edges cannot coincide, and a core edge cannot equal another page's spoke because its two endpoints lie in the same core. Two spokes can coincide only in the reciprocal situation x in T_j is an apex for i and y in T_i is an apex for j. In that case the only possibly shared edge is xy. It is avoided exactly when

    e_i(x)=y OR e_j(y)=x.

Thus the displayed reciprocal constraints, together with distinct local excluded labels, describe every possible edge intersection. Common external apices cause no extra intersections because their core endpoints are disjoint.

## The mutual-core graph

Join i,j when there is at least one slot from i into T_j and at least one slot from j into T_i. Let d_ij in{1,2} count the slots directed i to j. Each core has only two slots, so the undirected mutual-core graph has maximum degree2. If d_ij=2, vertex i has no other mutual neighbor.

An edge of type2,2 is an isolated component. Write i's apices as x_1,x_2 in T_j and j's as y_1,y_2 in T_i. Set

    e_i(x_1)=y_1, e_i(x_2)=y_2,
    e_j(y_1)=x_2, e_j(y_2)=x_1.

All four reciprocal constraints are covered, and both local pairs of labels are distinct.

Now consider a type2,1 edge, with i the double-slot leaf. Write its apices x_1,x_2 in T_j and j's reciprocal apex y in T_i. Its two constraints are equivalent to requiring j's reciprocal excluded label to belong to {x_1,x_2}, followed by an appropriate choice at i. Indeed, if j excludes x_1, set e_i(x_2)=y and choose e_i(x_1) different from y; the symmetric choice handles x_2. Conversely, if j excludes neither x_1 nor x_2, both i slots would have to exclude y, violating distinctness.

Therefore every double-slot leaf can be removed temporarily and represented by a two-element allowed-label set on its neighbor's reciprocal slot. It will be completed after that label is chosen. The case1,2 is symmetric.

## Satisfying the remaining constraints

After setting aside2,2 components and removing double-slot leaves, every remaining mutual edge has type1,1. Components of these edges are paths, cycles, or isolated vertices. Orient each cycle cyclically and each path consistently from one endpoint to the other. For an edge oriented toward j, make j's corresponding slot exclude the opposite core's reciprocal apex. This satisfies that edge's constraint.

Every remaining vertex receives at most one such fixed-label requirement. A vertex with a fixed label can have at most one removed double-leaf neighbor, because its original mutual degree was at most2. If it has that additional two-element constraint, choose a label from that set different from the fixed label. If it has no fixed label and two removed double-leaf neighbors, its two allowed sets both have size2 in a three-element core, so distinct representatives exist. One allowed set alone or a fixed label alone leaves the other slot free to receive a different label. Vertices with no requirements choose any two distinct labels.

Finally complete every removed double-slot leaf as described above. All local slot pairs are injective and all reciprocal constraints are satisfied. The exact conflict list then proves that the2t selected pages are pairwise edge-disjoint. QED.

## Boundary

This is a global compatibility proof for a supplied full-apex configuration, with arbitrary reciprocal interactions and outside apices. It does not derive two full apices from minimum-cover optimality, criticality, a maximum packing, or a residual classification. No finite census or abstract hypergraph substitution is used.
