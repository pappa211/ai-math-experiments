# TUZA-16–19 publication evidence

Unrestricted Tuza remains unresolved. [Report](../../papers/tuza-16-19-research-summary/main.md) · [Current guide](../../RESEARCH_STATUS_2026-11-15.md) · [Complete claim inventory](CLAIM_EVIDENCE.md) · [Machine ledger](CLAIMS.json) · [Dependencies](DEPENDENCIES.md) · [Witnesses](WITNESSES.md) · [Adaptations/corrections](CORRECTIONS.md).

## Fresh publication checks

- [Finite replay: 23 exact targets](finite/README.md), with [results](finite/VERIFICATION.json) and logs.
- [Finite formal replay](formal/README.md): 133 accepted modules, 128 separate WKE chunks, 5,375 cases, 444 named declarations and 150 theorems, plus three expected rejections. [Literal types and axioms](formal/declarations.json).
- [Native compiler resolution checks](LEAN_RESOLUTION_CHECK.json), including missing-toolchain refusal before proxy execution.
- [Report build](REPORT_BUILD.json) and [all-page PDF review](PDF_REVIEW.json).
- [Original-source and older-public-file preservation](SOURCE_INTEGRITY.json).
- [Source mathematical reconstruction](SOURCE_MATHEMATICAL_REVIEW.md) and [portability preflight](SOURCE_PORTABILITY_REVIEW.md). These precede the separate frozen-candidate reviews.
- [Frozen candidate identity](CANDIDATE_MANIFEST.json), [mathematical/editorial candidate review](INDEPENDENT_MATH_REVIEW.md), [portability/privacy candidate review](INDEPENDENT_INTEGRITY_REVIEW.md), and [release verification](RELEASE_VERIFICATION.json).
- [Privacy audit](../../PRIVACY_AUDIT_2026-11-15.md), [source mapping](../../problems/TUZA-16-19-SOURCE_MANIFEST.json), and [historical release inventories](release-at-d4029fb/README.md).

The default finite suite uses public files and Python's standard library. Formal replay uses installed exact Lean/Mathlib pins and fresh outputs. Historical source evidence remains historical. Source-only reviews do not approve a later publication tree. Internal AI review is not external peer review and does not establish historical priority. Configured models were inherited without overrides; no independently exposed serving identity is certified.

Historical large censuses, TUZA-01–15 Lean campaigns, solver-only rainbow kernels and catalogue completeness were not replayed. No remote mathematical CI, new research campaign, cold dependency build or independent kernel implementation is claimed.
