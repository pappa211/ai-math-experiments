> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Outside graphs have no fragile defect-one triangle component

Frozen ordinary paid exclusion v1, TUZA-26, 2026-11-17. Independent review required. This removes the total-defect-two restriction: the outside graph may have arbitrarily large total defect. No resilient defect-one component or higher-defect component is classified here.

## Exact scope and componentwise criticality

Work in the accepted conditional minimum-Q setting inside fixed minimum-CS G. Let uv have exactly two common neighbors x,y, and assume

    W=Q-{u,v}, nu(W)=nu(Q)-1=m.

This holds in the empty-endpoint-link branch, but the theorem only needs the displayed packing equality. Use Q triangle codegree at least two, universal whole-triangle minimum-cover eligibility, and the accepted complete-boundary exclusions for K4/K5. No minimum-degree bound is needed.

Every actual u/v-link rim g other than xy is packing-critical in W. Otherwise append its endpoint triangle and a uv-page at the marked hub outside that rim to an m-packing of W-g, producing m+2 Q triangles. The argument accounts for all third edges because the old packing avoids g and lies entirely outside u,v.

Triangle components of W, defined by shared-edge connectivity of actual triangles, have disjoint edge sets even when their vertices overlap. Packing and cover numbers add across these components. Therefore an edge supported in a component C is critical in C if and only if it is critical in W. Background edges belong to no packing. This equivalence is the only inheritance used below; minimum-Q naming is NEVER applied to C.

Suppose, for contradiction, that a triangle component C has defect one and is fragile. Write nu(C)=s,tau(C)=2s-1 and take a critical C edge r. Proper CS for the actual proper subgraph C-r, together with one-edge cover deletion, gives

    nu(C-r)=s-1, tau(C-r)=2s-2,
    B=C-r has only literal tight K4/K5 triangle components.

All residual background is retained. Restoring the single base r gains one packing unit and one cover edge.

## Exact critical geometry of one-edge B restoration

Every C triangle outside B is an ordinary r-page. A page uses at most one edge in any old clique D: both old spokes in D would force the missing base. Thus it appends to a maximum B packing by choosing, in every affected clique, a maximum packing avoiding its single footprint.

The WHOLE r-page family has at most one footprint edge in D. If two different apices p,q gave footprints at the same base endpoint a in D, their old spokes from the other base endpoint b and the clique edge pq would form an old triangle merging b into D and forcing r=ab. A fixed footprint edge and r determine a unique page.

If there are at least two r-pages, every old edge is resilient in C. For an old supported g in D, choose a page avoiding D and alter the old D packing to avoid g; for a background g, choose a different page from the at most one using g. In both cases the chosen page appends to an avoiding old maximum packing. Hence only r is critical.

If there is exactly one r-page T, all three T edges are critical. The only possible additional critical edges are the edges opposite its supported spokes in old K4s. Indeed every maximum C packing must use T. In a supporting K4, every maximum packing avoiding the used spoke contains its opposite edge; other edges can be avoided along with the spoke. In K5 every two edges can be avoided at full size, so there is no extra critical edge. Untouched old components have no critical edge. These statements hold even when T is completely bare; then C has no old support attached through that page.

In particular, for ANY old K4 D, its critical old edges are contained in its possible r-footprint and the edge opposite that footprint. For an old K5 D, its critical old edges are contained in the possible footprint alone. These inclusions are sufficient below; no freshness or global critical-graph classification is assumed.

## Complete Q boundary removes every old tight piece

Fix an old clique D of B. Every actual W triangle using a D edge belongs to the SAME W triangle component C, by definition of shared-edge connectivity. Consequently the only W triangles outside D which use a D edge are r-pages, with their single whole-family footprint. Other W components may share vertices with D, but cannot contribute a triangle using any D edge.

An actual Q triangle outside W contains u or v. If it contains only one endpoint and uses an old D edge g, that edge is an endpoint rim, hence critical in W unless g=xy. By componentwise criticality and the preceding local analysis, the COMPLETE outside-Q boundary is therefore contained in

    K4: {the r-footprint, its opposite critical edge, xy};
    K5: {the r-footprint, xy}.

Missing terms are simply omitted. Triangles containing both u and v use no old W edge. This exhausts every actual Q triangle and retains arbitrary background and vertex identifications.

A K4 with at most three complete boundary edges is excluded by whole-triangle eligibility: two adjacent private edges lie in a triangle whose three selected cover edges can be replaced by an opposite-pair K4 cover. A K5 with at most two boundary edges is excluded by the accepted tight-piece payment. Thus NO old B piece can remain.

This is an actual boundary reduction in Q. It does not assert that C itself is minimal, induced, three-connected or otherwise inherits the full Q profile.

## The remaining book cannot have two pages

With old B support absent, C-r is triangle-free, so C is literally a book on r. Every spoke belongs to exactly one W triangle: any other W triangle through that spoke would be in C and would survive after deleting r, contrary to the absence of old support.

If the book has at least two pages, all its spokes are resilient in C and hence W. Each spoke needs a second Q triangle by the global codegree bound. Since it has only one W triangle, that second triangle must use u or v, making the spoke an endpoint rim and therefore critical unless it is xy. Every spoke would consequently have to equal xy, impossible for a book with distinct spokes. Thus only one page can remain.

## A single triangle gives a literal cover saving

Now C consists of a single triangle T=abc. Each of its three edges has no other W triangle and therefore needs an additional u/v-page. Put

    S_a=N_Q(a) intersection {u,v}, and similarly S_b,S_c.

Every pair of these subsets intersects, because the corresponding T edge has an endpoint page. Nonempty pairwise-intersecting subsets of the two-element set {u,v} have a common element. Hence one endpoint, say u, is adjacent to ALL three vertices of T. The four vertices {u,a,b,c} form a literal K4 D.

At most one T edge can be used in an actual Q triangle outside this K4. There is no other W triangle through any T edge. Such an outside triangle must therefore use v. But v is adjacent to at most two of a,b,c, since three would give three common neighbors of u,v. If it is adjacent to two, those two are exactly x,y and the sole possible exposed T edge is xy. Thus at least two adjacent edges of T are PRIVATE edges of this literal K4. Outside triangles on u-spokes remain arbitrary and are not discarded.

Choose a minimum Q cover containing all three edges of T, using universal whole-triangle eligibility. Replace those three selected edges by a minimum two-edge K4 cover containing the possible single exposed T edge. Such a cover is its opposite pair. All internal K4 triangles are covered; no outside triangle uses a removed private edge, and the possible exposed edge was retained. Every other cover edge remains. The resulting cover is smaller by at least one, contradiction.

This final saving explicitly handles arbitrary shared vertices and outside u-spoke triangles. It is the supplied actual paid region; no degree argument, named-family comparison or response-table completion is hidden in it.

## Conclusion and remaining branches

Under the displayed codegree-two outside-packing interface, W has NO FRAGILE DEFECT-ONE TRIANGLE COMPONENT, regardless of its total defect or the number of other components. Resilient defect-one components and components of defect at least two remain open. The theorem does not prove that a codegree-two edge or an outside packing of size nu(Q)-1 exists in every minimum Q.

Sources: notes/matching26_canonical_outside_packing_v1.md for the marked critical-rim operation; notes/apex_k4_triangle_boundary_v1.md; notes/two_edge_tight_boundary_v2.md and its independent review; fixed-G proper CS and the accepted whole-triangle/codegree profile. Root proposed the componentwise exclusion; matching_geometry checked global criticality inheritance, the complete old-clique boundary, and the actual final K4 cover saving. No numerical computation or enumeration was used.
