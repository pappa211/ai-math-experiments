> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Minimum-cover components: an exact conflict representation and its limitation

Status: exploratory architecture with elementary lemmas; not a global factor-two proof. Fresh review is needed before using the lemmas downstream.

Let C be a minimum triangle-edge cover of G. Let C_i be the nonempty connected components of the graph with edge set C, and let A_i be their pairwise disjoint vertex sets. Every actual triangle has all of its C edges in exactly one C_i: two cover edges in a triangle share a vertex, hence lie in one component. Let F_i be the triangles assigned to C_i, and let G_i be the union of their literal edge supports.

The actual triangles of G_i are exactly F_i. Every triangle of G_i is a G triangle and meets C. No C_j edge with j different from i occurs in G_i, because any triangle containing it would have been assigned to j. Thus every G_i triangle is assigned to i; the reverse inclusion holds by construction. Moreover tau(G_i)=|C_i|. A smaller cover of F_i, combined with C outside C_i, would cover all G triangles with fewer than |C| edges.

Choose an arbitrary packing P_i in each F_i. Call a member internal if all its vertices lie in A_i, and external otherwise. An external member has one base in C_i and one apex outside A_i, and no other C edge. An internal member has no conflict with any member of P_j for j different from i: all its edges have endpoints in A_i, whereas a j-triangle has two vertices in A_j and at most one in A_i.

For external members, cross-family intersection can occur only between an i-page whose apex belongs to A_j and a j-page whose apex belongs to A_i. Their common edge joins A_i to A_j. Thus every cross-conflict component involves one fixed unordered pair {i,j} and is bipartite. Each selected triangle has at most two such conflicts, one per spoke, because P_j is already edge-disjoint. Consequently the complete conflict graph of the selected external triangles is a disjoint union of paths and even cycles, plus isolated vertices.

It follows constructively that

    nu(G) >= sum_i (number of internal members of P_i)
             + (1/2) sum_i (number of external members of P_i).

More precisely each path/cycle component contributes its independence number, with a half-unit rounding gain for each odd-order path. No abstract hypergraph or matching-matroid representation is used.

## The missing local bound is genuinely missing

A tempting sufficient condition would be to choose P_i with

    2*(internal members) + (external members) >= |C_i|

for every i. This is false even for a literal minimum-cover component. In K5 with one edge deleted, take C_i to be the triangle on the other three vertices. Its cover number is three. The other two vertices are independent universal apices. A packing consisting of the internal triangle has weight two; a largest external packing has two triangles and also weight two. There is no mixed packing containing the internal triangle, since every external triangle uses one of its edges. Thus the maximum weight is two, less than |C_i|=3.

The global min-cover condition can still obstruct how such deficient pieces interact; it does not eliminate the local example. A viable continuation would need a simultaneous cover replacement or a controlled exchange between components, paying for these local deficits. The exact conflict decomposition alone supplies only the displayed weighted bound and does not prove Tuza, CS, or availability of favorable local packings. In the one-component case, a general bound of the proposed type would itself contain the full Tuza problem.
