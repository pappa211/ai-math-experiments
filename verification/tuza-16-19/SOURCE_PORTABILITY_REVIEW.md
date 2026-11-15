# TUZA-16–19 source portability and formal-evidence preflight

Date: 2026-11-15. Status: **PREFLIGHT_ONLY — not a frozen-candidate publication approval.**

This internal AI reviewer read the owner mission, canonical AGENTS.md, migration handoff/report, all four reproduction guides, the TUZA-19 publication handoff, the formal bundle sources/tooling, and selected exact checkers/input manifests. The root coordinator authenticated source commits and saved comprehensive before hashes. This review did not independently repeat that complete source authentication. `uname -s` returned `Darwin`. No remote execution, archived checker execution, Lean invocation, dependency write, or source edit occurred in this review. Read-only source inspection and independently written structural checks ran locally. New work is restricted to `/private/tmp`.

The reviewed source aliases are TUZA-16 `405e41c1eb24739405f4b06d8cdcd5715bb9fd13`, TUZA-17 `aa0de600d7fb0cfe4134e82ad056f02e4c465eb6`, TUZA-18 `57708a8413929012d9ca8d15b0f925b3ef6b51e8`, and TUZA-19 `7563fdeeb5afb81ebe6ef005b5c5f9f7261ca670`. The separately supplied TUZA-18 common-vertex replay has no independently supplied Git commit. It is not a chain replay. The candidate was still being curated; it was consulted only to confirm intended paths, not certified.

## Concrete blocking risks before a release can pass

1. **Copied historical formal bookkeeping can masquerade as a fresh build.** `TUZA-19/formal/four_branch_wke/verify_bundle.py` follows absolute stdout/stderr filenames in `commands.jsonl` and `negative_receipt.json`. It hardcodes `chunkNNN_final`, `core_fixed`, `domain_final`, `coverage_pass`, and `negative_checks_pass`. Its success in a copied tree is not new compilation evidence. The new driver must not load any old log, command inventory, or object.
2. **The historical Lean launcher has no external memory enforcement.** `run_lean.py` has a 240-second process-group timeout and `-M`, but no RSS polling/kill. Historical accepted peak was 1,781,858,304 bytes; failed aggregate attempts exceeded 4 GB. Use new external supervision, one process and thread, 240 seconds, observed-process 2,200 MiB ceiling. Never replay aggregate attempts.
3. **Historical clock assertions block real checks.** TUZA-18 reviewer checkers and `run_role_lean.py` retain the November 14 cutoff. TUZA-19 `evidence/source_audit/chain_reconstruction_check.py` and `checks/cksu_prop13_independent.py` assert start AND finish before November 15 09:23:58Z. `checks/global_routes_sat.py` returns `UNKNOWN_CUTOFF`. A new replay interface must replace only copied guard/output machinery under explicit fresh limits and record the transformation; a false PASS or treating UNKNOWN as success is unacceptable.
4. **Some provenance-only inputs are private or third party.** The TUZA-16 critic manifest includes article PDFs; TUZA-17 critic hashes a mission handoff and HNS PDF; the catalogue checker hashes a downloaded HTML page; the CKSU checker hashes a PDF. Those files are not mathematical input to their finite algorithms. Publication should retain source hashes/citations as historical provenance and explicitly adapt the corresponding bookkeeping, rather than redistribute excluded material or silently weaken a scientific check.
5. **Source-hash chains are sensitive to sanitization.** A proof note copied into a reviewer input directory can be hash-pinned by its checker. Sanitization must record original/destination hashes and update the public checker manifest only to the reviewed public bytes. Never blanket-replace data inside graph labels/certificates, or claim unchanged bytes when metadata/prose was transformed.

These are solvable implementation requirements, not newly discovered mathematical counterexamples. Fresh finite replay, actual formal compilation, frozen candidate review, final privacy/licensing checks, and public verification remain required.

## Exact formal closure and read-only correspondence result

TUZA-19 accepted positive source order:

1. `Core.lean`.
2. `Chunk000.lean` through `Chunk127.lean` (each imports Core only).
3. `Domain.lean` (imports Core).
4. `Coverage.lean` (imports Domain).
5. `NegativeChecks.lean` (imports Chunk002).

This is 132 accepted TUZA-19 source modules. There are 128 `FourBranch.ChunkNNN.correct` theorems, three Domain theorems, seven Coverage theorems, and three rejection theorems: 141 named theorems. TUZA-18 `lean/RoleWitness.lean` adds one source module and nine theorems, for **150 explicitly named accepted theorems**. Counting source-level named definitions, abbreviations and structures as well yields **444 explicit names**. This count does not claim to enumerate every compiler-generated instance or structure helper.

