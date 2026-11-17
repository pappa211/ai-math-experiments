> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Strict triangle restoration from five-wheel support

Frozen for fresh independent review, TUZA-25, 2026-11-16. Ordinary proof candidate; no exhaustive computation or Lean premise. The five-wheel case is not asserted to be historically novel. The analogous K5-e case below is already covered by the archived classified-two-edge-B restoration theorem and is recorded as an independent short reconstruction.

## Exact statement

Let H be a finite simple graph whose union of actual triangle edges is exactly a five-wheel W (C5 rim and one universal hub). Other vertices and edges are permitted only when they belong to no actual triangle of H. Let a,b,c be independent in H and G=H+{ab,bc,ca}. Then

    tau(G) <= 2 nu(G)-1.

The same conclusion holds if the actual triangle support of H is a literal K5 minus one edge. Background edges are retained in G and all new pages are counted.

## Values and cover eligibility

For W, every triangle consists of the hub h and a rim edge. Its packings correspond to matchings of C5, so nu(H)=2. Each cover edge hits at most two of its five triangles, proving tau(H)>=3. Three spokes at rim vertices 0,2,4 cover all triangles, so tau(H)=3.

Every supported edge belongs to a minimum cover. A prescribed spoke belongs to a rotated three-spoke cover. The rim edge i(i+1), together with the spokes at i+2 and i+4 (indices mod5), is a three-edge cover through that rim edge.

For K5-e, denote the nonadjacent pair x,y and the other vertices a0,b0,c0. The three edges of a0b0c0 cover all seven triangles. Two edges cannot cover all seven because every edge occurs in at most three, so tau=3. Two edge-disjoint pages exist; three triangles would occupy all nine graph edges, impossible because x and y have odd degree3 whereas a union of triangles has even degrees. Thus nu=2. All three central edges belong to the central-triangle cover. A spoke such as a0x belongs to {a0x,a0y,b0c0}; relabelling covers every spoke. Hence every supported edge is eligible.

## A matched three-page footprint leaves an old triangle

Suppose three new pages on the restored bases have distinct apices, say abx',bcy',caz'. Their six old spokes form a simple C6. Its alternating terminal set I={a,b,c} is independent in H. Each terminal is incident to exactly two of these six edges. Let S be the six-edge set. Every edge of S in the old triangle support is incident to I intersect that support.

For five-wheel support:

* If the hub belongs to I, no rim vertex does. Thus S meets the wheel in at most two spokes. Each spoke belongs to two of the five wheel triangles, so at least one old triangle survives.
* If the hub does not belong to I, at most two rim vertices belong to I. They cannot cover all five rim edges (indeed C5 has vertex cover number3). Choose a rim edge with neither endpoint in I. Its hub triangle has no vertex in I and is disjoint from S.

For K5-e support:

* If I contains one of the three degree4 vertices, it contains no other supported vertex. The remaining four supported vertices contain a triangle, disjoint from every supported edge of S.
* Otherwise I intersects the support only in the nonadjacent pair x,y. The central triangle a0b0c0 avoids S.

In both cases nu(H-S)>=1=nu(H)-1, with all background spokes harmless to the old triangle.

## Excluding non-strict restoration

Append abc to an H maximum packing: nu(G)>=3. Extend an H minimum cover by the three new edges: tau(G)<=6. Therefore non-strictness tau(G)>=2nu(G) would force nu(G)=3,tau(G)=6.

Apply the archived ordinary C6-or-ineligible-spokes alternative, whose short derivation is recalled here. The entire new family consists of abc and pages on its three bases. If the base/apex incidence graph has a matching of size3, its pages together with the old triangle just constructed give four edge-disjoint triangles in G, a contradiction. If its matching number is at most2, the actual-page classification gives a two-edge cover of the new family unless it is the seven-triangle K5-e family with exactly two full apices. A two-edge cover, combined with an H minimum cover, gives at most5 edges, again a contradiction.

In the exceptional new K5-e family each of the six old spokes lies in a three-edge cover of the new family. If any such spoke were supported in H, an H minimum cover through it (eligibility above) would overlap that cover, giving at most3+3-1=5 edges. Thus all six old spokes would have to be triangle-free in H. A maximum H packing then avoids them, and the two-packing of the new K5-e family appends to it, giving four triangles. Contradiction.

This proves strict restoration in both cases.

## Consequence and exact remaining bridge

An actual minimum-edge CS failure has a defect-one, single-edge-resilient, connected triangle residual after deleting any triangle. Such a residual cannot have five-wheel support, by this theorem. K5-e support was already excluded archivally. Combined with the already reviewed fresh edge-gluing restoration theorem, all named finite models (W5,K5-e,and the literal fresh edge-gluing defect-one family including the13-vertex central K4/three K5 star) are excluded as actual residuals.

This closes a restoration gap for a named model; it does not classify all resilient defect-one supports. The frozen F in residual_family_freeze.md also permits arbitrary fresh triangle/K4 overlaps, which are not all covered merely by this statement. The archived coordinator_codegree_two_review.md already derives the codegree-at-least-three restriction from its accepted classification and the earlier k>=5 bound. The present wheel proof is a short strict-restoration argument with no small-packing finite premise; it is not a newly discovered codegree restriction or the first exclusion of W5 as a minimum residual. Any use of the codegree-two classification retains its declared Staton and Tutte–Berge inputs.

Dependencies: TUZA-22 notes/coordinator_defect_one_triangle_restoration_alternative_v1.md; its reviewed page-family argument; TUZA-22 notes/fresh_clique_defect_one_triangle_restoration_v1.md for the separately cited edge-gluing consequence. K5-e historical coverage: notes/classified_two_edge_B_residual_triangle_restoration_v2.md (not a premise of the short proof above).
