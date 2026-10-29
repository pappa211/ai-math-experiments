# Independent clean A+D Lean reproduction

Performed by the independent adversarial/statement-fidelity reviewer, separately from the theorem implementers. All actions occurred on the research server. Original TUZA campaign archives and shared dependency sources were not modified.

## Result

**PASS**, completed 2026-10-29 at 09:50:17 UTC. The successful clean run took 127.513 seconds and executed 47 recorded commands, all with exit code zero. It rebuilt 13 substantive modules plus the imports-only root, checked 105 theorem declaration types and transitive-axiom reports, and ran the installed Lean kernel checker sequentially on all 13 substantive modules.

The independently frozen input contained seven unchanged TUZA-01 modules and six new modules: Equality, TwoTriangle, IntersectingStructure, BowtieEquality, Boundary, and BoundaryIntegral. It excluded the then-developing Essential modules. This successful reproduction therefore covers full exact-equality restoration A and full closed-boundary results D, including their supporting deductions; it does **not** by itself reproduce the later complete essential-edge restoration B.

## Snapshot and integrity

Created a new `clean-input-ad/` directory with sources and pins only. The seven baseline module files and `lean-toolchain`, `lake-manifest.json`, and `lakefile.toml` were compared byte-for-byte with the frozen published TUZA-01 snapshot. All matched. The six new module files were copied from the reviewed implementation and hash-compared. A new imports-only `Tuza.lean` imports exactly this A+D module set.

`provenance/CLEAN_INPUT_AD.json` records 17 input-file hashes and the original reproduction-script hash. After successful reproduction, every source/pin file in both the input snapshot and new output was checked against that manifest; there were no mismatches. No preexisting project .olean or .ilean was copied.

The corrected reproduction script used in the successful run has SHA256:

    0c31bcbb96c5b8daa70d96d0c6f39f4024a2d3369d8f7e259c5a72805d560089

The successful machine-readable verification record has SHA256:

    765fe3751b64418af4f4dbbf18b14e7daed0588d9b7d5cfb04415cebee415311

## Exact execution

Working directory: `<verification-workspace>/`.

First attempt:

```sh
PATH=<research-path> timeout 1200 flock provenance/compute.lock \
  python3 scripts/reproduce_lean.py \
  --source clean-input-ad \
  --output clean-reproduction-ad \
  --packages <dependency-cache> \
  --kernel-replay
```

Successful second attempt, after the narrowly scoped parser fix described below:

```sh
PATH=<research-path> timeout 1200 flock provenance/compute.lock \
  python3 scripts/reproduce_lean.py \
  --source clean-input-ad \
  --output clean-reproduction-ad-2 \
  --packages <dependency-cache> \
  --kernel-replay
```

The script refuses an existing output directory. It creates a fresh project, links the existing dependency-package directory, checks compiler and dependency pins, scans source tokens, builds modules in dependency order with `lake env lean -j 1 -o ...`, generates and compiles `Verification.lean` containing all theorem checks and axiom queries, and runs `lake env leanchecker -v Tuza.Module` one module at a time. The outer flock serializes the entire run. No dependency build, Git mutation, network fetch, or cache duplication is requested.

## Compiler and dependency revisions

Compiler:

    Lean 4.33.1, x86_64-unknown-linux-gnu
    compiler commit 819816b2e0a3bf405af45ae5c7af2491d8f5bee6

All nine dependency HEAD revisions matched the frozen manifest, and all tracked source trees were clean:

| Dependency | Revision |
|---|---|
| mathlib | 0df444a360eaa60ab8c11dca51a86af692955474 |
| plausible | b7eb3304aeae834b12dda98993a37f6a41f6f0bb |
| LeanSearchClient | 5f4d51b81cbd3f6b32b156bfad9056621a040404 |
| importGraph | 16f02aa7642864af59f1ff0e384a015994db9118 |
| proofwidgets | 4be2e3d5087eeb272cf5a8853b8f9dd025ef5957 |
| aesop | 3448c0bcc5ce01b2d1546e483ec3620e32df3d0e |
| Qq | 92c15be17b7caf78c2ad767ec40f89052d908d81 |
| batteries | 4488d40d070b9700d4d5a6aa342f0d40c31b2a2d |
| Cli | 6130a47896ce867c6a4a55373441e59e565bad0f |

## First-attempt validator failure and correction

The first attempt successfully compiled every module and its generated declaration/axiom audit, then stopped before kernel replay. Its validator compared the printed names `Classical.choice.{u}` and `Quot.sound.{u}` literally against unqualified allowed names. Its own `set_option pp.universes true` caused these harmless display suffixes.

I independently parsed all 105 reports, removed only Lean's `.{...}` universe display suffix, and found no unexpected axioms; I also checked all input/source hashes. That diagnostic is preserved in `clean-reproduction-ad/reproduction-output/independent-axiom-format-check.json`. The failure was reported to the root author, who changed the validator to normalize exactly those suffixes before comma splitting, while preserving raw text and logs. I inspected the correction before rerunning.

No mathematical source changed to resolve this validator failure. The first failed-run evidence was preserved, and the second run used a new output directory. This is not a hidden proof repair or a suppressed unexpected axiom.

## Declaration and axiom results

