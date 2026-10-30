> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Independent TUZA-06 ordinary-proof review

Reviewer: a separate AI agent, `review`, distinct from the TUZA-06 Lean implementation and manuscript editor. This is an independent reconstruction from the actual frozen texts, not a human specialist endorsement or a Lean proof of the global theorem. Review date: 30 October 2026.

## Reviewed sources and verdict

Read the actual TUZA-05 `THEOREMS_AND_PROOFS.md` (SHA-256 `525032516433ae3e9ecc0c897f4c2a955dc7b73bbfcef9817a31eaa971218ae7`) and inherited TUZA-04 `EQUALITY_THEOREMS.md` (SHA-256 `b5d8e127a7a9277a050fc9a8fb5bffc47bb24c58340eb92d3fc9b6aba877eadd`), before consulting the earlier fresh-review notes and final-core certificates. Read the pinned public Lean Basic/Graph/Intersecting source at revision `97e913008e466de14f61437d8dae774946d92e8f`. No earlier reviewer verdict is a premise of this review.

No material mathematical defect was found in the ordinary proof of either the 5-degenerate inequality or the K4/K5 equality characterization. This conclusion is an ordinary mathematical review, and does not convert unformalized parts into formal verification. Published antecedents and historical priority are separately audited by the manuscript role.

## Inductive and representational scope

The induction is over edge count in the subgraph-closed class of finite simple 5-degenerate graphs, with isolated vertices discarded only for the obstruction normalization. Triangle-free graphs satisfy both the inequality and the vacuous equality characterization. Triangle components use shared edges, so clique blocks may share vertices. Packing and covering add over those edge supports; triangle-free background edges contribute zero.

An edge-minimal failure of the combined statement has tau >= 2 nu, rather than necessarily tau > 2 nu. Every proper edge-subgraph has the combined statement. If edge deletion reduced nu, its one-edge cover extension would give strict inequality. If deletion preserved tau=2nu, the equality blocks could avoid the two old spokes of a restored triangle: no block can contain both spokes because their missing base is absent from the residual graph. Augmentation then contradicts maximality. Thus the original obstruction is tight-critical with tau=2nu and every single-edge deletion has tau=2nu-1.

For every balanced r/(2r) reduction used later, the chain is

    2h = tau(G) <= tau(K)+2r <= 2nu(K)+2r <= 2h.

Each inequality is justified by its actual cover and packing witnesses and the induction on the proper residual. Equality in the chain gives both nu(K)=h-r and tau(K)=2nu(K), so the residual classification is available. No classification is inferred merely from a positive slack remainder.

## Local lemmas and pair reductions

The codegree-one argument deletes two spokes of its unique triangle. Every lost triangle contains their common center. A non-common-edge intersecting family through that center would force a second triangle on the supposedly unique base. Otherwise two disjoint lost triangles have at most two old edges in any residual K5 block and a star footprint in a K4 block. This establishes codegree at least two without presupposing the desired theorem.

Partial spoke deletion at one link component is legitimate: a triangle using a removed spoke and a neighbor outside that component would be an edge joining link components. The K3, K4, diamond, and C4 exclusions account for every lost triangle, including external rim pages. The C4 saving uses a surviving triangle on the retained rim edge, permitting a residual minimum cover containing that edge. The finite five-link list covers exactly the eight eligible complement types. The total number of unlabeled five-vertex graphs of maximum degree at most two is eleven; thirteen is incorrect.

The K221 external-page argument requires only a cover of its external family or a disjoint pair on good bases. For the two disjoint-base bad partners ac,bd with common apex, third bases can only be ad or bc; the forbidden ab,cd are absent. If a third page exists, its intersections force the same apex for all remaining pages on those bases. The two spokes xa,xb then cover the family. Arbitrary apex sets cause no additional case.

For the degree-five/degree-six reductions, a dominating near-clique neighbor has a strict 4/7 budget; a K6 core with one outside neighbor has a strict 5/9 budget. The latter adds an external triangle while its four-packing avoids the reused local spoke. Adjacent degree-five vertices have either four common neighbors (dominating case), or exactly three with both links near-cliques. Their 4/8 reduction leaves an independent triple, and its augmenting five-packing contributes at most two old edges per clique block. For a nondominating degree-six neighbor, codegree two supplies two distinct selected neighbors from the common triple when its two outside neighbors are nonadjacent. The resulting residual contains a triangle-connected K5 minus one edge or two independent edges. Outside attachments cannot repair a missing edge inside that five-vertex support: a classified component would need all five vertices and therefore the missing edge itself.

