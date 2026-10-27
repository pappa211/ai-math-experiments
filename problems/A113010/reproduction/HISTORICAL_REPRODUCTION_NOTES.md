> Historical requirements only. Use [README.md](README.md) for the portable published commands. Original paths are preserved for traceability.

# Reproducing the Session 01 artifacts

The canonical operational environment is the original research workspace. The downloaded source snapshot and Git bundle preserve tracked source, notes, numerical records, and history; they do not contain the approximately11GiB installed toolchain/dependency/cache environment. They are not a self-contained binary installation.

## Existing prepared environment

From the repository root, run the existing checks serially:

```sh
scripts/verify.sh
scripts/verify-research.sh
```

The first checks frozen bytes, the exact original reference checkout/blob, nine locked dependency HEADs, smoke proofs, the negative compiler test, and the axiom allowlist. The second builds110 research modules in explicit dependency order, audits52 named results, and invokes module-only leanchecker for each listed module. Do not use --fresh for ordinary project replay. The saved complete outputs are SESSION_01_INFRASTRUCTURE_VERIFICATION.* and SESSION_01_RESEARCH_VERIFICATION_FINAL.* (with the earlier109-module run preserved separately).

## Requirements for a separate fresh environment

Use reference/PROVENANCE.md and the unchanged lockfiles. Necessary ignored installations, absent from the source archive, are:

- Lean leanprover/lean4:v4.33.1, compiler819816b2e0a3bf405af45ae5c7af2491d8f5bee6, with its bundled Lake and leanchecker.
- The original formal-conjectures Git checkout under reference/formal-conjectures, detached atf153efa8fdc078131e214547781d631e2d257daf. Its FormalConjectures/OEIS/113010.lean blob must be3e217b28b2843b492989b178b041161b0bbd6784. The tracked reference/113010.lean is an unchanged comparison copy; the original admitted theorem remains outside all working imports.
- All nine package checkouts under proof/.lake/packages at the exact revisions in proof/lake-manifest.json, including Mathlib0df444a360eaa60ab8c11dca51a86af692955474. Restore matching precompiled artifacts or build dependencies as a separate setup step. Do not update the lockfile to a newer release.

The final runtime verification reused the installed dependency cache and did not independently reconstruct that environment. A future purported solution requires its own separate clean-baseline verification; reproducing these intermediate results does not satisfy that final acceptance requirement.

## Numerical programs

The observed Linux environment used Python3.12.3, GMP6.3.0, MPFR4.2.1, and system C compilation for the small-core scan. Run commands and evidence scopes are in experiments/README.md and the corresponding resource logs. The final tail search uses128-bit outward MPFR rounding with exact GMP suffix arithmetic. The independent sample program uses CPython integers for exact exponent endpoints and modular powers. Source and imported-helper hashes are embedded in each final JSON record.

The one-million search used the archived v1 source at experiments/archive/tail_search_v1.py (run with PYTHONPATH=experiments); its hash isa47100157a65a594c8805401ba69eaa972cc1950c67d1d23c411d4fc8612857a. The completed five-million extension used current tail_search.py, hash5479577cb02d131edb35caace25138c03cd48e67101e4d47221888939caf0adc, and helper hashf313566343237927f2627bd3be6b41cf56b924e68803c48fe2d774bdae11b4f5. The sample checker hash is439cec0e7fb2b32cb635d4d7d70e52567d784bde83426a2b881094e59c6dbb98.

The finite Lean certificate generator was run in the supported stages1001..2000 and2001..10000, chunk size100. Generated witnesses are checked by Lean, not accepted on Python authority. A fresh reproduction should preserve the checked snapshot before regenerating files; changing ranges or chunk size also requires manifest changes. No whole-range regeneration was performed during the final source-only audit.

Maintain serial heavy work on the3.7GiB host and the20GiB free-space reserve. The final integrated checker peak was2,295,148KiB; elapsed time was11:10.39. The separate sharpening build peaked at2,183,316KiB. The unresolved huge normalized case is not feasible by direct expansion; see RESOURCE_AND_CERTIFICATE_LIMITS.md.
