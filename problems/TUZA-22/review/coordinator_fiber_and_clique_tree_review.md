> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review of fiber replacement and the fresh-clique class

## Independent-hub fiber replacement

ACCEPT `notes/independent_hub_fiber_cover_v1.md` at its stated ordinary scope. For a fixed hub s, bases of its packing fiber are a matching. Essential witnesses have other independent hubs and distinct nonhub endpoints, so all witnesses in that one fiber are mutually edge-disjoint. Their nonbase edges avoid the entire original packing. A new s-hub matching on K_s avoids every original base and every retained other-hub spoke. It also avoids the witness bases and spokes by hub/nonhub incidence. The whole-fiber replacement is therefore valid and proves the exact bound mu(K_s)+e_s<=|M_s|.

The cover by all packing bases plus residual hub-spoke covers is complete, and the independent hub set makes its edge counts additive. Residual vertex-cover/matching equality yields the stated saving. The proof does not assert compatibility of witnesses selected from different fibers, global bipartiteness, or arbitrary residual-link equality. Its fixed-base limitation is real; the retained non-WKE cone control addresses precisely that missing premise.

## Exact defect-one fresh-clique classification

ACCEPT `notes/defect_one_fresh_clique_tree_classification_v1.md` at the literal fresh K4/K5 edge-gluing scope. Every new triangle is confined to its piece, giving exact packing additivity and the stated two cases for cover cost. A defect increase cannot later cancel, so only neutral attachments follow the first one.

For the first two pieces, K4's cover through the shared edge is uniquely that edge and its opposite; K5 admits a minimum cover through the shared edge and any prescribed second edge. Hence a neutral third piece must use a spoke of a K4 side. With two adjacent central attachments, the complete central-cover count c-j identifies exactly the one remaining ineligible third star edge. All leaf edges are eligible by switching whether their attachment is selected. After a third star attachment, every central and leaf edge is eligible. This exhausts the possible construction sequences and proves the sharp packing bound seven, with the two-K5 case separately retained.

The edge-deletion identities are valid even when the deleted edge is the shared attachment. New-edge resilience uses an old packing avoiding the attachment. The final B triangle-deletion statement for the central-K4 branch follows by removing its opposite face. No extension to arbitrary clique representations, crossing edges, or arbitrary near-tight graphs is used.
