> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Shared restored triangles: two exceptional families force four new packed triangles

Status: ordinary proof candidate, for independent review. This is a packing operation with complete old-clique footprints; it makes no assertion that unions of individual-family covers hit mixed triangles.

Let B have literal K4/K5 triangle components and nu(B)=m, with all background retained. Let T=abc and U=ade be missing triangles, sharing exactly a. Suppose the FULL new family over B for restoring T is exactly the seven-triangle K5-e on T and two full apices x1,x2, and likewise the full U-family is K5-e with full apices y1,y2. Then

    nu(B+T+U) >= m+4.                              (1)

All four apices lie outside {a,b,c,d,e}: an apex of either family cannot be a nonshared terminal of the other, because its required spoke to a is one of that other's absent restored bases. Within either apex pair the two vertices are nonadjacent in B. If x1x2 were present, the old triangles ax1x2 and bx1x2 would force absent ab into their common literal old clique; the U argument is identical.

Choose indices so that x1!=y1, which is always possible because each pair has two distinct vertices. Take the four actual pages

    abx1, bcx2, ady1, dey2.                        (2)

Within each family the bases and apices differ, so the two pages are edge-disjoint. Between families the terminal sets intersect only in a, and none of the apices is a terminal. The only possible common edge is therefore a shared a-apex spoke of abx1 and ady1. Our choice x1!=y1 excludes it. Hence (2) is an edge-disjoint four-packing, irrespective of any additional mixed triangles.

An old clique contains at most one supported spoke of each exceptional family. It contains at most one restored terminal (all three bases are absent) and at most one full apex (the apex pair is nonadjacent). Thus its footprint under (2) has at most two edges.

Those two edges cannot be opposite in an old K4. More generally, an old clique cannot contain two vertex-disjoint spokes, one from each family. If either spoke has terminal a, the other terminal would be d or e (or b or c in the reverse case), forcing an absent restored base inside the clique. Otherwise write the two spokes as b'x and d'y, with b' in {b,c}, d' in {d,e}. Vertex-disjointness gives x!=y. The old clique would contain b'y and xy. Since ay is an old U spoke, b'y creates an ordinary T page ab'y. By completeness of the exceptional T family, y must be one of x1,x2. Since x is the other distinct T apex, the old edge xy contradicts their nonadjacency.

Therefore every two-edge old footprint is adjacent. A maximum K4 packing avoids any adjacent pair by taking the opposite face. A maximum K5 packing also avoids any adjacent pair: for deleted edges 12,13 on vertices 1,2,3,4,5, take triangles 145 and 234. Single-edge and empty footprints are equally avoidable. These choices are independent over the edge-disjoint old triangle components, even if their vertex sets intersect. Background spokes do not meet any old packed triangle.

A maximum B packing avoiding the entire old footprint of (2) therefore exists. Appending all four pages proves (1). This accounts for every edge collision and does not require excluding or covering mixed new triangles.

## Exact actual-parent consequence

In the all-double-defect-two triple cube from apex_actual_parent_triple_selection_v1.md, an old tight residual B has single restorations of gain (2,2) and pair restorations of gain (3,5). For any pair of restored triangles sharing a vertex, the present lemma prevents BOTH full new families from being exceptional K5-e. Thus in a common-center triple at most one of the three families is exceptional; at least two have a two-edge cover by the exact one-triangle family classification.

This is a structural consequence with a paid packing proof. It does NOT say that the two-edge covers, or their union with a third family cover, hit every mixed triangle. In the common-center case those mixed triangles use two spokes at the center and an old cross edge between distinct leaf pairs. Their complete boundary is the next OPEN obligation.

Dependencies: exact one-triangle new-family classification and the literal B definition from TUZA22 notes/two_triangle_restoration_v1.md; elementary K4/K5 packing avoidances are exhibited above. No numerical job, minimum-Q hypothesis, defect-two naming or unrecorded freshness premise is used.
