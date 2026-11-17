> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-24 independent review — ACCEPTED

Reviewer: the separate AI agent `tuza24_review`, which did not author the mathematical Lean modules. Acceptance: 2026-11-16T10:47:16.693024+00:00. The exact frozen source snapshot is `operations/accepted_source_freeze.json` (freeze 2026-11-16T10:41:54.145091+00:00; SHA-256 `0fd3bf224afb49f03056d894f23137460ab9c60885a4e0db23fcbee909553919`). Detailed machine-readable findings are in `review/final_acceptance.json`.

## Accepted conclusions

| Declaration | Accepted scope | Status |
| --- | --- | --- |
| `Tuza24.forest_cover_cs` | Arbitrary finite G with HasForestCover G implies unrestricted Tuza23.CS G | KERNEL_CHECKED |
| `Tuza24.forest_cover_inequality` | Same sole class hypothesis implies tau(G) ≤ 2nu(G) | KERNEL_CHECKED |
| `Tuza24.forest_cover_anchor` | For any supplied actual ForestCover G C, existential actual packing I and cover D with C∩support(I)⊆D and |D|≤2|I| | KERNEL_CHECKED |
| `Tuza24.forest_cover_equality` | Within the forest-cover class, equality iff unchanged literal K4/K5 component predicate B | KERNEL_CHECKED |
| `Tuza24.forest_cover_equality_k4` | Within the forest-cover class, equality iff literal K4 component support | KERNEL_CHECKED |
| `Tuza24.pointed_apex_forest` | Isolating w leaves a forest ⇒ existential pointed matching/residual vertex-cover witness, including isolates and disconnected cases | KERNEL_CHECKED |
| `Tuza24.forestCover_no_five_clique` | Any supplied actual forest cover excludes every actual five-vertex clique | KERNEL_CHECKED |

No minimum-cover, size, sparsity, connectivity, matching-availability, generic-CS, external-solver, census or unproved local-reduction premise remains in the final forest CS statement. I and D in the anchor are existential; I is not prescribed or asserted maximum, and D may contain any actual G edges. B remains K4/K5 in the general theory. K4-only equality is a separately proved within-class refinement.

The reusable local exclusions, augmentations, deficiency and safe-edge theorems are checked at their explicit conditional scopes. In particular, the abstract deficiency-two theorem requires active-set conditions and disjoint peers for every maximum matching. These premises are proved before its use in the final graph theorem; this review does not advertise it as an unconditional fact about every nonperfect forest.

## Independent build and actual-declaration audit

Run directory: `review/verification/independent-20261116T104235233151Z`.

The reviewer copied the entire accepted 79-module local source closure into a fresh tree, checked it against the frozen hashes and rebuilt every local module, including reused TUZA-23/TUZA-06 sources and the controls. Roots were `Research` and `Tuza24.Controls`. The clean LEAN_PATH excluded all development-project objects. Existing compiler/Mathlib/package artifacts were reused only at the disclosed pinned dependency boundary.

The independent run started 2026-11-16T10:42:35.233486+00:00 and completed 2026-11-16T10:44:14.663230+00:00 in 99.43 seconds. Every compile and the audit command exited successfully on the first final attempt. There was no final audit retry or mathematical source change. Commands held the shared exclusive build lock, used `-j1 -M2200`, a 240-second external per-command deadline, process-tree RSS monitoring and the unchanged mission deadline. Peak tree RSS was 2,257,158,144 bytes (2152.59 MiB), below the 2,200 MiB ceiling. All owned compiler jobs finished and the slot was released.

The actual Lean environment audit enumerated 1,042 project constants and 938 theorems by owning module, including 64 private constants and 63 private theorems, plus generated helpers. It recorded full elaborated types, universe parameters, proof/type constant references, collected axioms, owning source hashes and build receipts. All 19 selected target types and local transitive reference closures were reviewed. The declarations contain no project-defined axiom and no unsafe declaration. The comment/string-aware source scan found no forbidden proof escape construct.

Every collected target/local axiom was among exactly `propext`, `Classical.choice`, `Quot.sound`. There was no `sorryAx`, `native_decide` trust extension or external solver assumption. The actual local expression closures of all 19 targets contain no historical Degenerate/CombinedStatement, HNS or Aharoni declaration. Imported degree-conditioned declarations in unused portions of broad modules do not enter these target proofs.

The full-CS local expression closure has 742 declarations. The anchor closure has 173 and the inequality closure 181; neither contains CS, MinimalCS, MinimalObstruction or forest_cover_cs. Thus the anchored construction and its inequality are separately checked and independent of the equality/minimality argument. The K4 equality closure has 749 local declarations. These counts describe audit coverage, not counts of new mathematical advances.

