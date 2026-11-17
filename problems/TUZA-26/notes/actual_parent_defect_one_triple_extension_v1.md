> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every triangle extends in a defect-one actual double residual

Frozen ordinary composition v1, TUZA-26, 2026-11-17. Independent composition review requested. This is distinct from the separately proved single-edge resilience of such residuals: that theorem is not a premise here.

## Statement

Let G be the fixed minimum-edge failure of combined CS with nu(G)=k, tau(G)=2k, using the archived actual single-triangle residual profile, simultaneous extension of two edge-disjoint triangles, and strict C12 single-triangle restoration at their exact scopes. Let T,U be edge-disjoint actual triangles, and suppose R=G-E(T)-E(U) has defect one. Then EVERY actual triangle V of R extends to a maximum R-packing:

    nu(R-E(V))=nu(R)-1=k-3.

Equivalently, every prescribed triple T,U,V of pairwise edge-disjoint triangles extends simultaneously in G whenever the double residual of T,U has defect one. This does not claim extension for triples whose three double residuals all have defect two.

## Complete proof

Suppose V fails extension. With n=nu(R)=k-2, proper CS and cover extension force B=R-E(V) to have nu(B)=n-2=m and tau(B)=2m, hence literal tight K4/K5 triangle components. The one-triangle incidence classification and the cover increment three force the complete new V-family to be a literal K5-e on abcxy, where V=abc and xy is missing. All six old spokes between abc and xy are background in B. This is an explicit consequence of the failure interface; no minimality-based naming occurs. Exact derivation and sharp K5-e control: notes/matching26_actual_parent_triple_extension_v1.md.

Use H=G-E(T)=B+V+U. Its actual-parent parameters are nu(H)=m+3, tau(H)=2m+5, with connected triangle support and single-edge resilience. Simultaneous extension of T,V gives nu(B+U)=m+2, so the individual U-family has packing number exactly two. All old background is still present.

There are now exhaustive cases:

1. V and U share one vertex. The reviewed complete page confinement in matching26_actual_parent_triple_extension_v1.md gives a four-edge cover of all new triangles over B, contradicting tau(H)=2m+5.
2. V and U are vertex-disjoint, and U contains zero or one of x,y. The reviewed notes/actual_parent_triple_disjoint_partial_v1.md gives respectively a four-triangle augmentation over B or a four-edge new-family cover. Both contradict the supplied parameters.
3. V and U are vertex-disjoint and U contains both x,y, so U=xyd. The complete ordinary-page classification in notes/matching26_actual_parent_two_peripheral_v1.md gives literal triangle support central_K4_star_5, central_K4_star_45, or central_K4_star_55. This uses the actual H connectedness and resilience where needed, and retains all background. The archived strict actual-parent restoration theorem applies to this SINGLE residual H=G-T and excludes each named support.

Triangles T,U,V are edge-disjoint, so V and U cannot share two vertices; the cases are exhaustive. Every failure yields a contradiction. Therefore V extends, proving the statement.

## Exact operational consequence and remaining arrow

The defect-one double-residual branch now has two independently established properties: single-edge packing resilience and extension of every actual triangle. The first is proved by the bare critical-edge-page rebase; the second is proved by the explicit bare K5-e failure interface and the exhaustive restoration above. Neither conclusion supplies connectedness or C12 membership of R.

Any failure of simultaneous extension for three prescribed edge-disjoint triangles therefore requires ALL THREE corresponding double residuals to have defect two. This is a proved restriction on the obstruction, not an assertion that the obstruction exists or is impossible. The all-double-defect-two branch has the separate five-profile accounting in notes/apex_actual_parent_triple_selection_v1.md. Pairwise occurrence in minimum covers does not imply joint occurrence of a triple; the exact K9 control prevents that shortcut.

Global residual selection, the remaining defect-two branch, universal CS and unrestricted Tuza remain OPEN. Minimum-Q arguments do not classify defect-two supports and are not used here. No census, numerical job, formal Lean claim, or historical originality claim.

Independent component receipts: opening_actual_parent_triple_shared_review.md; opening_actual_parent_disjoint_partial_review.md; and the separately requested two-peripheral review. A final quantifier/dependency review of this composition is required before promotion.
