# Line graphs admit odd triangle covers within twice their packing number

Status: ordinary proof candidate frozen for independent challenge. This was investigated as a potential source of counterexamples to H-O2: overlapping star-cliques in a line graph can create additional cycle triangles. The argument below rules out that entire construction direction. It is not a reduction of arbitrary graphs to line graphs, and no originality claim is made. Do not enlarge this terminal class without a new global transfer.

## Statement

For every finite simple graph H, its ordinary line graph G=L(H) satisfies

    π(G)≤2ν(G),

where π is the minimum cardinality of an edge set meeting every actual graph triangle in1 or3 edges. In particular τ(G)≤2ν(G). Neither cover-criticality nor packing resilience is assumed.

The proof is self-contained, using Euler tours and explicit clique packings. Its local-clique bounds are elementary classical complete-graph Tuza constructions; their historical priority is not claimed.

## Local clique certificates

Put q(d)=binom(floor(d/2),2)+binom(ceil(d/2),2), the number of monochromatic edges in a balanced bipartition of K_d. There is an explicit packing of at least q(d)/2 triangles in K_d.

For d=2t, label the vertices A_i,B_i for i in Z/tZ. Use

    A_i A_j B_(i+j), for each unordered pair i≠j.

Every A-A edge occurs once. A cross edge A_i B_k determines its other A-index j=k−i, so cannot repeat. There are t(t−1)/2 triangles, exactly q(2t)/2. No B-B edge is used. Consequently for even d≥4 this packing can avoid ANY one prescribed edge, by assigning that edge's endpoints to B_0,B_1. For d=0,2 the empty packing has the same required avoidance property.

For d=2t+1, add a vertex w to the same construction. The unused cross edges A_i B_(2i) permit triangles w A_i B_(2i). If t is odd, use all t indices; multiplication by2 is a permutation, so these triangles are disjoint. The total packing size is t(t+1)/2 and twice it is at least q(2t+1)=t². If t is positive and even, use i=0,...,t/2−1; the B-indices2i are distinct, giving total t²/2 and twice it exactly t². The cases d=0,1 are empty. These constructions prove every asserted local bound without an exact formula for ν(K_d).

## Triangle classification and independent local packings

For each vertex v of H, the incident H-edges form a clique K_(d_H(v)) in L(H). Their LINE-GRAPH edge sets are disjoint: two distinct H-edges in a simple graph have at most one common endpoint. Thus triangle packings chosen separately inside all these cliques unite into an edge-disjoint packing of L(H), even if the cliques share vertices.

Every triangle of L(H) is either three H-edges with a common endpoint, or the three edges of an actual triangle of H. Indeed three pairwise incident distinct edges with no common endpoint must close a three-cycle. These exhaust the actual triangles.

## Balanced edge coloring of a connected H

A two-coloring of E(H) is a vertex coloring of L(H). The monochromatic line-graph edges meet every triangle oddly, since any triangle in a two-coloring has either1 or3 monochromatic edges. Their number is

    Σ_v [binom(r_v,2)+binom(b_v,2)],

where r_v,b_v count the two colors at v.

If H has a vertex of odd degree, add a dummy vertex joined once to every odd-degree vertex. The augmented connected graph is Eulerian. Traverse an Euler tour starting at the dummy vertex and alternate the two edge colors. Every original vertex receives equally many edges of both colors in the augmented graph; any imbalance at the starting vertex occurs only at the dummy. Removing the added edges leaves a balanced split at each original vertex, including difference1 at the originally odd-degree vertices.

If H is Eulerian and |E(H)| is even, alternating around an Euler tour gives a balanced split at every vertex. In both these cases the resulting odd cover has size Σ_v q(d(v)), at most twice the union of the local clique packings.

It remains to handle Eulerian H with an odd number of edges. Alternating around an Euler tour produces a split t−1,t+1 at the chosen start vertex of degree2t, and a balanced split elsewhere. The odd cover therefore has size exactly

    Σ_v q(d(v)) + 1.

## Paying the single Euler-tour parity defect

All degrees are even in this remaining case, so the local clique packings have total size exactly

    p = Σ_v q(d(v))/2.

If H has an actual triangle abc, its three edges form an additional triangle Q in L(H). Q uses one line-graph edge in each of the three star-cliques at a,b,c. Choose each of those three local packings to avoid that prescribed edge, using the even-clique avoidance construction above; all other local packings are unchanged. Their union with Q is a packing of p+1 triangles. Consequently the odd cover of size2p+1 is within2ν(L(H)), with one unit to spare.

If H is triangle-free, the second type of line-graph triangle does not occur. Choose a balanced bipartition separately inside each star-clique, without requiring a single vertex coloring of the entire line graph. The selected line-graph edge sets are disjoint, and each actual triangle lies in exactly one such clique. Their union is therefore an odd triangle cover of size Σ_v q(d(v))=2p. This case uses the extra freedom of triangle parity over a single global cut.

Disconnected H is handled componentwise, since line graphs, triangle packings and odd covers decompose over its components. Isolated vertices contribute nothing. The proof covers all finite simple H.

## Scope and relevance

The theorem rules out ordinary line graphs as H-O2 counterexamples, including cycle-triangle interactions beyond the triangle-free-root case. It does not show that a minimal Tuza violation is a line graph, has a line-graph triangle-intersection graph, or admits a paid transfer to one. These are distinct statements. No such availability theorem emerged here.

Primary literature orientation: limited searches found the classical result for line graphs of triangle-free graphs, but a complete originality search has not been done. The theorem above is offered for mathematical review, not as a claim of a new result in the literature. No finite census or Lean verification is needed for its stated proof, and none has yet been claimed.
