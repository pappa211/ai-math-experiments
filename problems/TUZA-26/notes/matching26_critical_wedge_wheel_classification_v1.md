> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Critical-wedge restoration: the four-wheel with rim attachments

Frozen ordinary classification candidate, TUZA-26. Independent review requested. This classifies the ACTUAL triangle family at an explicit B-plus-two interface. Arbitrary background and shared vertices of old components remain; no defect-two naming rule is used.

## Statement and input

Let B be literal tight K4/K5 triangle components plus arbitrary background, m=nu(B). Let A=B+{e,f}, with e=xz and f distinct, and suppose

    nu(A)=m+2, tau(A)=2m+2;
    xyz is an actual triangle;
    yz is critical in A, while xy is resilient;
    nu(A-{xz,yz})=m+1.

The last condition says yz is resilient in R=A-xz. In the actual cap reconstruction it follows once the separately frozen same-edge branch B'=A-{xz,yz} is excluded: a critical yz in R would itself supply that forbidden tight residual by the proper-CS/cover bounds.

Use the preceding background lemma: yz is background in B, and f must be yz, zt or yt with actual triangle yzt. The last displayed packing condition excludes f=yz. The conclusion below is:

    f=zt, for some t outside{x,y,z};
    there is exactly one noncentral ordinary apex w;
    every new triangle is one of xyz, yzt, ztw, zwx;
    xt and yw are absent, while yz and zw are B-background.

Thus the new family is the literal four-wheel on rim x-y-t-w-x and hubz. Every old B clique meets its vertex set in at most one rim edge or one vertex. The entire A triangle family is this wheel together with the unchanged old clique families. Old cliques attached on opposite rim edges may still share an outside vertex; no unsupported freshness assertion is made.

As in the background lemma, both bases have a bare ordinary page. A pair of edge-disjoint ordinary pages, at least one bare, can be appended to suitable old maxima because the other page has at most one footprint edge in each clique. More generally two pages can be appended unless some old K4 sees opposite footprint edges; K5 avoids any two edges, and K4 avoids every pair except an opposite pair.

## 1. The path placement f=yt is impossible

Suppose f=yt. Since yz is background, every A maximum avoiding xy must use the f-page yzt: an old triangle cannot use yz, and the only e-page containing yz is xyz, which uses xy. Its e-page has apex w outside{y,t}, because it avoids xy and is disjoint from yzt.

Every bare ordinary f-page has apex z. Otherwise it avoids yz and, because w is not an endpoint of f, is disjoint from the preceding e-page. Append this bare page and that e-page over old maxima avoiding the one-base footprints; the resulting A maximum avoids yz, contradiction. Consequently zt is background.

The condition nu(A-{xz,yz})=m+1 supplies an ordinary f-page avoiding yz. If a bare e-page has apex p different from y, it must intersect every such f-page; otherwise the two pages append to a maximum avoiding yz. For disjoint restored bases this forces p=t, and forces every noncentral f-apex to be x. Hence all bare e-apices lie in {y,t}.

Suppose a bare e-page at t exists. Then xt and zt are bare. The f-page at x exists by the preceding residual packing and is NOT bare (all bare f-pages have apex z), so xy is supported. A minimum B cover can hit all nonbare e-pages simultaneously by the whole-one-base footprint property. It must in particular contain xy, the sole supported spoke of the central e-page xyz. Add the old edge zt: it hits the bare e-page at t and the f-page at z, while xy hits every other f-page, whose apex is x. This covers A with2m+1 edges, contradiction.

Therefore the ONLY bare e-apex is y. In particular xy is background. We now know that xy,yz,zt are background, the only bare e-page is xyz, and the only bare f-page is yzt.

Choose minimum old clique covers to hit every supported ordinary-page footprint from BOTH bases. Each clique receives at most one edge per base. If it receives both, it must contain x and t: all other pairs of restored-base endpoints are absent or background (xz,yt absent; xy,yz,zt background). Write the two footprint edges xw and tq. Distinct adjacent footprints are impossible:

* If w=q, the old edges yw,zw,yz form a B triangle, contradicting background yz.
* If w=t and q!=x, the old edges xy,yq,xq form a B triangle, contradicting background xy.
* If q=x and w!=t, the old edges zt,zw,tw form a B triangle, contradicting background zt.

