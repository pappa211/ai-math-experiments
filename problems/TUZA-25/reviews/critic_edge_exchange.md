> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: star avoidance and the named insertion domain

**PASS for the ordinary independent-star avoidance theorem and the complete stated finite insertion predicate.** These have different scopes: the avoidance theorem covers every literal fresh edge-gluing construction with arbitrary retained background, while the finite check covers exactly twelve named support models and all their missing pairs. Neither supplies a universal classification or availability theorem.

Reviewed star note: `notes/residual_independent_star_avoidance.md`, SHA-256 `04a952708b52d068d7bcac061212156ac37a0cc8b6a2fcd93e5ce823cfe51b84`.

## Independent-star proof

In the original fresh edge-gluing construction, each new clique meets the union of preceding pieces in exactly its attachment edge. Choose a parent piece containing that edge. This produces a tree. For every graph vertex z, the pieces containing z form a connected subtree: whenever z is old at an attachment, it is an attachment endpoint and belongs to the parent. Adjacent pieces share precisely the parent edge.

Root the tree at a piece containing x. In any parent-before-child traversal, if a vertex of a new piece already appears in an earlier piece, the connected-subtree property forces it into the parent piece and hence into the parent separator. Conversely that separator is already present. Thus re-rooting preserves the fresh edge-gluing property; it is not an assumed reordering of arbitrary clique overlaps.

A clique contains at most one vertex of the independent set I, so it has at most one forbidden x-I edge. Every non-root piece containing x has x in its parent separator, since the x-pieces form a connected subtree containing the root. Its possible forbidden edge and parent edge therefore form a star of at most two edges. A K4 maximum packing avoids that star by using the opposite triangle. A K5 maximum packing avoids any two prescribed edges; in this particular application the two form a star, for which the explicit two-triangle construction already reviewed suffices. A piece not containing x only needs to avoid its parent edge. The root avoids at most one forbidden edge.

The chosen maximum piece packings are globally edge-disjoint because each new piece packing avoids its entire edge overlap with all earlier pieces. Every actual graph triangle lies in exactly one piece: each is created within a fresh attachment, and an attachment overlap has only two vertices, so no triangle is shared between pieces. The sum of local packing maxima is therefore also a global upper bound. The constructed union attains it while avoiding the specified independent star. If x lies outside the support, every old triangle packing already avoids all its incident edges. Background edges are never used by an old packing and remain retained.

For insertion of a missing edge uv, the endpoints form an independent set. Given any particular new triangle uvx, the theorem gives an old maximum packing avoiding both old spokes ux,vx. Appending that page increases packing by one. Removing the at-most-one packed triangle using uv proves the reverse bound, so the gain is exactly one. This applies to every individual new page, not to simultaneous restoration of three pages.

For defect-one H, cover extension gives tau(H+uv)<=tau(H)+1=2nu(H), and the packing gain gives defect at least two. In particular unchanged-packing insertion cannot occur in this construction class. The K5-e to K5 control shows why the packing-gain assertion cannot be generalized to all resilient defect-one graphs; that control has unchanged packing but *increased* cover, so it is not itself an example where both optima are unchanged.

## Independently regenerated finite universe

`reviews/critic_edge_exchange_check.py` generates the twelve named support models directly from their definitions, then compares their edge sets with the supplied seed file:

- A central K4 with one, two, or three leaves on distinct edges of one star, each leaf K4/K5, up to permutation of leaf sizes: 2+3+4=9 models.
- Two K5s sharing an edge.
- W5 and K5-e.

These are the ten classified fresh-edge defect-one types plus the two named cores. The checker does not treat them as all possible resilient defect-one supports.

Every missing pair in each fixed labeled representative is examined: 210 presentations in total, all triangle-bearing. The checker independently reconstructs every actual triangle and every K4-completion predicate. It derives exact packing optima by maximum-independent-set recursion on the actual triangle-conflict graph, and exact cover optima by exhaustive triangle-cover recurrence. Component splitting and memoization preserve exactness; no discovery optimizer or verdict is imported.

To avoid redundant optimization, the checker constructs explicit permutations from the model symmetries, verifies that each is an automorphism of the seed, and verifies the entire inserted graph's image under the chosen permutation. Thirty insertion representatives suffice under these checked maps. This is proved symmetry reduction of all 210 presentations, not sampling. The receipt retains each map and representative.

All 210 reported nu/tau pairs agree. Exactly four presentations have defect two; all four are K4-completed and come from two K4s sharing an edge. Exact deletion optimization on every edge of each qualifying graph shows that its only critical edge is the inserted edge. None has a triangle of three critical edges. The four presentations are isomorphic six-vertex cases, not four distinct graph types. The other 206 presentations have different defect.

Independent results: `reviews/critic_edge_exchange_check.json`, including 12 seed checks, 210 complete cases, 30 exact insertion representatives, 4 qualifying presentations, 4,783 packing recursion states and 16,266 cover states. The standard-library run completed without timeout. Its hashes bind the checked seed and discovery receipts.

Reproduce with:

    source PRIVATE_PATH_REMOVED
    python reviews/critic_edge_exchange_check.py

The finite universe has no extra background edges or outside vertices. Applying it to arbitrary retained background requires the separate diamond-confinement argument reviewed in `critic_leaf_bridge.md`; the enumeration alone does not justify that extension. No broader graph census, unrestricted Tuza/CS theorem, novelty claim, or Lean verification follows.
