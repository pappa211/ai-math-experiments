> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two unconditional actual selections, with a local cover test

Frozen ordinary strengthening v2, TUZA-26, 2026-11-17. Independent review required. The earlier v1 remains immutable and valid, but imposed an unnecessary all-partner condition before the second selection. This version makes both selections unconditionally and tests only the resulting pair's defect.

## Localized maximal-support lemma

Let X be a finite simple graph with a triangle. Choose T maximizing the number of supported edges of X-E(T) over ALL actual triangles of X. Assume only that THIS selected T is wholly contained in some minimum X triangle cover. Then no ordinary restored T-page has both spokes background in X-E(T).

Proof: write T=abc and suppose bcp has background spokes bp,cp in H=X-T. The residual H'=X-bcp deletes only these background spokes and restores ab,ac, so every H-triangle survives. A triangle using either restored edge strictly increases supported-edge count, contrary to maximality. If none survives, all X-triangles using ab/ac are among abc,abp,acp. In the minimum X cover containing the selected T, replace ab,ac by ap when present, retaining bc. This saves at least one edge and still hits every triangle, contradiction. Only the selected T's cover was used. No cover property for other X-triangles is required.

This is the same complete exchange proof as maximal_support_triangle_selection_v1.md, with its exact necessary cover hypothesis isolated. Selection still ranges over ALL actual triangles, so the exchanged bcp residual cannot escape the extremal domain.

## Unconditional two-stage selection in the actual parent

Let G be the fixed minimum-edge CS failure with nu(G)=k,tau(G)=2k, using the accepted actual single/double residual facts and strict-restoration foundations.

First choose T globally maximizing support(G-T). Every actual G triangle is wholly minimum-cover eligible because tau(G-T)=2k-3, so in particular the selected T is. The localized lemma proves no ordinary T-page has both spokes background in H=G-T.

Second, choose U globally maximizing support(H-U) over ALL actual triangles of the fixed H. This choice is made without any hypothesis on other pair responses. H has nonempty triangle support by the accepted actual residual profile. Put R=H-U. Archived simultaneous pair extension and the separate double-residual zero exclusion give nu(R)=k-2 and delta(R) in {1,2}.

There are exactly two possible outcomes for THIS selected pair:

1. If delta(R)=1, the independently reviewed actual-parent theorems give single-edge resilience of R and extension of every actual R-triangle. Its parameters are (k-2,2k-5). No no-bare-page conclusion for U, connectedness or C12 naming is inferred.
2. If delta(R)=2, then tau(R)=2k-6=tau(H)-3. A minimum R cover together with E(U) is a minimum H cover containing the SELECTED U. Apply the localized lemma to X=H and its globally support-maximizing U: no ordinary U-page has both spokes background in R. Its defect-two support is not named and resilience is not asserted.

Thus both actual selections are always available. The second no-bare-page conclusion is conditional only on the selected pair having defect two, not on all partners through T or all pairs in G having that defect. Other partners may have either defect.

## Consequence and exact remaining gap

In outcome 2, if the selected pair lies in a low-packing tight common-center triple T=abc,U=ade,V=afg, the already reviewed activation argument applies unchanged: a B-bare de-page must have apex f or g and require a further cross edge to activate one of its spokes in R=B+V. This uses only the second no-bare-page conclusion. It does not supply such a V, a failed triple, tightness of the triple residual, or a complete payment for the remaining mixed triangles.

Outcome 1 still permits an unnamed resilient extendable defect-one double residual. Outcome 2 supplies a concrete restricted defect-two interface but not a contradiction. Neither outcome imports minimum-Q properties or classifies defect-two supports. Universal CS, unrestricted Tuza and global R remain open.

Dependencies: the complete local exchange proof in notes/maximal_support_triangle_selection_v1.md; accepted actual_parent_double_residual_resilience_v1.md and actual_parent_defect_one_triple_extension_v1.md with their independent composition receipts; archived actual-parent residual facts and separate double-residual zero exclusion. No computation, new census or replacement graph outside the fixed actual residuals.
