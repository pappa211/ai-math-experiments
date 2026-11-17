> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: CS for the forest triangle-cover class

Decision: ACCEPT, ordinary all-size scoped theorem, using the pinned class-local minimal-CS framework and the two self-contained apex-forest branches. No unrestricted conclusion or forest-cover availability claim is justified.

Frozen sources:

- notes/forest_triangle_cover_cs_v1.md, SHA256 c4c50c12294a609d00ea49fee692c3328f489826173d07defc2e08e040f63893.
- notes/apex_forest_perfect_link_exclusion_v2.md, SHA256 e82d2ea2eaeb42b3a91b67ddc4a52a30ce83e01f8e065a208f341d1cbf3052a6.
- The nonperfect v2 branch was independently accepted in review/apex_forest_nonperfect_v2_independent_review.md.

## Perfect branch, independently reconstructed

If the forest has2r vertices and c components, deletion of its perfect matching leaves r-c edges. Selecting one endpoint per remaining edge and the apex w gives a link cover of size at most r-c+1. Thus c>=2 is strict. If c=1 and two remaining edges meet, selecting their common endpoint saves one and is again strict. The remaining connected union of two matchings is a path. Robustness makes r>=2, and minimum link degree forces both path endpoints adjacent to w.

In the triangle-free case the new matching N∪{w1} has size r, and avoids every original perfect-matching edge f. Codegree supplies an external page on f. Its third vertex lies outside L, since an internal third vertex would create an L triangle. Every residual clique has at most two L vertices, so a page spoke and a surviving matching edge must meet if they both occur. The deleted f prevents two page spokes in one clique. This gives the required complete star footprint and directly replaces the old Kotzig/WKE input.

If some original matching edge f forms a rim triangle with w, the opposite path endpoint t can be chosen outside f; N∪{wt} avoids all three rim-triangle edges. If no original matching edge does, a triangular edge f belongs to N. The initial matching N∪{w1} has a cover choosing one endpoint of every original matching edge and including every w-neighbor except1. This choice is possible precisely because no original matching edge has two such neighbors. It covers every surviving link edge. The new original perfect matching avoids the rim triangle.

In either internal case, a residual clique contains at most three L vertices. The new matching therefore contributes at most one surviving edge. The rim triangle contributes at most one surviving spoke because its base was deleted. If both edges were disjoint they would require four L vertices. This is a simpler equivalent check of the source's complete-footprint paragraph, and confirms the selected family can be appended after avoiding a star of at most two edges in each K4/K5 block.

All reductions are proper edge deletions, and the lost-triangle cover counts every outside page on a deleted rim edge by selecting that rim edge itself. Closedness accounts for all hub-spoke triangles. No global attachment assumption enters.

## Hereditary-class assembly

The class admitting SOME forest triangle-edge cover is closed under arbitrary edge deletion: intersect the same cover with the surviving edge set. Thus choosing an edge-minimum CS failure within the class allows the established minimality, codegree, link robustness and tight-B residual deductions to be applied to its proper edge-subgraphs. This is within-class induction, not an assumption that unrestricted CS is true. Neither the cover used in the argument nor its restriction must be minimum.

For a leaf v of a nonempty forest cover C, with selected neighbor w, every link edge xy avoiding w must belong to C: the actual triangle vxy has neither spoke in C. Therefore the induced link minus w is a forest. Any link component not containing w would be a nonempty finite forest of minimum degree at least two, impossible. Hence the entire link is one closed connected apex-forest component. This justifies the exact hypotheses of one of the two reviewed branches and yields the contradiction.

The nonempty-cover choice is legitimate: a triangle-free graph already satisfies CS, so a minimum failure has a triangle. The edge vw puts w in the link, and the minimum codegree property prevents a degenerate isolated link situation.

## Equality and trust boundary

A forest cover restricted to a literal K5 is bipartite, so one of its bipartition classes contains three vertices. All three edges of that clique triangle are outside the cover, contradiction. Thus the class contains no K5 subgraph. Combined CS therefore leaves only literal K4 triangle components under equality. The converse follows from exact packing and cover additivity over actual shared-edge triangle components; triangle-free background and permitted vertex sharing do not change that accounting. Triangle-free equality0=0 is included vacuously.

The theorem has no order, degree, density or finite-census hypothesis. It proves CS for all graphs admitting an acyclic triangle-edge cover. The established pinned minimal-CS framework remains an input, and this review does not re-label it as a completely independently discovered proof. General Gallai–Edmonds, Konig and Kotzig theorems are no longer premises of the new branches. No novelty claim is established by this review, and arbitrary minimum CS failures need not have such a cover.
