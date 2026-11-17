> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh challenger review of the packing-four density interface

Verdict: ACCEPT the ordinary density reduction and its conditional assembly with the separately reviewed near-bipartite packing lemma. The stated minimum-cover hypothesis is essential to this proof and is retained. No Gyori theorem, computational census, or numerical guess is used.

I reconstructed the shortest-odd-cycle estimate directly. A shortest odd cycle is chordless; in a triangle-free graph an outside vertex has at most floor(l/2) neighbors on its l-cycle. Mantel bounds the graph outside that cycle. For total order12 the four possible odd lengths5,7,9,11 give the stated maxima31,28,23,16. Therefore a triangle-free 12-vertex graph with at least32 edges is bipartite.

For a dense subgraph J on8 through11 vertices, restricting a minimum8-cover of G leaves a triangle-free graph with at least20,24,27,31 edges, respectively. These strictly exceed the four Mantel thresholds. Thus any average-degree-seven obstruction to mad<7 occupies all12 vertices and forces at least42 graph edges. Removing the actual8-cover leaves at least34 edges.

Bipartite H with12 vertices and at least34 edges has only the part sizes6+6 or5+7. Minimum-cover optimality proves every omitted actual G edge is internal: an omitted cross edge could be added to H without a triangle, contradicting the cover optimum. This establishes precisely all hypotheses of notes/challenger_near_bipartite_five_packing_v1.md, with no inferred triangle-closure assumption.

The scoped conclusion n<=12, tau=8, nu<=4 implies mad<7 follows after the five-packing lemma. The final CS/HD corollaries additionally need the separately authenticated class-independent M0/M3/SIX inputs, the cover kernel, triangle-plus-matching theorem, and sparse-class T0. The within-hereditary-class minimality in section4 is logically appropriate; it does not rely merely on the order of a global minimum failure.

This is an internal independent proof review, not Lean verification or a historical priority claim.

Reviewed source SHA256: 80b7c3f19af47af40d95f717039b0fc5f3fcfe2b934b9824bceea521cd8e6e07
UTC: 2026-11-15T22:45:49.029583+00:00
