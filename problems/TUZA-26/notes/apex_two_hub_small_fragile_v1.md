> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Present-hub neighborhoods with three or four leaves: fragile residual payment

Frozen ordinary proof candidate, TUZA-26. This completes the two remaining finite-parameter, all-size interfaces from apex_two_hub_neighborhood_fragile_v1.md. No graph census or omitted external-background assumption is used. Independent review is required.

## Scope and previously paid tools

Use the conditional minimum-Q core, including two-edge packing resilience, triangle codegree at least two, whole-triangle minimum-cover eligibility, and the independently completed exclusion of every support vertex of degree at most four. The last exclusion uses only the earlier degree-three and C4/diamond/K4 degree-four operations; it does not depend on this two-hub extension.

Let N_Q(c)={x,y} union U, where U is independent, |U|=t in {3,4}, xy is present, and both hubs are adjacent to every leaf. Put J=Q-c. For distinct u,v in U, set M={xu,yv}, R=J-M. The accepted exact interface gives

    nu(J)=k, tau(J)=2k-3;
    every link edge is packing-critical in J;
    R has nu=k-2, tau=2k-5.

Suppose R is fragile at f. Then S=J-{xu,yv,f} is B, with m=k-3 and tau(S)=2m. Every maximum J packing is an old maximum S packing plus three ordinary pages, one per restored base. An ordinary page uses exactly one restored base. Every old background edge is retained.

We use the accepted COMPLETE-boundary exclusions: no old literal K4/K5 has at most two outside-Q-triangle boundary edges, including the independently closed opposite-pair K4 case; and a literal K4 has no pair of adjacent private edges. In particular a K4 boundary of size at most three is excluded, as is a triangle boundary with just one extra edge. We also use the independently proved degree-four simplicial exclusion, and, in one explicit mixed-boundary case, the full degree-four exclusion.

For any old clique and any one absent base, the whole ordinary-page footprint has at most one edge. An outside vertex has at most one old S neighbor in an old clique: two would create an old triangle joining it into that clique.

## A reusable anchored private-vertex argument

Suppose D is an old clique, every one of the three restored bases has an endpoint in D, and p is a D vertex outside the entire c-neighborhood and outside the restored endpoint set. Suppose no D edge incident to p belongs to D's COMPLETE boundary. Then p has no Q neighbor outside D.

To prove this, another old clique E through p cannot contain a restored endpoint s in D, since the two old cliques would share two vertices and an edge. If E contains an outside restored endpoint s, choose its restored mate a in D. The actual new page psa uses private D edge pa, contrary to completeness of the boundary. Thus E has no restored endpoint. It has no outside-Q triangle: an ordinary or mixed restored-base triangle requires such an endpoint in E, and a c-page uses a hub x or y, each itself a restored endpoint. Triangle connectivity of Q excludes such an isolated old component E. Finally a background outside edge at p could become supported only in a new base-page with apex p, which again uses a private D edge through the base's anchored endpoint; p is neither a c-neighbor nor a restored endpoint. This proves the assertion and gives degree_Q(p)=|D|-1.

The argument is about complete triangle boundaries and actual components. It does not infer vertex freshness merely from a small edge boundary.

## 1. Four leaves

Write U={u,v,w,z}. The old pages xyw and xyz both remain in R. If f!=xy, deleting f must kill one of these pages, or two independent book apices would remain in a single literal B clique. Up to symmetry f=xw. The surviving book triangle xyz lies in an old clique D.

D contains x,y,z and no other leaf. Each of the three restored families xu,yv,xw has an actual internal ordinary page using xy, so each whole D footprint is forced to xy. The c-pages contribute only xy,xz,yz. No mixed restored-base triangle adds an edge: the only adjacent restored bases are xu,xw, and their closing edge uw is absent. Hence D's COMPLETE boundary is triangle xyz.

K4 is excluded by its private-edge restriction. If D is K5, either vertex outside that triangle is outside the full c-neighborhood and the restored endpoint set. All three restored bases are anchored in D. The preceding argument makes both vertices genuinely private; either is an excluded degree-four simplicial vertex.

The remaining case f=xy is already paid in the earlier note: both unmarked leaves have both spokes background in S by complete adjacent-two-edge boundary exclusion. The ordinary xu,yv pages use none of those spokes, and the ordinary xy page uses at most one leaf's pair, leaving a critical spoke unused in a maximum J packing. Thus t=4 is impossible.

## 2. Three leaves, f=xy

