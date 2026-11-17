> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A mixed matching and private-list selection for minimum tree cover components

Status: ORDINARY_PROOF_CANDIDATE; frozen for fresh review. This is a selection lemma, not yet an edge-disjoint triangle packing theorem. The remaining chord conflicts are stated explicitly.

## 1. Elementary abstract lemma

Let F be a clique-block graph and J a graph on the same vertex set. Give each vertex finite color lists. For S subset V(F), define h(S) as the sum over colors c of the largest independent color-c set in F[S]. Suppose

    h(S)>=|S| whenever S is independent in J.

Choose ANY maximal matching M in J. Its unmatched vertex set U is independent in J, so every subset S of U obeys the displayed Hall condition. The induced graph F[U] is still a clique-block graph. The ordinary clique-block Hall-list theorem therefore properly colors every vertex of U from its list.

Thus V(F) is partitioned into the endpoints of a J-matching and a properly list-colored remainder. No matching matroid or new generalized Hall theorem is needed. The only imported combinatorial lemma is the self-contained clique-block Hall theorem already proved in notes/one_sided_forest_exact_packing_v1.md.

## 2. Application to one tree component of a minimum triangle cover

Let C be a minimum triangle-edge cover of G and let T be one selected-edge component that is a tree, with A=V(T). Let G0 be the actual triangle-family support assigned to this component. Every actual triangle of G0 is assigned to T, by the same selected-edge support-closure argument used for the star component.

An internal triangle (entirely in A) has one or two T-edges; it cannot have three because T is a tree. Every outside page has one T-edge. On vertex set E(T), define J by joining two T-edges when they form the two selected edges of an internal triangle. Let F be the line graph of T, so F is a clique-block graph and J is a subgraph of F.

For each base e in T, let its list consist of the apices of all PRIVATE triangles whose only selected edge is e. These apices may lie in A or outside A. For S subset E(T) independent in J, every internal two-selected-edge triangle retains a selected edge in T minus S. The only triangles that lose their selected coverage when S is removed are therefore private pages on bases in S.

For each possible apex b, take a minimum vertex cover of the forest formed by the bases in S that list b, and select the corresponding spokes at b. Along with C minus S, these spokes cover every actual triangle of G. All such spokes are actual graph edges; counting a duplicate spoke twice only overestimates the replacement cost. Since each color-specific base graph is a forest, its vertex-cover number equals its matching number. Minimum optimality of C therefore gives

    h(S)=sum_b matching_number(S_b)>=|S|

for every J-independent S. This is exactly the hypothesis of Section1.

Choose any maximal J-matching M. It supplies a family I of internal two-selected-edge triangles. These triangles are edge-disjoint: their T-edges are distinct by matching, and two different such triangles cannot share a non-T chord, since the two length-two T-paths between its endpoints would create a cycle in T. Every unmatched T-base can then be assigned one private page by a proper edge-list coloring of the unmatched forest edges.

The selection accounts for all T-bases: each I triangle accounts for two bases, and each listed page for one. It is not necessarily a packing, because a listed private page can meet the non-T chord of an I triangle, or two internal listed pages can meet reciprocally.

## 3. Exact remaining collision geometry

A private internal triangle has one T-edge and two non-T spokes. At most one of those spokes can be the chord of a two-T-edge triangle. In the bipartition of T, the two endpoints of its base have opposite colors, so exactly one of its spokes has endpoints of the same color. Only that spoke can have T-distance two. Uniqueness of a T-path then gives at most one two-T-edge triangle using it as a chord.

For a fixed chord of an I triangle, at most two properly selected private pages can use it: one whose apex is each chord endpoint. Two with the same apex would have incident T-bases and violate proper edge coloring. If two such pages occur, they and the I triangle all share that chord; their conflict is a literal three-page book, not a missing reciprocal-pair condition.

For illustration, take the selected tree

    T={au,ub,ac,bd},

and nonselected internal edges {ab,bc,ad}. The actual internal triangles are abu,abc,abd, all sharing ab. Select I={abu}; the unmatched bases ac,bd have private pages abc,abd, with distinct colors b,a, so the mixed selection exists. Its three chosen triangles form a conflict clique and do not pay all four bases when only one can be kept. Here T is NOT a minimum ordinary cover: {ab} covers every triangle. This is therefore a boundary for the selection lemma alone, not a counterexample to the weighted minimum-TREE target. Full ordinary-cover optimality must be used again to repair these chord-book conflicts.

## 4. Role, finite diagnostic, and remaining target

The missing weighted TREE claim is: a tree component T of a minimum ordinary triangle cover has an assigned-family packing with2 times the number of internal triangles plus the number of outside pages at least |E(T)|. Section2 supplies a mixed selection at exactly the desired base accounting, but Section3 prevents promoting it to a packing.

The preliminary abstract discriminator scripts/challenger_mixed_hall_probe.py checked35,408 two-color states on a five-vertex bowtie clique-block graph and paths of order four and five, using every triangle-free J subset. All3,420 Hall-passing states admitted the mixed selection; there were no failures or UNKNOWN. Evidence: evidence/challenger_mixed_hall_probe.json. The monitored run lasted0.122 seconds. This computation is a redundant diagnostic after the elementary proof in Section1 and is not a premise of any all-size claim.

The next mathematical obligation is to use ordinary minimum-cover exchange to repair the literal chord-book components. The K4 face-apex counterexample remains outside the tree hypothesis and is not altered by this selection result.
