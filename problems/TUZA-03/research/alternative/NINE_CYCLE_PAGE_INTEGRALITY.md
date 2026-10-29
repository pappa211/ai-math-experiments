> Curated source from TUZA-03/alternative/NINE_CYCLE_PAGE_INTEGRALITY.md. Original SHA-256: `9e162f39b3b60a465a3b263a188faa3b6e5ccfb919f1f882213aa4e70afa0430`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Four-packing integrality for pages over a nine-cycle, except the pure wheel


Let L have vertex partition W union X, with L[W]=C9, X independent, and arbitrary edges between W and X. If nu(L)<=4, then either tau(L)=nu(L), or the entire triangle family consists of the nine pages at one apex x in X. In the latter case nu(L)=4 and tau(L)=5.

Index the cycle edges by i modulo 9. Each triangle is represented by (i,x), meaning the page on cycle edge i at apex x. Two triangles intersect in an edge exactly when their indices i agree, or their indices are adjacent and their apices agree.

Let I be the triangle-intersection graph. Each column i is a clique. Each vertex has at most one neighbor in each adjacent column, namely the vertex with its own apex label; it has no neighbor in any other column. Its neighborhood is a disjoint union of at most three cliques (the same-column neighbors and the two possible adjacent-column neighbors). Consequently I has no induced odd antihole of length at least seven: the neighborhood of a vertex in such an antihole contains an induced three-vertex path, as explicitly verified in rigidity/TRIPARTITE_SMALL_PACKING_INTEGRALITY.md.

We claim that every induced cycle of I of length at least five visits all nine columns. Otherwise, its used columns form a connected proper subset of the cyclic column graph, hence an interval. Take an endpoint column of this interval. The induced cycle has at most two vertices in that column, because the column is a clique. It cannot have just one: that vertex would have to have two distinct cycle neighbors in its sole used adjacent column, whereas it has only one neighbor there. If it has two vertices, they must be consecutive on the induced cycle. Each has a second cycle neighbor in the adjacent column, with its own apex label. Those two second neighbors are distinct and adjacent to each other since they share a column. The four vertices therefore form a cycle with a closing edge; in a cycle of length at least five that closing edge is a chord. This contradiction proves the claim.

It follows that there are no induced C5 or C7. An induced C9 uses exactly one vertex per column. Each adjacency between neighboring columns preserves the apex, so all nine vertices share a single apex: it is precisely a full wheel page family. Every induced odd cycle of length at least eleven would give five pairwise edge-disjoint triangles, contrary to nu(L)<=4.

Suppose a full wheel at apex x exists. If there were any further triangle (i,y), then y differs from x. Remove base edge i from C9; the remaining eight-edge path has a matching of size four. The corresponding four x-pages are pairwise edge-disjoint, and all avoid the base edge i. They are also edge-disjoint from the y-page, because their spokes have different apex endpoints. This gives five packed triangles, impossible. Hence the entire triangle family is the single wheel. A matching of size four proves nu=4. A five-vertex cover of C9 corresponds to five apex spokes covering the pages, and four edges cannot cover all nine pages since each graph edge meets at most two pages. Thus tau=5.

Otherwise I has no induced odd hole or odd antihole, including C5. By the Strong Perfect Graph Theorem, its complement is perfect. Therefore the triangle family can be partitioned into nu(L) cliques of I. Every such clique has a common graph edge: this follows directly from the column description, or from the fact that L contains no K4. Choosing those common edges yields tau(L)<=nu(L). The reverse inequality is automatic.

No colorability assumption, computation, or bounded-vertex assumption is used. The bound concerns the packing number of the page family. The imported published theorem is SPGT.

## Path-base corollary, with no packing bound

If the base is a path (or a disjoint union of paths), its page family is integral at every packing number. In a connected component of its triangle-intersection graph the used columns form an interval. The same endpoint-column argument excludes every induced cycle of length at least five. The disjoint-clique neighborhood argument excludes odd antiholes of length at least seven, and C5 is already excluded. SPGT and the common-edge clique property therefore give tau=nu without a packing bound. In particular this applies after deleting one or more base edges from C9, even if the retained spokes create isolated or redundant vertices.
