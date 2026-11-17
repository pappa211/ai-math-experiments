> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Eight-edge cover kernel: coordinator review

ACCEPT notes/k4_cover_kernel_proof_v1.md at its exact explicit hypotheses. The proof has no computational premise. Outside-cover edges are impossible because every triangle through such an edge would miss C; therefore each outside vertex has all neighbors in V(C), and its exact link consists of C edges. The degree and codegree bounds give5<=d<=8. Degrees5/6 use precisely the declared numerical link hypotheses. Link-component order excludes disconnected7/8vertex links. C8 and C7 are incompatible with a triangle in the eight-edge cover.

The remaining7vertex8edge connected minimum-degree-two core is bicyclic. Its suppressed structure gives the figure-eight3+5, theta1+2+5, and both dumbbells3+3+2 and3+4+1. The displayed alternating paths are literal and give at least five distinct apex triangles using two outside vertices; the figure-eight case uses its disjoint triangle edge as a fifth. One outside vertex leaves a core degree-two vertex with degree3, also impossible. Thus every vertex is in V(C), and n<=13 follows.

This is an ordinary lemma under declared local hypotheses, and a PROOF_USING_DECLARED_INPUT consequence for minimumCS atnu4. No claim that mad<7 automatically follows, or that nu4 is excluded. Further sharpening needs a new proof, not the historical unverified census.
