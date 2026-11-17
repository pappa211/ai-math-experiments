> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-24 final report

The exact full forest-cover CS theorem, standalone inequality, and separately stated existential anchor are **KERNEL_CHECKED**, with a fresh independent source build and actual declaration/axiom audit. The optional K4-only equality refinement is also checked. No ordinary mathematical claim was corrected or weakened.

| Claim | Status | Formal declaration |
|---|---|---|
| Full CS from existence of any actual forest triangle-edge cover | KERNEL_CHECKED | `Tuza24.forest_cover_cs` |
| Standalone `tau(G) ≤ 2 nu(G)` | KERNEL_CHECKED | `Tuza24.forest_cover_inequality` |
| Existential packing/cover anchored to any supplied forest cover | KERNEL_CHECKED | `Tuza24.forest_cover_anchor` |
| Pointed matching/vertex-cover theorem for arbitrary apex forests | KERNEL_CHECKED | `Tuza24.pointed_apex_forest` |
| K5 exclusion and literal K4-only equality inside the forest-cover class | KERNEL_CHECKED | `forestCover_no_five_clique`, `forest_cover_equality_k4` |

For arbitrary finite simple G, the selected cover may be empty, disconnected, nonminimum, or contain extraneous actual edges. The ambient graph may be cyclic or dense and may contain isolated vertices. Full CS asserts both the inequality and equality iff the unchanged general B predicate of literal K4/K5 actual triangle-component support. The optional refinement explicitly excludes K5 and uses a separate literal-K4 predicate; it does not change B.

The anchor returns SOME actual edge-disjoint triangle packing I and SOME actual triangle-edge cover D such that `C ∩ support I ⊆ D` and `|D| ≤ 2|I|`. It does not quantify over prescribed or maximum packings, and D need not be contained in C. The standalone inequality is proved through this independent anchor construction; full CS uses the hereditary-class minimum-failure argument and both completed apex-forest exclusions.

## Proof and review

The final theorem has no size, sparsity, degree, minimum-cover, WKE-availability, unproved matching, or unproved footprint premise. Perfectness and deficiency count the explicit active neighborhood minus the apex. Complete internal/external augmentation footprints are established for the UNION of all new triangle edges in EACH residual clique, including outside pages on deleted rim edges. Proper-subgraph CS is obtained through proved forest-cover heredity, not assumed globally.

The mathematical route follows the accepted TUZA-22 sources and authenticated TUZA-23 foundation. Several proofs were reorganized: minimum-cover certificates replace alternating-path bookkeeping, residual counts replace ordered perfect-forest paths, and exposure/marking invariants simplify deficiency and safe-edge selection. The separate reviewer accepted those changes as scope-preserving. No claim of historical originality is made.

## Verification evidence

Independent receipt: `review/verification/independent-20261116T104235233151Z`. The reviewer rebuilt 79 local modules, including 40 TUZA-24 modules, from a frozen copied source closure in a fresh output tree. It audited 1042 actual constants, including 938 theorem declarations and private/generated helpers. Collected axioms were exactly `Classical.choice`, `Quot.sound`, `propext`. Source scans and actual audits found no admission, project-defined unproved axiom, unsafe declaration or native proof trust escape. All 27 TUZA-24 theorem controls passed; representative controls cover empty/triangle-free graphs, nonminimum covers, cyclic ambient graphs, shared-vertex packing/equality components, rejected invalid inputs, and matching isolates/perfect/nonperfect boundaries.

The clean run completed in 99.4 seconds; maximum sampled compiler-process-tree RSS was 2152.6 MiB under the 2200 MiB limit. All compilation was serialized on the owner's Mac with explicit per-command deadlines. `THEOREM_LEDGER.json` records actual full types, source hashes, references and per-target closures; `INDEPENDENT_REVIEW.md` gives the independent semantic acceptance.

## Limits and handoff

There is no remaining forest theorem proof gap or pending accepted-target verification. Existing pinned native Lean, mathlib and dependency objects remain the disclosed trust boundary; the clean rebuild is of local project sources, not a cold compiler/mathlib rebuild or a second kernel implementation. The theorem supplies no forest cover for arbitrary graphs and therefore does not settle unrestricted Tuza or unrestricted equality classification.

Reusable results include the pointed apex-forest theorem, the separate existential anchor, matching/exposure/original-leaf selection lemmas and complete-footprint augmentation interfaces. See `RESEARCH_REUSE.md`, `DEPENDENCIES.md` and `REPRODUCTION.md`. Frozen source originals were preserved; the repository has zero remotes. The actual final private commit/tree are recorded in the external checkpoint receipt referenced by `FINAL_RECEIPT.md`.
