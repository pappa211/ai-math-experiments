# Two universal apices over triangle-local K5 blocks: exact canonical states

Status: complete ordinary parameter reduction, with a fixed K5 state check. It does not construct a resilient envelope or settle H-O2. Root supplied the proposed model; the local classification and all triangle types are reconstructed here. No general matching representation or global availability theorem is established.

## Domain and local classification

Let H have b literal K5 blocks with pairwise disjoint edge sets, distinct blocks intersecting in at most one vertex, and EVERY actual H-triangle contained in one block. Let a,b' be two adjacent universal vertices; write J=K2 join H. (The notation b for block count is distinct from apex b'.)

Fix the triangles of a packing that use exactly one apex. Their rim edges form two edge-disjoint matchings M_a,M_b'. Thus F=M_a union M_b' is a graph of maximum degree two with no odd cycle; equivalently, it is a disjoint union of paths and even cycles, with a proper two-edge-coloring. Conversely such a colored F gives legitimate one-apex triangles.

In any K5 block, F has at most four edges. The exact remaining packing number is

    nu(K5-F)=1   if F is P3 disjoint-union K2, or P5;
                2   in every other allowed state.          (1)

Here Pk denotes a path on k vertices. The classification is exhaustive: with at most two edges the claim is K5's ordinary two-edge resilience; with three edges the only possible states are P4 and P3+K2; with four edges they are P5 and C4. Odd cycles and degree-three vertices are excluded by the two-color condition.

For an explicit representative, if P4 has edges12,23,34, the two surviving triangles135 and245 are disjoint. If P3+K2 has edges12,23,45, its only triangles are134 and135, sharing13. If P5 has edges12,23,34,45, its only triangle is135. If C4 has edges12,23,34,41, triangles135 and245 survive and are disjoint. K5 has no three-packing, by its even vertex degrees and the one-edge remainder obstruction.

Deleting the isolated K2 edge from the bad P3+K2 state, or an end edge from the bad P5 state, reduces |F| by one and raises the remaining old-block packing number by one. It preserves the global two-edge-colorability of F. Therefore it preserves the total packing objective and removes that bad state.

The remaining allowed states are exactly the subgraphs of some C4 inside the K5. Equivalently, under the global two-color condition they are the states that use at most four of the block's five vertices. This is a constraint on selected RIM edges, not deletion of those vertices from the old rim packing.

## Exact optimization identity

For U subset V(H), define m(U) to be the largest |F| such that:

* F is a rim-edge subgraph avoiding every vertex of U;
* F admits a proper two-edge-coloring;
* for every original K5 block, its selected edges are contained in some C4 of that ORIGINAL block.

This last convention matters when U removes vertices: old rim triangles still use those vertices. Thus m({v}) is the intended resource version of mu_C2(H-v), not a claim that the old K5 packing baseline survives actual vertex deletion from J.

A packing with no triangle on ab' has exact optimum

    2b+m(empty).                                         (2)

For any F, old triangle packings split across the blocks. Equation(1) gives total size 2b+|F| minus the number of bad blocks. Applying the local edge deletions removes all bad states without changing this objective. Conversely every canonical F extends by two triangles in every block avoiding its selected rim edges, with no inter-block edge conflict. This proves (2).

At most one triangle can use ab'. If it is ab'v, the rim-edge matchings avoid v because both apex spokes at v are occupied. No old rim edge is used by ab'v, so the old packing baseline is still2b. The same canonicalization therefore gives

    nu(J)=2b+max( m(empty), 1+max_v m({v}) ).              (3)

Every actual J-triangle is either an old rim triangle, a one-apex triangle, or ab'v, so no family is omitted.

Since m({v})<=m(empty), equation(3) can be written

    nu(J)=2b+m(empty)+epsilon,

where epsilon=1 precisely when SOME maximum canonical F leaves a rim vertex isolated (degree zero in F), and epsilon=0 otherwise.

## Immediate resilience tests and remaining gap

Deleting ab' leaves exactly the optimum in (2). Therefore if epsilon=1, the apex edge ab' is a one-edge packing blocker. Any resilient candidate must have epsilon=0, so EVERY maximum canonical F spans all rim vertices with positive degree.

Let n=|V(H)|. If m(empty)=n, the selected graph is a spanning union of even cycles. Equation(3) then gives nu(J)=2b+n. There are2n cross edges and each non-rim triangle uses exactly two; deleting even ONE cross edge leaves room for at most n-1 non-rim triangles. Such a graph is also nonresilient.

Consequently a two-edge-resilient candidate in this exact family would require BOTH

    m(empty)<n,
    every maximum canonical F has no isolated vertex.

These conditions do not prove resilience. In particular they retain the difficult simultaneous deletion-state problem. The canonical objective is a constrained maximum union of two matchings, not an ordinary matching formula supplied by the current argument. Choosing a protected vertex in each K5 rewrites the C4 condition but does not remove the global even-cycle and shared-rim-edge constraints.

No new robust envelope follows from (3), and no theorem asserting that these remaining states always or never occur is proved. The reduction is frozen rather than expanded into a larger census or presented as a solution of the existential H-O2 construction gate.
