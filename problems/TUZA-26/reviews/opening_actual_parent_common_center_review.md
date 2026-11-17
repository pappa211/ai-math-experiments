> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent common-center packing and cover discriminator review

Status: ACCEPTED ORDINARY as supplied packing operations and necessary obstructions. No enabled global reduction or suitable triple existence is inferred. No computation or Lean verification is used.

The complete mixed-triangle list is correct: a triangle using restored edges from different families must use two spokes at the common center a and an old cross edge between their leaf pairs. An opposite base is disjoint from every other family's restored edge, and no third cross-leaf edge is restored. Thus there are no additional two-family or three-family mixed cases.

Every old clique contains at most three core leaves, one from each opposite pair. A leaf matching therefore contributes at most one edge to any old clique, and its entire old footprint is avoidable by a maximum B packing. This remains true with arbitrary shared old vertices and background edges.

The five-packing operation checks including equal outside apices p=q. The two bare opposite pages share no edge, and a perfect matching on the six leaves avoiding their bases supplies three hub triangles with disjoint spokes. Its rim edges avoid the two page bases and cannot equal an outside-apex spoke. Only the old rim matching contributes supported old footprint. Appending these five actual triangles over an old maximum therefore gives m+5. The outside-apex requirement is essential and is not relaxed here.

In the three-two-coverable case, the union of the three selected family covers and an old minimum cover leaves exactly the stated mixed rim graph J0. It is triangle-free because it is an old B subgraph avoiding the old triangle cover. A triangle-free graph with matching number at most one is a star or empty; adding its center spoke (if needed) completes a full cover at cost at most 2m+7. Hence every surviving choice of these covers leaves two disjoint unhit mixed rims. Avoidability of those two old rims alone gives no five-packing: the three further compatible pages remain missing.

The separate opposite-family cover obstruction also checks. Six center spokes cover every fan page, central triangle and mixed triangle. If one old minimum cover hits the ordinary pages on two opposite bases, adding the third opposite base covers the remaining pages and saves one. When both selected opposite families have no bare page, absence of any adjacent K4 footprint incompatibility allows a single old minimum cover to contain all their supported footprints, by the whole-family one-footprint property. Thus failure of joint covering forces such an incompatibility; its presence is not asserted sufficient, nor does it force bare-page existence.

An exceptional family raises the naive cover budget and requires separate payment. The precise forced-rim condition is retained as insufficient for packing, and the earlier invalid omission of mixed triangles is not repeated. The selected common-center B cube itself, and the enablement of either paid operation, remain open obligations.

Bound source: notes/apex_actual_parent_common_center_discriminator_v1.md, SHA-256 c2f6d7d4fec40c4e6116ae9757f245c9603da61915b3645b86bf5affa4500730.
