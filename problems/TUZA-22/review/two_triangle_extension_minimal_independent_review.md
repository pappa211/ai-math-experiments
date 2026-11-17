> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Arbitrary two-triangle packing extension — independent review

**ACCEPT** the stated minimum-CS consequence, using the separately accepted full two-triangle restoration theorem.

For any actual edge-disjoint triangles T,U, their six edges are disjoint from H=G-E(T)-E(U). Appending them to an H packing gives nu(H)<=k-2. Cover extension gives tau(H)>=2k-6, while proper-subgraph CS gives tau(H)<=2nu(H). Thus the only possible packing values are k-3 and k-2. In the lower branch the bounds force exact equality tau(H)=2nu(H), so proper-subgraph CS supplies B(H). Restoring the two prescribed missing triangles falls exactly within the accepted arbitrary-attachment two-triangle theorem, contradicting the assumed CS failure. Therefore the upper branch holds.

A maximum residual packing together with the prescribed two triangles has size k. The proof works for an arbitrary two-packing, rather than presupposing membership in a previously chosen maximum packing. Shared vertices between T and U are allowed because only their edges need be disjoint. At k=3, the excluded lower branch is simply triangle-free H and remains covered by B.

For fixed T, every actual triangle of J=G-E(T) is edge-disjoint from T and therefore extends to a maximum J packing, using the established identity nu(J)=k-1. When that number exceeds1, no singleton residual triangle can be maximal. The proof does not extend arbitrary larger residual packings or three prescribed triangles of G; the relevant extra restoration theorem is absent.

Reviewed source SHA-256: `5d04171d00d09db1759ae058df20155f942f3aa2f714b5ce662b9b8cd5f5be97`.

Completed UTC: 2026-11-15T23:30:21.311397+00:00.
