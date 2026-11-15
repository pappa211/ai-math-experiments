# TUZA-18 reproduction and evidence guide

This is a frozen private research run, not an authorization for another campaign. The original research cutoff is2026-11-14 21:00:10 UTC. Several scripts intentionally refuse execution after it. A later authorized replay should use a NEW private copy, declare its own clock explicitly, and change only the copied guards/output destinations as documented below. Do not run discovery scripts against this frozen checkpoint or edit historical workspaces.

## Environment and exact source identity

The run used the owner's local Mac and `LOCAL_ENVIRONMENT` (Python3.12.12). NetworkX3.7 supplies the graph atlas and discovery generators; the principal independent literal certificates use only the standard library. No SciPy, SAT, ILP, or external solver is a hidden optimum oracle. Scripts enumerate finite subsets or use exact memoized recurrences, with independent literal checks where stated.

Historical math comes from these immutable Git objects:

- TUZA17: `aa0de600d7fb0cfe4134e82ad056f02e4c465eb6`.
- TUZA16: `405e41c1eb24739405f4b06d8cdcd5715bb9fd13`.
- Published baseline: `d4029fbafc3dffc250b50ed237ad81c3206cd1a0`.

`evidence/source_manifest.json` maps22 snapshots to repository, commit, path and SHA256. `evidence/criticality_sources.json` distinguishes material full reads, contextual reads and text-search hits; `evidence/apex_public_sources.json` records additional context. The later frozen TUZA14B context read is separately documented in `evidence/criticality_late_source_receipt.json`; it identifies the already-open mixed-packet obligation and imports no new theorem. `checks/source_audit.py` checks their exact Git objects, unchanged historical HEAD/worktree status, the retained primary PDFs, and the installed Lean dependency identities. Its final output is `evidence/source_integrity_final.json`. The two orientation-only recent preprints were web views, with no claimed local download digest or imported theorem. The ECCC access correction is `evidence/source_access_correction.md`.

## Mathematical proofs and exact finite controls

`STATUS_MATRIX.md` is the complete claim/evidence map. `notes/` contains the ordinary proofs, exact hypotheses, failed mechanisms and switching decisions. The ordinary all-size arguments do not become theorems merely because a finite check passed. In particular, no finite output proves global PK, unrestricted Tuza, probabilistic existence at every parameter, or a general star-gluing claim.

For a separately authorized copied workspace, these commands reproduce the compact producer certificates. Set the working directory to that copy and use the pinned interpreter. Most write their output under the copy's `evidence/`; inspect each script's fixed paths first.

```sh
LOCAL_ENVIRONMENT checks/apex_witness_verify.py
LOCAL_ENVIRONMENT checks/apex_pruned_verify.py
LOCAL_ENVIRONMENT checks/apex_role_witness_verify.py
LOCAL_ENVIRONMENT checks/apex_type1_embedding_verify.py
LOCAL_ENVIRONMENT checks/criticality_star_tight_control.py
LOCAL_ENVIRONMENT checks/criticality_type0_nonmaximum.py
LOCAL_ENVIRONMENT checks/criticality_identification_wheel.py
LOCAL_ENVIRONMENT checks/criticality_identification_star_repair.py
LOCAL_ENVIRONMENT checks/late_cover_verify.py
LOCAL_ENVIRONMENT checks/late_star_literal_verify.py
LOCAL_ENVIRONMENT checks/late_star_connected_chain_verify.py
LOCAL_ENVIRONMENT checks/late_compression_verify.py
LOCAL_ENVIRONMENT checks/late_compression_rook_verify.py
LOCAL_ENVIRONMENT checks/late_compression_cone_verify.py
```

`criticality_identification_wheel.py` defines its own standard-library literal optimizer; `criticality_identification_star_repair.py` imports that optimizer. Neither uses discovery's `apex_probe.Exact`. The compact pruned-cut checker reconstructs every actual triangle of the155-vertex graph from the voltage table and checks64 local face/cut/pruning states. The48-vertex type0 certificate proves the support-cover LOWER bound symbolically, checks its graph ingredients and larger packing, and does not claim an exact maximum packing for that graph. The connected Hall-chain checker verifies the ordinary reduction to729 local-minimum products at N=3; it does not enumerate all subsets of the full global edge set as an unexplained shortcut.

The independent review scripts are `checks/critic_*.py`, `checks/pk_*.py`, and the later review-specific checkers. Many retain the ORIGINAL canonical input paths and original STOP guard, some print JSON to stdout, and some write to explicit `SCRATCH_OUTPUT/tuza18_*` staging paths. For a future authorized replay, redirect those constants only in a new copy, preserving the originals and recording the patch. Input hashes and ordinary proof snapshots in each review package identify what was actually checked. The stored outputs are the authenticated results of this run, not a promise that the original time guards permit later execution.

## Finite search domains, randomness and unknown results

