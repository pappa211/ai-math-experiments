# Research archive reproduction

<a id="tuza-1115-ordinary-proofs-and-exact-finite-checks"></a>

## TUZA-11-15 ordinary proofs and exact finite checks

```sh
python3 tools/check_tuza_11_15.py --output ../tuza-11-15-replay
python3 tools/check_tuza_11_15.py --only TUZA-15 --output ../tuza-15-replay
```

Use Python 3.10+ with assertions enabled; output directories must be new and
outside the checkout. The default serial suite is standard-library-only and
writes only into its output copies. It checks the exhaustive TUZA-15 six-link
classification and 12 diagnostics, fixed cores/footprints, 106 mathematical
witness checks, TWIN/Fano scope diagnostics, and selected exact TUZA-11-14B
witness/root/exchange/fractional/cut interfaces. It does not run a large
historical census, external solver, Lean build or Liu RUP replay.

Read the [full ordinary-proof ledger](ORDINARY_PROOF_INDEX.md),
[publication evidence](verification/tuza-11-15/README.md), and source-specific
[11](problems/TUZA-11/REPRODUCTION.md), [12](problems/TUZA-12/REPRODUCTION.md),
[13](problems/TUZA-13/REPRODUCTION.md), [14](problems/TUZA-14/REPRODUCTION.md),
[14B](problems/TUZA-14B/REPRODUCTION.md), [15](problems/TUZA-15/REPRODUCTION.md)
guides. The optional TUZA-13 literal-corpus ratio recount uses no optimization;
its guide explains the retained historical data and UNKNOWN cases. Optional
TUZA-15 generation needs NetworkX 3.7; verification does not.

Build the new report with existing Pandoc 3.13, Tectonic 0.17.0 and an already
populated bundle cache:

```sh
python3 papers/tuza-11-15-research-summary/build.py --output ../tuza-summary-build
```

The builder is cache-only, installs nothing and leaves source files and
unrelated papers unchanged. [Detailed build guide](papers/tuza-11-15-research-summary/README.md).

Current root integrity checks, from the repository root:

```sh
shasum -a 256 -c FILES.sha256
shasum -a 256 -c RELEASE_FILES.sha256
```

FILES excludes itself. RELEASE_FILES contains this publication's added/modified
files, excludes both inventories, and includes RELEASE_MANIFEST. The manifest
does not hash the inventories or itself; there is no hash cycle. Historical
root inventories are [preserved at their pinned edition](verification/tuza-07-10/release-at-e93e3c8/README.md).
They do not verify updated README/status bytes. No new Lean declaration or
formal-kernel verification follows from these Python checks.

<a id="tuza-0710-reproduction"></a>

## Historical TUZA-07-10 reproduction


**AI-developed mathematical research report — AI Math Experiments**

Run from this repository root. These instructions concern only the new archives;
earlier published reproduction instructions remain unchanged.

## Exact native Lean checks

Requirements: Python 3.12 or later, exact Lean **4.33.1**, compiler
`819816b2e0a3bf405af45ae5c7af2491d8f5bee6`, native `lean` and `leanc` in one
toolchain, a C compiler, and native compiled dependencies at all nine exact revisions
in each `lean/lake-manifest.json`. Mathlib is
`0df444a360eaa60ab8c11dca51a86af692955474`. Obtain matching native dependencies
through the ordinary pinned Lake/Mathlib workflow before these offline checks.
Do not run `lake update`. No cache or compiled object is included in this archive.

Set `TUZA_LEAN_SYSROOT` to the exact toolchain root, and `TUZA_PACKAGES` to the
pinned native `.lake/packages` directory. Choose a new output path for each run
and a future absolute UTC deadline of your choosing. For example, after replacing
the three values below with your own locations and an explicit deadline:

```bash
export TUZA_LEAN_SYSROOT=/path/to/lean-4.33.1
export TUZA_PACKAGES=/path/to/pinned/.lake/packages
export TUZA_VERIFY_DEADLINE=YYYY-MM-DDTHH:MM:SSZ
python3 tools/verify_tuza_extensions.py problems/TUZA-07/b1b2 --sysroot "$TUZA_LEAN_SYSROOT" --packages "$TUZA_PACKAGES" --output /tmp/tuza-b1b2-fresh --deadline-utc "$TUZA_VERIFY_DEADLINE"
python3 tools/verify_tuza_extensions.py problems/TUZA-07/a1 --sysroot "$TUZA_LEAN_SYSROOT" --packages "$TUZA_PACKAGES" --output /tmp/tuza-a1-fresh --deadline-utc "$TUZA_VERIFY_DEADLINE"
python3 tools/verify_tuza_extensions.py problems/TUZA-08 --sysroot "$TUZA_LEAN_SYSROOT" --packages "$TUZA_PACKAGES" --output /tmp/tuza-cover-switch-fresh --deadline-utc "$TUZA_VERIFY_DEADLINE"
```

