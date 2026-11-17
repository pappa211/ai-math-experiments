> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Reproduction and evidence map

All actual mathematical execution in this mission ran on the authenticated owner's Mac. Use a new private copy of this workspace for replay, because some scripts overwrite their assigned evidence. Do not execute in or alter frozen sources. No cloud solver, installation, toolchain upgrade or new Lean campaign was used.

Environment:

```sh
source PRIVATE_PATH_REMOVED
export PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1
```

Pinned Python3.12.12; exact finite Python recurrences, standard-library CSP, available networkx/numpy, and native Apple clang for selected C replays. ORTools/scipy/pulp are absent. Native binaries are reproducible and ignored in operations/mixed_bins. Full version information is in operations/tool_versions.txt. At most two heavy processes were permitted; each research track used one serial process. Recorded peak RSS on residual searches was below180MB. Actual memory checks are retained in operations.

## Decisive checks

```sh
python scripts/ring_certificate.py
python scripts/critic_ring_check.py
python scripts/residual_edge_exchange.py
python scripts/mixed_verify_named_interface.py
python reviews/critic_edge_exchange_check.py
python reviews/critic_matching_control.py
python reviews/critic_bridge_check.py
python scripts/role_k2c5_csp.py
python reviews/critic_role_check.py
python scripts/role_status_mock.py
```

The ring scripts give explicit packing witnesses for every deletion set of size0/1/2, exact cover and F2 rank/cocycle checks. The edge-exchange scripts regenerate all12 specified supports and210 nonedges; the fresh critic independently uses exact optimization and proved automorphisms. The matching control preserves the five-K4 path example refuting a packing-only gain bound. The bridge checker reconstructs both unconditional resilience-descent counterexamples. The role checker uses a different constraint search from the author's finite CSP. No output from an UNKNOWN run is treated as a certified optimum.

Ordinary proofs and their independent reviews are the premises for the separator, critical-edge, matching, marked-boundary, named reconstruction, mixed equivalence, crown and topology-identity results. Scripts support finite claims; they do not certify unrestricted theorems. PROOF_CHAIN.md makes all comparisons inside the fixed original graph explicit.

Additional semantic controls:

```sh
python scripts/mixed_exact.py
python scripts/mixed_semantic_checks.py
python scripts/mixed_claude_replay.py
python reviews/critic_mixed_controls.py
```

Read notes/mixed_program_audit.md for actual program domains, native commands/stdout, bounded pair counts, safe shift limits and unavailable full-census provenance. Do not supply mt.c inputs beyond its verified small domain. The corrected ORTools role algorithm remains NOT_RUN; the mock is control-flow validation only.

## Exploratory streams and precise coverage

notes/residual_reproduction.md lists commands, seeds, source-oracle provenance and each stream. Sources/records retain literal inputs. The pair-overlap stream was stopped intentionally after335 completed candidates; replaying its generator to exhaustion will not reproduce that historical stopping time. One interrupted literal graph remains UNKNOWN. Pruning consumes the saved completed streams and independently rechecks its95 selected bases before39105 deletions. The nonchordal/core stream retains both exact and UNKNOWN inputs. The survivor audit validates witness bounds and construction certificates, not independently every optimum or aggregate generator count.

The critical-triangle finite table is complete for its named interface; all other searches are bounded construction samples. Distinguish zero unknown-core defect-one states from218 unresolved numerical records across timeout/interruption streams. Graphs may be labelled duplicates across runs. No fresh full Claude census or full historical Lean replay is claimed.

Source checks:

```sh
python scripts/verify_sources.py
```

This compares selected snapshotted source bytes/mtimes and recorded source Git states, writing SOURCE_INTEGRITY.json. It is not an archive-wide audit. The incomplete sources/residual_separator_context directory holds two duplicate snapshots from a failed optional-path lookup; the complete manifest is sources/residual_separator_context_complete/manifest.json. Originals were never changed. Literature downloads retain URLs and hashes. The final private commit identifier is in the operator response/external receipt, avoiding a self-referential tracked hash cycle.
