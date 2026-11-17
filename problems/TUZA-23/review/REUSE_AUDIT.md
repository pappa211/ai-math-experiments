> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Reuse audit — source inspection, not fresh build acceptance

Reviewer: TUZA-23 foundation contributor. All inspection occurred on the owner’s Mac. No Lean or Lake invocation was made for this audit; final fresh compilation and actual axiom reports remain required.

Pinned source: public commit `4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4`, tree `f6716f2578ba5346960cbb69b9b2e0698b834b4f`. Source project records Lean `leanprover/lean4:v4.33.1`, mathlib `0df444a360eaa60ab8c11dca51a86af692955474`. The remaining manifest pins must be preserved.

## Recommended coherent representation

Use `Tuza.Basic` and `Tuza.Graph`: vertices are arbitrary types, graph-level declarations use Fintype/DecidableEq, an edge is an unordered two-element finset, a triangle is a three-element actual clique from `G.cliqueFinset 3`. `Independent` requires disjoint edge supports, allowing shared vertices. `nu` is the maximum packing cardinality by finite supremum. `tau` is the infimum of cover witness cardinalities; existence and minimum witnesses are proved. Raw `Covers` permits irrelevant sets, but `exists_min_cover_supported` and `graph_min_cover` trim them to actual graph edges. The exported TUZA-23 cover predicate should explicitly require actual edges or expose this equivalence.

`Tuza06.ComponentCliques` is already exactly the requested actual shared-edge triangle-component support predicate. `componentCliques_iff_decomposition` proves equivalence to exhaustive, edge-disjoint literal K4/K5 decomposition. Its exhaustiveness is over every actual triangle; vertex-sharing is allowed and background edges are unrestricted. This is a suitable B definition, without a replacement encoding.

Do NOT reuse `CombinedStatement` as CS: that definition has an antecedent `Degenerate G 5`. Define unqualified CS separately. `AharoniInput` and `HNSInput` are proposition definitions in Graph, not axioms and not premises of the inspected component/clique declarations. Their mere presence in an imported module does not make them dependencies of these theorems, but theorem-level axiom/type audit must confirm the exact selected closure.

## Existing all-size API

- `Tuza.exists_max_packing`, `packing_card_le`, `exists_min_cover_supported`, `graph_min_cover`, `nu_mono`, `tau_mono` supply optimum/witness and monotonicity interfaces.
- `Tuza06.k4_parameters`, `k5_parameters` establish exact parameters for any labelled finite clique. The finite base proofs use kernel `decide`, not `native_decide`, and `Transport` proves invariance under arbitrary injective vertex maps.
- `Tuza06.k5_avoid_two` avoids any ≤2 prescribed actual clique edges with a maximum packing.
- `Tuza06.clique_avoid_edges` and `blocks_avoid_edges` avoid a footprint of ≤2 edges per block with a common endpoint. A singleton supported footprint is a direct specialization; an empty footprint requires selecting a vertex from the nonempty K4/K5, not assuming the entire ambient vertex type is nonempty.
- `nu_union_eq`, `tau_union_eq`, `nu_biUnion_eq`, `tau_biUnion_eq` prove support-disjoint family additivity; `blocks_nu` and `blocks_tau` transport this to exhaustive clique components.
- `componentCliques_equality` proves B⇒tau=2nu with no graph-class restriction.
- `one_triangle_augmentation` in Critical is all-size and has explicit independent-terminal, actual-triangle, and B-residual hypotheses. It can provide one-edge insertion packing gain.
- `single_edge_packing_loss`, `single_edge_cover_extension`, and `tight_critical_edge` already provide core M0 accounting. `tight_critical_edge` explicitly assumes the residual inequality and equality⇒B implication; it is a legitimate conditional theorem, not universal CS.

## Missing fact to implement

No every-prescribed-edge-in-minimum-clique-cover theorem was found in this closure or the targeted source-name search. Add one for arbitrary labelled K4/K5, with output cover contained in `edges k`, containing the prescribed edge, covering `cliqueFamily k`, and cardinality equal to `tau (cliqueFamily k)`. Kernel finite certificates over Fin 4/Fin 5 plus existing `exists_fin_embedding`, `covers_liftFamily`, `card_liftFamily`, and `tau_liftFamily` supply a short faithful route. The whole union-of-all-pages footprint lemma is also not supplied by `two_page_footprint`: the latter only concerns two selected pages and must not substitute for the new all-pages obligation.

