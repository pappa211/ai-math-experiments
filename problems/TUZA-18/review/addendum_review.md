# Independent continuation review: identification and star-cover gluing

This is a separate addendum to the immutable original 22-file review and later 37-file PK package. It received the coordinator's discovery summaries and the shared campaign context. It is independent reconstruction and independently authored literal-check code, not a fresh-context review, external human review, Lean verification, or a historical-originality claim. The requested reviewer model/effort remains gpt-6-astra / ultra without an independently verified runtime-identity assertion. Mathematical work stops at 2026-11-14 21:00:10 UTC.

The exact VI and VI-star availability assertions are refuted by the supplied witnesses. The star-gluing selection obstructions and the heavy/light matching equivalence are correct at their stated support-cover scope. No existential SG, PK, or Tuza counterexample results. Two wording issues in the gluing note were corrected during this review: its minima are restricted to packed support, and the local graphs retain outside-support edges.

## Frozen inputs and scope of replay

The initial identification specification is `coordinator_identification_gate.md`, SHA-256 `6eb4dd15e125746a59aeeb82898cae6599218a7b93409a93799810bdf77000b2`. Its discovery receipts are `identification_gate.json`, SHA-256 `a993497c237e524c240d2a22112ba4b1109306f753aa45a079eaa0600a9e248b`, and `identification_star_repair.json`, SHA-256 `2088fb8f73ce0d60bd1f2bb7b39e4daa563bd168d19c5f9dc1808fb2ea4bdded`. The latter retains many discovery rows, but this audit replays only its designated C7-square witness and all of that witness's quotients. No atlas rows outside the two supplied witnesses were rerun or independently certified by this review.

The ordinary identification proofs are:

- `criticality_identification_wheel.md`: `0e63f06780c7d71425f54295241c4ce8cf9181ff2ccd108bfaf8cfe61f24175c`.
- `criticality_identification_star_repair.md`: `4f76236b347df677bb4e052ac3fdcff027eabbdff897dc99e6c06aec51523a85`.

Their separate literal certificates have hashes `1352469f9bd007d4ff3b9449cf5aef5d21f58e37cfd12338fd89ec23388cb3f5` and `1408615e95d3074d410fdf4860bb9fa9bc53d241792851bc9acd7419687167db`. I reconstructed their ordinary arguments and wrote another small checker rather than importing either producer optimizer.

The star-gluing specification `late_star_gluing_gate.md` has SHA-256 `6d6b772a0e415b80529029f7b0b4c99ec5b9cef93e662f79cad13c9fa16191c0`. The corrected proof `late_star_gluing_obstruction.md` has SHA-256 `6ded16c3c61ef3029e86d7c9399bac6e3090ff80e204fd50023ce0f8fc6fee0b`; its literal certificate has SHA-256 `932dd4dcf96819c89094c91302218a3d3a7154254f063b8457b7b0e8539c90a0`. The original note, hash `800086b46b9119f84eeeaaadaaeb182fba16154c7fc20db0094693ff401764a0`, and the producer's revision receipt are retained. The two discovery-summary receipts are also snapshots, but their corpus counts are not independently audited here and are not mathematical dependencies.

## Integral-defect identification: implication and first obstruction

The operation is the simple graph quotient identifying one pair, deleting resulting loops, and coalescing parallel edges. Both parameters count every actual triangle of this resulting graph, including newly created triangles. The proposed transfer is exactly d(quotient)>=d(original), where d=tau-2nu. If such a pair were available outside a proven terminal class, vertex-count induction would prove d<=0: each step strictly reduces the number of vertices, and the terminal defect is at most zero. No separate inequality for packing and covering is needed. This implication is sound; availability is the failed premise.

For the cone over C5, every actual triangle consists of the hub and one rim edge. Two disjoint rim edges give a two-packing; five hub spokes prohibit a three-packing. Every edge lies in at most two of the five triangles, so two edges cannot cover them; three appropriate spokes do. Thus nu=2, tau=3, and d=-1. The five triangles are connected by shared spokes and their support is the whole six-vertex wheel, outside the literal K3/K4/K5 component terminal class.

All fifteen identified pairs are covered by three symmetry classes of five pairs each:

- Adjacent rim vertices give the cone over C4. Opposite rim edges give a two-packing and opposite hub spokes a two-cover.
- Nonadjacent rim vertices give a K4 on the merged vertex, hub, and two surviving adjacent rim vertices, together with one extra triangle on the hub-merged edge. That extra triangle and the opposite K4 face give a two-packing. The hub-merged edge and opposite rim edge cover all five actual triangles.
- A hub-rim identification gives the cone over a four-vertex path. Its two end edges give a two-packing, while spokes at the two internal path vertices cover all three actual triangles.