The three projects are independent closures; **no merged build** is asserted.
Use the explicit Python verifier rather than the historical `lakefile.toml` default
targets, which may name a larger archived development. The verifier builds every
copied mathematical closure source in import order with `-j1 -M2200` and a
240-second cap per command, prints the literal types and transitive axiom lists
of all inventoried declarations, builds the unchanged published TUZA-06 native
replay driver, and replays each fresh module. Source and object hashes must remain
stable. It refuses existing output paths and writes receipts for failed commands
as well as successful ones. The exact selected package revisions and tracked-clean
states are checked; dependency trees are not written. Run the three commands serially.

Acceptance receipts in [verification](verification/tuza-07-10/) report actual fresh
candidate checks: **25/12/11 modules**, **67/46/192 declarations**, and one standard
kernel replay per module. The axiom allowlist is `propext`, `Classical.choice`,
`Quot.sound`; no admitted proof, custom axiom or `native_decide` occurs in the
mathematical sources. The replay tool uses unsafe IO outside the mathematical
closure and retains the licensing already published under TUZA-06.

Trust limits: the exact-version compiler and compiled dependency objects are
reused. This is a fresh project-source build, not a cold Mathlib/compiler build,
full dependency replay or independent-kernel implementation. The verifier checks
dependency Git source identities, not independent derivation of every cache object.

## Independent fixed finite examples

```bash
python3 tools/check_tuza_examples.py --output /tmp/tuza-examples.json --max-seconds 120
```

This standard-library checker was written independently of the discovery solvers.
It checks only the named W7/W8 base and deletion graphs, K5/K6 nonsplittable
multicovers, Petersen colors and forced-one-third identity, the two C5 cones,
and Petersen cone. Integer subsets and exact rational primal/dual certificates
supply the bounds. Read the precise domains and counts in
[FINITE_EXAMPLES.json](verification/tuza-07-10/FINITE_EXAMPLES.json).
No random census, universal rounding theorem, general R proof or new Lean result
for TUZA-09/10 follows. Archived sampled results are marked historical, not freshly
reproduced. The published CKSU algorithm itself was not implemented/replayed here;
the K6 association is a source-definition trace.

## Paper

Install/select Pandoc **3.13** and Tectonic **0.17.0**, with an available typesetting
bundle cache. The native tools and cache are not distributed. Then:

```bash
python3 papers/tuza-further-investigations/build.py --output /tmp/tuza-paper-fresh
```

Optional `--pandoc` and `--tectonic` select executable paths. The build derives
`main.md` and `main.tex` from `manuscript.md`, `references.bib` and `numeric.csl`,
then compiles `main.pdf`; it writes build receipts to the new output directory.
This is a source-authoring command that updates only those three paper outputs.
The delivered PDF metadata names AI Math Experiments. Compilation, text/parity
checks and visual page review are recorded separately. PDF timestamps/IDs may
differ on rebuild; source hashes and rendered contents are the intended comparison.

## Integrity and licensing

`shasum -a 256 -c RELEASE_FILES.sha256` checks the TUZA-07–10 release inventory.
The release inventory intentionally excludes itself and the root `FILES.sha256`.
The root inventory is refreshed for the complete candidate tree and excludes only
itself; both inventories retain the exact unchanged earlier mathematical sources. [PUBLIC_SOURCE_MANIFEST](problems/TUZA-07-10-PUBLIC_SOURCE_MANIFEST.json)
maps copied source identities and curated transformations. No private Git history,
native binary, dependency cache, full third-party article or operational handoff is
included. See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## Publication edition, 1 November 2026

The [publication-specific receipts](verification/tuza-07-10/publication-20261101/README.md)
record the corrected editorial PDF, complete page/parity/link review, new exact
example run and independent publication critic. Adjacent preparation receipts
continue to identify the original accepted source build/replays; they are reused
without claiming a new Lean run. The paper builder checks every local link target
and uses stable public GitHub URLs in the PDF; Markdown keeps its relative links.
The root inventory identifies the current publication artifacts. Mathematical
sources, theorem types, ordinary proofs and the exact source mapping are unchanged.
