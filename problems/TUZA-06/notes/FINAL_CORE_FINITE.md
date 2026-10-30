> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Final-core finite certificates and interface audit

Frozen Lean source: `lean/Tuza06/FinalCoreFinite.lean`.
SHA-256: `06f25eddcd011506681b4b191c5069e4162da266bf7fa94b0ef1b075f032d88b`.
Successful complete compiler log: `logs/compile-180052-Tuza06.FinalCoreFinite.log`.
Compile interval: 2026-10-30T18:00:52.809371Z through 18:02:42.728580Z (109.919209 seconds), exit status zero.

## Definition fidelity and completed finite results

The labels are 0=u, 1=v, 2=w, 3=a, 4=b, 5=c, 6=d, 7=e. `A={3,4,5,6,7}`, `U={0,1,2}`. `BEdges` explicitly lists exactly the 23 ordinary final-core edges: A is K5, u joins the other seven local vertices, v joins a,b,c, and w joins a,d,e.

`family` is COMPUTABLE and is the full triangle family determined by BEdges: all vertex triples in Fin8 whose three graph edges are contained in BEdges. It is not a selected packing or hand-picked triangle subfamily. Its definition remains `univ.powersetCard 3 |>.filter (fun t => edges t ⊆ BEdges)`.

Completed declarations:

- `family_valid : Triangles family`.
- `support_subset_BEdges : support family ⊆ BEdges`.
- `packing7 : Packing family P7 ∧ P7.card = 7`, for vua,vbc,wud,wae,uce,acd,bde.
- `cover9 : Covers family C9 ∧ C9.card = 9`, for ua,ub,ab,cd,ce,de,vc,wd,we.
- `pair_six : ∀ f ∈ edges A, ∀ g ∈ edges A, f ≠ g → ∃ P, Packing family P ∧ P.card = 6 ∧ Disjoint (support P) {f,g}`.
- `cover12_initial : Covers family (edges A ∪ {{0,1},{0,2}})`.
- `card_initial_le12 : (edges A ∪ {{0,1},{0,2}}).card ≤ 12`.
- `edges_size : ∀ e ∈ BEdges, e.card = 2`.
- `U_union_A : U ∪ A = univ`.
- `A_edges_subset : edges A ⊆ BEdges`.
- `C9_subset : C9 ⊆ BEdges`.

The pair-sixes use 45 explicit witnesses extracted from the frozen `checks/final_core_certificates.json`, source SHA-256 `9b2bc3c642f759da1e632fb444d1f50f5e8dcc3fa30f02e21174e0d088350791`. A short remote Python generation command only translated the existing named vertices/witnesses into Lean literals. No search was performed. Each literal witness is checked by ordinary kernel reduction. Finite pair dispatch covers the full two-subset type of `edges A`, and the public theorem converts an arbitrary distinct pair to that type. No symmetry coverage is assumed in Lean.

The Lean file has no placeholders, custom axioms, or unsafe/native shortcuts. Final transitive axiom/type audit is a campaign-level task; the complete source and successful compiler log are supplied. Reuse of compiled pinned Mathlib and earlier campaign modules is not a cold dependency rebuild.

## Resource limits and failed approaches

All builds used only `python3 build_serial.py Tuza06.FinalCoreFinite` on the external verification server, sharing the global build lock, serial Lean `-j 1`, `-M 1900`, and a 240-second per-process timeout. No concurrent heavy job was started.

An initial full-family equality proved by bare `decide` exhausted kernel memory, followed by cascading errors. A second approach using `fin_cases` over the 56-triple powerset subtype also exhausted memory. The final source avoids that representation cost: covers are checked using eight small lemmas over two Fin8 vertex labels each, then converted symbolically from an arbitrary three-element set using `card_eq_three`. Packing membership/independence checks quantify over the actual six/seven-triangle witness subtype.

Isolated family/packing7 and cover9 prefixes compiled successfully before the full run. The successful full compile used near the fixed memory cap: an observed snapshot at about 105 seconds reported Lean RSS 1,941,868 KiB. The complete historical build finished within its timeout. Publication reproduction uses the unchanged frozen source and the documented 2200 MiB cap; this measured historical resource use is not a source-change instruction.

## Separate reconstruction of the lead's configuration/reduction interfaces

At 2026-10-30T18:05:50.865252+00:00, I read the actual lead sources without editing them:

- `FinalConfiguration.lean`, SHA-256 `42a3d6896655b806a0fcdc16787f509802f9c58e9d5f9d63649cf746ab245c1d`.
- `FinalCoreReduction.lean`, SHA-256 `4807e290f762a5daf88297af3dd6d1955229621be775ec39c0f6704bbd5cad89`.
- `Reduction.lean`, `GraphOperations.lean`, and `PageAugmentation.lean`.

I found no mathematical or finite/transport mismatch. The configuration equates the full local family with the injective image of Core.family. Its three exact-neighborhood inclusions classify every hub triangle as local or hit by vp/wq; no global bound on other vertices/edges is present. Injective transport preserves the real packings, covers, sizes, and forbidden-edge disjointness.

The numeric/equality sequence is explicit: seven plus the residual packing number is at most the graph packing number; the first cover increment is at most fourteen. Failure together with the residual inequality forces exact equality and graph packing number equal to residual packing number plus seven. Only then does the residual equality-classification premise apply. Two disjoint outside pages would add two to the finite six-packing and compatible residual block packings, a contradiction. The whole outside-page family is therefore intersecting and has a two-edge cover. Nine local edges plus two page-cover edges plus two exceptional spokes give thirteen. The exhaustive lost-triangle split accounts for all graph triangles.

The instantiated strict theorem remains conditional on the residual inequality and on residual equality implying ComponentCliques. It is not the global degeneracy theorem. This source reconstruction is separate from implementation of the lead's numeric/local reduction, while the campaign's final reviewer remains responsible for the final exact source hashes and complete dependency closure.
