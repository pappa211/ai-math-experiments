> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Theorem-level axiom/type audit recommendations

No audit command has yet been run by this reviewer. `current_declaration_audit_inventory.json` enumerates public declarations in the eight reviewed TUZA-23 modules. Refresh this inventory after source freeze and append final R2, geometry and semantic controls. Do not label the inventory itself an axiom report.

For each theorem emit both its full type (`#check @Name` or `#print Name`) and `#print axioms Name`. Audit definitions of B, CS, GraphCover, Nonedges, addEdges, pageApices, pageSpokes, TriangleClosed, supportGraph and MinimalCS so that misleading wrappers cannot hide an altered meaning. The public entry point must import only accepted modules. Record source/object hashes and actual exit statuses for the audit source compiled against the clean-copy outputs.

Highest-priority new milestones:

- exists_graph_min_cover; tau_le_iff_graph_cover; one_edge_insertion.
- whole_page_footprint; min_cover_all_nonbare_pages.
- clique_min_cover_containing; clique_max_packing_avoiding; blocks_min_cover_footprint; blocks_max_packing_footprint.
- insertion_packing_gain; tight_two_insertion_increment; r2_at_most_one; tight_pair_bare_page; page_intersects_bare.
- triangles_supportGraph; good_of_closed_split; minimal_triangle_connected; minimalCS_iff_minimalObstruction; exists_minimal_cs; exists_minimal_cs_in_class; minimal_cs_package.
- Every final adjacent/disjoint case theorem, full r2, and any exported exact type alias/graph restriction bridge.

Reused dependency milestones should also appear explicitly: Tuza.exists_max_packing, Tuza.exists_min_cover_supported, Tuza.graph_min_cover, Tuza.nu_mono, Tuza.tau_mono; Tuza06.k4_parameters, k5_parameters, k5_avoid_two; componentCliques_iff_decomposition, componentCliques_equality; nu_union_eq, tau_union_eq, nu_biUnion_eq, tau_biUnion_eq; blocks_nu, blocks_tau, blocks_avoid_edges; one_triangle_augmentation, single_edge_packing_loss, single_edge_cover_extension, tight_critical_edge; exists_minimal_obstruction, minimal_every_edge_in_triangle and minimal_tight_critical.

The only allowed standard axiom names are propext, Classical.choice and Quot.sound when actually present. Reject sorryAx, project-defined unproved axioms, native-computation trust axioms such as Lean.ofReduceBool or any other unexplained nonstandard axiom. Source-scan accepted files for sorry/admit/axiom/unsafe/native_decide and distinguish actual constructs from comments or audit commands. The actual theorem closure is authoritative for which axioms are used; source scanning alone is insufficient. Definitions of external-input propositions elsewhere in a module are not themselves theorem assumptions, but inspect exported types to ensure none becomes a premise of R2.

For M0, explicitly report MinimalCS as a legitimate conditional hypothesis. Do not describe the result as unconditional CS just because its axiom set is standard. For generic transport/footprint helpers, record their explicit premises; the final instantiated theorems must discharge any finite-certificate or footprint hypothesis that is part of the advertised deliverable.

Rebuild mission-owned and copied accepted modules from source into clean mission-owned output. Reused compiler/Mathlib artifacts remain a disclosed pinned trust boundary; this is neither a cold Mathlib build nor an independent kernel implementation. Independent reviewer reproduction must use that clean copy rather than silently accepting development oleans. Do not clean or write frozen historical build trees or shared dependency caches.
