> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Apex challenger: exact semantics, bounded falsification, and remaining bridge

Frozen 2026-11-16 for independent AI criticism. This is a scoped challenger record, not a new classification. Global apex rigidity, global R, universal CS and unrestricted Tuza remain OPEN. No unidentified defect-one state was reached.

## Live hypothesis and implication chain

A: Every finite simple graph whose nonempty actual triangle support is connected through shared edges, whose entire graph is that support, with tau=2nu−1 and nu(Q−e)=nu(Q) for every actual edge e, has a universal vertex.

A is stronger than the same assertion on the conditional minimum-Q class inside a fixed minimum-edge CS failure. A counterexample would refute global R because every frozen C12 model has a universal vertex, but would not refute Tuza or automatically refute conditional minimum-Q rigidity.

The forward sufficient route needs TWO open statements:

1. Global apex rigidity A: OPEN.
2. Exact classification of the resilient defect-one cones as C12: OPEN. Correct cone formulas retain the original triangle problem in the link; A alone does not prove this classification.
3. A plus that cone classification -> global R: PROVED logical implication.
4. Global R -> universal CS: CONDITIONAL on the archived minimum-CS profile and strict restoration at their exact scopes.
5. Universal CS -> unrestricted Tuza: PROVED by dropping the equality assertion.

The weaker useful route needs only a paid reduction/classification for the actual conditional Q class. The coordinator's cover-eligibility saturation candidate could strengthen this domain if accepted; no inheritance of every-triangle extension or parent restoration to Q is assumed here.

## Correct universal-cone formulas

Let z be universal and L=Q−z. Every packing consists of apex triangles zxy whose rim edges xy form a matching M in L, together with a packing of triangles of L avoiding E(M). Conversely these two pieces combine because the first triangles use distinct spokes and exactly the rim edges M. Therefore

    nu(z+L)=max_{M a matching in L} (|M|+nu(L−E(M))).

For any triangle cover of z+L, let C be its rim edges and S the rim endpoints of its selected spokes. Triangles avoiding z force C to be a triangle cover of L. The uncovered apex triangles correspond exactly to edges of L−C, so S must be a vertex cover of L−C. Conversely any such C,S yields a cone cover. Thus

    tau(z+L)=min_{C ANY triangle cover of L} (|C|+vc(L−C)).

The minimum cannot be restricted without proof to minimum triangle covers C. A universal vertex need not belong to every triangle. The common-apex case in TUZA22 has triangle-free L and is already treated there; no rediscovery claim is made.

## Independently exact mandatory control

The graph consists of K5 on {0,1,2,3,4} and K5 on {0,1,5,6,7}, sharing only edge 01. Its 19 actual edges and 20 actual triangles are explicitly recorded. The separate stdlib recursion in scripts/apex_exact.py certifies nu=4, tau=7, all 19 single-edge deletions preserve nu, every triangle extends to a maximum packing, connected triangle support and universal vertices 0,1. The certificate is evidence/apex_two_K5_control.json.

Ordinary bounds independently explain the values. A triangle lies in one K5, hence nu<=2+2=4. Choose two packed triangles in each K5 avoiding 01 to attain four. Every cover restricts to at least four edges of each K5 and may share only 01, so tau>=7. The cover {01,23,24,34,56,57,67} attains seven. The certificate supplies packing witnesses avoiding each individual edge.

Deleting universal vertex 0 leaves two K4s sharing vertex 1. The ordinary matching number is three and vertex-cover number five. The latter follows since each K4 requires three vertices, with overlap at most vertex 1; it is attained by vertex 1 and two vertices from each other triple. Thus matching-only cone semantics would give wrong values. Exhaustive evaluation of 64 matchings and 1,681 triangle covers of L gives the correct cone values 4 and 7. The maximizing matching selected by the checker has size two with two additional link triangles, another direct illustration of the missing term.

## Cheapest targeted falsification performed

