> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-plus-matching private packing — fresh independent review

**ACCEPT** `notes/challenger_triangle_matching_private_v1.md`, SHA-256 `d56b56dc01b0ce806f1b111c6cac655f29735abe5ce1348719e459de52340001`. The theorem is an ordinary all-size proof for the precise minimum-cover shape and bipartite-complement hypotheses. It establishes the stated scoped D-all conclusion, leaving the unrestricted refutation untouched.

Minimum-cover optimality forces every cover edge to be internal to any chosen bipartition of G-C: a crossing cover edge could be restored without creating a triangle. Because the cover graph is a vertex-disjoint union of one triangle and matching edges, its only all-internal actual triangle is the central triangle. Every other actual triangle has exactly one cover edge and two crossing edges; it is a private page. Inclusion-minimality supplies at least one such page on every cover edge. No two-cover-edge triangle or extra all-internal triangle is omitted.

The central triangle plus its pages needs a two-packing. Otherwise the actual-triangle family would be pairwise edge-intersecting and admit a two-edge cover by the elementary book/K4 classification. That cover together with all matching bases would strictly improve C. A two-packing in the central family consists of private pages because the central triangle meets every page. It combines freely with one page on every matching base in the same part: their base endpoints are disjoint, and any shared opposite apex causes only vertex intersections. Hence q>=s+2. One page on every opposite-side matching base gives q>=t. The only integer balance not settled by these bounds is t=s+2.

Under q<=t, every A-page must have its B-apex at an endpoint of one of the B-matching bases, or it could be appended to any chosen t-packing. This owner is unique because the B-bases are disjoint. Only that owner's page can intersect the A-page. Therefore the complete set of possible owner apices is contained in the endpoints of every A-base whose page it owns; otherwise choose a disjoint owner page and append the A-page.

Two owned pages on distinct A-bases with different B-apices are edge-disjoint: their internal A-bases differ and their crossing edges have different B-endpoints. Replacing the one owner page by these two augments while all other B-book pages remain disjoint.

If their apices coincide, the owner's nonempty apex set lies in the intersection of the two A-bases. This forces two adjacent central-triangle edges ab,ac and the sole owner apex a. Their literal spokes to the common B-apex u give the third private page bcu. The owner page auv exists and is edge-disjoint from bcu. Keeping it and adding bcu again augments the t-packing; other B-book pages have disjoint B-endpoints. This is the crucial actual-graph closure step and is valid for the whole page family, not a selected subset.

Consequently no B-base can own pages on two distinct A-bases, while every one of the s+3 A-bases has at least one page and hence an owner. There are only t=s+2 owners, contradiction. Thus q>=t+1 in the balanced case and |C|<=2q always.

Every maximum private packing for this fixed cover has cardinality q, so its own size already supplies the required budget. Any extension contains at least those q triangles. This does not imply a statement about arbitrary nonmaximum private packings, arbitrary cover shapes, or graphs whose cover complement is merely triangle-free rather than bipartite. No enumeration or older finite discriminator is used as a proof input.

Completed2026-11-15 UTC.
