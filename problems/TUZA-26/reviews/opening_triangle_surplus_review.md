> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent missing-edge triangle-surplus discriminator review

Status: ACCEPTED ORDINARY as an exact profile comparison and CONDITIONAL cover-saving operation. This is not a new global reduction or a classification of defect-two supports. No computation or Lean check.

Bound source: notes/apex_missing_edge_triangle_surplus_v1.md SHA-256 013909b8e103abb4883195f3bea84674fea5dc35d6eccc336b2e90683bc61510.

The full-triangle constrained-cover identity is exact: the least K cover required to contain all three T edges has size 3+tau(K-E(T)). Thus T is in a minimum K cover exactly in the displayed lower-cover row. The one-edge deletion bounds from H=Q-E(T) give precisely four numerical possibilities before the B exclusion. The zero-defect case has R in B, e critical in H, and all original uv-pages survive because T avoids both endpoints. It falls exactly within the separately accepted minimum-Q triangle-plus-critical-edge B exclusion. Removing that row leaves the three stated cases.

The remaining lost-unit case is packing-neutral AND cover-neutral when e is restored, with both R and H defect two. In particular it is not legitimate to deduce a critical edge or to name R from minimum-Q rules. The displayed two restoration orders have the exact stated responses; the cover increments really differ by one depending on the order.

In the lost-unit row every minimum H cover omits e, since deleting e from a minimum cover containing it would contradict tau(R)=tau(H). Such a cover is also minimum in R and already hits every uv-page, irrespective of codegree. A triangle containing two T edges is T itself, and no triangle can contain e together with a T edge because their endpoints are disjoint. Therefore if this cover hits one entire ordinary T-base family, adjoining just the other two T edges covers ALL Q triangles at cost 2k-2. This is a literal paid cover extension preserving the outside cover.

Conversely, the failure of that sufficient operation forces, for every minimum H cover, an ordinary page on each T base whose two old spokes avoid that cover. These pages need not be B-bare and need not be compatible with any maximum old packing. The source correctly makes neither inference. Availability of a wholly hit family or an actual compatible packing switch remains OPEN. The row bookkeeping alone gives no further reduction, and the weaker doublecone/star controls do not settle this full-profile question.
