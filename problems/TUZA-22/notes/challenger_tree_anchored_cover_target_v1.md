> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# The remaining weighted TREE problem as an anchored internal-cover target

Status: OPEN_CANDIDATE with ordinary reductions and a scoped finite discriminator. No all-size anchored-cover theorem is claimed.

## 1. Exact sufficient target

Let H be a finite simple graph and let C be a spanning tree on V(H) whose edges cover every H-triangle. The proposed internal statement is:

    There exist an edge-disjoint triangle packing I in H and a triangle
    edge cover D of H with C intersect E(I) subset D and |D|<=2|I|.

D may contain ANY actual internal graph edges, including non-C edges and C-edges unused by I. C need not itself be a minimum cover in this stronger sufficient target. The choice of I is existential. Neither an arbitrary prescribed packing nor all maximum packings are asserted to work.

For a minimum tree cover component in the original assigned graph, this statement would prove the weighted2-internal/1-external packing bound. Let A be its core vertices, H its induced internal graph, and m=|C|. Given I,D as above, consider outside pages on bases in C minus D. By notes/challenger_forest_external_minmax_v1.md, their minimum actual edge-cover cost equals their maximum packing q. The internal cover D plus such an outside cover covers the entire assigned family. Minimum ordinary-cover optimality gives m<=|D|+q. These q pages are edge-disjoint from I, because every C-base used by I belongs to D and outside spokes cannot be internal edges. Hence

    2|I|+q >= 2|I|+m-|D| >= m.

This implication is ordinary and all-size. The anchored existence statement itself is open.

## 2. Why allowing arbitrary internal D is essential

The stronger restriction D subset C is false even for a minimum selected tree: the internal three-page book on base ac with pages d,x,y and selected tree {ad,dc,ax,ay}, augmented by one dedicated outside page on each selected edge, has ordinary minimum selected cover size4. Its internal packing number is1, but any cover of its internal book restricted to C needs at least3 edges. Allowing arbitrary internal D repairs this example: choose a one-C internal page and cover by its selected base together with the common book edge ac.

Also, D cannot in general be confined to edges of I. In K4 with selected path01,12,23, packing I={013} has a valid anchored cover {01,23}. The second edge lies outside I. No two edges of triangle013 cover K4, and a prescribed two-C triangle such as012 cannot be anchored in a two-edge K4 cover because its two selected edges are adjacent. These controls preserve both the existential packing quantifier and the full cover domain.

The historical TUZA20 compulsory-gain witness contains a literal K5 and therefore admits no forest triangle cover: a bipartition of any selected forest leaves three K5 vertices in one color class, producing an uncovered triangle. Its different prescribed-support/gain obstruction cannot be imported as a counterexample to this target.

## 3. A rigorous residual reduction for a chosen maximum packing

Choose a maximum H-packing P that minimizes the number p2 of members containing two C-edges. Let p1 be the number containing one C-edge, and put

    S=C intersect E(P), so |S|=2p2+p1.

Every triangle has one or two C-edges because C is a forest cover. We claim that every triangle surviving in H-S meets a non-C edge of a one-C member of P.

First, two different two-C triangles cannot have the same non-C chord: their two length-two paths between its endpoints would be distinct paths in the forest C. Thus a surviving two-C triangle cannot meet any two-C P-member on a non-C edge. It cannot meet P on a C-edge either, because all those edges lie in S. Since P is maximum, it must meet a one-C P-member, necessarily on a non-C edge.

Next consider a surviving one-C triangle with base ab and third vertex c. At most one of its non-C spokes ac,bc can be a chord of a two-C triangle. In the bipartition of the C-tree, a,b have opposite colors, so at most one spoke has same-color endpoints and could be a length-two C-path chord. Uniqueness of the forest path permits at most one two-C completion on that spoke. If this triangle missed every one-C P-member, it would therefore either be disjoint from P, contradicting maximal size, or meet exactly one two-C P-member. Replacing that member preserves packing size and decreases p2, contradicting its extremal choice.

This proves the claim. Consequently the2p1 non-C edges of the one-C P-members cover H-S. The missing improvement is

    tau(H-S)<=p1.                                         (OPEN)

If it holds for some suitable P, then S plus a minimum residual cover is an anchored D of size at most2p2+2p1=2|P|. No bound on nu(H-S), pairwise-page decomposition, or two-choice Boolean model is inferred from the displayed2p1-edge cover. K4 demonstrates why a residual cover may need an unused C-edge rather than one edge from each packed triangle.

The stronger claim that the OPEN inequality holds for every maximum packing minimizing p2 has not been proved or tested exhaustively beyond the small domain below. Its failure would not automatically refute existential anchored existence.

## 4. Targeted finite discriminator and admission record

Reasons to pursue: the target implies weighted TREE through the now exact outside-page minmax; and its residual form exposes a concrete2p1-to-p1 covering question with all actual triangle edges retained. Risks: ordinary forest-cover CS does not imply this anchored joint choice; and a minimum internal cover or a fixed maximum packing may fail the anchor constraints even in K4.

The discriminator scripts/challenger_tree_anchor_probe.py considered all1,024 chord subsets on each of three fixed six-vertex selected trees: P6, a double star, and a fork with a longer arm. Every actual internal triangle was reconstructed, and masks for which the selected tree did not cover a triangle were rejected. For the1,761 valid tree-cover graphs it searched edge-disjoint internal triangle subsets and exact covers containing their forced C-edges. It found an anchored choice in every case, with no UNKNOWN. The monitored job lasted0.122 seconds at peak sampled RSS3.9375MiB. The K4/path3 control correctly distinguished the successful one-C triangle choices from the rejected two-C choices. Evidence is evidence/challenger_tree_anchor_probe.json.

This is only a finite discriminator at the stated domain. It does not establish the open anchored statement or the stronger extremal-P residual inequality. No larger passing census is proposed; the next work is ordinary chord-conflict exchange or a materially different literal falsifier.
