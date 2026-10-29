> Curated source from TUZA-02/proof/BOOK_COMPONENT_BOWTIE.md. Original SHA-256: `558632af4bc17f96379332012066c9c98ddc2c43ff56114233bd13ce8acd5d29`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# A two-triangle restoration theorem with one book component

Research deduction, 28 October 2026. This is ordinary mathematics; no Lean claim.

## Statement

Let T1 and T2 be any edge-disjoint triangles of a finite simple graph G, and let H be obtained by deleting their six edges. Suppose the triangles of H consist of:

* all four faces of each of k pairwise edge-disjoint copies K_1,...,K_k of K4; and
* a nonempty family B of triangles sharing one common edge, with their edge supports disjoint from all K_i.

There are no other triangles in H. Arbitrary additional triangle-free edges are allowed. Then

\[
\tau(G)\le 2\nu(G).
\]

In particular, this handles the near-equality case whenever the triangle hypergraph of H has only K4 face components and a single book component. The book can have any positive number of pages. The restored triangles can share one vertex or be vertex-disjoint. No bipartiteness assumption outside their vertices is needed.

## Preliminary facts

The hypothesis gives h=nu(H)=k+1 and tau(H)=2k+1=2h-1. The common book edge covers B; two opposite edges cover each K4. Conversely each K4 needs two covering edges and B needs one, on disjoint supports. The packing assertion is equally direct.

For i=1,2 set G_i=H+E(T_i), and let F_i be the triangles of G_i absent from H. Every member of F_i is T_i or a page over one edge of T_i. Since V(T_i) is independent in H, every K_j has a face avoiding V(T_i), compatible simultaneously with every triangle in F_i.

We use the elementary page-family lemma proved independently in `../adversarial/FAMILY_CLASSIFICATION.md`:

> If a triangle abc is restored to a graph in which {a,b,c} is independent, and its new triangle family F has tau(F)=3 and nu(F)<=2, then exactly two vertices x,y outside {a,b,c} are adjacent to all three of a,b,c, and there are no other vertices adjacent to two or more of them. Thus F consists of abc and its six pages over x,y.

## Proof

If nu(G)>=h+3, then the elementary bound tau(G)<=tau(H)+6=2h+5 proves the result. Assume nu(G)=h+2=k+3.

Every packing of G_i is compatible with the other restored triangle, so nu(G_i)<=k+2. The k K4 faces selected above, together with a maximum F_i packing, show nu(G_i)>=k+nu(F_i). Hence nu(F_i)<=2.

If tau(F_i)<=2 for either i, cover H with 2h-1 edges, cover F_i with two, and add the three edges of the other restored triangle. This covers G, including all mixed triangles, with at most 2h+4 edges.

It remains to rule out tau(F_1)=tau(F_2)=3. Write e for the common edge of the book B. We first show that the two apices supplied by the page-family lemma for either F_i must be exactly the endpoints of e.

Fix i, write U=V(T_i), and denote its apices by x,y. Suppose xy is not an H-edge. Any book triangle Q meets U in at most one vertex, since U is independent, and meets {x,y} in at most one vertex, since xy is absent. Thus Q contains at most one of the six spoke edges joining U to {x,y}. Choose two edge-disjoint F_i pages avoiding that spoke: if it is ux, choose the page at apex x whose base is the edge on U minus u, and choose a page at apex y with a different base edge. If Q uses no spoke, choose any two pages with distinct bases and apices. These two pages, Q, and k K4 faces avoiding U form a packing of G_i of size k+3=h+2, a contradiction. (Q has no edge in any K_j by hypothesis.) Consequently xy is an H-edge.

For each u in U, the three edges xy,xu,yu form an old triangle. At most one of these three triangles can be a face of one of the K_j: every such face contains xy, which belongs to at most one K_j, and that K_j contains at most one vertex of the independent set U. Therefore at least two of these triangles belong to B. Their unique common edge is xy, so the book's common edge e must equal xy.

Applying this to i=1,2 shows that both apex pairs are the endpoints x,y of e. In particular x,y lie outside U1 union U2. Each K_j contains at most one of x,y, because it cannot contain the book edge e.

If T1=abc and T2=def have disjoint vertex sets, take the four pages abx,acy,dex,dfy. If they share a vertex and are T1=vab,T2=vcd, take abx,vay,cdy,vcx. In either case these four pages are pairwise edge-disjoint. Their old edges all touch x or y. Every K_j therefore has a face avoiding the only one of x,y it may contain, and this face is edge-disjoint from all four pages. These k faces and the four pages form a packing of size k+4=h+3, contradicting nu(G)=h+2. This completes the proof.

## Scope and novelty boundary

The classification of a single page family is elementary and was derived independently during TUZA-02. The argument above adds a compatibility mechanism across arbitrarily many old K4 components and identifies the unique obstruction to gaining two packing units from a single restoration: the bipyramid apices must be the book spine. It is stronger than checking the case nu(H)=1 and is not contained in the already supplied equality-restoration candidate. Whether this restricted theorem appears elsewhere has not been established.

The proof does not cover a general slack-one remainder. The W5 defect component has a separate argument in the literature workstream. Neither result by itself proves OCT five.

## Additional explicit consequence

If nu(H)=tau(H)=1 and nu(G)=3 for two arbitrary edge-disjoint restored triangles, then at least one individual restoration family has a two-edge cover. Indeed H has a nonempty triangle family with a common edge, so the proof applies with k=0. This strengthens the initial bowtie-only h=1 corollary.
