# TUZA-19 reproduction and evidence index

This index was prepared after the research cutoff by reading existing artifacts and scripts. **No mathematical check, solver, or Lean compilation was rerun for this document.** Unrestricted Tuza remains unresolved. Ordinary proofs, literal checks, solver results, and Lean kernel checks have different scopes below; favorable AI reviews are not human verification or originality findings.

The immutable mission root, called `W` below, is:

```text
https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-19
```

Links and command paths are relative to W, making this index usable in a complete private copy. The original start was **2026-11-15T01:53:58Z**, research cutoff **09:23:58Z**, and hard deadline **09:53:58Z**. This document does not extend those deadlines or authorize new research.

## Replay environment and preservation

A future execution needs a **new authorized private copy** of the complete workspace, on the owner's local Darwin host. Preserve W, its frozen proofs, manifests, receipts, and logs. Do not run the commands below in W. Use the existing native environment:

```sh
source LOCAL_ENVIRONMENT
TUZA19_REPLAY='/absolute/path/to/new/authorized/private-copy'
cd "$TUZA19_REPLAY"
```

Replace the placeholder only after that copy and execution are authorized. The recorded Python is native **3.12.12**; the literal checkers below use its standard library. Most output paths are derived from `__file__`, so they follow the copied script. Some are relative to the current directory; run them from the copied workspace root. Many overwrite JSON receipts even when their mathematical input is fixed. Timestamps, machine paths, and receipt hashes may therefore change on replay; compare semantic results against the preserved original receipts.

Two special limitations require attention before a future run:

- `checks/global_routes_sat.py` contains the original cutoff as `CUTOFF`; after it, SAT callers return `UNKNOWN_CUTOFF`. `evidence/source_audit/chain_reconstruction_check.py` asserts that its start precedes the original cutoff. Do not bypass these guards during closeout. A future explicitly authorized mission must record its own clock and any change to **copied** guards, leaving originals unchanged.
- The Lean receipt checker reads absolute log paths saved in `commands.jsonl` and `negative_receipt.json`, and expects particular original run labels. Merely copying the directory does not redirect those embedded paths or make a receipt about a new build. See the Lean section below.

## Ordinary proofs: reading is the reproduction route

These all-size conclusions are not established by executing a finite checker. Read each proof with its scope and independent review; source provenance remains in the linked audits.

| Result and exact limit | Frozen proof and review |
|---|---|
| **Strongest simultaneous normalization.** For every fixed `0<beta<1`, unrestricted Tuza is equivalent to Tuza on graphs having at least `n^beta` universal vertices, TF, non-WKE components in every vertex link, and minimum triangle codegree at least `n^beta`, simultaneously. This transports a hypothetical violation; it does not produce one or preserve two-edge packing resilience. | [Batched proof](notes/root_batched_universal_tf_nonwke.md), [fresh audit](review/batched_universal_tf_nonwke_fresh_audit.md), [manifest](review/batched_universal_tf_nonwke_fresh_manifest.json). |
| **Subexponential strengthening.** For each fixed `1/2<a<1`, put `f_a(n)=n exp(-(log n)^a)` and `E_a(n)=n² exp(-(log n)^a)`. The simultaneous normalized class with `f_a(n)` universal vertices/codegree is equivalent to Tuza; so is a uniform eventual bound `tau<=2nu+C E_a(n)`. No endpoint `a=1/2`, linear proportion of universal vertices, or absorption of arbitrary unspecified `o(n²)` error is claimed. | [Corollary](notes/root_subexponential_normalization_corollary.md), the same [fresh audit](review/batched_universal_tf_nonwke_fresh_audit.md), [quantitative amplifier](notes/global_routes_quantitative_amplification.md), [EFR primary-source audit](review/efr_power_saving_source_audit.md). The incidence construction is classical EFR/Behrend input. |
| **Normalized odd-cover obstruction.** For every fixed `1/2<gamma<1`, arbitrarily large graphs have at least `f_gamma(n)` universal vertices/codegree, TF, connected non-WKE links, and `tau<2nu<pi`. No packing resilience or H-O2 counterexample is claimed. The huge graph is an existence construction, not a generated edge list. | [Proof](notes/root_batched_odd_cover_obstruction.md), [exact identity](notes/root_batched_odd_cover_exact_identity.md), [asymptotic ordinary slack](notes/root_batched_odd_asymptotic_slack.md), [fresh audit](review/batched_odd_cover_fresh_audit.md), [slack audit](review/batched_odd_asymptotic_slack_fresh_audit.md). The eight-triangle base has a literal check below. |
| **Every fixed star size plus all clique polytopes still leaves a gap.** For each fixed `k`, the cocktail-party construction supplies a fractional point in every exact packing polytope on triangles meeting a vertex set of size at most `k`, and in every complete-subgraph packing polytope, but outside the global packing polytope. The base gap is `4/3`; incidence amplification preserves the stated TF/resilience/non-WKE-component conditions. This is separate local membership, not a consistent family of joint moments. | [Unified proof](notes/global_routes_bounded_stars_all_cliques.md), [scope addendum](notes/global_routes_bounded_stars_scope_addendum.md), [fresh audit](review/bounded_stars_all_cliques_fresh_audit.md). Read the [CP5 precursor](notes/global_routes_clique_link_polytope_obstruction.md) with its [K5 wording erratum](notes/global_routes_clique_link_erratum.md). All-size doubling and averaging remain ordinary proofs. |
| **Four-branch WKE and core localization.** The all-size reduction is ordinary; only its canonical finite kernel is covered by the Lean bundle. | [Proof](notes/root_four_branch_wke.md), [scope addendum](notes/four_branch_wke_scope_addendum.md), [fresh audit](review/four_branch_wke_fresh_audit.md), [formal correspondence review](review/four_branch_wke_formal_root_scope.md). |
| **Full square-cell theorem.** Tuza holds when every actual triangle is uniquely owned by a full K4 cell with two private diagonals, allowing arbitrary boundary-edge multiplicity. The Tutte argument uses actual graph endpoints. Availability of such cells in arbitrary graphs is not proved; single-diagonal diamonds are outside this theorem. | [Proof](notes/global_routes_square_cells_matching.md), [fresh ordinary audit](review/square_cells_fresh_independent_audit.md), [prior-art audit](review/square_cells_prior_art_audit.md). No finite run establishes the all-size result. |
| **Line graphs.** `pi(L(R))<=2nu(L(R))` for every finite simple root graph R, including roots with triangles. There is no reduction from arbitrary graphs. | [Proof](notes/root_line_graph_parity.md), [fresh audit](review/line_graph_parity_fresh_audit.md), [prior-art audit](review/line_graph_prior_art_audit.md). The optional finite construction replay below is supporting evidence, not the proof. |

