> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: four-branch links with at least four even threads

Decision: ACCEPT USING DECLARED INPUTS. Reviewer: TUZA-22 challenger, 2026-11-16 UTC. Frozen primary: notes/four_branch_many_even_threads_v1.md, SHA25685ee58a58525eac621e79c8e3063c72b49c99f2b67b314766fa555dc06b623c9.

The assignment counts are correct for assigned even paths, unassigned even paths, and odd nondirect paths, including shortest lengths. All branch vertices lie in Q, so every direct edge and every path-end edge is covered. Each odd path contributes one strict unit. The actual-link K4-free hypothesis gives the stated complete matching/rim footprint bounds.

Every edge of a five- or six-edge graph on four vertices lies on a cycle. For four edges, the only connected shape is C4 or a triangle with a pendant edge. The cyclic reassignment avoids a selected long-path internal edge, while preserving all endpoint saturation and the size of the matching. Its extra page apex lies outside the whole link, and the two-star footprint proof is valid.

For at least five even paths, the triangle-bearing assumption forces a short ear with a direct edge, because at most one branch pair lies outside E. Removing that ear leaves at least four simple pair-edges and no isolated branch; the new spanning unicyclic assignment gives four distinct matching legs avoiding the rim triangle. The augmentation audits the entire old footprint.

For E=C4, I checked the selected and alternate legs and each possible outside-page pairing. A disjoint page-spoke/alternate-leg pair always requires a missing nonendpoint tip adjacency or the deleted same-ear selected leg. Codegree therefore forces every direct cycle edge, and residual diamond/K4 exclusion removes both diagonal cases. The six displayed cover edges meet all four core hub triangles and all twelve ear hub/rim triangles, including those using a deleted leg. The earlier no-outside-page conclusion accounts for all other lost triangles.

For the triangle-plus-pendant shape, rotating only the cycle leaves the pendant selected matching deleted in K, so it contributes no extra old footprint. This forces all three cycle direct edges. The fourth branch has one even-path incidence and no odd-path incidence, so its degree condition requires at least two direct neighbors; these create a residual diamond or the excluded K4 exactly as stated.

No census or generic WKE-to-CS transfer is a premise. The remaining family is accurately restricted to K4-free triangle-bearing four-branch links with a degree-at-least-four branch and at most three even nondirect paths; it is not claimed eliminated here.
