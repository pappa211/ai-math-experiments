> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: triangle-free unicyclic remainder of deficiency one

Verdict: ACCEPT at the stated ordinary local scope. Primary notes/apex_unicyclic_triangle_free_deficiency_one_exclusion_v1.md, SHA2cff47fc67a9337acadcde64590d221dc956f50d857de3f144c44d72738fac7f. Reviewer: challenger, 2026-11-16 UTC. Triangle-free applies to F, not automatically to L.

The exposable original leaf z supplies wz by link minimum degree. P=M+{wz} has r+1 edges, and the complement R=F-M has r+1 edges. The accepted pseudoforest complement-cover lemma gives a cover of size at most r; any further saving makes the tuple strict, so the exact one-unit-saving classification is applicable after balanced accounting.

The support audit correctly singles out e0, the ORIGINAL leaf edge. Every other R-edge has neither endpoint z. A second codegree page cannot have its apex in F because F is triangle-free; if the apex is w, neither spoke is the deleted wz; if outside L, no spoke is a deleted F matching edge or hub edge. Another h-link component cannot supply an adjacent apex by closedness. Thus every other R-edge really is triangle-supported in K. The note makes no invalid support claim for e0.

For a supported vertex-cover-critical edge e, choosing a minimum B(K) cover containing e and using P, hw, and a cover of R-e covers ALL lost triangles at the stated2nu(G)-1 cost. In particular every arbitrary outside page on a deleted P edge retains that edge as its cover, including the edge wz. This is a valid cover-overlap contradiction rather than a packing-count shortcut.

The component classification is exact. K3 is excluded by triangle-freeness; P4 has two distinct critical end edges; every isolated edge is critical; P3 has no critical edge. Hence only P3 with at most one isolated edge survives the formal restrictions, forcing r<=2. Connected triangle-free unicyclic noncycle order is at least five, so r=2 and F is C4 plus a leaf. The maximum matching exposing that leaf is a perfect C4 matching; its complement places e0 in the P3 and leaves the OTHER cycle edge isolated and critical. That edge is distinct from e0 and supported, giving the final contradiction.

This establishes the exact deficiency-one theorem without finite enumeration, Kotzig or general matching decomposition. The final progress statement combining it with a full perfect-remainder exclusion is conditional on that separately accepted result; this review does not silently establish an uninspected larger assembly. Nonperfect deficiency at least two remains outside this note.
