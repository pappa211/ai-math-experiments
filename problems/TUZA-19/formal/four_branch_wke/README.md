# Four-branch WKE finite kernel certificate bundle

**Result: PASS for the finite certificate bundle.** All 5,375 retained canonical records were checked in 128 separately compiled Lean modules. A separate proof verifies the complete state-vector schedule. The omitted-row, empty-cover, and repeated-matching negative controls are rejected. This is not a formalization of the all-size four-branch WKE theorem or the high-codegree-core localization theorem.

The frozen ordinary note is `inputs/root_four_branch_wke.md`, SHA256 `67011b7544cd8d8c516a738572c10f5d828b5631c3d8ce491fcd08ae3f71ce99`. The frozen literal table is `inputs/canonical_witnesses.json`, SHA256 `e69818bb2599b6b934dd945f3b6cd0305f6718c3d2fe165ea9f7f6d1bfe17cc1`. No producer checker was imported or executed. Its witness search is not trusted here.

## What the kernel checks

`Core.lean` defines the five pair states and constructs the corresponding graph using fresh internal vertices. It recomputes branch degrees from the actual reconstructed edge list. The certificate predicate checks:

- state length and digit bounds;
- the literal vertex count and edge set against the reconstructed canonical graph;
- simplicity, edge uniqueness, and endpoint bounds;
- that M consists of actual graph edges with pairwise disjoint endpoints;
- that Q has distinct in-range vertices, with |Q|<=|M|;
- that every edge outside M has an endpoint in Q.

For each segment it also checks equality between the entire displayed state list and the regenerated admissible domain. Merely having valid witnesses for an incomplete list therefore fails.

`Chunk000.lean` through `Chunk127.lean` contain closed theorems `FourBranch.ChunkNNN.correct : checkSegment segment = true`, proved with kernel `decide`. Each passed and each reports **no axioms**. The finite table is partitioned as follows: one segment each for one, two, and three branches; then 125 segments for four branches, indexed by the first three pair states, with all 125 choices of the remaining three states regenerated within each segment.

`Domain.lean` proves that `vectors k` contains exactly the length-k lists with entries below five, proves the prefix/suffix decomposition, and derives its cardinality. `Coverage.lean` checks that the literal segment headers equal the full schedule, verifies the six-state prefix/suffix identity, and records 15,756 raw vectors. The retained counts are 0, 0, 10, and 5,365, totaling 5,375.

The count sum in `Coverage.lean` is a checksum of the recorded per-segment counts. Completeness does not rely on that checksum: it comes from each segment's exact domain equality and the complete prefix/suffix schedule. `verify_bundle.py` checks the literal correspondence between the 128 compiled module headers and the recorded schedule. There is deliberately no single Lean environment importing all 128 chunks and asserting the combined universal result; this is a proof bundle with explicit cross-file bookkeeping.

## Scope and trust boundary

The formal domain is the stated five-state canonical construction on one through four labeled branches, filtered by actual branch degree at least three. The ordinary reductions from arbitrary graphs to this domain are outside these Lean files. Cycles, leaf reductions, loop reductions, parallel-path reductions, subdivision lifting, and the global core consequence are not formally proved here.

The bundle uses installed Lean Std/core only. It does not import Mathlib, install dependencies, run `lake update`, use `native_decide`, introduce new axioms, or contain admitted declarations in the accepted proof files. It uses the standard installed Lean kernel, not an independent kernel implementation or a cold rebuild of Lean/Std.

Axiom reports are retained in `axioms.json` and the compiler stdout logs:

- all 128 certificate theorems: none;
- schedule equality, segment count, retained-count arithmetic, and the three rejection lemmas: none;
- vector membership characterization: `propext`, `Classical.choice`, `Quot.sound`;
- algebraic vector decomposition and length, and the corresponding coverage consequences: `propext`, `Quot.sound`.

These are the existing standard Lean axioms, not newly declared assumptions. The all-size mathematical note retains its ordinary-proof/AI-review status.

## Negative controls

`NegativeChecks.lean` proves that three corrupted tables evaluate to false: a missing canonical row, an empty Q on a retained graph, and a matching with repeated edges/endpoints. The three `Reject*.lean` files then deliberately assert that those corrupted checks are true. All return code 1 with Lean reporting that `decide` proved the proposed assertion false. Their expected failures and diagnostics are in `negative_receipt.json` and `logs/reject_*.stdout`.

These intentionally failing files and the historical attempts are not positive build targets. No theorem from them is imported by an accepted proof.

## Execution, limits, and retained failures

Observed compiler: Lean 4.33.1, arm64-apple-darwin24.6.0, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`. Python was the existing pinned native 3.12.12 environment. Exact commands, timestamps, return codes, and stdout/stderr paths are in `commands.jsonl`; tool identities and constraint-file hashes are in `environment.json`.

Only one Lean process ran at a time, with one Lean thread and a 240-second timeout for each compiler invocation. Accepted checks used configured Lean memory limits no larger than 2,200 MiB. Their maximum observed RSS was 1,781,858,304 bytes (about 1.66 GiB); the longest accepted command took about 4.86 seconds.

Two monolithic aggregate attempts and one naive schedule-normalization attempt failed Lean's configured memory check. The initial monolithic attempt used `-M2200` and reached 3,644,030,976 bytes RSS; the largest failed attempt reached 4,340,842,496 bytes RSS. Lean's `-M` setting was not an OS hard RSS bound. These failures are explicitly excluded from the accepted result. No cap increase was used. Root then directed preservation of the separate proof bundle, and the final schedule proof uses short algebraic list identities at a lower cap.

Earlier parser, unfinished conjunction-reordering, and an extra-tactic diagnostic were corrected; their source versions and logs remain under `attempts/` and `logs/`. Some failed Lean diagnostics print temporary `sorryAx` or failed-declaration dependencies; those runs returned nonzero and are not accepted proofs. Final accepted axiom reports contain no such dependency.

The requested formal-task time budget was about 35 minutes. The task began around 05:46 UTC; all Lean compilation finished by 06:09 UTC, and the exclusive Lean slot was released after the final environment capture. The mission's original research cutoff remains 2026-11-15T09:23:58Z, with hard deadline 09:53:58Z. Requested model controls were Astra / Ultra; actual serving identity and applied controls are not independently exposed.

## Reproduction

Use a fresh private copy to retain this run's original logs and objects. Source `LOCAL_ENVIRONMENT`, then run from the copied directory:

```sh
python3 generate.py
python3 run_lean.py Core.lean core_rebuild
python3 build_chunks.py
FORMAL_LEAN_MEMORY_MIB=1200 python3 run_lean.py Domain.lean domain_rebuild
FORMAL_LEAN_MEMORY_MIB=1200 python3 run_lean.py Coverage.lean coverage_rebuild
FORMAL_LEAN_MEMORY_MIB=1200 python3 run_lean.py NegativeChecks.lean rejection_lemmas_rebuild
```

Run each `Reject*.lean` separately with `run_lean.py`; each must fail for the displayed false-check reason. Do not compile all `.lean` files indiscriminately, since the rejection controls and retained attempts deliberately contain failing assertions or earlier failures.

The original completed-run receipt can be checked with `python3 verify_bundle.py`; it verifies the exact recorded labels, axiom reports, module headers, and negative-control results. It does not launch Lean. `FILES.sha256.json` freezes inputs, proof sources, objects, scripts, all logs, and receipts. The strongest accepted claim remains **finite kernel certificate verification in a complete scheduled proof bundle**.
