> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A supplied clique-and-odd-cycle certificate for CS

Frozen ordinary conditional theorem, 2026-11-16. Fresh review requested. This records a paid odd-cycle mechanism rather than a universal availability claim. No novelty claim.

## Exact supplied certificate

Let X=X(G) be the actual triangle-intersection graph of a finite simple graph G. Suppose a family of cliques Q_i and odd cycles O_j of X covers every vertex of X and has total cost

    B = number of cliques + sum_j (|O_j|-1)/2 <= nu(G).

Every cycle has length at least five; triangles may instead be listed as cliques. Repetitions and overlaps are allowed. A cycle need not be induced for the ordinary covering argument below. An independent set meets a clique at most once and an odd r-cycle in at most (r-1)/2 vertices, so coverage gives alpha(X)<=B. Since alpha(X)=nu(G), the assumed inequality certifies equality B=nu(G).

Then G satisfies Tuza, with equality exactly when every nonempty triangle component has literal K4 support.

## Construction and strictness

Each clique is an actual pairwise edge-intersecting triangle family. It is a common-edge book, which costs one actual edge to cover, or three/four faces of a literal K4, which cost two. The graph-specific closure and shared-support saving were independently established in `perfect_triangle_intersection_cs_v1.md`.

Write an odd r-cycle as triangle vertices T_0,...,T_(r-1). The shared graph edges of consecutive pairs supply a cover of this family with at most (r+1)/2 edges: select a minimum edge cover of the abstract r-cycle and, for each selected adjacency, select the graph edge shared by its two actual triangles. Repeated choices only reduce the count. Other intersections or additional graph triangles do not invalidate this family cover; all actual triangle vertices are accounted for by the supplied global family.

Consequently, if b of the supplied cliques are books, then

    tau(G) <= 2B - b - sum_j (|O_j|-3)/2.

Every odd-cycle summand is positive. Therefore equality tau=2nu requires no cycle and no book clique. All remaining cliques have literal K4 support. If two such supports share an edge, opposite-edge covers containing that edge save another unit, contradiction. Thus the supports are pairwise edge-disjoint and, since all actual triangles are covered, are exactly the nonempty triangle components. The converse is additive and supplies its own clique certificate.

## Exact polyhedral availability interface

One sufficient condition for the certificate is that the following finite rational system is totally dual integral (TDI):

    x>=0;
    sum_(v in Q) x_v <=1 for every clique Q of X, including singletons;
    sum_(v in O) x_v <=(|O|-1)/2 for every induced odd cycle O of length>=5.

TDI is an explicit condition on this system: for every integral objective with finite optimum, the dual has an integral optimum. With integral right-hand sides, TDI gives an integral primal polytope; its integer points are exactly the stable-set incidence vectors. For objective all ones, its optimum is therefore alpha(X). The nonnegative integral dual is precisely a repeated clique-and-odd-hole cover of cost alpha(X). This is the only availability inference used here. Merely asserting that the primal stable-set polytope is integral (ordinary h-perfection) does not establish this integral dual certificate.

The plain supplied-certificate theorem above uses neither polyhedral integrality nor a published graph-class theorem. The displayed TDI system is stated directly, without depending on terminology for strong h-perfection.

For authenticated context, Schrijver's *Strong T-Perfection of Bad-K4-Free Graphs*, SIAM J. Discrete Math.15(3) (2002),403–415, [original CWI PDF](https://ir.cwi.nl/pub/10086/10086D.pdf), printed pp403–404, explicitly defines strong t-perfection through TDI and its equivalent integral cover by vertices, edges and odd circuits. That is the narrower edge-based system, not an assertion of our clique-system availability. We inspected its definition and theorem statement; the full structural proof is not a premise here. Preserved PDF SHA256 `c3c9a608a8783745b8856fa28ffbedb6664075e103875186272250c49e26273a`,1956471bytes,13pages, with receipt in `literature/cycle_cover_duality/`.

## Literal boundaries, including already classified graphs

K5 refutes universal availability. Its X has ten vertices, independence number two, and every clique has size at most four. A cost-two certificate could only contain two cliques, or one five-cycle; these cover at most eight or five vertices. Therefore no such certificate exists although K5 is a classified equality graph.

K6 also fails the certificate, despite satisfying strict Tuza. Here X has twenty triangle vertices, nu(K6)=4, and maximum clique size four. Every allowable piece covers at most four times its cost, so a cost-four certificate covers at most sixteen vertices. To check nu(K6)=4 without an optimizer: four triangles are obtained from a triangle decomposition of K2,2,2; five would use all fifteen K6 edges, impossible because each packed triangle contributes even degree at every vertex whereas K6 has odd vertex degrees. Thus even removing isolated K5 components would not ensure certificate availability.

The remaining structural question is whether more useful paid pieces can be added while retaining an independently provable packing dual, or whether minimum-CS residual structure forces this certificate after a specified reduction. Neither statement is proved here. Adding arbitrary rank inequalities whose cover bounds require Tuza would be circular.