| Experiment | Exact retained scope and outcome |
|---|---|
| Apex old-cover compatibility |1253 atlas graphs/8475 apex instances; no budget failure. The separate random/structured run completed6144 instances with397 UNKNOWN timeouts. Its seed/generator/aggregate are retained, but individual UNKNOWN identities are NOT retained; exact instance-by-instance replay is incomplete. |
| Pruned-cut discovery |The compact voltage search used seed18141120261755 and found q31 at attempt2527. The final literal graph and independent checker, rather than the random search's success, certify it. |
| PK atlas |1253 graph atlas inputs and every enumerated maximum packing in that bounded domain, no counterexample or unknown. Finite survival is not a theorem. |
| Pure type1 directed controls |Seed and full generator in `checks/apex_type1_directed.py`;393643 retained literal attempts:309014 not all-type1,48410 nonmaximum,36218 exact qualifying passes, one UNKNOWN. The complete input/status ledger is losslessly gzipped, with compressed/uncompressed SHA256 and byte counts in `evidence/apex_type1_ledger_receipt.json`; the UNKNOWN is separately retained. |
| Gluing and pivot gates |Reused those36218 completed qualifying controls to test NEW specified compatibility constraints. These were not new graph-order campaigns. Canonical centres failed; existential compatibility and the first strict-pivot test survived that fixed corpus. The later symbolic connected chain refutes bounded strict-pivot descent, demonstrating why those finite passes were not a proof. |
| Wagner repair |All4096 subsets of12 outside-support edges in one fixed planted graph; nine restricted gaps, each retaining a larger packing. |
| Identification |Initial VI stopped after67 eligible atlas graphs at cone C5. The one star-terminal repair stopped after236 eligible graphs at C7 squared. The second receipt retains every eligible literal graph and all quotient rows through the witness. Independent verification used only the two decisive witnesses and their36 quotients. |
| Connected edge gluing |All50 outside-support edge identifications of two fixed blocks, with81 minimum-cover products each; no strict-pivot failure there. The N=3 connected chain and all-N proof then supplied the decisive obstruction. |
| Degree-directed compression |Three initial fixed controls and their70 allowed moves, then the fixed rook graph's two symmetry representatives and its fixed cone's two representatives. Original cone nu16/tau24 has ordinary exact proofs; compressed values are explicit packing lower/cover upper bounds, not asserted optima. No graph census or parameter campaign. |

The accidental duplicate PK-atlas run triggered by one module import is disclosed in `notes/apex_type1_gate.md`; it added no graph domain or mathematical conclusion. Earlier in-memory exploration that was not retained is not a material final certificate. Timeouts remain unknown, never a passing case.

## Local Lean verification

The only new Lean result is the finite six-vertex role obstruction, not an unrestricted theorem. Final source: `lean/RoleWitness.lean`, SHA256 `bda7467d6fb23bd221f7792ff350206e8f93ddabdfd674e77b14bbfe6c1666f6`. Successful final receipt/log: `evidence/lean_role_20261114T192326Z.{json,log}`. The failed first attempt and intermediate pass are preserved. All nine transitive axiom reports list only `propext`, `Classical.choice`, `Quot.sound`; no `sorry`, custom axiom or `native_decide` is used.

Lean is4.33.1/compiler `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`; Mathlib is `0df444a360eaa60ab8c11dca51a86af692955474`. Every other package revision is in `evidence/lean_lake_manifest.json`, and observed HEADs/worktree states plus direct import hashes are in `evidence/lean_environment.json`. Installed compiled dependencies were reused. No cold dependency build or independent kernel replay is claimed.

The original runner is `checks/run_role_lean.py`, which sets one thread and a2200MiB limit, constructs LEAN_PATH from the installed native package builds, and executes:

```sh
LOCAL_ENVIRONMENT -M 2200 https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-18/lean/RoleWitness.lean
```

The exact ELAN_HOME, ELAN_TOOLCHAIN and LEAN_PATH are in that runner and the final receipt. A future authorized replay should point the final argument/output at the new copy and explicitly update its copied time guard; never run `lake update` or install a replacement toolchain as an implicit repair. The continuing critic independently audited the formal-definition-to-ordinary-claim mapping but did not rerun Lean.

## Review and checkpoint integrity

The original fresh-context review package has22 files (`evidence/critic_transfer_manifest.json`). The second continuation package has37 files (`evidence/pk_transfer_manifest.json`); the third addendum has17 (`evidence/addendum_transfer_manifest.json`); the connected-chain continuation package has8 (`evidence/chain_transfer_manifest.json`). Each transfer validates every SHA256. A NEW fresh-context common-vertex proof audit is recorded in `review/star_fresh_manifest.json`, with its independently written verifier, detailed reconstruction and41984 bounded fixed-star cases plus10 targeted runs. These later packages do not overwrite earlier packages. Some independent work was staged in `SCRATCH_OUTPUT` after sandbox write denials and then copied into the authorized canonical workspace, with the exception and hashes retained.

The final private Git checkpoint has zero remotes. Its hash is returned to the owner outside its own committed receipt to avoid a self-referential hash. `FINAL_RECEIPT.md` records the actual clock, stopped work, source-integrity result, qualifications and closeout status. No publication, historical-worktree mutation, dependency installation, server computation or external message was part of this run.

The final compression producer package has10 files in `evidence/late_compression_transfer_manifest.json`, including the primary Bonamy et al. threshold-graph PDF and its limited read-scope/source receipt. That terminal theorem is used only in the proposed reduction's implication; the explicit failures of availability do not depend on its proof. Its full proof was not audited. The independent continuation review passed, and its nine-file package was frozen at20:27:31 UTC in `evidence/compression_transfer_manifest.json` (SHA256 `759751682ec47a91d68a75e1c5684a63f512372778470a9fdd0e8ecac2f9fe34`). The review is `review/compression_review.md`; its separately written verifier and output are retained in that package.

The initial documentation check preceded creation of its own receipt and the full artifact manifest, so those two links were initially absent. That diagnostic is preserved in `evidence/document_integrity_initial.json`; the final check follows their creation. This was an output-ordering issue, not missing mathematical evidence. `ARTIFACTS_SHA256.json` inventories every tracked or unignored private file except itself. The final seal checks those bytes, creates the local commit, verifies clean status and zero remotes, and records the commit and exact completion clock in annotated tag `tuza18-final-checkpoint` without modifying committed files afterward.
