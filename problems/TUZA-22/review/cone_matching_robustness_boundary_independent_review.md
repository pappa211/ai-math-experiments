> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: matching/robustness cone boundary

2026-11-16. Source_audit. ACCEPT, ordinary exact scope.

Frozen source reviewed: notes/challenger_cone_matching_robustness_boundary_v1.md, SHA256 687c494c1ff6e664b62839d4c4db4be15a624be89dd326633a0dc944fd07e447.

I reconstructed L as a K4 and a K3,4 sharing the larger-part vertex d. The displayed perfect matching has five edges, and deleting it leaves the K4 four-cycle plus a bipartite graph. Q={d,a,u1,u2,u3} covers that residual.

All rim triangles lie in the K4, and two such triangles always share an edge. Removing any rim triangle leaves no perfect matching: for the triangle avoiding d, three vertices have only d available; for a triangle containing d, its other two vertices both have only the fourth K4 vertex available. Thus the cone has triangle packing number exactly five. This proves the universal maximum-matching/rim-triangle intersection assertion without assuming it from the displayed matching.

The cone triangle family is precisely a literal K5 and a triangle-free bipartite cone, sharing only hd. Their cover numbers are four and three. Every three-edge cover of the bipartite cone avoids hd, because three displayed edge-disjoint pages already require three other edges. Thus a six-edge union cover cannot exist, whereas the displayed seven-edge union cover does, proving tau=7.

All vertex-deletion claims also hold. Deleting d yields K3 and K3,3. Other deletions leave a connected graph containing an intact multicyclic bipartite piece, or K2,4/K3,3 after the corresponding bipartite deletion. Every resulting component is cyclic and the deletion graph is never a pseudoforest.

This is a counterexample only to the stated characterization from matching and link robustness alone. Its cover slack 7<10 and its safe K5 boundary at hd prevent it from satisfying the minimum-CS tightness package. It does not challenge the accepted TF-residual WKE theorem. No computation or external theorem was used in this review.
