# Deterministic obstruction to both pruned-cut candidates

**Status: ordinary proof candidate; fresh AI review requested.** This refutes PC-all and existential PC for actual finite simple graphs. It does not refute Tuza: the constructed graphs satisfy τ=2ν. No external existence theorem is needed.

## Exact candidate and decisive construction

Fix a maximum triangle packing P, let B be its edge support, and choose a vertex cut s. The selected set C(P,s) consists of all noncrossing B edges and every noncrossing edge outside B that is the unique noncrossing edge of some triangle. PC permits deleting selected B edges while preserving a triangle cover; selected outside-B edges stay fixed. Both proposed claims require a resulting cover of at most2|P| (PC-all for every maximum P; existential PC for some maximum P).

The construction below defeats every P and every s. The extra state missed by the proposal is a global system of exact2-in4 vertex-coloring constraints imposed by edge-disjoint K4 blocks. This is stronger and more precise than merely observing generic signed-cut inconsistency.

## 1. Block-graph lemma, including every actual triangle

Let A be a finite4-uniform hypergraph with b hyperedges, such that distinct hyperedges intersect in at most one vertex and there is no Berge triangle: no distinct hyperedges A1,A2,A3 and distinct vertices v12,v23,v31 with vij∈Ai∩Aj. Form a simple graph G by making every hyperedge an actual K4, adding no other graph edges.

Every graph edge belongs to a unique block, by the intersection hypothesis. Every actual graph triangle lies in one block. Indeed, if two of its edges have the same block, all three vertices lie there and uniqueness forces the third edge into that block too. If all three edges have different blocks, their endpoints exhibit a prohibited Berge triangle.

Consequently every triangle packing contains at most one triangle per block, because any two K4 faces share an edge. Choosing one face from each block gives an edge-disjoint packing, so ν(G)=b. Every triangle cover uses at least two edges in each block, and opposite pairs chosen separately in every block cover every actual triangle. Thus τ(G)=2b. Every maximum packing has exactly one face in each block.

Fix ANY maximum packing P and ANY cut s. Since all triangles lie in blocks and block edge sets are disjoint, selection and the cover constraint decompose blockwise. In a block, the packed edges are exactly the three edges of its chosen face.

- If all four vertices are on one side, the selected set in the block is precisely that packed face: outside packed edges are not uniquely noncrossing in any triangle. All three face edges are necessary to cover the three faces through the omitted vertex. The minimum retained cost is3.
- If the split is3+1, the selected set in the block is precisely the three edges on the majority side. Each is the unique noncrossing edge of a triangle using the minority vertex, hence is selected regardless of whether packed. Each of these three edges is necessary to hit its associated triangle, so pruning cannot reduce cost below3.
- If the split is2+2, the selected set is precisely the two within-side opposite edges. They cover all four faces. Both are necessary, so the cost is2.

These statements account for selected outside-support edges and permitted packed-edge pruning exactly. Therefore, for every P and s, the minimum attainable pruned cover size is

    2b + #{blocks not split2+2 by s}.

If A admits no exact2-in4 vertex coloring, this value is at least2b+1>2ν(G). This refutes both PC quantifier versions simultaneously, while G itself has an ordinary cover of size2ν(G).

## 2. Explicit deterministic incidence construction

We construct such A with equally many vertices and hyperedges, an odd number b, each vertex belonging to exactly four hyperedges. If every hyperedge had exactly two red vertices, summing red incidences would give

    4·(#red vertices)=2b,

impossible for odd b. It remains only to construct a4-regular bipartite incidence graph with an odd number of vertices on each side and no cycles of length4 or6.

Take the base bipartite graph with left labels a∈{0,1,2,3,4}, right labels j∈{0,1,2,3,4}, and edges a≠j. It is K5,5 minus a perfect matching, hence4-regular. Enumerate its20 edges in any fixed order and assign distinct integer voltages w(a,j)=2^i, i=0,…,19. Put q=2^20+1, an odd integer.

The lifted bipartite graph has left points(a,t) and right points(j,u), t,u∈Z/qZ, with adjacency

    (a,t) ~ (j,t+w(a,j))  whenever a≠j.

It is a finite simple4-regular graph, with5q vertices on each side. Each right point has four neighbors, one for each a≠j, and each left point has four neighbors, one for each j≠a.

There is no4-cycle or6-cycle in the lift. A hypothetical such cycle projects to a closed nonbacktracking walk of the same length in the base: an immediate base-edge reversal would force an immediate reversal upstairs because a base edge gives a bijection of the corresponding fibers. In a simple bipartite graph every closed nonbacktracking walk of length4 or6 is a simple cycle. (A repeated vertex would split off a shorter closed subwalk; with these lengths and bipartiteness this forces an immediate two-edge reversal.) Thus its base edges are distinct. Closure in the lift requires an alternating signed sum of their distinct voltages to be0 modulo q. Its absolute value is less than2^20−1<q and it is nonzero as an integer, since its largest power of two exceeds the sum of all smaller distinct powers. Contradiction.

Use the left vertices as hypergraph vertices and each right vertex's neighborhood as one4-element hyperedge. The absence of4-cycles says two hyperedges meet in at most one vertex. The absence of6-cycles excludes Berge triangles. There are b=5q hyperedges and b vertices; b is odd and each vertex occurs four times. The parity obstruction above excludes every exact2-in4 coloring.

The resulting graph G is an explicitly specified finite simple graph with

    |V(G)|=b=5(2^20+1), |E(G)|=6b,
    #actual triangles=4b, ν(G)=b, τ(G)=2b,
    every allowed pruned-cut cover having size≥2b+1.

No enumeration of this large graph is needed: its edge rule, all-triangle classification, cover/packing optima, and universal cut obstruction were proved exactly.

## 3. Verification scope and optional compact witness gate

The proof above uses only elementary finite graph arguments and modular integer arithmetic. It imports neither Aharoni/HNS nor a probabilistic hypergraph existence theorem. It is a counterexample to a proposed cover architecture, not to unrestricted Tuza or any hypothesis restricted to a genuine minimal Tuza violation.

An optional compact certificate may replace the powers-of-two voltages by a short table modulo an odd q, provided every simple4/6-cycle in the ten-vertex base has nonzero alternating voltage sum. The table is a supplementary explicit witness; it is not necessary to the ordinary deterministic existence proof. A bounded search will try at most5000 seeded assignments modulo31 and, if needed, at most1000 modulo101; no broad graph census or atlas duplication is authorized by this gate. A separate checker must verify base cycles, all lifted incidence neighborhoods, and every actual triangle of the resulting graph if a compact witness is retained.
