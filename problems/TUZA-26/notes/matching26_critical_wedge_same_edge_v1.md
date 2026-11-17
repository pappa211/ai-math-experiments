> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# The same critical-edge deletion cannot survive the actual cap restoration

Frozen ordinary proof candidate, TUZA-26. This excludes the subcase B=A-{xz,yz} in the ACTUAL degree-four cap reconstruction. It retains all background and allows arbitrary shared vertices of old clique components. No classification of all B-plus-two graphs is asserted.

## Explicit hypotheses

Use the actual conditional minimum-Q setting:

* Q is triangle-supported and has minimum support degree at least four.
* uv has exactly common neighbors x,y.
* A=Q-{uv,ux,vx,uy,vy}-c, where N_Q(c)={u,x,y,z}, with all six vertices distinct and uz absent.
* B=A-{xz,yz} has only literal K4/K5 triangle components, and A restores those two edges with nu(A)=nu(B)+2 and tau(A)=tau(B)+2.
* xyz is an actual A triangle, so xy is an old B edge.
* The accepted minimum-Q boundary theorem excludes a literal old K4/K5 whose COMPLETE outside-Q-triangle boundary has at most two edges, adjacent when there are two in K4.

The conclusion is that these hypotheses are inconsistent. Thus in the fragile critical-wedge branch, yz itself cannot be chosen as the critical deletion f of R=A-xz.

## A bare ordinary xz-page exists

By the one-base footprint argument used in matching26_two_edge_critical_wedge_background_v1.md, the cover increase two forces an ordinary xz-page xzw whose two old spokes xw,zw are B-bare. Otherwise a minimum B cover can hit every ordinary xz-page, and adding yz covers every remaining new triangle, saving one.

The apex w differs from y because the central triangle xyz uses both restored bases. It also differs from u,v because ux,vx are absent in A, and from c because c has been removed. Thus w is outside {u,v,c,x,y,z}.

## Old cliques away from x,y,z are genuinely paid

Let D be any old literal B clique containing none of x,y,z. It cannot contain c, which is isolated after c's edges were removed. It contains at most one of u,v because uv is absent in B.

List all restored edges from B to Q:

    xz,yz, uv,ux,vx,uy,vy, cu,cx,cy,cz.

No ordinary restored xz/yz-page uses a D edge, since neither endpoint belongs to D. No ordinary page on a c-edge exists relative to B because c has no old B spokes. The only uv-pages are uvx,uvy, whose other edges are restored; they contribute no old D boundary.

For ux,uy,vx,vy, D can receive an old-edge footprint only at the possible endpoint u or v it contains. The complete ordinary-page footprint of each fixed base in an old clique has at most one edge. Thus D receives at most two old edges, both incident with that same endpoint.

Triangles using two or more restored edges cannot add a hidden D boundary: their third old edge, if any, has both endpoints among {u,v,c,x,y,z}, whereas D contains at most one of these vertices. This accounts for ALL actual Q triangles, including arbitrary old background and multiple-restored-edge triangles.

Therefore D's complete outside-Q-triangle boundary has at most two adjacent edges. The accepted boundary exclusion removes every such D.

## The bare apex has no old triangle support

Suppose w belonged to some remaining B clique. Every remaining clique meets {x,y,z}. It cannot contain x or z, since then xw or zw would be supported, contrary to bareness. If it contains y, the old edges xy,xw,yw form an actual B triangle, again contradicting bareness of xw. Consequently w belongs to NO old B triangle component.

The old edge yw is absent for the same reason: xy,xw,yw would be an old triangle. The only new A triangle through w is therefore the xz-page xzw. A yz-page through w would require absent yw; the sole triangle using both restored edges is xyz and does not contain w. Thus the only triangle-supported A edges at w are xw and zw. Other incident A edges, if present, remain background at this stage.

## Actual Q support forces degree at most three

Since c has exactly the four stated neighbors, no c-triangle contains w. The only other restored bases are uv,ux,vx,uy,vy. Their actual pages through w can use only the neighbor endpoints u,v,x,y. The edge yw is absent, and w cannot be an uv-apex because uv has only x,y as common neighbors.

Every Q edge must belong to an actual triangle. Hence every neighbor of w lies in {x,z,u,v}. Moreover w cannot be adjacent to BOTH u and v, or it would be a third common neighbor of uv. Therefore

    degree_Q(w)<=3,

contrary to the minimum-degree-four hypothesis.

This is the required actual reconstruction payment for f=yz. It does not assume the bare apex is a private vertex; its possible old clique membership and every supported background edge have been explicitly eliminated.

## Scope and controls

The local A profile alone does allow arbitrarily many bare pages on xz and yz, with disjoint bare apex sets, plus central trianglexyz. The smallest example has exactly triangles xzw,xyz,yzt, with nu2,tau2; adding c on xyz gives nu3,tau3 and eligible xy. Thus the branch is not dismissed by a false local classification. It is excluded only after the actual Q restoration, complete old-clique boundary payment, codegree two and minimum degree are used.

Combining this result with the supported-yz exclusion, once both pass review, leaves only

    B=A-{xz,f}, with yz background,
    f=zt or f=yt, t outside {x,y,z},
    and the actual triangle yzt present.

The two remaining star/path restorations and cap availability remain OPEN.

Relied sources: notes/degree_four_cap_critical_wedge_v1.md for the actual A profile; notes/two_edge_tight_boundary_v2.md and its accepted review for the complete boundary payment; the one-base footprint proof recorded in matching26_two_edge_critical_wedge_background_v1.md. No numerical computation or census was used.
