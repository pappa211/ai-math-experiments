> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A critical-edge selection candidate fails, and its leaf-rich interface is reducible

Frozen ordinary diagnostic and scoped repair, 2026-11-16. This refutes an exploratory matching lemma, not CS or the apex-unicyclic exclusion target. No computation is used.

## 1. Exact failed matching statement

A proposed route for nonperfect triangle-free unicyclic F was to find a maximum matching M exposing an original leaf u such that either

    tau_vertex(F-M)<nu(F),

or F-M has a vertex-cover-critical edge other than the leaf edge at u. Here an edge e is critical when deleting it lowers the vertex-cover number. Such an edge would be supported in a balanced residual and would contradict residual-cover invariance.

This selection statement is false even for very elementary connected unicyclic graphs.

Take a cycle C_n, n>=4, and attach THREE private leaves to each of its vertices. Then nu(F)=n. Every matching has at most n edges, because every edge meets a cycle vertex. The n leaf edges obtained by choosing one leaf at each cycle vertex form a maximum matching. Conversely a maximum n-matching cannot use a cycle edge: that edge consumes two cycle vertices for one selected edge, leaving at most n-1 matching edges in total. Therefore EVERY maximum matching consists of one leaf edge at each cycle vertex.

For every such M, the remainder R=F-M is C_n with two leaves at each cycle vertex. Its cycle vertices form an n-cover, and matching each cycle vertex to one remaining leaf proves tau_vertex(R)>=n. Hence tau_vertex(R)=n=nu(F).

No edge of R is cover-critical. After deleting a cycle edge, the same n disjoint leaf edges remain. After deleting a leaf edge, use the other remaining leaf at its cycle vertex and one leaf at every other cycle vertex, again obtaining an n-matching. The same n-vertex cover still works. Thus tau_vertex(R-e)=n for EVERY edge e, including every candidate other than the exposed leaf edge.

This covers every choice of M and every exposed original leaf u, not just one displayed matching. The failure comes from spare leaves, not a timeout or a finite sample.

## 2. The actual apex-link family nevertheless has a direct CS exclusion

Let F be C_n, n>=4, with at least TWO private leaves at every cycle vertex. Let L=F+w, with arbitrary w-adjacencies, subject to minimum degree two in L. Thus w sees every leaf. Suppose L were a closed link component at h in a minimum CS failure.

Write A for the n cycle vertices. Choose distinct cycle vertices a,b. Choose an unused leaf z at b for the edge wz, and choose one leaf edge at each cycle vertex, using a different leaf at b. Let x be the chosen leaf at a. These n leaf edges together with wz form a matching P of size n+1. The set Q=A union {w}, also of size n+1, covers L-P. Balanced deletion therefore gives a B residual with packing nu(G)-(n+1).

If w sees some cycle vertex a, choose a as above and use the actual triangle T=wax. It meets P in ax. Replace ax in P by ay, where y is another leaf at a, retaining all other selected edges including wz. This gives a matching Z of the same size avoiding E(T). Since F is triangle-free, L is K4-free and every residual clique block contains at most three L vertices. The whole matching-plus-rim footprint is at most a two-edge star per block, by the established rim audit. Thus its n+2 triangles augment, contradiction.

If w sees no cycle vertex, L is triangle-free. The same leaf replacement gives a matching Z avoiding f=ax. Codegree at least two supplies another page on ax with apex outside N(h); in each old block the complete matching-plus-page footprint is a two-edge star or smaller. This again augments by one.

Therefore this entire leaf-rich apex-unicyclic link family is excluded ordinarily, even though the isolated critical-edge selection lemma fails on the three-leaf subfamily.

## Role and remaining obligation

The nonperfect branch needs a combined alternative: a strict cover tuple, a supported critical edge, a rim-triangle augmentation, or a safe external-page exchange. The critical-edge alternative by itself is unavailable. The leaf-rich construction shows exactly why the triangle/alternate-matching mechanisms must remain in the architecture.

Dependencies for the scoped link exclusion are only authenticated minimum-CS accounting/codegree and elementary clique avoidance. The matching counterexample is self-contained. No finite input, Kotzig theorem, or general WKE-to-CS assertion is used.
