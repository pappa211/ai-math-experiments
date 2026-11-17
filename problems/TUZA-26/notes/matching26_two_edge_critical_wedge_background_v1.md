> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two-edge tight restoration: the critical wedge edge is background

Frozen ordinary lemma candidate, TUZA-26. Independent review requested. This is an all-size restriction on the exact B-plus-two interface; it does not name the defect-two graph or assert the remaining restoration is available.

## Statement and elementary tools

Let B have only literal K4/K5 triangle components, with arbitrary triangle-free background retained. Let m=nu(B), tau(B)=2m. Restore two distinct absent edges e=xz and f, forming A, and assume

    nu(A)=m+2, tau(A)=2m+2;
    xyz is an actual triangle;
    yz is packing-critical in A;
    nu(A-xy)=m+2.

Then yz is NOT triangle-supported in B. If yz remains in B, it is background.

Both restored edges are critical in A, since deleting either leaves only one restored edge over B and hence packing at most m+1. In particular f!=xy, by the assumed resilience of xy. The case f=yz already has yz absent from B, so suppose otherwise.

Call a new page ordinary if it uses exactly one of {e,f}. It is B-bare if both its old spokes lie in no B triangle. Each restored base has at least one bare ordinary page. Otherwise, for that base, choose minimum covers in each old clique containing its entire one-base footprint (at most one old edge per clique); every ordinary page is hit. Add the other restored base to cover all remaining new triangles, obtaining a cover of A of size at most2m+1, contradiction. The whole-one-base footprint fact follows because two old neighbors in one clique would create an old triangle through the missing endpoint and force the absent restored edge inside that clique.

Every (m+2)-packing uses two edge-disjoint ordinary pages, one per restored base, plus m old triangles. A triangle using both restored edges cannot be part of such a packing, since then at most one new triangle is used.

A literal K4/K5 has a maximum packing avoiding any one specified edge. It can avoid any two specified edges unless it is K4 and the two edges are opposite. For adjacent two-edge stars this is immediate; for K5 the disjoint-edge case also admits two triangles. We use exactly this elementary exception below.

## Assume yz is supported

Let D be the unique old clique component containing g=yz. Since xz is absent in B, x is not a vertex of D.

If an ordinary e-page xzp has p!=y and is edge-disjoint from a bare ordinary f-page, append both to old maximum packings avoiding g and the e-page footprint. The g-clique receives at most the additional spoke zp, adjacent to g; every other old clique receives at most one page spoke. The bare page contributes no supported footprint. This constructs an (m+2)-packing avoiding g, contradiction.

Also every bare e-page intersects every bare f-page: both avoid the supported edge g, and old maxima can avoid g while both bare pages append. For adjacent bases, two ordinary pages conflict precisely when they have the same apex, so both bare-apex sets must be the same singleton. For disjoint bases, every bare e-apex is an endpoint of f and every bare f-apex is an endpoint of e.

There are four exhaustive placements of f, since f!=xy and f!=yz.

### 1. f=zt, sharing z with e

The common bare apex is w, distinct from x,y,z,t. Every ordinary e-page has apex y or w: any other noncentral page is disjoint from the bare f-page, contradicting the preceding augmentation. By the symmetric star-avoidance argument, every ordinary f-page likewise has apex y or w.

The old edge xt is absent, since otherwise xt together with the two bare old edges xw,tw forms an old triangle. Thus there is no triangle using both restored bases. Choose a minimum B cover containing yz. It hits every new page with apex y. Adding the single old background edge zw hits every new page with apex w. This is an A cover of size2m+1, contradiction.

### 2. f=xt, sharing x with e

Again the common bare apex is w. The e-page augmentation confines its ordinary apices to {y,w}. Take an A maximum packing avoiding xy. Its e-page must therefore be the bare page xzw. Its ordinary f-page, say xtq, is disjoint from that page and avoids xy.

