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
