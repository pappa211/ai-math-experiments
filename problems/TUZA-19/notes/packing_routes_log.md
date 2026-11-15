# Packing routes log — TUZA-19

Shared start 2026-11-15T01:53:58Z; research cutoff 09:23:58Z; hard deadline 09:53:58Z. Requested agent configuration Astra/Ultra; no independent serving identity exposed. Local host read returns Darwin; native environment is migration/env.sh. All archives remain read-only.

## Frozen source reconstruction

Read TUZA-18 tag tuza18-final-checkpoint, resolving to 57708a8413929012d9ca8d15b0f925b3ef6b51e8, including REPORT, STATUS_MATRIX, star theorem, star gluing gates, connected chain and review. The maximum-star theorem fixes ORIGINAL A(P). The chain defeats bounded strict descent from its specified support minimum; compatible covers and nonincreasing one-edge plateau paths exist. No global star-packing occurrence is assumed.

## Gate P-1: minimum support-cover plateau path

For every finite simple G with a specified maximum all-type1 triangle packing P and every minimum B-contained triangle cover C, there is a sequence of minimum B-contained covers from C to one with Hall deficiency zero, each step replacing one selected edge and never increasing heavy-to-light Hall deficiency. If true, existence of such a terminal cover proves support-cover size at most 2|P| for this packing class by the frozen heavy/light equivalence. This is a type1 substep of PK/SG, not a complete unrestricted reduction; mixed type0/K4 states remain unproved.

Weakest link: minimum-cover reconfiguration may have trapping components or positive-deficiency plateaux. K5 already has disconnected one-swap minimum-cover states (residual C4), but all such states are individually compatible, so connectivity is not the target. Consequential test: exactly analyze all minimum states and directed nonincreasing-swap reachability for the previously frozen 36,218 complete literal controls. Stop at first failure, otherwise seek structural explanation and do not extend a census merely because it survives. Script checks/packing_routes_plateau.py reads original inputs directly, reconstructs every actual triangle and private base, and imports old maximum-packing/optimum status only for screening. Any decisive witness requires separate exact verification.

P-1 outcome: old source exhausted, 36,218 eligible rows and 74,698 minimum states, including 355 Hall-deficient states; no trap. This screening adds no decisive discrimination because TUZA-18's stronger strict-one-pivot test already passed this same corpus. The run and identity survive in evidence/packing_routes/plateau_corpus.json. A statistic initially labelled max_deficiency was a sum of row maxima (331); it is corrected to sum_of_row_max_deficiency in script/receipt without rerunning mathematics. Source audit independently derives the chain's optimal nonincreasing plateau path. No larger census follows.

## Gate P-2: choose a concentrated maximum packing

For any maximum packing P maximizing F(P)=sum_v d_P(v)^2, every private page ab z of T=ab c has d_P(c)>d_P(z): swapping T for the private page preserves cardinality and changes F by 2(d_P(z)-d_P(c)+1), so nonpositivity forces the strict integer inequality. This is a genuinely available selection condition, not an assumed star grouping. It also makes the directed graph from opposite packed vertices to their private apices acyclic.

Exact initial subgate: every all-type1 maximum packing satisfying all these local degree inequalities has a minimum support cover respecting the canonical opposite-base centre budgets. This would prove the pure-type1 selected-packing route if the selected maximum packing is all-type1. Type0/K4 mixing remains a separate global obligation. Weakest link: the ordering condition may not pay the cross-centre constraints. Consequential test reuses the frozen corpus, filters by the new condition, and stops at a canonical-budget failure; in that event it enumerates maximum packings of the witness to distinguish the local relaxation from global concentration optimality. No implication for all graphs is claimed from type1 survival.

