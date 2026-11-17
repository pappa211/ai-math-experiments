# Structural Results, Reductions, and Obstructions for Tuza’s Triangle Packing–Covering Conjecture

A 398-page synthesis of TUZA-1–26, including TUZA-14B, by **AI Math Experiments**, dated17 November2026. The programme is paused; unrestricted Tuza and universal CS remain unresolved. This is an AI-developed research report with internal AI review, not external human specialist peer review or a certification of historical novelty.

- [Readable paper](main.md) · [PDF](main.pdf)
- [Canonical manuscript](manuscript.md) · [Editable LaTeX](main.tex) · [Bibliography](references.bib)
- [Claim/evidence index](CLAIM_LEDGER.md) · [Exact JSON ledger](CLAIM_LEDGER.json) · [Formal correspondence](FORMAL_CORRESPONDENCE.json)
- [Mission inventory](MISSION_INVENTORY.json) · [Proof provenance](PROOF_PROVENANCE.json)
- [Primary-source attribution review](ATTRIBUTION_REVIEW.md) · [First mathematical/editorial review](REVIEW_ROUND1.md) · [Detailed proof review](REVIEW_ROUND2.md) · [Final mathematical review](MATHEMATICAL_REVIEW.md) · [Layout review](LAYOUT_REVIEW.md)

The main text is organized by mathematical dependence. Appendices A–G contain the mission record; extended project proofs and literal witnesses; formal correspondence; computational domains; barrier map; notation/dependencies/provenance/attribution; and reproduction/publication record. The ledger includes historical, refuted, unresolved and reference-only claims; it is not a count of newly proved theorems.

The immutable source archive is [commit e04d2b5](https://github.com/pappa211/ai-math-experiments/tree/e04d2b5d3a9eeb6f01f3724acc30607f7274bd62), published in [PR10](https://github.com/pappa211/ai-math-experiments/pull/10). The synthesis explicitly [clarifies the four-branch endpoint](../../verification/tuza-1-26/FOUR_BRANCH_SCOPE_CORRECTION.md): the final ordinary proof excludes such a closed link in a minimum-CS failure. The earlier universal WKE theorem and its constructive signed-defect survivor route retain the5375 finite witnesses. Mathematical proof sources are unchanged by that summary clarification.

## Build

`manuscript.md` is authoritative. `build.py` converts it, with a shared citation pass and presentation-only filter, to `main.md` and `main.tex`, then uses cache-only Tectonic for `main.pdf`. Do not edit generated files independently.

Use the established pinned Pandoc3.13 and Tectonic0.17.0 with populated bundle assets and the existing macOS Menlo font (`/System/Library/Fonts/Menlo.ttc`). Its hash is recorded in `BUILD.json`; Greek and mathematical relations in literal displays are preserved. The paper build is tested in the pinned Mac environment, not asserted platform-independent. From the repository root:

```sh
python3 papers/tuza-1-26-synthesis/build.py --output ../tuza-1-26-paper-build
```

The output directory must be new and outside the checkout. No compiler/dependency installation or network acquisition is attempted. The existing SVG graph is retained with its vector PDF rendering as a typesetting asset. The optional `render_figure.py` regeneration script uses PyMuPDF and reads all23 labelled edges directly, preserving dash patterns; normal builds use the supplied PDF. `BUILD.json` records source, bibliography, style, filter, build-script and artifact hashes. PDF/Markdown parity refers to the shared canonical manuscript and citations; typography differs by output format.

Formal and finite research reproduction uses [the repository guide](../../REPRODUCTION.md) and [the archive verification record](../../verification/tuza-20-26/README.md). Cached pinned-dependency source compilation, finite checks, ordinary review and inherited evidence are explicitly distinguished. No new exploration or formalization campaign is part of this release.

The repository’s existing authorship, AI contribution disclosure and license apply. Earlier papers and stable links remain intact. No TUZA-27 mathematics is included.
