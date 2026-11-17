> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: triangle-cover normalization, supplied triples, and leaf cycles

Verdict: ACCEPT the following three ordinary arguments at their stated scopes.

## Extremal minimum-cover normalization

Reviewed `notes/challenger_triangle_component_normalization_v1.md`. A literal triangle cover component has a local triangle family requiring three cover edges, because any smaller local cover improves the full minimum cover. Three-base page matching with size two forces exactly two full apices: a singleton Hall obstruction gives a two-cover, while a two-apex total union must contain both on every base by actual triangle closure. The replacement {ax,ay,bc} covers the entire assigned family at equal cost and retains every other original cover edge. Its new path can become a literal triangle component only by joining the endpoints of an old isolated selected edge. The count of triangle components otherwise strictly decreases.

In the remaining isolated-edge placement, the five vertices form K5. Every outside triangle on a core-apex spoke would have no selected edge, so the whole outside boundary lies in the single apex edge. The safe-clique patch theorem applies with that exact boundary. This excludes the exception in a class-minimum CS failure and gives the stated EXISTENTIAL choice of a minimum cover. Neither universal quantification over minimum covers nor a bound on larger cover components follows.

## Three supplied pages per core

Reviewed `notes/three_private_pages_triangle_cores_v1.md`. With three pages per vertex-disjoint triangular core, every cross-core conflict requires reciprocal apex incidence, giving a core interaction graph of maximum degree three. Choosing all pages at independent cores and internal triangles elsewhere yields exactly t+2|I|. The elementary strict independence bound is correct: a low-degree vertex removes at most three vertices, and otherwise two nonadjacent neighbors of a cubic vertex remove at most seven. A connected cubic graph with all clique neighborhoods is K4.

On a K4 interaction component, each core's three slots target its three different neighbors. The twelve page nodes therefore form six isolated conflict pairs. Choosing one page per pair while choosing none at one designated core allows that core's internal triangle as a seventh triangle. Different interaction components combine without hidden edge conflicts. Hence the strict packing bound holds for the supplied configuration, without a minimum-cover assumption. Availability and mixed cover components remain separate.

## Leaf-cycle corollary

Reviewed `notes/cover_leaf_cycle_corollary_v1.md`. At a selected cover leaf v with parent w, every rim edge away from w is selected, so the whole link minus w equals the displayed induced selected graph. If that graph were acyclic, all other link components would be forests of minimum degree two, impossible; the remaining whole link would be the excluded apex-forest component. Thus a selected cycle must be visible in the neighborhood away from the parent.

For a cover with exactly one cycle, the parent is outside that cycle and every leaf is adjacent to all cycle vertices. Two such leaves joined by an unselected edge would form an uncovered triangle with any cycle vertex. A selected edge between leaves is necessarily an isolated K2 selected component, explaining the necessary connectedness qualification for leaf independence.

All three reviews reconstruct actual triangle and edge incidence. None introduces a finite census, an external matching theorem, or a global cover-availability claim.
