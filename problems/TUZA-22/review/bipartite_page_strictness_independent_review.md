> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# All-size bipartite page strictness — independent review

**ACCEPT** the theorem for every integer k>=4 at its exact stated interface. It is an ordinary proof using Hall's theorem and greedy coloring; there is no computational premise or unbounded-attachment extrapolation.

For a subset S of internal star edges centered at x, the proposed cover replacement removes |S| internal edges and adds the cross edges from x to all pages in their union U. A mixed triangle on a removed edge has its third vertex in U and is hit by its x-spoke. An entirely internal triangle through x retains the edge opposite x, which cannot belong to the star S. Triangles not losing their cover edges remain covered. New edges are cross edges and hence disjoint from the old internal cover. Thus minimality implies |U|>=|S|, exactly Hall's condition, for every star subset without any page-abundance assumption. This argument uses actual triangles and handles internal triangles correctly.

If one part has at least k+1 internal bases, choose that many. A star has distinct representatives by the preceding condition. Otherwise its line graph is not complete: an intersecting simple-edge family of size at least4 is a star, because a triangle's three edges admit no distinct fourth edge meeting all three. A noncomplete graph on k+1 vertices is(k-1)-degenerate; the whole graph has a vertex of degree at most k-1, while every proper induced subgraph has at most k vertices. Lists of size k therefore color it greedily in reverse deletion order. Different colors on adjacent bases are exactly what avoids shared cross edges among the corresponding actual triangles.

The remaining split is exactly k bases in each part. Reserve a page xuv on any B-base uv. Among its at least k common neighbors in A, at most two have A-internal degree at least k-1, since the A-degree sum is2k and floor(2k/(k-1))=2 for k>=4. Thus x can be chosen with internal degree d<=k-2. Exactly those d A-bases incident to x require the colors u,v removed; their lists retain at least k-2>=d entries and receive distinct colors greedily. Every remaining list has at least k entries and at most k-1 preceding colors. Coloring all k bases with globally distinct colors is stronger than necessary but valid. The restricted lists prevent both reserved cross-edge conflicts, and the distinct-side bases cannot share uv. This produces k+1 triangles.

The automatic sufficient condition of at most r missing cross edges and both part sizes at least k+r is also valid: for any internal base, at most r opposite vertices can fail to be common neighbors. It does not require r<=k. At k=4 the stated6+6 and5+7 cases follow. The proof makes essential use of k>=4 in the low-internal-degree choice; no smaller-k extension is inferred.

The conclusion is strictness because the assumed minimum cover has size2k and the constructed packing has size at least k+1. The unproved global availability questions remain precisely the partition and the lower bound k on every internal base's opposite-page count. The theorem gives no universal assertion about arbitrary minimum covers, maximum private-packing choices, or unrestricted Tuza.

Source SHA-256: `06ff0df07ea771dd454374fc83364a9365b07aeebc35e6cf767f43b5244fb97c`.

Completed UTC: 2026-11-15T22:51:37.310515+00:00.