The only expected-failure targets are `RejectMissingRow.lean`, `RejectEmptyCover.lean`, and `RejectRepeatedMatching.lean`. They import NegativeChecks and deliberately assert a corrupted check is true using `by decide`. Require return code 1 plus the diagnostic that `decide` proved the proposition false. An import error or missing object is not a successful negative control. `ScheduleProbe.lean` and `attempts/` are historical failed work, excluded from positive targets. Retain useful sanitized failure diagnostics without compiling them.

An independently written source serialization check regenerated all 128 chunk files from the literal canonical table and compared their entire UTF-8 bytes. It also compared every generation entry, every Coverage header, every retained-count entry, and every row assignment. A second check through the newly prepared driver independently enumerated all 15,756 raw vectors and recomputed canonical graph edges, branch degrees, matching/cover validity and the complete retained domain. Results:

| Property | Observed source-level result |
|---|---|
| Canonical table SHA-256 | `e69818bb2599b6b934dd945f3b6cd0305f6718c3d2fe165ea9f7f6d1bfe17cc1` |
| Chunk source correspondence | All 128 byte-exact |
| `generation.json` | All entries and entire regenerated serialization byte-exact |
| `Coverage.recordedHeaders` | All 128 exactly equal to the generated schedule |
| `Coverage.recordedRetainedCounts` | All 128 exactly equal to actual per-chunk rows |
| Table rows / unique assignment | 5,375 / 5,375, complete and nonoverlapping |
| Branch counts 1,2,3,4 | 0, 0, 10, 5,365 |
| Largest segment | 112 rows |
| Raw vector total | 15,756 |

The schedule is `(1,[],0), (2,[],1), (3,[],3)` followed by 125 four-branch prefixes of length three, each with all 125 suffixes of length three. `Core.checkSegment` equates the entire ordered state list to the regenerated admissible domain and checks actual graph/matching/cover facts. Coverage's retained-count sum is a checksum, not the source of domain completeness. Cross-file correspondence remains Python bookkeeping around separately checked Lean theorems. No monolithic aggregate or all-size WKE/core theorem is established.

These source-level PASS results are **not fresh Lean compilation**. The future compiler receipt must report literal types and transitive axioms. Finite certificate and finite schedule/rejection theorems require no axioms. Domain membership uses `propext`, `Classical.choice`, `Quot.sound`; vector algebra/length and their consequences use the recorded standard axioms. No `sorry`, new custom axiom, or `native_decide` is accepted.

TUZA-18 RoleWitness source SHA-256 is `bda7467d6fb23bd221f7792ff350206e8f93ddabdfd674e77b14bbfe6c1666f6`. Its imports are `Mathlib.Data.Finset.Powerset` and `Mathlib.Data.Finset.Union`. It proves finite six-vertex actual-triangle/packing/cover/role-collision facts; it does not formalize the common-vertex theorem or all-size chain construction. TUZA-19 WKE uses installed Std/core only and needs no Mathlib imports.

## Prepared fresh formal driver

The root requested implementation preparation during this review. The resulting standalone standard-library driver is `private preparation output` (the root chooses its public tools filename). Its required options are `--repo`, new external `--output`, and explicit `--mathlib-packages`; `--lean` defaults to `lean`.

The driver:

- Refuses an output directory inside the checkout, inside dependencies, or already present.
- Selects only the positive modules and three explicit negative controls, never historical logs/objects/attempts.
- Checks the fixed Lean version/compiler/platform, all nine dependency Git revisions, tracked cleanliness with `git --no-optional-locks`, the public pinned lockfile, and source hashes for Core/Domain/Coverage/NegativeChecks/controls/RoleWitness.
- Regenerates chunk sources and generation.json in the new output, compares exact bytes/headers/counts/domain/witness membership, and compiles only those regenerated-and-matched chunks.
- Runs each compiler command serially, `-j 1`, with 240 seconds, a sampled process-group/descendant RSS watchdog at 2,200 MiB, child-tree kill, `/usr/bin/time -l` peak accounting, fresh logs and command receipts.
- Compiles a separate small audit module for each accepted source module. Each audit imports only that source module, prints every explicit name's literal type and transitive axiom report, and validates the standard axiom set; no chunk aggregate is introduced.
- Records source hashes before/after, repository state before/after, dependency states before/after, direct Mathlib import hashes, all fresh object hashes, and fresh outcome status. It distinguishes the finite scope and dependency-cache trust boundary.

