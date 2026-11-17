> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Coordinator review: conditional internal tree interface and availability boundary

Reviewed 2026-11-16. ACCEPTED at the exact conditional scope in notes/tree_internal_packing_interface_v1.md.

For a supplied internal packing I and retained tree-edge cover D of all internal triangles containing the selected edges of I, deleting any R from T-D cannot uncover an internal triangle. Global cover minimum therefore gives the external apex Hall inequalities. The existing exact forest Hall lemma produces one external page on every base of T-D; outside spokes and unused selected bases make these pages disjoint from I. The weight is 2|I|+|T-D| >= |T|. No availability claim is used.

Independently reconstructing the boundary: the core edges ac,ad,dc,ax,cx,ay,cy give exactly three triangles sharing ac. T={ad,dc,ax,ay} is a tree. Four separate degree-two outside vertices give four edge-disjoint pages, and T covers all seven triangles. Thus tau=nu=4. Any T-restricted cover of the internal triangles needs ax,ay and ad or dc, whereas internal packing size is at most one. No I,D interface exists. The weighted target itself holds using the four outside pages.

The endpoint parity statement is also valid: in a one-tree-edge triangle, only one of its two nonselected edges has endpoints of the same tree bipartition color, so only that edge can be a unique length-two-path chord. Hence it can conflict with at most one two-tree-edge triangle through a nonselected chord. This does not exclude two pages sharing the same chord, the remaining chord-book obstruction.
