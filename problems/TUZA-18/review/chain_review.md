# Independent review of the connected Hall-deficiency chain

This review is a separate final package. It leaves the earlier 22-file fresh-context package, 37-file PK package, and 17-file identification/gluing addendum unchanged. It received the coordinator's outline and the shared campaign context, then reconstructed the ordinary proof and authored a separate literal checker. It is not fresh-context review, external human peer review, Lean verification, or a historical-originality claim. The requested reviewer model/effort remains gpt-6-astra / ultra, without a separate runtime-identity assertion. Mathematical work stops at 2026-11-14 21:00:10 UTC.

**The all-size proof survives independent review.** It refutes every fixed positive radius of strict global Hall-deficiency descent on equal-cost support-contained covers, even with one shared-edge triangle component and a genuinely maximum all-type1 prescribed packing. It supplies explicit successful covers at the exact claimed repair distance. It does not refute existential star gluing or PK for that packing, ordinary Tuza for the graph, plateau moves, richer separator states, or algorithms that change the packing.

## Exact reviewed inputs

The frozen theorem is `notes/late_star_connected_pivot_obstruction.md`, SHA-256 `0a5491534d7c85fb7206e4f0ffddafaf1c179f2b40ad0c198135f229e124f4cd`. The supplied N=3 certificate is `evidence/late_star_connected_chain_verified.json`, SHA-256 `0a552f9d2205363f4199d103720a26e26d6d3ea7c7354223dae877393f100e2d`. The supplied checker is preserved at SHA-256 `1a62ed083fe4e9ef5fcbccc137c757bb793004917c2ae711401c4b46cfd3a00b`; I did not import or run it.

The base-block proof is the corrected `late_star_gluing_obstruction.md`, SHA-256 `6ded16c3c61ef3029e86d7c9399bac6e3090ff80e204fd50023ce0f8fc6fee0b`, and its literal certificate has SHA-256 `932dd4dcf96819c89094c91302218a3d3a7154254f063b8457b7b0e8539c90a0`. Both were independently reviewed in the preceding addendum and are copied into this package as frozen dependencies. Their word “minimum” means minimum among covers contained in the prescribed packed support.

## Reconstructing the block and the clique-sum geometry

The seven-vertex block is K7 on labels {0,1,2,3,4,5,7}, with missing edges 05,57,13,24. The packed members in order are T1=237, T2=012, T3=147, T4=345. They have twelve distinct edges. The block has seventeen edges and six odd-degree vertices. A five-packing would use fifteen edges, leaving two edges with six odd-degree vertices, impossible; six triangles already require more than seventeen edges. Thus its prescribed four-packing is maximum.

Its unique private-supported bases are 37,12,47,34, and their private witnesses force all four bases into every support cover. The residual constraints are the two independent paths 17--01--14--45 and 27--02--23--35. Each path has minimum cover size two and three minimum states. Consequently the block's support-cover minimum is eight and its nine minimum states are completely characterized. The initial state C0 selects the bases together with 01,02,14,23; its member costs are (2,3,2,1), with heavy H=012 and light L=345 disjoint.

The outgoing edge 07 and incoming edge 15 are both outside packed support and have disjoint endpoint sets. The chain identifies 0_i with 5_(i+1) and 7_i with 1_(i+1). Within an interior block no incoming vertex is an outgoing vertex. Hence each equivalence class contains vertices from at most two adjacent blocks, every block embeds injectively, adjacent blocks intersect in exactly the designated two vertices and their edge, and nonadjacent blocks have disjoint vertex sets. This prevents a hidden repeated identification from collapsing two vertices of one block or creating a long-range vertex intersection.

At each step the new block is attached along a two-vertex clique. A triangle with an exclusive vertex on each side would require an edge between the exclusive sides, and no such edge is inserted. A triangle cannot lie wholly in the two-vertex intersection. Inductively every actual triangle therefore belongs to exactly one original block, not merely to at least one block. All sixteen local triangles survive. This proves the exact counts 5N+2 vertices, 16N+1 edges, and 16N actual triangles.

