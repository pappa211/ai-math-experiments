> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent semantic audit of the new R2 foundation

Verdict: ACCEPT the reviewed source statements and mathematical reasoning in GraphAPI, WholeFootprint, CliqueChoice and BlockChoice, at their exact stated scopes. Hashes are fixed in foundation_semantic_review_hashes.json. The coordinator reports development compilation; this reviewer has not run a compiler and does not claim an independent build or theorem-axiom audit. Those remain required at final freeze.

## GraphAPI

B is a direct abbreviation of ComponentCliques, preserving all actual shared-edge triangle components. CS is inequality plus equality iff B; no degree antecedent. The cs_iff_good bridge is correctly oriented from the existing unconditional converse.

GraphCover requires C subset G.cliqueFinset 2 and actual triangle coverage. exists_graph_min_cover uses the existing actual-edge optimum witness. tau_le_iff_graph_cover proves a genuine equivalence to the internal optimizer rather than defining a new unrelated parameter. Empty vertex types, empty graphs and unsupported background edges are not excluded.

Nonedges requires every supplied set to have size two and not be an old 2-clique. addEdges symmetrizes an unordered pair and rejects loops through a!=b. It keeps all old adjacency. Malformed extra sets would be ignored by adjacency but are excluded in the exported Nonedges contract. The general insertion_cover_bound is valid even without Nonedges: irrelevant supplied sets merely make its cardinality upper bound weaker; the witnessed new triangles necessarily use actual pair members. This general helper does not weaken R2's insertion hypothesis.

one_edge_insertion assumes B(H), a genuine absent size-two edge, and an actual new triangle. It proves tau(H+e)+1<=2nu(H+e). It reconstructs independence of the two terminals, obtains the inserted base in the new triangle, applies existing all-size augmentation, and combines exact old equality with the one-edge cover bound. It does not assume M0 or CS. GraphAPI imports MinimalObstruction for the Good bridge, but the one-edge theorem's mathematical proof dependencies are Critical/component facts; importing a module is not the same as assuming its minimality proposition.

## WholeFootprint

pageApices is univ filtered by BOTH old adjacencies. pageSpokes is the biUnion of both old spokes over every such apex. No page count/order bound occurs; an apex equal to an endpoint cannot pass loopless old adjacency. The advertised cardinality bound is on this entire family intersected with one literal block's edges.

triangle_subset_block_of_edge uses exhaustive actual-triangle decomposition. If a triangle belonged to another block, the shared edge would violate independent edge supports. two_neighbors_in_block then forms an actual crossing triangle using the clique edge between two distinct block vertices and forces its outside vertex into the same block.

whole_page_footprint applies card_le_one to two arbitrary footprint members. Opposite-terminal spokes force both nonedge endpoints into the clique immediately. Same-terminal spokes either coincide, or their distinct apices invoke the crossing-triangle closure to force the other endpoint into the clique. Each contradiction uses the old nonedge. This is exactly the ordinary full-footprint argument, not a pointwise substitute. The hypothesis is CliqueDecomposition, whose equivalence to B is already separately proved; the exported B-level use must pass through that equivalence. No CS, packing optimizer, attachment restriction, or footprint assumption is hidden.

## CliqueChoice

The finite witnesses consist of the prescribed edge plus all edges on its complement: the opposite edge for K4, complementary triangle for K5. They cover all clique triangles, have sizes 2 and 4, and are actual clique edges. Kernel decide is used; no native_decide occurs in the reviewed source.

clique_cover_choice_transport has an explicit finite witness theorem premise as a general transport helper. clique_min_cover_containing discharges that premise with the concrete K4/K5 witnesses and known exact tau, and exports no such unproved premise. It works on arbitrary labelled finsets via injective embeddings and existing cover/tau transport. clique_max_packing_avoiding reduces a single actual edge to the existing proved star-footprint avoidance and preserves exact maximum size. Ambient nonemptiness is obtained from the actual prescribed edge when needed, not assumed globally.

## BlockChoice

The minimum-cover footprint helper distinguishes empty from singleton supported footprint. A nonempty footprint has a unique edge, for which CliqueChoice applies. An empty footprint uses an existing supported optimum. The global cover biUnion is a minimum old cover because all local choices lie in edge-disjoint block supports, so cardinalities add exactly. It includes EVERY prescribed supported edge simultaneously. Background edges in D are excluded from the requirement only by the explicit intersection with old triangle support; this is the correct condition for non-bare-page coverage.

The maximum-packing helper turns each <=1 footprint into the size<=2/star interface and assembles an exact old maximum packing disjoint from all of D. In empty intersections it chooses a vertex from a size-four/five block to supply the vacuous star witness; there is no unintended Nonempty V assumption. The theorem handles no blocks and triangle-free H vacuously.

## Remaining acceptance boundary

These are meaningful supporting theorems, not R2 itself. Still required are the minimum-cover-to-all-nonbare-pages bridge, arbitrary new-triangle packing gain, tight increment/bare-page/intersection consequences, adjacent and disjoint geometry, the no-new-triangle/component transition, exact final R2 type, semantic controls and independent clean build/axiom audit. No mathematical source correction was exposed by this review.