P-2 finite outcome: all 393,643 source rows exhausted; 15,741 complete rows satisfy every local concentration inequality and all have a canonical-centre compatible minimum support cover; 20,477 complete rows fail the new hypothesis. No theorem follows. This is a different selection condition; all old canonical failures lie outside it. A failed shell command (`python` called before sourcing migration/env.sh) prevented an intended main-guard edit, so P-2's import reran P-1 once on its identical old domain and overwrote the prior receipt; counts unchanged, both elapsed times retained in the corrected receipt. Main guard is now installed. No source/archive writes occurred.

P-2 is REFUTED. A symbolic eight-vertex core has acyclic private arrows a->y,c->y,y->z and all strict packing-degree inequalities, but its canonical singleton quotas fail. Six neutral K5 vertex-sum pads make the same obstruction globally F-maximal and globally lexicographic-degree-maximal among ALL maximum packings. The32-vertex witness has nu15,70 actual triangles and support minimum29; arbitrary-centre SG succeeds explicitly. Every all-type1 maximizer for either objective still has the obstructed core assignment. Exact theorem, proof, scope and all quantifiers: notes/packing_routes_concentration_obstruction.md. Standalone literal/profile check passed, recording all edges/triangles/private states and1280 exhaustive degree profiles in evidence/packing_routes/concentration_witness.json. Independent review requested from parent. Do not infer that canonical failure refutes arbitrary-centre SG or any cover bound.

Independent fresh-context review completed: review/packing_concentration_fresh_audit.md reconstructs the frozen statement without producer code/results, confirms the theorem, and supplies its own verifier. It identified one minor invalid shortcut (coarse degree bounds alone do not show F0<=15); the originally offered exact20-case argument was valid. The explicit analytic replacement is in notes/packing_routes_concentration_addendum.md; frozen proof hash unchanged. Audit also certifies unrestricted tau29,1,458 F/lex maximizers,729 all-type1 maximizers, and failure for all729.

Private-fibre route frozen at notes/packing_routes_private_fibre_gate.md. A common-apex4-for3 exchange applies locally inside arbitrary private-apex fibres, without claiming a globally common apex. It gives degree/mate restrictions on internal pair constraints. Abstract2C5+5K2 satisfies those restrictions yet has alpha9<10 matepairs, so they are insufficient alone. No actualgraphrealization asserted. Cross-fibre lending/rigidinterfaces and all-U triangleconstraints remainuncontrolled. This scoped halfset pursuit stops for lack of a boundary-compatible integral mechanism; no furthercensus.

Primary-source qualification: inspected CKSU arXiv2001.00257v2 originalPDF Sections2–4. Proposition13's printedexhaustiveness is refuted byK5, independently confirmed by source_audit; Lemma18's distinct unique-private-page recipient statement isvalid. The sourceaudit retainsPDF andliteralcertificate. Do notimport thefalseexhaustiveness or claim that themain existentialmulticovertheorem is refuted. The newconcentration obstruction is independentofthat source.

## Gate P-3: optimized packing and arbitrary-centre minimum-cover Hall condition

Distinct from the now-refuted canonical-centre rule: for a globally F-maximal all-type1 P, does every minimum support cover admit an arbitrary-centre Hall matching? This would imply the type1 support bound whenever a global F maximizer is all-type1, but mixed-state availability is still missing. A weaker existential-minimum-cover statement would suffice, and a plateau-reachability statement is another distinct strengthening.

The first discriminator checked ONLY the frozen seven-vertex gluing block over all50 maximum packings and their minimum support covers. Exactly10 packings are all-type1; eight have some Hall-deficient minimum and have private-arrow cycles. The other two are acyclic, achieve the true global F maximum24, and each has16 minimum support states, all Hall-compatible. Both have a common external private apex5, centres0 and7. This is one fixed-witness quantifier check, not an unrestricted proof. Evidence: checks/packing_routes_old_block_selection.py; evidence/packing_routes/old_block_Fmax_Hall.json. The script was preserved from the completed inline calculation without rerunning it. Parity supplies the maximum-size upper bound.