Prepared-driver checks actually performed: Python AST parse; `--help`; the independently implemented correspondence routine in a new temporary directory; explicit declaration count. **No compiler, watchdog runtime, or compiler-output parser has been exercised by this reviewer.** Root's actual fresh run must settle these and preserve any failure receipt. The driver is an implementation draft, not a replay success claim.

## Minimal decisive finite replay plan

Use a new output-side copy per selection or carefully isolated subtrees, since most scripts overwrite evidence alongside their sources. Run assertions enabled (`python3 -B`; no `-O`). A small public entry point should accept `--only` and required `--output`, copy only public retained input closure, run each target with explicit bounds, and report fresh versus historical evidence separately. Do not execute modules by indiscriminate import: several historical imports trigger discovery work.

| Target | Recommended exact checker and required inputs | Adaptation / evidence boundary |
|---|---|---|
| TUZA-16 decisive combined finite checks | `checks/critic_verify.py`; `evidence/controls.json`, `evidence/k10_k11.json`, `evidence/c_affine_diagnostic.json`, `checks/b_compression_results.json`, `notes/A_FOURCUT_WITNESS.json`, `notes/A_CONTROL_CERTIFICATES.json`, and the provenance manifest | Standard library, no NetworkX. Checks all 66 K10/K11 certificates and completeness via all 1,024 labelled five-vertex graphs, GF4 controls, all 553-vertex actual triangles and 576>552 accounting. Partial-slope optimum stays 20 or 21. Adapt PDF-only provenance reads explicitly. |
| TUZA-17 principal finite dependencies | `checks/critic_independent.py`, `critic_late.py`, `critic_boundary.py`, `critic_addenda.py`, `critic_catalogue.py`; also compact `a_boundary_link_probe.py`, `b_petersen.py` | Standard library; no need to repeat random censuses. The independent critic's INPUTS list includes mission/PDF bytes only for output provenance. Retain proof-note and public-source attribution; remove prohibited bundled material through an explicit transformation. Preserve source `independent_final_verification: NOT_RUN` as historical; new replay is a separate receipt. |
| TUZA-17 Ramsey record | `sources/literature/r35_13.g6` is the actual finite scientific input; `critic_catalogue.py` decodes it and checks isomorphism/independence/matching controls | Retain small attributed graph6 record (or verified deterministic re-encoding) with its hash. Downloaded `mckay_ramsey_20261104.html` is receipt-only input. The program does not recompute catalogue completeness, which remains a declared external input for the lambda=9 elimination. |
| TUZA-18 common-vertex | `review/star_fresh_verify.py` from the accepted review/replay snapshot | Self-contained standard library, 41,984 exhaustive cases plus ten targeted runs. Original only fixed output is `private preparation output`. Copy/adapt output to explicit fresh location; compare semantic results ignoring elapsed/self-hash fields. Do not use private Git-authenticating `run_replay.py` as a fresh-clone entry point. |
| TUZA-18 chain / TUZA-19 plateau | TUZA-18 `checks/late_star_connected_chain_verify.py`; TUZA-19 `evidence/source_audit/chain_reconstruction_check.py` | Self-contained literal construction. New guard for the latter; N=3 `(17,49,48)`, nu=12, minimum SUPPORT cover 24, 729 states, 560 compatible, min symmetric difference 4, plateau checks N=2..10. Not unrestricted minimum cover; Mac common-vertex replay is not this evidence. |
| TUZA-18 decisive negative witnesses | `apex_witness_verify.py`, `apex_pruned_verify.py`, `apex_role_witness_verify.py`, `apex_type1_embedding_verify.py`, `criticality_type0_nonmaximum.py`, `criticality_identification_wheel.py`, `criticality_identification_star_repair.py`, `late_cover_verify.py`, `late_star_literal_verify.py`, `late_compression_verify.py`, `late_compression_rook_verify.py`, `late_compression_cone_verify.py` | Most are self-contained. Pruned checker reads `evidence/apex_pruned_voltage.json`. Identification star-repair imports the small wheel optimizer. Cone compression reads the rook output, so run rook first in output copy. Preserve distinction between explicit lower/upper bounds and exact optimum. |
| TUZA-19 WKE finite independent reconstruction | `review/four_branch_wke_fresh_verify.py`; `evidence/four_branch_wke_fresh/canonical_witnesses_input.json` | Pinned to canonical table hash above. Distinct from Lean; no producer checker import. |
| TUZA-19 CP5 exact data | `checks/fresh_clique_link_audit.py`; `evidence/clique_link_fresh/clique_link_control.json` | Literal input pinned to `a27c52c171bb0dcade1ce16678484c61e90dc1e5679643bd606feb7b911e6156`; 370 C4 leaves, 780 edge pairs, 80 TF covers, ten link distributions and clique data. Standard library. The exact optimum claims still name ordinary parity/Mantel inputs. |
| TUZA-19 K_(2,2,2,2) base | `checks/batched_odd_cover_fresh_base.py` | Self-contained eight triples, stdout receipt only. Remove private environment path from docstring; keep no-huge-graph/no-all-size-replay scope. |
| TUZA-19 nine-vertex control | `checks/fresh_tf_light_wedge_verify.py`; `evidence/tf_light_wedge_fresh/inverse_n9.json` | Standard library literal exact verification: 22 edges,18 triangles,nu6,tau8, all 170,544 seven-edge candidates rejected. TF holds; two-edge resilience fails. No SAT needed. |
| TUZA-19 72-vertex control | `review/codegree_two_fresh_checker.py`; complete `evidence/codegree_two/input_manifest.json` closure | Cwd-relative; run from output-copy root. Manifest covers proof note, two producer scripts (hash-only), `petersen_join.json`, `tf_lift_witness.json`. Reconstructs graph independently; verifies 240 TF covers and 23,220 deletion pairs. Preserve corrected base tau=12, not discarded tau=13. Input proof hash `ae0bd41560dae51e58f5197a46eb5cd62e7859f10fb7aeb2f488178c052da1a4`. |
| TUZA-19 private-pair gate | `checks/fresh_global_private_pair_gate.py` | Self-contained standard library: padded 32-vertex graph has 76 edges and73 triangles; six obstructed core states,2304 profiles,4374 F-maximizers. |
| TUZA-19 distinct concentration control | `review/packing_concentration_fresh_verify.py`; `evidence/packing_concentration_fresh/input_statement.md` | Pinned note hash `7faef08e207c5ef9dbfd58cc3b42820bb42012a451ce9932a7f68e8b598296c4`. This different 32-vertex graph has75 edges and70 triangles. Do not merge its identity with private-pair gate. |
| TUZA-19 CKSU K5 correction | `checks/cksu_prop13_independent.py` | Self-contained mathematics: all15 maximum packings,60 failing printed classification instances, four uncovered triangles for displayed charging. Replace expired clock and provenance-only PDF hash read explicitly. Do not bundle the article. Preserve exact arXiv:2001.00257v2 scope, no existential-main-theorem refutation. |
| TUZA-19 scoped CKSU repair support | `review/cksu_order3_fresh_verify.py`; `evidence/cksu_order3_fresh/input_statement.md` | Pinned note hash `a0a8b8a2c8cdf3e0c028661bef9ce51c7586b13ffaed695ea99aa02ffe2c7ab9`; bounded256 six-vertex completions plus fixed controls, not a graph census/all-size computational proof. |

