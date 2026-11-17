> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-21 accepted ordinary arguments and exact obstructions

All graphs are finite and simple. Every actual triangle is counted, and packings share no graph edge but may share vertices. Independent review is internal AI review, not external peer review or Lean verification. No historical originality is asserted.

## 1. Frozen main obstruction: minimum-cover private witnesses are insufficient

**Theorem.** There is a graph G with 17 vertices, 56 edges, 40 actual triangles, tau(G)=11 and nu(G)=8. For every minimum ordinary triangle cover C of G, the family F_C of actual triangles meeting C in exactly one graph edge has packing number 5. There are exactly 16 minimum covers. Hence both claims

- for every G and every minimum C, 2nu(F_C)>=|C|;
- for every G there exists a minimum C with 2nu(F_C)>=|C|

are false. This is not a Tuza counterexample: 11<=16.

### Literal definition and Clebsch facts

Let L have the sixteen even subsets of {0,1,2,3,4} as vertices; A and B are adjacent exactly when |A symmetric_difference B|=4. Equivalently use even 5-bit masks and XOR popcount four. Let G add a new vertex z adjacent to all vertices of L, with no other edges. In the certificates z=32.

XOR by any even mask is an automorphism of L. The neighbors of zero are the five weight-four masks, whose pairwise XOR has weight two. Thus L is 5-regular and triangle-free, with 40 edges. All triangles of G are exactly zAB for AB in E(L).

For any independent set I in L, translate one member to zero. Every other member then has weight two; their corresponding two-subsets pairwise intersect (disjoint pairs have XOR weight four). A pairwise-intersecting family of two-subsets either has a common element or consists of at most the three edges of a triangle: take {a,b},{a,c}; an edge avoiding a must be {b,c}, and no fourth distinct pair can intersect all three without a common element. On five coordinates its size is therefore at most four. Hence alpha(L)<=5; any neighborhood attains five.

If |I|=5, the four nonzero pairs must form a full star on the five coordinates. Along with zero this is precisely the neighborhood of the weight-four mask missing the star center. Translating back proves that every maximum independent set is a neighborhood N(v). These sixteen neighborhoods are distinct. Every w outside N(v) has at least two neighbors in N(v): w=v has five; otherwise w XOR v has weight two, and exactly two weight-four masks have XOR of weight four with that weight-two mask. Thus nonadjacent distinct vertices have exactly two common neighbors. This also directly proves the required outside-neighborhood property without importing a strongly-regular-graph theorem.

### All minimum covers, including possible rim-edge covers

For an arbitrary cover D of the cone, let S be the vertices whose spokes zS are in D and put W=V(L) minus S. Every rim edge induced by W must belong to D, since its triangle has neither spoke selected. Conversely the spokes at S together with all edges of L[W] cover every triangle. Any additional rim edge whose endpoint lies in S is redundant, so every minimum cover has this exact form and cost

    16 - |W| + e(L[W]).

For any graph on W, selecting one endpoint from each edge leaves an independent set of size at least |W|-e(L[W]). Therefore |W|-e(L[W])<=alpha(L)=5. This proves tau(G)>=11, attained by W=N(v).

For equality, |W|-e(L[W])=5. If L[W] has two edges sharing a vertex, take that common vertex and one endpoint of every other edge to cover L[W] with at most e(L[W])-1 vertices. Its complement is an independent set of at least six, impossible. Thus L[W] is a matching plus isolates. Choosing one endpoint of each matching edge and all isolates yields an independent five-set U contained in W, so U=N(v). If W minus U is nonempty, every such additional vertex has at least two neighbors in U, contradicting that L[W] has maximum degree at most one. Consequently W=U is independent and has five vertices.

It follows that every minimum cover is exactly C_v={zx:x notin N(v)}. There are sixteen, each of size eleven. No rim-edge minimum cover has been discarded.

### Exact full and private packing numbers

Since L is triangle-free, cone triangle packings are precisely matchings in L. XOR with any fixed weight-four mask pairs all sixteen vertices into eight disjoint L edges. These give an eight-triangle packing. Every triangle uses two distinct apex spokes, so no packing exceeds eight. Hence nu(G)=8.

For C_v the private triangles are exactly zxy with xy crossing (N(v),V(L) minus N(v)). Each uses a distinct spoke at N(v), so any private packing has at most five triangles. Five are attainable: for v=0, label N(0)'s members by their missing coordinate i and match that weight-four set to the weight-two set {i,i+1}, with indices modulo five. These five pairs are distinct edges; XOR translates them for every v. Therefore nu(F_C)=5 for every minimum C.

The independent literal checker and full review are [book_clebsch_private_verify.py](scripts/book_clebsch_private_verify.py), [certificate](data/book_clebsch_private_certificate.json), and [independent reconstruction](review/book_clebsch_private_refutation.md). They exhaust all 65,536 W sets and retain every minimum cover with an explicit private five-packing. The ordinary argument above establishes the exact values independently of exhaustive optimization.

**Cause of failure.** Restricting to one-cover-edge triangles removes all link edges inside V(L) minus N(v). Those omitted triangles can supply full packing capacity. Reoptimizing over every minimum cover does not repair this example. Permitting nonminimum covers or using two-/three-cover-edge triangles is a different statement and is not refuted by this theorem.

## 2. Book discriminator: exact construction minimum nine, permitted optimum eight

The complete self-contained [ordinary proof and independent finite control](review/book_verification.md) reconstruct the eight-vertex switched-four-cycle. Its core is K4 on x_0,...,x_3, and a_i is adjacent exactly to x_(i-1),x_i,x_(i+1) modulo four. The specified owners are T_i=x_(i-1)x_i a_i and unique private pages Q_i=x_(i-1)x_(i+1)a_i. One has nu=4, A(P)=B(P), c_G(P)=8, and ordinary tau=6.

Opposite private pages share a diagonal, so a feasible book selection has zero, one, or two adjacent-index pages. The original construction retains all three owner edges for each unpaired owner, retains the base for each paired owner, and adds each distinct present opposite edge missing from that initial set. Its exact costs are 12, 10, and 9 respectively. This refutes only universal availability for this stated construction without further deletions. It refutes neither PK nor other book methods.

## 3. H-D at packing number at most two

The [ordinary scout proof](notes/ordinary_scout.md) supplies the exact statement and full argument. A graph with nu=1 has a common edge in all triangles or literal K4 triangle support; in either case a two-edge blocker exists. Under H-D with nu=2, fixing a triangle T leaves a graph whose triangle support is a K4 U. For every face F of U, deleting F leaves a K4 containing T. Two different completing vertices would give two edge-disjoint triangles on T's edges, together with a face of U avoiding their common T vertex, a forbidden packing of three. Thus every such residual K4 is a fixed V. Any triangle outside V must meet every face of U, forcing it to be a face of U. U and V have disjoint edge supports. Hence the full triangle family is exactly two K4 components; either opposite edge pair is a blocker.

This proves the gate only for k<=2. It does not supply all-k component availability, extend a sparse equality classification, or discharge an unrestricted obligation. The known H-D-to-Tuza implication is reconstructed in the scout note and remains conditional on unproved H-D.

## 4. Rejected exploratory PK simplification

The six-vertex wheel [control](notes/pk_scout.md) defeats a lender/K5-only description of all residual pair clauses. This omission was already covered by the published common-tip correction; it is an exploratory error screened out, not a new global obstruction. The wheel has nu=2 and c(P)=tau=3, so it satisfies PK. No three-literal clause was shortened, and no compulsory-gain rule was reinstated.