TF means that every actual triangle is contained in some minimum triangle edge cover. WKE means that a graph has a matching M and a vertex cover Q of the graph after deleting M, with `|Q|<=|M|`. An odd triangle cover meets each actual triangle in one or three edges; its minimum size is pi.

## Literal and finite replay commands

Run only in a future authorized copied workspace, from its root. Each row gives the exact existing script and the expected semantic output, not a claim that it was run during closeout.

| Command | Expected result and scope | Written output / preserved receipt |
|---|---|---|
| `python3 checks/batched_odd_cover_fresh_base.py` | `verdict: PASS`; eight displayed K_(2,2,2,2) triangles use all 24 cross edges exactly once. Only the finite base; no large graph or all-size Latin blowup is checked. | Prints JSON only. Original [fresh receipt](evidence/batched_odd_cover/fresh_base_receipt.json); producer [base certificate](evidence/batched_odd_cover/base_certificate.json). |
| `python3 review/bounded_stars_all_cliques_fresh_base.py` | `PASS`; three CP5 packings, each with 12 triangles/36 used edges, with C4 leaves meeting twin parts in patterns `[2,2]`, `[2,1,1]`, `[1,1,1,1]`. | Prints JSON only. [Original receipt](evidence/bounded_stars_all_cliques_fresh_base.json). |
| `python3 checks/fresh_clique_link_audit.py` | `PASS`; fixed CP5: 10 vertices, 40 edges, 80 actual triangles, all 370 C4 leaves, 780 deletion pairs, 80 TF witnesses, ten link distributions, and all 80/80/32 cliques of orders 3/4/5. Derived `nu=12`, `tau=16`, `rho=40/3`; optimum upper/lower arguments are ordinary. | Reads hash-pinned `evidence/clique_link_fresh/clique_link_control.json`; overwrites [independent_receipt.json](evidence/clique_link_fresh/independent_receipt.json), relative to script root. Producer alternative: `python3 checks/global_routes_clique_link_control.py`, overwriting `evidence/global_routes/clique_link_control.json`. |
| `python3 review/four_branch_wke_fresh_verify.py` | Independent reconstruction of all 5,375 retained canonical cases, from hash-pinned literal M,Q input. This Python replay is distinct from Lean. | Overwrites [verification.json](evidence/four_branch_wke_fresh/verification.json), relative to script root. |
| `python3 checks/fresh_tf_light_wedge_verify.py` | `PASS_LITERAL_EXACT`: fixed 9-vertex graph, 22 edges, 18 actual triangles, `nu=6`, `tau=8`, TF witnesses, and a two-edge blocker. It is **not** two-edge resilient. No SAT dependency for this check. | Reads `evidence/tf_light_wedge_fresh/inverse_n9.json`; overwrites [literal_verification.json](evidence/tf_light_wedge_fresh/literal_verification.json). [Scope/audit](review/root_tf_light_wedge_audit.md). |
| `python3 review/codegree_two_fresh_checker.py` | `PASS`: independently rebuilt 72-vertex graph, 216 edges, 240 triangles, `nu=49`, `tau=pi=86`, five codegree-two edges; all 240 TF covers and 23,220 deletion pairs checked. Its Petersen-join base has `nu=9`, `tau=12`, and 630 checked pairs; do not substitute the discarded base `tau=13` claim. | **Cwd-relative**. Checks `evidence/codegree_two/input_manifest.json`; writes/snapshots under `review/codegree_two_fresh_inputs/` and `evidence/codegree_two_fresh/`, including [results.json](evidence/codegree_two_fresh/results.json). [Fresh audit](review/codegree_two_fresh_audit.md). |
| `python3 checks/fresh_global_private_pair_gate.py` | `PASS_FIXED_GATE_COUNTEREXAMPLE`; core `(n,m,T,nu,tau)=(8,16,13,3,5)`, padded `(32,76,73,15,29)`, 36 maximum core packings, six obstructed core states, 2,304 attachment profiles, and 4,374 global F-maximizers by ordinary factorization. Refutes the specified binary/private-pair gate, not Tuza. | Overwrites [literal_receipt.json](evidence/fresh_global_private_pair_gate/literal_receipt.json), relative to script root. [Exact gate/proof](notes/fresh_global_private_pair_gate_obstruction.md). |
| `python3 -I evidence/source_audit/chain_reconstruction_check.py` | **Currently blocked by its original clock assertion.** Authorized future replay should yield `PASS`: N=3 has 17 vertices, 49 edges, 48 triangles, packing 12, minimum **support** cover 24, 729 minimum support states, 560 compatible states, minimum symmetric difference 4, and plateau checks N=2..10. Not an unrestricted minimum-cover claim. | Overwrites [chain_reconstruction_check.json](evidence/source_audit/chain_reconstruction_check.json), beside the script. [Archive audit](review/chain_archive_audit.md), [plateau scope](review/chain_plateau_control.md). |
| `python3 review/line_graph_parity_fresh_verify.py` | `PASS independent finite constructive verification`; 34,177 root graphs, 366,557 literal line-graph triangles, and 599 local clique cases. Exhaustive roots have order at most six; other fixed/seeded cases are supplementary. It checks constructed covers and packings, not exact global optima. | Reads hash-pinned `evidence/line_graph_parity_fresh/input_statement.md`; overwrites [verification.json](evidence/line_graph_parity_fresh/verification.json), relative to script root. |

