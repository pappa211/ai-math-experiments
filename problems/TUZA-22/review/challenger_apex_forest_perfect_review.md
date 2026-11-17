> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh challenger review: apex-forest link with perfect forest matching

Verdict: ACCEPT at the stated closed-link and perfect-matching scope, using the declared minimum-CS and previously reviewed triangle-free WKE inputs. I reconstructed both reduction choices and the entire simultaneous block footprint. No unhandled outside-page assumption was found.

The forest count is exact: with2r vertices and c tree components, F has2r−c edges, so F−M has r−c. Adding w to one endpoint per remaining edge gives a strict cover when c>=2. In the connected case, two adjacent remaining edges save one more endpoint and again make the tuple strict. Otherwise M and F−M are matchings whose connected union is the alternating even-order path. Its endpoints are forced adjacent to w by link minimum degree2.

In Case1, N leaves path endpoints1 and2r unmatched. At least one is outside the chosen M-edge f, so N plus wt is a genuine r-matching. Its hub triangles avoid the rim triangle wf in every edge, including the possible w-edge because t is outside f.

In Case2, N plus w1 is a genuine initial r-matching and deletes the selected triangular N-edge f. No M-edge has two w-neighbors, so a one-endpoint-per-M-edge selection can include every surviving w-neighbor (with1 exempt because w1 was deleted). This is an r-cover of all residual link edges. The augmenting hub matching M avoids f and contains no w-edge, so it is edge-disjoint from wf.

For either residual K, any clique block contains at most two F-vertices, since an actual clique on three F-vertices would contradict that F is a forest. It may also contain w. The selected rim triangle's base f is deleted, so at most one of its w-spokes can occur in a residual clique block. The augmenting hub matching contributes at most one surviving rim edge to such a block: two matching edges would require four L-vertices, except for a potential w-edge/F-edge overlap, which the matching condition itself forbids. If that surviving matching edge and a rim-triangle spoke were disjoint, they would likewise require four L-vertices. Thus the whole footprint, not merely a per-triangle footprint, is a star of at most two edges. All hub spokes were deleted. This is exactly the simultaneous K4/K5 avoidance interface.

The final leaf-of-cover observation is also sound: when vw is v's only cover edge, every link edge xy away from w must itself be in C to cover vxy. Therefore removing w from the link leaves a subgraph of the cover forest. The review does not extend the lemma to the nonperfect-matching branch or assert availability of a forest minimum cover.

This is an independent internal proof review, not a new Lean check or a novelty claim.

Reviewed source SHA256: 0cbe3a07b066886e090a66ebad46a0ac04a9acb0672b6e360e3b219abb3cb550
UTC: 2026-11-15T23:30:24.763789+00:00
