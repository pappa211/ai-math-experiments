# Ordinary proof index: TUZA-11-15

All statements concern full actual triangle families, edge-disjoint packings
and actual-edge covers. Internal AI audit is not external peer review. No row
adds a Lean declaration. [Formal declarations](DECLARATION_INDEX.md) retain their
older scope. See the [dependency guide](verification/tuza-11-15/DEPENDENCIES.md).

| Claim | Complete interface and proof | Evidence boundary |
|---|---|---|
| 11 four-edge flat gluing and five-edge reduction | [Proof](problems/TUZA-11/arguments/FLAT_GLUING_AND_KERNEL.md); actual triangle-separated flat pieces, shared edges in boundary | Ordinary with HKT/Parker; not arbitrary five-edge addition |
| 11 later five-edge gluing | [Full proof](problems/TUZA-11/external/FIVE_EDGE_GLUING_COROLLARY.md) | Ordinary using external Liu v1.0.2 plus documented class-9 erratum; historical RUP reused |
| 11 46-triangle kernel | Same original proof and [independent reconstruction](problems/TUZA-11/verification/PROOF_RECONSTRUCTION.md) | Ordinary closed-instance optima/boundary/old-family preservation; no universal forced-state preservation |
| 11 Clebsch obstruction | [Full proof](problems/TUZA-11/arguments/CLEBSCH_PRIVATE_OBSTRUCTION.md), exact JSON and independent checker | Every minimum cover fails the private-only half-cover bridge; Tuza unaffected |
| 12 ordered lift obstruction | [Full A proof](problems/TUZA-12/INDEPENDENT_PROOF_A.md) | Ordinary simultaneous probabilistic finite existence, not enormous-graph enumeration |
| 12 labelled root and weighted cover equality | [Full B proof](problems/TUZA-12/INDEPENDENT_PROOF_B.md) | Claw-free full X(G); exact two-way scalar model; exceptions, ports, parallel edges retained |
| 12 neutral restoration failure | [Exact graph and proofs](problems/TUZA-12/notes/FOUR_PORT_RESTORATION_COUNTEREXAMPLE.md) | Exact (4,5) versus (4,4); auxiliary implication only |
| 13 finite survival and UNKNOWN | [Historical scope](problems/TUZA-13/HISTORICAL_RESULTS.md), [domain ledger](problems/TUZA-13/SEARCH_COVERAGE.json), [ratio audit](problems/TUZA-14B/RATIO_AUDIT.md) | Completed tested domains only; no universal S/E; original unknowns retained |
| 13 minimal S-failure conditions | [Structural proof](problems/TUZA-13/notes/STRUCTURAL_ATTACK.md) | Conditional minimal-failing-pair quantifiers; not sufficient conditions |
| 14 exact cover exchange | [Full proof](problems/TUZA-14/notes/EXCHANGE_CHARACTERIZATION.md) | Forced blue resources plus exact vertex cover; empty exchange can return same cover |
| 14 witnesses and E-minimal reductions | [Workbook](problems/TUZA-14/PROOF_WORKBOOK.md), [Track A](problems/TUZA-14/notes/TRACK_A.md), [Track B](problems/TUZA-14/notes/TRACK_B.md) | Unique witnesses pack together; safe prescribed prepacking and global progress are false |
| 14B low-packing preservation / S | [Exact T1/T2 targets](problems/TUZA-14B/verification/FROZEN_TARGETS.md), [full proof](problems/TUZA-14B/PROOF_AND_OBSTRUCTIONS.md) | S for tau <= 8 or nu <= 4 with declared Parker/Liu; exact pair and every-cover quantifiers retained |
| 14B blocks and slack | [T3 reconstruction](problems/TUZA-14B/verification/INDEPENDENT_PROOF_AUDIT.md) | Literal edge-disjoint blocks; mixed two-slack r = 0,2 or >= 4; kernel k=7 separate finite statement |
| 14B attachments and books | [Full derivation](problems/TUZA-14B/notes/TRACK_B.md) | Distinct roots, residual H-D; b >= 1 integer; book q designated-cover only |
| 14B fractional gap / signed cut | [T5 full reconstruction](problems/TUZA-14B/verification/INDEPENDENT_PROOF_AUDIT.md) | Full LP + Furedi; strict parity-gap endpoints; cut conditional on admissibility and combined bipartiteness |
| 15 T0 | [Full proof](problems/TUZA-15/PROOFS_AND_OBSTRUCTIONS.md), [donor 7/B2](problems/TUZA-15/notes/SCOUT_B_RESULTS.md), [donor 8](problems/TUZA-15/notes/SCOUT_B_DEGREE8.md) | Every finite simple G with mad < 7: tau <= 2nu and equality iff literal full shared-edge K4/K5 support. Ordinary computer-assisted; prior inequality Puleo |
| 15 symbolic reduction interfaces | [All hypotheses](problems/TUZA-15/verification/FROZEN_TARGETS.md), [separate reconstruction](problems/TUZA-15/verification/INDEPENDENT_PROOF_AUDIT.md) | Combined minimality; exact R6/TWIN/THIN/DOM/BIP/SUN outside-page and footprint conditions |
| 15 finite six-link dependency | [Certificate](problems/TUZA-15/evidence/six_link_certificates.json), [independent checker](problems/TUZA-15/checks/independent_six_links.py) | Exhaustive 32768 labelled inputs; 11982 eligible, 57 disjoint orbits; symbolic obligations remain separate |
| 15 locally bipartite strictness | Full proof Section 8 and frozen LB target | At least one triangle, no sparsity bound; prior inequality attribution retained |
| 15 intermediate/derived scopes | Full proof Sections 13/17 | mad < 25/4 intermediate; maximum degree <= 6 derived; not additional breakthroughs |
| 15 SEP / high-degree subsumption | [Exact optional targets](problems/TUZA-15/verification/FROZEN_TARGETS.md) | All piece/deletion/tightness assumptions for SEP; k >= 10 subsumption in minimal combined obstruction for HIGH10; neither used for T0 |

