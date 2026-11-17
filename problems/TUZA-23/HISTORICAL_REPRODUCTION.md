> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Reproduction of the private TUZA-23 library

## Environment and trust boundary

Run on the owner's Mac under `~/math-research`, using the existing environment:

```sh
source PRIVATE_PATH_REMOVED
```

Lean is 4.33.1, compiler `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`. Mathlib is `0df444a360eaa60ab8c11dca51a86af692955474`; all nine pinned manifest package revisions are recorded in `operations/dependency_pins.json`. The root package name was adapted by the existing initializer; dependency revisions were preserved. No installation, `lake update`, upgrade, automatic cache download, or historical source-build write is authorized by these commands.

The native compiler and pinned dependency objects are reused. A clean mission-source rebuild is not a cold compiler/mathlib rebuild or an independent kernel implementation. The imported local Tuza/Tuza06 modules are copied and rebuilt from authenticated public sources, not accepted solely as old objects.

## Serial compilation

The installed Lake help has no assumed `-j` build-job option. `scripts/build_serial.py` runs the actual Lean compiler one module at a time, uses `-j1 -M2200`, an exclusive flock build slot, a 240-second external limit per module, and a sampled process-tree RSS ceiling of 2,200 MiB. It builds no dependency source and downloads nothing. Every invocation records the exact command, LEAN_PATH, source hash, output, exit status, elapsed time and peak sampled RSS.

For a future reproduction, make a new private copy and keep the frozen checkpoint unchanged. Link `.lake/packages` to the same read-only native dependency package directory. Build the copied modules in the order recorded in the final accepted build-order receipt. Use a new output directory, for example:

```sh
python scripts/build_serial.py --out .lake/reproduction/lib/lean --label reproduction MODULES_IN_RECORDED_ORDER
```

Replace `MODULES_IN_RECORDED_ORDER` with the literal names in the accepted build-order receipt, not with arbitrary wildcard order. The runner's current mission deadline is intentionally hard-coded to prevent accidental continuation: future authorized reproduction must make a separately documented adapter for its new deadline in a NEW copy. Do not change this campaign's stored clock.

`Research.lean` imports R2 and M0. Controls are a separately checked accepted module. Negative API fixtures under `exploratory/` are deliberately excluded; their expected failure is not a successful library build or a mathematical independence proof.

## Acceptance evidence

The independent clean-build report and machine-readable per-declaration audit identify the final source snapshot, build order, exact theorem types and actual `#print axioms` results. Compilation alone is insufficient. Check both source scans and dependency closures for `sorryAx`, project-defined unproved axioms, native proof trust, and unsafe escape mechanisms. The permitted standard axioms are `propext`, `Classical.choice`, and `Quot.sound`; these must be reported when present.

The semantic controls cover actual finite graph encodings, optimizer parameters, edge-disjoint packings sharing vertices, actual components sharing vertices, malformed cover/shared-edge packing rejection, and representative insertions. They test the interpretation, not the unbounded quantifiers of R2; the symbolic proof supplies those quantifiers.

Exact final receipt paths and outcomes are consolidated in AXIOM_AUDIT.md, INDEPENDENT_REVIEW.md, THEOREM_LEDGER.json and FINAL_RECEIPT.md. These files must be read together; exploratory failures remain preserved as development history.

## Final accepted receipt paths

The build order is `operations/accepted_build_order.json`. The independently reconstructed clean workspace is `verification/independent-20261116T092129409939Z/clean/`. `commands.json` preserves each literal compiler command; `summary.json` is PASS; `declarations.json` holds exact types and axioms; `negative_guard.json` records the expected missing-B API rejection. No accepted mathematical source changed after that verification.

After adapting only the execution deadline in a separately authorized future copy, this command reads the recorded order directly:

```sh
python -c 'import json,subprocess; subprocess.run(["python","scripts/build_serial.py","--out",".lake/reproduction/lib/lean","--label","reproduction",*json.load(open("operations/accepted_build_order.json"))],check=True)'
```
