> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Common-center cube: one-exceptional extension and a paid K4 conflict star

Status: ordinary strengthening of apex_actual_parent_common_center_discriminator_v1.md, for independent review. The v1 source remains frozen. This note changes no actual-parent scope or availability assertion.

Use the same literal cube X=B+abc+ade+afg, with nu(B)=m,tau(B)=2m, single restorations (m+2,2m+2), pair restorations (m+3,2m+5), and X target (m+4,2m+8). All background and mixed triangles remain.

## 1. Six additional cover edges suffice for the three individual families

The shared-exceptional four-packing lemma proves that at most one complete individual family is exceptional K5-e. Every other family has a two-edge cover. If all three are two-coverable, choose any old minimum cover F. If one family is exceptional, its single-restoration cover increment two forces at least one of its six old spokes to be supported in B: with all six spokes background the exceptional triangle family would be edge-disjoint from all old triangles, giving increment three instead.

Choose a supported spoke s and a minimum B cover F containing s. The exceptional family has a three-edge cover containing s (for the spoke bx of a restored abc family with full apices x,y, use {bx,by,ac}). Thus it costs at most two additional edges above this F. Add independent two-edge covers for the other families. In either case there is an old minimum cover F and at most six additional edges covering EVERY individual new-family triangle.

Consequently the mixed-rim discriminator of v1 Section3 extends to the one-exceptional branch at this chosen F. Let J0 be the old mixed rim edges whose hub triangles are unhit by this union. It is triangle-free because F covers all old triangles. If its matching number is at most one, it is a star or empty, and one extra a-spoke gives a full cover of size at most 2m+7. Therefore any surviving cube forces a matching of two unhit mixed rims even at the F selected for the exceptional-family overlap.

This does NOT say the statement holds for arbitrary F when an exceptional family exists; F must realize its overlap. Nor do the two uncovered rims alone supply a five-packing.

## 2. Complete K4 conflict-star payment

Suppose there is an old literal K4 component

    D=K4[{b,d,f,p}],

where p is outside the seven core vertices, and the ordinary opposite pages bcp,dep,fgp are actual. Assume their partner spokes cp,ep,gp are background in B. The other three spokes bp,dp,fp lie in D. This is a supplied whole-boundary condition, not an assertion that all old-cover conflicts have this form.

Every core leaf is old-adjacent to p. If an old cross rim ij were incident to c,e,or g, the old triangle ijp would support the corresponding partner spoke ip, contradicting its background status. Therefore no old cross rim is incident to any of c,e,g. The complete mixed rim graph J on the six leaves is precisely the old triangle bdf inside D.

Choose F and the six additional individual-family cover edges from Section1. Since F covers the old triangle bdf, at least one of its three edges is already selected. Any mixed triangles still unhit consequently have rim graph contained in the other two edges of that triangle, hence a star. Adding its center a-spoke gives

    tau(X) <= 2m+7,

contradicting the cube target 2m+8. This covers every actual mixed triangle, not merely the three selected opposite pages. All other old components, background edges and outside pages are accounted for by F and the complete individual-family covers.

The payment avoids any assumption about availability or distinctness of further hub-page apices. It is valid whether the exceptional family is absent or present, because the old overlap is chosen before adding the other two family covers.

## 3. Precise residual gap

The general old-cover obstruction may use several old components, may have supported partner spokes, or may involve internal apices. Those cases are not reduced to Section2. The actual ordered-selection rule still supplies an asymmetric no-R-bare condition for a selected pair, but it has not been converted here into a complete cover or packing payment. No defect-two graph is named and no failing triple is presumed available.

Dependencies: apex_actual_parent_shared_exceptional_families_v1.md for at most one exceptional family; the exact one-triangle classification and elementary K4/K5 eligibility for the chosen supported spoke; apex_actual_parent_common_center_discriminator_v1.md for literal family/mixed-triangle accounting. No computation or new source audit.
