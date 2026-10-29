> Curated source from TUZA-02/proof/K4_STAR_DEFECTS.md. Original SHA-256: `ef3a0c2006943f9a243b61a45c27524ee04f798565f8dc44ffb1273ff61c1db0`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Restoration for the three K4-star defect cores


## Definition and parameters

Take a central triangle abc. At each vertex t in a nonempty subset A of {a,b,c}, optionally attach one triangle t p_t q_t, using two new vertices for each attachment. Let F_0 be this triangle cactus. Write r=|A|, so 1<=r<=3. Adjoin a hub v adjacent to every vertex of F_0, obtaining the core R.

Equivalently, R consists of a central K4 on {v,a,b,c} and r leaf K4s {v,t,p_t,q_t}, one on each selected central spoke vt. The leaf supports are pairwise edge-disjoint, and each shares just its selected spoke with the central K4.

Put d=r+1. Every triangle of R belongs to exactly one of these d K4s, so nu(R)<=d. The d triangles of F_0 are edge-disjoint, giving nu(R)=d. Each leaf K4 needs two cover edges, on disjoint supports. A cover of exactly 2r edges would therefore have all its edges in the leaf supports; its intersection with the central K4 is contained in the hub star, which does not meet the central triangle abc. Thus tau(R)>=2r+1. Conversely, take all r attachment spokes vt, the r leaf-opposite edges p_tq_t, and enough central edges to cover the central K4. This last addition needs one edge if r=1, one if r=2, and one if r=3; when r=1 choose the central edge opposite the spoke vt. Hence tau(R)=2r+1=2d-1.

The core is four-colorable: color v with a fourth color, color abc with three colors, and complete each attached triangle with the other two colors. Also nu(R-e)=d for every edge e. If e is a hub spoke, the F_0 triangles avoid it. If e is an F_0 edge, replace its F_0 triangle by a hub face of its K4 avoiding e and retain all other F_0 triangles. Thus none of the cores has a packing-essential edge.

## A two-edge avoidance fact

Let f,g be F_0 edges in different triangle blocks of F_0. There is a d-triangle packing of R avoiding both, except possibly when one is a central edge and one is in a leaf block, and both edges are opposite that leaf's attachment vertex.

To prove the assertion, retain every unaffected F_0 triangle. Replace the two affected triangles by hub faces avoiding their forbidden edges. For two different leaf blocks the possible hub spokes belong to disjoint sets of nonhub vertices, so any choices are compatible. For a central block and a leaf at t, the only possible shared spoke is vt. A hub face avoiding a forbidden edge can avoid vt as well unless that edge is opposite t in its block. Unless both forbidden edges are opposite t, make at least one of the two face choices avoid vt. This yields the desired packing.

## Single-restoration lemma

Suppose H has triangle components consisting of any k isolated K4 face components and one isolated copy of R. Additional edges belonging to no triangle are allowed. Let U be independent in H, with |U|=3; restore T on U and let F be the new triangle family. Then

\[
\tau(\mathcal F)=3\quad\Longrightarrow\quad
\nu(H+E(T))\ge\nu(H)+2.
\]

It suffices to find d+2 compatible triangles from R and F. Indeed, one face in each of the other k K4s can be chosen to avoid U, and these faces are compatible with every F-triangle and with R. The isolated copy of R is induced on its vertices: any additional edge between two nonhub vertices would form a new hub triangle sharing an R-spoke, contrary to isolation. Its listed neighborhoods can therefore be used as H-neighborhoods restricted to R.

We repeatedly use the elementary fact that tau(F)=3 forces each base edge of T to have a nonempty page-apex set, and any two of these sets have distinct representatives. If two sets were the same singleton, the common spoke and the third base edge would cover F.

### At most one vertex of U in R

Choose two pages with distinct apices, one whose base avoids the possible R-vertex and one on a different base. The first uses no R-edge and the second at most one. Since nu(R-e)=d, these two pages are compatible with a d-packing of R.

### Exactly two vertices of U in R

Write U={u,w,z}, where u,w are nonadjacent vertices of R and z lies outside R. Let B and C be the common-neighbor sets in H for uz and wz. They are nonempty and admit distinct representatives.

If either contains an apex outside R, choose distinct representatives b in B and c in C with at most one in R. The two pages uzb,wzc consume at most one R-edge between them, and a d-packing survives.

Otherwise both B and C lie in R. Since the R triangle component is isolated, N_H(z) intersect V(R) is independent in R: an adjacent pair there would give a new H-triangle on an R-edge. If this neighborhood contained the hub v, it would contain no other R-vertex, forcing B=C={v}, which is excluded. Thus distinct b in B,c in C lie in F_0. The pages uzb,wzc use the F_0 edges ub,wc. These edges lie in different F_0 triangle blocks because u,w are nonadjacent.

Apply the two-edge avoidance fact. If its exception does not occur, the two pages and a d-packing of R suffice. In the exceptional case, relabel the central triangle as abc and the exceptional leaf as b p q so that u=a,w=p, and the two selected page apices are c,q. (Symmetry permits exchanging the two terminals and the two endpoints of either opposite edge.) Besides the two pages azc,pzq, the third page apb exists, because ab and pb are R-edges. The three pages

\[
azc,\quad pzq,\quad apb
\]

are edge-disjoint. Omit the central F_0 triangle, replace the leaf bpq by the hub face vbq, and retain every other leaf triangle. These d-1 old triangles are compatible with all three pages and with each other. Their total is d+2.

### All three vertices of U in R

The hub v is not in U. If there is any page with an apex outside R, combine it with a page on a different base having apex v. These two pages are edge-disjoint; their R-edges, if any, are hub spokes. They are therefore compatible with all d triangles of F_0.

Assume all page apices lie in R. An independent triple of F_0 contains at most one central vertex and at most one private vertex from each leaf. If it contains no central vertex, its members lie in three distinct leaves and have no common neighbors in F_0; all their page apices are just v. This gives a two-edge cover of F, contrary to tau(F)=3.

Thus, after relabeling, U={a,p_b,p_c}, where p_b and p_c are private vertices of the leaves at b and c. The three pages

\[
a p_b b,\quad a p_c c,\quad p_b p_c v
\]

are edge-disjoint. Omit the central triangle abc; replace the b-leaf by vbq_b and the c-leaf by vcq_c; retain the a-leaf triangle if it exists. These d-1 old triangles are edge-disjoint and compatible with the three pages. Again the total is d+2. This completes the lemma.

## Two-triangle consequence

Let T1,T2 be arbitrary edge-disjoint restored triangles whose deletion leaves H as above. Write h=nu(H)=k+d. Then tau(H)=2h-1. If nu(G)>=h+3, the old cover plus the six restored edges suffices. Otherwise nu(G)=h+2 and every individual intermediate graph has packing number at most h+1. The lemma forces tau(F_i)<=2 for both i. An old cover, one such two-edge cover, and the three edges of the other restored triangle cover G, mixed triangles included, with at most 2h+4 edges.

Hence Tuza's inequality holds for two-triangle restoration from any remainder whose triangle components are isolated K4s plus one of these three K4-star cores.

The r=1 case is the two-K4 shared-edge core. The r=2 and r=3 cases are additional nonflat, packing-edge-stable examples. This is not a classification of every near-equality remainder.
