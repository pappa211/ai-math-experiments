# TUZA-16–19 research report

[PDF](main.pdf) · [GitHub Markdown](main.md) · [Canonical manuscript](manuscript.md) · [LaTeX](main.tex) · [References](references.bib).

AI Math Experiments, 15 November 2026. Unrestricted Tuza remains unresolved.
Ordinary arguments, finite evidence and formal finite kernels have distinct scopes.
Internal AI review is not external peer review; historical priority is unestablished.

## Build

With Python 3.10+, Pandoc 3.13, Tectonic 0.17.0 and existing bundle assets:

```sh
python3 papers/tuza-16-19-research-summary/build.py --output ../tuza-report-build
```

The output must be new and outside the checkout. `--pandoc` and `--tectonic` accept explicit executable paths. Tectonic uses `--only-cached`; a cache miss is a build failure. No installation or download is attempted. Existing Latin Modern/AMS, geometry, microtype, longtable, hyperref, xurl and fvextra assets are required. `numeric.csl` is the repository's previously licensed style. SOURCE_DATE_EPOCH fixes the supported document date, without promising cross-platform byte identity.

All three derivatives come from manuscript.md and the same citation resolution. After review, copy accepted main.md/main.tex/main.pdf explicitly from the output. The builder records source/output hashes and actual tools. [PDF review and build receipt](../../verification/tuza-16-19/README.md) distinguish compilation from all-page visual review.

[Current guide](../../RESEARCH_STATUS_2026-11-15.md) · [Claim/evidence inventory](../../verification/tuza-16-19/CLAIM_EVIDENCE.md) · [Literature recheck](LITERATURE_RECHECK.md) · [Reproduction](../../REPRODUCTION.md#tuza-16-19).