General S/E, unrestricted Tuza/equality and the remaining seven-regular equality
question are OPEN. No universal repair for arbitrary balanced reductions is proved.

## Current continuation: TUZA-16–19

Unrestricted Tuza remains unresolved. The [15 November guide](RESEARCH_STATUS_2026-11-15.md), [full report](papers/tuza-16-19-research-summary/main.md), and [complete claim/evidence inventory](verification/tuza-16-19/CLAIM_EVIDENCE.md) extend this index without changing older entries.

| Interface | Complete statement/proof | Evidence boundary |
|---|---|---|
| Fixed-palette obstruction, twin and copy identities | [TUZA-16 proofs](problems/TUZA-16/PROOFS_AND_OBSTRUCTIONS.md) | Ordinary / published approximation inputs; 66 K10/K11 certificates and finite controls freshly replayed; GF4 optimum 20/21 unresolved. |
| AC for eligible b≤6 | [TUZA-17 proofs](problems/TUZA-17/PROOFS_AND_OBSTRUCTIONS.md) | Rainbow H, induced triangle-free link, existential minimum-cover quantifier. Catalogue input only in later b=7/cover9 elimination; full-instance realization unknown. |
| Original common-vertex packing cover | [Theorem](problems/TUZA-18/notes/criticality_star_pk_theorem.md), [local corollary](problems/TUZA-18/notes/criticality_star_local_dichotomy.md) | Ordinary; original A(P), nonuniversal vertex allowed; 0→1/1→2/2→3 stability. Finite checks are supporting evidence; no Lean theorem. |
| Chain strict-descent obstruction / plateau repair | [Chain](problems/TUZA-18/notes/late_star_connected_pivot_obstruction.md), [repair](problems/TUZA-19/review/chain_plateau_control.md) | Specified minimum support cover, one triangle component; family-specific equal-cost plateau sequence. |
| Four-branch WKE / five-core | [Proof](problems/TUZA-19/notes/root_four_branch_wke.md), [scope](problems/TUZA-19/notes/four_branch_wke_scope_addendum.md) | Ordinary all-size reductions; 5,375-case finite Lean kernel. Some R⊆G[K], not necessarily G[K]. |
| Quantitative normalization and additive equivalence | [Batching](problems/TUZA-19/notes/root_batched_universal_tf_nonwke.md), [rates](problems/TUZA-19/notes/root_subexponential_normalization_corollary.md) | Fixed 1/2<a<1, uniform eventual error and simultaneous conditions; no resilience/minimality preservation. |
| Normalized odd-cover obstruction | [Construction](problems/TUZA-19/notes/root_batched_odd_cover_obstruction.md), [identity](problems/TUZA-19/notes/root_batched_odd_cover_exact_identity.md) | Ordinary finite-existence seed, tau<2nu<pi; resilience unestablished, H-O2 intact. |
| Local marginal obstruction | [Full proof](problems/TUZA-19/notes/global_routes_bounded_stars_all_cliques.md) | Every fixed star budget plus all original cliques; first marginals only, not consistent joint moments or cover inequalities. |
| Positive square/line/private-page classes | [Square cells](problems/TUZA-19/notes/global_routes_square_cells_matching.md), [simple-root line graphs](problems/TUZA-19/notes/root_line_graph_parity.md), [private pages](problems/TUZA-19/notes/root_multi_private_integral_cover.md) | Complete scoped ordinary interfaces, no general availability theorem. |

[Dependencies](verification/tuza-16-19/DEPENDENCIES.md), [source transformations](problems/TUZA-16-19-SOURCE_MANIFEST.json), [fresh finite receipt](verification/tuza-16-19/finite/VERIFICATION.json), and [formal scope](verification/tuza-16-19/README.md) are separate. Historical NOT_RUN statuses remain historical; no solver-only UNSAT or UNKNOWN is promoted. New literal formal declarations are added only after compilation to DECLARATION_INDEX.md.

## Final archive: TUZA-20–26 (17 November 2026)

**Series paused; unrestricted Tuza unresolved.** The [archive index](TUZA_20_26_ARCHIVE.md) and [current guide](RESEARCH_STATUS_2026-11-17.md) supersede historical continuation recommendations. Every mission has a final scope/corrections page and exact original claim/declaration ledger. [Source-to-public mapping](problems/TUZA-20-26-SOURCE_MANIFEST.json) accounts for every tracked input; [publication verification](verification/tuza-20-26/README.md) distinguishes fresh checks from inherited evidence.

R2’s formal conclusion is equality restoration, not full CS. The forest theorem assumes a supplied forest cover, not its universal availability. M0 and the later Q/parent arguments are deductions at explicit conditional hypotheses. TUZA-26’s selected actual residual is not a separately minimized Q. Historical finite and solver statuses are not upgraded by this archive.
