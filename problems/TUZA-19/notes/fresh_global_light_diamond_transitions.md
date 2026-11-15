# Light-edge diamonds under triangle-full minimum covers

Status: ordinary local lemmas and a precise incidence-only obstruction. No global Tuza proof, no actual-graph counterexample to the light-edge gate, and no Lean verification are claimed. All work shares the original TUZA-19 research cutoff 2026-11-15T09:23:58Z.

Write c(e) for the number of actual graph triangles containing e. Call e light when c(e)<=2. TF means that each actual triangle is contained in some minimum ordinary triangle cover.

## Adjacent light edges cannot occur in a K4 of a TF graph

Suppose a,b,c,d induce a K4 subgraph and ab,ac are light. Each has exactly two triangle pages: abc,abd for ab, and abc,acd for ac. Let C be a minimum cover containing all three edges of abc. Every selected edge in a minimum cover has a private triangle, one meeting C only in that edge; otherwise the edge could be deleted.

For ab, the triangle abc is not private, so abd must be private. Thus ad,bd are outside C. Likewise acd must be private for ac, so ad,cd are outside C. Now

    C'=(C minus {ab,ac}) union {ad}

is a cover of size |C|-1. The triangle abc retains bc, the two other pages abd and acd gain ad, and no other triangle contains either removed light edge. This contradicts minimality.

Therefore the light edges in every K4 of a TF graph form a matching. This uses TF only, not packing resilience or violation tightness. In particular, if the graph formed by edges of codegree at least three is triangle-free, every K4 has exactly two opposite light edges and four heavy edges forming a C4. Zero or one light edge would leave a heavy triangle, while two light edges must be disjoint.

More generally, for two light edges in the same triangle, their alternative-page tips must be distinct: a common tip would create exactly the forbidden K4 above.

## A common residual maximum packing for the two pages

Suppose G has nu(G)=k, every two-edge deletion preserves nu, and deleting the edges of every actual triangle leaves packing number k-1. If ab has exactly the pages T=abc and T'=abd, choose a maximum packing avoiding ac and bc. It must use ab: otherwise it would survive deletion of all three edges of T, contradicting nu(G-E(T))=k-1. Its triangle on ab must be T'.

Removing T' leaves a (k-1)-packing avoiding all five edges of T union T'. Conversely any packing avoiding those five edges can be extended by T, so its size is at most k-1. Hence

    nu(G-E(T union T'))=k-1.

The same residual packing can be completed either by T or by T'. This is an exact simultaneous compatibility statement, stronger than separate membership of T and T' in maximum packings. It does not by itself supply a two-edge cover extension of that residual graph.

## Cover plateaus and triangle-constraint criticality

Let C be a minimum cover containing T=abc, with light edge ab. TF forces any edge in an actual triangle to have codegree at least two: a codegree-one edge in a full minimum-covered triangle would be removable. Thus ab has a unique other page T'=abd. As above, T' is its unique private triangle and ad,bd are unselected.

The set C-ab covers every triangle except T', avoids all edges of T', and has size tau(G)-1. Adding any one of ab,ad,bd gives another minimum cover. The newly added edge has T' as its only private triangle: the partial cover already covers every other triangle. These are exact cost-preserving moves, but no progress toward a smaller cover is guaranteed.

If every actual triangle has a light edge and G is TF, each triangle T can be the unique uncovered triangle of a (tau-1)-edge set disjoint from T. To see this, select a light edge e of T and choose a minimum cover containing the other page on e; removing e exposes precisely T. Equivalently the triangle-incidence hypergraph is transversal-critical under deletion of any one triangle constraint. This does not mean that one partial cover works simultaneously for all T.

## Why incidence-only coordination cannot suffice

Consider the abstract 3-uniform hypergraph with heavy points h1,h2,h3,h4 and light points l1,l2,l3, whose six hyperedges are

    {h1,h2,l1}, {h3,h4,l1},
    {h1,h3,l2}, {h2,h4,l2},
    {h1,h4,l3}, {h2,h3,l3}.

Every hyperedge has one degree-two point; the other four points have degree three. Every two hyperedges intersect, so nu=1. Any two points cover at most five hyperedges, while {l1,l2,l3} covers all six, giving tau=3=2nu+1. Each hyperedge itself is a minimum cover because the hypergraph is intersecting, so the hypergraph has the analogue of TF. Any two-point deletion preserves its one-edge matching, while deleting all three points of any hyperedge leaves no hyperedges, giving the analogue of the exact triangle-deletion tightness.

This is the six-line Fano-minus-one-line incidence pattern, equivalently the proper three-color one-factorization of a resource K4. It is an abstract hypergraph example, not an actual graph-triangle counterexample. It shows that the numerical tightness, degree-two pages, TF, two-deletion resilience, and the common-residual-packing observation cannot alone prove the desired graph theorem. A successful exchange argument must use additional endpoint closure of actual graph triangles. The K4 obstruction proved above is one such genuinely graphical restriction.

No global coordinated-flip lemma or sufficient flow theorem is proved here. The local inequalities and exact hypotheses are retained for the separate endpoint investigation.