Frozen input: the EXACT 12 labelled supports saved by TUZA25 scripts/residual_edge_exchange.py in evidence/residual_edge_exchange_seeds.json. No model was added. The mutation domain deletes one old edge and inserts one old nonedge, requiring the deleted edge to meet every original universal vertex. This is the complete one-edge-exchange domain that can remove all original universal vertices. All edges are retained; no unsupported edge is silently pruned.

Results: 1,908 labelled presentations; 210 lack complete triangle support; 226 have disconnected triangle support; 1,472 are fully supported, triangle-connected and have no universal vertex. Of these, 1,419 are safely rejected by a cut-cover upper bound U and explicit greedy-packing lower bound L with U<=2L−2. The remaining 53 are solved exactly and all have defect three. No timeout occurred. There are zero defect-one inputs, zero unresolved defect-one witnesses, and therefore zero hard-state coverage. Runtime was about 4.7 seconds, serial standard Python; no process remains. Exact counts describe labelled presentations, not unlabelled isomorphism types or a full graph census.

Evidence: evidence/apex_exchange_search.json; reproduction: source migration/env.sh, then python scripts/apex_exchange_search.py evidence/apex_exchange_search_replay.json in a fresh copy. The filter's direction is sound because tau<=U and nu>=L imply 2nu−tau>=2L−U>=2. Finite absence is INCONCLUSIVE for A and supplies no universal availability theorem. The search is retired rather than extended to a second shell of known-model mutations.

## Saturation and the one-missing-neighbor completion attempt

Precise attempted substitute: Q is the conditional minimum unknown core, every edge is cover-eligible, and there is a vertex z adjacent to every support vertex except one w. Can adding zw and then performing a legitimate paid exchange yield a smaller qualifying state or a cover saving?

Put J=Q+zw and k=nu(Q). Since one added edge is used by at most one packed triangle and covers all new triangles,

    nu(J) in {k,k+1}, tau(J) in {2k−1,2k}.

If m(J)<m(G), global minimum-edge failure of G licenses CS for J even when zw is not an edge of G; this is a separate edge-count argument, NOT Q's fixed-G minimality. In the no-packing-gain branch, tau(J)=2k would force B support. Since Q is connected and every old edge supported, Q sits in one literal K4/K5 triangle component of J; deleting zw yields only a small named/resilience-failing possibility. This branch is consequently incompatible with an unknown Q, provided the strict edge-count premise is verified.

But two substantive cases remain: (i) nu(J)=k,tau(J)=2k−1, where J is a larger defect-one cone and Q-minimality does not classify it; (ii) nu(J)=k+1, where J has defect at least two and there is no proved critical-edge deletion preserving resilience. Cover eligibility in Q alone supplies neither missing step. Generic completion does not ensure K4-completion of every J triangle, so the TUZA25 critical-edge theorem cannot be imported.

No theorem is promoted from this attempt. It does not cover Q lacking an almost universal vertex, and no availability argument produces the stated one-missing-neighbor bound. The exact next obligation would have to be an exchange theorem addressing the two branches and a reason it applies to all remaining Q. Neither was found. Continuing arbitrary cone calculations is not justified by the mission admission rule.

## Decision and successor

Demote apex rigidity from substantial exploration after the correct control and cheapest targeted falsification. Preserve A as OPEN, with finite testing INCONCLUSIVE. There is no new proved reduction, no counterexample and no availability gain from this track; this includes minimum-degree-at-least-four cores. Requested Astra/Ultra is a user preference; no serving-model attestation is exposed to this worker.

The mathematically different successor is the actual-parent residual selection programme, or the coordinator's joint cover/blocker obstruction: use an already justified minimum-Q constraint to obtain a genuinely smaller state. This avoids treating all resilient defect-one supports as cones or classifying them globally. A next parent lemma must keep H=G−E(T), every-triangle extension and the full restored background explicit. An exact new witness, a paid region available in the hard class, or a narrower bridge justified by new structure would reopen a challenger direction.