## Trust and closure boundaries

The transitive local source closure of Components, Footprints and Critical is 12 modules listed below; the additional minimality module recorded below makes the selected closure 13 modules. Text inspection found no sorry, native_decide, unsafe command or project axiom declaration; occurrences of the word “axiom” are comments and `#print axioms` audit commands. This source inspection does not replace actual theorem-level closure reports. Standard Lean foundations remain allowed and must be reported when used. No final five-degenerate theorem, arbitrary external theorem assumption, census, solver output or TUZA-19 object is needed by this selected foundation.

| Module | SHA-256 |
|---|---|
| Tuza.Basic | 797e09e89ac42b02530243966c2178308fe1fe1b77cc1262d3faf0cd3855dadc |
| Tuza.Graph | fae56ae3c9925cba519efd2b7e47f80c4603b960d85cc76bcf6085a9be956b8a |
| Tuza06.Additivity | f0b38489aa3f2ba37743752754f89462048e3c4e038f34059ec13e6c2f748621 |
| Tuza06.BlockAggregation | dd583aadd0a5c842e03a3726b4f87da53161bbd7be151f6e96ab2730e6314b7f |
| Tuza06.Components | 169c27a6c30668b573312b6e3d2d99fb059e094e63064db283a000e86871bd0e |
| Tuza06.Critical | fdb687027dd5dd299d6985b23383e98407a00dd24a60d55643e66a3462e3b200 |
| Tuza06.FiniteCliques | bc39b1d9f9ee2f2c808c29a78df483ea1bb75dec73ac0b34ecb4dd2c4271c430 |
| Tuza06.Footprints | 28dd2c8c203b3ad5841c2411180ee94d24d92924f1583b6553355ec508eb440b |
| Tuza06.Pages | ca3a12cc8715f6e4f71b1cc257e828ed58961d5870cf88c439741e3917cbf045 |
| Tuza06.Reduction | 21304cdf50b188f847de8669c8d2a74f88de16eec1d139123f5af381cbea7b10 |
| Tuza06.Statement | e4267fd52afb33cf18f56cccdbd275188195574e67c82ed34665c13d3d2515a7 |
| Tuza06.Transport | e9d0394513cadc486ee4ce0028e2559d8aaff22c49ca2cbcce692bf7a6a80e32 |

## TUZA-19 finite kernel scope

Inspected `problems/TUZA-19/formal/four_branch_wke/Core.lean` and README. The kernel constructs finite graphs from five pair states and checks exact canonical state domains and matching/vertex-cover certificates. Its 128 chunk modules establish 5,375 retained records; the domain proof and coverage schedule are separate. It does not formalize the ordinary all-size reduction, and there is no single imported universal all-size theorem supplied by the bundle. The data structure uses ordered natural-number pairs and vertex matching, unlike this triangle-packing API. It is useful as a workflow precedent for kernel `decide`, negative controls and bounded serial builds, not a mathematical prerequisite of R2. Do not import the bundle or rebuild its census for this mission.

A historically important resource lesson: Lean’s `-M` is not a process RSS hard cap; use the mission’s external process-tree monitoring, not the old memory option alone. No historical controls or failed attempts are accepted as new TUZA-23 evidence.

## Additional authenticated minimality reuse

`Tuza06.MinimalObstruction` (SHA-256 `79010d586ee8d35b187213109fe6aa0b7222bdae81e0f92543c0b6af37b8325e`) imports Critical only. It provides `Good` equivalent to the full unqualified CS conclusion, `exists_minimal_obstruction` by Nat.find over edge counts of same-vertex-type subgraphs, `good_of_triangles_eq`, `triangle_free_good`, `minimal_every_edge_in_triangle`, and `minimal_tight_critical`. These are class-independent; the separately named degeneracy corollary does not impose a hidden hypothesis on the unrestricted declarations. Vertex deletion is represented by isolating vertices. A hereditary class can pass to subgraphs without any global ordering over graph types. The missing advertised M0 component in this inspected module is connectedness of the actual triangle support; nonemptiness follows from triangle_free_good. This is source inspection, pending the mission’s theorem-level audit.
