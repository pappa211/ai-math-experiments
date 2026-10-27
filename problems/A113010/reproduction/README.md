# Reproducing the published archive

Run the commands below from `problems/A113010/`. They require no connection to the original research environment. Historical notes use the old `proof/`, `notes/`, and `scripts/` paths; the [manifest](PUBLICATION_MANIFEST.md) maps those paths to this layout.

## Exact versions and source-only checks

- Lean: `leanprover/lean4:v4.33.1`, compiler commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`.
- Mathlib: `v4.33.1`, commit `0df444a360eaa60ab8c11dca51a86af692955474`.
- All nine package revisions are pinned in `../lean/lake-manifest.json` relative to this document. Do not run `lake update` or substitute newer dependencies.
- Python 3.12 or later for the published scripts; Bash and Git for verification.

```sh
python3 reproduction/scripts/verify_freeze.py --source-only
```

This checks the exact upstream challenge Git blob, all eight frozen hashes, the unchanged definition and targets, all 116 working Lean source hashes, and the working lockfile against its retained upstream copy. The public checker maps historical `proof/` paths to `lean/`. Source-only mode explicitly skips installed dependency checks.

## Prepare a separate Lean environment

Install [elan using the official Lean instructions](https://lean-lang.org/lean4/doc/quickstart.html) if it is not already available. The archive does not redistribute installers or compiler binaries. With elan on `PATH`:

```sh
elan toolchain install leanprover/lean4:v4.33.1
export LEAN_NUM_THREADS=1
export MATHLIB_CACHE_DIR="$PWD/reproduction-output/mathlib-cache"
mkdir -p "$MATHLIB_CACHE_DIR"
(cd lean && lake exe cache get)
python3 reproduction/scripts/verify_freeze.py
```

Lake uses the committed manifest to fetch the locked packages. The cache command obtains official precompiled dependency artifacts; it is not a source rebuild of Mathlib. The full checker verifies all nine installed revisions and rejects tracked dependency modifications. The original full Formal Conjectures checkout is not required: the retained challenge's Git blob is checked directly and is outside the working import graph.

Allow roughly 11 GiB for a Lean/dependency installation, additional workspace space, and at least 20 GiB of remaining free space for the verification scripts' guard. The historical largest checker used approximately 2.2 GiB resident memory; a machine with at least 4 GiB RAM and serial execution is advisable. No parallel heavy experiments are needed.

## Formal intermediate-result verification

```sh
bash reproduction/scripts/verify.sh
bash reproduction/scripts/verify-research.sh
```

The first runs source/pin checks, compiles the base library and smoke examples, audits their axioms, and checks that an intentionally false equality is rejected before a corrected example succeeds. Its expected negative-test compiler error is not a failed verification.

The second builds the same 110 research modules in explicit serial order, audits 52 named declarations, and performs module-only `leanchecker` replay for each module. It does not prove either original target. The allowlist is exactly `propext`, `Classical.choice`, and `Quot.sound`; missing reports, `sorryAx`, or other reported axioms fail the audit. Do not add `--fresh` to the module-only replay command: that is a different verification scope.

The wrapper paths and source-checker plumbing were adapted for publication. All `.lean` files, proof terms, frozen statements, toolchain pin, and dependency lockfiles are byte-identical to the completed source archive. [lean-source-sha256.json](lean-source-sha256.json) and the publication manifest record this.

## Publication reproduction result

**PASS, 2026-10-27:** all 110 research builds, 52 named axiom audits, and 110 module-only replays completed in the isolated environment. Setup plus verification took 18 minutes 11.14 seconds, with peak resident memory 2260468 KiB. All 97 regenerated certificate files and the Session 02 diagnostic JSON also matched exactly. See [PUBLICATION_TEST_RESULTS.json](PUBLICATION_TEST_RESULTS.json) for the complete checks and their scope. The test uses a newly created isolated project with no project build outputs, fresh locked package checkouts, and an isolated download cache. It reuses an already installed pinned Lean compiler and obtains official precompiled Mathlib dependencies. It is a clean **project** reproduction, not an independently rebuilt compiler, a source-only rebuild of every dependency, or external-kernel verification.

No complete A113010 solution exists in this archive. The retained `verify-final.sh MODULE THEOREM existence|nonexistence` is only a future exact-target and axiom gate; it does not replace a separate independent verification or novelty review.

## Experiments and certificate regeneration

Use [the experiment guide](../experiments/README.md). The small Session 02 diagnostics are pure Python. Larger numerical programs use the historical Linux shared-library interfaces for GMP 6 and MPFR 4. Their exact assumptions and coverage are in the preserved JSON outputs.

The publication audit regenerated all 97 files produced by the three commands below and matched every file byte-for-byte against the preserved sources. The bounded certificates are already readable Lean source, so regenerating them is unnecessary for proof checking. For a reproduction comparison, write generated files to a separate scratch folder, never over the preserved sources:

```sh
mkdir -p reproduction-output/certificates
python3 experiments/generate_finite_lean.py --max-digits 1000 \
  --output reproduction-output/certificates/Finite.lean
python3 experiments/generate_suffix_finite_lean.py --first 1001 --last 2000 \
  --chunk-size 100 --output-dir reproduction-output/certificates
python3 experiments/generate_suffix_finite_lean.py --first 2001 --last 10000 \
  --chunk-size 100 --output-dir reproduction-output/certificates
```

These are the supported historical stages. The generators propose witnesses; Lean checks the inequalities and digit arithmetic with ordinary `decide`, not `native_decide`. Arbitrary ranges require different aggregate manifests. Publication-test results state which regeneration checks actually ran; commands alone are not evidence of execution.

## Evidence and exclusions

Historical source fingerprints, dependency audits, structured build/axiom extracts, numerical results, and resource summaries are retained. The historical raw output is not an independent verifier, and reconstructed summaries are explicitly labelled as extracts. Installed caches, compiler binaries, application state, private history, and binary backups are excluded. No substantive mathematical source or result was excluded for size. See [PUBLICATION_MANIFEST.md](PUBLICATION_MANIFEST.md) for individual dispositions and excluded artifact classes.
