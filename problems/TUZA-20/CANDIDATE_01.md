> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Candidate 01: gain-prepayment with globally charged lenders

Status: CONJECTURE, frozen before substantial candidate search. This is a stronger architectural sufficient statement, not an established implication-conflict theorem and not PK-all assumed under another name.

For every finite simple graph G and every specified maximum edge-disjoint triangle packing P all of whose members are type one, retain every actual residual clause after selecting every private base. Let k=|P|. For every singleton-page owner T_i=a_i b_i x_i with sole private page a_i b_i z_i, let g_i=x_i z_i. Let L be those owners for which g_i is an actual graph edge. Let F be the set of distinct such edges excluding the selected private bases. Every g_i lies in original B(P): if it were outside B, the four vertices would give private pages on the spokes, contrary to type one. Thus F consists of original spokes and |F|<=|L|.

Let exceptional pairs be the disjoint K5 owner pairs of the corrected classification. Their owners have two pages and are outside L. Candidate 01 asserts there exists an additional spoke set S such that:

- S uses only owners outside L.
- Each nonexceptional owner outside L contributes at most one spoke to S.
- Each exceptional pair contributes at most two spokes in total to S, with 2/0 allowed.
- F union S meets EVERY actual residual clause, of size two or three, with no literals deleted.

Then |F union S| <= |L|+(k-|L|)=k and the original support cover bases union F union S has size at most 2k. Owners may get unequal final allocations because another owner's gain may land on them. Multiple lenders selecting the same physical gain edge pay it only once. This is global counting; no Hall matching is asserted.

## Exact repair/augmentation assertion to attack

With all gains preselected, every implication conflict in the residual two-clause subsystem AND every uncovered three-clause can be resolved by the stated nonlender/K5 choices; alternatively these same hypotheses force an actual packing larger than P. This is a terminal existential lemma, not an iterative bounded-radius descent claim. The missing assertion is simultaneous existence under all boundary clauses. If a constructive cycle algorithm is proposed, availability, continuation and termination must separately be proved; finite exhaustive selection alone does not prove the lemma.

The graph-specific ingredients proposed for this assertion are: the gain edge is packed; singleton recipient uniqueness; corrected exceptional K5 pairs; and the established fact that any base-free 3-owner triangle has two singleton owners with intersecting private pages. These facts do not presently prove the candidate.

## Known weaknesses and obligations

A lender whose gain is a selected base uses no spoke budget but still loses its own discretionary spoke in this strong model. Repeated gains likewise leave unused budget. Such restrictions may be false; any relaxation must explicitly reuse the available saving, preserve original A(P), and handle every outside clause. No arbitrary-attachment quantifier is certified by fixed-core enumeration. Three-literal clauses are retained from the outset. K5 is handled by pair budget, and the private-pair example is NOT called an inconsistent complete one-per-owner system.

Compared with the known 3k-2m+2p bound, the proposed mechanism pays singleton interactions through distinct gain edges and residual nonlender choices. It would solve the entire all-type-one case if true; type-zero and private-K4 mixed states remain separate open global obligations. There is no current mixed-state availability theorem and no claim of unrestricted progress merely from this formulation.

Initial tests: K5, corrected eight-vertex private-pair core, actual singleton cycles, near-tight block gluings with all actual crossing triangles, and any eligible small controls. Every failure requires actual maximum packing and complete constrained-clause infeasibility, plus unconstrained restricted optimum to distinguish candidate failure from PK-all failure.
