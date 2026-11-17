> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent check: defect-zero triangle residual dependency

Verdict: PASS, PROVED_ORDINARY for the stated dependency argument. Reviewed notes/defect_zero_triangle_exclusion_dependency.md at SHA-256 100ef1ce40c86154e69ebb97a633ceac4c9b9e31d26c07153fbff64d2f125b90. The requested introductory wording correction was adopted before the final source hash was bound; no mathematical case is missing.

For Q of packing k, two-edge resilience gives nu(J)=k-1 for J=Q-E(T): deleting any two T edges preserves k and the third deletion loses at most one, while appending T to any J packing gives the converse bound. Cover extension gives tau(J)>=tau(Q)-3=2k-4. Proper-subgraph CS supplies tau(J)<=2nu(J)=2k-2. Therefore delta(J) belongs to {0,1,2}.

If delta(J)=0, the equality clause of proper-subgraph CS identifies J as B. The separately accepted no-B lemma under two-edge resilience excludes B(J), with no minimum-Q, connectivity, degree or defect assumption needed for that structural lemma. Consequently only defects one and two remain. The subsequent exclusion of defect one uses separate triangle-plus-edge and named-restoration arguments; it is not part of the no-B lemma.

Wording correction adopted: the original introduction had said elementary accounting "alone" gives {0,1,2}. Nonnegativity uses proper-subgraph CS; without that premise the bare cover bounds allow the formal value -1. The bound current source now correctly says "elementary accounting together with proper-subgraph CS", consistent with its detailed application paragraph. The present acceptance binds that corrected source.

No new computation or Lean verification was needed. All accepted dependencies retain the fixed-G conditional minimum-CS framework.

Frozen UTC: 2026-11-16T22:46:11.949925+00:00
