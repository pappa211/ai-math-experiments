> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Perfect-matchable tree links cannot occur in an edge-resilient defect-one graph

Status: ordinary all-size proof candidate, frozen for fresh reconstruction. This is a new local restriction on the actual near-tight residual; it does not classify that residual.

## Theorem

Let H be a finite simple graph with

    nu(H)=p, tau(H)=2p-1,
    nu(H-e)=p for every edge e of H.

Assume every proper edge-subgraph of H satisfies combined CS. Then no closed connected component F of a vertex link H[N_H(v)] can be a tree with a perfect matching.

The same theorem applies if the relevant smaller graphs satisfy CS for some already proved hereditary class, such as the forest-cover class. Connectedness of the triangle support of H is not required. Outside neighbors, triangle-free background, and arbitrary external pages on rim edges are included.

## 1. Strict reduction makes the residual exactly B

Suppose such a link component F exists, with |V(F)|=2r and r>=1. Let M be its perfect matching. A forest has at most one perfect matching: the symmetric difference of two distinct perfect matchings would contain an alternating cycle. Thus M is unique.

Delete all2r spokes vx with x in V(F), and all2r-1 rim edges of F, to obtain K. The r hub triangles on M are pairwise edge-disjoint and avoid K, so

    nu(K)<=p-r.

Every triangle lost in this deletion contains a rim edge of F. Indeed a lost triangle using a deleted spoke vx has its third vertex in the same CLOSED link component F, so its rim belongs to F. Thus a K-cover together with all rim edges covers H, giving

    tau(K)>=tau(H)-(2r-1)=2(p-r).

Proper-subgraph CS yields tau(K)<=2nu(K)<=2(p-r). Equality holds throughout:

    nu(K)=m:=p-r, tau(K)=2m, and B(K).                       (1)

No near-tight graph has been assigned clique structure without this equality argument.

## 2. Every remaining outside page lies on the unique matching

Call an actual triangle xyz with xy in E(F) and z!=v an external page on xy. Its apex z lies outside N_H(v). If z were another neighbor of v, the link edge xz would connect z to F, forcing z in F; but a tree has no triangle xyz. In particular z is outside V(F).

Every residual K4/K5 block contains at most ONE vertex of F. Two such vertices would need an edge in K, whereas their only possible H edge is a rim edge of F and every rim was deleted. Consequently a single external page meets each residual block in at most one spoke.

If an external page existed on a rim edge xy outside M, choose maximum residual block packings avoiding its spokes. Append all r hub triangles on M and this external page. The base xy is not in M, the external apex is outside N_H(v), and all hub spokes/rims were deleted from K; hence these m+r+1 triangles are pairwise edge-disjoint. This contradicts nu(H)=m+r.

Therefore all external pages occur on a set D of edges of M. Some matching edges may have no external page. This is a conclusion about ALL actual pages, not a selected finite subfamily.

## 3. Simultaneous footprint control forces a matching identity

For each edge of D choose one external page. For any subset S of D, the selected pages with bases in S are pairwise edge-disjoint: their bases belong to the matching M, and their apices lie outside F. Apices may coincide, but no base endpoint is repeated, so no spoke repeats.

Their ENTIRE simultaneous footprint meets each residual block in at most one edge. A block contains at most one F vertex, and that vertex occurs in at most one selected page. Thus a maximum K-packing can avoid the full footprint of all these pages simultaneously.

Append those |S| external pages and the hub triangles corresponding to a maximum matching of F-S. The hub bases avoid S, and the external apices are outside N_H(v), so all triangles are compatible. It follows from (1) that

    m+|S|+nu_matching(F-S) <= nu(H)=m+r.

The matching M minus S supplies the reverse lower bound r-|S|. Hence for EVERY subset S of D,

    nu_matching(F-S)=r-|S|.                               (2)

No arbitrary matching-independence or matroid property has been assumed; (2) follows from the actual simultaneous graph packing.

## 4. An edge is necessarily packing-critical

First suppose D is nonempty, and choose f in D. Consider ANY packing in H-f. Partition its triangles into:

- triangles of K, at most m;
- external pages on F, whose distinct bases form some S subset of D minus {f};
- hub triangles through v on F, whose bases form a matching of F minus (S union {f}).

This partition is exhaustive by the complete lost-triangle audit in Section1. By (2), applied to S union {f}, the hub part has size at most r-|S|-1. Therefore every such packing has size at most

    m+|S|+(r-|S|-1)=p-1.

Thus f is packing-critical, contradicting the hypothesis.

If D is empty, choose any f in M. There are no external pages, and uniqueness of the perfect matching gives nu_matching(F-f)=r-1. The same partition bounds every packing in H-f by m+r-1=p-1, again a contradiction.

This proves the theorem. ∎

## 5. Available consequence for a minimum CS obstruction

Let G be a minimum combined-CS failure, with k=nu(G). The accepted restoration and active-kernel results give, for every edge vw, the residual H=G-vw with

    nu(H)=k, tau(H)=2k-1,
    nu(H-e)=k for every remaining edge e.

The last assertion is exactly the accepted two-edge resilience of G. Every proper edge-subgraph of H satisfies CS by minimum choice of G. Apply the theorem at v. Since

    H[N_H(v)] = G[N_G(v) minus {w}],

we obtain the all-size structural restriction:

    For every adjacent v,w, no tree component of L_G(v)-w
    has a perfect matching.

In particular an even-order path component after deleting a link vertex is impossible. The remaining link may have other components or cycles; this is not limited to an entirely apex-forest link. It excludes perfect-matchable tree branches attached through a link cut vertex, a configuration not handled merely by the closed apex-forest theorem.

## Dependencies and remaining bridge

The proof uses proper-subgraph CS only after the exact balanced inequalities in Section1; it uses only one-edge avoidance inside the resulting literal K4/K5 blocks. The minimum-CS corollary uses the accepted M0, R2 two-edge resilience and the ordinary residual bookkeeping. No computation, Gallai–Edmonds theorem, or unbounded-interface reduction is imported.

For the precise one-cycle insertion target, every forest-cover residual satisfies the required proper-subgraph CS. This lemma removes one possible local structure from the remaining connected, edge-resilient defect-one graph, but does not yet force a suitable vertex-avoidable new-page apex or the K5-e positive control.