Optional supporting checks such as line-graph construction, square-cell exact controls and integral private-page controls may be replayed if retained as documented targets. Do not expand search domains. The local diamond-interface impossibility is an ordinary alternating-path proof; there is no reason to fabricate a corresponding finite checker.

The rainbow-number-two kernels should remain a separately documented solver target. They transitively import `checks/global_routes_sat.py`, use an absolute CaDiCaL path and expired cutoff, and provide no DRAT/LRAT/Lean trace. If run, take `--cadical` explicitly, record observed solver version, retain explicit fresh deadlines, and label UNSAT solver-only. Larger rainbow/availability questions and timeouts remain UNKNOWN. No solver target is needed for the standard-library decisive literal replay.

## Scientific input closure and preservation

Do not regenerate producer inputs in the same copy before running an authenticated critic. Producer timestamps/version metadata can change input hashes even with unchanged mathematics. Keep historical evidence and fresh output under separate paths. For a changed public proof note that is also checker input, preserve its original digest and original-to-public transformation, then validate the public checker against the public note hash explicitly.

TUZA-16 `critic_start_hashes.json` currently covers four notes, six scientific JSON inputs and two downloaded articles. Its article hashes are Krivelevich `1c2a2c4fe55d08cff23ccd080bacb4d13b79d391f5329fda4197e974d64e82d1` and Yuster `b05c57063641aa4f663bcf53a87aec98e0501a4c4876b75db1f147b9d9353ccd`. The checker reads these only in its final unchanged-source loop. A public scientific-input hash manifest plus historical excluded-source hash records is the minimal safe adaptation.

