> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: one outside triangle releases two endpoint augmentations

Verdict: PASS, PROVED_ORDINARY for notes/matching26_one_outside_triangle_repair_v1.md, SHA-256 016bc719e8a5018972fd616932938c4f78d8ca18eb8b7d9df3808cfcb473ade0. This is an actual change to the retained packing, with automatic compatibility restricted to codegree two. No computation or Lean verification was needed.

At codegree two, the previously reviewed endpoint links decouple from the old opposite endpoint family. Fix T in M_0 and release exactly its occupied edges while retaining every other outside triangle. Every newly usable rim edge belongs to E(T). A matching uses at most one edge of a triangle; deleting that edge from an improved matching leaves an old usable matching. Thus release raises each hub-deleted matching number by at most one.

If both endpoints gain one after deleting the SAME hub h from their links, the two chosen matchings have no common physical rim edge. Such an edge would have both endpoints in the two-element common-neighbor set, but removing h leaves only one common vertex. The link construction already avoids every retained outside rim, and opposite endpoints are excluded, so no other cross-family collision is possible. Replace both old endpoint families, remove T, and append uvh using the two deliberately unused h spokes and missing uv. The resulting count is(k-1)-m_u-m_v-1+(m_u+1)+(m_v+1)+1=k+1.

The three-for-one literal instance is valid without a hidden matching inference. For T=xab with a,b outside all marked vertices, the unused spokes ua,vb and the deleted spokes ux,vx permit uxa,vxb. Their different rim edges xa,xb were freed by removing T. Appending uvy uses only the missing edge and other deleted spokes. All three triangles are pairwise edge-disjoint and avoid M minus T.

At general codegree the same replacement remains valid only with explicit disjoint PHYSICAL rim sets for the two selected improved matchings. Automatic disjointness and opposite-endpoint decoupling must not be carried over. The star555 example correctly shows both released augmentations using06 and hence colliding. The small K5-pq codegree-two example correctly has only one endpoint gain after releasing its sole outside triangle: the p-link after removal of one hub has only one vertex and cannot augment.

This proves a conditional paid repair, not existence of a jointly releasing triangle. A surviving interface forbids simultaneous gains for every T and reserved hub, but that quantified obstruction itself supplies no new reduction. Any later multi-triangle release must redo the gain accounting and physical-edge compatibility; it is not inherited for free from this one-triangle operation.

Frozen UTC: 2026-11-16T23:57:54.784909+00:00
