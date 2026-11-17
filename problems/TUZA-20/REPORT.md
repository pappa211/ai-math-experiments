> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-20: fixed-packing covers and globally paid lending

**Outcome: REFUTED_CANDIDATE. Recommendation: STOP. Unrestricted Tuza remains unresolved.**

Two precise gain-payment rules failed. The decisive twelve-vertex example shows that selecting every singleton gain can exceed the target even when all gains are distinct, none is already paid as a base, and unused budget may be reused globally. Releasing one gain gives a permitted cover at the target. This refutes mandatory gain selection, not PK-all, PK-exists, or Tuza. No unrestricted global proof obligation was discharged.

## Decisive result

The graph is K5 on {0,1,2,4,5} together with triangles013,036,167,678,189,{8,9,10},{1,10,11},{3,10,11}. Its specified maximum packing is

    P = {013,124,025,167,189,{1,10,11}}.

It has 12 vertices, 29 edges and 26 actual triangles. Every owner has exactly one private page. The mandatory bases and distinct gains are

    R = {03,14,05,67,89,{10,11}},
    F = {16,25,24,18,{1,10},13}.

There are no private K4 completions, so A(P)=B(P).

| Quantity | Exact value |
|---|---:|
| Maximum packing nu(G) | 6 |
| Original allowed-cover optimum c_G(P) | 12 |
| Allowed-cover optimum when all gains are compulsory | 13 |
| Unrestricted cover tau(G) | 10 |

The twelve forced edges R union F miss exactly012. Adding01 gives a thirteen-cover. Replacing gain25 by spoke12 instead gives the permitted twelve-cover R union(F minus{25}) union{12}. Owner124 receives both spokes and owner025 receives none: a valid 3/1 allocation. All actual clauses remain intact. This is a single gain replacement; the example does not require a long repair sequence or changing both lending cycles.

The maximum-packing upper bound is ordinary: every actual triangle belongs uniquely to one K5 or one of four literal K4 blocks, so at most 2+4 can be packed. Six private pages force six bases, and six actual residual clauses have pairwise disjoint spokes, forcing six more support edges. Thus nu=6 and c(P)=12 have elementary certificates. Independent enumeration found all 891 maximum packings. The additional tau=10 result is unnecessary for the refutation.

See the [complete proof](notes/candidate02_counterexample.md), [literal certificate](data/verifier_candidate02_counterexample.json), [independent review](review/verifier_candidate02_refutation.md), and [fresh adversarial review](ADVERSARIAL_REVIEW.md).

## Why the run stops

[C01](CANDIDATE_01.md) paid each gain by barring its lender from discretionary spokes. K6 minus35,45 with P={013,025,234} refutes it: an already selected base gain leaves unused budget that the rule cannot reuse. Here nu=3,c(P)=5.

[C02](CANDIDATE_02.md) allowed all remaining budget to be used globally but retained every distinct gain. The twelve-vertex witness refutes this revision even when |F|=k and no duplicate/base-gain saving exists. Consequently a construction must allow gain retraction or avoid compulsory choices.

The successful local replacement proves no universal availability or termination rule: arbitrary attachments may add clauses using the deleted edge. Making all gains optional simply returns to the original all-type-one problem. The collaborator, coordinator and fresh critic found no supported new global step beyond that unresolved obligation, so the mission stops early. No specific P with c(P)>2nu was found, no packing rotation was used in the construction, and no different allowed set was substituted.

All four global obligations remain open: singleton/three-support compatibility; a mixed type-zero/type-one/private-K4 construction; unique completion-edge charging with crossing triangles; and a full global construction or valid reduction. [GLOBAL_OBLIGATIONS.md](GLOBAL_OBLIGATIONS.md) records their scope. [GATE_3H.md](GATE_3H.md) is NOT REACHED; the ceiling was not a target duration.

## Evidence scope and prior art

The [bounded audit](GATE_0.md) reproduced FCZnw's specified optima5/4 and nu3, K4/K5 lowered-budget controls, all three corrected private-pair semantic controls, and five malformed-certificate rejections. Every labelled graph through order 6 was checked over every maximum packing:33,868 graphs, 60,262 packings, no PK failure or UNKNOWN. C02 passed 27,646 eligible states there before the targeted twelve-vertex counterexample was found.

The initial structured search tested 560 instances of orders 11–14, representing 544 distinct labelled graphs: 509 fully checked and 51 capped after 512 maximum packings, totaling 66,406 checked states. No PK failure appeared. The same corpus was used for C01 and C02; counts are not added. Independent replay of 14 stratified instances and 3,023 packing-prefix checks agreed. [Partial cases](data/partial_cases.json) retain individual UNKNOWN unexamined packings. These are correlated finite cases, not independent statistical trials or proof of an all-size claim.

Claude's source package was absent from the inspected relevant attachment/project/TUZA-19 locations. The approximately 145 million through-ten report, K10 count 1,814,400, the 1,137 larger graphs/14 partial report, and 19 cost-changing graphs remain REPORTED_UNVERIFIED. Only the particular FCZnw witness was reproduced; missing by-order manifests are not invented.

[PRIOR_ART.md](PRIOR_ART.md) records exact inspected CKSU hypotheses, the corrected K5 classification, lending chains and the book-cover interface. The inspected lending chains move half credits; no integral all-type-one theorem was imported. The book observation is attributed prior-art reconstruction, not a global advance. Haxell's original body was unavailable. Wang's 2026 preprint was inspected at relevant statements; its Lean claim was not replayed.

No unchanged publication suite, old WKE formalization, installation or unrelated search was run. No Lean verification, historical priority or external human review is claimed. The fresh critic reconstructed the witnesses before comparing the producer proof. Serving-model weights and effort were not independently attested.

All execution was on the authenticated local Darwin Mac under the existing research root. The clean public source matched pinned commit 4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4 and tree f6716f2578ba5346960cbb69b9b2e0698b834b4f. No source reset, remote computation, GitHub write, outreach, publication or follow-on mission occurred. See [REPRODUCTION.md](REPRODUCTION.md) and [FINAL_RECEIPT.md](FINAL_RECEIPT.md) for exact checks, timing and private closeout.
