> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh challenger review: common-apex defect-one components

Verdict: ACCEPT the ordinary matching-cover bound and exact common-apex classification. The final application to a residual kernel remains conditional on the separately proved active-kernel peeling statement.

For each maximum matching edge xy in a triangle-free link, two endpoints with unmatched neighbors either make a triangle (same unmatched neighbor) or a one-to-two matching augmentation (distinct neighbors). Thus a safe endpoint exists on every matching edge. The unmatched vertices are independent and have no neighbors in the chosen safe-endpoint set. With at least three safe endpoints, triangle-freeness supplies a nonadjacent pair; adjoining that pair to all unmatched vertices gives the exact cover upper bound2r−2. No hidden assumption about connectivity, regularity, or maximum independent sets is used.

A triangle component with a common apex has a triangle-free rim in its literal edge-support graph. Any purported rim triangle would itself be an actual triangle sharing its edges with the component and would violate the common-apex premise. Rim matchings and apex-triangle packings correspond exactly. Replacing any selected rim edge by one endpoint's spoke preserves coverage of all apex triangles, validating equality of the two cover parameters.

At matching number1, triangle-freeness turns a pairwise-intersecting edge family into a star. At matching number2 with vertex-cover number3, Konig excludes bipartiteness, and a shortest odd cycle must be C5. Any extra edge with an endpoint outside it combines with two cycle matching edges to make a matching of size3; every C5 chord makes a forbidden triangle. Thus the only nonisolated rim is C5. Conversely the book and five-wheel have the displayed parameters.

The all-size exclusion of common-apex defect-one components with packing at least3 is self-contained and does not need Konig; Konig is used only for the exact matching-number-two classification. No arbitrary residual is asserted to have a common apex, and no normalization step is supplied.

This is internal independent proof review, not Lean verification or a novelty claim.

Reviewed source SHA256: 5926a71a34b8ecaf10ae5da565c58c4df2c288f05ef5fe2fa445fa4358c4e19d
UTC: 2026-11-15T22:51:11.489230+00:00
