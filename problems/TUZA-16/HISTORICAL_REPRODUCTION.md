# Reproduction and exact evidence

All runs use existing local Python; no solver installation is needed. The frozen workspace is private and has no Git remote. Preserve its bytes when replaying: copy it to a fresh local private directory first, omitting `.git`. The package is small; no toolchain/cache tree is included. For example, with a new output path of your choosing:

```sh
umask 077
LOCAL_ENVIRONMENT - <<'PY'
from pathlib import Path
import shutil
src=Path('https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-16')
dst=Path('SCRATCH_OUTPUT/TUZA-16-certificate-replay')
shutil.copytree(src,dst,ignore=shutil.ignore_patterns('.git','__pycache__'))
PY
cd SCRATCH_OUTPUT/TUZA-16-certificate-replay
LOCAL_ENVIRONMENT checks/critic_verify.py
```

`copytree` refuses an existing output directory. The independently authored standard-library verifier reconstructs all important graph definitions/full triangles and checks saved witnesses without importing producers or using the NetworkX atlas. It writes only the copied `evidence/critic_verified.json`. Assertions must remain enabled. A normal PASS does not replace the ordinary proofs or separately commissioned final audit.

The verifier checks all33 five-support isomorphism classes by enumerating all1024 labelled graphs on five vertices and120 permutations; it checks66 residual packings and the proved baseline bounds. It independently enumerates J-independent sets, reconstructs VB's39 covers using the audited ordinary double-twin proof, checks all65536 Clebsch subset states, row/column triangle decomposition, four-port optima, six B controls, all independent sets of K10−e, the affine GF4 cases, and the full553-vertex A graph. These are targeted certificate checks, not an all-graphs-on10/11 census.

To reproduce discovery outputs separately, use ANOTHER fresh copy because producer metadata such as timestamps and Python versions may change byte hashes checked by the critic manifest:

```sh
source LOCAL_ENVIRONMENT
python checks/controls.py evidence/controls.json
python checks/k10_k11_replay.py > evidence/k10_k11_run.log
python checks/a_fourcut_obstruction.py
python checks/b_compression_check.py
python checks/c_affine_diagnostic.py --output evidence/c_affine_diagnostic.json
python checks/c_affine_verify.py evidence/c_affine_diagnostic.json
```

Commands were actually used in this mission; the A producer used host Python3.13.7 originally, while the independent critic used pinned3.12.12. The K10/K11 producer uses installed NetworkX3.7 only for its initial atlas representatives; its combined search cap is480seconds, with deterministic random seed. It completed in0.053seconds. Independent completeness does not use that dependency. Other computation was standard-library integer combinatorics; no floating feasibility is a mathematical certificate. All computational outputs retain their actual version/status.

The two verifiers within Route C were written by one scout; that is explicitly weaker than the fresh critic's independently authored implementation. `checks/critic_verify.py` is the decisive independent implementation. No residual optimum in the K10/K11 cases is needed. For the partial-slope witness the exact integral optimum was not computed:20<=nu<=21. The A packing192 and cover384 are not asserted optimal. Max-cut lower bounds and Mycielski chromatic number are ordinary proofs, not optimizer outputs.

`checks/closeout_integrity.py` rechecks26 selected historical files,29 frozen snapshot comparisons, six downloaded-paper copies, and the public checkout's HEAD/tree/clean status. It writes only `SOURCE_INTEGRITY.json` in the new workspace (or your replay copy), using GIT_OPTIONAL_LOCKS=0 for historical inspection. This is selected integrity detection, not a full historical archive audit. Its hard-coded source root must remain readable for that optional operational check.

Proof reading: [PROOFS_AND_OBSTRUCTIONS.md](PROOFS_AND_OBSTRUCTIONS.md), original [A](notes/A_RESULTS.md), [B](notes/B_RESULTS.md), [C](notes/C_FROZEN_PROOF.md), and [control proofs](notes/CONTROL_PROOFS.md). Source editions/access limits: [PRIOR_ART_AND_DEPENDENCIES.md](PRIOR_ART_AND_DEPENDENCIES.md). Original criticism and disposition: [ADVERSARIAL_REVIEW.md](ADVERSARIAL_REVIEW.md).

Not run: entire publication validation, historical censuses, other n in the reported repair table, finite Baron–Kahn construction, new Lean proof, separate final audit. No software installation or new remote computation is needed or authorized by these reproduction instructions.
