# Barycentric colourable reduction loses the integral gap, even with arbitrary weights

Status: exact auxiliary reduction gate REFUTED. The construction and weighted obstruction below are ordinary proofs. A standard-library literal checker verifies the fixed K4 instance, every actual triangle and the bipartite incidence certificate. No solver, Lean verification, fresh independent review, historical novelty claim, or Tuza counterexample is asserted.

## The proposed global mechanism

For a finite simple graph G, form its two-dimensional triangle complex: its nonempty faces are the vertices, graph edges, and ALL actual graph triangles. Higher cliques are NOT added as higher-dimensional faces. Let X(G) be the graph whose vertices are these faces, with an edge when one face is properly contained in the other. This is the one-skeleton of the barycentric subdivision of this explicitly truncated complex.

The three face sizes give a proper vertex3-colouring of X(G). Every actual X(G) triangle is exactly a flag

    v contained in e contained in T.

Indeed, a clique contains at most one face of each size, and pairwise comparability gives precisely such a chain. There are exactly six flag triangles per original triangle. This is an actual-graph construction, not a relaxed list of selected lifted triangles.

The known Tuza theorem for triangle-edge3-colourable graphs applies: colour an X-edge by the pair of its endpoint ranks. Each flag has all three edge colours. A concrete global transfer gate would be:

    For every G there is a positive real r such that
    tau(X(G)) >= r tau(G),  nu(X(G)) <= r nu(G).             (B)

Combining these inequalities with tau(X(G))<=2nu(X(G)) would prove unrestricted Tuza. The common scaling r is allowed to depend on G, so the gate is not tied to the six flags per triangle or any prescribed sheet number.

Gate(B) is FALSE. Moreover, allowing arbitrary nonnegative integer capacities on the edges of X(G) does not repair the two numerical inequalities, already for G=K4. The obstruction is an exact collapse of the integral packing-cover gap, not an uncounted closure triangle or an asymptotic estimate.

## The complete K4 control

The base K4 has nu=1 and tau=2. Its triangle complex is the boundary of a tetrahedron because the four-vertex clique is intentionally not a face. X(K4) has14 vertices,36 edges and24 actual flag triangles.

Identify each flag with the unique permutation (p1,p2,p3,p4) of the four base labels for which

    v={p1}, e={p1,p2}, T={p1,p2,p3}.

Each X-edge belongs to exactly two flags. Their permutations differ by one adjacent transposition: swapping positions1 and2 changes v while keeping e,T; swapping positions2 and3 changes e while keeping v,T; swapping positions3 and4 changes T while keeping v,e. Thus their permutation parities are opposite.

The12 even-permutation flags therefore form an edge-disjoint triangle packing. Every X-edge belongs to exactly one of them, so this packing decomposes all36 edges. The12 X-edges joining a rank1 face to a rank2 face meet every flag triangle and form a cover. Consequently

    nu(X(K4))=tau(X(K4))=12.

Gate(B) would require r>=12 from its packing inequality and r<=6 from its covering inequality. No positive real r works. All quantities are exact, with explicit feasible witnesses and weak duality; no negative solver result is used.

## Arbitrary integer edge weights do not repair the control

For a graph Y and nonnegative integer edge capacities w, use the standard weighted parameters: nu_w is the maximum number of triangles counted with integer multiplicity subject to edge loads at most w; tau_w is the minimum sum of w over a triangle-cover edge set.

We claim

    tau_w(X(K4))=nu_w(X(K4)) for EVERY such w.              (W)

Make a graph D with one vertex per flag triangle and one edge per X-edge, joining the two flags containing that X-edge. The preceding permutation argument gives a bipartition of D. Let B be its vertex-edge incidence matrix. The triangle-edge incidence matrix of X(K4) is B itself, up to the chosen row/column convention.

For completeness, B is totally unimodular. Multiply the rows in one bipartition class by minus1. Every column now has one+1 and one-1. Every square submatrix has determinant in{0,1,-1}, by induction: a column with at most one nonzero permits expansion, while if every column has both entries the row sum is zero and the determinant vanishes. Row sign changes preserve absolute determinants. Transposes and adjoining signed unit rows also preserve this property.

The covering and packing linear programs are

    min w^T y,  B y >= 1,  y>=0;
    max 1^T x,  B^T x <= w, x>=0.

