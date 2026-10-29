> Curated source from TUZA-02/proof/ESSENTIAL_EDGE_RESTORATION.md. Original SHA-256: `993dc3707ff6f58ca52b8c889e078653fb87c896edcf65b3c2ebfccb0eda68de`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Two-triangle restoration when the remainder has a packing-essential edge


## Theorem

Let T1,T2 be edge-disjoint triangles of a finite simple graph G, and put

\[
H=G-(E(T_1)\cup E(T_2)),\qquad h=\nu(H).
\]

Suppose the triangle hypergraph D(H) is 3-partite and

\[
\tau(H)=2h-1.
\]

If some edge e of H is **packing-essential**, meaning

\[
\nu(H-e)=h-1,
\]

then

\[
\boxed{\tau(G)\le2\nu(G).}
\]

More precisely, if additionally nu(G)=h+2, at least one of the two individual restoration families

\[
\mathcal F_i=\mathcal D(H+E(T_i))\setminus\mathcal D(H)
\]

has an edge cover of size at most two. Mixed triangles, using edges from both restored triangles, are not included in either F_i and are handled explicitly by the final cover argument.

Here and below D(J) in a set difference denotes the set of graph triangles, identified with their edge sets.

## Lemma 1: graphical equality gives isolated K4 triangle components

Suppose J has a 3-partite triangle hypergraph and tau(J)=2nu(J)=2k. Then its triangles consist exactly of the faces of k pairwise edge-disjoint K4 copies.

**Proof.** The graphical consequence of HNS proved in TUZA-01 supplies k edge-disjoint K4 copies K_1,...,K_k. If a triangle Q were not a face of any K_j, it would share at most one edge with each K_j: two triangle edges in a complete K4 place all three triangle vertices, hence all three edges, in that K4. Choose a face of every K_j avoiding its possible common edge with Q. These k faces are pairwise edge-disjoint and disjoint from Q, contradicting nu(J)=k. Therefore every triangle is a face of one of the K_j. Their supports are edge-disjoint. For k=0 the assertion just says that J is triangle-free. ∎

This decomposition concerns triangles and their graph edges. The K4 copies may share graph vertices, and J may contain further edges belonging to no triangle.

## Lemma 2: a packing-essential edge has a free page

Under the theorem's hypotheses, write e=xy, J=H-e, and k=h-1. Then J has the K4 decomposition from Lemma 1. Moreover, there is a triangle Q=xyw of H whose three edges belong to none of these K4 copies.

**Proof.** Deleting an edge lowers the minimum triangle-cover number by at most one, while Aharoni applies to the subgraph J. Thus

\[
2h-2=\tau(H)-1\le\tau(J)\le2\nu(J)=2h-2.
\]

So tau(J)=2k and Lemma 1 applies. Every H-triangle absent from J is a page xyw over e.

A fixed K_j can touch the edges of at most one such page. Indeed K_j contains at most one of x,y because xy is absent from J. If it contains, say, x and edges xw_1,xw_2 from two distinct pages, then w_1,w_2 lie in K_j, as does w_1w_2. The edges yw_1,yw_2 also lie in J, so yw_1w_2 is a J-triangle sharing w_1w_2 with K_j. Lemma 1 forces it to be a face of K_j, which would place y in K_j, a contradiction. The case with y in K_j is symmetric.

For each K_j touched by a page, choose its two-edge cover to contain that page's touching edge, together with the opposite edge. For an untouched K_j choose any pair of opposite edges. This gives a 2k-edge cover of all J-triangles and of every e-page having an edge in some K_j. If every e-page touched a K_j, it would cover H, contrary to tau(H)=2k+1. Hence a page Q=xyw has no edge in any K_j. ∎

## Lemma 3: the small-packing page family

Let U={a,b,c} be independent in a graph H. Restore the three edges on U and let F be the family of new triangles. If tau(F)=3 and nu(F)<=2, then exactly two vertices p,q outside U are adjacent to all three vertices of U, and no other vertex is adjacent to two or more vertices of U. Thus F consists precisely of abc and its six pages over p,q.

**Proof.** For each potential base edge f in {ab,bc,ca}, let N_f be its common-neighbor set in H. A packing of pages is exactly a matching in the bipartite incidence graph with the three bases on one side, the apices on the other, and f adjacent to N_f. Pages with different bases and different apices are edge-disjoint; pages with the same base or same apex intersect. The restored base triangle intersects every page.

Every N_f is nonempty, or the other two base edges cover F. The union of any two N_f cannot have size one: if the two bases share the vertex a and both have the unique apex p, the spoke ap and the third base edge cover F. By Hall's theorem, the absence of a three-page packing therefore forces the union of all N_f to have size at most two. It has exactly two vertices p,q.