All 105 theorem reports were present and contained only the expected foundational axioms `propext`, `Classical.choice`, and `Quot.sound` (or a subset). Source-token checks found none of `sorry`, `admit`, `sorryAx`, custom `axiom`, `unsafe`, or `native_decide`. Independent source review additionally checked the mathematical meanings and the explicit inputs; a lexical scan alone is not treated as a statement-fidelity audit.

The principal new reproduced declarations include:

- `Tuza.maximum_k4_exhaustion` and `Tuza.equality_k4_exhaustion`.
- `Tuza.two_triangle_exact_equality`, including the vertex-disjoint and shared-vertex branches.
- `Tuza.closed_boundary_face` and `Tuza.closed_boundary_faces`.
- `Tuza.closed_lost_cover_le_packing`.
- `Tuza.closed_boundary_equality_deletion`.
- `Tuza.closed_boundary_packing_loss`.
- `Tuza.closed_boundary_stability`.

The exact-equality restoration theorem assumes HNSInput only. D1 and its packing-loss corollary assume AharoniInput, HNSInput, and BipartiteKonigInput on the auxiliary finite type. D2 assumes AharoniInput and HNSInput. These are visible theorem parameters and are not discharged by the foundational-axiom report.

## Kernel replay and limits

The installed `leanchecker` replay succeeded separately for Basic, Intersecting, Graph, Lifting, Boundary, BoundaryIntegral, TwoTriangle, IntersectingStructure, BowtieEquality, Coloring, Equality, OCT, and Sanity. The imports-only root was compiled but not passed as a checker prefix, avoiding parallel fanout to all submodules.

This is a fresh project source rebuild and independent Lean-kernel replay of its substantive modules against existing compiled dependency imports. It is **not** a cold rebuild of Mathlib or the compiler, not an external proof assistant, and not a replay of every imported dependency declaration. The existing pinned dependency caches were reused; dependency source revisions and tracked cleanliness were verified, while no claim is made here to rederive every cached dependency artifact from source. The toolchain itself remains in the trusted computing base.

## Evidence locations

- `clean-reproduction-ad-2/reproduction-output/verification.json`: all commands, timings, source hashes, pins, theorem names and axioms.
- `clean-reproduction-ad-2/reproduction-output/build.log`: exact command lines and complete output.
- `clean-reproduction-ad-2/reproduction-output/declarations-and-axioms.txt`: all printed theorem types, external input definitions and axiom reports.
- `clean-reproduction-ad-2/Verification.lean`: the generated checked audit source.
- `audit/INDEPENDENT_REPRODUCTION_SUMMARY.json`: independent successful-run summary and final hash comparison.
- `clean-reproduction-ad/reproduction-output/`: preserved initial formatting-validator failure and independent diagnosis.

Full B-inclusive reproduction is a subsequent root-run step and should be recorded separately. No publication authorization follows from this successful check.

## Final full-project evidence review

Independent review UTC: 2026-10-29T10:01:19.743760+00:00.

The subsequent B-inclusive run was executed by the root author and independently inspected here; it is distinct from the A+D clean run personally executed by this reviewer. The final record is `clean-reproduction-final/reproduction-output/verification.json`, SHA256 `c8b430eb53dc6ce7fbe9f4bac2a6982038e0aa59d40dae8ca6a938bc75f80ca1`. It reports PASS at 2026-10-29T09:54:21.479749+00:00, elapsed 158.628 seconds.

All 21 source/pin records were independently hashed against both the frozen implementation and the clean reproduction copy, with exact matches. All 13 source files that have explicit prior independent review hashes match their latest accepted versions. The remaining inherited baseline modules, toolchain and dependency manifest also match the frozen public baseline; the root importer and project package configuration are reproduction infrastructure, not new theorem assumptions. All nine dependency records report matching revisions and clean tracked sources.

All 55 recorded commands exit zero. All 17 substantive modules have separate successful `leanchecker -v` replay records; the eighteenth module is the imports-only root and was compiled without requesting a recursive prefix replay. All 152 theorem reports have exactly the standard foundational axiom set `propext`, `Classical.choice`, `Quot.sound`. The final six principal theorem types were reread from raw compiler output and agree with their manuscript/report input tables.

The completed boundary is full A, full B and its critical individual-family saving, D1 equality deletion, D1's stable floor-loss corollary, and D2 general stability. C, E, F and the separate stable-four-spoke application are explicitly not Lean-formalized. HNSInput retains the disclosed frozen graphical extraction/conversion assumption; the additional closed-boundary input is exactly the classical bipartite König interface. No new project-specific lemma is silently assumed.

The limits stated earlier continue to apply: this is a source rebuild and Lean-kernel replay of target modules using pinned compiled dependencies, not a cold dependency rebuild, an external verifier, or a proof of the explicit mathematical input parameters. The final full run was independently reviewed, not independently re-executed a second time by this reviewer. The separate A+D run supplies independent execution evidence for that subset.

Machine-readable comparison evidence: `audit/FINAL_REPRODUCTION_INDEPENDENT_REVIEW.json`. Final recommendation: **publish after owner review**, subject to final publication-tree safety/integrity checks and separate publication authorization. No further Lean work is necessary merely to make the stated conditional boundary defensible.
