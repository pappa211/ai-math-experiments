> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# The perfect unicyclic remainder has only one unit of cover saving

Frozen ordinary proof candidate, 2026-11-16. This is a necessary shape restriction on an actual minimum-CS link, not a complete exclusion of apex-unicyclic links.

## Exact statement

Let L be a closed link component at h in a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class. Suppose F=L-w is connected unicyclic and has a perfect matching. Write |V(F)|=2r.

For EVERY perfect matching M of F, one of the following holds:

1. F is an even cycle, and F-M is a matching;
2. F-M consists of isolated edges and isolates, together with exactly one nontrivial component P3, P4 or K3.

Consequently F has maximum degree at most three. If F is not a cycle, it has at most three degree-three vertices. Three such vertices are possible only when the unique cycle is a triangle and F consists of that triangle with one pendant path attached to each of its vertices; all three pendant paths have odd length. With two degree-three vertices, they must be adjacent by an edge outside every perfect matching. With one such vertex, F is a cycle with one pendant path.

The conclusion permits arbitrary lengths of the pendant paths and arbitrary neighbors of w. It imposes no unproved restriction on outside pages.

## Strict local accounting

Fix any perfect matching M. The graph F has 2r edges, so F-M has exactly r edges. If it had a vertex cover Q0 of size at most r-2, then P=M and Q=Q0 union {w} would satisfy

    |P|=r,  |Q|<=r-1,

and Q would cover every edge of L-P. Delete all h-spokes to L together with P. The r hub triangles on P append to every remaining packing; the actual edges P plus h-spokes to Q cover every deleted triangle, including arbitrary outside pages on P. This strict tuple contradicts the authenticated minimum-CS accounting. Therefore

    tau_vertex(F-M) >= r-1.                         (1)

No residual B structure or equality augmentation is needed for this strict contradiction.

If F is not a cycle then it has a vertex of degree at least three, so F-M has two adjacent edges. Covering that pair by its common endpoint and each other edge individually shows tau_vertex(F-M)<=r-1. Thus equality holds in (1).

## Elementary classification of a graph with one unit of edge-cover saving

For any graph R with m edges and tau_vertex(R)>=m-1, a vertex of degree at least three is impossible: covering three incident edges by one endpoint and all others individually gives at most m-2. Thus R has maximum degree at most two. Each nontrivial component is a path or cycle.

For a path on n vertices the difference |E|-tau_vertex is (n-1)-floor(n/2); it is zero only for P2 and one only for P3,P4. For a cycle of length n it is n-ceil(n/2)=floor(n/2); it is one only for K3. Differences add over components. Therefore, if R has at least one adjacent edge pair and tau_vertex(R)=m-1, exactly one component is P3,P4 or K3 and every other nonempty component is an isolated edge. Isolates are immaterial.

Apply this to R=F-M. Because M is perfect, every vertex satisfies

    deg_(F-M)(x)=deg_F(x)-1.

This proves the matching-complement classification and the maximum-degree-three bound.

If the nontrivial complement component is P3, F has exactly one degree-three vertex. Connected unicyclic graphs of maximum degree three with exactly one degree-three vertex consist of a cycle and one pendant path.

If it is P4, F has exactly two degree-three vertices; these are the two internal P4 vertices, joined by its central edge. Thus they are adjacent outside M. Since the argument applies to every perfect matching, their joining edge belongs to no perfect matching. Graph-theoretically, either both are on the unique cycle with one pendant path at each, or one lies on the cycle and is directly joined to the other, which has two pendant paths. The statement does not assert additional parity conditions in these two-branch shapes.

If it is K3, F has exactly three degree-three vertices and they form a triangle of nonmatching edges. This is already the unique cycle. Every additional connected piece must therefore be a path from one of its vertices to a leaf, with no further branching and no second attachment to the cycle. Each cycle vertex has exactly one such pendant path, and its matching edge is the first path edge. Alternation along the path to its leaf forces odd path length. This yields the claimed three-branch shape.

These possibilities exhaust the perfect unicyclic branch. They are not claimed to survive all other minimum-CS restrictions.

## Role and remaining gap

This is an ordinary all-size reduction of tree complexity in the triangle-bearing apex-unicyclic interface. The remaining configurations are near-wheel shapes with at most three pendant branching vertices, but w can still have arbitrarily many neighbors along their degree-two paths. A WKE witness in these cases is not itself a CS equality exclusion. The nonperfect-F branch and the even-cycle wheel boundary still require new exchange or cover-overlap arguments.

Dependencies: authenticated class-local M0 and the elementary strict matching/cover deletion accounting reconstructed in `notes/restoration.md`; no new finite data or external matching theorem is used. The related ordinary WKE existence theorem is `apex_unicyclic_wke_v1.md`, SHA d0fb7564463def15f0f77f9713aabfcfcb0437764cf1b9e19bf2dc8f848d968e, but its proof is not required for (1).
