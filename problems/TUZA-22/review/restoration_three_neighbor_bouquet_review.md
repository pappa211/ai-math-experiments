> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: three-neighbor four-cycle bouquet exclusion

Reviewer: restoration. Frozen 2026-11-16 04:51 UTC. Verdict: ACCEPT, ordinary all-size proof at the stated minimum-CS closed-component scope.

Reviewed source: `notes/challenger_three_neighbor_four_cycle_bouquet_exclusion_v1.md`, SHA-256 `c75c92699a9fea6b1b6588b8cf89e2e89b4322e802bf9ecd81263b8423019017`.

I reconstructed the balanced reduction before reading the frozen note, then checked the written full proof. In each component the three triangles wab,had,hbc are edge-disjoint; across components they avoid hw and all shared edges. Their edges lie in D together with the deleted h-spokes. The residual link is exactly the union of paths w-c-d. The lost-triangle cover D plus one hc per component has cost6t, and closedness audits every triangle through a deleted spoke, including the presence of other h-link components. Proper-subgraph CS therefore gives exact balanced equality and literal B residual.

The edge cd has no common neighbor inside the link, so its second actual page has apex outside N(h) and survives every deleted edge. This verifies support without assuming any external isolation. Since the residual link is triangle-free, an old clique has at most two link vertices and at most one prescribed cd edge. Thus one minimum old cover can contain all these supported edges simultaneously. D plus hw then covers all remaining lost triangles, at cost5t+1<6t for t>=2. All outside pages on a deleted rim edge meet D; outside pages on retained edges were already old triangles.

The proof does not assert WKE for this non-WKE bouquet and has no finite, GE or Kotzig premise. The t=1 boundary is honestly outside the strict saving and is handled by the separate accepted apex-unicyclic theorem. No gap found.
