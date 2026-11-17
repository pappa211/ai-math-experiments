> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-free links with at most ten edges are WKE

Frozen proof candidate for independent review,2026-11-15. This is a symbolic reduction using the independently verified finite-premise Tsujimura WKE family, the reviewed elementary Hamiltonian WKE theorem, and elementary matching arguments below. No new enumeration is used. It is not an ordinary proof free of finite premises, because the named Tsujimura family retains its verified computer-assisted status.

## Theorem

Every finite triangle-free graph L with minimum degree at least2 and at most10 edges is WKE. Here WKE means a matching M and a vertex cover Q of L-M with |Q|<=|M|.

We use two accepted families:

- A graph of minimum degree2 and maximum degree4, with at most two degree3 and at most two degree4 vertices, is WKE. Exact arbitrary-order statement and independent finite-premise audit: `review/tsujimura_wke_primary_audit.md`.
- Every subcubic Hamiltonian graph is WKE: `notes/subcubic_hamiltonian_wke_v1.md`, independently reviewed in `review/hamiltonian_and_nonwke_boundaries_review.md`.

Bipartite graphs are WKE: choose a maximum matching M of L; the bipartite graph L-M has vertex-cover number equal to its matching number, at most |M|. Disjoint unions combine witnesses, so it suffices to consider connected L. Write n=|V(L)|, m=|E(L)|. Minimum degree gives n<=m<=10.

## 1. A high degree forces bipartiteness

If a vertex v has degree d>=5, its neighborhood N is independent. Every member of N has degree at least2. Since no edge has both endpoints in N, at least2d edges are incident with N. Thus m>=2d. The edge budget forces d=5, m=10 and every graph edge incident with N. The partition N, V(L)-N is then bipartite. Therefore a nonbipartite example has maximum degree at most4.

## 2. A small subcubic matching lemma

**Lemma.** A triangle-free graph with minimum degree at least2 and maximum degree at most3 on7 vertices has a matching of size3. On8 vertices it has a perfect matching.

Let M be maximum, with r edges and u unmatched vertices. The unmatched vertices are independent. The endpoints of any matched edge cannot both have unmatched neighbors: the same unmatched neighbor would make a triangle, and two different ones would give an augmenting path of length3. Hence at most r matched endpoints receive edges from unmatched vertices, each with capacity at most2 besides its matched edge. Minimum degree at the unmatched vertices gives2u<=2r, so n=2r+u<=3r. This proves the7-vertex assertion and reduces the8-vertex assertion to excluding r=3.

Suppose on8 vertices there are exactly two unmatched vertices x,y and matching edges aa', bb', cc'. Each unmatched vertex has at least two neighbors on distinct matching edges, so their neighbor index sets among these three edges intersect. Relabel so both meet a. Vertex a is saturated with neighbors a',x,y. Since a' has degree at least2, choose a neighbor b other than a; it cannot be x or y because that would form a triangle. Relabel the other two matched pairs accordingly.

Neither x nor y can meet b': such an edge gives an augmenting path from the other unmatched vertex through a,a',b,b'. Vertex b already meets a',b' and can meet at most one of x,y. Choose the name y so that y does not meet b. Its second neighbor must then be an endpoint of the remaining matching edge; call that endpoint c.

Vertex b' needs another neighbor. It cannot meet a (already degree3), a' (triangle a'bb'), x or y (the preceding augmentation), so it meets c or c'. An edge b'c' gives the augmenting path x-a-a'-b-b'-c'-c-y. Therefore b' meets c.

Vertex c' needs another neighbor. It cannot meet a (degree3), b' (triangle b'cc'), y (triangle ycc'), x (augmenting path x-c'-c-y), or a' (augmenting path y-c-c'-a'-a-x). Thus it must meet b. Now b is saturated with a',b',c'. The vertex x still needs a second neighbor besides a; all other possibilities except c have just been excluded by degree, triangle or augmentation conditions. Hence x meets c. But c then has four distinct neighbors c',b',x,y, contradicting maximum degree3. The lemma follows.

**Four-branch consequence.** If a triangle-free graph on7 or8 vertices has exactly four degree3 vertices and all others degree2, it is WKE. Choose the matching just constructed. At order8 it is perfect; every vertex of degree at least2 in L-M must be one of the four original degree3 vertices. Thus L-M has no odd cycle, since triangle-freeness requires any odd cycle to have at least5 vertices.

