> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# ALL-minimum exactness in a cone forces a unique assigned-family cover

Frozen ordinary conditional reduction, 2026-11-16. Source_audit. This retains actual triangles and the ALL-minimum-cover quantifier. It is not an unrestricted H-D theorem or a list-coloring minmax.

Let G=h+L be a finite simple cone, with L having no isolated vertices. Suppose EVERY minimum ordinary triangle cover of G meets EVERY actual triangle exactly once, and every triangle-bearing graph edge has triangle codegree at least two. The latter is necessary in a blocker-free original H-D graph: if an edge occurs only in T, deleting the other two T edges destroys exactly the same triangle family as deleting T and supplies the required two-edge blocker.

Choose any minimum cover C. Set S={v:hv in C}, and B=V(L) minus S. The exact-one equation on each hub triangle huv gives

    C = {hs:s in S} union E(L[B]).                         (1)

Here S is independent in L, every S--B edge is outside C, and every B--B edge is in C. The actual rim triangles also meet C exactly once. Consequently L[B] is triangle-free. Write A=L[B] and m=|E(A)|.

Every u in B has an S-neighbor. Otherwise u has a neighbor v in B because L has no isolates. The rim edge uv then occurs only in its hub triangle huv: there is no rim triangle through uv inside triangle-free A, and none with an S vertex adjacent to u. This contradicts triangle codegree at least two. Thus S dominates B.

Partition the actual triangle family according to its unique C edge. The family F_B assigned to the m rim bases E(A) consists exactly of

* huv for uv in E(A), and
* suv for s in S and uv in E(A) with u,v in N_L(s).

The remaining family consists exactly of hsu for s in S, u in B and su in E(L). It is covered by the |S| spokes hs. This is an actual-family partition, including every rim triangle; no crossing triangle is omitted.

The unique minimum ordinary edge cover of F_B is E(A).

Indeed its optimum is m, since a smaller cover combined with {hs:s in S} would improve C. Let D be any m-edge cover of F_B. Every edge of a minimum D belongs to this family. Its edges therefore are rim bases uv, hub spokes hu with u in B, or cross edges su. The union D with the selected spokes hs is disjoint and is a global minimum cover. If hu belongs to D, domination provides s in S with su present, and the actual triangle hsu is hit both by hu and by hs. If su belongs to D, that same triangle is hit by su and hs. Both contradict ALL-minimum exactness. Thus D contains only E(A), and cardinality forces D=E(A).

This uniqueness has a precise induced-neighborhood formulation. For nonempty F subset E(A), define

    H(F) = vc(A[F]) + sum over s in S of vc(A[F][N_L(s)]),

where A[F] has exactly edge set F and vc is ordinary vertex-cover number. Retaining E(A) minus F and covering the F pages separately at each apex has cost m-|F|+H(F): at apex h the selected vertices are hub spokes, and at apex s the selected vertices are cross spokes su. These spoke sets are disjoint across apices. If H(F)<|F| this improves the cover; if H(F)=|F| this gives a distinct minimum cover. Hence

    H(F) >= |F|+1 for every nonempty F subset E(A).         (2)

Conversely the usual exact family-cover decomposition shows these strict inequalities are equivalent to uniqueness of the all-base cover: any alternative cover leaves some nonempty set F of bases unselected, and must independently cover their induced page graphs at every apex.

For an A vertex u of positive degree, take F to be its full A-star. The first vertex-cover term is one. Each s term is one exactly when s is adjacent to u and to at least one A-neighbor of u, and otherwise zero. Thus (2) yields

    |{s in S : su present and N_A(u) intersects N_L(s)}|
        >= deg_A(u).                                     (3)

These are stronger than non-strict color-subset cover inequalities, but they are still cover-side statements. No theorem here turns (2) into a full m-page packing. In particular, ordinary vertex-cover number must not be replaced by matching number on arbitrary triangle-free A[F], and matching families must not be treated as matroids. The universal hub apex and actual induced S-neighborhood geometry remain available additional structure.

If m=0, L is bipartite with sides S,B. The cone is then a triangle-free cone and the separately frozen all_minimum_exact_triangle_free_cone_blocker_v1.md supplies a one-edge blocker. The present new issue is m>0 and actual rim triangles.

All deductions above are ordinary and conditional. No finite computation, external coloring theorem, general cone availability, or unrestricted survivor lower bound is used.
