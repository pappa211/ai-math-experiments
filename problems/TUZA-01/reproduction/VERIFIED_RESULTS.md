# Executed publication checks

Checks were performed on 28 October 2026 UTC. This records actual scope, not an independent proof kernel or external mathematical review.

## Lean

An isolated Linux publication project was created from the portable public source package, with **no prior TUZA project build outputs**. A separate copy of the existing pinned dependency source/artifact cache was supplied; the canonical research/validation projects and original cache were not edited. Every dependency Git revision and tracked source state was checked. `lake exe cache get` exited **0**, identifying the official Mathlib cache, reporting no files to download and 8,690 already decompressed files.

Executed from that isolated project's `lean/` directory:

```sh
./build.sh
./check.sh Tuza.lean
lake exe cache get
```

All three commands exited **0**. The first compiles all seven modules and the root file sequentially, with one worker and 120-second invocation timeouts. The first transfer initially included macOS metadata sidecars; these were removed from the isolated directory before the successful clean build. No mathematical source change was needed.

Pins verified:

- Lean **4.33.1**, Linux x86_64, compiler commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`.
- Mathlib **v4.33.1**, revision `0df444a360eaa60ab8c11dca51a86af692955474`.
- All **nine** package Git revisions exactly match `lake-manifest.json`; tracked dependency sources were clean.

The declaration/type output is retained in [lean-declarations.txt](lean-declarations.txt). Eight axiom reports were checked: the two main declarations, `graph_min_cover`, and five sanity declarations. Each reports only `propext`, `Classical.choice`, and `Quot.sound`. Source scanning found no `sorry`, `admit`, custom `axiom`, `unsafe`, `native_decide`, or `sorryAx` in the eight Lean files. A semantic audit found no false-instance assumption or weakened target.

**External mathematical obligations:** `AharoniInput` and `HNSInput` are explicit hypotheses of both main theorems. The latter includes the ordinary HNS extraction and loose-cycle-to-graph-$K_4$ conversion. No full formalization or Lean discharge of either input occurred. Density is not Lean-formalized. This clean project build reused compiled dependency artifacts; it was not a cold build of Lean or Mathlib from source, nor a separate implementation of the kernel. The portable wrappers were syntax-checked on macOS, but this mission does not claim a native macOS Lean compilation.

## Finite checks

`python3 sanity_checks.py`, executed on a scratch copy, exited **0** with `all_parameter_and_witness_assertions_passed`. The new output's substantive assertions, graph constructions, exact parameters, and label/color witnesses equal Validation V1 after ignoring timestamps and elapsed-time fields. The saved public JSON is the fresh output. The four-color DSATUR rejection used 884 nodes. The checks took less than one second in this run; timings are not mathematical evidence. No broad enumeration was repeated.

## Manuscript PDF and Markdown

A private eight-page PDF was compiled with user-space **Tectonic 0.15.0** and its downloaded standard TeX resources. The final executed command, from a scratch copy containing the canonical `.tex` and `.bib`, was:

```sh
tectonic --reruns 2 --keep-logs --keep-intermediates TuzaTriangleDeletion.tex
```

Exit code: **0**. It ran TeX, BibTeX, two requested TeX reruns, and xdvipdfmx. The final engine log has no missing-glyph, undefined-reference/citation, overfull, or underfull warning. Tectonic's initial automatic-rerun mode issued a bibliography change-bookkeeping warning despite populated references; fixed reruns produced the final PDF without that warning. No source theorem was weakened to obtain compilation.

All eight rendered pages were visually inspected, including display equations and bibliography. Text extraction found no replacement characters, unfilled citation markers, or missing bibliography items. The Markdown rendering was regenerated from the canonical TeX/BibTeX and independently compared for mathematical fidelity. Display blocks have no internal blank lines. The generated PDF, page images, build logs and Tectonic executable remain private build artifacts.

## Review and integrity

The independent [mathematical review](../research-notes/MANUSCRIPT_REVIEW.md) found no mathematical publication blocker. The [publication/reproduction review](../research-notes/PUBLICATION_REVIEW.md), source hashes and staged-tree checks cover the public package. The original Phase 1 and Validation V1 archives, and both private/public A113010 archives, were checked for preservation. Public `CONTRIBUTING.md` and `LICENSE` were not changed. See the [manifest](PUBLICATION_MANIFEST.md) for scope and exclusions.