The overlap edge participates in actual triangles on both sides: for example outgoing 07 lies in 017,027,037,047, while incoming 15 lies in 125,145. Each block's triangle family is itself shared-edge connected. The shared edges therefore join all block families into one actual shared-edge triangle component. This is the substantive improvement over the earlier vertex-sum chain.

## Maximum packing, original allowed edges, and minimum-cover factorization

Although unrestricted triangle-cover numbers need not add across an edge sum, the needed packing upper bound is valid. Assign every triangle in any global packing to its unique block. The assigned subfamily is a local packing and has at most four members, so the total is at most 4N. The union of the prescribed local packings attains 4N: no local prescribed triangle uses either overlap edge, and all packed-support edges are distinct globally. Thus maximum cardinality is proved, not presumed from a planted packing.

No actual triangle crosses blocks. Moreover a local triangle contains no packed edge from a different block, because the only common graph edge is outside both supports. Every original private page consequently remains private with the same singleton base, and no new private-supported edge appears. All 4N prescribed members stay type1. A private K4 completion would supply private pages on all three edges of a packed member, so none exists. The original permitted set is exactly A(P)=B.

For the same reason, a B-contained cover must cover a block using that block's own B_i edges. Each restriction has size at least eight. Since the B_i are disjoint, total size is at least 8N, attained by any product of local minima. Equality forces every block restriction to have size exactly eight. Thus every minimum global support cover is a product of the nine local minimum states. The argument does not assert unrestricted-cover additivity, and no shared outside-B edge is being charged as if it were selected support.

Each local minimum covers all four packed triangles. If its numbers of light, balanced, and heavy members are l,b,h, then l+b+h=4 and l+2b+3h=8. Subtracting twice the first equation gives h=l separately in every block. This local balance, rather than only total balance, drives the cut argument.

## The initial Hall deficiency and the forced repair size

Take C0 in every block. The heavy vertices of the intersection graph are H_i=012_i; its light vertices are L_i=345_i. Through the first identified endpoint, H_i meets L_(i+1). The second endpoint 7_i=1_(i+1) belongs only to balanced members on its left side in this state, so it supplies no additional heavy/light edge. There are no local heavy/light intersections and no nonadjacent-block intersections. Hence the graph consists exactly of the N-1 disjoint edges H_i--L_(i+1), leaving L1 and H_N unmatched. Its deficiency h-matching is exactly one.

Now let C' be any minimum support cover with deficiency zero. It has a matching saturating all heavy members. Since h=l in every block and hence globally, this matching saturates all light members as well. For any prefix of blocks, internal matching edges consume one heavy and one light vertex of the prefix. Its equal initial counts force the number of matched edges leaving the prefix from a heavy vertex to equal the number entering its light vertices. This is a counting identity for the chosen matching, not a claim that the entire cut graph is itself balanced.

Suppose adjacent blocks i and i+1 both remain in state C0. Only triangles from these two blocks can intersect across their cut, since nonadjacent blocks are vertex-disjoint. The cut graph then has exactly one possible heavy/light edge, H_i--L_(i+1), directed from prefix heavy to suffix light. Prefix balance forbids using it: there is no crossing edge in the opposite direction to compensate.

But L_(i+1) has no remaining possible partner. Within its unchanged block it is disjoint from the only heavy member. Its only incoming-port vertex is 5_(i+1), which meets only H_i among the preceding block's heavy members. It avoids both outgoing vertices 0_(i+1),7_(i+1), so no later block state can help. Thus the necessary perfect matching cannot exist. Therefore every adjacent pair contains a changed block.

The first block must also change. If unchanged, L1 has no predecessor, no local heavy neighbor, and no outgoing-port vertex. It is isolated regardless of all later states. The changed block indices consequently contain one and form a vertex cover of the path of block indices. Such a set has size at least ceil(N/2): after block one, it must meet each disjoint pair (2,3),(4,5), and so on.

