> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: at most one selected cycle

Decision: ACCEPT, ordinary all-size inequality theorem. Full CS/equality for this class is correctly left open.

Frozen source: notes/one_cycle_cover_tuza_v1.md
SHA256: e17c80362c3916da953f3dd5041dd5b4b4c228a244e38c564265ac25ac97a77f

Deleting an edge of the unique selected cycle leaves a forest cover of the edge-deleted graph H. Actual H triangles formerly covered only by that edge cannot survive, so this restriction is valid without a minimum-cover assumption. The reviewed forest-cover CS theorem applies to H.

If H is strict, adding one edge to a cover and using integrality gives tau(G)<=tau(H)+1<=2nu(H)<=2nu(G). If H is tight, its actual triangle components are classified. A new triangle has its two old spokes in distinct old clique components, or in triangle-free background; otherwise their common clique would already contain the newly added edge. Maximum old block packings can avoid one specified spoke per component. Appending the new triangle raises packing by at least one while covering rises by at most one, proving strictness. If there is no new triangle, both parameters and the actual triangle component family are unchanged.

The claimed equivalence with adding at most one edge to a forest-cover graph is exact: adding an edge to a forest cover increases total cycle rank by at most one, even across components, and the added edge covers every newly created triangle.

For an unclassified equality graph, the tight-H branch is impossible. Equality in the strict-H chain forces both nu(H)=nu(G) and tau(H)=2nu(G)-1 for every admissible deletion edge. This exposes a defect-one extension problem; it does not solve it. No extra computation, optimum-cover hypothesis, or unrestricted induction is hidden in the proof.
