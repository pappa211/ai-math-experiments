# Portable reproduction

Run on a Linux server with Python 3, Git, a C toolchain and the exact Lean toolchain. The publication run used one Lean thread, a 2200 MiB Lean memory cap and serial compiler/replay commands on a machine with about 3.7 GiB RAM and no swap. Downloaded dependency objects are a declared trust boundary: this is a fresh **project** rebuild, not a cold Mathlib rebuild or an independently implemented kernel check.

## Obtain sources and toolchain

```sh
git clone https://github.com/pappa211/ai-math-experiments.git
cd ai-math-experiments
TUZA06_SOURCE="$PWD/problems/TUZA-06"
python3 "$TUZA06_SOURCE/reproduction/verify_sources.py"
(cd "$TUZA06_SOURCE" && sha256sum -c SHA256SUMS)
```

Install [elan using its official instructions](https://github.com/leanprover/elan#installation), then install the selector already pinned in `lean/lean-toolchain`:

```sh
elan toolchain install leanprover/lean4:v4.33.1
```

The required compiler is Lean 4.33.1, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`. The unchanged [Lake manifest](lean/lake-manifest.json) fixes Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` and eight other package revisions. Do not run `lake update` or replace that manifest with a newer one.

## Prepare pinned compiled dependencies

Choose a new path outside the checkout for each output. The bootstrap copies the pinned project files, fetches every Git package at the **exact manifest commit**, verifies tracked-clean source trees, and optionally obtains the official Mathlib compiled cache:

```sh
TUZA06_DEPS=/path/to/new/dependency-project
python3 "$TUZA06_SOURCE/reproduction/bootstrap.py" \
  --source "$TUZA06_SOURCE/lean" --output "$TUZA06_DEPS" --cache
```

`--cache` invokes the pinned Mathlib `lake exe cache get` client; see [its pinned documentation](https://github.com/leanprover-community/mathlib4/blob/0df444a360eaa60ab8c11dca51a86af692955474/Cache/README.md). It does not request a cold dependency rebuild. Network/cache availability is required on this route; if unavailable, stop rather than silently rebuilding an unbounded dependency closure. The bootstrap checks the manifest, selector and project configuration are unchanged after setup.

Alternatively, reuse a separately verified directory containing compiled packages for precisely these nine revisions:

```sh
TUZA06_DEPS=/path/to/new/dependency-project
python3 "$TUZA06_SOURCE/reproduction/bootstrap.py" \
  --source "$TUZA06_SOURCE/lean" --output "$TUZA06_DEPS" \
  --reuse-packages /path/to/pinned/compiled/packages
```

The publication exercised this **reuse route** in a new directory and verified all pins/configuration remained unchanged. It did not test a cold network/bootstrap/cache download or rebuild Mathlib. The dependency symlink itself does not enforce filesystem write protection; source revision and tracked-clean checks enforce the stated identity boundary. Build outputs and dependency packages are not distributed.

## Fresh build, all types/axioms, exact fresh-object replay

```sh
TUZA06_RUN=/path/to/new/reproduction-project
python3 "$TUZA06_SOURCE/reproduction/reproduce_lean.py" \
  --source "$TUZA06_SOURCE/lean" --output "$TUZA06_RUN" \
  --targets Tuza06 --packages "$TUZA06_DEPS/.lake/packages" \
  --memory-mb 2200 --job-timeout 240
```

This creates new local build storage, compiles all 280 mathematical modules in topological order, prints all 618 public theorem types and transitive axiom reports, and replays every fresh local module object. Only `propext`, `Classical.choice` and `Quot.sound` are allowed. Source hashes, object hashes, pins, commands, exit statuses and complete compiler/replay output are written under the new directory's `reproduction-output/`. No development-project object is accepted as a fresh build.

For separate bounded stages, first add `--skip-replay`; then replay that run's verified fresh objects:

```sh
python3 "$TUZA06_SOURCE/reproduction/reproduce_lean.py" \
  --source "$TUZA06_RUN" --output /path/to/new/replay-evidence \
  --targets Tuza06 --packages "$TUZA06_DEPS/.lake/packages" \
  --replay-existing --replay-closure \
  --fresh-build-evidence "$TUZA06_RUN/reproduction-output/verification.json" \
  --memory-mb 2200 --job-timeout 180
```

This is the two-stage route exercised for publication. The second stage checks all fresh source/object identities against stage one before and after replay. An interrupted fresh build may be resumed in its original output directory with `--resume`, after checking the recorded failure; it accepts only matching copied source and successful objects from that same new run. `--replay-existing` without valid fresh evidence is a development pilot, never a fresh reproduction. Optional `--stop-before` and `--campaign-clock` enforce invocation-specific deadlines; no expired research clock is a public dependency.

The exact-module native adapter retains the installed LeanChecker `replayFromImports` body byte for byte and calls the same standard Lean kernel. It reads module data, including private proof constants, and replays safe nonpartial mathematical declarations. Generated constructors/recursors are checked against kernel-generated ones. Unsafe/partial compilation artifacts are outside standard replay's targets. The adapter's unsafe IO/runtime memory-cap extern is outside the mathematical import closure. See [upstream provenance](reproduction/REPLAY_DRIVER_PROVENANCE.json), [adapter diff](reproduction/ReplayExactNative.diff), [upstream source](reproduction/LeanChecker.upstream.lean) and [license](reproduction/LEAN_TOOL_LICENSE.txt). No independent kernel implementation, full dependency replay, or native proof shortcut is claimed.

## Independent finite certificates

```sh
python3 "$TUZA06_SOURCE/checks/independent_final_core.py"
python3 "$TUZA06_SOURCE/checks/independent_five_coverage.py"
python3 "$TUZA06_SOURCE/checks/independent_overlap_certificates.py"
# Optional: run all three while denying nonpublic input-file resolution.
(cd /tmp && python3 "$TUZA06_SOURCE/checks/run_public_only.py")
```

These standard-library implementations resolve only files included in the public tree. The final-core checker reads `checks/final_core_certificates.json`; no private predecessor path is used. They independently validate the fixed eight-vertex core, all 1024 five-link encodings and relevant relabeling witnesses, and the supplied overlap certificates. They do not enumerate arbitrary outside attachments or replace the symbolic arbitrary-graph proof. Their PASS reports are not premises of any Lean theorem.

The checker results alongside their scripts were regenerated from the public sources. The optional Python file-open audit was also exercised from an unrelated temporary working directory; it permitted only this public archive and the installed standard library, and observed zero nonpublic file opens. This is an audit of these trusted scripts, not an adversarial security sandbox. See [final status](PROOF_STATUS.md) and [publication evidence](reproduction/publication-evidence/README.md). Older clock-bound build helpers, private packaging/preservation helpers, failed diagnostic sources and development build objects are intentionally omitted and retired in favor of these entry points. Historical records may name them; their presence in an old private archive is not a claim that they are public inputs.
