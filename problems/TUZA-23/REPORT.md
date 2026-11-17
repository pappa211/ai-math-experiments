> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-23 — targeted formalization report

## Outcome and acceptance status

**Exact all-size R2 is KERNEL_CHECKED and accepted**, with its supporting foundation, independent semantic review, a clean source rebuild and an acceptable actual axiom closure. The separate full M0 package is KERNEL_CHECKED_CONDITIONAL on its explicitly stated proper-subgraph CS/minimal-failure premises. The forest dependency plan is complete; the forest theorem remains ordinary-only. Independent verification is recorded in `verification/independent-20261116T092129409939Z/summary.json`.

Unrestricted Tuza and universal CS remain open. This mission does not prove a universal packing blocker or turn a conditional minimal-counterexample argument into a solution.

## Exact primary result

`Tuza23.r2`, in `Tuza23/R2.lean`, says: for any finite simple graph H and finite set F of at most two distinct nonedges, if every actual shared-edge triangle component of H has literal K4 or K5 support and H+F is tight, then every actual shared-edge triangle component of H+F also has literal K4 or K5 support.

The vertex type is arbitrary, with no order bound. Unordered two-element vertex sets represent edges; unordered actual three-vertex cliques represent triangles. Packings may share vertices. Every crossing triangle is included. Empty graphs, isolates, old triangle-free edges, arbitrary outside attachments and vertex-sharing components are permitted. This is equality restoration, not a full-CS theorem for H+F. Its only mathematical hypotheses are the stated nonedge condition, insertion-cardinality limit, old B property and final equality.

The proof follows the frozen R2 architecture. The whole-page footprint lemma controls the union of both spokes of every ordinary page of one nonedge in each old clique component. Actual crossing-triangle closure forces this footprint to have at most one edge. Minimum covers and maximum packings are assembled over full component supports. Tightness forces the exact increment, bare pages for both edges, and intersection of every ordinary page with every opposite bare page. Adjacent new edges collapse to one apex and admit a cheaper cover. Disjoint new edges force the full new family onto four endpoints; opposite-pair cover lemmas force a literal K4 whose edges avoid all old triangle support. Exhaustive decomposition then proves the actual component conclusion.

## What can be reused safely

The small entry point is `Research.lean`. New modules separate graph semantics, clique choices, simultaneous block choices, the whole-family footprint, page accounting, geometry and restoration.

- The authenticated TUZA-06 finite-family framework supplies genuine extremal packing/cover cardinalities and attaining witnesses. The new GraphCover bridge proves equivalence with minimum covers consisting of actual graph edges.
- Actual component/decomposition equivalence, packing/cover additivity, labelled K4/K5 parameters, one-edge packing avoidance, and prescribed-edge minimum covers are available as checked ingredients. Generic finite-family additivity is connected to actual component graph realizations by the M0 support-graph lemmas.
- `Tuza23.one_edge_insertion` proves strictness in addition form, avoiding truncated-natural-subtraction ambiguity.
- `Tuza23.whole_page_footprint`, `blocks_min_cover_footprint`, `blocks_max_packing_footprint` and the page assembly lemmas retain arbitrary page counts and attachments.
- `Tuza23.minimal_cs_package` supplies the complete class-independent M0 package at its explicit conditional scope. A smallest same-vertex strict-edge-subgraph CS failure has a nonempty shared-edge-connected actual triangle family, no triangle-free edges, tau=2nu, and every actual-edge deletion preserves nu and lowers tau by one. Existence is obtained by finite edge-count minimization. An additional class wrapper states hereditary closure explicitly.

M0 assumes that all proper edge subgraphs satisfy CS. That is a legitimate conditional reduction; it does not establish universal CS. R2 does not assume M0, minimality, sparsity, an external solver verdict, or its own footprint conclusion.

## What remains unformalized

The forest-cover theorem is not claimed as Lean-verified. `FOREST_FORMALIZATION_PLAN.md` gives its exact ANY-forest-cover hypothesis, source-to-statement map, dependency graph and assessed obstacles. Its principal reusable investments are a finite forest matching/cover and alternating-reach interface, the existential anchored forest construction, and the complete apex-forest residual-footprint exclusions. Broader mixed tree/K3 compatibility is separated from the forest-only route.

Global blocker availability, unrestricted Tuza and universal CS remain open. Full R3 and the cycle-cover classes were outside this mission's implementation scope.

## Did Lean require a mathematical change?

No hypothesis or conclusion of R2 was changed. No gap in the frozen ordinary proof was identified during this formalization or the available AI reconstruction. The disjoint-case presentation uses generic four-set/opposite-edge cover lemmas instead of enumerating which cross edge is missing; this is a proof organization change with the same mathematical scope. Elaboration repairs concerned finite-set coercions, API names, implicit arguments and rewriting. The installed pretty-printer option mismatch in the audit harness was also a tooling issue, not a mathematical correction.

## Verification, limits and resources

All Lean compilation and validation ran locally on the owner's Darwin arm64 Mac in the new private TUZA-23 workspace. Lean 4.33.1 and all nine dependency revisions were pinned. Reused project modules were copied at the authenticated public commit and rebuilt from source. Existing compiler/mathlib/native dependency objects remain a disclosed trust boundary; no cold dependency rebuild or independent kernel implementation is claimed.

Semantic controls check actual K4/K5 parameters, empty and triangle-free graphs, shared-vertex packings, invalid cover/shared-edge packing rejection, vertex-sharing K4 components, and representative adjacent/disjoint insertions. A negative fixture omitting old B is rejected by the type checker; this tests the API, not mathematical independence of that hypothesis.

One monolithic control attempt exceeded the 2,200 MiB process-tree ceiling and was terminated by the monitor. Splitting the controls resolved the issue without raising the cap. Successful compiler processes used a single thread and ran serially, with external timeouts and RSS receipts. No dependency installation or update occurred.

Review was AI-only. Exact theorem types, actual axiom closures, build commands and limits are documented in `THEOREM_LEDGER.json`, `AXIOM_AUDIT.md`, `INDEPENDENT_REVIEW.md` and `REPRODUCTION.md`. No native_decide, project-defined unproved axiom, sorry/admitted proof, or unsafe proof escape is acceptable in the final closure. Standard Lean axioms are reported explicitly; this is not an axiom-free claim.

## Next best use of effort

With R2 secured, the next unrestricted research mission can focus on the missing global blocker or residual-selection mechanism. Further formalization is useful for a chosen forest matching/alternating-path foundation, but formalizing more special classes by itself does not supply the missing global bridge. Renewed global mathematical research is therefore the stronger next priority for the unrestricted objective. No follow-on campaign is started here.

## Clock and checkpoint

The original start is 16 November 2026 08:51:42 UTC (09:51:42 Europe/Oslo); development cutoff 16:21:42 UTC and final deadline 16:51:42 UTC. This deliverable-focused mission permits early completion only after R2, its foundation, M0, the forest plan and all required verification are complete. Actual completion time, stopping reason, source-integrity results and the non-self-referential commit receipt are finalized in FINAL_RECEIPT.md and the owner-facing closeout.

Final preparation: 2026-11-16T09:29:56.151449+00:00, 38m14s after the original start. All required deliverables and independent verification are complete; the run ends under its authorized early-completion rule. All 416 selected source-integrity checks passed. The final private commit and actual postcommit elapsed time are reported externally as described in FINAL_RECEIPT.md.
