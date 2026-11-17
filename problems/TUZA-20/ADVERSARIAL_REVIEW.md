> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Adversarial review of TUZA-20 Candidates 01 and 02

Verdict: **both proposed sufficient mechanisms are refuted; the C02 ordinary counterexample proof is sound. No unrestricted global obligation has been discharged. Early STOP is reasonable.**

This review reconstructed the literal graphs, actual triangles, original supports, private pages, gains and covering arguments before reading the producer proof or any checker implementation. The coordinator supplied the witnesses and proposed invariants, including the suggested block and residual-clause certificates; this is independent reconstruction and adversarial checking, not independent discovery or a blinded review. After reconstruction, the review compared CANDIDATE_01.md, CANDIDATE_02.md, notes/candidate02_counterexample.md, and data/verifier_candidate02_counterexample.json. No producer mathematical code was imported. No distinct-model identity, Lean verification, external peer review or priority is asserted.

All computations used the local Darwin Mac and existing pinned Python 3.12 environment under the private math-research root. No installation, remote computation, public write, publication or outreach was performed by this review.

## C02: reconstruction and attack on every hypothesis

Let K be the K5 on {0,1,2,4,5}. Add precisely the edges of 013,036,167,678,189,{8,9,10},{1,10,11},{3,10,11}. Direct reconstruction gives 12 vertices, 29 edges and exactly 26 triangles. The packing is P={013,124,025,167,189,{1,10,11}}, with 18 distinct support edges.

The added subgraph has apex 1. Its link is the union of the four triangles 036,678,{8,9,10},{3,10,11}. Each private link vertex 0,7,9,11 has two adjacent neighbors; the remaining four vertices form the chordless cycle 3-6-8-10-3. Consequently these are the only four link triangles. Every one of the twelve link edges also gives exactly one apex triangle. Hence the added subgraph has exactly sixteen triangles. It meets K only in vertices 0,1 and edge 01, with no edges between the exclusive vertex sets, so no triangle is missing from this classification.

Equivalently, every actual triangle has unique ownership in K or one of the four K4s on {0,1,3,6}, {1,6,7,8}, {1,8,9,10}, {1,3,10,11}. A K4 supplies at most one packed triangle. K5 supplies at most two: three would leave one edge, contradicting even degree parity of both K5 and a union of edge-disjoint triangles. These bounds can be added despite overlaps between blocks because triangle ownership is unique. Thus nu(G)<=2+4=6. The displayed edge-disjoint P attains six. This establishes maximum cardinality, not merely maximality.

The independently enumerated private-page table is:

| Owner | Sole private page | Base | Gain |
|---|---|---|---|
| 013 | 036 | 03 | 16 |
| 124 | 145 | 14 | 25 |
| 025 | 045 | 05 | 24 |
| 167 | 678 | 67 | 18 |
| 189 | {8,9,10} | 89 | {1,10} |
| {1,10,11} | {3,10,11} | {10,11} | 13 |

Privacy was tested against the entire original B(P), including the shared edge 01, not against separately isolated blocks. Every owner has precisely one private page and one private base. All six gains are actual, distinct original support edges and none is a base. A private K4 completion requires three private faces on different owner edges, which is impossible here; thus the original permitted set is exactly A(P)=B(P).

Write R={03,14,05,67,89,{10,11}} and F={16,25,24,18,{1,10},13}. Every B-contained cover must contain R because each private page has only its base in B. A cover additionally containing F already spends twelve distinct edges. Directly checking all twenty-six triangles shows that R union F misses exactly 012. Thus the forced-gain cost is at least thirteen. Adding 01 hits that last triangle, so the cost is exactly thirteen. This contradicts precisely C02's cardinality bound 2|P|=12 while satisfying all its hypotheses.

The original permitted optimum is nevertheless twelve. Its lower bound follows from the six actual triangles 016,178,{1,9,10},{1,3,11},024,125, whose residual support clauses are respectively {01,16},{17,18},{19,{1,10}},{{1,11},13},{02,24},{12,25}. They avoid R and are pairwise disjoint as sets of physical edges. Every support cover therefore needs six additional edges after its six forced bases.

For the matching upper bound, take C=R union (F minus {25}) union {12}. Its star-subgraph portion is unchanged and hits every link and apex triangle. Its K5 portion is {14,05,12,24}, exactly the edges inside the two parts {1,2,4} and {0,5}; every K5 triangle contains an internal edge of one part. This verifies every actual triangle, including 012. C lies in the original B and has twelve edges. The resulting 3/1 allocation between owners 124 and 025 is allowed by the original problem.

