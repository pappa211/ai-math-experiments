> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Scoped kernel transfer audit

Source: Sheng–Xiao, [arXiv:2308.16515v1](https://arxiv.org/html/2308.16515v1), sections3–4, downloaded in sources/literature. The paper's separate 3k decision kernels are not a universal Tuza reduction. This audit reconstructs the transfers below directly; it does not audit the discharging size proof or the crown-finding algorithm. No novelty claim.

## Inspected rules and independent transfer assessment

Here R is the transformed graph, r=|head|, and delta=2nu-tau.

|Rule|Action/parameter|Exact transfer and geometry|Induction status|
|---|---|---|---|
|1|Threshold/base-case answer|No graph transfer|Decision only|
|2|Delete nontriangular vertices/edges; k unchanged|nu,tau,B unchanged; actual triangles unchanged|Edge deletion decreases m; ignore isolates|
|3|Delete a literal K4 triangle component; packing k−1, cover k−2|nu=nu(R)+1,tau=tau(R)+2; B iff B(R)|m decreases; both Tuza and CS transfer|
|4|Split a vertex across triangle-separated nonempty incident groups; k unchanged|Edge/triangle incidence bijection; nu,tau,B unchanged|m fixed, vertices increase; edge-minimality alone insufficient|
|5|Packing size exceeds threshold|No graph transfer|Decision only|
|6–7|Improve current packing by one/two-triangle exchanges|Graph unchanged|No smaller graph|
|8|Increase vertices covered by equal-size packing|Graph unchanged|No smaller graph|
|9|Delete positive fat-head crown; k−r|nu=nu(R)+r,tau=tau(R)+r|m decreases; strict Tuza slack under induction|

Actual Rule9 restricts its search to nonempty C subset V\V(L) and H subset L, where L is the labeled-edge set associated with the current packing; it is not asserted to find every crown. The identity below applies to any supplied crown satisfying its full definition.

Rules1–9 inspected at statement scope. Crown-search completeness and section5 discharging are UNINSPECTED. No antecedent is indispensable for the identities proved here. The paper's rule order is part of its algorithm; our transfer proofs do not claim its algorithm has been replayed.

## Crown identity: independent reconstruction

Write V=C disjoint-union X. Required source hypotheses, retained in full: C is independent; H consists exactly of the edges spanned by a vertex of C (both endpoints adjacent to that vertex); N(C) is contained in V(H); there is an edge-disjoint triangle packing P of |H| triangles, each with exactly one vertex in C and one edge in H. Put R=G−C−H and r=|H|. Thus every triangle removed from G contains a head edge: a triangle through C has its other two endpoints joined by such an edge, and the other removed triangles explicitly meet H. All triangles, including triangles crossing the proposed pieces, are covered by this dichotomy.

Any G packing has at most r removed triangles, because they each consume a distinct H edge. Its remaining triangles pack in R, so nu(G)<=nu(R)+r. Conversely every R packing is edge-disjoint from P: each edge of P is either incident to C or belongs to H. Appending P gives the reverse inequality.

Adding H to an R cover meets all removed triangles, so tau(G)<=tau(R)+r. Every G cover meets each of the r edge-disjoint triangles of P with distinct edges. These r edges lie outside R. Restricting the cover to E(R) still covers every R triangle, hence tau(G)>=tau(R)+r. Both identities are exact. Condition N(C) subset V(H) is retained although this particular identity proof does not need it once the other hypotheses and P are supplied.

Consequently delta(G)=delta(R)+r. A positive crown in a minimum ordinary Tuza violation transfers a violation to R. In a minimum CS failure, CS on R gives tau(G)<=2nu(G)−r, contradicting tightness. Thus positive crowns are excluded; their availability is a separate unresolved structural question.

A sharper residual consequence: suppose J has delta(J)=1 and single-edge packing resilience. If J has a positive crown, r cannot be1: deleting its sole head edge leaves the same triangle family as R, so nu drops by1. If r>=2, the exact identities give delta(R)=1−r<0, an ordinary Tuza violation in a proper subgraph. Therefore a residual of a minimum CS failure is crown-free. This is a necessary restriction, not crown availability or a solution.

## Split normalization and legitimate minimality

For Rule4, map split edges back to their original edge. A triangle through the original vertex uses two incident edges in the same part by hypothesis, so it survives exactly once. A triangle in the split graph maps to an original triangle. This establishes a triangle-hypergraph isomorphism and exact nu/tau preservation.

B also survives in both directions. A literal K4/K5 component uses, at any vertex, mutually triangle-linked incident edges; they cannot be separated. Conversely a literal clique component after splitting cannot contain both split vertices, because they are nonadjacent. Mapping its vertices back is injective and returns the identical literal clique component. Shared-edge triangle connectivity is preserved by the incidence bijection.

To use this as induction, discard isolated vertices and order by (m,2m−v), lexicographically, where v counts nonisolated vertices. Both entries are nonnegative. An edge reduction decreases the first coordinate; a genuine split preserves m and increases v by1, decreasing the second. A smallest failure for this order therefore has no split vertex, as well as no removable K4 triangle component or positive crown. The original minimum-edge residual lemmas continue to apply to this tie-broken choice. This normalization supplies no bound on m or nu, and no finite verification implies a universal result.

## General transfer and limits

For any legitimate smaller-object transformation, tau(G)<=tau(R)+a and nu(G)>=nu(R)+b with a<=2b transfer the ordinary inequality. Equality classification additionally needs a strict saving or an explicit B transfer. Rules3 and4 provide the latter; a positive crown provides strictness. Parameter-threshold equivalence alone is insufficient.

The six-spoke response table X -> (nu(J−X),tau(J−X)) concerns the entire J unless a proper region is separately identified. The forced-cover optimum is |X|+tau(J−X): remove the already selected edges and cover remaining actual triangles. This identity supplies neither a smaller realization nor an availability theorem. No64-state table was enumerated merely to rename that gap.

Status: PROVED_ORDINARY at the stated hypotheses; fresh independent reconstruction accepted in reviews/critic_kernel.md. No new Lean execution. Kernel size theorem and crown-finding complexity are source claims only, not independently reproduced here.
