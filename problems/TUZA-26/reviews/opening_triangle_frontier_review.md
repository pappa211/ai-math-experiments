> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: triangle-residual frontier

Verdict: PASS, PROVED_ORDINARY as an exhaustive accounting frontier with its explicitly conditional final paragraph. This is not a residual-availability theorem or Lean verification.

Reviewed source: notes/triangle_residual_frontier_v1.md, SHA-256 e41268a897e1e875e1b1411a70b96645abe6dbbc14173265956229f1afa24673.

## Accounting and quantifiers

For the accepted conditional minimum Q, write nu(Q)=k and tau(Q)=2k-1. Two-edge resilience gives nu(Q-E(T))=k-1 for every actual triangle T: adding T gives the upper bound, while deleting any two of its edges gives the lower bound. The accepted no-B triangle-residual lemma and proper CS leave defect exactly one or two.

A packing-critical edge lowers packing by exactly one; deletion lowers covering by zero or one. Hence defect drops by two or one, and proper CS forbids a negative result. For a defect-one J, every critical edge therefore leaves defect zero/B. Otherwise J is resilient. For a defect-two J, a critical deletion leaves defect zero or one. The latter residual is either resilient, or any further critical deletion leaves defect zero/B. These possibilities exhaust following critical deletions from J. They need not be disjoint as existential branches indexed by different choices of edge.

The numeric restoration profiles are correct. A defect-zero residual after one edge has Q packing gain two and cover gain three. A resilient defect-one residual after one edge has packing gain two and cover gain four. A B residual after two further critical deletions has packing gain three and cover gain five. The latter two profiles are not the accepted three-edge B gain-two/cover-three theorem.

If J itself is resilient of defect two, triangle-component additivity and nonnegative individual defects give either one defect-two active component or two defect-one active components, together with any tight components. The minimum-Q naming rule applies to the two resilient defect-one components, each strictly smaller inside the same fixed G. It does not name the defect-two component. For a resilient defect-one J, it similarly names only its unique defect-one active component; retained background and other pieces are separate reconstruction obligations.

The source correctly leaves the assertion that every triangle residual has defect two CONDITIONAL on both (a) triangle-plus-edge B exclusion and (b) full resilient named triangle restoration with packing gain one/cover gain two. Review of (a) now passes separately; (b) is not assumed in this review. No all-triangle minimum-cover conclusion is promoted before (b) passes.

If those two hypotheses do hold, defect two for J is equivalent to tau(J)=tau(Q)-3, which is equivalent to some minimum Q cover containing all three T edges. The cover can depend on T. For every D subset E(T), that cover restricted to Q-D supplies tau(Q-D)<=tau(Q)-|D|, and extension of an arbitrary cover of Q-D by D supplies the reverse inequality. The displayed four-stage (nu,tau,defect) chain is then exact. Its intermediate defect three is neither a contradiction nor a paid descent.

Both double-K5 controls are valid. Deleting023 gives the spine14 book plus old second K5, and deleting14 leaves B. Deleting234 gives the book with spine01 sharing the old second K5; deleting01 removes that book and leaves a resilient K5-e support. These controls refute unrestricted exclusion of the corresponding frontier branches, while respecting the stated minimum-Q scope.

## Additional checked observation: no tight triangle-residual pieces

This observation is separate from the reviewed source, and uses the already accepted paid boundary exclusion for minimum Q.

Let D be any literal tight K4/K5 triangle component of J=Q-E(T), without assuming J resilient. Its clique contains at most one vertex of T, because all three T edges are absent. Every Q triangle absent from J is T itself or an ordinary page on a T base; there is no two-base triangle other than T. An entire ordinary page family on a missing base contributes at most one distinct D edge, by the standard missing-base argument: two spokes at one endpoint force the other endpoint into D via an old triangle, and opposite-endpoint spokes force the absent base directly.

If D contains no T vertex it has no such footprint. If it contains one T vertex, only the two incident base families can contribute, and their possible footprint edges meet at that vertex. Old J triangles outside D share no D edge. Thus its COMPLETE outside-triangle boundary in Q consists of at most two adjacent edges. The accepted paid boundary exclusion forbids D. This establishes that every triangle residual of minimum Q has no tight components, independently of resilience or the new triangle-plus-edge theorem.

Consequently a resilient defect-two J has exactly one connected defect-two active support, or exactly two resilient defect-one active supports, both C12. The first remains unnamed. No conclusion about reconstruction of Q follows from this decomposition alone.

## Strategic assessment and limits

The two-C12 branch offers a concrete next interface problem: the active supports are individually named, but their permitted shared vertices, literal background, all triangle pages and the required packing/cover payment still need proof. A finite enumeration is justified only after those parameters and the exact domain have been confined. Treating the two components as automatically fresh would omit possible interactions.

The single connected resilient defect-two branch is the sharper obstruction: minimum-Q minimality has no naming consequence there. A useful next lemma must create a smaller resilient defect-one support with a verified restoration payment, or find a forbidden paid region directly. Mere resilience or defect accounting does neither. Critical defect-two residuals retain the defect-one-resilient and further-critical alternatives even after the B branch is excluded.

No new solver run was needed. No unrestricted theorem, global availability claim, or new C12 member is asserted.

Frozen UTC: 2026-11-16T22:28:38.490362+00:00