If old maxima could avoid g and the f-page footprint, these two pages would give a maximum avoiding g. Thus the only possible obstruction is the elementary opposite-edge exception in D: D must be K4 on {y,z,t,q}, with tq opposite yz. But xy and xq are old edges and yq is an edge of D. They form an old triangle xyq sharing yq with D. This would put x in the same literal old clique, forcing the absent xz, contradiction. Hence this case is impossible.

### 3. f=yt, disjoint from e but containing y

The bare e-apex must be t, because apex y would use supported yz. The bare f-apex must be x, because apex z would also use yz. Thus the bare pages are xzt and ytx.

The e-page augmentation confines ordinary e-apices to {y,t}. An A maximum avoiding xy must use the bare page xzt. Its f-page ytq must be disjoint from xzt, so q is neither x nor z. It therefore avoids g. In the g-clique its footprint is at most yq, adjacent to yz; all other old cliques receive at most one edge. Append it and the bare e-page to old maxima avoiding g. The resulting maximum avoids g, contradiction.

### 4. f=ab disjoint from e and not containing y

Choose a bare e-page with apex a, relabeling the endpoints of f if necessary. A bare f-page has apex x or z.

Both a and b lie outside D. The bare edge za gives this for a. If a bare f-page has apex z, the bare edge zb gives it for b. Otherwise a bare f-page has apex x, so xb is bare. If b belonged to D, then xy,xb,yb would form an old triangle, contradicting that xb is bare. Thus b is outside D in either case.

Any ordinary f-page with apex q outside {x,z} is disjoint from the bare e-page xza and avoids g. Since neither endpoint a,b lies in D, its D footprint is empty; other old cliques receive at most one edge. It would append with the bare e-page over old maxima avoiding g. Hence EVERY ordinary f-apex lies in {x,z}.

The original e-page augmentation, using any bare f-page, also confines every ordinary e-apex other than y to {a,b}. Consequently every new triangle other than xyz lies on the four vertices {x,z,a,b}. The restored bases are disjoint, so no triangle uses both. An A maximum avoiding xy cannot use xyz and would require two edge-disjoint new triangles on this K4 vertex set, impossible. This contradicts nu(A-xy)=m+2.

All cases fail. Therefore yz cannot be supported in B.

## Consequence for the remaining restored edge

If f!=yz, then yz is an old background edge. Choose a maximum A packing avoiding xy. It uses yz because that edge is critical. An old B triangle cannot use yz, and the only e-page containing yz is xyz, which uses xy. Hence the packing contains an ordinary f-page through yz. Thus

    f=zt or f=yt for some t outside {x,y,z},

and the actual triangle yzt is present. This is a genuine reduction to a star or a three-edge path around the critical wedge. It does not yet classify all ordinary pages or old tight attachments.

## Controls and exact scope

The four-wheel on rim x-y-p-q-x with hub z satisfies the numerical profile with e=xz,f=pz and B triangle-free. The critical edge yz is background, as the theorem requires. Tight cliques may be attached on wheel rim edges without destroying this profile; thus a conclusion that A must be literally the four-wheel would be false.

If f=yz, arbitrary bare books on xz and yz (with disjoint bare apex sets) also satisfy the local numerical profile. For example the graph with exactly triangles xzw,xyz,yzt has nu2,tau2, critical xz,yz and resilient xy. Adding c adjacent to x,y,z yields nu3,tau3 and a minimum cover {xy,xz,yz}. These controls are not excluded by the present lemma; their ACTUAL minimum-Q restoration needs separate work.

Dependencies: the literal-B component/cover properties and the exact A profile; no C12 naming, finite census or omitted background. Conclusion is PROOF_CANDIDATE pending fresh review. The remaining star/path restoration and its Q payment are OPEN.

Relied sources: notes/degree_four_cap_critical_wedge_v1.md for the application profile; the accepted whole-one-base clique footprint and elementary K4/K5 packing avoidance facts used earlier in this mission. No numerical computation was run.