Each quotient consequently has nu=tau=2 and defect -2. The original value -1 is strictly larger, so there is no available pair. The nonadjacent-rim quotient is especially diagnostic: its new K4 face is not merely an image of an original hub triangle. The descriptions and the independent checker both include it. These exact packing and cover witnesses prove equality because every edge-disjoint triangle packing has size at most every triangle edge cover.

The wheel itself satisfies Tuza and has a maximum common-hub packing. It refutes the initial universal availability claim but cannot refute a version that makes all graphs with common-vertex maximum packings terminal. The note correctly distinguishes that substantive repair from the initial statement.

## The star-terminal repair: all antecedents and all quotients

For a graph with a vertex, the largest common-vertex triangle packing has size max_v mu(G[N(v)]): its triangles are exactly apex lifts of a matching in that induced neighborhood. Hence this equals nu(G) exactly when a common-vertex maximum packing exists. This characterization is mathematical, not a claim that computing nu is easy.

The repaired witness is C7 squared, with edges at cyclic distance one or two. At vertex zero the neighborhood graph is the path 2-1-6-5. Its three edges give exactly the triangles 012,016,056; cyclic symmetry shows the complete actual triangle family is the seven consecutive triples. Distinct such triples share an edge precisely at consecutive cyclic indices. Their edge-conflict graph is therefore C7, whose independent sets have size at most three. The explicit packing 012,234,456 attains three. Every graph edge hits at most two of the seven triangles, forcing at least four cover edges, and {01,23,45,06} is a four-cover. Thus nu=3, tau=4, d=-2.

The triangle component is connected and uses all seven vertices, so it is not a literal K3/K4/K5 support. At each vertex, its three incident triangles have edge-conflict graph P3, whose maximum independent set has size two. Equivalently its link is P4 with matching number two. Thus every specified common vertex allows exactly two packed triangles, below nu=3. This verifies exclusion from both terminal classes, rather than only the original clique-block class.

Rotations and reflection give three pair-identification classes, according to cyclic distance one, two, or three, with seven pairs in each. The following complete quotient triangle lists use zero for the merged vertex:

| Pair | Every actual quotient triangle | Three-packing | Three-cover |
|---|---|---|---|
| 0,1 | 023,035,056,234,345,456 | 023,056,345 | 03,34,56 |
| 0,2 | 013,016,034,035,045,046,056,345,456 | 013,046,345 | 03,06,45 |
| 0,3 | 012,016,024,045,046,056,456 | 016,024,456 | 01,04,56 |

Directly mapping the fourteen original edges and testing all triples gives these lists. The displayed packings have nine distinct graph edges each; the displayed covers hit every listed triangle. Consequently all twenty-one quotients have nu=tau=3 and d=-3<-2. The repaired VI-star availability assertion is false on a graph satisfying its full antecedent. The atlas index is discovery provenance only.

Both counterexamples have negative defect. They do not refute the weaker assertion that a suitable identification is always available on a hypothetical positive-defect graph. That weaker assertion remains an unproved global bridge; neither failure nor the terminal-class theorem proves it. No additional terminal enlargement or graph-order search is justified by these checks.

## Local star-cover setup and the missing compatibility assertion

For an arbitrary maximum packing P and a choice of one center per packed member, let B_v be the support of the members assigned to v and G_v=G-(B minus B_v). The claimed local maximum property is correct: a larger packing in G_v would avoid every edge of the other packed members and could replace the v-group in P. A local private K4 completion also belongs to the original allowed set. All its edges survive the deletion, and its three edges outside the relevant packed face avoid B_v; they therefore avoid all of B. Thus A_v is contained in original A(P), not merely in an allowed set for a different packing.

The common-vertex theorem supplies bounded local covers, but it says nothing by itself about an actual triangle using support edges from several groups. Such a triangle is absent from every relevant local graph after the other support edges are deleted. The SG compatibility assertion is therefore a separate global existence obligation in both the center choices and the local cover states. If it held, summing local budgets and using original-A containment would indeed prove PK-all.

For pure type1 P, original A(P)=B. Since A_v is contained in both A(P) and the edge set of G_v, it follows that A_v=B_v. In this case a successful union is a B-contained cover. Conversely, if a B-cover C can be divided into valid star-group budgets, C intersect B_v covers every actual triangle of G_v: a surviving triangle contains no edge of B minus B_v, and all selected C edges lie in B. This is the precise local restriction argument. Outside-B edges are retained in G_v; the corrected note now says so explicitly.

## Heavy/light matching equivalence

Fix any packing P and any actual triangle cover C contained in B, without assuming maximum cardinality. Each packed triangle contains one, two, or three C edges. Since packed edge sets are disjoint, the selected cost of a group is exactly the sum of those member costs. Writing its counts as l light, b balanced, and h heavy, the budget is l+2b+3h<=2(l+b+h), equivalently h<=l.

If the group has a common vertex, pair its h heavy members injectively with l light members. Every such pair shares the group's vertex. Doing this independently in all groups gives a matching saturating every heavy member in the bipartite heavy/light intersection graph.

