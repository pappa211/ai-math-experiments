> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordered actual-parent selection under the all-double-defect-two branch

Status: ordinary corollary of maximal_support_triangle_selection_v1.md, for independent review. This supplies two legitimate consecutive selections; it does not assume the existence of a failing triple or a tight triple residual.

Let G be the literal minimum-CS parent, nu(G)=k and tau(G)=2k. Assume the remaining branch in which every edge-disjoint actual pair T,U has

    nu(G-T-U)=k-2, tau(G-T-U)=2k-6.

Choose T to maximize the number of supported edges in H=G-T. Every actual G triangle is fully contained in some minimum G cover, by tau(G-T)=2k-3. The general maximal-support selection lemma therefore proves that no ordinary T-page has both old spokes background in H.

Now EVERY actual triangle U of H is fully contained in some minimum H cover. Indeed, T and U are edge-disjoint in G, and

    tau(H-U)=2k-6=tau(H)-3.

Applying the same general selection lemma to the fixed actual graph H, choose U maximizing the supported-edge count of R=H-U. Then no ordinary U-page has both old spokes background in R.

These choices use two nested finite maximizations inside actual residuals. The second step does not use tightness of H, minimum-Q naming, or any resilience theorem for a defect-two graph. It uses exactly the full-triangle cover hypothesis supplied by the all-double-defect-two branch. No third iteration is justified: a triangle V in R need not be fully contained in a minimum R cover, because the triple cover surcharge may be one or two.

## Exact common-center interface, conditional on a low-packing tight triple

Suppose this chosen pair has an edge-disjoint third triangle V such that

    T=abc, U=ade, V=afg,
    B=G-T-U-V, nu(B)=k-4, tau(B)=2k-8,

with all seven core vertices distinct. Proper CS makes B literal tight, but all old background is retained. Here R=B+V. The existence of such V is NOT asserted.

Let dep be a B-bare ordinary U-page on its opposite base de, so dp,ep are old B-background edges. The second selection says that at least one of dp,ep is supported in R=B+V. Such new support must come from a triangle using a restored V edge.

If p is outside {a,f,g}, neither d nor e nor p is a V terminal. A triangle containing dp or ep therefore cannot also contain a V edge: those physical edges would have four distinct endpoints. Thus dp and ep remain background in R, contradiction. The value p=a is impossible for an ordinary page over B, since ad and ae are absent U bases. Consequently

    p belongs to {f,g}.

For p=f, the edge df can enter a new R-triangle only through fg with the other old spoke dg, or through af with the old spoke ad. The latter is absent. The same argument applies to ef. Therefore a B-bare def-page is allowed by the selection constraint only if

    dg is present OR eg is present.

For p=g the symmetric condition is df present OR ef present. Thus every B-bare opposite U-page is confined to the literal two-by-two old cross interface between {d,e} and {f,g}, with at least three of its four cross edges present. Outside-core apices and apices b,c from the first deleted triangle are excluded. This is exact activation accounting, not a statement that these remaining configurations exist or are harmless.

The first selected triangle T gives a weaker analogous confinement: any B-bare opposite T-page must be activated by U or V in H. In particular its apex cannot lie outside the seven core vertices. One may not strengthen this to the second selection's two-by-two interface, since H restores both U and V.

## Remaining selection and payment gap

The ordered rule is available under the all-double-defect-two assumption. A low-packing B triple containing its chosen pair is not guaranteed, and the other triple profiles remain possible. Even if that B triple exists, the remaining three- or four-edge cross interface above has not been paid away here. No delta-two support is named.

Dependency: notes/maximal_support_triangle_selection_v1.md (general full-triangle-cover extremal lemma); notes/apex_actual_parent_triple_selection_v1.md (five exact triple profiles and surcharge). No numerical computation or new source search is used.
