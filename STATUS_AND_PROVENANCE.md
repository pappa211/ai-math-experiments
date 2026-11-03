# Status and source-specific provenance

**AI-developed mathematical research report — AI Math Experiments**

All triangles are the full triangle family of their graph. All claimed cover
witnesses use actual graph edges. Finite vertex types include arbitrary outside
and isolated vertices. Literal types below, not informal abbreviations, govern
formal scope. Source mathematical files and pin files are byte-identical copies;
curated ordinary notes have explicit historical-status and path annotations.

Unrestricted Tuza is OPEN. Historical priority is UNESTABLISHED. Every item below
has AI-only internal review; none has external human peer review. TUZA-01–06 files
are unchanged from public baseline `b7b0e4fa66bd3effa64f0905eb497818f264b25c`.

## Current ordinary results: TUZA-11-15

The [claim-by-claim ordinary-proof index](ORDINARY_PROOF_INDEX.md) gives exact
interfaces, full proofs, finite dependencies and conditional/open status for
TUZA-11,12,13,14,14B,15. The controlling headline is the combined equality
classification for finite simple graphs with mad < 7. Puleo's inequality is
prior work; equality and restoration are ordinary computer-assisted arguments
with separate internal AI verification. Locally bipartite strictness requires
at least one triangle and no sparsity bound. S/E remain open generally.

Full T0 supporting interfaces (including optional SEP/HIGH10) are in the
[verified target inventory](problems/TUZA-15/verification/FROZEN_TARGETS.md).
The [14B target inventory](problems/TUZA-14B/verification/FROZEN_TARGETS.md)
retains all every-cover/distinct-root/designated-cover, strict fractional-gap
and conditional combined-clause bipartiteness hypotheses.
[Dependencies](verification/tuza-11-15/DEPENDENCIES.md) and
[source transformations](problems/TUZA-11-15-SOURCE_MANIFEST.json) are separate
from the [fresh finite replay receipt](verification/tuza-11-15/REPRODUCTION.json).
No ordinary result is represented as a new Lean declaration. Historical source
and verification records below retain their original scope.

## Mathematical statement ledger

