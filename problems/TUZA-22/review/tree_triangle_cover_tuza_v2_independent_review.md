> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: arbitrary tree/triangle cover

Verdict: ACCEPT, ordinary inequality. Frozen source `notes/challenger_tree_triangle_cover_tuza_v2.md`, SHA256 `8f4bc184a26596a8275c14d31e3b4340fa6996caddd4d16553e7ae1f25f32e20`. Reviewed2026-11-16 by source_audit against the separately reconstructed normalization in `review/tree_triangle_cover_tuza_independent_review.md`.

The minimum-cover hypothesis has been removed correctly. For each tree family, the anchored internal cover plus the exact outside-family cover directly gives tau_i<=|D_i|+q_i<=2|I_i|+q_i. No minimum optimality is needed. Triangle families of cost at most two use their internal triangle, which creates no cross-family conflicts; cost-three families retain the same q2/q3 classification. Reserved q2 odd-cycle components still have exact total family cost3h.

The reviewed coherent-sign proof consequently pays c_total=sum tau_i, not |C|. Independent local covers can overlap, but their union covers the entire actual graph, giving tau(G)<=sum tau_i. The direction of this inequality is correct, and no additivity is asserted. Thus the stronger displayed bound tau(G)<=sum tau_i<=2nu(G) is justified.

The existence class is hereditary: intersect a supplied cover with the surviving graph edges; it still meets every surviving triangle, and its components remain trees or triangles. This concerns an arbitrary supplied cover, not existence of a minimum cover of that form.

All other conflict, isolation, and averaging checks are unchanged from the full v1 independent review. Equality classification remains open at this exact enlarged scope. Therefore this is an inequality base, not yet a combined-CS base for the minimal-CS kernel localization.
