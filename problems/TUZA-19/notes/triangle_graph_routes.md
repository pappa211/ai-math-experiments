# Triangle-intersection partitions: exact implication and availability failures

Status: auxiliary gate REFUTED by an ordinary K5 argument, independently reconstructed by the source-audit agent after the coordinator supplied that stronger witness. The initial cone/Mycielski obstruction was derived by the source-audit agent. A bounded literal checker verifies both constructions; this is not Lean or formal verification. No claim of originality and no counterexample to Tuza. All work is private on the authorized Darwin host under the original TUZA-19 clock.

## The exact gate and why it would prove unrestricted Tuza

For a finite simple graph G, write T(G) for the graph whose vertices are all actual triangles of G, adjacent when they share a graph edge. Then alpha(T(G))=nu(G).

Gate P2: partition the actual triangles into two classes A and B such that, for each class D:

1. T(G)[D] is perfect;
2. every nonempty clique of T(G)[D] consists of triangles having a common graph edge.

A perfect graph has a clique cover of size its independence number, by the weak perfect graph theorem applied to its complement. By condition 2, choose one common graph edge for every clique in such a cover. This covers D using at most alpha(T(G)[D]) graph edges. Taking both covers gives

    tau(G) <= alpha(T(G)[A]) + alpha(T(G)[B]) <= 2 alpha(T(G)) = 2 nu(G).

The implication is exact. Universal availability of the partition is the weak step. It is stronger than Tuza, rather than a renamed equivalent: the following equality graph already refutes it.

## Decisive obstruction: K5

Identify each triangle S of K5 with its complementary two-element set e=V(K5) minus S. Two distinct triangles share a graph edge exactly when their complementary edges share a vertex. Thus T(K5) is L(K5), with this explicit identification.

Suppose a partition satisfying P2 existed. Color each complementary edge red or blue according to its triangle class. Fix a label vertex x. Its four incident complementary edges label the four actual faces of the K4 induced on V(K5) minus {x}. Any three of these faces are pairwise edge-intersecting but have no common graph edge. Therefore condition 2 allows at most two red and at most two blue edges incident with x. There are four edges, so both color degrees are exactly two at every x.

Each color graph is consequently a simple 2-regular graph on five vertices. It must be a single C5: its cycle components each have at least three vertices, so two components cannot fit. The induced triangle-intersection graph on either color is the line graph of this C5, again C5. Since C5 has clique number two and chromatic number three, it is not perfect. This contradicts condition 1. Hence P2 fails on K5.

This witness also meets two controls being studied in another lane. It has nu=2 and tau=4; deleting any one edge lowers tau to 3, and deleting any two edges leaves nu=2. For the latter statement there are two isomorphism types: after deleting 01 and 02 use triangles 034 and 123; after deleting 01 and 23 use 024 and 134. The upper bound nu<=2 follows because three edge-disjoint triangles in K5 would leave exactly one graph edge, impossible by even degree parity. The cover values follow from the elementary five-vertex triangle-free edge bound six and a K2,3 retained subgraph; after deleting an edge choose its endpoints within one side of that bipartition.

Thus the conjunction of exact single-edge cover criticality and two-edge packing resilience does not repair P2. This observation concerns this partition gate only, not the other lane's odd-triangle-cover gate or actual minimum counterexamples to Tuza.

## Separate obstruction after dropping the common-edge condition

There is no fixed bound on the number of perfect induced subgraphs needed to partition a triangle-intersection graph, even among K4-free cones that satisfy Tuza.

Let H be triangle-free and form G by adjoining a universal vertex z. The actual G triangles are exactly zxy for xy in E(H), so T(G)=L(H). Suppose these triangles are partitioned into q classes, each inducing a perfect subgraph of T(G). The corresponding edge classes partition H into spanning subgraphs H_1,...,H_q.

Every H_i is bipartite. Otherwise it contains a simple odd cycle of length at least five, since H is triangle-free. The edges of that cycle induce a chordless cycle of the same length in L(H_i): nonconsecutive edges of a simple cycle have no common endpoint. Extra edges of H_i are outside this selected line-graph vertex set and do not create chords. An odd cycle of length at least five is not perfect, contradicting perfection of L(H_i).

Choose a bipartition bit for every vertex in every H_i, assigning isolated vertices arbitrarily. The q-bit vector properly colors H: every edge belongs to some H_i, and its endpoints differ in that coordinate. Therefore

    chi(H) <= 2^q.

