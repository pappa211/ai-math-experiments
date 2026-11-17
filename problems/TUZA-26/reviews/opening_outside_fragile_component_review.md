> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent fragile defect-one outside-component exclusion review

Status: ACCEPTED ORDINARY under the supplied codegree-two and outside-packing equality, with no total-defect restriction and no minimum-degree requirement. No numerical or Lean claim.

Criticality really is componentwise: actual shared-edge triangle components have disjoint edge sets, so maximum packings and covers add even when vertices overlap. A critical edge in a fragile defect-one component C gives C-r in B by proper CS and the exact one-edge cover bounds. This names no defect-two component and uses no minimality property of C.

Every restored r-page appends over B because it has at most one footprint in each old tight clique. The whole one-base footprint determines at most one page per touched clique. With two pages, each old edge can be avoided using another page; with one page, the only extra critical edges are the opposite edges of supported spokes in K4 pieces. The K5 two-edge avoidance and K4 local packings give exactly the claimed inclusions, including a completely bare page.

Every W triangle on an old clique edge belongs to C. Any additional Q triangle on that edge is an endpoint page and makes the edge critical in W unless it is xy. Thus the complete K4 boundary is contained in footprint, opposite edge, xy, and the K5 boundary in footprint,xy. Triangles containing both endpoints add no old edge. The accepted K4 private-edge theorem and K5 small-boundary theorem remove all old pieces without an inferred vertex-freshness claim.

The remaining component is an actual book on r. Every spoke has just one W triangle. With two or more pages those spokes are resilient, whereas Q codegree at least two forces them to be endpoint rims and hence critical unless equal to xy. Distinct spokes cannot all equal xy, so only one triangle remains.

For that triangle T, each of its three edges has a page at u or v. The three neighbor subsets of {u,v} are nonempty and pairwise intersecting, so have a common endpoint. This produces a literal K4 on T plus that endpoint. The other endpoint can be adjacent to at most two T vertices by codegree exactly two of uv, hence at most one T edge is exposed outside this K4. No other W triangle can expose a T edge, by the component hypothesis. A minimum Q cover containing all of T replaces those three edges by an opposite-pair K4 cover retaining the possible exposed edge. All outside endpoint-spoke triangles remain covered because their selected cover edges were not removed. This saves one edge literally.

Thus no fragile defect-one W component exists, regardless of other components or their defects. The supplied outside-packing equality and codegree-two edge are still not universally available.

Bound source: `notes/matching26_outside_fragile_component_exclusion_v1.md` SHA-256 `d2b7b3e82218d776159342608f3a80504994400522a9a2572bdbb30733c43683`.