All their right-hand sides are integral. At a vertex of either feasible polyhedron, Cramer's rule on an invertible tight square constraint matrix with determinant+1 or-1 gives integral coordinates. Both programs have optimal vertices: the packing polytope is bounded, and the covering problem can be restricted to0<=y<=1 without worsening a nonnegative-cost feasible solution. Finite linear-program duality therefore gives equal integral optima. Integral covers can be taken0/1. This proves(W), including zero capacities.

It follows that NO weighting w and NO r>0 can satisfy simultaneously

    tau_w(X(K4)) >= r tau(K4)=2r,
    nu_w(X(K4)) <= r nu(K4)=r.

This refutes the entire numerical transfer repair by edge capacities, not only uniform or rank-dependent weight choices. The proof does not require an imported weighted Tuza theorem for the target class: equality(W) is established directly.

## Why further subdivision does not remove this obstruction

The same combinatorial argument has an all-size scope. Suppose every original graph edge lies in exactly two actual triangles, and choose a cyclic orientation of each triangle so that the two orientations on each common edge are opposite. In X(G), colour a flag(v,e,T) by whether T directs e away from v or towards v. Flags sharing an edge(v,e) have opposite colours by the assumed old orientations; flags sharing(e,T) use opposite endpoints of e; flags sharing(v,T) use the incoming and outgoing triangle edges at v. Hence the flag dual is bipartite, and the identical incidence proof gives tau_w(X(G))=nu_w(X(G)) for every integer w.

In the unweighted case, either flag colour gives a packing of3 times the original triangle count, which equals2|E(G)|, and the rank1-to-rank2 incidence edges give a cover of that size. No topological theorem is needed: the coherent orientations are the exact hypothesis.

Barycentric subdivision preserves these coherent orientations explicitly: orient a small triangle in cyclic rank order for one flag colour and in reverse rank order for the other. Any shared edge joins the same two ranks, and its incident flags have opposite colours, so their directions on that edge are opposite. Thus every positive number of iterations starting from the tetrahedral boundary has the same weighted equality property. Repeating the raw operation therefore cannot restore the proposed transfer.

## Archive comparison and stopping boundary

The frozen TUZA18 genuine-cover obstruction required local neighborhood bijections and showed that a triangle-preserving cover of a cone splits into unchanged sheets. X(G) is not such a cover; it creates edge-face and triangle-face vertices and bypasses that rigidity. Its failure is instead numerical, witnessed by a finite integral decomposition. TUZA16's dense-copy obstruction used fractional packing and an asymptotic approximation theorem; none is needed here.

Pure vertex splitting without edge duplication was also screened. Retaining every original triangle forces the two spokes of every link edge to stay on one split copy, hence forces each connected link component to remain together. A cone with connected rim cannot split its hub this way. Duplicating spokes removes that constraint but introduces extra integral edge capacity; no exact gadget controlling that resource was found. This is recorded as a limitation, not a new availability theorem.

No claim restricted to actual positive-defect graphs is refuted by K4, and no additive-correction or endpoint-dependent replacement gadget is ruled out. Those would need a materially different transfer theorem. No such theorem is supplied, and the lane stops here without enlarging the terminal class or searching larger graphs.

## Sources and verification

The target-class theorem is S. Aparna Lakshmanan, Cs. Bujtas and Zs. Tuza, *Small Edge Sets Meeting all Triangles of a Graph*, Graphs and Combinatorics28(2012),381–392, DOI10.1007/s00373-011-1048-8. Its primary publisher abstract was inspected at https://link.springer.com/article/10.1007/s00373-011-1048-8 ; its full proof was not audited here. Only the hypothetical implication of(B) uses this theorem, not the counterexample or weighted obstruction.

Weighted definitions and their established multigraph interpretation were checked in Chapuy et al., *Packing triangles in weighted graphs*, arXiv1012.0372v2, introduction, https://arxiv.org/html/1012.0372 . Introducing these capacities is not a new conjectural reformulation.

Frozen comparison sources: TUZA18 commit57708a8413929012d9ca8d15b0f925b3ef6b51e8, notes/late_compression_gate.md, notes/coordinator_identification_gate.md, notes/late_cover_gate.md; TUZA16 commit405e41c1eb24739405f4b06d8cdcd5715bb9fd13, ROUTES.md. All historical access was read-only.

Reproduce locally with the mission environment and `python3 checks/global_routes_barycentric_control.py`. Literal graph, flags, both parity classes, packing, cover and every incidence pair: evidence/global_routes/barycentric_k4.json. The universal-integer-weight and repeated-subdivision assertions are ordinary arguments, not finite enumerations of weights or formal proofs.
