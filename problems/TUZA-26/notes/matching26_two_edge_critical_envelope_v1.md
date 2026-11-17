> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two-edge tight restoration: exact critical envelope and bounded actual domain

Frozen ordinary interface v1, TUZA-26, 2026-11-17. Independent review required. This supplies a complete bounded reconstruction domain for the exact empty-link defect-two FRAGILE branch, not a census, a finished paid reduction, or an assertion that this branch is globally available.

## Restoration and a fixed actual maximum packing

Let B=W-{r,f} have only literal tight K4/K5 triangle components, retaining arbitrary background, and assume

    nu(W)=nu(B)+2=m, tau(W)=tau(B)+2=2m-2.

Both r,f are packing-critical. Every maximum W packing consists of an old maximum B packing and TWO edge-disjoint ordinary pages P_r,P_f, one on each restored base. A triangle containing both restored bases would use up both bases in only one new triangle and could not reach the packing gain two. Such mixed triangles may nevertheless EXIST and are retained in the boundary argument below.

Fix one such maximum packing. For an old clique D, let F_D be the set of its edges used by the two fixed pages. A page has at most one old D edge, since its two old spokes in D would force its missing base. Thus |F_D| is zero, one or two; in the two-edge case the edges are distinct because the chosen pages are edge-disjoint. At most FOUR old cliques have nonempty F_D. Call these the touched cliques.

If g is a critical W edge not in the two fixed pages, it must belong to an old touched clique and must occur in EVERY maximum local D packing avoiding F_D. Otherwise alter only the D part of the fixed maximum packing to avoid g. Background edges not in the fixed pages are not critical at all. Arbitrary sharing of vertices among old cliques does not obstruct these local changes because the old triangle components have disjoint edge sets.

## Complete local forced-edge table

The following are the intersections of all maximum local packing edge sets avoiding F_D. Forbidden footprint edges themselves are excluded from this table and already belong to the fixed pages.

* K4, no forbidden edge: no forced edge.
* K4, F={ab}: the opposite edge cd is forced. The two avoiding triangles are acd,bcd.
* K4, F={ab,ac}: the opposite face bcd is the unique avoiding triangle, so its three edges are forced.
* K4, two opposite forbidden edges: no triangle avoids both. This case CANNOT occur in the fixed maximum W packing, which needs a full local K4 packing.
* K5, no forbidden edge or one forbidden edge: no forced edge. For one forbidden edge ab, any specified further edge can be avoided with it in a two-packing. For adjacent ab,ac use ade,bcd; for disjoint ab,cd use ace,bde, after relabeling.
* K5, F={ab,ac}, fifth vertices d,e: the forced set is triangle ade together with edge bc. Every avoiding two-packing must use a (otherwise it lies in a K4), whose only possible triangle is ade. The other triangle is bcd or bce. These two packings prove the intersection is exactly {ad,ae,de,bc}.
* K5, F={ab,cd}, fifth vertex e: the forced set is the four-edge star at e. Two edge-disjoint triangles on five vertices share one vertex; every vertex other than e has available degree three and cannot be that shared vertex. The two possibilities eac+ebd and ead+ebc prove exactly the four e-spokes are forced.

In particular the critical-edge set of W is contained in the union of the six fixed-page edges and these exact forced sets. This is an upper envelope; an edge in the envelope need not actually be critical once other maximum W packings are considered.

## Uniform envelope bounds and identifications

There are at most fourteen critical edges. Indeed at most four footprint edges are distributed among the touched cliques. A one-footprint clique adds at most one forced edge; a two-footprint clique adds at most four. The largest possible total is eight forced edges, from two two-footprint K5s, plus the six fixed-page edges.

There are also at most fourteen vertices incident with critical edges. The two fixed pages have at most six vertices. A one-footprint K4 adds at most two new forced-edge vertices; a one-footprint K5 adds none; a two-footprint K4 adds at most one; an adjacent two-footprint K5 adds at most two; and a disjoint two-footprint K5 adds at most one. Charging at most two new vertices per footprint gives at most eight new vertices beyond the pages. Identifications can only reduce this bound.

All actual identifications must still obey the literal B triangle-component condition. In particular, opposite edges supplied by different old K4s cannot simply be declared isolated: their vertices may coincide with other page vertices or other clique vertices. Nor does a small critical envelope automatically imply a two-hub neighborhood. This note makes neither inference.

