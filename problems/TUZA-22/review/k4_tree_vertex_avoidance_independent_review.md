> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: fresh K4 gluing vertex avoidance and insertion

Verdict: ACCEPT at its literal representation scope. Source `notes/k4_tree_vertex_avoidance_insertion_v1.md`, SHA256 ab58dbf1bc2ab1a868e4a7cee5412ea93e85edf859d5c4f7467472c5546e209f.

The generic insertion step is exact: a maximum packing avoiding the new page's apex avoids both old spokes, and the new edge was absent, so the new page appends. The cover can grow by at most one. Thus vertex avoidance plus the old inequality gives strict insertion.

I checked all three induction cases for a fresh K4 attached at ab. Deleting an old vertex outside a,b preserves an old avoiding packing, and a new triangle avoiding ab is independent of it. Deleting a or b makes the remaining new face avoid ab. Deleting a new vertex leaves a face containing ab, but the old packing can avoid a and hence ab. Every actual triangle belongs to an attachment piece by induction on the fresh vertices; two triangles in a K4 always share an edge, giving the upper bound of one per piece. Thus the constructed packing after any vertex deletion is maximum.

The underlying CS claim needs no fine classification or deficit monotonicity theorem. For any component with b≥2 pieces, cover the first two K4s by two-edge covers each containing their common attachment edge, using three edges total. Cover each remaining piece by any two-edge cover. This gives tau≤3+2(b−2)=2b−1. A single piece has tau2, nu1. Across actual triangle components, cover and packing add; shared graph vertices and edges in no triangle do not affect this reasoning. The representation explicitly forbids additional actual crossing triangles.

The minimum-CS residual application additionally uses the already established residual packing preservation. No claim is made that every near-tight residual has the fresh-gluing representation. The main vertex-avoidance and strict insertion proofs are ordinary and do not rely on the more detailed fresh-clique-tree classification.
