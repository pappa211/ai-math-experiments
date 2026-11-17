> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent actual-parent double-residual composition

Status: ACCEPTED ORDINARY, conditional on the archived exact minimum-CS-parent results and the separately reviewed new restoration lemmas. No minimum-Q property, numerical classification, or Lean verification is used.

Let G be the fixed minimum-edge CS failure with nu(G)=k and tau(G)=2k. Let T,U be any actual edge-disjoint triangles; they may share one vertex. Archived simultaneous extension gives nu(R)=k-2 for R=G-E(T)-E(U). Suppose delta(R)=1, so tau(R)=2k-5. If an edge e is packing-critical in R, its deletion lowers packing exactly one. Proper-subgraph CS and the cover deletion bound then force

    B=R-e,  nu(B)=k-3,  tau(B)=2k-6,  and B satisfies the tight B classification.

Put m=k-3. The edge e is outside both restored triangles and already triangle-bearing in R. Each actual single-triangle residual of G is single-edge resilient, so the square theorem applies to the literal representation G=B+e+T+U and proves

    nu(B+T)=nu(B+U)=m+2,
    tau(B+T)=tau(B+U)=2m+2.

If T and U are vertex-disjoint, the independently reviewed disjoint restoration theorem gives a direct packing or cover contradiction.

Otherwise write T=abc and U=ade. The square theorem supplies a B-bare ordinary e-page E0 in R. Deleting its two old background spokes preserves B's triangle family and its exact parameters, giving B'. The actual single-triangle residual

    H0=G-E(E0)=B'+T+U

has connected triangle support, is single-edge packing-resilient, and has nu=m+2, tau=2m+3. Each individual new family over B' has packing number exactly one: if one had two, exact one-triangle additivity followed by appending the other missing central triangle would give m+3 in H0. The complete old cross graph between {b,c} and {d,e} has exactly the six possibilities covered by |J|=0,1,2 adjacent,2 matching,3,4. The independently reviewed J0/J1, corrected J2 v2, and J3/J4 theorems either contradict the interface or identify its literal triangle support as a frozen C12 model. Arbitrary background stays in H0. The separately accepted strict actual-parent triangle-restoration theorem for these named supports, with that background, contradicts the minimum parent G.

Consequently R has no packing-critical edge: every defect-one actual double-triangle residual is single-edge packing-resilient.

Exact limits: R itself was not proved triangle-connected and is not named by this argument. Proper CS implies only one defect-one triangle component plus possible tight components; the new conclusion makes all of them single-edge resilient. No result here classifies the defect-one active component, classifies defect-two double residuals, guarantees a defect-one pair, or extends a prescribed third triangle. Those are subsequent selection/restoration questions. The strong minimum-Q degree, boundary, cover and two-edge-resilience properties are not inherited by R or H0.

Independent review bindings:
- opening_actual_parent_square_review.md: 06f23f0c6a9834ba3c9be15f37705eef7136c0f2170def34ddaf7c8e7c525ebe.
- opening_actual_parent_disjoint_review.md: 675ccddbd3926815fd9db1f7003d7f66880c5613608be9857fad797f94c30cbd.
- opening_actual_parent_j0_j1_review.md: f8e705e6e9eb87eacdc32e2868169eca45073f9613c3c9a421f43f5895af1138.
- opening_actual_parent_j2_review.md: 06d0cd020ab7a2177a0f5a53b1bd915dd53e3d898d3cccb8d17644ab29199ea4; binds corrected source v2 only.
- opening_actual_parent_large_cross_review.md: 4591182a892d3c34eb5911a2303df1e0973d34cce59c4001685588b010275468.