These exhaust adjacency of xw and tq. Thus a K4 receives either one edge or an opposite pair, both contained in a minimum K4 cover. A K5 minimum cover contains any prescribed pair. Therefore one minimum B cover hits ALL noncentral ordinary pages of both bases. Add yz to hit the two bare central pages. The restored bases are disjoint, so no triangle uses both. This again gives an A cover of size2m+1, contradiction.

The path placement is impossible.

## 2. The star placement f=zt has one common noncentral apex

Now f=zt. The ordinary central pages are xyz and yzt. There is a noncentral ordinary e-page because xy is resilient in A. There is a noncentral ordinary f-page because yz is resilient in R=A-xz. Their apices are different from y and from the endpoints excluded by ordinariness.

Take any noncentral e-page xzp and noncentral f-page ztq with p!=q. They are edge-disjoint and avoid yz. If old maxima avoid both page footprints, they append to an A maximum avoiding yz, contradiction. The only possible obstruction is an old K4 with opposite footprint edges.

An old clique containing z sees only the two adjacent spokes zp,zq, so cannot be this obstruction. An obstructing K4 would instead contain the four distinct vertices x,p,t,q, with opposite edges xp,tq. It contains xt. But xy and yt are old edges, so xyt is an old triangle sharing xt with that K4. Its vertex y differs from x,p,t,q, forcing a fifth vertex in the same old K4, impossible. Therefore the obstruction cannot occur.

It follows that every noncentral e-apex equals every noncentral f-apex. Since both sets are nonempty, they are the SAME singleton {w}. Thus the ordinary new pages are exactly

    xyz, xzw, yzt, ztw.

The old edge yw is absent, since yz,zw,yw would form an old triangle supporting background yz. The old edge xt is also absent. If xt existed, the old triangles xyt and xwt would share xt, hence lie in one old literal clique and force yw; the preceding contradiction would follow. Thus no triangle uses both restored bases, and the displayed four pages are the entire new family.

Finally zw is background. If it were supported, choose a minimum B cover containing zw and add yz. The two spokes hit all four new pages, giving a cover of size2m+1. This contradicts the cover profile.

## 3. Exact old-piece intersection and retained background

On the five wheel vertices, the two restored spokes xz,zt were absent in B, the other two spokes yz,zw are background, and the diagonals xt,yw are absent. The only wheel-vertex pairs that can lie in an old clique are therefore the four rim edges xy,yt,tw,wx.

No old clique contains two distinct rim edges, since it would then contain a missing rim diagonal. Hence every old clique meets the wheel vertex set in at most one rim edge or one vertex. A clique meeting a rim edge is an actual old attachment along that edge; at most one old component can occupy any given rim edge. Every other old clique is untouched by the new triangle family. Distinct old clique components remain edge-disjoint, although arbitrary allowed vertex identifications and old background are retained.

This is a triangle-family classification, not an assertion that Q has already been reconstructed. The later restoration of c and the marked uv-book can activate old background and join old components; those actual pages still require complete-boundary analysis.

## Sharp attached control

Let A be W4 on rim x-y-p-q-x with hubz, with a literal K4 on{x,y,a,b} attached to rimxy. Set e=xz,f=pz. Then B is that K4 plus background, m=1. The triangle-family partition gives nu(A)<=1+2=3, attained by two opposite wheel triangles and a K4 triangle avoidingxy. Every maximum uses two wheel triangles and therefore all four hub spokes; in particular xz,yz are critical. Deleting rimxy preserves packing3. The cover number is4: a three-cover would require two-edge minimum covers of both pieces sharingxy, but no minimum two-cover of W4 contains a rim edge. Four edges suffice.

After adding c adjacent to x,y,z, the resulting L has nu4,tau5 and eligiblexy; an explicit minimum cover is

    {xy,ab,xz,pz,cy}.

The lower bounds follow from the same two-piece cover response: the six-vertex central graph has nu3,tau3 and xy is ineligible in every three-cover. Thus this is a genuine control for the surviving local cap branch. It shows why rim attachments cannot be silently discarded. Their ACTUAL Q restoration still has to be paid.

Dependencies: background lemma matching26_two_edge_critical_wedge_background_v1.md; exact profile and yz-resilience in R; ordinary clique packing/cover response facts. For application, matching26_critical_wedge_same_edge_v1.md supplies the last resilience condition inside minimum Q. All are explicitly separated from remaining Q restoration and cap availability. No census, optimization or defect-two naming was used.