## Complete old-piece boundary in the actual Q interface

Now impose the empty-link minimum-Q interface: W=Q-{u,v}, uv has precisely the common neighbors x,y, every actual endpoint rim except xy is critical in W, and the accepted minimum-Q small-boundary exclusions hold. Use the now independently established minimum degree at least FIVE only in the final vertex-confinement paragraph.

An UNTOUCHED old clique has no critical W edge, since its old maximum packing can be changed to avoid any prescribed edge while the two chosen pages remain fixed. Thus a u/v-page can use an edge of such a clique only if that edge is xy.

Its other COMPLETE outside-Q boundary consists of at most:

    one whole ordinary r-family footprint;
    one whole ordinary f-family footprint;
    xy, if it belongs to the clique;
    the closing edge of a triangle using BOTH r and f, if such a triangle exists.

The last term is essential. It occurs only when r,f are adjacent, and there is at most one such closing edge. Triangles containing both u,v have no old B edge. These cases exhaust every actual Q triangle not already in B.

Therefore an untouched clique containing neither xy nor that possible closing edge has boundary at most two and is excluded by the accepted FULL at-most-two boundary theorem, including its opposite-K4 case. At most ONE old clique contains xy, and at most ONE contains the mixed closing edge, because each old supported edge lies in exactly one old triangle component. Hence at most

    four touched cliques + two exceptional cliques = six old B pieces

can remain. If r,f are disjoint, there is no mixed closing edge and the bound is five pieces.

## Actual all-size vertex confinement

Let Z be the union of the two fixed page vertex sets, all retained old B-piece vertices, and {x,y,u,v}. Every Q vertex outside Z would be incident to no critical W edge, by the envelope above. It cannot be adjacent to u or v: it is not a common hub, and Q support would then give an endpoint rim through it, which would have to be critical.

It also belongs to no old B triangle. Any edge incident to it must consequently become triangular through r or f, since endpoint triangles were just excluded. It is not a restored-base endpoint, since those endpoints occur in the fixed pages. It can only be a page apex, and all its neighbors lie among the at most four endpoints of r,f. Its Q degree is at most four, contrary to minimum degree five. Thus EVERY actual Q vertex lies in Z, not merely every old support vertex.

A uniform numerical bound is

    |V(Q)| <= 6 + 12 + 10 + 4 = 32.

Here the fixed pages contribute at most six vertices; each of at most four touched K5s adds at most three beyond its already present footprint endpoints, giving at most twelve; two exceptional K5s add at most ten; and x,y,u,v add at most four. Shared vertices and larger footprints only reduce the count. This is an ordinary finite-domain proof, not a claim that all formal identifications realize a graph. Every actual old triangle must still lie wholly in its prescribed literal clique, all background and mixed triangles must be retained, and the full packing/cover conditions must still be imposed.

## Role, controls and open operation

The fixed maximum packing supplies a bounded critical envelope, and complete boundaries remove every old piece except at most six. This is a concrete restriction in the exact-defect-two fragile descent branch. It does not yet show that any surviving domain member has a paid region or violates the full Q profile. No enumeration is authorized or performed here.

The preserved W4 wheel with tight rim attachments is consistent with the local table and warns against discarding arbitrary old pieces before checking their complete boundary. A forced local set is only an upper envelope for global critical edges; neither the wheel control nor this table justifies a blanket two-center classification. The remaining task is to exploit the actual critical 2-core and full triangle-cover property inside this bounded interface, or prove a direct outside packing/cover repair. The larger-defect W branch and global availability of codegree two remain OPEN.

Sources: notes/matching26_empty_link_defect_two_descent_v1.md; notes/matching26_canonical_outside_packing_v1.md; notes/two_edge_tight_boundary_v2.md; notes/matching26_opposite_boundary_closure_v1.md; accepted degree-four exclusions establishing minimum degree five; ordinary whole-base footprint and K4/K5 packing facts. Root proposed the fixed-packing envelope and exceptional-piece reduction; matching_geometry independently checked the exact local table, the fourteen-vertex refinement, and full actual-vertex confinement. No numerical computation or graph search was used.