TUZA-18's 12,407,568-byte compressed directed corpus expands to118,975,324 bytes and393,643 rows. A read-only decompression scan found no private-home, private-temp, host/IP-pattern or agent/session-key matches in its text. This is only a targeted privacy screen, not a secret-scanner certification. If the archive retains claims about every directed row and the one UNKNOWN, keeping this compact gzipped scientific corpus is defensible; no default rerun is necessary. If omitted as a discovery intermediate, disposition must say so and retain all decisive witnesses, UNKNOWN identity, generator/seed/count boundaries and exact compressed/uncompressed hashes. Do not imply complete per-instance replay from only aggregates.

## Privacy and licensing exclusions

A raw copy is unsafe. Read-only text screens found private-home paths in11 TUZA-16 files,30 TUZA-17 files,36 TUZA-18 files and87 TUZA-19 files; private staging paths also occur. Counts are preliminary and include historical operational files. They are not a final candidate audit and some version-number patterns cause benign IP-like hits.

Exclude private handoffs (`MISSION.txt`, `OWNER_REQUEST.txt`, `PRIVATE_PUBLICATION_HANDOFF.md`), operational governance/environment copies, operational clocks, private source inventories and raw personal provenance where they do not carry a needed mathematical correction. Extract useful mathematical scope/clock history into sanitized authored records. Preserve legitimate mathematical author names and public project identity.

Exclude all downloaded article PDFs, article-page screenshots, full HTML copies, and full/selected text extractions merely consulted for literature checks. This includes non-obvious evidence locations, not only `sources/`: TUZA-16 `evidence/c_pages` and `checks/b_sources`; TUZA-17 `evidence/literature`; TUZA-18 `evidence/apex_primary_cksu.pdf` and `evidence/late_compression_sources`; TUZA-19 CKSU, square-cell, triangle-graph, rainbow and barycentric evidence subtrees. TUZA-19 also contains many `.pdf.txt`, `.selected.txt`, page text and extracted-text files. Retain authored source-audit summaries, exact citations/editions/statement numbers, URLs and content digests; rewrite links to excluded files as source citations or explicitly historical excluded-input records.

No `.git`, `.olean`, `.ilean`, `.ir`, `.lake` package/cache tree, machine executable, temporary screenshot or raw application transcript belongs in the source release. Failed formal sources and small diagnostics can be retained in a clearly excluded historical-attempt area, with privacy scrubbing and no positive-build wildcard.

Privacy must also inspect newly produced command receipts, PDF metadata/text/bookmarks/links, compressed content, staged/new-reachable Git identity, and PR/merge metadata. Fresh raw command logs naturally contain explicit installed paths; retain them privately and publish a scoped sanitized receipt with an original raw-log digest if necessary. Sanitized logs must not be represented as byte-identical original logs. Existing public ancestry is outside anonymization claims.

## Final reviewer handoff

Before final approval, a different fresh-context reviewer should inspect the actual frozen candidate content manifest, source mapping and fresh receipts. The final review should verify all public input closures; ensure fresh formal receipts point only to new objects/logs; inspect all literal type/axiom reports and expected-failure diagnostics; independently check the source adaptation log; and confirm public commands were executed from a fresh public-only copy with unchanged source state. The root's full before/after source comparison must remain the evidence for frozen-source preservation. This preflight neither approves a merge nor claims the required fresh checks have already passed.

## Coordinator-reported first-run orchestration corrections

After delivery, the coordinator reported two orchestration-only failures in the first actual fresh run. These observations were communicated to this reviewer; they were not independently replayed here.

- The pinned `Cli` repository has no compiled library directory and is not imported by RoleWitness. The initial driver unnecessarily required a compiled directory for every pinned package. The coordinator changed the candidate driver to check every package revision/tracked state while constructing `LEAN_PATH` only from installed library directories. Both actual direct Mathlib imports remain required and hashed. No dependency installation is implied.
- `Core.lean` compiled successfully, but its generated audit module failed because `pp.width` is not an option in the pinned native compiler. The coordinator verified and substituted `format.width`. This affects pretty-print orchestration, not accepted mathematical sources or proof modes.

The coordinator then started a separate fresh `formal-02` run, preserving the failed first-run evidence. This report does not infer its completion or PASS. The `private preparation output` implementation draft has not been updated by this reviewer after the coordinator took ownership; the candidate's corrected driver and its final hash are authoritative for the actual run. Final review must inspect that implementation and the actual successful fresh receipts, if obtained.
