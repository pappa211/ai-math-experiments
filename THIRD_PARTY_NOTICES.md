# Licensing and provenance

Newly authored code and documentation in this archive are made available under Apache License 2.0, to the extent licensable. This does not override retained third-party rights, notices, or licenses, and makes no claim of ownership over mathematical facts.

The original challenge, its copied definition, and upstream configuration come from [Google DeepMind's Formal Conjectures repository](https://github.com/google-deepmind/formal-conjectures/tree/f153efa8fdc078131e214547781d631e2d257daf), revision `f153efa8fdc078131e214547781d631e2d257daf`. The original challenge identifies **Copyright 2026 The Formal Conjectures Authors** and Apache-2.0. Those headers are retained unchanged. Its exact license is included at `problems/A113010/reference/LICENSE` and is also the root license text. The original challenge contains an admitted research proposition and is retained only for comparison, outside the working Lean import graph.

Affected retained upstream material:

- `problems/A113010/reference/113010.lean` and the copied definition in `lean/A113010/Definition.lean`.
- `reference/lake-manifest.upstream.json`, `reference/lakefile.upstream.toml`, and the derived working lockfile whose only root-manifest change is the package name.
- The pinned toolchain identifier and the corresponding provenance records.

Mathlib and the other locked dependencies are **not vendored**. They are fetched from the public URLs and exact revisions in the unchanged Lake manifest. Mathlib's [license at the pinned revision](https://github.com/leanprover-community/mathlib4/blob/0df444a360eaa60ab8c11dca51a86af692955474/LICENSE) is Apache-2.0; every dependency retains its own licensing when fetched. The Lean toolchain, installed tools, and downloaded caches are not distributed here.

Research notes cite external mathematical sources. Known results, including the polynomial support/multiplicity lemma attributed to Mattarei, are not claimed as original discoveries. No third-party paper PDFs or external source repositories are bundled. The full source-to-publication mapping identifies the retained files and transformations. No unresolved licensing issue was identified for the included material during this publication audit; no legal determination of AI-generated authorship or independent novelty is asserted.

## TUZA-01

The TUZA-01 Lean theorem modules and pinned package files were authored during this project's private research/validation and are published as sanitized text sources under the existing root license, to the extent licensable. The new manuscript, Markdown rendering, portable verification scripts, reports and source manifests follow the same license. No human authorship or independent novelty is asserted by that licensing statement. Original mathematical inputs are attributed in the manuscript and BibTeX references.

The load-bearing mathematics is Aharoni (2001), Haxell–Narins–Szabó (2018), and, for the derived density corollary, Liu–Zeng arXiv:2610.15539v1 plus published fractional-packing approximation (Haxell–Rödl or Yuster). The small-family lemma and earlier coloring/equality results are attributed separately. Their proofs, copyrights and publication licenses remain with their owners. No third-party paper PDFs, full-text HTML, images, or external source repository are redistributed. The dependency manifest points to public pinned sources; fetched dependencies retain their own notices and are not vendored.

The Lean proof is conditional on named external theorem hypotheses. Neither a standard-only axiom report nor this repository license formalizes or discharges those inputs. See [TUZA-01 provenance](problems/TUZA-01/reproduction/SOURCE_PROVENANCE.json) and [source comparison](problems/TUZA-01/reference/README.md).


## TUZA-04–06 and the five-degenerate paper

The new canonical paper, 280 mathematical Lean modules, portable helpers and curated public research records use the repository's Apache-2.0 license to the extent licensable. This makes no claim of ownership over mathematical facts, human mathematical authorship, external peer review or historical priority.

Puleo's reducible-set framework and relevant local inequality reductions, Botler–Fernandes–Gutiérrez Lemma 3.3, and Cui–Haxell–Ma's planar equality characterization are attributed at their actual points of use in the [paper](papers/tuza-five-degenerate/main.md) and [bibliography](papers/tuza-five-degenerate/references.bib). The combined equality extensions are explicitly distinguished. Third-party full papers, full-text extractions and source archives are not redistributed; [consultation hashes and primary URLs](problems/TUZA-06/provenance/LITERATURE_IDENTITIES.json) identify the consulted sources. Earlier private packaging statements are not adopted as the public inclusion inventory.

Four foundation Lean files are retained byte for byte from the earlier public TUZA-03 development; their provenance and hashes are in [REUSED_LEAN.json](problems/TUZA-06/provenance/REUSED_LEAN.json). Their unrelated conditional interfaces are not assumptions of the main five-degenerate theorem. Existing upstream headers are retained.

The exact-module replay tool adapts Lean 4.33.1's standard LeanChecker. Its unchanged upstream source, precise adapter diff, source/body hashes and boundary are in [reproduction](problems/TUZA-06/reproduction/README.md). The upstream Lean tool license is retained at [LEAN_TOOL_LICENSE.txt](problems/TUZA-06/reproduction/LEAN_TOOL_LICENSE.txt); retained copyright/license headers remain controlling. The unsafe IO/runtime-cap wrapper is a verification tool outside the mathematical closure, not a separate kernel implementation. The Lean toolchain and pinned Mathlib/other package distributions are not bundled; the identified replay source retains its upstream licensing.

The editorial report adds citations to Tuza (1990), Gupta arXiv:2608.06538v1 and Liu–Zeng arXiv:2610.15539v1 after primary-text checks. No full third-party article is redistributed. The original verification evidence and its old paper hash are preserved; current editorial artifacts are identified separately.
