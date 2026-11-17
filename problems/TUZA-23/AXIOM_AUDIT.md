> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual theorem dependency and axiom audit

**PASS.** Independent fresh-source compilation and an environment-based audit accepted the final source snapshot. The exact receipt is `verification/independent-20261116T092129409939Z/summary.json`; `declarations.json` records each actual declaration's complete printed type (universes and proof arguments included), owning module, source hash, build receipt, direct references, and transitive axioms. There are no proof-printing ellipses in the stored types.

The only axioms found are `propext`, `Classical.choice`, and `Quot.sound`. In particular, both `Tuza23.r2` and `Tuza23.minimal_cs_package` use exactly that standard set. No project-defined unproved axiom, sorryAx, unsafe local declaration, native computation trust axiom or unverified generated theorem was found. This is not an axiom-free claim.

The audit covers all 505 actual constants owned by the 31 rebuilt local modules, including 446 theorem constants and private/generated helpers, not merely a regular-expression list of public theorem names. The source scan strips comments and strings before checking for forbidden trust constructs. The actual Lean environment audit checks each constant and its collected axioms, so successful compilation alone is not the acceptance criterion.

`r2_local_dependency_closure.json` walks actual type/proof references among the local constants. R2's closure contains no `Tuza23.M0` declaration and no minimality-named dependency. Some shared import modules contain unrelated conditional declarations; importing that module does not make those unused theorems assumptions of R2. Historical AharoniInput/HNSInput are definitions of propositions, not axioms, and are not assumptions of R2.

M0 has no project axiom, but its mathematical statement is explicitly conditional: a graph fails CS and all strict same-vertex edge subgraphs satisfy CS. The theorem is complete at that scope. Universal CS and blocker existence remain unproved. These explicit mathematical hypotheses must not be confused with Lean's foundational axiom inventory.

The clean build uses the standard pinned Lean compiler and existing exact-version mathlib/native dependency objects. It rebuilds all copied local project modules from source in a separate output tree; it does not rebuild the compiler or mathlib and is not an independent kernel implementation. The reviewer is an internal AI role, not an external human reviewer.

One audit-harness attempt failed solely because `pp.width` is not a supported installed option. Its failed log is retained. The reviewer corrected the audit harness to `format.width`, enabled full proof printing, and reran the audit against the same successfully rebuilt fresh project objects. No accepted mathematical source changed, and the final audit exited successfully.
