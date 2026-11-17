> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Maximum-degree-two WKE residuals are excluded

Frozen ordinary corollary for fresh review, coordinator, 2026-11-16 UTC.

In a class-minimum CS failure, no WKE tuple P,Q in a closed link L can have R=L-P of maximum degree at most two.

Let r=|P|. Balanced accounting and residual-cover invariance give vc(R)=r and say that deleting any triangle-supported residual edge cannot lower vc(R). Components of R are paths, cycles and isolates.

Suppose an R component is an odd cycle C of length2m+1. Every edge e of C is vertex-cover-critical in R: its removal changes that component from a cycle of cover number m+1 to an odd-order path of cover number m, and other components are unaffected. Hence every edge of C is unsupported in the balanced residual K.

For a C edge xy, codegree at least two gives a second G page xyz besides hxy. Since the edge is unsupported in K, this page must be destroyed by P; its apex lies in L, and exactly one of xz,yz lies in P. The other lies in R. But x and y have their two R neighbors on the isolated cycle component C, so z lies in C. The P edge is therefore an internal chord of C joining vertices at cycle distance two.

For length three this is impossible: the required chord is already an R edge, disjoint from P. For odd length at least five, any distance-two chord supports at most two C edges (the two along its unique length-two cycle path). P is a matching, so there are at most m internal chords in C, supporting at most2m of its2m+1 edges. Some cycle edge would lack its required second page, a contradiction. Thus R has no odd cycle component.

It follows that R is bipartite. The freshly reviewed theorem coordinator_TF_residual_equal_matching_exclusion_v1.md excludes every bipartite WKE residual, since vc(R)=r gives an r-matching by elementary bipartite matching-cover equality. Therefore the assumed tuple cannot occur.

This is a conditional equality exclusion, not general WKE availability. It imports the ordinary residual-cover invariance and the ordinary equal-matching TF-residual exclusion, together with class-local codegree. It has no finite enumeration, GE, Kotzig or new formalization premise. The chord count is about an isolated COMPONENT of R; applying it to a cycle with additional R neighbors would be invalid.