| Statement | Actual declaration / complete literal interface | Ordinary proof | Status and exact boundary |
|---|---|---|---|
| TUZA-06 combined result | Existing `Tuza06.five_degenerate_combined`; [published interface](problems/TUZA-06/FORMAL_STATEMENT.md) | Existing five-degenerate paper | Previously Lean-proved for all five-degenerate finite simple graphs; equality exactly literal K4/K5 triangle support. Frozen sources unchanged; not newly rebuilt here |
| B1 constructive, gain, scalar, strict | `Tuza07.b1_constructive`, `new_triangle_gain_witness`, `b1_scalar`, `b1_strict`; [Targets](problems/TUZA-07/b1b2/lean/Tuza07/Targets.lean), [Completion](problems/TUZA-07/b1b2/lean/Tuza07/Completion.lean) | [Gain-one](problems/TUZA-07/notes/GAIN_ONE_THEOREM.md), [constructive](problems/TUZA-07/notes/CONSTRUCTIVE_AND_STAR_THEOREMS.md) | Lean-proved. H≤G, H block-type, nonempty full new family for constructive/gain. Gain-one scalar assumes exact packing increase one. Strict requires a new triangle with ≥2 old support edges. Ordinary one-apex/star notes are not included among these Lean claims |
| Unchanged optima | `Tuza07.no_new_triangles_optima`; [Basic](problems/TUZA-07/b1b2/lean/Tuza07/Basic.lean) | Gain-one note | Lean-proved when full new family empty |
| B2 exact equality and converse | `Tuza07.b2_full`, `b2_converse`, `configurations_exclusive`; [Main](problems/TUZA-07/b1b2/lean/Tuza07/Main.lean), [configuration definitions](problems/TUZA-07/b1b2/lean/Tuza07/Targets.lean) | [Equality proof](problems/TUZA-07/notes/GAIN_ONE_EQUALITY_RIGIDITY.md) | Lean-proved. Exact gain one and tau=2h+2 yield precisely full unsupported K4 or full K4→K5 promotion. ALL new spokes avoid ALL old support. Converse has same support compatibility |
| Literal component identities | `Tuza07.newK4_component_identities`, `promoted_component_identities`; [Configurations](problems/TUZA-07/b1b2/lean/Tuza07/Configurations.lean) | Equality proof | Lean-proved identities and unchanged other components follow from full family equalities; not assumed as extra conclusions |
| Three/four-edge addition consequences | Ordinary corollaries in source proof | Gain-one and equality notes | Consequences of B1/B2, not separate mathematical headlines or newly named Lean theorems |
| A1.1 | `TuzaA1.a11_verified`; [Main](problems/TUZA-07/a1/lean/TuzaA1/Main.lean), [Targets](problems/TUZA-07/a1/lean/TuzaA1/Targets.lean) | [Criticality package](problems/TUZA-07/notes/CRITICALITY_PACKAGE.md) | Conditional Lean proof: hypothetical edge-minimal Tuza violation; nu(G-e)=k, tau(G-e)=2k, tau(G)=2k+1; every edge in a triangle |
| A1.2 | `a12_verified`, `a12_small_verified`, `resilience_arithmetic_iff` under TuzaA1; Targets and [Criticality](problems/TUZA-07/a1/lean/TuzaA1/Criticality.lean) | Criticality package | Conditional Lean proof: nonempty actual S, loss≤floor((|S|-1)/2); deletion of ≤2 edges preserves nu |
| A1.3 | `a13_extension_verified`, `a13_one_verified`, `a13_two_verified`; [Extension](problems/TUZA-07/a1/lean/TuzaA1/Extension.lean) | Criticality package | EVERY prescribed edge-disjoint packing of one/two triangles extends. Two-triangle residual has tau+5=2k OR tau+4=2k; no truncated negative alternative at k=2 |
| A1.4 | `a14_verified`, `labelled_spokes`; [Wedge](problems/TUZA-07/a1/lean/TuzaA1/Wedge.lean) | Criticality package | Exact nested graph deletion, wedge losses and all maximum residual packings. Conditional on minimal violation, not arbitrary tightness |
| A1.5 | `a15_verified`; [Codegree](problems/TUZA-07/a1/lean/TuzaA1/Codegree.lean) | Criticality package | Conditional minimum triangle codegree TWO. No codegree-three theorem. Ordinary component-connectedness was not formalized |
| Cover-switch CS1–CS5 | `Tuza08.cs1_verified`–`cs4_verified`, `cover_switch_verified`; [Targets](problems/TUZA-08/lean/Tuza08/Targets.lean), [Main](problems/TUZA-08/lean/Tuza08/Main.lean) | [Complete exchange proof](problems/TUZA-08/notes/COVER_SWITCH_PROOF.md) | Lean-proved for arbitrary graph: four distinct labels, uv absent, exactly {a,b} common neighbors, equal-cardinality actual covers with pair containment and opposite-pair avoidance. CS4 additionally minimum t and no mixed minimum. Neutral is orientation-neutral, not triangle-free |
| Sharpness W7 / packing obstruction W8 | No symbolic Lean declaration | Exchange proof and [exact witnesses](problems/TUZA-08/notes/COUNTEREXAMPLES_AND_TESTS.md) | Ordinary exact graphs and freshly independently checked finite certificates. W7 (4,5), r3,q2 is NOT tight; W8 (6,8) lacks pair-containing minimum covers |
| K5/K6 optimal nonsplittable 2-covers | No new Lean theorem | [Multicover](problems/TUZA-09/notes/MULTICOVER.md) | Ordinary proofs; costs8/12. K5 budget-tight4nu=8; K6 budget has slack. Both admit one half-cost ordinary cover. CKSU K6 source trace is not full construction reproduction |
| Two C5 cones / Petersen cone | No new Lean theorem | Multicover and [LP geometry](problems/TUZA-09/notes/LP_GEOMETRY.md) | Ordinary proofs and exact primal/dual checks: (nu,tau,nu*,M2)=(4,6,5,10); Petersen cone (5,6,5). Refute rounding/gap routes, not Tuza |
| TUZA-09 support translation / R | No new Lean theorem | [Exact formulation and translation](problems/TUZA-10/notes/RAINBOW_FORMULATION.md) | Ordinary proved translation requires OPTIMAL zero/half cover and triangle-free positive support. Abstract properly colored triangle-free vertex-saturated/color-capacitated R remains UNPROVED; no general-Tuza reduction |
| Colored Petersen forced 1/3 | No new Lean theorem | [Exact row identity, colors, optima](problems/TUZA-10/notes/HALF_INTEGRAL_OBSTRUCTION.md) | Ordinary exact identity V0+V1−V2−V4−V5−V6+C0+C3+C4=3x01=1. vc6,rho4; NOT a counterexample to R, and NOT realizable by the specific graphic-support construction |
| Realization closure / rejected constructions | No new Lean theorem | [Proofs and objections](problems/TUZA-10/notes/PROOFS_OR_OBSTRUCTIONS.md) | Repeated-color three-edge path forces alternating C4 closure in graphic support. Necessary, not sufficient characterization. Abstract Petersen/C9 violate it. Squared-seven-cycle hub proposal wrongly omitted all-positive triangles |
| Cycle theorem / 5/3 proposal | No new Lean theorem | Proofs and objections | Ordinary known-method deduction for disjoint cycles length≥4, proper colors multiplicity≤2: vc≤2k+9/5(rho−k)≤2rho; k alternating bichromatic C4 components. 5/3 valid with no residual C5/C7; general strengthening UNPROVED. Color-line/Brooks credited |

