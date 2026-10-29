> Curated source from TUZA-02/literature/FLAT_REMAINDER_DEDUCTION.md. Original SHA-256: `d7a08c82ba990a4f3b2965a45a504b66c39a2f9576883c8c4cb9b93f6b0df010`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Slack one for flat remainders

Research deduction, 28 October 2026. This note separates a published input from a new application to two-triangle restoration. It does not claim bibliographic originality.

Write `D(H)` for the triangle hypergraph, with graph edges as hypervertices. A **triangle component** means a connected component of the graph whose vertices are triangles and whose adjacencies indicate a shared graph edge. Triangle-free graph edges are irrelevant to this decomposition.

## Published input and structural deduction

Haxell–Kostochka–Thomassé, *Packing and Covering Triangles in K4-free Planar Graphs*, Graphs and Combinatorics 28 (2012), 653–662, Theorem 2, proves that a K4-free **flat** graph—each edge lies in at most two triangles—satisfies `tau <= 3 nu / 2`. Equality holds precisely when its triangle graph is a disjoint union of 5-cycles, equivalently its triangle components are five-wheels. The exact triangle-graph formulation follows from their Lemma 8 and proof of Theorem 2, author manuscript pages 4–5. [Author manuscript](https://www.kostochk.web.illinois.edu/docs/accepted/plan-ht.pdf), [DOI](https://doi.org/10.1007/s00373-011-1071-9).

**Deduction 1.** If a finite simple flat graph H satisfies `2 nu(H) - tau(H) = 1`, its nonempty triangle components consist of copies of K4 and exactly one further component, which is either a triangle, a two-page book, or a five-wheel.

**Proof.** Every edge of a K4 already belongs to two of its triangular faces. Flatness excludes any further triangle using such an edge. Thus each K4 is an isolated triangle component, and different K4s have disjoint graph-edge supports. Remove their edges, obtaining a K4-free flat graph R. Packing and covering numbers add over triangle components, and each removed K4 contributes `(nu,tau)=(1,2)`. Consequently `2 nu(R)-tau(R)=1`. The published bound gives `nu(R)/2 <= 1`, so `nu(R)` is one or two. If it is one, `tau(R)=1`; all triangles share a common graph edge, and flatness allows only one or two of them. If it is two, `tau(R)=3`, so equality in the published bound forces precisely one five-wheel triangle component. ∎

The conclusion concerns all triangles, not a vertex-disjoint decomposition. The blocks may share graph vertices, and additional edges may be present provided they lie in no triangle.

## A local lemma for the five-wheel

Let T=abc be a restored triangle, let U={a,b,c} be independent in H, and put J=H+E(T). Let F be the triangles of J absent from H. Besides T itself, every member of F is a **page** `ijx`, where `ij` is an edge of T and x is an H-common neighbor of i and j outside U. Write A_ij for that common-neighbor set.

Two elementary observations will be used:

1. If `tau(F)=3`, all three sets A_ij are nonempty, and no two are the same singleton. Indeed, an empty set permits covering F by the other two edges of T. If A_ab=A_ac={x}, then `{bc,ax}` covers F. Hence any specified pair of spine sets admits distinct representatives.
2. A five-wheel retains a triangle packing of size two after deletion of any one edge. Deleting a spoke leaves four consecutive available rim vertices, with a matching of two rim edges. Deleting a rim edge leaves a path on the five rim vertices, also with matching number two.

**Lemma 2.** Suppose W is a five-wheel triangle component of H. If `tau(F)=3`, then W together with F contains four edge-disjoint triangles.

**Proof.** An independent set in W has size at most two; if it has size two, both vertices lie on the rim.

If U misses W, choose any two pages with distinct spines and distinct apices. Their old edges avoid W, so append two disjoint wheel triangles.

If U meets W in one vertex a, choose one page on the spine opposite a and another on a spine incident with a, with distinct apices. These pages are edge-disjoint and collectively use at most one edge of W. Observation 2 supplies two wheel triangles avoiding them.

It remains that U meets W in two nonadjacent rim vertices. Rename them a,c, and let b be the third vertex of U. Write the rim in cyclic order as `a,r,c,s,t`, and denote the hub by z. Since W is a triangle component, the set `N_H(b) intersect V(W)` is independent in W: adjacent neighbors of b would create a triangle sharing a wheel edge, outside W. Also b is not adjacent to a or c.

Let B=A_ab and C=A_cb. If either contains an apex outside W, there exist distinct representatives x in B and y in C with at least one outside W. To see this, take an outside apex x in B. If C has an element y different from x, use them; otherwise C={x}, and B has an element y different from x because the two sets cannot be the same singleton. Use y from B and x from C. The resulting two pages use at most one wheel edge, and Observation 2 again applies.

We may therefore assume B and C are subsets of V(W). They are nonempty and are not the same singleton. The common-neighbor possibilities are

`B = N_H(b) intersect {z,r,t}` and `C = N_H(b) intersect {z,r,s}`.

Independence of `N_H(b) intersect V(W)` leaves, up to the reflection swapping a with c and t with s, only

`N_H(b) intersect V(W) = {r,s}`, `B={r}`, `C={r,s}`.

Indeed, a set containing z cannot contain a rim vertex and gives B=C={z}; a rim-neighbor set cannot contain both s and t, and all other choices either make B or C empty or give B=C={r}. In the surviving case the four triangles

`acz`, `abr`, `cbs`, `zst`

are present and pairwise edge-disjoint. The first three are new pages and the fourth lies in W. ∎

## Restoration consequence for the wheel core

**Theorem 3.** Suppose every triangle of H lies either in one of k edge-disjoint K4 triangle components or in one five-wheel triangle component. Let T1,T2 be edge-disjoint triangles obtained by restoring their edges to H, with no other added edges. Then `tau(G) <= 2 nu(G)`.

**Proof.** Put `h=nu(H)=k+2`, so `tau(H)=2h-1`. We have `nu(G)>=h+2` and `tau(G)<=2h+5`. If `nu(G)>=h+3`, this proves the result. Otherwise `nu(G)=h+2`.

For i=1,2 let `Ji=H+E(Ti)` and let Fi be its new-triangle family. The other restored triangle is edge-disjoint from every triangle of Ji, so `nu(Ji)<=h+1`. If `tau(Fi)=3`, Lemma 2 gives four triangles in the wheel plus Fi. In every K4 choose a face avoiding U_i=V(Ti), possible because U_i is independent in H. These k faces are edge-disjoint from every new triangle, from each other, and from the wheel component. This yields `nu(Ji)>=k+4=h+2`, a contradiction. Thus `tau(Fi)<=2`.

Cover H and F1, then add the three edges of T2. This covers every triangle of G, including triangles using edges from both restored triangles. Its size is at most `(2h-1)+2+3=2h+4=2nu(G)`. ∎

No ordinary vertex-coloring or bipartite-complement assumption is used. The theorem is a restricted restoration result. It does not establish the general slack-one theorem, because an unrestricted tripartite triangle hypergraph need not have this component structure.

## The small book core

**Lemma 4 (two-apex classification).** If `tau(F)=3` and `nu(F)<=2`, then there are exactly two vertices x,y outside U that are common neighbors in H of all three vertices of U, and F consists precisely of T and the six pages obtained using these two apices.

**Proof.** A choice of distinct representatives for the three page-apex sets gives three edge-disjoint pages. Thus the sets have no system of distinct representatives. Each is nonempty and the union of any two has size at least two, by Observation 1. Hall's theorem for these three sets implies that their total union has size two, say {x,y}. Any apex belongs to either one or all three page sets: being a common neighbor of two different pairs from U makes it adjacent to all of U. If neither apex belongs to all three sets, one set is empty. If exactly one is universal, two sets are the same singleton. Both possibilities were excluded. Hence both apices are universal. ∎

This classification was obtained independently by the adversarial workstream.

**Lemma 5.** Suppose H is flat, its triangle components consist of k copies of K4 and one component with `nu=tau=1`, and `tau(F)=3`. Then `nu(H+E(T))>=nu(H)+2`.

**Proof.** Choose a face avoiding U in each K4; these k faces are compatible with all of F and all triangles in the residual component. If `nu(F)>=3`, append three new triangles. Otherwise Lemma 4 gives two full apices x,y. They are nonadjacent in H, because an edge xy would belong to the three distinct old triangles xyu for u in U, contradicting flatness.

Choose any old triangle Q from the residual component. The sets U and {x,y} are both independent in H, so Q meets each in at most one vertex. Consequently at most one edge of Q is used by any page of F: an edge ux with u in U and x one of the apices, if such an edge occurs. If there is such an edge, choose the page with apex x on the spine opposite u and a page with apex y on either other spine. They avoid ux and are edge-disjoint. If there is no such edge, choose pages on different spines with different apices arbitrarily. In both cases the two pages and Q form a three-packing, compatible with the k K4 faces. Since `nu(H)=k+1`, the conclusion follows. ∎

## The flat slack-one restoration theorem

**Theorem 6.** Let H be a finite simple flat graph with `tau(H)=2nu(H)-1`. Let T1,T2 be edge-disjoint triangles whose edges are absent from H, and set `G=H+E(T1)+E(T2)`. Then `tau(G)<=2nu(G)`. No tripartiteness hypothesis on D(H) is needed.

**Proof.** Deduction 1 gives the K4-plus-book or K4-plus-wheel decomposition. Put `h=nu(H)`. As before, `nu(G)>=h+2`, while `tau(G)<=2h+5`. The case `nu(G)>=h+3` is immediate. If `nu(G)=h+2`, then each `Ji=H+E(Ti)` has `nu(Ji)=h+1`, since one may append the other restored triangle to any packing of Ji. Lemmas 2 and 5, together with K4 faces avoiding V(Ti), rule out `tau(Fi)=3`. Therefore `tau(Fi)<=2`, and a cover of H, a cover of F1, and all three edges of T2 have total size at most `2h+4`. ∎

**Theorem 7 (full flat-remainder restoration).** Let T1,T2 be edge-disjoint triangles of a finite simple graph G. If `H=G−(E(T1) union E(T2))` is flat, then `tau(G)<=2nu(G)`. No triangle-3-colorability assumption is required.

**Proof.** Isolate all K4 triangle components of H and apply the published HKT bound to the remaining K4-free flat graph R. This gives `tau(H)<=2nu(H)`. Put `h=nu(H)` and `delta=2h−tau(H)`. If delta is at least two, the old cover plus six restored edges has size at most `2h+4`, while `nu(G)>=h+2`. If delta is one, apply Theorem 6.

If delta is zero, the bound on R gives `0=2nu(R)−tau(R)>=nu(R)/2`, so R is triangle-free. All triangles of H are therefore the faces of isolated K4s. Faces chosen outside either independent triple V(Ti) give a maximum old packing compatible with its entire individual restoration family Fi. If `nu(G)>=h+3`, the cover-plus-six bound finishes the proof. Otherwise `nu(G)=h+2` forces each Fi to be intersecting and hence two-edge-coverable. The pre-existing elementary equality-case covering argument supplies a joint four-edge cover of all new triangles, including mixed triangles in the bowtie case. That argument is reproduced in `../context/PRIOR_FOLLOWUP_CANDIDATE.md`, Section 3, Steps 2–4, and was independently reconstructed in TUZA-02. Combining this cover with an old cover gives `tau(G)<=2h+4`.

This use of the prior equality argument needs only its elementary intersecting-family and mixed-triangle covering steps: the K4 witnesses have already been supplied by flatness and HKT. In particular, Theorem 7 does not require Aharoni or HNS. ∎

The equality-case covering argument is prior work, not a TUZA-02 discovery. The new content of Theorem 7 is the slack-one augmentation and its application to all flat remainders.

## Review status

The W5 local case was explored independently by the adversarial workstream, which found the same three-page-plus-one-old-triangle augmentation. The root and proof workstreams checked the full W5 case split, and the adversarial workstream checked the external-apex selection argument. The adversarial workstream also independently checked the flat book-core argument. These are internal mathematical checks, not external specialist verification or a formal proof.
