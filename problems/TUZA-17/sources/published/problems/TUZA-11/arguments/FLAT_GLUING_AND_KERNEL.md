# Flat-piece gluing and a finite kernel for the five-edge frontier

Ordinary mathematical argument extracted from the post-freeze section of `scouts/BLIND_B.md` on 2026-11-01. The original independent memo and its history are preserved. Four-edge flat-piece gluing is proved below using known inputs; the remaining five-edge inequality is not proved. Novelty has not been established. The odd-wheel reservation observation originated with root and was independently checked by scout B. Scout A is conducting an additional independent review.

## Exact external inputs and versions

- Haxell, Kostochka and Thomasse, [Packing and Covering Triangles in K4-free Planar Graphs](https://perso.ens-lyon.fr/stephan.thomasse/liste/packplanar.pdf), author PDF dated 21 April 2011, Theorem 2 and Section 2: the K4-free flat 3/2 bound, equality characterization by five-wheels, and triangle-dual dictionary. The author PDF has no arXiv version identifier; its displayed date identifies the copy read.
- Alex Parker, [New bounds on a generalization of Tuza's conjecture](https://arxiv.org/html/2406.06501v3), arXiv:2406.06501v3, version dated 19 March 2025, Corollary 1.3: Tuza for graphs with packing number at most three. Source-audit also verified the final journal publication, [Electronic Journal of Combinatorics 32(2), P2.20](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v32i2p20), published 13 May 2025, DOI 10.37236/13355. The argument here was checked against the explicitly versioned arXiv source.
- The elementary pairwise-intersecting triangle-family classification is proved/reconstructed in the scout record. It concerns actual graph triangles: the family has a common edge or is contained in a K4, hence has an actual edge cover of size at most two.

The proof does not import an unrestricted Tuza theorem, a general equality classification, or TUZA-07 block-completion outside its scope. The finite kernel below preserves global cover and packing numbers, not every forced boundary response.

## Exact actual-edge boundary signatures

Let G be the union of actual subgraphs G_i. Let B be a set of actual graph edges, with pairwise E(G_i) intersections contained in B. Require **triangle separation**: every triangle of G is contained in some G_i. In particular all non-B edges belong to a unique piece. This hypothesis cannot be dropped: partitioning a triangle's three edges into three one-edge pieces loses that triangle entirely from the piece data.

For A subset B define c_i(A) as the minimum number of edges from E(G_i) minus B which, together with A intersect E(G_i), cover every triangle of G_i. Unchosen boundary edges are forbidden from this private cover. Set c_i(A)=infinity when infeasible. For S subset B define p_i(S) as the maximum size of a packing in G_i whose union of edges intersects B in exactly S, with p_i(S)=-infinity when infeasible. Then, exactly,

    tau(G) = min_A [ |A| + sum_i c_i(A) ],
    nu(G)  = max over pairwise disjoint S_i [ sum_i p_i(S_i) ].

A triangle entirely in B can appear in several pieces; in a global packing assign it to one piece. Nonempty occupancy masks enforce that it is not used twice. Cover conditions may repeat that triangle without changing feasibility. Thus the formulas remain exact even when |B|>=3 and B itself contains a triangle.

For a flat piece, c_i(A) is an ordinary edge-cover problem on remaining triangle vertices after deleting those already hit by A. A private graph edge in two remaining triangles gives an available dual edge; one in one remaining triangle gives a singleton option. An unchosen B edge is NOT an available dual edge. If every remaining triangle has some private edge, the value is |R_i(A)| minus the maximum matching number in this private-edge dual graph. If a remaining triangle lies wholly in B, that state is infeasible. These details retain actual cover membership and packing reservations; neither scalar slack nor footprint cardinality replaces them.

A realization warning: two abstract pieces cannot freely identify adjacent terminal edges of K4s while pretending the third edge between their common three endpoints is private. That third edge becomes shared too. Actual vertex/edge identification and all resulting triangles must be checked before invoking the formulas.

## Two-edge gluing: an elementary conditional theorem

If |B|<=2, and Tuza holds for every G_i and G_i-B, then Tuza holds for G.

Set k_i=nu(G_i-B), K=sum k_i. If every nu(G_i)=k_i, unioning covers of the pieces costs at most 2K, while unioning base packings gives nu(G)>=K. If some nu(G_j)>k_j, take that piece's packing and the base packings of all other pieces; they are edge-disjoint because the latter avoid B. Thus nu(G)>=K+1. Cover B and then cover every G_i-B, at cost at most 2+2K<=2nu(G). This is a rigorous ordinary argument and needs no flatness; flat pieces supply its hypotheses.

## Isolation lemma for flat pieces

Assume each G_i is flat. Triangle separation and disjoint private edge sets give nu(G-B)=sum_i nu(G_i-B), and similarly tau(G-B)=sum_i tau(G_i-B). Every non-B edge belongs to at most two triangles of G, because all triangles containing that edge must lie in its unique piece. Consequently H=G-B is flat.

If H contains a K4, each of its six edges already belongs to two H-triangles. No additional G-triangle can use any of these edges. Therefore every residual K4 is an isolated component of the triangle-incidence structure of G, even when its vertices meet other supports. Removing all such K4 supports subtracts exactly one from nu and two from tau per K4, in both G and H. This is stronger than merely recording zero scalar slack: old K4 edges have no boundary interaction at all under these hypotheses.

Let h be the number removed, F the remaining actual subgraph of G, and H0=F-B. Write

    k=nu(H0),  s=2k-tau(H0),  r=nu(F)-k.

H0 is flat and K4-free, so the known flat theorem gives k<=2s. The direct boundary cover gives

    tau(F) <= |B| + 2k - s.

All arbitrary triangle-free background edges remain in F and H0; only isolated K4 support edges have been removed.

## Four-edge flat gluing: completed restricted consequence

**Proposition.** A triangle-separated union of flat pieces whose pairwise edge intersections lie in at most four actual edges satisfies Tuza.

Proof: if r=0, the same piece-cover argument as for the two-edge theorem applies (before or after removing isolated K4s). Each piece has no packing gain over its B-deletion, since a positive gain could be combined with base packings in all other pieces.

For r>=2, the boundary cover costs at most 4+2k<=2(k+r). For r=1 and s>=2, it costs at most 4+2k-s<=2(k+1). The only other case is r=1 and s<=1. Here k<=2s<=2, hence nu(F)=k+1<=3, so Parker's theorem applies. Add back the isolated K4 covers and packings. This proves the proposition by ordinary reasoning using the cited known theorems. It is RESTRICTED, and its novelty is unassessed.

The slack-one residual classification is particularly explicit. Apart from isolated K4 triangle components, H has exactly one exceptional triangle support: a single triangle, a diamond, or a five-wheel. Indeed k<=2; k=1 gives one or two triangles sharing an edge, while k=2 forces tau=3 and the flat equality theorem gives a five-wheel. Extra edges in no triangle remain arbitrary. This classification is not needed once Parker is invoked, but explains the small core.

## Five-edge frontier, followed by an odd-wheel elimination

For |B|<=5, the same accounting settles r>=3, settles r=2 unless s=0 (then k=0 and Parker applies), and settles r=1 when s>=3. For r=1,s<=1 Parker applies as above. Thus the first unresolved numerical case is

    |B|=5, r=1, s=2, k in {3,4}.

The case k=4 has tau(H0)=6, so equality in the flat 3/2 theorem makes H0's triangle support exactly two five-wheels. This case is ALSO settled by the following stronger reservation argument, suggested by root and independently checked here.

**Odd-wheel reservation lemma.** Suppose H0's triangle components are odd wheels, and every H0 edge still belongs to at most two triangles in F. A new triangle cannot use an old spoke, because spokes already have triangle degree two. Nor can it use two rim edges of the same wheel: those edges must be adjacent, and their closing diagonal would also create a triangle with two saturated spokes and the wheel hub. Thus each new triangle has at most one rim footprint in each wheel.

For an odd wheel W_(2a+1), a>=2, a maximum packing is an independent set of size a in its triangle cycle C_(2a+1). It can avoid any two prescribed rim edges: deleting two triangle vertices leaves paths with 2a-1 vertices in total, whose independence numbers sum to at least a. Therefore any pair of edge-disjoint new triangles can be combined with a maximum old packing, by reserving their at most two rim footprints in each wheel. This forces packing gain at least two.

Under gain exactly one, the entire new triangle family is pairwise edge-intersecting. Any such family of actual graph triangles is a book or is contained in a K4, and consequently has an actual edge cover of size at most two. Hence

    tau(F) <= tau(H0) + 2.

This eliminates the two-five-wheel case, and also any residual consisting solely of odd wheels, including the seven-wheel candidate with k=3,tau=4. Shared vertices of different old wheels do not affect the proof, since the packing condition concerns actual edges.

**Remaining precise target.** The first unresolved five-edge case in this architecture has H0 flat and K4-free, nu(H0)=3, tau(H0)=4, nu(F)=4, and at most five boundary edges, with all nonboundary edges still of triangle degree at most two. The odd-wheel-only instances are already removed. The desired conclusion is tau(F)<=8, one unit below the naive boundary cover of size nine. The exact boundary signatures above are the appropriate response invariant. This is a restricted open target within this exploration, not a claim that the general Tuza problem has been reduced to it.

## A finite triangle-support kernel for that remaining target

The following deletion argument is ordinary and independently checkable; no enumeration has been run.

Let S be the set of edges lying in H0 triangles, and let t be the number of these triangles. The flat dictionary gives tau(H0)=t-matching_number(D)=4, so t<=8. The number a of old support edges having H0 triangle degree one is

    a = 3t - 2|E(D)| <= 3t - 2(t-4) = t+8 <=16.

Here |E(D)| is the NUMBER OF DUAL EDGES, not its matching number; only the inequality |E(D)|>=matching_number(D)=t-4 is used.

Call a new triangle crossing if it uses an edge of S. A degree-two old support edge is saturated and cannot be used. Each degree-one old support edge can occur in at most one new triangle. Thus there are at most a<=16 crossing triangles. Every crossing triangle contains both an S edge and a B edge, so it has at most one edge outside S union B.

Consider N=F-S. If N contained two edge-disjoint triangles, they could be appended to a maximum H0 packing to give five triangles in F, contrary to nu(F)=4. Thus nu(N)<=1. Its entire triangle family is empty, a book, or the four faces of a K4. In the empty or K4 cases, there are already at most 8+16+4=28 triangles in all of F.

For a book, denote its common edge by f. If f is outside B, its global triangle degree is at most two, so there are at most two book pages. If f is in B, mark a page when either of its two nonspine edges lies in B, or when one of those nonspine edges lies in a crossing triangle. At most four pages are marked for the first reason. For the second reason, nonspine edges in B were already counted; edges outside S union B occur at most once per crossing triangle, so at most sixteen further pages are marked. A nonspine edge belongs to exactly one page of the book.

Every unmarked page has two private nonspine edges outside S union B, and neither is in any crossing triangle. Hence those edges lie in no other triangle of F at all. Retain every marked page and at most TWO unmarked pages; delete one private nonspine edge of each discarded page. This removes exactly those triangles and does not affect any old or crossing triangle.

The deletion preserves nu: a packing uses at most one book page, and a deleted unmarked page can be replaced by a retained unmarked page without creating an edge conflict. It also preserves tau: when more than two unmarked pages existed, any minimum cover of the reduced graph must use f, because otherwise replacing the two selected private leaf edges by f strictly reduces the cover size. Such a cover extends to all discarded pages. The reverse inequality follows because the reduced graph is a subgraph. When at most two unmarked pages existed, nothing was discarded.

After deletion, the triangle family therefore has at most

    8 old + 16 crossing + (4 + 16 + 2) book = 46 triangles.

Dropping all remaining edges in no triangle, apart from retaining the named B edges, and then dropping isolated vertices gives a finite actual-graph support. A deliberately loose vertex bound is 3*46+2*5=148, including endpoints of retained terminal edges. All retained triangles are actual graph triangles; deleting edges creates no additional triangles. The piece restrictions remain flat and triangle-separated. Every deleted page edge lies outside S union B, so B is unchanged and the triangle family of H0=F-B is unchanged. The kernel preserves tau and nu and the residual old triangle core; it does not prove the desired eight-edge cover. Its purpose is to replace an unbounded book multiplicity by a completely explicit finite obstruction target.

This 46-triangle bound uses the fact that every crossing triangle is NEW and therefore has a B edge. If one deliberately avoids that refinement and counts both outside-support edges of each crossing triangle, the same argument gives a conservative 62-triangle bound. Neither bound has been used for a computation in this session.

## Kernel scope warning

Final kernel scope clarification (22:08 UTC): the book reduction preserves the CLOSED graph's tau and nu and the stated five-edge hypotheses. It does not preserve every forced boundary-cover state or every individual piece signature. For example, a q-page book with its spine forbidden from the cover has cost q, which becomes two after this compression. Therefore this is not a universal replacement gadget for subsequent arbitrary gluing. The exact response formulas and the closed-instance kernel serve different purposes and must not be conflated.
