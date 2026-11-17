> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Cross-page abundance gives strictness for a bipartite-complement minimum cover

Status: ORDINARY_PROOF_CANDIDATE; fresh review required. TUZA-22 challenger, 2026-11-15 UTC. This is an all-size graph-specific augmentation theorem. It does not assert that every graph admits the required partition or page abundance.

## Statement

Let k>=4. Let G be a finite simple graph with a vertex partition A union B. Let C be exactly its set of internal edges in A and B, and suppose C is a minimum triangle-edge cover of size2k. Suppose every internal edge xy has at least k common neighbors in the opposite part. Then

    nu(G)>=k+1, and therefore tau(G)=2k<2nu(G).

## Minimum-cover optimality gives Hall for every internal star

For an internal A-edge xy, define its cross-page list L(xy)=N_B(x) intersection N_B(y). Define lists symmetrically for internal B-edges. Fix an internal star centered at x in A and a subset S of its edges. Set U to the union of the page lists of the edges of S.

If |U|<|S|, replace the edges S in C by the cross edges xz for z in U. Every triangle remains covered. A triangle not using S retains its old cover edge. A mixed triangle using xy in S has its B-vertex in L(xy), so its edge from x to that vertex is newly covered. An all-internal triangle through x retains its opposite edge, which is not in the star S. Thus the replacement contradicts the minimal cardinality of C. Consequently |U|>=|S| for every subset S of every internal star. Hall's marriage theorem gives distinct permitted pages for the edges of each such star.

This argument includes every actual triangle, including triangles lying entirely within one part. It does not assume that the page family is the full triangle family.

## Packing from proper list edge coloring

Assigning a page z in L(xy) to an internal A-base xy produces triangle xyz. Such triangles on distinct A-bases are edge-disjoint whenever adjacent bases receive different pages. Hence a proper list edge coloring suffices.

Suppose one part, say A, contains at least k+1 internal edges, and choose k+1 of them. If they form a star, the preceding Hall property supplies distinct pages and therefore a packing of k+1 triangles. Otherwise their line graph is not K_(k+1): any family of at least four pairwise-intersecting edges in a simple graph has a common endpoint. Indeed, two intersecting edges xy,xz together with an edge missing x force that third edge to be yz, and then no fourth distinct edge can meet all three.

Every graph on k+1 vertices other than K_(k+1) is (k−1)-degenerate: a proper induced subgraph has at most k vertices and cannot have minimum degree k, while the whole graph is not complete. Thus lists of size at least k admit a proper coloring by reverse greedy elimination. The page-abundance hypothesis supplies exactly these lists, giving the required k+1 triangles.

The only remaining split of2k internal edges is exactly k in each part. Choose any internal B-edge uv. It has at least k common neighbors in A. The internal A-graph has total degree2k, and at most floor(2k/(k−1))=2 vertices of degree at least k−1, because k>=4. Hence uv has a common neighbor x of internal A-degree d<=k−2. Reserve triangle xuv.

Delete u and v from the page lists of the d A-bases incident to x. Each such list still has size at least k−2>=d, so assign these d bases distinct permitted colors greedily. Then process all remaining A-bases in any order, always choosing a color different from every previously assigned color. Their unchanged lists have size at least k, and there are at most k−1 earlier bases. This produces k edge-disjoint triangles avoiding the reserved cross edges xu,xv. Their bases lie in A, so they also avoid the reserved B-base uv. Together with xuv they form a (k+1)-packing. QED.

## Application and limits

If at most r cross edges are missing and both parts have size at least k+r, every internal edge automatically has at least k cross pages. There is no restriction r<=k in this consequence. In particular k=4 yields both six-plus-six/missing-at-most-two and five-plus-seven/missing-at-most-one interfaces already frozen in notes/challenger_near_bipartite_five_packing_v1.md.

The weaker global-missing-edge formulation in notes/challenger_near_complete_bipartite_strictness_v1.md remains a valid subcase. This proof isolates the actual mechanism: page abundance for nonstar bases, and the Hall constraint forced by minimum-cover optimality for star bases.

No claim about all maximum private packings, all their extensions, D-some-choice, arbitrary minimum covers, H-D, or unrestricted Tuza follows without separately proving the displayed hypotheses. No computation or historical Tuza theorem is used here.
