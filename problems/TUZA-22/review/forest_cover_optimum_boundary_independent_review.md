> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: forest-cover existence versus optimum cover

Decision: ACCEPT, ordinary explicit auxiliary counterexample family.

Reviewed source: notes/forest_cover_optimum_boundary_v1.md.

For the complete join of a core triangle abc and an independent set of t>=3 apices, the actual triangle family is exactly the core plus its3t pages. Each triangle uses a core edge, bounding packing by3; pages on the three distinct bases at three distinct apices attain3. The three bases cover, so tau=nu=3.

Any minimum three-edge cover must contain a core edge to hit abc. With one core edge selected, its two remaining spokes cover at most4 of the2t pages on omitted bases. With two core edges selected, its remaining spoke covers at most one of the t pages on the omitted base. Both fail. Thus the unique minimum cover is the cyclic three-base cover.

The selected set {ab} plus all cx_i is a forest cover of size t+1. Any forest cover contains one or two core edges, never all three. With one or two such edges, each independent apex requires a separate spoke for an omitted base page. Therefore every forest cover has at least t+1 edges, attained by the displayed construction. The gap is unbounded with ordinary tau and nu fixed at3.

Deleting any core edge lowers packing to2, so this is not a resilient defect-one residual example. The source correctly distinguishes forest-cover existence from a forest MINIMUM cover and does not promote the family to a Tuza or CS counterexample. No computation is needed.
