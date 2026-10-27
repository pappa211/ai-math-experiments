# Licensing and provenance

Newly authored code and documentation in this archive are made available under Apache License 2.0, to the extent licensable. This does not override retained third-party rights, notices, or licenses, and makes no claim of ownership over mathematical facts.

The original challenge, its copied definition, and upstream configuration come from [Google DeepMind's Formal Conjectures repository](https://github.com/google-deepmind/formal-conjectures/tree/f153efa8fdc078131e214547781d631e2d257daf), revision `f153efa8fdc078131e214547781d631e2d257daf`. The original challenge identifies **Copyright 2026 The Formal Conjectures Authors** and Apache-2.0. Those headers are retained unchanged. Its exact license is included at `problems/A113010/reference/LICENSE` and is also the root license text. The original challenge contains an admitted research proposition and is retained only for comparison, outside the working Lean import graph.

Affected retained upstream material:

- `problems/A113010/reference/113010.lean` and the copied definition in `lean/A113010/Definition.lean`.
- `reference/lake-manifest.upstream.json`, `reference/lakefile.upstream.toml`, and the derived working lockfile whose only root-manifest change is the package name.
- The pinned toolchain identifier and the corresponding provenance records.

Mathlib and the other locked dependencies are **not vendored**. They are fetched from the public URLs and exact revisions in the unchanged Lake manifest. Mathlib's [license at the pinned revision](https://github.com/leanprover-community/mathlib4/blob/0df444a360eaa60ab8c11dca51a86af692955474/LICENSE) is Apache-2.0; every dependency retains its own licensing when fetched. The Lean toolchain, installed tools, and downloaded caches are not distributed here.

Research notes cite external mathematical sources. Known results, including the polynomial support/multiplicity lemma attributed to Mattarei, are not claimed as original discoveries. No third-party paper PDFs or external source repositories are bundled. The full source-to-publication mapping identifies the retained files and transformations. No unresolved licensing issue was identified for the included material during this publication audit; no legal determination of AI-generated authorship or independent novelty is asserted.
