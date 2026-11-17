> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: degree-two WKE residual exclusion

Source_audit, 2026-11-16 UTC. Verdict: ACCEPT, conditional on the stated previously accepted ordinary class-local inputs.

Frozen source: notes/coordinator_WKE_degree_two_residual_exclusion_v1.md,
SHA256 e5cdb97862afc87292d72ae507a30925d702cf0278153259e92d6100ae3bbb49.

I read the complete source and the exact equal-matching triangle-free-residual theorem it invokes. The new odd-cycle counting step is sound.

An odd-cycle COMPONENT of R=L-P has every edge vertex-cover-critical in the whole R, by component additivity. Residual-cover invariance therefore makes each such edge unsupported in the balanced old graph K. For any edge xy of the cycle, a second page supplied by codegree cannot survive K. Its apex must consequently lie in this same closed link and one of its spokes belongs to P. The matching property forbids both spokes from belonging to P. The other spoke lies in R; since the cycle is an entire R component, its endpoint forces the apex onto the cycle itself. The deleted spoke is exactly a distance-two chord of that cycle.

For a triangle component, that chord would already be an R edge, impossible. For an odd cycle of length at least five, a distance-two chord lies on the unique length-two cycle path and can supply the second page for only its two cycle edges. Matching P has at most floor(|C|/2) internal chords, so these can account for at most |C|-1 of the |C| required edges. This contradicts the codegree requirement. The isolation of the R component is essential and is stated explicitly; the count is not applied to a cycle with additional residual neighbors.

Thus all R components are paths, even cycles, or isolates, so R is bipartite. The accepted cover invariance gives vc(R)=|P|, and bipartite matching-cover equality contradicts the freshly reviewed theorem excluding a triangle-free residual with an equally large matching.

The conclusion excludes the supplied WKE tuple shape. It is not an availability theorem, contains no finite-certificate premise, and does not use GE or Kotzig.