Write U={u,v,w}. The earlier adjacent-boundary calculation makes xw,yw background in S. No old clique E containing w can contain x or y, since that would support a background spoke, or u or v, since U is independent. It therefore contains no restored endpoint and has no outside-Q triangle, including no c-page. Triangle connectivity excludes E.

The only new Q triangles containing w are xyw,cxw,cyw. An M-page at w would need uw or vw, both absent. Triangle support therefore forces N_Q(w)={x,y,c}, contradicting minimum degree.

## 3. Three leaves, f is another edge of the old book

Up to symmetry f=xw. The retained link edges in S are xy,yu,xv,yw.

Any old clique on xy receives the whole footprint xy from all three restored bases, via their internal pages, and no other c-boundary edge. Its complete boundary is one edge, so it is excluded. An old clique on yu has boundary contained in yu plus one y-incident footprint from yv; the xu family is forced to yu. A clique on yw is analogous, with the xw family forced to yw. Both have at most two adjacent boundary edges and are excluded.

An old clique D on xv receives that edge from the c-page and the internal yv-page. Its other two footprints, from xu and xw, are both incident with x. Thus its complete boundary is contained in a three-edge star centered at x. K4 is excluded. For K5, a boundary of size at most two is excluded; with three distinct star edges there is one D vertex p outside all boundary endpoints. D contains leaf v, so p is outside U, and y is absent from D since yv is missing. Therefore p is outside the c-neighborhood and restored endpoint set. The three restored bases are anchored at x,x,v in D, and the private-vertex argument gives an excluded simplicial degree-four vertex.

All four retained link edges are consequently background. In a maximum J packing, an external ordinary page uses none of them. An internal ordinary page uses xy and at most one of the other three. All internal pages share xy, so at most one occurs. Four critical background edges cannot all be used. This is a contradiction.

## 4. Three leaves, the old book survives

It remains that f is outside {xy,xw,yw}. The intact triangle xyw lies in an old clique D. It contains neither u nor v because xu,yv are absent. Let T={x,y,w}. Every vertex of D outside T is called private in this section, before any vertex-freshness conclusion is drawn.

We give an exhaustive placement split for f. Two special placements are kept separate because they create mixed restored triangles and TWO additional boundary edges; a triangle-plus-one-footprint claim alone would be false there.

### 4a. Special mixed-boundary placements

First suppose f=yu (the case xv is symmetric). The outside vertex u has at most one old neighbor a in D. It cannot be x,y,w, so, if present, a is private. The complete boundary of D is contained in

    E(T) union {xa,ya}.

Indeed the yv footprint is forced to xy, the c-boundary is E(T), the ordinary xu/f pages through a contribute xa,ya, and their mixed triangle xuy contributes only xy. If no such a exists, the boundary is just E(T).

The same displayed boundary occurs if f=ua with a a private D vertex (or f=va symmetrically). Here uy is old, the ordinary f-page uay contributes ya, and the actual MIXED page uax contributes xa. The M footprints are forced to xy. These are precisely the extra mixed triangles that must not be omitted.

For D=K5, if a is present the other private vertex b is incident with no boundary edge; if no a is present either private vertex has that property. All three restored bases meet D, so the anchored argument gives a degree-four simplicial vertex.

For D=K4, the boundary E(T) alone is excluded. Otherwise D=T union {a}. We prove w has exactly four Q neighbors, namely x,y,a,c. Any other old clique through w must contain a restored endpoint to have an outside-Q triangle. An endpoint in D would merge that clique with D; an outside restored endpoint is u or v and is nonadjacent to w. Thus there is no such old clique. No ordinary new page with apex w exists, since each restored base has an outside endpoint u or v and U is independent. No mixed new triangle uses w, which is not a restored endpoint. The only additional supported edge at w is cw. Hence degree_Q(w)=4, excluded by the independent full degree-four theorem. Its neighborhood is a diamond, not a simplicial K4; this use is explicit.

### 4b. No endpoint of f lies in D

Now exclude the special cases above. If f has no D endpoint, the complete D boundary is E(T). Both M internal pages exist and force their whole footprints to xy. A mixed f/M triangle cannot contribute a D edge, since f has no D endpoint. K4 is excluded, so D=K5 with private vertices a,b.

Any other old clique E containing a or b cannot contain x,y,w (it would merge with D), or u,v: such an old edge to a private vertex would make an M-page using a private D edge. Thus among restored endpoints it can contain only an endpoint of f, at most one because f is absent. Its complete boundary is at most one edge, so E is excluded.

