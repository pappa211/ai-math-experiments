# Exact checks and literal witnesses

Every graph edge list, triangle list, designated cover, new optimum cover, packing, rational primal/dual vector and applicable cut network is retained in the evidence named below. All calculations are exact; no numerical solver tolerance or historical optimizer import is used. Graph labels are literal. Borrowed witness DATA are explicitly identified by path and SHA-256, and only n/edge/cover/block fields enter the new optimizations. Original mathematical sources remain outside this independently authored evidence directory.

## Algorithms and independent oracles

checks/integral_independent.py reconstructs all actual triangles from adjacency, solves edge hitting sets by exhaustive chosen-triangle branching, collects EVERY optimum cover, and computes maximum actual-edge-disjoint packings by conflict-graph include/exclude recursion. It has explicit state/cover caps and120-second CPU/wall caps for every executed job. Common-apex controls use a separately derived complete cover formula: for each subset U of the triangle-support base, select every spoke outside U and every rim edge induced by U; minimize base_size−|U|+|E(U)|. ALL subsets are enumerated, not just independent sets.

Independent exhaustive edge-subset and triangle-subset oracles agree on every graph through five vertices. Every one of the1,024 subfamilies of K5's ten triangles also agrees on cover optimum, the complete minimum-cover family, and packing optimum. The cone cover enumeration is compared with the generic recursion on all applicable small graphs. These checks validate eligible-family operations as well as full objectives.

checks/fractional_cut_independent.py independently implements its own graph/cover/packing routines, exact Fraction dictionary simplex, and an incidence-based primal/dual certificate verifier. Twenty full/selected-eligible LP certificates pass exact nonnegativity, every resource/cover constraint and equal objective; a corrupted certificate is rejected. Separate solver-free uniform rational witnesses check K5/K6; leaf-face half-weights and the designated dual cover independently check the books. The initial run was fast; a separate reproducibility run under an explicit120-second subprocess wall cap is recorded in evidence/fractional_bounded_run_receipt.json. The checker itself is unchanged between these runs. This second run addresses the original rational run's lack of an explicit process timeout; it is not extra graph coverage.

## Complete bounded labelled domain

ALL33,868 simple labelled graphs on {0,...,n−1},0<=n<=6, and ALL89,419 global minimum-cover pairs are checked. Graph counts by n are1,1,2,8,64,1,024,32,768. S is evaluated by min_C k, E by max_C k; no quantifier is substituted. Both failure counts are zero in this domain. The exact T1 implication, low-k support classification, nu<=3 preservation and tau<=8 threshold are also checked there. This is not an isomorphism census or evidence of universality outside the stated finite domain. Receipt: evidence/integral_census.json.

## Named integral controls

| Control | tau | nu | Number of minimum covers | k over **all** minima |
|---|---:|---:|---:|---|
| K4 | 2 | 1 | 3 | 1 for all 3 |
| K5 | 4 | 2 | 10 | 2 for all 10 |
| K6 | 6 | 4 | 10 | 4 for all 10 |
| K7 | 9 | 7 | 35 | 6 for all 35 |
| Nine-vertex K4-ring | 6 | 4 | 19 | 3 for 1; 4 for 18 |
| Unique-private nonextendibility control | 7 | 5 | 36 | 4 for 2; 5 for 34 |
| Twenty-vertex private-only obstruction | 13 | 9 | 191 | 9 for all 191 |
| Clebsch cone | 11 | 8 | 16 | 8 for all 16 |
| All-red eligible-cover tau-drop control | 7 | 6 | 67 | 6 for all 67 |
| Twelve-vertex one-slack kernel | 11 | 7 | 148 | 7 for all 148 |
| Constructed red-root crossing boundary | 6 | 6 | 1 | 6 |
| Twelve-vertex two-slack kernel 1 | 11 | 7 | 210 | 7 for all 210 |
| Twelve-vertex two-slack kernel 2 | 11 | 7 | 210 | 7 for all 210 |
| Twelve-vertex two-slack kernel 3 | 11 | 7 | 210 | 7 for all 210 |


The14 controls contain1,166 minimum-cover pairs; this overlaps the bounded census and the rational controls. NO combined distinct total is claimed. All four12-vertex kernels are included (148+210+210+210=778 covers). Full literals and optimum packing witnesses for every minimum C are in evidence/integral_controls.json.

The designated ring cover has k3<nu4 but meets target3. The unique-private control has sole private witness468 for red46; global eligible optimum5 but optimum constrained to include468 is4, proving exclusion from EVERY maximum eligible packing for that specified C. The twenty-vertex control has private-only optimum6<ceil(13/2)=7 but eligible optimum9. The Clebsch cone has private-only5<6 but eligible8. The all-red eligibility-drop graph has full tau7 and eligible-family cover optimum6. These reject auxiliary shortcuts, not S/E.

The independently constructed positive T3 boundary is K5 plus a fresh degree-two vertex on each of its six internal-K4 red edges. Its six private crossing triangles force the unique minimum cover size6. Replacing the K5 restriction by a local four-cover uncovers actual private crossing015; an original-C eligible local two-packing avoiding its RED root extends with015 to threshold3. This directly checks the global-optimality/private-root mechanism. The unique-private graph also contains mixed triangles crossing its literal edge-disjoint K5/K4 blocks.