At order7 the matching leaves one unmatched vertex w. If w has degree3, again at most four vertices can have degree at least2 in L-M. If w has degree2, an odd cycle in L-M would have to be exactly a5-cycle containing w and all four degree3 vertices. None of those four vertices can be matched to another vertex of this cycle: w is unmatched, and a chord of a5-cycle creates a triangle in L. They would require four distinct matching partners outside the cycle, but only two vertices are outside. This is impossible. Hence L-M is bipartite in every case, and its vertex-cover number is at most the maximum matching number of L, namely |M|.

## 3. Completing the degree and short-cycle cases

Assume L is nonbipartite. For n>=8, Section1 gives maximum degree4 and

    sum_v(d(v)-2)=2(m-n)<=4.

The number of degree3 vertices is even. Therefore every degree profile is in the accepted Tsujimura family except exactly four degree3 vertices and no degree4 vertices. That exception has m=n+2<=10, so n=8 and Section2 applies.

For n<=4 no triangle-free odd cycle is possible. At n=5 a nonbipartite triangle-free graph is exactly C5. At n=6 a shortest odd cycle is an induced C5; the remaining vertex has exactly two nonconsecutive neighbors on it, by minimum degree and triangle-freeness. This gives exactly two degree3 vertices and otherwise degree2, within the accepted family.

At n=7, a shortest odd cycle has length5 or7. In the7-cycle case there is no chord, since any chord would produce a shorter odd cycle; the graph is C7. In the5-cycle case, call the remaining vertices x,y and their cycle-neighbor sets S,T. Both are independent subsets of C5 and have size at most2.

If xy is absent, minimum degree forces |S|=|T|=2. If |S intersect T|=2 or1, the degree profiles have respectively two degree4 vertices or one degree4 and two degree3 vertices; these lie in the accepted family. If S,T are disjoint, there are exactly four degree3 vertices and Section2 applies.

If xy is present, triangle-freeness forces S,T disjoint, and minimum degree makes both nonempty. Sizes1+1 give two degree3 vertices; sizes2+1 give four degree3 vertices and Section2 applies. It remains that both sizes are2. Let z be the unique C5 vertex outside S union T, and list the remaining cycle vertices a,b,c,d in path order between its two neighbors, so C5 is z-a-b-c-d-z. Up to swapping x,y, the only partition of these four vertices into two independent pairs is S={a,c}, T={b,d}. Then

    a-x-c-b-y-d-z-a

is a Hamiltonian7-cycle. The graph is subcubic (six degree3 vertices and one degree2 vertex), so the accepted Hamiltonian WKE theorem applies. This exhausts every case and proves the theorem.

## 4. Reusable minimum-cover consequence

Under the separately reviewed triangle-free WKE exclusion (which declares Kotzig's theorem), every triangle-free closed link component of a minimum combined-CS failure has at least11 edges.

Let C be any triangle-edge cover of such a graph G with |C|<=10, and let v be outside V(C). Every triangle through v must be covered by its opposite rim edge, since neither spoke is in C. Thus the entire induced link G[N(v)] is a subgraph of C and has at most10 edges. Edge-codegree at least2 gives minimum degree at least2 in every link component. The preceding theorem and WKE exclusion imply that every link component contains a triangle.

Archived M3 also gives order at least5 for every link component. A connected graph of order at least5 and minimum degree2 with exactly as many edges as vertices is a cycle; if it contains a triangle, it must therefore have at least one more edge than vertices and hence at least6 edges. Two such link components would use at least12 edges. Consequently G[N(v)] is connected, contains a triangle, and has at most10 edges. Its order is at most9, because order10 would force a10-cycle. In particular every vertex outside V(C) lies in an actual K4 of G and has degree at most9.

This does not prove V(C)=V(G), classify the remaining triangle-bearing links, or exclude a packing-five obstruction. It gives an explicit bounded edge-support interface and removes triangle-free components by a theorem, not by sampled graphs. Dependencies remain separate: the WKE theorem combines a verified finite premise with symbolic arguments; the minimum-CS corollary additionally uses the declared Kotzig input and authenticated M3 local scope.