## Literal formal evidence and full declaration inventory

The compiler's `pp.all` output prints complete types, implicit parameters,
universes and proof terms. Wrapper proposition types must be read together with
their unabridged definitions in Targets.lean. The complete logs are faithful
fresh candidate evidence, not a hand-translated theorem statement. Their axiom
reports are checked against the standard allowlist. The declaration lists also
include supporting lemmas; headline status does not expand because a helper was
audited. `DECLARATION_INDEX.md` maps all inventoried names to source and exact log
line. No mathematical hypotheses are elided by an informal headline.

### B1/B2 block-type extensions

[Literal types and proof terms](verification/tuza-07-10/b1b2/literal-types-and-axioms.log) · [axioms](verification/tuza-07-10/b1b2/AXIOMS.json) · [build/replay receipt](verification/tuza-07-10/b1b2/VERIFICATION.json) · [declarations](problems/TUZA-07/b1b2/declarations.json).

### A1 conditional criticality

[Literal types and proof terms](verification/tuza-07-10/a1/literal-types-and-axioms.log) · [axioms](verification/tuza-07-10/a1/AXIOMS.json) · [build/replay receipt](verification/tuza-07-10/a1/VERIFICATION.json) · [declarations](problems/TUZA-07/a1/declarations.json).

### arbitrary-graph cover switching

[Literal types and proof terms](verification/tuza-07-10/cover-switch/literal-types-and-axioms.log) · [axioms](verification/tuza-07-10/cover-switch/AXIOMS.json) · [build/replay receipt](verification/tuza-07-10/cover-switch/VERIFICATION.json) · [declarations](problems/TUZA-08/declarations.json).

## Evidence boundaries and historical positioning

The separate fresh closures have 25/12/11 modules and 67/46/192 audited declarations.
Native compiled dependencies were reused; neither cold dependency/compiler build
nor independent-kernel implementation is claimed. The source manifest records
original/candidate SHA-256 and each curated transformation. The private owner
package retains exact closeout Git identities; no private Git history enters this
candidate. Mathematical source hashes, not private directory names, identify the
public archives.

Targeted primary-source comparisons and exact edition dates are in
[LITERATURE_RECHECK.md](papers/tuza-further-investigations/LITERATURE_RECHECK.md).
Puleo local reductions, HKT cone/stability constructions, Aharoni–Zerbib graphic
pair structure, Parker's small-packing result, CKSU normalized multicovers,
Chapuy's theorem-body +1, Liu–Zeng density equivalence/c<2, bounded-degree
preprints, current constant preprints, and rainbow/color-line methods are credited.
Search absence does not prove novelty. No full third-party proof or companion
catalogue replay is implied by inspecting a theorem statement.