## Local block and endpoint interfaces

- evidence/integral_local.json checks EVERY cover of K4/K5 and every forbidden actual edge, retaining256 cover rows through local minimum+2. All840 size-six K5 cover/RED-root pairs pass. Twenty BLUE-root pairs fail, including the six-red internal-K4 control.
- evidence/integral_t1local.json checks all8 optional apex-edge patterns,20 applicable singleton replacement-cover rows, and every displayed final anchor pair's existence, eligibility, disjointness and avoidance. It classifies all15 forbidden-blue-edge pairs in each two-apex block:3 exceptional pairs for K5 and9 for K5-e. These tables support the global proof; they do not replace it.
- The three K5-plus-five-K3 kernels have block cost9,r5,tau11; the symbolic theorem supplies six. Fresh exact local block optimizations give seven for EVERY one of their210 minimum covers each. The stronger result is FINITE_CHECKED for these literals only.

## Rational and attachment controls

| Graph | τ | ν | τ* | minimum C count | k histogram over all minima | fractional bound / S target |
|---|---:|---:|---:|---:|---|---|
| Fully K4-decorated one-page book |6|4|6|19|3:1, 4:18|3 / 3|
| Fully K4-decorated two-page book |10|6|10|131|5:1, 6:130|5 / 5|
| K5 |4|2|10/3|10|2:10|2 / 2|
| K6 |6|4|5|10|4:10|3 / 3|
| Petersen cone |6|5|5|5|5:5|3 / 3|
| Two disjoint K5s |8|4|20/3|100|4:100|3 / 4|
| Independently chosen C5 wheel |3|2|5/2|10|2:10|2 / 2|
| 12-vertex kernel4c21554d63d3 |11|7|31/3|210|7:210|5 / 6|
| 12-vertex kernel85fe064961fd |11|7|31/3|210|7:210|5 / 6|
| 12-vertex kernel1299d6e8bd49 |11|7|31/3|210|7:210|5 / 6|


Receipts: evidence/fractional_cut_independent.json and the independently bounded repeat evidence/fractional_cut_bounded_recheck.json. Twenty LPs comprise one FULL and one selected eligible system per graph; they do NOT mean an eligible LP reoptimization for all915 covers. Across ALL915 covers, the full optimum's colored mass inequality and the exact eligible integral optimum are evaluated. In the three odd endpoint kernels, full tau*=31/3 differs from the selected eligible LP value10. K5's full/eligible values are10/3 and3; K6's are5 and9/2. Full and eligible LPs are never conflated.

At the odd gap endpoint2/3, the scalar bound gives only5 against target6 in the kernels. At the even endpoint4/3, two disjoint K5s give only3 against target4. Every minimum cover of these controls nevertheless satisfies S. Thus the STRICT sufficient thresholds are supported, while endpoint S failure is not claimed.

For books b1,b2, the designated tuples are (6,4,3),(10,6,5); all other minima have k4,6. Triangle-conflict connectedness is checked from ALL actual triangles. Distinct-root mixed attachments are tested on all their minima, including residual/local minima and the exact k identity. Two K4s attached to the SAME root violate the required hypothesis and have actual tau3 versus naive formula4; that negative control is deliberately outside the theorem.

## Exact signed-cut checks

Four actual colored instances give40 admissible deletion systems and2,880 exhaustive original-blue-subset assignments. Each clause formula is compared directly with ALL actual triangle coverage and eligibility of every fixed packed member. Both clause signs, forced zeros/ones, feasible repairs, positive excess, nonbipartite combined graphs and equality-cost cases occur. Every applicable min-cut matches the direct minimum and has an exact integral net-flow certificate: conservation, capacities, antisymmetry and cut/flow equality are all checked.

Four additional abstract two-variable systems cover16 assignments and three infeasible cases (conflicting units or pairs). They are labelled abstract, not claimed graph realizations. A concrete K4 control dropping a negative pair still covers all triangles but turns the packed triangle all-red. Another actual K4 bipartite instance needs two added blues for one red deleted, rejecting an automatic zero-excess inference.

## Outcomes, limits and reproduction

All five integral jobs and both exact rational runs completed; no timeout, cap or failed assertion is labelled a pass. Initial files/hash receipts are preserved by Git; source data and fresh outputs are separated. Historical20/21 singleton count differences are reconciled in notes/COMPUTATION_COMPARISON.md. Historical million-cover searches, large TUZA14B ledgers and Liu154,874-step RUP verification were NOT rerun. No package install or Lean build was performed.

Current public reproduction, from the repository root with a new output directory:

```sh
python3 tools/check_tuza_11_15.py --output ../tuza-11-15-replay
```

For TUZA-14B this suite repeats the named integral controls, local clique/root
and T1 interface tables, and exact fractional/signed-cut checks. It does not run
the historical integral census or private source-integrity checker. The earlier
five integral jobs and two rational-run scopes above describe the original
verification, not seven commands hidden behind the one public command.
[Shipped finite results](../../../verification/tuza-11-15/FINITE_EVIDENCE_MANIFEST.json)
and [public reproduction guide](../REPRODUCTION.md) identify the current outputs.
Every universal conclusion rests on the
[full mathematical reconstruction](INDEPENDENT_PROOF_AUDIT.md) and declared
inputs, not the finite passing counts.