A new M-page at a or b would enlarge the D boundary and is impossible; c is adjacent to neither. The only remaining new triangle capable of supporting an outside edge at a private vertex is an f-page. Since either outside endpoint of f has at most one old neighbor in D, at most one of a,b can be an f-page apex. The other has exactly four D neighbors, contradiction.

### 4c. One endpoint of f lies in D, with boundary footprint meeting T

If f has an endpoint in T, its other endpoint is outside the full c-neighborhood after the special cases and already excluded bases/book edges are removed. Its ordinary D footprint has at most one edge h incident with that T endpoint, and mixed restored triangles add no D edge. Thus the complete boundary is contained in E(T) union {h}.

If f has a private endpoint a and its other endpoint is outside the full c-neighborhood, the same boundary description holds. If h meets T, it is incident with a. (The possibility h joins the two private vertices is deferred to 4d.)

A K4 with boundary E(T) plus at most one extra edge has two adjacent private edges and is excluded. For K5, at least one private vertex is incident with no boundary edge and is not a restored endpoint. All bases are anchored in D. The private-vertex argument therefore yields an excluded simplicial degree-four vertex.

### 4d. The two private vertices form the extra boundary edge

The sole remaining case is

    D=K5 on {x,y,w,a,b},
    f=ar with r outside the full c-neighborhood and outside D,
    complete boundary F_D=E(T) union {ab}.

The boundary edge ab is realized by the ordinary f-page arb, so rb is old. Completeness gives rx=ry=rw absent: any such edge would make an f-page using the forbidden private D edge ax,ay,aw. It also gives ua=ub=va=vb absent: these would make M-pages using forbidden private D edges from x or y.

Every old clique E other than D has complete boundary at most two, as follows.

* If E contains a, it contains none of r,x,y,w,b,u,v, by the absent edges or old-component intersection. Its only possible restored footprint is one edge on f. No c-page or mixed restored triangle adds another.
* If E contains r, it contains none of a,x,y,w and at most one of u,v. If it contains b, it contains neither u nor v. Thus it has at most one f footprint and one M footprint. A c-page cannot use an E edge, and f is disjoint from both M bases, so there is no hidden mixed triangle.
* If E contains neither a nor r, it has no f footprint. An old A link edge in E can only be yu or xv; the other old link edges belong to D. Its actual internal M-page forces one whole footprint to that same link edge, and the other contributes at most one incident edge. With no A link edge, E has at most one A vertex and at most one M footprint. Again no mixed triangle or c-page adds an uncounted boundary edge.

The accepted full two-edge boundary theorem, INCLUDING the opposite-pair K4 closure, excludes every such E. We do not assume the two edges in the second bullet are always adjacent. Thus S has only D triangle support.

Every ordinary xu-page now has only apex y. An apex a or b is forbidden by the D boundary; another leaf is nonadjacent to u; apex r would require absent xr. For an apex p outside D union {r} union U, the old spoke up is background and its only Q triangle would be this xu-page: the other M base and f have no endpoint on it, and c is not adjacent to p. Triangle codegree at least two excludes it. The yv family similarly has only apex x.

Finally u has no old supported outside edge, no f-page at u because ua is absent, no yv-page at u because uv is absent, and no other xu-page. Its only Q neighbors are x,y,c. This contradicts minimum degree. The symmetric conclusion holds for v as well.

The placement split is exhaustive: f has zero or one endpoint in D; with one endpoint it is in T or private; the other endpoint is u/v (the special mixed case) or outside the entire link; a sole ordinary footprint either meets T or is the edge between the two private vertices. Thus every present-hub fragile interface for t=3 is excluded.

## Composition and limits

This note excludes fragile opposite residuals for present-hub t=3,4. Together with the separate t>=5 exclusion, absent-hub resilience repair, and matching26_two_hub_named_reconstruction_v1.md, independently accepted versions would exclude EVERY supplied neighborhood K2,t plus optional hub edge for t>=3. This is a genuine unbounded local operation, not a claim that every remaining minimum Q contains such a neighborhood.

The only newly needed stronger premise beyond the earlier two-hub note is the already independent full degree-four exclusion in 4a. All other private-vertex uses are simplicial and all shared old components are explicitly addressed. The proofs use actual Q triangles, including mixed restored-edge triangles, and literal retained outside regions. No computation was run. Root supplied the initial case sketches; apex_challenger found and repaired the two-extra-spoke mixed cases and checked the complete boundary and degree arguments.
