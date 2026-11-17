> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Serial reproduction

This repository is private and has zero remotes. Reproduce in a new private copy, preserving all original TUZA workspaces and the public baseline. All commands are local to the owner's Darwin arm64 Mac; no SSH, remote worker, package updater, installer, or automatic cache fetch is required or authorized.

Source the existing pinned environment:

```sh
source PRIVATE_PATH_REMOVED
```

The installed Lean executable is `PRIVATE_PATH_REMOVED`. Its actual commit and binary hash, and the nine actual package Git revisions, are recorded in `operations/dependency_pins.json`. The package directory is a symlink to the existing native dependency package directory. Keep those objects read-only and verify their revisions against `lake-manifest.json` before use.

The accepted main import is `Research`. Semantic controls are in `Tuza24.Controls`. `operations/accepted_build_order.json` records the exact transitive local module order. In a fresh output directory, use the inspected runner rather than invoking a package manager:

```sh
python - <<'PYBUILD'
import json, subprocess
modules = json.load(open('operations/accepted_build_order.json'))
subprocess.run(['python', 'scripts/build_serial.py', '--out',
                'reproduction-output/lib/lean', '--label', 'reproduction',
                *modules], check=True)
PYBUILD
```

The runner invokes Lean directly with `-j1 -M2200`, holds the exclusive `operations/build.lock`, applies a 240-second external per-module timeout and monitors the full process tree against 2200 MiB RSS. It builds `LEAN_PATH` using only the selected fresh local output directory and the pinned existing package objects. It does not use unchecked development objects or trigger Lake's parallel build scheduler. Split or diagnose failures before changing resource limits; a timeout is not a mathematical counterexample.

The original mission deadline is deliberately retained in both monitored tools. A later separately authorized reproduction must adapt that expired deadline ONLY IN ITS NEW PRIVATE COPY and record the adapted runner hash. The accepted mathematical sources, compiler and package pins must remain unchanged. Do not reset the frozen mission clock or modify the checkpoint to make a later run appear contemporaneous.

For independent source copying, rebuilding, and the full environment-based declaration audit, the final reviewer used:

```sh
python - <<'PYAUDIT'
import json, subprocess
cmd = ['python', 'review/independent_verify.py', 'Research', 'Tuza24.Controls']
for target in json.load(open('operations/audit_targets.json')):
    cmd.extend(['--target', target])
subprocess.run(cmd, check=True)
PYAUDIT
```

The verifier copies every local import into a new directory, rebuilds it there, and enumerates actual Lean environment constants by owning module, including private/generated declarations. It records complete types, direct proof/type references, collected axioms, source hashes and individual build receipts. A source scan rejects forbidden admission or native-trust constructs; the actual axiom/type audit is stronger than that scan. Target closures and controls must be read with the independent semantic review; a clean build alone is not a scope claim.

Only `propext`, `Classical.choice`, and `Quot.sound` may occur as collected axioms. Existing native Lean, mathlib and dependency artifacts remain the disclosed trust boundary: there is no claim of a cold dependency rebuild or a second independent kernel implementation. The final receipt index and `AXIOM_AUDIT.md` identify the actual successful clean run and measured resource use.