No real three-literal clause has been shortened, no outside-support edge is used, no completion edge is charged, and no rotated packing replaces P. In particular the uncovered boundary clause 012 is essential to the refutation.

## C01: separate six-vertex reconstruction

For G=K6 minus35,45 and P={013,025,234}, the complete triangle list is 012,013,014,015,023,024,025,034,123,124,125,134,234. There are thirteen edges. Four edge-disjoint triangles would leave one edge, but vertices 0,1,2,5 have odd degree. Deleting triangles preserves degree parity, and one remaining edge cannot have four odd-degree vertices. Hence nu(G)=3, attained by P.

The sole private pages are 014,125,124, with bases 01,25,24 and gains 34,01,13. All owners are lenders, so C01 forbids any discretionary selection S. After excluding the already selected base gain01, F={34,13}. Bases union F misses 023, whose complete clause is {02,03,23}. Thus C01 is false.

The original support cost is five. Three private bases are forced. Residual triangles034 and123 have disjoint support clauses {03,34} and {13,23}, so at least two further spokes are needed. The cover {01,03,13,24,25} attains five and also hits residual triangles023 and134. A private K4 completion is again impossible. This is a failure of C01's allocation restriction, not an over-budget permitted cover.

C02 correctly repairs this particular lost-saving issue: selecting03 in addition to its two nonbase gains uses the third spoke-budget unit and gives a six-edge cover. C02's separate twelve-vertex failure persists with no repeated gains and no base gains, so global reuse of those savings does not rescue compulsory gain selection.

## Finite certificate comparison and limitations

A fresh standard-library calculation reconstructed the C02 edge set and all triples directly. It compared all private-page lists, the original allowed set, and the complete set of maximum packings with the saved verifier JSON. Unique block ownership reduces the latter independent enumeration to choices of two disjoint K5 faces and one face from each K4; exactly 891 compatible maximum packings result, agreeing as sets with the stored certificate.

An independent memoized hitting-set recurrence on the full actual triangle family gives support optimum12, forced-gain optimum13, and unrestricted tau10. These agree with the saved certificate. The first two values have the ordinary proofs above; tau10 is corroborating finite computational evidence in this review and is not needed for either refutation. None of this asserts a census beyond these literal graphs or confirms any reported through-ten computation.

The extra comparison ran successfully from standard input without importing or modifying either producer checker. An optional attempt to save a longer auxiliary checker timed out in automatic permission approval review before execution; the shorter read-only calculation completed. That timeout was not a mathematical failure or a safety finding. The review's conclusions rest on the explicit ordinary proofs and the retained verifier certificate.

The supplied proof hash at the start of comparison was 4f7938cb2aab81a6bfd22b96db42726593e082d127fc8f032d3507dfdf41ade8. I found no substantive proof gap. One editorial improvement is to replace the heading 'unrestricted support optimum' with 'support optimum', reserving 'unrestricted' for covers in all of E(G). This is terminology only; the stated permitted set is consistently B(P).

## Scope and stopping decision

The correct main outcome is REFUTED_CANDIDATE. C02 is strictly stronger than all-type-one PK-all because it forces every gain; its failure leaves the original fixed-packing existence question open. The twelve-vertex graph actually attains c_G(P)=2|P| and therefore is not a PK-all counterexample. Neither example refutes PK-exists or Tuza. The two refutations do not discharge singleton/cycle and three-support compatibility, mixed type-zero/type-one/private-K4 compatibility, completion-edge accounting, or a full global construction/restoration argument.

The visible local repair demonstrates that a successful general method must sometimes retract a selected gain. It does not supply a universally valid release operation: outside attachments may add clauses hit only by the removed edge, and no availability, budget-preservation or termination theorem for repeated releases has been proved. Replacing compulsory gains with arbitrary optional gains without an additional structural assertion returns to the original all-type-one target.

Early STOP is therefore reasonable after preserving the certificates and review. Both frozen mechanisms have decisive counterexamples; a third candidate needs a genuinely specified boundary-compatible global mechanism. Spending the remaining time on a larger passing census would not supply that missing lemma. This recommendation concerns the current authorized approach and available evidence; it is no claim that Tuza or a later alternative approach is impossible.