Primary evidence:

- `review/verification/independent-20261116T104235233151Z/summary.json`: successful run and resource summary.
- `review/verification/independent-20261116T104235233151Z/intake.json`: exact source order/hashes, compiler identity, all package pins and clean paths.
- `review/verification/independent-20261116T104235233151Z/commands.json` and `logs/`: every rebuild and audit command.
- `review/verification/independent-20261116T104235233151Z/declarations.json`: all actual declarations, full types, references and axioms.
- `review/verification/independent-20261116T104235233151Z/target_local_dependency_closures.json`: the 19 exact target types and transitive local reference closures.
- `review/verification/independent-20261116T104235233151Z/source_scan.json`: clean source trust scan.

## Semantics and proof reconstruction

The frozen specification was accepted before dependent implementation. Interim and complete mathematical reconstructions are preserved in `review/initial_semantic_reconstruction.md`, `review/local_input_scope_audit.md`, `review/interim_anchor_semantic_review.md`, `review/interim_augmentation_semantic_review.md` and `review/full_route_semantic_review.md`, with corresponding hash manifests.

The main semantic findings are:

1. Actual graph triangles, actual-edge covers, edge-disjoint triangle packings and vertex-disjoint ordinary matchings are correctly distinguished. Same-vertex heredity discharges the class-local minimum-failure premise.
2. The path-free exposure decomposition derives true maximum matching/minimum cover facts from checked forest leaf induction and weak duality. Retained ambient isolates lie in D; perfect/nonperfect counts use the explicit active neighborhood minus w.
3. The original-leaf retention and avoidance lemmas use forest bridge separation to exclude deletion-created leaves. The disjoint-peer and deficiency arguments have their exact assumptions discharged. The safe-edge invariant propagates along the proved D-A reachability graph, not arbitrary graph walks.
4. The perfect branch's edge-count/refined-leaf reorganization supplies the precise path consequences needed by its augmentations without weakening the theorem. Both perfect and nonperfect branches are completed.
5. Every augmentation uses one maximum residual packing avoiding the ENTIRE selected support. Deleted page bases and simultaneous matching/page intersections establish the required two-edge common-center footprint in every residual literal block. Arbitrary outside pages and all actual crossing triangles remain included.
6. The anchor lift covers all triangles lost on removed rim edges, checks the unique possible selected hub spoke, and actualizes the assembled cover without losing the anchor or cardinal bound.
7. The optional K5 exclusion is proved by a proper two-coloring of the selected forest and a three-vertex same-color triangle in a hypothetical actual five-clique. Literal component support then gives the K4 refinement.

No ordinary mathematical statement was corrected or refuted. Changes from the ordinary exposition are proof reorganizations and Lean/API repairs, documented separately from mathematical claims. No novelty claim is inferred from formalization.

## Controls and integrity

The rebuilt controls cover empty vertex types and empty covers; triangle-free cyclic ambient graphs; K4 with opposite-edge forest cover and a cyclic ambient graph; a genuinely nonminimum K3 forest cover; disconnected selected components and shared-vertex equality components; shared-vertex triangle packings and rejection of shared-edge packings; rejection of nonactual and invalid empty covers; empty, perfect and nonperfect matching cases; and explicit exclusion of the retained apex from the active perfect-matching count. The anchor control preserves existential I,D with the supplied nonminimum C. The exact final target types were independently inspected as part of the environment audit. These finite controls protect semantics and are not substitutes for the all-size proofs.

After verification all 79 accepted source hashes, the theorem specification and the 19-target list still matched the frozen snapshot. The private workspace had zero Git remotes at review. Final private checkpoint identifiers and overall mission closeout are recorded by the coordinator in FINAL_RECEIPT.md; this review does not pre-attest a future commit.

## Verification limits

This is independent AI source/semantic review and a fresh local Lean build using the same pinned compiler/kernel implementation. It is not human peer review, a second kernel implementation, or a cold rebuild of Lean/Mathlib. Lean is `Lean (version 4.33.1, arm64-apple-darwin24.6.0, commit 819816b2e0a3bf405af45ae5c7af2491d8f5bee6, Release)`; mathlib is `0df444a360eaa60ab8c11dca51a86af692955474`; all nine package revisions match the manifest. Standard classical foundations are explicitly reported above.

No proof or verification obligation remains for the accepted forest-cover targets within that boundary. No unrestricted forest-cover availability theorem, cyclic-cover extension or global Tuza theorem has been proved by this mission. Those remain outside the checked class theorem.