## Lean: exact finite bundle and future rebuild

Start with [formal/four_branch_wke/README.md](formal/four_branch_wke/README.md), [FINAL_RECEIPT.json](formal/four_branch_wke/FINAL_RECEIPT.json), [environment.json](formal/four_branch_wke/environment.json), [axioms.json](formal/four_branch_wke/axioms.json), and [FILES.sha256.json](formal/four_branch_wke/FILES.sha256.json).

The accepted scope is **5,375 canonical records in 128 separately compiled modules**, with branch counts 0/0/10/5,365 and 15,756 raw state vectors. Kernel `decide` checks actual edges, degrees, matching/cover witnesses, and exact per-segment domain equality. Separate Domain/Coverage proofs establish the vector schedule. Cross-file header correspondence is checked by Python. There is **no single aggregate Lean theorem importing all chunks**, and no formalization of arbitrary-graph reductions, subdivision lifting, the all-size WKE theorem, or core localization.

Pins: Lean **4.33.1**, `arm64-apple-darwin24.6.0`, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`; installed prefix `LOCAL_ENVIRONMENT`; Python **3.12.12**. Only installed Std/core is used, with no Mathlib, dependency update, `native_decide`, new axioms, or admissions in accepted proof files. All 128 certificate theorems and finite schedule/count/rejection checks have no axioms. Vector membership uses `propext`, `Classical.choice`, `Quot.sound`; vector algebra/length and corresponding coverage consequences use `propext`, `Quot.sound`.

In a **separate future authorized rebuild copy**, from its `formal/four_branch_wke/` directory, the README commands are:

```sh
python3 generate.py
python3 run_lean.py Core.lean core_rebuild
python3 build_chunks.py
FORMAL_LEAN_MEMORY_MIB=1200 python3 run_lean.py Domain.lean domain_rebuild
FORMAL_LEAN_MEMORY_MIB=1200 python3 run_lean.py Coverage.lean coverage_rebuild
FORMAL_LEAN_MEMORY_MIB=1200 python3 run_lean.py NegativeChecks.lean rejection_lemmas_rebuild
```

Expected: all positive invocations return zero; the chunk driver ends `ALL_CHUNKS_PASS`. Run `RejectMissingRow.lean`, `RejectEmptyCover.lean`, and `RejectRepeatedMatching.lean` individually through `run_lean.py` as negative controls: each must return 1 because the proposed check is false. Do not build all `.lean` files indiscriminately; historical attempts and rejection files intentionally fail.

`generate.py` rewrites chunk sources and `generation.json`. `run_lean.py` writes `.olean` and logs and appends `commands.jsonl`; the chunk driver reuses `chunkNNN_final` labels. Thus a new run must have its own log/receipt inventory. The command `python3 verify_bundle.py` checks the **original completed-run bookkeeping**, launches no Lean, and overwrites `axioms.json` and `receipt.json`. It expects unique original labels, follows embedded absolute log paths, and consults `negative_receipt.json`. Do not present its success after a rebuild as verification of that rebuild unless those inventories and paths have been explicitly and correctly remapped in the new copy. Preserve originals separately.

Recorded limits: one Lean process, one thread, 240 seconds per command, configured memory at most 2,200 MiB. Accepted peak RSS was **1,781,858,304 bytes**, longest accepted command about **4.86 seconds**. The initial failed monolithic `-M2200` run reached **3,644,030,976 bytes RSS**; the largest failed attempt reached **4,340,842,496 bytes**. Lean `-M` is not an OS hard RSS cap. Those failures are retained and excluded from the accepted proof bundle; no cap increase was used. Failed diagnostics containing temporary `sorryAx` are not accepted declarations.

## Solver-only kernels and unresolved runs

The two distinct rainbow gates remain open in general. Their minimum-counterexample reductions isolate precisely 28 domains at rainbow matching number two: `8<=n<=12`, `max(5,ceil(n/2))<=c<=n`. Each domain has proper color classes of size two and the additional hypotheses specified in its proof. Neither kernel is an all-size theorem, and neither was expanded to rainbow matching number three.

| Future replay command | Recorded evidence and trust boundary |
|---|---|
| `python3 checks/fresh_rainbow_resource_gate_kernel.py` | [Mixed-resource gate](notes/fresh_rainbow_resource_gate.md), [original kernel_receipt.json](evidence/fresh_rainbow_resource_gate/kernel_receipt.json): `ALL_28_UNSAT_SOLVER_ONLY`. Replay prints 28 UNSAT statuses, writes `evidence/fresh_rainbow_resource_gate/kernel_replay.json`, then asserts completeness. 300-second overall budget, at most 10 seconds per case. |
| `python3 checks/fresh_rainbow_vertex_kernel.py` | [Vertex-cover strengthening](notes/fresh_rainbow_vertex_cover_gate.md), [kernel_receipt.json](evidence/fresh_rainbow_vertex_gate/kernel_receipt.json): `ALL_28_UNSAT_SOLVER_ONLY`. Replay overwrites that receipt; 180-second overall budget, at most 20 seconds per case. |

Both import `checks/global_routes_sat.py` through the resource builder. It invokes the pinned local CaDiCaL executable at `LOCAL_ENVIRONMENT` (recorded CaDiCaL 2.1.2). UNSAT is trusted solver output: **no DRAT/LRAT or Lean proof verification** is claimed. Positive SAT outputs are separately checked against generated clauses/literal constructions. The expired cutoff must be handled only under future authorization as explained above; current `UNKNOWN_CUTOFF` would not reproduce the prior UNSAT run.

Timeouts and incomplete searches remain **UNKNOWN**, not negative results. For example, [worth_critical_n11_a4.json](evidence/global_routes/worth_critical_n11_a4.json) records `UNKNOWN_TIMEOUT` after 20 seconds. The multi-apex parity-cover work retains an unresolved 53–55 interval in its frozen handoff, with positive and negative individual bounds distinguished in [parity_cone_sat_tighten.json](evidence/global_routes/parity_cone_sat_tighten.json); no exact optimum should be inferred from incomplete tightening. The [K5 cycle gate](notes/global_routes_k5_cycle_gate.md) likewise remains open despite [local rotations](notes/global_routes_k5_endpoint_rotations.md).

For archival hashes use each result's adjacent manifest and the mission report/status matrix. Historical TUZA-18 references are frozen at `tuza18-final-checkpoint`, commit `57708a8413929012d9ca8d15b0f925b3ef6b51e8`; any historical Git inspection must use `git --no-optional-locks` and remain read-only. This index changes no proof, source, historical checkout, or recorded result.
