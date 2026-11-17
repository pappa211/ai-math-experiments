> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh reconstruction of the ordinary/private cover gap

Verdict: ACCEPT the literal nine-vertex witness and its unbounded extension in `notes/minimum_cover_private_cover_gap_v1.md`.

I reconstructed the apex neighborhoods and all actual triangles. Each independent apex spans exactly a two-edge path in the core, hence contributes exactly two private triangles. No triangle uses two apices. The only all-core triangle is the displayed central triangle. The private incidence path alternates core edges and shared spokes; its third edges are all distinct and occur in only one private triangle each.

For a path on 2m-1 vertices, its vertex-cover number is m-1 and its unique minimum cover consists of the even positions. Indeed an independent set of size m must use every odd position: the m-1 required gaps already consume all available even positions. Replacing a private cover's unique third edge by either endpoint of its incidence-path edge preserves covering. If that replacement duplicates a selected edge and decreases cardinality, the private (m-1)-packing immediately rules it out for an optimum cover. Otherwise replacing by the odd endpoint contradicts uniqueness of the minimum path cover. Thus the only optimum private cover is the shared-spoke set.

That set misses the all-core triangle, proving the ordinary cover number is exactly m. Alternating path-incidence edges give m-1 pairwise edge-disjoint actual triangles. Any packing using the core triangle can use at most one triangle per remaining m-3 core base, hence has size at most m-2. Therefore both full and private packing numbers are m-1. The vertex, edge, and triangle counts follow directly. The core has m vertices: three triangle vertices plus p+q=m-3 leaves, followed by m-1 apices, giving 2m-1 total. The edge count is m+3(m-1)=4m-3 and the triangle count 1+2(m-1)=2m-1.

This is a counterexample only to identifying a minimum ordinary cover with a minimum private-family cover. It preserves the triangle-free restriction as an essential hypothesis in the exact cover identity. The examples are strict for Tuza and satisfy the private half-size bound. No enumerative completeness or formal verification is needed for the ordinary construction.
