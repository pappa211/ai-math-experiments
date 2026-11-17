> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Coordinator independent review of mixed matching/Hall selection

ACCEPTED at the exact selection scope of notes/challenger_tree_mixed_hall_selection_v1.md. Reviewed 2026-11-16.

For any maximal J-matching, the unmatched set U is J-independent. Every subset of U therefore has the assumed color-independent-set Hall inequality. The induced clique-block graph retains that structure; the existing self-contained block-graph Hall theorem gives a proper list coloring. No matching-matroid or new mixed theorem is required.

In the actual minimum-tree-cover application, J-independent removal of selected edges leaves every two-selected-edge triangle covered. The only uncovered triangles are private pages on removed bases. Covering those pages by per-apex minimum vertex covers of their base forests has cost at most the sum of matching numbers: duplicate spokes can only lower actual cost. A sum below the number of removed bases would contradict minimum ordinary cover. The needed Hall inequalities follow. Matching edges of J yield edge-disjoint internal triangles, since two length-two paths in a tree cannot have the same chord.

The note correctly stops before a packing claim. Proper lists eliminate same-apex spoke conflicts, but reciprocal internal pages and a selected two-base triangle can all share a single nonselected chord. Its three-page-book illustration has nonminimum selected cover and proves only that the selection mechanism by itself is inadequate. Full minimum-cover optimality still has to repair that geometry. The finite abstract diagnostic is redundant after this elementary argument and is not an all-size premise.
