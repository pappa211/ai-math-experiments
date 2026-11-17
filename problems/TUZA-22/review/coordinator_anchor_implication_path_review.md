> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: repeated selected bases on contradiction paths

ACCEPTED, 2026-11-16, at the exact obstruction scope of notes/challenger_tree_anchor_implication_paths_v1.md.

The tree bipartition gives one even and one odd nonselected edge per one-selected-edge packed triangle, and only an even chord for a two-selected-edge triangle. Every surviving binary triangle consequently has an even literal from one pair and an odd literal from another, with an unused selected edge as its third edge. The monotone implication interpretation retains all actual triangles and explicitly describes only the restricted one-literal-per-pair cover.

For a simple forced contradiction path, assuming pairwise distinct unused selected edges makes the endpoint units and all binary triangles a packing: each literal appears once, and the only possible extra nonselected edges at its two ends have opposite parities. They cannot be literals by the unit definition. The first end can meet at most one two-selected-edge packed member, while the other cannot. Absence of that member augments P; if present with a one-selected-edge final unit, replacement preserves cardinality and decreases p2; if the final unit has two selected edges, the entire path cancels all nonselected edges and leaves a forbidden nonempty even-degree subgraph of the selected forest. Thus a physical unused selected edge must repeat.

No bound on the number or joint cost of repairs follows. The token-graph representation also checks: one-selected-edge triangles correspond to even/odd auxiliary-edge pairs related by a move along their selected base; actual packings require distinct physical base labels as well as an auxiliary matching. Dropping those labels would change the optimization problem.