Proposition O's five- and four-common-neighbor cases have the displayed strict or balanced witnesses. In the four-common-neighbor complete-rim case, an outside page adds to a four-packing avoiding its base. In the missing-edge three-common-neighbor case, the seven-packing's residual footprint is exactly pb,pc,sb,rs; only pb,sb can coexist in a clique block. In the remaining case its footprint is pa,pc,qa; only pa,qa can coexist. All necessary absent residual edges are genuinely deleted or absent in the whole graph, and are not merely absent from a chosen local drawing.

## Peeling and arbitrary attachments in the final configuration

After deleting the independent set L of degree-five vertices, choose u with degree at most five in G-L. This bounds its residual degree, not its original degree. Since u is outside L and the original minimum degree is at least five, its original degree is at least six; it consequently has a low neighbor and then has original degree at least seven. The neighborhood subsets A_v have size at least three with pairwise intersections at most one. Two such subsets exhaust five points and must each have size three with a one-point intersection. A third is impossible by counting intersections. This gives exactly two low neighbors and original degree seven, with the displayed eight-vertex configuration and distinct external neighbors p,q. The missing-cross-edge singleton reduction leaves a K5 minus two independent edges and forces all four cross edges.

For the final deletion K=G-{u,v,w}-E(A), the seven-packing is fully disjoint from every K-packing. The fourteen-edge cover increment is E(A) together with uv,uw,vp,wq. Triangles through u lie inside B; those through v or w either lie in B or use vp or wq; every other lost triangle uses an A-edge. The balanced chain above therefore gives nu(K)=nu(G)-7 and residual equality blocks. A is independent in K, so each block contains at most one A vertex.

Take any two edge-disjoint external A-pages, with arbitrary apices outside B. Their bases f,g must be distinct. A six-packing inside B avoiding those two bases is disjoint from both pages, since each page's other edges has an endpoint outside B. In any residual clique block, each page contributes at most one surviving old spoke: a block cannot contain both endpoints of its base. Together the two pages contribute at most two old spokes, and if there are two they share the block's unique A vertex. K4 star avoidance and K5 avoidance of any two edges suffice to choose maximum packings in every block. Their union is a maximum K-packing by additivity, so adjoining the six core triangles and two pages gives nu(K)+8=nu(G)+1, a contradiction. This argument quantifies symbolically over arbitrary graphs and outside attachments; no bounded attachment census is being used.

Thus the external-page family is pairwise edge-intersecting and has a cover of size at most two. The final cover has separately bounded contributions: a minimum K-cover; nine edges covering all B-triangles; at most two edges covering external A-pages; and vp,wq covering remaining triangles at v,w. Every lost triangle lies in one of these classes. Its increment is at most 9+2+2=13, contradicting tau(G)=tau(K)+14.

The converse follows from additive K4/K5 parameters over triangle edge-components, including empty or triangle-free graphs and triangle-free background edges.

## Independent finite verification

`checks/independent_final_core.py` uses an integer bitmask representation of all possible edges and an independent backtracking search; it imports neither the original checker nor its algorithms. It verifies the supplied 45 pair-avoidance witnesses and independently constructs six-packings for all 45 pairs without using the source symmetries. It also checks the displayed seven-packing and nine-cover, and separately enumerates the finite K4/K5 packings and covers to verify their exact parameters, K4 star avoidance, K5 two-edge avoidance, and prescribed-edge minimum-cover property. Results are in `checks/independent_final_core_results.json` and `.log`: PASS, 1,300 packing-search nodes, no external packages, no graph census, no SAT, no Lean build.

## Formalization boundary

The existing `Tuza.Basic` parameters are actual maximum edge-disjoint triangle packing and minimum edge cover cardinalities. `Tuza.Graph.triangles` is the full `cliqueFinset 3`, and `graph_min_cover` trims to actual graph edges. `AharoniInput` and `HNSInput` are explicit external-input definitions elsewhere in the old file; importing the file does not assume them. They must remain absent from the mathematical parameters and dependency closure of claimed new completed results. Existing source does not by its presence prove degeneracy, component characterization, or the global induction. The exact new declarations and source hashes require a later final review.
