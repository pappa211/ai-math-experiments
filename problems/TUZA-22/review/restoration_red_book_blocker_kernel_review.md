> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh reconstruction of the red-book blocker kernel

Reviewer: restoration agent, 2026-11-16. Result: ACCEPT at its conditional original-H-D scope.

Reviewed `notes/red_book_residual_family_and_blocker_kernel_v1.md`, SHAc5c231b93aee6ec9a620a0a2b341a2087ec399fea77d206486ce9914b007d813, using the separately reconstructed rerooting theorem and exact singleton cover count.

The residual family division is exhaustive by the unique red edge. Singleton red bases are deleted; an unused red base of a surviving triangle must be an actual paired-book opposite by all-choice geometry; all red vertices in unused-root trees have the full rerooting identity; and every remaining used paired base is in B0. The supports of distinct rooted trees are edge-disjoint because their red node sets are disjoint and all displayed blue supports are disjoint. No false whole-component conclusion is used.

For a regular slot, an outside H triangle meeting its K4 must therefore belong to a B0 page family. Its red base is outside that K4, so the shared K4 edge is a blue spoke incident with a B0 endpoint. A G triangle absent from H contains a singleton edge; because the regular K4 support is disjoint from every singleton edge, any shared K4 edge meets it at a singleton vertex. These two cases account for EVERY outside triangle and prove the boundary-at-X claim.

The star-boundary blocker is valid for a literal K4 without isolation. Its opposite face has no outside-triangle edge, so deleting that face kills all K4 triangles and retains every outside triangle. Deleting an opposite pair also kills every K4 triangle and may destroy additional outside triangles. Thus the stated actual triangle-family inclusion is in the correct direction, and original H-D supplies the packing bound. This uses the original universal triangle-deletion identity explicitly, not a CS-minimum identity.

In a blocker-free configuration every regular K4 contains at least two X vertices. No pair can occur in two regular supports, because the actual edge between it would then belong to both full K4 supports. The pair count is therefore legitimate despite arbitrary vertex sharing. The exact component count gives d-b=sum(r_i-1), hence exceptional slots<=2d-b. I checked the algebraic maximization: increasing b by one changes the right side by6s+4b>0, so b=d and then d=s-1 give the displayed quadratic bound.

The result is a parameterized necessary condition for every supplied P,Q, not a uniform bound on k. The uncontrolled families can have arbitrarily many pages, and no survivor lower bound or hidden isolation assumption is present. No computation or additional external result was used.
