# TUZA-11-15 Research Summary

[PDF](main.pdf) - [GitHub Markdown](main.md) - [Canonical editable source](manuscript.md) -
[Generated LaTeX](main.tex) - [Bibliography](references.bib).

AI Math Experiments, 3 November 2026. AI-developed ordinary/computer-assisted
research with internal AI verification; no external human peer review or
historical novelty certification. General Tuza/equality and S/E remain open.

## Build from the canonical source

`manuscript.md` is canonical; `main.md`, `main.tex` and `main.pdf` are generated.
Use existing Python 3.10+, Pandoc 3.13 and Tectonic 0.17.0:

```sh
python3 papers/tuza-11-15-research-summary/build.py --output ../tuza-summary-build
```

The directory must be new and outside the checkout. `--pandoc` and `--tectonic`
accept explicit executable paths. Tectonic is invoked with `--only-cached`:
its TeX Live/typesetting bundle assets (Latin Modern, AMS, geometry, microtype,
longtable, hyperref, xurl, fvextra and their dependencies) must already be in the
normal existing cache. No installation or download is attempted. A cache miss
is a real build failure, not a silently skipped PDF. `numeric.csl` is included.

The builder writes all derivatives, compilation log and `BUILD.json` into the
fresh output directory and leaves this directory and unrelated papers unchanged.
To update the checked-in derivatives after review, copy the generated `main.md`,
`main.tex`, `main.pdf` from that output directory explicitly. Fixed
`SOURCE_DATE_EPOCH=1793664000` stabilizes supported PDF dates; exact bytes can
still depend on the tool/cache edition. Content, source hashes and actual tools
are recorded rather than promising cross-platform bit identity.

GitHub math and bibliography are resolved by Pandoc from the same manuscript.
PDF hyperlinks are rewritten to stable public repository targets. Final all-page
visual review, extracted-text/quantifier parity, metadata/URL checks and the
independent publication review are recorded in
[publication verification](../../verification/tuza-11-15/README.md).

## Read the full evidence

[Ordinary-proof ledger](../../ORDINARY_PROOF_INDEX.md),
[dependencies](../../verification/tuza-11-15/DEPENDENCIES.md),
[source transformations](../../problems/TUZA-11-15-SOURCE_MANIFEST.json),
[current status](../../RESEARCH_STATUS_2026-11-03.md),
[reproduction](../../REPRODUCTION.md#tuza-1115-ordinary-proofs-and-exact-finite-checks).
