> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Matching restrictions at an outside-supported WKE base

Frozen ordinary conditional lemma, 2026-11-16. This refines the surviving proper-cone branch; it is not an exclusion theorem.

Use the accepted minimum-CS triangle-free WKE-residual interface. Thus L is a closed link at h, P is a matching of size r, R=L−P is triangle-free, A=h+L has triangle packing number r, and every P base ab with a page outside N_G(h) satisfies nu_triangle(A−ab)<=r−1.

For every such outside-supported ab the following hold.

1. Every maximum ordinary matching of L contains ab. Indeed P has size r and any larger matching would lift to a cone packing larger than r. An r-matching avoiding ab would lift to an r-packing of A−ab, contradicting outside-page criticality.

2. Neither endpoint a nor b is adjacent in L to a P-unmatched vertex. Replacing ab by that incident edge would produce an r-matching avoiding ab.

3. For every other P edge xy, the bipartite cross graph between {a,b} and {x,y} has matching number at most one. Two disjoint cross edges would replace ab,xy while preserving r and avoiding ab. Equivalently these cross edges are empty or all incident to one vertex; every such 2-by-2 interface is a star.

4. Consequently, every common R neighbor v of a,b is P-matched, and its mate v' is adjacent to neither a nor b. Statement2 makes v matched; since av and bv are present, Statement3 forces av' and bv' absent. In particular W=N_R(a) intersect N_R(b) contains no whole P edge.

The proofs use only explicit matching switches. They do not assert that P is perfect in L, that all P bases have outside pages, that the local neighboring-link subgraph is closed in G, or that these pairwise restrictions eliminate longer alternating structures. The proper-cone branch remains open.

Dependencies: accepted `coordinator_triangle_free_WKE_residual_interface_v1.md`, specifically its whole-cone packing identity and whole-footprint outside-page criticality. No finite certificate or matching structure theorem is used.
