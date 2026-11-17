> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent axiom and source audit

**PASS.** Frozen sources were independently copied and rebuilt by the separate reviewer, with one monitored compiler tree at a time. Receipt: `review/verification/independent-20261116T104235233151Z`.

- 79 accepted local modules; 1042 actual constants; 938 theorem declarations, including private/generated helpers.
- Collected axioms: `Classical.choice`, `Quot.sound`, `propext`; no others.
- No accepted local axiom declaration, unsafe declaration, `sorryAx`, admitted proof, `native_decide` or native trust extension.
- Source hashes before and after the run match the frozen manifest. All selected package revisions match their pinned manifest values.
- Maximum sampled process-tree RSS: 2152.6 MiB; serial `-j1 -M2200`; 240-second external per-module timeout.

`declarations.json` contains actual full declaration types, direct references, collected axioms and individual build receipts. `target_local_dependency_closures.json` traverses actual type/proof references among local declarations for every named audit target. The semantic reviewer separately checked explicit hypotheses and discharged their use in full CS; an acceptable axiom list alone is not a scope proof.

The standard axioms above are reported, not hidden. Existing installed native compiler and pinned dependency objects remain trusted inputs; no cold compiler/mathlib rebuild or independent kernel implementation is claimed. Copied provenance modules outside `operations/accepted_build_order.json` are not represented as accepted TUZA-24 theorem claims.
