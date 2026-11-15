# Root reconstruction of structural parity closures and nonsaturation

Reviewed 2026-11-15 during the original TUZA-19 research window. This is ordinary mathematical reconstruction by the parent AI context, not fresh-context review, Lean verification, or human review. The producer is the fresh_critic agent for the gadget notes and global_routes for nonsaturation.

## K4/K5 edge decorations

Input `notes/parity_gadget_constraints.md`, SHA-256 `dedde7192372fba54e8f1f5aa7a4bb38ad8d42192fced30e4f1ab902208cc321`.

Root reconstructed every local fact and the full triangle classification. A fresh-containing triangle belongs to exactly one attachment; a maximum local packing avoiding the root exists explicitly. Thus the packing identity remains exact after arbitrary ORIGINAL-edge deletions. Fixing either root parity allows a balanced local cut with the same total cost, proving the weighted parity cancellation identity. With every root decorated, local clique edge sets partition all edges, so their lower bounds sum. To put a specified fresh edge in a minimum ordinary cover, its local choice may omit only that root; selecting all other roots still covers every core triangle. This verifies criticality without falsely claiming that this possibly nonodd cover is a parity cover.

The join resource bound and its two-spoke decrement also reconstruct: after two same-apex spoke deletions, each fixed feasible pair (A,B) loses exactly one in its floor capacity at that apex; maximization over a smaller domain preserves the upper bound. The even/odd n formulas follow from the degree sum and elementary parity-subgraph construction on each spanning tree. No attainability claim is implicit.

## K5 triangle-page overlaps

Input `notes/parity_k5_triangle_overlap.md`, SHA-256 `215d3115407d63e304956d4d44fc5e784ba485aaa2ccb8c3847b40f7291f9b69`.

Root reconstructed the all-size theorem and supplementary exact profiles. Every fresh-containing triangle stays in its page. All core edges plus each private-pair edge is an odd cover. Any maximal page-to-core-edge matching gives b+M packed triangles: one free fresh-pair triangle per page and, on matched pages, the stated two-triangle realization. Every core edge has a matched neighboring page; hence m<=3M and M<=b, yielding m+b<=2(b+M). The stated strictness under repeated base edges is valid.

For the cover profile, local added costs are 3,3,1 according to one, two, or three selected base edges. A minimizing core cover cannot give two selected edges on a page: adding its missing edge improves that page by two at cost one, and cannot increase any other page's extension cost. All optimum local extensions for the remaining odd base states are odd. The span condition then correctly transfers parity to all core triangles. The criticality criterion follows by including each edge in some minimum cover, with cross spokes possible precisely in an optimal one-red base state.

For the packing profile, every maximum packing has at least one fresh-containing triangle per intact page, because a fresh-pair triangle can otherwise be appended without using core edges. A local pair uses at least one core edge and can be normalized to the stated pair using just one such edge. This yields the matching upper bound and constructive equality. After deleting a page's fresh-pair edge it has no free triangle, and any one or two distinct assigned base edges are realizable using different private vertices; the capacity-two formula follows. The b-page shared-triangle formulas and failures of criticality/resilience follow exactly as stated. No completeness for arbitrary K5 gluings is asserted.

## Elementary nonsaturation and parity-cone dependency addendum

Input `notes/global_routes_nonsaturation_addendum.md`, SHA-256 `3005b796bafc0470f37c520f4e22da5d69a5741dee619536448a9b08270cbafd`.

Root reconstructed both inequalities with their universal quantifiers. For any link edge xy, a matching after deleting vertices x,y extends by xy. Removing the graph spokes vx,vy therefore limits an apex packing to mu(L)-1, while two-edge resilience retains the original triangle packing number. Combining with the independent lower construction from ANY maximum link matching proves NS-state. The explicit K5 and cone-C5 controls are correct.

This removes Tutte–Berge from the necessary-condition proof and from the two-spoke failure of the critical-cone obstruction. The original `review/parity_cone_root_audit.md` remains a faithful review of its original frozen input; this addendum records the later dependency simplification rather than changing its provenance. Neither the cone's ordinary cover/packing calculations nor the elementary odd-cover lower bound changes. No formal proof or originality claim is added.
