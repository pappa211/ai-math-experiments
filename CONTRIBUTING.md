# Contributing

Use an issue for a question or correction and a pull request for a concrete change. Place each new problem in its own folder using the template. No automated research service or scheduled workflow is provided.

For a mathematical claim, state the exact hypotheses and conclusion, cite original sources, explain the relationship to the original problem, and label the evidence:

- **Lean-checked:** give the exact declaration, pinned versions, executed commands, and transitive axiom report.
- **Independently reproduced:** identify the separate implementation or environment and exactly what was repeated. A second execution using the same arithmetic library is not an independent kernel.
- **Informal deduction:** provide an argument and its review status.
- **Finite computation:** state coverage, completeness, numerical assumptions, and reproducible commands.
- **Hypothesis or rejected approach:** distinguish speculation from proof, and preserve counterexamples and scope restrictions.

Do not weaken a frozen definition or target to obtain a proof. The retained A113010 definition, targets, and existing Lean sources are frozen archival artifacts. Proposed corrections or new proofs should be clearly separated and reviewed; do not silently rewrite the archived evidence. Do not import the admitted upstream challenge into a working proof. `sorryAx`, custom unproved axioms, and `native_decide` are not accepted as final proof evidence. The existing axiom allowlist is `propext`, `Classical.choice`, and `Quot.sound`.

Use the documented source and dependency checks. A purported complete solution needs a separate exact-target audit, independent external verification, and a source/novelty review. Intermediate results and local compilation alone do not establish a solution or priority.

Publish only relevant, text-based material. Exclude credentials, private endpoints and personal paths, application-session metadata, raw operational transcripts, binaries, and build caches. Preserve copyright notices and identify third-party provenance. State the actual AI model and reasoning configuration only to the extent supported by evidence.
