> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Why a triangle residual cannot have defect zero

Clarification requested by the owner during the original TUZA-26 clock. Elementary accounting together with proper-subgraph CS gives defects 0, 1 or 2; zero is removed by a separate structural lemma, not by rounding or positivity.

**No-B lemma (PROVED_ORDINARY, independently reviewed).** If a finite simple graph Q satisfies nu(Q-D)=nu(Q)=k for every actual edge set D of size at most two, then for every actual triangle T, nu(Q-E(T))=k-1 and Q-E(T) does NOT satisfy B. No defect, connectivity, degree, CS, or minimum-Q assumption is needed for this structural lemma. B uses actual shared-edge triangle components with literal K4/K5 support; arbitrary background remains.

Proof source: notes/no_blocker_triangle_residual_v1.md, SHA-256 1b8687398d782e8e31c5da2048abe1511ffefe77e15fbd9fa51620ad27f61e49. Independent acceptance: reviews/opening_no_blocker_review.md. Its mechanism: in a hypothetical B residual, two-edge resilience makes all three restored-base page families nonempty. Distinct apices on different bases would append two pages over compatible old clique maxima, contradicting the one-unit packing increase. Hence all pages have one common apex, the new family is K4, and deleting two opposite edges of this K4 loses packing, contradicting two-edge resilience.

**Application to minimum Q.** For J=Q-E(T), proper-subgraph CS supplies tau(J)<=2nu(J), while cover extension gives tau(J)>=tau(Q)-3=2k-4. With nu(J)=k-1 this permits delta(J) in {0,1,2}. If delta(J)=0, proper-subgraph CS classifies J as B. The no-B lemma then gives a contradiction. Consequently delta(J) in {1,2}.

Two-edge resilience of minimum Q is now established by the independent noncircular composition in reviews/opening_composition_review.md. The fixed-G proper-subgraph CS premise and the archived extraction/restoration foundations remain explicit conditional dependencies. The later exclusion of defect ONE uses the separate reviewed triangle-plus-edge and named-triangle-restoration arguments; it is not part of this no-B lemma.
