> Curated source from TUZA-03/rigidity/CLOSED_BIPARTITE_BOUNDARY_EQUALITY_DELETION.md. Original SHA-256: `976d2d43831f6fbe23457c023e4751ca20ed27437461608f280d5164d2abb7ba`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Equality deletion at a closed bipartite boundary


## Statement

Let H be a finite simple graph with 3-partite full triangle hypergraph and

    nu(H)=h, tau(H)=2h−1.

Let U and P be disjoint independent vertex sets, and put W=U union P. Assume the following local boundary uniqueness condition: for every p in P and x outside W with px in E(H), the vertices p and x have at most one common neighbor in U. The stronger condition that every outside vertex sees at most one U vertex is sufficient but unnecessary. Let A be ANY subset of E_H(U,P), with no size bound. If K=H−A satisfies tau(K)=2nu(K), then H has a packing-essential edge.

In particular, when H is edge-packing-stable, no such deletion leaves equality, and

    nu(H−A) >= h−floor(|A|/2).

This applies to every subset of the six old spokes in an exact two-apex restoration with nonadjacent apices. It also applies when P is the entire set of vertices adjacent to at least two terminals in an independent U, provided P is independent. Other U–P edges may remain: A need not be an induced subgraph or all edges on its endpoints.

## Equality faces compatible with every lost triangle

Write k=nu(K). By the established graphical equality extraction/exhaustion theorem, all K-triangles are exactly the faces of k pairwise edge-disjoint K4 blocks. Let L denote the H-triangles absent from K.

Since H[W] is bipartite, every triangle in L has one vertex in U, one in P, and one outside W. It uses exactly one A-edge. An equality K4 contains at most two vertices of W, and if it contains two, they are a retained edge up with u in U and p in P.

Choose a face of each equality block as follows.

- If the block meets W in at most one vertex, choose its face avoiding W. This face cannot meet an L-triangle in an edge: its edges have both endpoints outside W, whereas an L-triangle has only one vertex outside W.
- Otherwise write the block as {u,p,x,y}, with x,y outside W and retained edge up. Choose the face pxy. Its edge xy again cannot belong to an L-triangle. If an L-triangle used px, it would have form pxt with t in U and pt in A. But both p and x are already adjacent to u, so local boundary uniqueness at the actual edge px forces t=u; then pt=pu is retained, not in A. Contradiction. The edge py is treated identically.

Thus the k selected faces are jointly compatible with every member of L. They are mutually edge-disjoint by equality exhaustion.

## The lost family is integral at every packing number

Partition L as the families L_u indexed by u in U. Each L_u consists of triangles upx, where p in P, x outside W, up in A, and ux,px in H.

Distinct L_u have disjoint graph-edge supports. Their base edges up and spokes ux have different U endpoints. The remaining edge px could occur in both L_u and L_t only if p and x had two distinct common U-neighbors u,t, contrary to local boundary uniqueness at px.

For fixed u, form the bipartite graph B_u with parts P and the outside vertices adjacent to u, using edge px exactly when upx belongs to L_u. Triangle packings in L_u are precisely matchings of B_u. A vertex cover of B_u gives a triangle cover by the corresponding u-spokes. Conversely, any selected rim edge px covers just its one L_u triangle and may be replaced by up or ux without increasing the number of edges. Thus triangle-cover number in L_u equals vertex-cover number in B_u.

Konig's bipartite matching/vertex-cover theorem yields

    tau(L_u)=nu(L_u).

The disjoint supports permit addition of both parameters, giving

    tau(L)=nu(L).

No packing-number restriction or perfect-graph theorem is needed.

## Slack accounting and essentiality

The compatible equality faces show nu(H)>=k+nu(L). Conversely any H-packing splits into K-triangles and L-triangles, giving the reverse bound. Hence put d=h−k=nu(L).

One has d>=1: d=0 would give tau(K)=2h>tau(H), contrary to monotonicity. Covering the two triangle subfamilies separately now gives

    2h−1=tau(H)<=tau(K)+tau(L)=2k+d,
    2d−1<=d.

Therefore d=1 and tau(L)=1. Let g be a graph edge meeting every L-triangle. All triangles of H−g then belong to K, so nu(H−g)<=k=h−1. Deleting one edge lowers packing by at most one; thus g is essential.

## Stable packing-loss bound

If H is stable, equality is impossible. Aharoni applied to K therefore gives tau(K)<=2nu(K)−1. Deleting |A| edges lowers tau by at most |A|, so

    2h−1−|A| <= tau(K) <= 2nu(K)−1.

Rearrangement proves the stated floor(|A|/2) loss bound.

## Exact two-apex four-spoke consequence

Suppose restoring abc in H gives precisely two universal apices p,q with pq absent, and suppose the actual restored graph satisfies

    nu(H+abc)=h+1, tau(H+abc)=tau(H)+3=2h+2.

For the compatible new pages abp and bcq, set A={ap,bp,bq,cq}. Their old edges have all been deleted in K=H−A, so they can be appended to any K-packing and nu(K)<=h−1. The set A union {ac} covers the entire new family, and adjoining it to a K-cover covers H+abc. Hence tau(K)>=2h−3. Aharoni forces nu(K)=h−1 and tau(K) in {2h−3,2h−2}. If H is stable, the present lemma excludes the second value. Thus K is again slack one:

    nu(K)=h−1, tau(K)=2h−3.

This does not prove K is edge-packing-stable and does not supply a new expensive restoration over K.

## Inputs and limitations

Imported inputs are Aharoni's tripartite bound, the published equality theorem together with the project's audited graphical exhaustion lemma, and Konig's bipartite matching/cover theorem. No historical novelty claim is made.

The local boundary condition is used in both arguments: if an actual edge px has two common U-neighbors, the chosen face pxy may intersect a lost page at px, and the families L_u need not have disjoint supports. This identifies the role of the hypothesis; no claim is made that every failure of it defeats the conclusion. The stronger global-boundary version is preserved as CLOSED_BIPARTITE_BOUNDARY_EQUALITY_DELETION.global-boundary-version.md. The local weakening was independently accepted by the critic on28October2026. It is NOT asserted automatically for a union of two restoration boundaries. Independence of P is used to exclude triangles inside W and to bound each K4's intersection with W. The lemma gives loss at most three for six spokes, not loss at most one, and does not settle the unrestricted single- or two-restoration theorem.
