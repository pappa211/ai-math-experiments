> Curated source from TUZA-02/proof/SHARED_EDGE_K4_DEFECT.md. Original SHA-256: `d7bef8edb647d651fd5db8aab7c89289b5141b9f763ff56e1cda049aa9112a26`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# A second nonflat defect: two K4 copies sharing one edge


Let R have vertices x,y,a,b,c,d and edges

\[
xy,\ xa,xb,xc,xd,\ ya,yb,yc,yd,\ ab,cd.
\]

Thus R consists of K4s on {x,y,a,b} and {x,y,c,d} sharing their edge xy.
Its triangle packing number is two and its covering number is three. For the packing, use xab and ycd; three triangles would require either three triangles avoiding xy (impossible because every such triangle uses ab or cd), or a triangle containing xy plus two triangles avoiding xy, one over ab and one over cd. In the latter case the xy-page's leaf belongs to one of these two pairs, and its two spokes meet either choice of triangle on that pair. The three edges xy,ab,cd cover all triangles. Two edges cannot cover both K4 face families: each K4 requires two, and their edge sets intersect only in xy, so a two-edge cover of both is impossible.

Every edge deletion leaves a two-triangle packing. For e=xy use xab and ycd. For e=ab use xya and xcd; for e=cd use xyc and xab. For a spoke, symmetry reduces to e=xa, and yab plus xcd works. Hence R has no packing-essential edge. R is four-colorable (give x,y separate colors and a,c one other color, b,d a fourth), so its triangle hypergraph is 3-partite.

## Single-restoration lemma

Suppose H has triangle components consisting of k isolated K4 face components and one copy of R. Extra edges belonging to no triangle are allowed. Let U be an independent triple in H, restore its triangle T, and let F be the new triangle family. If tau(F)=3, then

\[
\nu(H+E(T))\ge\nu(H)+2=k+4.
\]

**Proof.** Choose a face in each K4 avoiding U. These k faces are compatible with all F-triangles, and with every R-triangle. It suffices to exhibit four edge-disjoint triangles from R together with F.

The independent set U meets R in at most two vertices. If it meets R in at most one vertex u, consider the base edge on the other two vertices of U (choose an arbitrary base if U misses R). Because tau(F)=3, every base has a page, and the apex sets over any two distinct bases cannot be the same singleton: otherwise the common spoke and the third base edge cover F. Thus any two bases admit pages with distinct apices. Choose one on the selected base and one on another base. The first page uses no R-edge; the second uses at most one. Since nu(R-e)=2 for every edge e, two old R-triangles remain compatible with the two pages.

If U meets R twice, the two vertices are nonadjacent leaves from different pairs. By symmetry write U={a,c,z}, where z lies outside R. Define B=N_H(a) intersect N_H(z) and C=N_H(c) intersect N_H(z), the page-apex sets over az and cz. Tau(F)=3 forces B,C to be nonempty and not both the same singleton: otherwise the two bases with nonempty books, or the base ac together with the one common spoke, cover F.

The set N_H(z) intersect V(R) is independent in R. Otherwise z and the endpoints of one of its R-edges would form an H-triangle sharing that R-edge outside the isolated R component.

If B or C contains an apex outside R, select distinct apices p in B and q in C so that at most one lies in R. Such a selection exists because the sets are nonempty and not the same singleton. The pages azp and czq are edge-disjoint and use at most one R-edge between them. Again two old R-triangles survive.

It remains that B,C are contained in V(R). In R, N(a)={x,y,b} and N(c)={x,y,d}. An independent neighborhood of z cannot contain x or y together with any other R-vertex. If it contains either hub, B and C are the same singleton, excluded. Thus nonemptiness forces B={b}, C={d}; in particular zb,zd are H-edges. The four triangles

\[
acx,\quad azb,\quad czd,\quad xyb
\]

are pairwise edge-disjoint. The first three belong to F and the fourth to R. This gives the required packing. ∎

## Two-triangle consequence

For any two edge-disjoint triangles T1,T2 whose deletion leaves such an H, Tuza's inequality holds. Indeed h=nu(H)=k+2, tau(H)=2k+3=2h-1. If nu(G)>=h+3, the six-edge cover bound suffices. Otherwise every individual intermediate G_i has nu(G_i)<=h+1. The lemma therefore forces tau(F_i)<=2 for both i. An old cover, a two-edge cover of one F_i, and the three edges of the other restored triangle cover G in at most 2h+4 edges, including mixed triangles.

This core is nonflat (xy belongs to four triangles) and has no packing-essential edge, so the result covers examples outside both the flat-remainder theorem and the essential-edge theorem. It is a restricted additional deduction, not a classification of all nonflat near-equality remainders.