Every changed block removes at least one previously selected support edge and adds at least one other, because its restriction remains of size eight. Block supports are disjoint, so the changes cannot cancel across blocks. Every compatible minimum C' therefore satisfies

    |C symmetric_difference C'| >= 2 ceil(N/2).

Deficiency is a nonnegative integer and the initial deficiency is one. A strict decrease must reach zero, so the bound applies to every strict improvement, not merely to a special choice of matching or local state. For each positive integer radius r, choose N=2r+1. Then ceil(N/2)=r+1 selected-edge replacements are necessary. No equal-cost change replacing at most r selected support edges strictly decreases the potential. The proof allows all nine local minimum states, including those with multiple heavy/light members; it is not restricted to the four one-pivot neighbors of C0.

## The lower bound is attained

In each odd block remove edge 23 from C0 and add 35. In the second residual P4, this changes the minimum state {02,23} to {02,35}, so it remains a minimum support cover. The new member costs are (1,3,2,2): H_i remains heavy and T1_i=237_i is now light. Even blocks remain unchanged.

For every odd/even pair i,i+1, match H_i to L_(i+1) at 0_i=5_(i+1), and match H_(i+1) to T1_i at 1_(i+1)=7_i. These are two distinct matching edges with opposite crossing directions and distinct heavy/light endpoints. If N is odd, the last heavy H_N matches its own light T1_N at vertex 2_N. This saturates every heavy and light member. The cover changes exactly one selected edge in each of ceil(N/2) blocks, attaining the symmetric-difference lower bound.

By the previously audited heavy/light equivalence, this matching supplies a valid common-center grouping for the prescribed P. The support cover has size 8N=2nu, so it also certifies ordinary Tuza for the graph. It explicitly certifies the required PK cover for this prescribed maximum packing. It is not, without further work, a statement about every other maximum packing of the chain.

## Independent N=3 literal check

The independently authored checker is `SCRATCH_OUTPUT/tuza18_chain_literal_check.py`, SHA-256 `c299bb410a266acaf3c780e4bc8c1dbc5f162b70d83bd52d7599b3ec2aebd904`. Its receipt reports PASS at 20:00:57 UTC. It uses only the Python standard library, imports no producer checker, and does not replay a discovery corpus or test a larger N.

Starting from the literal block edges, the checker constructs the identifications and verifies their injective block maps and pairwise intersections. It reconstructs all triples of the seventeen-vertex graph and finds exactly forty-eight actual triangles, each owned by exactly one block, in one shared-edge component. It verifies the prescribed twelve-packing and the local six-odd-vertices parity certificate, which together prove nu=12 without a global packing oracle. It checks all twelve private-base sets and excludes every private K4 completion, giving original A(P)=B.

It independently enumerates the local nine minima and their 729 three-block products, checking every actual triangle for every product. The exact support-cover minimum is twenty-four by the audited factorization. Of those minima, 560 have deficiency zero. Every compatible state changes block one and hits every path edge; the closest has symmetric difference four. All twelve valid one-edge pivots from the initial state leave deficiency one or two. The odd-block repair has deficiency zero at distance four, and its explicit saturating matching is checked against the actual packed vertex sets. These finite results corroborate the literal instance; the unbounded lower bound comes from the ordinary argument above.

## Final scope judgment

No mathematical defect was found in the frozen all-N theorem. The connected construction defeats the proposed strict-descent potential even after replacing a global sum by a sum over actual shared-edge triangle components, because there is only one such component. It retains two-vertex clique separators, so a richer separator-state method remains possible. It does not forbid equal-potential intermediate moves, temporary cost increases, a different potential, changes to the prescribed packing, or genuinely nonlocal repairs. It provides no actual minimal Tuza violation and no failure of existential gluing. The exact counterclaim is bounded-radius strict decrease of this global Hall deficiency on equal-cost B-contained covers for the specified maximum P.
