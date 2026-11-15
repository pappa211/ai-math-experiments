# Independent final review of the degree-directed compression gate

This is a separate continuation review; all prior review packages remain unchanged. I received the coordinator's outline and the producer's frozen package, reconstructed the proofs, and wrote a separate fixed-certificate checker. This is not fresh-context review, external human peer review, Lean verification, or a historical-originality claim. The requested reviewer model/effort remains gpt-6-astra / ultra without an independently verified runtime identity. Mathematical work stops at 2026-11-14 21:00:10 UTC.

**The three precisely scoped compression failures survive review.** The finite potential and terminal argument are sound, using the explicitly imported threshold-graph theorem. The cone has exact nu=16 and tau=24; the compressed cases need only the verified feasible bounds. No unrestricted Tuza assertion follows. In particular the cone is already covered by the earlier whole one-apex literal-block theorem, so that further terminal enlargement remains an unresolved availability proposal.

## Frozen inputs and external dependency

The reviewed proof `late_compression_gate.md` has SHA-256 `a0bb2de7f235f7a7329de8f3605285221c6c33e6dc3646643d301c8298749aea`. The literal inputs are:

- Initial fixed controls: `late_compression_verified.json`, hash `a69b30f5292a8ee4cde382ede0548259b5b5564c1baddfaf80d47702721d6796`.
- Rook control: `late_compression_rook_verified.json`, hash `e9bc1a5c337ddcd0cf469e9c0d418354a220c104c3c946be729d73d09ae856e3`.
- Cone control: `late_compression_cone_verified.json`, hash `b93d74b0962393b2574ebe6fc2cacda12f93500ae1e0ab80160a450eb4e619a9`.
- Producer source receipt: `late_compression_source.json`, hash `6a1d84a188dac53821b199ee443ad29cbb0540fb8dededa3d7adae5920d90071`.

