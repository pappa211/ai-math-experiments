> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent triple extension: the two-peripheral restoration, v1

Frozen ordinary proof candidate, TUZA-26, 2026-11-17. Fresh independent review requested. This closes the two-peripheral subcase left after the exact failure structure in matching26_actual_parent_triple_extension_v1.md. No computation or new graph census.

## Literal supplied interface

Let B have literal K4/K5 triangle components, nu(B)=m, tau(B)=2m, with arbitrary old background and shared vertices. Restore V=abc. Its complete new family is the bare K5-e family on {a,b,c,x,y}: all six spokes between {a,b,c} and {x,y} are present but background in B, while abc and xy are absent in B.

Restore U=xyd, with d outside {a,b,c,x,y}, all three U edges absent from B. Put

    H=B+E(V)+E(U),   F={a,b,c,x,y}.

Assume q_U=2 for the individual new family of B+U, nu(H)=m+3, tau(H)=2m+5, the triangle support of H is connected, and H is single-edge-packing-resilient. In the actual-parent application H=G-E(T), and these are precisely the supplied actual single-residual properties and simultaneous pair-extension consequence. They are not inherited from an auxiliary minimum Q.

We prove the triangle support of H is exactly one of

    central_K4_star_5, central_K4_star_45, central_K4_star_55.

All background remains in H. The accepted strict actual-parent triangle-restoration theorem then excludes these named supports for H=G-E(T).

## 1. Complete page structure from q_U=2

The literal K5 on F is present in H: xy completes the supplied K5-e. The individual U-family has the three ordinary xy-pages xya,xyb,xyc. Let X be the set of apices of ordinary xd-pages and Y the apices of ordinary yd-pages. Here ordinary means both nonbase spokes lie in B, so d itself is not an ordinary xy-apex. There are no triangles mixing a restored V-edge and a restored U-edge because their terminal triples are vertex-disjoint. Thus all new H-triangles are the complete V- and U-families.

At least one of X,Y is nonempty, since otherwise the U-family would be a single xy-book and q_U=1. If both are nonempty, they are the same singleton {z}. Indeed distinct p in X and q in Y, together with one of the three xy-page apices a,b,c distinct from p,q, give a three-page matching in the exact one-triangle incidence graph, contradicting q_U=2. This proves the assertion even when some apices lie in F or coincide across page families.

We use the exact whole-one-base footprint fact throughout: for a missing old base pq, any old K4/K5 triangle component contains at most one edge among the spokes of ALL actual ordinary pq-pages. Two spokes at one endpoint would create an old triangle through the other endpoint and merge the absent pair into the clique. In particular supported spokes in any such family can all be met by a minimum B-cover unless some page has both spokes background.

## 2. Only one nonempty side is impossible

Suppose X is nonempty and Y empty; the reverse is symmetric. All new triangles are the literal K5 on F, the central U=xyd, the ordinary xy-pages, and the ordinary xd-pages.

There is a B-bare ordinary xd-page xdz. Otherwise a minimum B-cover hits the entire xd-page family. Adjoin a four-edge minimum cover of K5(F) containing xy, for example

    {xy,ab,ac,bc}.

This covers the complete K5, the central U, and all xy-pages. It would give tau(H)<=2m+4, a contradiction. Thus xz,dz are background in B. Also z lies outside F: an xd-page at a,b,or c would automatically give a yd-page there using the old y-spoke, contrary to Y empty.

Single-edge resilience at xd forces at least one ordinary xy-page xyw with w outside F. Otherwise the entire triangle family of H-xd consists of old B triangles and the literal K5(F), so nu(H-xd)<=m+2, contradicting nu(H)=m+3. The apex w differs from z: if yz were present, together with dz it would give an ordinary yd-page.

Choose a maximum two-packing of K5(F) avoiding xy. The triangles xdz and xyw are edge-disjoint from one another and from that K5 packing. Their old supported footprint consists only of the two spokes of xyw, at most one in each old clique; the xdz spokes are background. Choose an old maximum packing avoiding that footprint and append these four triangles. This gives nu(H)>=m+4, a contradiction.

Hence both X,Y are nonempty and X=Y={z}.

## 3. A core apex gives an immediate four-edge cover

If z belongs to {a,b,c}, say z=a, all ordinary xd- and yd-pages are xda and yda. Any other ordinary pages lie on xy. The four edges

    {xy,xa,ya,bc}

cover the literal K5 on F (the triangle xya plus its opposite pair bc), both displayed pages, the central U, and every ordinary xy-page. A minimum B-cover plus these four edges again contradicts tau(H)=2m+5.

