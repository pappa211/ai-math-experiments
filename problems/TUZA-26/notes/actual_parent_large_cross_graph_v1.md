> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent low-gain two-triangle residual: three or four cross edges

Frozen ordinary classification candidate v1, TUZA-26. Independent review required. This consumes the supplied H0 in actual_parent_critical_square_v1.md and does not use minimum-Q naming, degree bounds, or Q's boundary exclusions.

Let B satisfy B with nu(B)=m, let T=abc and U=ade be missing triangles sharing only a, and let H=B+T+U have connected single-edge-resilient defect-one support with

    nu(H)=m+2, tau(H)=2m+3.

All old background remains. Write J for the actual old cross edges between {b,c} and {d,e}. Each old clique contains at most one vertex of each pair and cannot contain a with any of b,c,d,e, so it contains at most ONE J edge.

The archived lower-branch core/page compatibility proof applies at its exact PACKING scope: if a two-triangle packing in the five-vertex core avoids a restored base, any outside page on that base appends over full old clique packings. The complete old footprint is at most a star of two edges in each clique. This would give m+3, forbidden here. For |J|=3 or4, every restored base is avoidable by a two-packing in the core, using the explicit witnesses in that proof. Hence there are NO outside ordinary pages. Every new H triangle lies wholly in the five-vertex core.

## Three cross edges

Relabel J={bd,be,cd}. The core is K5-ce. It has a three-edge cover, and each J edge belongs to one: for bd use {ab,ad,bd}; for be use {ad,bc,be}; for cd use {ab,cd,de}. These are checked against all actual core triangles.

If a J edge is supported in B, choose an old minimum cover containing it and the indicated core cover. Their overlap gives an H cover of size at most2m+2, contrary to the exact cover gain three. Thus all J edges are background. The core's seven triangles consequently form a separate K5-e triangle component, edge-disjoint from every old B triangle. Connected H support forces the absence of old B components. The support of H is literally K5-e, one frozen C12 model.

## Four cross edges

The core is K5. If no J edge is supported, old and core triangle families are edge-disjoint, giving tau(H)=2m+4, contrary to gain three. Thus at least one J edge is supported.

Two supported J edges would belong to DIFFERENT old clique components, since each clique sees at most one J edge. Choose old minimum covers containing both, independently. Any two K5 edges lie together in a minimum four-edge core cover. The two overlaps give an H cover of size at most2m+2, contradiction. Therefore exactly ONE J edge g is supported, in exactly one old clique D.

All other old components would remain separate from the core because there are no outside pages and their J footprint is empty. Connected H support excludes them. Also D shares exactly the two endpoints of g with the core: any third core vertex would force one of the missing old edges ab,ac,ad,ae,bc,de. Therefore the literal support is a K5 glued along one edge to a fresh K4 or K5. These are precisely frozen central_K4_star_5 or two_K5_edge. Arbitrary background has not been discarded in making this SUPPORT statement.

## Application and remaining cases

For H=G-E(E0) supplied by the critical double-residual rebase, each identified C12 support is excluded by the accepted strict actual-parent triangle-restoration theorem, including its retained-background scope. Thus |J|>=3 cannot occur in that critical branch.

The cases |J|=0,1,2 remain separate obligations. Single-edge resilience was not needed for the two classifications above beyond eligibility for the actual-parent application; connected triangle support and the exact gains were essential. No finite enumeration or historical originality claim is made.