Each apex occurs in either one or three of the sets N_f, never exactly two: adjacency to two pairs of vertices of U implies adjacency to all three vertices. Since all three sets are nonempty, at least one apex occurs in all three. If the other occurred only once, the other two sets would be the same singleton, already excluded. Hence both apices occur in all three. ∎

The converse is also true, but is not needed here. This lemma was independently derived in the adversarial workstream; its full statement and converse are in `../adversarial/FAMILY_CLASSIFICATION.md`.

## Lemma 4: a tight individual restoration must use the essential edge as its apex pair

Keep the hypotheses and the notation J,K_1,...,K_k,e=xy,Q from Lemma 2. Let T have an independent vertex triple U in H, let G_T=H+E(T), and let F be its new triangle family. Suppose

\[
\nu(G_T)\le h+1=k+2,\qquad \tau(F)=3.
\]

Then F consists of T and the six pages whose apices are exactly x,y.

**Proof.** Each K_j meets U in at most one vertex. Choose a face avoiding U in each K_j. These k faces are compatible simultaneously with all F-triangles, so nu(F)<=2. Apply Lemma 3 and call its apex pair p,q.

First pq must be an H-edge. Otherwise the free page Q from Lemma 2 meets U in at most one vertex and {p,q} in at most one vertex. It therefore contains at most one of the six old spokes joining U to {p,q}. Select two edge-disjoint F-pages avoiding that possible spoke: for a forbidden spoke up, choose at apex p the base edge opposite u, and at apex q choose a different base edge. If there is no forbidden spoke, choose arbitrary different bases at the two apices. The two pages, Q, and the k K4 faces avoiding U are pairwise edge-disjoint. This is a packing of size k+3=h+2 in G_T, a contradiction.

Suppose next pq is an H-edge different from e. For each u in U, pqu is an H-triangle. At most one of these three triangles can contain e: since e is not pq, its occurrence would determine the unique third vertex u. Thus at least two of the three are J-triangles. They share pq, so Lemma 1 puts both in the same K_j. This K_j contains two vertices of the independent set U, impossible. Consequently pq=e, proving the lemma. ∎

## Proof of the theorem

A maximum H-packing together with T1,T2 gives nu(G)>=h+2. The old minimum cover plus their six edges gives tau(G)<=2h+5. If nu(G)>=h+3, the theorem follows immediately.

Assume nu(G)=h+2. For G_i=H+E(T_i), every packing can be augmented by T_j, j!=i, so nu(G_i)<=h+1. If tau(F_i)<=2 for either i, an old cover, that two-edge family cover, and the three edges of T_j cover every triangle of G. This includes mixed triangles because every triangle absent from G_i uses an edge of T_j. The total size is at most

\[
(2h-1)+2+3=2h+4=2\nu(G).
\]

Otherwise both tau(F_i)=3, and Lemma 4 shows that their apex pairs are the same pair {x,y}, the endpoints of e. These apices are outside both restored vertex triples. Every K_j contains at most one of x,y, because xy is absent from J.

If the restored triangles are vertex-disjoint, write T1=abc and T2=def and choose

\[
abx,\quad acy,\quad dex,\quad dfy.
\]

If they meet in one vertex, write T1=vab and T2=vcd and choose

\[
abx,\quad vay,\quad cdy,\quad vcx.
\]

In either case these are four pairwise edge-disjoint new triangles. All their old edges touch x or y. In each K_j choose the face avoiding whichever of x,y it contains, or any face if it contains neither. These k faces are disjoint from all four chosen new triangles, yielding a packing of size

\[
k+4=h+3,
\]

contrary to nu(G)=h+2. Hence at least one F_i has a cover of size at most two, and the theorem follows. ∎

## Consequences and boundaries

* The result settles every near-equality remainder with nu(H)=1: then tau(H)=1, and any edge in a one-edge cover is packing-essential.
* It settles arbitrary books, as well as books attached to equality K4 components in ways allowed by the hypotheses; attachment need not be a disjoint triangle-component decomposition.
* Any still-unresolved near-equality counterexample to the full two-triangle conjecture must have nu(H-e)=nu(H) for **every** H-edge e, unless some other argument already applies.
* The theorem proves the proposed individual-restoration lemma in this structural class. It does not prove that lemma in general.
* No external novelty or specialist verification is asserted. The general two-triangle restoration theorem and OCT-five consequence remain open in this mission unless another independent result closes the residual class.

## Attribution of inputs

The deep inputs are Aharoni's tripartite bound and the HNS equality consequence as reproduced and attributed in the TUZA-01 archive. Lemma 1 is a further graphical deduction from that equality consequence. Lemmas 2–4 and their restoration application are TUZA-02 deductions. The isolated-book argument in `BOOK_COMPONENT_BOWTIE.md` is retained as the earlier, weaker route that led to this proof.