Therefore z lies outside F and differs from d. The three old spokes xz,yz,dz are present. The complete new family now includes K5(F) and K4(D), where

    D={x,y,d,z},

sharing edge xy. Any remaining new triangles would be additional ordinary xy-pages outside F union {d,z}.

## 4. There are no additional outside xy-pages

Suppose xyw is such a page. Combine it with xdz and a maximum two-packing of K5(F) avoiding xy. These are four actual pairwise edge-disjoint triangles.

Their whole old footprint is

    {xz,dz,xw,yw}.

The ordinary xy-pages xyz and xyw show that an old clique contains at most one among xz,yz,xw,yw. Moreover dz cannot coexist in an old clique with xz or xw, because this would put the absent pair xd in the clique; it cannot coexist with yw because yd is absent. Thus the complete footprint in each old clique has at most one edge. An old maximum packing avoids it and appends the four triangles, contradicting nu(H)=m+3.

Consequently the full new H-family is exactly K5(F) together with K4(D), sharing xy. All actual old crossing triangles have been retained in these footprint arguments. There is no unexamined outside-apex equality: d is not an ordinary xy-apex, w differs from z by its choice, and w is outside F.

## 5. Cover gain identifies the old attachments

The only old edges in these new families which could be supported in B are xz,yz,dz. The six old edges inside F are background by hypothesis; abc and xy,xd,yd are restored edges.

First dz is background. If it were supported, take a minimum B-cover through dz and add the four-edge K5 cover {xy,ab,ac,bc}. The latter hits the K4 triangles containing xy, and dz hits the other two K4 triangles. This gives 2m+4.

At most one of xz,yz is supported. If both were supported, they would lie in distinct old cliques, since xy is absent from B. Choose a minimum B-cover containing both, and again add {xy,ab,ac,bc}. The old spokes hit xdz and ydz and xy hits the other K4 faces, giving the same forbidden cover saving.

Every old B triangle component must meet the complete new family, because H has connected triangle support. Therefore there are no old components unless exactly one of xz,yz is supported; in that case there is precisely the one old K4/K5 containing that edge. Shared old vertices alone cannot join triangle components.

If the selected old edge is xz, its old clique intersects F union D exactly in {x,z}. It cannot contain y because xy is absent, or d because xd is absent. It cannot contain any of a,b,c because that would make the corresponding old x-spoke supported, contradicting its background status. The yz case is symmetric. Thus the optional old clique has genuinely fresh private vertices relative to both new cliques. Arbitrary retained old background cannot add a support edge: the complete triangle list is already the old clique family plus K5(F) and K4(D).

It follows that the support is literally:

- K4(D) with a K5 leaf F on xy, if there is no old component: central_K4_star_5;
- that same central K4 with the K5 leaf on xy and one old K4 or K5 leaf on xz or yz: central_K4_star_45 or central_K4_star_55.

The two attachment edges meet at x or y, exactly as required by the frozen fresh clique-star models. No extra vertex identification or triangle-support component remains.

## 6. Actual-parent conclusion and sharp control

In the supplied application H=G-E(T), the exact named support is excluded by the archived strict actual-parent triangle-restoration theorem, at its retained-background scope. This is a legitimate SINGLE-triangle residual naming, unlike naming the double residual R alone.

The modular classification must allow these graphs. Its smallest control is a K5 on F edge-glued to a K4 on D along xy, with d,z fresh. Set B to the six F spokes plus xz,yz,dz; its triangle family is empty. Restoring abc and xyd gives this central_K4_star_5, with nu=3,tau=5 and single-edge resilience. Thus an outright packing contradiction in the two-peripheral case would be false: the actual-parent strict restoration is essential after classification.

Together with root's separate zero- and one-peripheral cases and matching26_actual_parent_triple_extension_v1.md's shared-vertex payment, this is intended to exclude failure of triangle extension in a supplied defect-one actual double residual. That composition requires the other notes and fresh review; this file asserts only the exact two-peripheral theorem above.

Dependencies: archived TUZA22 two_triangle_restoration_v1.md Section 1 (SHA256 12121facd2e02c4dd79ec488698ffb7153c7c810b6a76219302c0efdd11c07c7) and its accepted independent review; matching26_actual_parent_triple_extension_v1.md's literal failure interface (SHA256 08e03e657c952ba341d7cca249ceda59a7e818f0002dff8ec76d04ded1419041); inputs/C12_frozen.json for exact output identification; and the actual-parent profile and strict restoration at the scopes explicitly recorded in actual_parent_critical_square_v1.md. No minimum-Q property, degree lower bound, defect-two naming, numerical search, or family enlargement is used.
