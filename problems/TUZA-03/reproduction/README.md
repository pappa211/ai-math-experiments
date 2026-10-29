# Reproduction

## Lean proof package

Use Lean 4.33.1 with the exact compiler and dependency revisions in `../lean/lean-toolchain` and `../lean/lake-manifest.json`. The Mathlib revision is `0df444a360eaa60ab8c11dca51a86af692955474`. Put `lean` and `lake` on PATH. Obtain the pinned dependencies through ordinary Lake/Mathlib tooling, or reuse an existing trusted dependency directory matching every manifest revision. The script checks compiler identity, every dependency Git revision, and clean tracked dependency sources before compiling. It never fetches, modifies, or rebuilds dependencies.

From this TUZA-03 directory, choose a **new**, absent output directory and the directory containing the pinned dependency package directories:

```sh
python3 reproduction/reproduce_lean.py   --source lean   --output ./reproduction-run   --packages /path/to/pinned/packages   --kernel-replay
```

Run only one reproduction process at a time on a small machine. Every project compile uses one worker. Kernel replay invokes one module at a time; the imports-only root is skipped to avoid prefix fanout. The output must not already exist. The script creates its project and logs there, preserving the distributed source tree. It also generates the complete `Verification.lean` declaration/axiom audit.

Success requires exit status zero and `reproduction-run/reproduction-output/verification.json` reporting PASS. Exact checked types and transitive axioms are in `declarations-and-axioms.txt`. The checked release evidence supplied here is in [verification.json](verification.json), [declaration output](declarations-and-axioms.txt), and [build log](build.log). Absolute execution paths in the supplied evidence are replaced by neutral placeholders.

This reproduces all project modules using pinned compiled dependencies. It is not a full cold Mathlib rebuild. Leanchecker replays module declarations through Lean's kernel against imported dependencies; it is not an external independent verifier. The explicit Aharoni, frozen graphical HNS, and classical König hypotheses listed in the Lean report remain assumed.

## Selected mathematical certificates

These are finite certificate checks, not a proof by exhaustive search over arbitrary graphs:

```sh
python3 ../TUZA-02/experiments/independent_certificates.py
python3 experiments/checks/verify_certificates.py
python3 experiments/check_bowtie_witnesses.py
```

The first independently enumerates named star and family-definition examples. The second regenerates complete graph triangle families, replays all take/skip packing branches and edge-choice cover branches in 35 selected recurrence certificates, and checks prior named constructions. The third checks 70 local packing/cover witness configurations in the bowtie proof. None imports the research search solver. They write result JSON files beside their checkers; run from a copy if preserving every distribution byte is desired.

The original broad searches are not rerun or claimed exhaustive by this package. Source, generated-result, and publication hashes are recorded in the provenance manifest. No third-party PDFs, raw HTML, compiled caches, Git history, credentials, or private execution metadata are distributed.
