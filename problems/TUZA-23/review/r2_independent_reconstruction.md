> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent ordinary R2 reconstruction and reuse assessment

Reviewer: separate TUZA-23 AI specification/review role. This records source reading and mathematical reconstruction only. No mathematical correction to the ordinary R2 argument was found. Fresh build and transitive axiom checks remain required.

Let m=nu(H). Actual edge-support component additivity and K4/K5 parameters give tau(H)=2m. Any prescribed supported edge belongs to a minimum old block cover and can be avoided by a maximum block packing. Background edges belong to no old triangle or packing.

For a nonedge uv, both u,v cannot belong to one old literal clique. If two spokes from the full family of ordinary uv-pages lie in one block, they are ux,uy after symmetry. The actual old triangle vxy shares xy with the clique component. Its support forces v into the literal clique, contradicting uv absent. Thus the ALL-page supported footprint has at most one edge per block. Choosing minimum covers containing those unique footprint edges simultaneously covers every non-bare page.

Any new triangle has an avoidable old footprint: one-edge pages have at most one edge per old block, and two-new-edge triangles have only one old edge. Hence nu(G)>=m+1. The cover bound tau(G)<=2m+|F| excludes a new triangle when |F|<=1. With two edges and tightness, nu(G)=m+1 and tau(G)=2m+2. If either new edge lacks a bare ordinary page, the simultaneous old cover plus the other inserted edge saves one cover edge, impossible. Every ordinary page of one kind intersects each bare page of the other kind; otherwise they extend a suitable old maximum packing by two.

For adjacent new edges ab,ac, ordinary page apices lie outside a,b,c, and pages intersect precisely when their apices agree. Fixed bare pages force a single common apex x for all pages. Edge bc cannot be old because bcx would support bare spokes bx,cx. Thus there is no two-new-edge triangle, and ax covers all new triangles, contradicting tightness.

For disjoint ab,cd, page intersection forces every new triangle onto the four endpoints. Bare pages force at least three cross edges. Exactly three yield a diamond with one edge meeting both new triangles, too cheap. Four yield K4. If any cross edge is old-supported, choose an old minimum cover containing it and append its opposite K4 edge, again too cheap. All cross edges are therefore old-background, so new K4 support is edge-disjoint from all old triangle supports. There are no other new triangles. This gives B(G). If there were no new triangles from the outset, B is unchanged.

## Reusable exact APIs

- Tuza.Basic/Graph: finite unordered edge/triangle representation, packing and cover extrema, monotonicity, supported minimum-cover existence, actual-edge graph_min_cover.
- Tuza06.Components: exact componentCliques_iff_decomposition, component_eq_cliqueFamily_of_support, componentCliques_equality. Exhaustiveness includes all actual triangles and permits vertex-sharing blocks.
- Tuza06.FiniteCliques: K4/K5 exact parameters, K5 two-edge avoidance, arbitrary-label transport. Finite subproofs use kernel decide in inspected source, not native_decide. Actual closure checks still required.
- Tuza06.Additivity/BlockAggregation: finite supported-family/block additivity and maximum packing assembly.
- Tuza06.Pages.triple_edge_overlap and two_page_footprint: useful pointwise bounds, NOT the all-page-union R2 lemma.
- Tuza06.Footprints.blocks_avoid_edges: assembly from proved local size/star footprints; these hypotheses cannot replace the obligation to prove them.
- Tuza06.Critical: one_triangle_augmentation and single_edge_cover_extension support one-edge insertion strictness; tight_critical_edge proves the local conditional accounting.
- Tuza06.MinimalObstruction: Good is unrestricted combined CS with the known converse separated; existence by finite edge-count minimization, minimal_every_edge_in_triangle and minimal_tight_critical have no sparsity hypothesis. Connected triangle support is a remaining independent M0 component obligation.

WARNING: Tuza06.Statement.CombinedStatement includes Degenerate G 5. It is not unrestricted CS. Reuse unrestricted Good or the direct inequality-and-iff definition, with the equivalence proved.

Final controls should inspect loops/malformed insertion edges, empty/no-triangle graphs, packings sharing vertices but not edges, rejection of a shared-edge pair, actual-edge covers, vertex-sharing components, crossing triangles, adjacent/disjoint insertions, whole-family rather than pointwise footprints, and no strengthened hidden hypothesis. Compilation does not by itself establish semantic faithfulness.
