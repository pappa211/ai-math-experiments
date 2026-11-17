> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: all-minimum exact cone assigned-family uniqueness

Reviewer: restoration. Frozen 2026-11-16 before the research cutoff. Verdict: ACCEPT, ordinary conditional theorem with the ALL-minimum quantifier retained.

Reviewed source: `notes/all_minimum_exact_cone_unique_family_v1.md`, SHA-256 `d8e7a0f01f70918856909901f88c966e1df453a4f0ac904642a95bd70644bf31`.

I independently reconstructed the hub exact-one equations. They force selected spokes S to be independent, all B-B rim edges to be selected, and all S-B edges unselected. Actual rim exactness makes A=L[B] triangle-free. If a B vertex lacked an S-neighbor, any of its rim edges would have only its hub triangle, contrary to the stated codegree hypothesis. This proves the required domination.

The triangle-family partition is exhaustive because S is independent and A triangle-free: each rim triangle has one S apex and one A base; each hub triangle is assigned either a selected S spoke or an A base. Edges in an optimum cover D of the A-base family can only be A bases, B hub spokes, or S-B spokes. They are disjoint from the selected S hub spokes. Appending those fixed spokes gives a GLOBAL minimum cover, so the ALL-minimum exactness premise applies. A B hub spoke or S-B spoke would double-hit an actual hub triangle using domination. Thus the unique m-cover is exactly E(A).

For unselected base set F, replacement spoke choices at distinct apices are edge-disjoint variables and cover precisely their actual induced page graphs. This proves the exact decomposition vc(A[F])+sum_s vc(A[F][N(s)]), and strictness at least|F|+1 is equivalent to uniqueness. No incidence relaxation or replacement of vertex cover by matching is made. For a full A-star at u, each participating apex contributes exactly one and the universal hub contributes one, giving the degree inequality stated in the source.

This is a cover-side structural reduction, not a full packing conclusion or general cone-availability theorem. The proof correctly identifies the need for all global minimum covers to be exact, and cannot be inferred merely from one chosen exact cover. No gap found.
