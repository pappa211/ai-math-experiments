> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent final semantic, clean-build and axiom review

Verdict: ACCEPT exact all-size R2 and its supporting foundation as KERNEL_CHECKED at their stated hypotheses. ACCEPT class-independent M0 as KERNEL_CHECKED_CONDITIONAL on the explicitly defined proper-subgraph CS minimality premise. The forest-cover theorem remains ORDINARY_ONLY; its exact assessed dependency plan is delivered, not a formal proof of that theorem. Unrestricted Tuza and universal CS remain open.

Reviewer role: a separate TUZA-23 AI agent. The reviewer independently reconstructed the ordinary R2 proof, reviewed the frozen specification before dependent code grew, read every new mathematical source and semantic control, and then reproduced the entire accepted local import closure from copied source in a fresh output tree. This is AI review and standard Lean kernel checking, not external human review, independent discovery, or an independent kernel implementation.

## Exact theorem and mathematical faithfulness

The accepted primary declaration is `Tuza23.r2` in module `Tuza23.R2`. It quantifies over arbitrary finite simple graphs with unordered finite-set edges. Its sole hypotheses are that F comprises old nonedges, card F<=2, B(H), and equality tau(H+F)=2nu(H+F); it concludes B(H+F). It matches THEOREM_SPEC.md v1. No degree, graph-order, attachment, page-count, nonempty-vertex-type, CS, M0, footprint or external proof premise is added. The exact fully explicit elaborated type is stored in declarations.json.

Actual triangles include all crossing triangles; packings permit shared vertices but require edge-disjoint supports; graph covers use actual graph edges, with a proved optimum bridge to the internal Covers predicate. B uses full shared-edge triangle components and literal K4/K5 edge support. The existing decomposition equivalence is exhaustive. Empty graphs, background edges, disconnected graphs and shared vertices of old components are covered.

The new full-page footprint controls the union of BOTH spokes of ALL old common-neighbor pages in each component. Simultaneous minimum covers and maximum packing choices are proved. Exact insertion increments, bare pages for each inserted edge, and universal page/bare-page intersection follow without a census. Adjacent-edge common-apex collapse handles the possible two-new-edge triangle explicitly. Disjoint-edge geometry confines every actual new triangle to the four endpoints, then symbolic opposite-pair cover savings force a new K4 with edge support disjoint from all old triangle support. Final exhaustive decomposition assembly includes every new triangle.

M0 proves exact graph realization of closed triangle families, shared-edge connectivity of all actual triangles in a minimum CS failure, every actual edge supported, tightness and the precise one-edge deletion identities. Its fixed ambient vertex type and finite-edge minimization are explicit. The hereditary-class variant explicitly assumes subgraph closure. It is a complete conditional reduction, not a proof that every graph satisfies CS.

No mathematical correction was exposed. The generic four-set opposite-pair lemmas reorganize the source's missing-cross-edge casework without changing hypotheses or conclusion. Detailed reviews and fixed hashes are in specification_v1_review.md, foundation_semantic_review.md, accounting_m0_semantic_review.md and r2_final_semantic_review.md with their associated manifests.

## Independent clean build

Receipt directory: `verification/independent-20261116T092129409939Z/`.

- Roots: Research and Tuza23.Controls.
- All 31 local modules in their import closure, including copied historical foundation modules, were rebuilt serially from source in `clean/`, into previously empty `clean/.lake/build/lib/lean` outputs. No development project olean was reused.
- Existing native Lean 4.33.1 and all nine pinned dependency revisions were authenticated. Lean compiler identity and exact commands are in intake.json and commands.json.
- Only existing pinned compiler/Mathlib/dependency artifacts were reused; no download, package update, cold dependency rebuild, historical-output mutation or server computation occurred.
- One compiler process tree at a time, Lean -j1 -M2200, external command deadlines, process-tree RSS sampling and a shared compiler lock were used.
- Peak sampled process-tree RSS was 2,111,848,448 bytes (about 2,014 MiB), below the unchanged 2,200 MiB ceiling. The source build plus audit, including the audit-only retry, completed in 134.361 seconds.
- Every copied accepted source hash still matched its source at successful close. Source-scan tokens for sorry, admit, axiom, unsafe, native_decide, implemented_by and extern were absent after excluding comments and strings.

The first audit command returned exit 1 solely because the reviewer harness requested unsupported pretty-printer option pp.width. All accepted source builds had already passed, and the first audit printed the inventory. The auditor was corrected to installed format.width and pp.proofs=true; only the audit was rerun against the same fresh objects. The original failed command/log is preserved. No accepted mathematical source changed and no successful mathematical build was needlessly repeated.

## Actual declaration and axiom audit

The audit enumerates constants from the actual imported Lean environment by owning local module, rather than relying on a regex theorem list. It inspected 505 declarations, including 446 theorems plus definitions, private helpers and generated constants. These counts describe audit coverage, not mathematical progress.

For each declaration, declarations.json records module, complete printed elaborated type and universe parameters, actual transitive axioms, unsafe/axiom flags, direct type/proof references, source SHA256 and the exact source-build receipt. All recorded types were checked for omitted-proof ellipses; none contains the ellipsis marker. The audit mechanism is the installed Lean.collectAxioms used by #print axioms. Only propext, Classical.choice and Quot.sound occur. No sorryAx, project-defined unproved axiom, unsafe project declaration or native-computation trust axiom was accepted.

Both Tuza23.r2 and Tuza23.minimal_cs_package have exactly the standard axiom set {propext, Classical.choice, Quot.sound}. Standard logical axioms are explicitly acknowledged; these theorems are not described as axiom-free.

The actual local proof/type dependency graph for R2, stored in r2_local_dependency_closure.json, contains no declaration owned by Tuza23.M0 and no minimality-named declaration. The older MinimalObstruction module contributes a proved triangle-family invariance helper; importing that module does not make proper-subgraph CS a premise of R2. The final theorem type likewise contains no M0/CS assumption.

## Semantic controls and expected-negative guard

The independent clean build checked actual K4/K5 parameters, the empty vertex case, a shared-vertex two-triangle packing, rejection of a shared-edge packing, rejection of an empty K4 cover, two literal K4 triangle components sharing exactly a vertex, triangle-free old background edges, a C4 plus disjoint diagonals producing K4, and an adjacent insertion giving a strict inequality. The positive exact_r2_type declaration checks the full exported signature without additional hypotheses.

The reviewer independently replayed the excluded missing-B fixture against the fresh project objects. It exited 1 with the exact expected application type mismatch: augmented tightness was supplied where B H was required. Receipt: negative_guard.json. This is an API-hypothesis regression guard, not evidence that deleting B makes the mathematical statement false or independent. The fixture is not imported into the accepted library.

## Remaining scope and useful reuse

A later mission can safely reuse the exact R2 theorem, graph optimizer/witness APIs, clique parameters and choices, actual triangle-component decomposition and additivity, one-edge strict insertion, whole-page footprint, simultaneous block choices, and the conditional M0 package, subject to the disclosed pinned toolchain/artifact trust boundary. The forest-cover plan identifies ordinary-only matching/alternating-reach and apex-forest exclusions. No universal blocker, unrestricted CS, unrestricted Tuza, or full forest theorem was formalized here.

The formalization has secured the intended restoration foundation. Further formalization would most profitably target the reusable forest matching/alternating-reach interface if that is the next objective; the remaining unrestricted obstruction is mathematical global selection/blocker availability, so renewed global research is a reasonable next strategic use of effort once the owner authorizes it. Neither direction is initiated by this review.
