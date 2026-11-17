> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Review: supplied clique/odd-cycle cover certificate

ACCEPTED as an ordinary supplied-certificate theorem, 2026-11-16, for notes/clique_odd_cycle_cover_certificate_v1.md. Availability remains explicitly conditional.

Every stable set meets each clique at most once and an odd r-cycle at most(r-1)/2 times, so a covering family of cost at most nu certifies cost exactly nu. An actual triangle clique costs at most two graph edges, and a book costs one. A cycle of triangle vertices is covered by selecting the shared edges for an abstract cycle edge cover of size(r+1)/2. Thus each cycle saves(r-3)/2 from twice its dual cost, even with extra intersections. Equality therefore reduces to the already reviewed K4 clique-cover overlap argument.

The K5 and K6 availability failures are literal counting certificates. In K6 the triangle-intersection graph has20 vertices, maximum clique4 and alpha4; five packed triangles would use all15 edges, contradicting parity of the five graph degrees. Every allowed paid piece covers at most four times its cost, so budget4 covers at most16 triangle vertices. These graphs show why the certificate cannot be assumed even after removing K5 equality components.

The optional TDI interface uses the standard TDI-plus-integral-right-hand-side integrality theorem; it is a separately stated sufficient assumption on the displayed system, not an ordinary h-perfection claim. The primary Schrijver context is not imported as a structural availability theorem for arbitrary actual triangle-intersection graphs. The plain supplied-certificate proof does not require it.