Triangle-free graphs have unbounded chromatic number by the following explicit construction and proof. For a graph H with vertices v_1,...,v_n, its Mycielski graph M(H) has the old vertices, twins u_1,...,u_n, and a vertex w. Retain H, join u_i to every old neighbor of v_i, and join w to every u_i. No twins are adjacent. If H is triangle-free then so is M(H): a triangle through w or two twins is impossible; a triangle with exactly one twin would produce a triangle in H. A proper k-coloring of H gives a (k+1)-coloring of M(H), using each old color on its twin and a new color on w. Conversely, if M(H) had a k-coloring, rename the color of w as k. Every twin avoids color k. Recolor each old vertex of color k with the color of its twin. For any old edge at most one endpoint changes, and the twin-to-old adjacency ensures its new color differs from the other endpoint. This yields a (k-1)-coloring of H. Hence chi(M(H))=chi(H)+1.

Starting with C5 gives arbitrary chromatic number while retaining triangle-freeness. Consequently the required q is unbounded. For the first obstruction to q=2, use H=M(M(C5)), with 23 vertices, 71 edges and chromatic number five. Its cone G has 24 vertices, 94 edges and exactly 71 triangles. It has one nonempty shared-edge triangle component, since H is connected. Thus componentwise splitting does not remove this example.

These cones satisfy Tuza by an elementary different mechanism. Triangle packings in the cone are exactly matchings in H. The endpoints of any maximal matching in H form a vertex cover; choosing the corresponding apex spokes covers every cone triangle. A maximum matching therefore supplies at most 2 nu(G) cover edges. The obstruction is to the perfect-piece representation, not the desired numerical bound.

The frozen TUZA-18 note review/pk_inputs/late_cover_gate_corrected.md used the cone over M(C5) to block universal rainbow-three-color, triangle-preserving covers. The present graph is selected by the new two-perfect-piece threshold, not by an empirical range extension. Both examples express the same warning that arbitrary triangle-free rim structure survives in triangle-intersection graphs.

## Primary-source screen and rejected continuations

Aparna Lakshmanan S, Bujtas and Tuza, arXiv:1410.8807v3, Theorems 17–18 and the note on printed pages 23–25, give the relevant established boundary: odd-hole-free triangle graphs are perfect, perfect triangle graphs satisfy Tuza, and an odd-wheel-free sufficient class was already known via Puleo. Theorem 18 uses the same clique-cover observation: a common-edge clique costs one graph edge; a K4-face clique costs two. Those known terminal classes are not a new mechanism here. The source PDF and its relevant rendered pages are retained locally. Its proof of Theorem 18 imports the weak perfect graph theorem; our conditional P2 implication uses that same standard result.

Source: https://arxiv.org/pdf/1410.8807v3 (v3, 18 October 2015).

A weighted clique-cover formulation allowing common-edge cliques at cost one and K4-face cliques at cost two has optimum exactly tau(G): a triangle cover supplies the first kind, and either kind can be realized by its stated number of graph edges. Merely asserting this weighted optimum is at most 2 alpha(T(G)) is therefore a restatement of Tuza. No new rounding theorem was found.

A contemplated induced-hole elimination would need a nonempty edge set X with |X|<=2(nu(G)-nu(G-X)); induction could then append X to a cover of G-X. Without a genuine restriction on X and a proved availability statement this is circular: a full 2nu cover, if one exists, is itself such a deletion. The known induced-hole classification supplies no attachment-sensitive availability theorem. This idea was screened but neither asserted nor refuted here.

The matroid fallback is also not a new settled duality: Nomoto and van der Pol's 2024 paper states the corresponding Fano-restriction-free binary-matroid extension as a conjecture and proves the cographic case. Source: https://ris.utwente.nl/ws/portalfiles/portal/421363158/22m1511229.pdf and https://doi.org/10.1137/22M1511229. Only this scope was used; no matroid theorem was imported into the obstruction.

Decision: stop this lane. P2 is false even on K5 with the two named criticality controls, while dropping the common-edge condition still cannot produce a universal bounded perfect partition. No justified global cover-transfer step remains. Do not expand the corpus or add new terminal classes without a new availability theorem.

## Verification and reproduction

Run from this workspace on the authorized Mac:

    source LOCAL_ENVIRONMENT
    python checks/triangle_graph_routes.py

The checker constructs all actual triangles of both literal witnesses. On K5 it checks the complementary-edge intersection correspondence, exhausts all 1,024 two-colorings, and finds exactly 12 colorings satisfying the common-edge clique condition; both color classes in each are C5. It independently checks the cover criticality and all 45 two-edge packing-resilience cases. On the cone it checks T(G)=L(H), no rim triangles, all graph triangles, and exact chromatic numbers 3,4,5 for C5 and its two Mycielski iterations using exhaustive DSATUR with color-label symmetry reduction. The 4-color unsatisfiability check visits 884 search nodes. These bounded checks support the literal instances; the unbounded statement and general implication are ordinary proofs above.

Evidence is in evidence/triangle_graph_routes/literal_check.json and source_receipt.json. Requested model controls were Astra/Ultra; exact serving metadata was not independently exposed. The coordinator supplied the K5 strengthening, and the source-audit agent reconstructed it before freezing this note. No fresh-context independent review or formal verification is claimed by this note itself.
