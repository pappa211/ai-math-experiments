> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Residual cover rigidity forces two nonhub apices on each rim base

Frozen ordinary corollary, 2026-11-16. Source_audit.

Retain the exact cone decomposition G=h+L, C={hs:s in S} union E(A), where S is independent and A=L[B] is triangle-free. Assume C is minimum and exact-one on every actual triangle, every triangle-bearing edge has codegree at least two, and every actual triangle T satisfies tau(G-E(T))=tau(G)-1.

For every A-edge uv, there are at least TWO distinct common neighbors of u,v in S.

Every triangle on uv is either huv or suv for a common S-neighbor s, because A is triangle-free and S is independent. Codegree at least two gives at least one such s. If s were unique, delete the actual star triangle T=hsu. Its red edge hs is deleted. The two triangles on uv are destroyed by the deleted edges hu and su respectively. Consequently C minus {hs,uv} still covers every surviving actual triangle: a triangle previously met by another C edge retains that edge unless already destroyed, while no triangle on either omitted cover edge survives. This cover has size tau(G)-2, contradicting the required residual value tau(G)-1.

Thus each rim base has at least three pages including the hub page. Any two common S-neighbors s,t together with h,u,v form a literal K5 minus st. This is a literal subgraph only, NOT necessarily an entire triangle component; arbitrary further attachments remain.

The statement uses residual COVER equality and exact actual triangle accounting. It does not use residual PACKING equality, provide simultaneous private-page selection, or establish that an unrestricted H-D graph is a cone. No finite computation is involved.