A structural implication from arbitrary Hall deficiency to a private-arrow cycle or a feasible concentration-improving batch has NOT been proved. No larger census follows from this survival.

## Gate P-4: simultaneous private-page rotation

The concrete equal-size move and exact type3 ledger are frozen in notes/packing_routes_page_rotation.md, SHA25638d665979b25527e5adb983e1d42773ba2f96a4ca98b427e99eceedd918adc10. All rotated owners share a canonical centre x and have private pages at z; their bases are a matching. The new support replaces x-spokes with z-spokes. Rotated members remain type1. Exact spoke tests identify created and lost type3 members; a type3-first lexicographic objective gives created<=lost, and a secondary F inequality is valid only at equality. This objective is distinct from F-first and must not inherit its unconditional degree inequalities.

An all-size fan of private K4s sharing one new spoke shows one rotation can destroy arbitrarily many type3 states. Those shared interfaces also give a cheap cover, so counting losses alone throws away necessary information. Producer checker checks/packing_routes_rotation_verify.py passed195 rotations over59 fixed control packings; full triangles and all old/new type states are retained in evidence/packing_routes/page_rotation_verified.json. No broad graph census or universal result follows from those checks. Independent challenge requested. The missing global step is a cover transfer that pays every mixed interface and all residual triangles using the shared-edge savings; no such availability or transfer theorem is claimed.

## Lane handoff — active research stopped at coordinator instruction

The coordinator instructed this lane to freeze and stop active research pending an independent challenge of the page-rotation statement. No additional census is authorized or planned by this handoff. The original mission clock is unchanged; parent continues the overall mission.

Strongest completed result: the32-vertex concentration obstruction, including EVERY all-type1 square-degree/lex-degree optimizer, has a complete ordinary proof plus fresh independent AI reconstruction and independent exact finite verification. The frozen proof remains unchanged; its minor coarse-bound shortcut is replaced explicitly in the addendum. It is not a Tuza counterexample: unrestricted tau29, nu15, and arbitrary-centre SG succeeds.

The private-fibre lemma and page-rotation ledger are ordinary proof drafts, not yet independently reviewed at this handoff. Producer literal checks support the rotation ledger only on the recorded fixed controls. The rotation proof is frozen at SHA25638d665979b25527e5adb983e1d42773ba2f96a4ca98b427e99eceedd918adc10. The concentration proof is frozen at SHA2567faef08e207c5ef9dbfd58cc3b42820bb42012a451ce9932a7f68e8b598296c4. The lane handoff manifest records current hashes of the addendum, all local proofs, scripts and receipts.

Exact replay commands, run from the TUZA-19 workspace on the authorized Darwin host:

```sh
source LOCAL_ENVIRONMENT
python checks/packing_routes_concentration_witness.py
python review/packing_concentration_fresh_verify.py
python checks/packing_routes_rotation_verify.py
python checks/packing_routes_old_block_selection.py
```

The first two commands reconstruct the concentration witness using independent implementations. The third checks195 rotations on59 fixed graph/packing controls; the fourth exactly checks the old seven-vertex block's50 maximum packings and all type1 minimum-cover states. Their source pins and complete finite scopes are recorded in the corresponding receipts. The two old-corpus discriminator scripts can be replayed separately if needed; neither successful finite screening supplies a universal statement, and the P-1 duplicate import execution is disclosed above.

Unresolved global obligation: a coordinated private-page rotation must be coupled to an integral triangle-cover transfer that pays EVERY triangle meeting multiple affected/unaffected packed groups. The exact type3 count inequality created<=lost is insufficient, since one rotation can lose arbitrarily many completions. Their shared new-support edges yield local cover savings, but no theorem here converts those savings into a boundary-compatible cover of arbitrary graphs. Mixed type0/type1/private-K4 states remain material. The Fmax/every-minimum-support-cover Hall gate remains open after its single fixed-witness discriminator. No unrestricted proof or graph counterexample candidate emerged in this lane.
