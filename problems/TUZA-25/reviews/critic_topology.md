> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: topology scope and normalization

**PASS.** I reconstructed the elementary claims in `notes/topology_scope.md` (reviewed SHA-256 `3e5be5f991153da29b156d693fafdfa4f162bec1b9affdd11e83934666eeb786`) from the definitions. No new search, expansion catalogue, or external theorem was used. This is an ordinary in-session independent AI review, not Lean verification or an unrestricted Tuza proof.

For the triangle complex, d1 applied to an edge indicator sums that indicator on each actual triangle over F2. Since every triangle has three edges, d1(E)=1 on every triangle. If C is a cover and F=E minus C, then d1(F)(T)=1+|C intersect T| modulo 2. The cover hypothesis excludes intersection size zero, leaving precisely size two as the support condition. Without the cover hypothesis, uncovered triangles would also appear in this support; the frozen note correctly retains that hypothesis.

An edge set C is an odd cover exactly when d1(C)=1, equivalently d1(E symmetric-difference C)=0. Complementation is a bijection, so the whole odd-cover family is E symmetric-difference Z1. A two-coloring is the indicator of a vertex subset; its crossing edges form its coboundary, and its monochromatic edges form the complementary cut cover. Thus the cut-cover family is E symmetric-difference B1. The cochain identity ensures B1 subset Z1. Consequently equality of these families is equivalent to Z1=B1, or H^1=0. Equality of minima alone does not imply equality of families. The independently checked ring realizes precisely this distinction: H^1 has dimension one, yet the cover, odd-cover and cut-cover minima all equal twelve.

The normalized quotient is

    (|d1 A|/t) / (dist(A,L)/m) = m |d1 A| / (t dist(A,L)).

Taking the minimum over A outside L gives dist(A,L)<=m|d1 A|/(t h_L) whenever h_L>0. If A belongs to L, the same estimate is trivially valid with both sides zero for L=Z1 or B1. With a nearest Z to F, complementation gives |C symmetric-difference C'|=|F symmetric-difference Z|. Hence |C'|<=|C|+m|d1F|/(t h_Z), exactly as stated. The m/t factor is required. The estimate bounds the number of changed edges; it does not provide a favorable sign for the cardinality change or pay any Tuza budget.

If H^1 is nonzero, choose A in Z1 minus B1. Its coboundary norm is zero and its distance from B1 is positive, so h_B=0. This does not force h_Z=0. In fact, for a finite graph with t>0 the set outside Z1 is nonempty and every quotient defining h_Z is positive, hence h_Z>0 automatically; its quantitative size is the useful issue. Under these nondegenerate hypotheses, h_B>0 is equivalent to H^1=0. The note's separate treatment of zero m, zero t, and empty minimization domains avoids division by zero.

For any fixed edge-disjoint packing P of size nu, its triangle supports are disjoint. A nonmonochromatic packed triangle contributes one monochromatic edge, while a monochromatic triangle contributes three. With a monochromatic packed triangles, this contributes nu+2a; adding the b monochromatic graph edges outside the packing support gives exactly nu+2a+b. Every graph triangle has a monochromatic edge, so this is a cover. Thus 2a+b<=nu is exactly the desired cut-cover budget, not a way of finding a coloring that meets it.

C5 is a valid control for the unrestricted assertion: it has no triangles and therefore nu=0 before or after any two edge deletions, but every two-coloring leaves at least one monochromatic edge; alternating colors attain one. It is outside the nonempty triangle-supported domain. The ring is inside that domain and satisfies its cut bound. No blow-up-cone computation was independently reconstructed in this review, and none is needed for these identities.

The closing limitation is justified: the definitions of a low-coboundary cochain and a response table do not themselves specify a proper graph region, crossing-triangle incidences, a smaller simple-graph realization, or exact signed packing/cover payment. Those remain additional obligations. No mathematical discrepancy remains in the frozen note.
