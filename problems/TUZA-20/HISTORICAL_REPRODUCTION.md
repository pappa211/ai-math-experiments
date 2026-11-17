> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Reproduction and exact verification scope

All recorded execution used the existing local Darwin Mac and pinned Python3.12.12 selected by `PRIVATE_PATH_REMOVED`. All mathematical checkers use the standard library. No installation, remote computation or dependency update is needed. The public source pin is in SOURCE_INTEGRITY.json.

## Fresh private replay directory

Do not execute checkers inside the public checkout or frozen original archives. Their outputs are relative to the checker file's parent workspace. To preserve this completed mission, copy its `checks/`, `data/`, `CANDIDATE_01.md`, and `CANDIDATE_02.md` into a new private directory under the existing math-research/workspaces root; create empty `receipts/`. The copied producer literal file is needed only for the independent counterexample checker's final graph comparison. Run from that fresh directory, sourcing the existing native environment.

```sh
source PRIVATE_PATH_REMOVED
python checks/verifier_exact.py controls
python checks/verifier_exact.py census 6
python checks/verifier_candidate01.py
python checks/verifier_candidate02.py
python checks/verifier_candidate02_counterexample.py
```

The controls reconstruct every actual triangle, exact maxima and cover minima; the finite witnesses also use exhaustive edge subsets for cover lower bounds and triangle subsets for packing upper bounds. The five corruption controls reject omissions, overlap, false completion and nonmaximum packing.

The census enumerates every binary edge mask on labelled vertex sets range(n), n=0,...,6. It enumerates all maximum packings, not maximal packings, and never stops after one successful packing. There is no orbit reduction. Python integers have arbitrary precision. A global deadline records the exact next graph mask and unstarted orders as UNKNOWN; the completed recorded run had none.

C01 and C02 test all eligible all-type-one maximum packings in the same universe. Empty packings are included vacuously. A lack of C02 failures there is historical finite evidence; the twelve-vertex counterexample independently refutes the universal claim. The counterexample checker reconstructs from one K5 and four K4 blocks before comparing with the producer graph. It enumerates891 maximum packings and all657,800 seven-triangle subsets, computes c(P)=12, forced cost13 and tau10, and retains elementary lower-bound certificates. It does NOT claim a PK-all cover audit over all891 packings: the root's separate initial scan of this graph was capped at512.

## Optional bounded structured package

```sh
python checks/run_monitored.py
python checks/run_candidate02_monitored.py
python checks/verifier_root_sample.py
```

Each root generator run has a300-second internal limit, two-second per-graph check,512 maximum-packing cap, and an external330-second/process-tree RSS monitor capped at2,200MiB. Actual runs took about13seconds each and peaked at about57MiB sampled tree RSS. One run tests C01 and the other C02 on the SAME deterministic560-instance corpus (seed20261115); do not sum their packing counts. The51 capped instances retain UNKNOWN unexamined packings; neither sampling nor caps establish a universal packing quantifier. Exact rows, edges, counts and partial manifest are retained.

The sample verifier replays14 stratified producer instances, using its own set-based predicates; it agrees on3,023 packing-prefix states. This is an implementation cross-check, not independent replay of every structured state or the absent Claude census.

## Certificate and review boundaries

Accepted refutations have complete ordinary arguments in PROOFS_AND_OBSTRUCTIONS.md and the linked canonical proof. Independent checker implementations and a fresh adversarial reconstruction corroborate them. No external SAT/MILP oracle or unchecked proof trace is required. No Lean run or finite-to-universal inference is claimed. The fresh critic's extra block-product comparison ran read-only from standard input; its prose reconstruction is retained in ADVERSARIAL_REVIEW.md, and the independent verifier's reusable checker is retained separately.

`switched_cycles.py`, `merged_cycle_probe.py` and their literal outputs are diagnostic experiments, not required replay of the accepted counterexample. Nonmaximum planted packings remain failed hypotheses. The whole old publication suite was not replayed.

Final source/checker/artifact hashes and source stability are recorded in SOURCE_INTEGRITY.json, operations/artifact_hashes.json and the final receipt. A hash comparison detects scoped changes; it is not OS-enforced immutability or a proof of mathematics.