I independently opened the [official DMTCS primary PDF](https://dmtcs.episciences.org/articles/7660/download). Its packing and edge-cover conventions match this review, Theorem 1 supplies the threshold terminal inequality, and its definition uses a clique/independent-set partition with nested neighborhoods. I inspected those statements on printed pages 1,2,5, not the complete published proof. The producer's local PDF hashes to `bda9d94f8c6fcbfe3b19fb27ee2729f664f6da2025083c4badf0c559e312ab07`; I checked those local bytes but did not independently download another PDF copy. This is a declared imported theorem, not a self-contained reproving of the terminal inequality.

## Operation, potential, and terminal transfer

For ordered distinct a,b with deg(a)>=deg(b), the moved set is R=N(b) minus (N(a) union {a}). Every deleted bx is present, every inserted ax is absent, and x is neither endpoint. The operation preserves simplicity, vertex count, edge count, and the degree of every other vertex. The receiver and donor degrees change by +r and -r, so

    Delta(sum deg^2)=2r(deg(a)-deg(b))+2r^2>0

whenever r>0. This integer potential is bounded on the fixed vertex set. Thus every sequence of allowed moves terminates, independently of triangle parameters.

At a terminal graph, N(b) minus {a} is contained in N(a) minus {b} whenever deg(a)>=deg(b). Hence every pair has comparable vicinal neighborhoods. Such comparability is inherited by induced subgraphs. When two vertices have different degrees the inclusion must point toward the higher degree, by cardinality; equal degrees make comparable sets equal. Thus the degree-directed interpretation is valid after restriction as well.

A direct isolated/dominating-vertex proof avoids a minor tie-choice ambiguity in the producer's minimum/maximum-vertex wording. Choose a minimum-degree vertex u. If it is isolated, delete it. Otherwise choose any neighbor v. For every w different from u,v, degree(w)>=degree(u), so vicinal inclusion transfers v from N(u) into N(w). Vertex v is already adjacent to u, and therefore dominates the graph. The one-vertex and empty cases are immediate. Repeating after deletion gives an isolated/dominating insertion order. This argument does not need the minimum and maximum choices to be declared distinct.

The insertion order directly gives a clique of dominating insertions and an independent set of isolated insertions, with the required nested neighborhoods. The imported threshold theorem therefore applies to a compression terminal. If a nondecreasing-defect move were always available outside the selected terminal class, its repeated choices would stop at a terminal with defect at most zero; monotonicity would then imply the same for the initial graph. The direction d(initial)<=d(final) is correct. For enlarged terminal classes one may stop as soon as a member is reached, and the same bounded-potential argument excludes an infinite sequence outside the class.

For exclusion from threshold graphs below, there is also a short direct argument avoiding any unstated converse of the insertion construction: threshold graphs are split by the cited definition, while an induced 2K2 cannot be partitioned into a clique and an independent set. A clique of two vertices would be one of its edges, leaving the other edge in the alleged independent set; smaller cliques also fail. The split property is inherited by induced subgraphs. Thus the displayed induced 2K2s suffice.

## Threshold-only availability fails on two edge-glued K4s

The six-vertex graph is the union of K4[0,1,2,3] and K4[0,1,4,5], meeting in edge 01. Every actual triangle belongs to one of these two K4s. A K4 packs only one triangle, so nu<=2, and 023 with 045 attains two. Each K4 needs at least two cover edges. A total two-cover would have to put both selected edges in each K4, impossible because the common edge set has size one. The cover {01,23,45} proves tau=3, giving d=-1.

The shared-edge endpoints have degree five and the four other vertices degree three. A move into either universal endpoint is empty; a move from one to a degree-three vertex violates the degree condition. Within either peripheral pair the reduced neighborhoods coincide. The only nontrivial moves go between the two peripheral pairs, yielding exactly eight ordered moves in one automorphism orbit.

For receiver 2 and donor 4, only edge 45 moves, becoming 25. Direct reconstruction gives the eight triangles listed in the source. The three-packing 014,023,125 and three-cover {01,02,12} are valid, so nu=tau=3. Every allowed move therefore changes d from -1 to -3. This refutes the initial availability claim. The original graph itself has a maximum packing through vertex zero, so it does not refute a terminal class already containing all common-vertex maximum-packing graphs.

The supplied C7-square discriminator is consistent with the repair, not a counterexample to it. Rotations/reflections give the three ordered-pair distance classes. I independently checked their representatives: distances one and three yield nu=tau=4; distance two yields nu=3,tau=4 and preserves the original defect -2. For receiver zero and donor two, the packing 012,035,046 is maximum and has a common vertex. The preserving move thus enters the newly allowed whole-graph star terminal class. This finite survival is not an availability theorem.

## The rook graph defeats whole-graph star terminals

Let H be the 4 by 4 rook graph. Each actual triangle is contained in a unique row or column: if two vertices lie in the same row and a third lies outside it, that third cannot share a column with both. The eight row/column K4 supports are edge-disjoint. Hence one face per block attains nu=8 and the blockwise two-cover lower bounds give tau=16, attained by opposite edge pairs. Its defect is zero.

Every vertex has degree six, so a packing through one vertex has size at most three, below eight. The graph is outside the whole-graph common-vertex maximum-packing class. Its induced vertices 00,01,22,23 form 2K2, excluding threshold status by the direct split argument.

All ordered distinct rim pairs have equal degrees and nonempty moved sets. Row permutations, column permutations, and transpose are transitive on each of the two ordered-pair classes: 96 adjacent and 144 nonadjacent pairs. Adjacent representatives move three neighbors, and nonadjacent representatives move four. These symmetries preserve every graph-triangle parameter and justify the all-move quantifier.

For receiver 00 and adjacent donor 01, the eight transported row/column K4s still have disjoint edge supports, and exactly three cross-block triangles are added: (00,10,11), (00,20,21), (00,30,31). The displayed eight faces and three extra triangles have 33 distinct edges, proving nu>=11. The specified block covers hit all K4 faces and cover the extra triangles through the row edges i0.i1, giving tau<=16. Thus d<=16-22=-6<0. No compressed optimum is required.

For receiver 00 and nonadjacent donor 11, the affected row and column are transported to the receiver. The donor retains only two nonadjacent neighbors, so it lies in no triangle. The two transported blocks overlap unaffected blocks along edges 00.10 and 00.01, and the four displayed extra triangles complete the actual family. The literal twelve-packing has 36 distinct edges. The block covers have fourteen distinct edges because those two overlap edges are each counted twice in the block lists. They hit every block face and extra triangle. Hence nu>=12, tau<=14, and d<=-10<0.

The complete triangle counts are 35 and 36, not merely the faces carried over by the operation. Every allowed compression strictly lowers the rook graph's defect. However, its actual triangle components are the eight individual K4s. It is already terminal if the threshold/star classes are closed under decomposition into shared-edge triangle components, so this particular witness cannot refute that stronger proposal.

## Exact original cone values and terminal exclusion

Add a universal apex z to H, forming J. Every triangle is either one of the 32 old block faces or an apex triangle based on one of the 48 rim edges. Thus J has 17 vertices, 64 edges, and 80 actual triangles.

Any packing contains at most eight old faces, one per K4 block, and at most eight apex triangles, because each consumes two distinct apex spokes. The prescribed rim perfect matching uses exactly one edge of each of the eight blocks. Choose in each block a face avoiding its matching edge. The eight faces are mutually edge-disjoint, every matching base avoids them, and the eight apex triangles have disjoint spoke pairs. This gives sixteen packed triangles and proves nu(J)=16 exactly.

For any cover, let U be the rim vertices whose apex spokes are omitted. Every rim edge within U is forced into the cover. Within a K4 block containing t vertices of U, the minimum required old-edge contribution is

    f(0),f(1),f(2),f(3),f(4) = 2,2,2,3,6.

For t at most one the ordinary K4 lower bound is two, attained by opposite edges. For t=2 the one forced edge and its opposite attain two. For t=3 all three edges of the forced triangle are necessary and hit all four K4 faces. For t=4 all six edges are forced. This accounts for arbitrary covers, not only a selected family.

Rim block edge sets are disjoint, and every rim vertex belongs to exactly two blocks. If t_B=|U intersect B|, then sum t_B=2|U|. Hence every cover has size at least

    16-|U|+sum f(t_B)
      =16+sum(f(t_B)-t_B/2)
      >=16+8=24,

because the five possible summands are 2,3/2,1,3/2,4. A checkerboard U gives two vertices in every row and column. The eight complementary spokes and each block's forced edge plus opposite edge attain twenty-four. Therefore tau(J)=24 and d(J)=-8 exactly.

The cone has one shared-edge triangle component. Consecutive edges in the connected rim lift to apex triangles sharing a spoke, and every old face shares a rim edge with one of these apex triangles. All graph edges lie in this component. A common-apex packing has at most eight triangles; a packing through a rim vertex has at most floor(7/2)=3. Both bounds are below sixteen. The induced rook 2K2 remains, excluding threshold status. Thus J meets the full antecedent of the componentwise threshold/star terminal repair.

## All cone moves and strict defect bounds

The apex has degree sixteen and each rim vertex degree seven. A rim receiver with apex donor violates the degree condition. An apex receiver has an empty moved set because it already sees every rim vertex. All nontrivial moves are therefore between rim vertices. The apex is a common neighbor of any such pair and is never moved, so the same 96/144 pair orbits and three/four moved-neighbor sets apply as in H.

For the adjacent orbit, the source modifies one face of the earlier eleven-triangle rim packing. The listed six unused rim edges form a matching on twelve vertices. Adding their six apex triangles is valid because their bases avoid every old packed edge and their spokes are distinct. This gives a seventeen-packing. The nonadjacent rim twelve-packing likewise leaves the displayed six-matching, yielding an eighteen-packing.

For either compressed rim, select every same-checkerboard-color rim edge and the eight apex spokes of one color class. Each old triangle has two equally colored vertices, so it contains a selected rim edge. An apex triangle either has a same-color rim base or has endpoints of different colors and therefore a selected endpoint spoke. This covers every actual triangle irrespective of how compression changed the triangle family.

The adjacent move changes the same-color edge count from sixteen to seventeen: two moved neighbors have the receiver's color and one has the donor's color. The nonadjacent receiver and donor have the same color, so moving their four edges preserves the count sixteen. Thus the respective covers have sizes twenty-five and twenty-four. The feasible inequalities are

    adjacent:    nu>=17, tau<=25, d<=-9<-8;
    nonadjacent: nu>=18, tau<=24, d<=-12<-8.

The direction is essential and correct: an upper bound on tau minus twice a lower bound on nu is an upper bound on the actual defect. Exact compressed parameters are not claimed. Every allowed compression strictly lowers d, so even componentwise threshold/star availability is false.

## Independent literal check and its limits

The separate checker `SCRATCH_OUTPUT/tuza18_compression_literal_check.py` has SHA-256 `840dbe3057e909ba589601e24d6eb1960cbd181812e8cb303ac00db9ae28fffd`. Its receipt reports PASS at 20:24:02 UTC. It uses only the Python standard library, imports no producer code, and runs no graph census. Triangle lists are interpreted as unordered triples, including the producer's apex-first packing entries.

It reconstructs the edge-glued K4 graph and all eight allowed moves, checking their exact tiny optima. It separately checks the three C7-square distance representatives and the favorable common-vertex packing. It constructs the rook graph, verifies all 240 allowed pairs and the orbit counts, rebuilds both representative moved graphs, and checks every literal packing/cover against every actual triangle. The block-face unions and extra-triangle lists are checked for exhaustiveness.

For the cone, it reconstructs all 64 original and compressed edges and all 80,83,84 actual triangles. It checks the original sixteen-packing and twenty-four-cover, the one-component property, the 240 rim-only allowed moves, both residual six-matchings and their disjointness from the old packed edges, and the two compressed covers. It independently checks the forced K4-cover cost for every one of the sixteen local U subsets by enumerating all local covers. The exact original cone values combine these local certificates with the ordinary upper/lower-bound argument; no global optimizer or unproved solver result is used.

The imported primary theorem is verified at statement and definition level in `SCRATCH_OUTPUT/tuza18_compression_source_review.json`. The complete published proof is not independently audited. The original producer's additional cone-C5 discriminator and aggregate run metadata are preserved but are not required for the reviewed refutations and were not replayed by this checker.

## Final scope and the surviving caveat

The completed failures concern three specified terminal choices: threshold graphs alone; threshold graphs together with whole-graph common-vertex maximum-packing graphs; and closure of those classes under actual shared-edge triangle-component decomposition. The controls have defects -1,0,-8 and satisfy ordinary Tuza. They do not refute an availability statement restricted to hypothetical positive-defect graphs.

The cone J already belongs to the previously proved one-apex K3/K4/K5-block class: its rim has eight literal K4 triangle components, and shared graph vertices are permitted by that theorem. Therefore the cone is exempted by a further terminal proposal including that entire proven class. Neither this package nor the earlier tests supply the nondecreasing-defect availability theorem outside that stronger class. No new terminal repair was tested here, and no unrestricted proof or counterexample is asserted.

No mathematical defect was found after the explicit elementary terminal/exclusion clarifications above. The exact all-move quantifiers, every-actual-triangle requirements, feasible-bound directions, original cone equalities, and terminal-class scope have all been independently reconstructed at the frozen hashes.
