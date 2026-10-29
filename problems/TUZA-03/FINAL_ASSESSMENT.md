# Final assessment

## Recommendation

**Publish after owner review**, as a consolidated research manuscript with an explicit conditional formal-verification boundary. No mathematical defect remains identified in the selected A–F ordinary proofs. A, B, and the general D theorems have completed conditional Lean proofs and clean reproduction; C, E, and F remain ordinary proofs. A separate Lean mission is not required to make this boundary defensible. Historical novelty and publication presentation still warrant owner/external specialist judgment. No commit, push, pull request, release, or publication has occurred.

## A. Mathematical validity

Fresh independent reconstruction accepts:

1. Two-triangle exact-equality restoration for a tripartite full triangle hypergraph.
2. Essential-edge restoration, including the stronger individual-family saving in the critical branch.
3. Flat-remainder restoration without a tripartiteness or planarity hypothesis, including the five-wheel augmentation.
4. Closed-boundary equality deletion, its floor packing-loss bound for stable H, and the general companion stability criterion under the exact independent U/P and actual-edge common-neighbor hypotheses.
5. The mixed/shared-apex exact-two-apex bowtie theorem, including every mixed-family case and the C9/SPGT dependency.
6. Compression to at most 6h²+3h+454 vertices preserving nu/tau of both H and G, the designated restored edges, and old edge stability.

The exact-equality extension predates TUZA-02 and is credited as a follow-up to TUZA-01. The stronger stable four-spoke application is accepted only with its five-active-spoke premise explicit; the extra dependency chain establishing that premise in all reduced critical instances was not independently audited end-to-end. The remaining archived claims are not silently promoted; THEOREM_INVENTORY.md registers them.

## B. Formal verification

| Result | Completed Lean declaration | Explicit external inputs |
|---|---|---|
| Full exact-equality restoration, including bowties | `Tuza.two_triangle_exact_equality` | `HNSInput` |
| Full essential-edge restoration, no slack premise | `Tuza.two_triangle_essential_edge_restoration` | `AharoniInput`, `HNSInput` |
| Stronger individual-family cover saving in the critical branch | `Tuza.two_triangle_essential_family_saving` | `AharoniInput`, `HNSInput` |
| Closed-boundary equality deletion, arbitrary A | `Tuza.closed_boundary_equality_deletion` | `AharoniInput`, `HNSInput`, `BipartiteKonigInput (Finset V)` |
| Stable boundary packing loss at most floor(\|A\|/2) | `Tuza.closed_boundary_packing_loss` | Same as equality deletion |
| General companion stability criterion | `Tuza.closed_boundary_stability` | `AharoniInput`, `HNSInput` |

`AharoniInput` states the tripartite full-graph triangle bound tau<=2nu. The frozen `HNSInput` states that a tripartite equality graph has nu edge-disjoint actual K4s; this interface includes the published home-base extraction and the ordinary graphical loose-cycle conversion inherited from TUZA-01. Those deep inputs and the conversion inside that frozen interface remain assumed in Lean. New equality exhaustion, face compatibility, mixed-family covers, Hall classification, free-page and apex arguments are proved.

`BipartiteKonigInput` is classical finite bipartite matching/vertex-cover equality, stated using an edge family of pairs between two disjoint vertex sides. It contains no triangle, boundary, or restoration conclusion. The conversion of the full lost triangle family to spoke pairs, injectivity, matching-to-triangle-packing compatibility including shared rim edges, and cover conversion are all proved in Lean.

All these declarations quantify over an actual finite `SimpleGraph V` and use `triangles G = G.cliqueFinset 3`. The extremal functions are actual packing/cover optima. The only transitive axioms reported are drawn from `propext`, `Classical.choice`, and `Quot.sound`. These axiom reports do not discharge the explicit published-input parameters.

Flat restoration, the mixed/shared-apex exact-two-apex bowtie theorem, compression, and the separate stable-four-spoke application are **not Lean-formalized** here. Their ordinary proof statuses are recorded separately. There is no Lean theorem for unrestricted restoration, OCT-five, or fixed c<3 density extension.

## C. Significance

Essential-edge and flat restoration are substantive unbounded classes; the wheel step adds content beyond the essential-edge theorem. The closed-boundary theorem is the strongest general structural mechanism: arbitrary graph order, packing number, and boundary deletion size, with a simultaneous packing construction and a proved reduction to classical König. The exact mixed/shared-apex bowtie theorem is a further substantive subclass. Compression is useful exact-preservation infrastructure and belongs in an appendix; known linear decision kernels preclude an improved-kernel-size claim.

A targeted primary-source review found no exact predecessor, but does not establish historical priority. HKT flat hypotheses/equality, HNS extraction, and the fractional/integer distinction were checked. Appropriate citations and attribution are retained. Earlier agent agreement was not counted as independent evidence.

## D. Publication readiness

The deliverables and curated text-only overlay are under this mission workspace. The proposed arrangement preserves TUZA-01 unchanged, puts selected TUZA-02 research/provenance in TUZA-02, and the consolidated manuscript/formal package/TUZA-03 provenance in TUZA-03. The publication manifest records every staged file and original source hash. The publication-tree safety/link/source-hash scan and distributed certificate-script reproduction passed, as recorded in PUBLICATION_READINESS.md; no raw private archives, compiled caches, binaries, credentials, or Git history are intended for publication.

Before any separately authorized upload, the owner should review the manuscript, explicit assumptions, novelty wording, and exact overlay diff against the pinned public baseline, and authorize commit/push/publication separately. If the public base has moved, rebase the overlay and recheck that TUZA-01 remains unchanged. No automatic follow-up is scheduled.

## Limits and evidence

The unrestricted restoration conjecture, OCT-five, and fixed c<3 density extension remain **UNPROVED**. No finite search is represented as an unbounded proof. The main contribution is the actual verified theorem scope, not the number of files or tests.

The public TUZA-01 baseline matched all 41 archived publication files at commit `78462f29a64ef04714f0f2e42aaf42684057e7d9`; all nine dependency revisions matched. The TUZA-02 remote baseline matched all 48 historical hashes. Original/snapshot integrity checks found no changes. Independent computation replay checked named constructions and 35 recurrence certificates; 70 local bowtie witness configurations were separately checked. Clean project builds reused pinned compiled dependencies, not a cold dependency rebuild.
