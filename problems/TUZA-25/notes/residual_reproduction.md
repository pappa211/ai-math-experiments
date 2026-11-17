> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Residual track reproduction

Run only in the fresh TUZA-25 workspace on the local Mac. Source `PRIVATE_PATH_REMOVED`; set `PYTHONDONTWRITEBYTECODE=1`, `OPENBLAS_NUM_THREADS=1`, `OMP_NUM_THREADS=1`. Do not execute or modify frozen source workspaces.

Commands (each worker serially; outputs overwrite only this track's assigned evidence, so use another private copy for independent replay):

```
python scripts/residual_quick_controls.py
python scripts/residual_targeted_search.py > evidence/residual_targeted_search.log 2>&1
python scripts/residual_pair_gluing_search.py > evidence/residual_pair_gluing_search.log 2>&1
python scripts/residual_pruning_search.py > evidence/residual_pruning_search.log 2>&1
python scripts/residual_core_gluings.py > evidence/residual_core_gluing_search.log 2>&1
python scripts/residual_survivor_audit.py
```

The pair-gluing discovery run was manually stopped after 335 completed cases; its saved summary records the next interrupted input UNKNOWN. A full fresh invocation continues longer and will not reproduce that historical stopping point automatically. The pruning script intentionally consumes the retained completed-record streams and regenerates graph inputs row-by-row with exact metadata checks before selecting its 95 defect-two bases; the literal selected inputs also appear in `evidence/residual_pruning_inputs.json`.

The first search tests whole-graph chordality only as an exploratory diagnostic. Its formalF memberships were later recomputed on actual triangle SUPPORT by `residual_family_certificates.py` and directly validated in the survivor audit. Every accepted record has an ordered explicit construction certificate; chordality alone was never a final membership certificate.

The first exact oracle is adapted from snapshotted TUZA-22 `scripts/exact_graph.py`. `residual_archived_exact.py` is its unmodified copy used only for initial controls. `residual_oracle.py` reuses the complete include/exclude packing recurrence and three-branch cover recurrence, retaining per-graph caches for deletion profiles. A completed recurrence returns the exact optimum; alarms or interruption preserveUNKNOWN and no guessed optimum. The cache size affects only recomputation, not completeness. No external ILP/SAT solver was installed.

Source snapshot labels used by this worker: `residual_exact`, `residual_separator_context_complete`, `residual_safe_patch`, `residual_codegree`, `residual_codegree_review`. The initial `residual_separator_context` directory contains two partial copies from a failed optional-third-filename lookup; the complete manifest is the later `..._complete` label. The coordinator also snapshotted the initial ten requestedTUZA-22 notes. Source instructions/migration prose were read as required and not copied verbatim because they contain historical operational details outside this mission.

Complete named-model interface (both implementations):

```
python scripts/residual_edge_exchange.py > evidence/residual_edge_exchange.log 2>&1
python scripts/mixed_verify_named_interface.py
```

The second script belongs to the independent mixed worker and regenerates the twelve models and all210 nonedges rather than importing the first script's acceptance predicate. It completed with noUNKNOWN.
