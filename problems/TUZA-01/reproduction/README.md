# Reproducing TUZA-01

This package is independent of private research infrastructure. It reproduces the elementary **conditional** Lean proof, exact finite sanity checks, and the manuscript source. No external specialist review or full formalization of Aharoni, HNS, or density is claimed.

## Clean-checkout Lean commands

Prerequisites: Git, Bash, Python 3, and [elan](https://github.com/leanprover/elan) or an equivalent installation of the exact Lean toolchain. Install tools using their official instructions. No credentials are needed to read these public dependencies.

```sh
git clone https://github.com/pappa211/ai-math-experiments.git
cd ai-math-experiments/problems/TUZA-01/lean
elan toolchain install leanprover/lean4:v4.33.1
lake exe cache get
./build.sh
./check.sh Tuza.lean
git diff --exit-code -- lake-manifest.json lakefile.toml lean-toolchain
python3 ../reproduction/verify_inventory.py
```

Lake reads the committed manifest and fetches missing packages at the pinned public revisions. Do not run `lake update` to upgrade dependencies. `lake exe cache get` obtains official Mathlib dependency artifacts; network access and disk space for these external dependencies are needed. They are not vendored. The pinned dependencies occupy approximately 7.5 GiB in the reproduced Linux environment, including cache/source/build artifacts.

Expected compiler: Lean 4.33.1, compiler commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`. Expected Mathlib: `0df444a360eaa60ab8c11dca51a86af692955474`. Every other revision is checked against the lockfile. The verifier builds only this project's modules, sequentially, with one worker and a 120-second cap per invocation. Outputs go to `.lake/build/lib/lean` and `reproduction-output/build.log`; both are ignored. A changed dependency source, pin mismatch, failed build, prohibited proof token, missing axiom audit, or non-allowlisted axiom makes it fail.

Expected success message: `PASS: pinned dependencies, project source scan, all modules and eight axiom audits.` Exact target/type output is retained in [lean-declarations.txt](lean-declarations.txt). See [VERIFIED_RESULTS.md](VERIFIED_RESULTS.md) for actual executions, including cache reuse and what “clean” means here. This is repetition in the same Lean kernel and library ecosystem, not an independent kernel or a cold build of Mathlib from source.

## Trust boundary

Both `Tuza.triangle_deletion` and `Tuza.oct_four` have named `AharoniInput` and `HNSInput` parameters. The former is the graphical specialization of Aharoni's published 3-partite 3-uniform bound. The latter is precisely the equality consequence giving a packing of `nu` edge-disjoint graph $K_4$ copies. HNS's home-base extraction and the graph conversion are included in that external boundary. The [paper](../manuscript/README.md) gives the ordinary proof and precise source mapping.

The formalized new steps include extrema attainment and genuine-edge cover trimming, the two-edge lemma for arbitrary intersecting triangle families, independent-set face selection, simultaneous compatibility with all new triangles, complete strict/equality arithmetic, and the OCT-four coloring reduction. The project has no `sorry`, `admit`, custom `axiom`, `unsafe`, `native_decide`, or `sorryAx` shortcut. The eight audited declarations report only `propext`, `Classical.choice`, and `Quot.sound`. These standard-only reports do not discharge theorem parameters. The general Tuza conjecture and the deep published inputs are not proved unconditionally in this development. Density is not Lean-formalized.

## Exact finite checks

The standard-library Python script writes beside itself. Use a scratch copy to preserve the archived result:

```sh
cd ..
mkdir -p reproduction-output/sanity
cp experiments/sanity_checks.py reproduction-output/sanity/
python3 reproduction-output/sanity/sanity_checks.py
```

Expect `all_parameter_and_witness_assertions_passed`. The verified cases are $K_4$, $K_5$, $C_5$, the double Mycielski construction of $C_5$, and a 30-vertex graph assembled with a $K_4$, a distinguished triangle and bridges. The four-color rejection uses 884 DSATUR nodes with color symmetry reduction. Timings vary; compare substantive assertions and witnesses, not timestamp fields. This is exact ordinary Python computation, not a formal certificate of the infinite theorem.

## Manuscript and Markdown

Use a TeX distribution with LaTeX, BibTeX, Latin Modern, AMS packages, `geometry`, `microtype`, `hyperref`, and `enumitem`. Work in a scratch directory to keep generated binaries outside the archive:

```sh
mkdir -p reproduction-output/paper
cp manuscript/TuzaTriangleDeletion.tex manuscript/references.bib reproduction-output/paper/
cd reproduction-output/paper
pdflatex -interaction=nonstopmode -halt-on-error TuzaTriangleDeletion.tex
bibtex TuzaTriangleDeletion
pdflatex -interaction=nonstopmode -halt-on-error TuzaTriangleDeletion.tex
pdflatex -interaction=nonstopmode -halt-on-error TuzaTriangleDeletion.tex
```

These conventional TeX-distribution commands are an alternative recipe; the executed PDF build used user-space **Tectonic 0.15.0** with its downloaded resource bundle, followed by rendered-page inspection. The exact executed recipe and its compiler warning/workaround are recorded in [VERIFIED_RESULTS.md](VERIFIED_RESULTS.md). PDFs are private/local build outputs and are not committed or uploaded as a Release.

Regenerate the complete GitHub exposition from the canonical manuscript:

```sh
cd ../..
python3 reproduction/render_markdown.py
git diff -- manuscript/README.md
```

The renderer supports this manuscript's small LaTeX subset and should not be treated as a general converter. It expands the two math macros, resolves numbered references, preserves displayed equations and proof text, and obtains reference metadata from the `.bib` file. Review the generated Markdown after edits.