Conversely, suppose such a matching exists. Give each matched heavy/light pair its shared vertex as center; its total cost is four for two members. Make all unmatched members singleton groups with an arbitrary vertex center. No unmatched heavy remains, so every singleton costs at most two. Merging groups with equal centers preserves a common center and adds valid budgets. This proves the equivalence for arbitrary B-covers. It does not characterize arbitrary covers using edges outside B. In the pure type1 SG case the earlier A_v=B_v observation supplies exactly the needed support restriction.

The PIV1 descent proposal appended to the frozen specification has a correct implication, but no availability proof is supplied there. If a one-edge pivot among minimum B-covers always reduced positive delta=h-maximum-heavy/light-matching, integer descent would reach delta zero. That gives h<=l and hence total cost at most 2|P|, even without assuming a cardinality bound initially. The universal existence of that pivot is an additional assertion, not a consequence of the Hall reformulation or the star theorem. This addendum audits the specification's implication, not any later pivot-discovery result.

## Literal gluing obstruction: exactly what fails and what succeeds

The graph has seven labeled vertices {0,1,2,3,4,5,7}, with every pair except 05,57,13,24 present. Its seventeen edges give the sixteen actual triangles listed in the source. The prescribed packing (237,012,147,345) is edge-disjoint. Six graph vertices have odd degree. Five packed triangles would leave only two graph edges, but the leave must have those same six odd-degree vertices because a union of edge-disjoint triangles has even degree. Two edges have at most four odd vertices. Hence nu=4, attained by the prescribed P.

Its four private-supported bases are exactly (37,12,47,34); the witnesses 037,125,047,034 force all four into every B-cover. No private K4 exists because each packed member has just one supported private edge. After selecting those bases, the remaining six actual-triangle constraints form two disjoint P4s on the remaining eight support edges:

    17--01--14--45,   27--02--23--35.

Each path needs two chosen vertices and has precisely three minimum vertex covers. The exact B-cover optimum is therefore eight and there are exactly nine minima. This is an ordinary characterization, not merely a solver count.

The canonical centers opposite the private bases are 2,0,1,5, so all groups would be singletons. If 01 were omitted, both 14 and 17 would have to be selected, violating the third packed member's quota; if 02 were omitted, both 23 and 27 would violate the first member's quota. Selecting both 01 and 02 violates the second member's quota. Thus no choice of canonical-center covers succeeds for this specified maximum packing. This does not prove that every maximum packing of the graph fails that canonical choice.

The particular minimum support cover C_bad=R union {01,02,14,23} gives costs (2,3,2,1). Its only heavy member is 012 and its only light member is 345; they are vertex-disjoint. The Hall graph has no edge from that heavy vertex, so no common-center grouping can meet all budgets. Adding balanced members cannot pay the excess and cannot turn a group into one with a common vertex containing those disjoint triangles.

The equally small C_good=R union {02,14,17,23} has costs (2,2,3,1). Grouping 147 and 345 at vertex four pairs the heavy and light member, while 237 and 012 remain singletons. The resulting group costs are two, two, and four. Restrictions of this actual cover hit every triangle in the corresponding local deletion graphs, with all outside-B edges retained. This is a positive certificate for the existential center-and-cover choices on the same witness.

The independent checker finds exactly one Hall-incompatible minimum support cover and eight compatible minima. It also verifies that the unrestricted triangle-cover number is five, with explicit cover {07,12,14,23,34}. Thus neither C_bad nor C_good is an unrestricted minimum cover. Their size-eight minimality is explicitly support-contained; omitting that qualifier changes the claim. The corrected source title and subsection now preserve it.

## Independent finite evidence and final scope

`SCRATCH_OUTPUT/tuza18_addendum_literal_check.py`, SHA-256 `08ed98d3105aa96c42ce96ebbef18a59f821bedc7c95e547f583ed860a6b2825`, constructs the two identification graphs and the gluing graph directly. It imports neither the producer code nor NetworkX. It reconstructs all actual triangles, computes the small exact packing and cover parameters, checks all thirty-six literal quotients against the discovery receipts, and separately checks all seven common-vertex maxima in C7 squared. For the gluing witness it verifies private bases, all nine minimum support covers, all 81 center assignments for each, the Hall equivalence on those states, and every actual triangle in the displayed good local graphs. It records exact input and script hashes in its receipt, which reports PASS at 19:45:31 UTC. It ran under the pinned local Python environment.

The full-size universal assertions here are assessed by ordinary proofs, not inferred from these small checks. The discovery corpus totals in the supplied receipts were not independently replayed. The addendum establishes the exact two availability failures, confirms the fixed-canonical and fixed-minimum-support-cover failures, and confirms the matching equivalence. It leaves existential SG, a globally available Hall-satisfying support cover, positive-defect-only quotient transfer, universal PK, and unrestricted Tuza unresolved.
