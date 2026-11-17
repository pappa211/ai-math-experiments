> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every two-triangle packing extends in a minimum CS failure

Status: ordinary proof candidate, using the independently accepted two-triangle restoration theorem.

Let G be a minimum-edge failure of combined CS, and put k=nu(G). The established M0 identities give tau(G)=2k; the accepted small-packing results in particular exclude k<=2.

For ANY two actual edge-disjoint triangles T,U of G, let H=G-E(T)-E(U). Appending T and U to an H packing gives nu(H)<=k-2. Cover extension and proper-subgraph CS give

    2k-6 <= tau(H) <= 2nu(H).

Hence nu(H)>=k-3. If nu(H)=k-3, the displayed bounds force tau(H)=2k-6=2nu(H), so B(H). The accepted theorem `two_triangle_restoration_v1.md` applies to the two missing edge-disjoint triangles T,U with arbitrary attachments, and supplies CS(G), contradiction. Therefore

    nu(G-E(T)-E(U))=k-2.

A maximum residual packing together with T and U is a maximum G packing containing BOTH prescribed triangles. This applies to an arbitrary two-triangle packing, not only to two members of a maximum packing chosen in advance. For k=3 the same excluded branch has H triangle-free, so the argument is unchanged.

Fixing one T gives another useful form. Every actual triangle U of the defect-one residual J=G-E(T) belongs to a maximum J packing, because

    nu(J)=k-1,    nu(J-E(U))=k-2.

Thus no triangle of J can by itself be a maximal packing when k-1>1. More generally this statement guarantees extension of a prescribed single residual triangle; it does not guarantee extension of an arbitrary larger maximal packing.

The theorem does not imply extension of every three-triangle packing. That would require a further all-size restoration theorem, or another argument handling the additional residual branch, and is left open here.

Dependencies: M0, proper-subgraph combined CS, and the accepted full two-triangle restoration theorem. No new computation or external theorem is used.
