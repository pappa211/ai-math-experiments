> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Empty endpoint links: exact defect-two descent cannot stop at B

Frozen ordinary candidate v1, TUZA-26, 2026-11-17. Independent review required. This addresses an exact branch of the canonical outside-packing interface, not arbitrary defect-two supports.

## Marked outside graph

Use the full minimum-Q profile with codegree exactly two at uv, common neighbors x,y, minimum degree at least four, and triangle codegree at least two on every Q edge. Suppose the compatible residual L has a maximum packing with no endpoint triangles, as occurs when both usable endpoint links are empty. Put

    W=Q-{u,v}, nu(W)=m=k-1.

The accepted/candidate canonical outside lemma proves that EVERY endpoint-link rim other than xy is packing-critical in W: avoiding that rim in a maximum W packing permits its endpoint triangle and the other uv-page to append, giving k+1.

The same full-page K-cover profile gives tau(W)<=2m-2. This note takes the EXACT branch

    tau(W)=2m-2.

We prove every packing-critical W edge is cover-eligible. Consequently deleting any critical endpoint rim produces an actual defect-one graph, not a tight B graph:

    nu(W-r)=m-1, tau(W-r)=2m-3.

Its resilience remains a separate question. No defect-two graph is named.

## Suppose a critical edge is ineligible

Let r be ANY packing-critical W edge which is absent from every minimum W cover. Deleting an edge lowers tau by one exactly when it is eligible; hence

    nu(W-r)=m-1, tau(W-r)=2m-2=2nu(W-r).

Proper CS inside fixed G makes S=W-r a B graph: all its triangle components are literal K4/K5, with arbitrary retained background. W restores the single missing edge r with packing gain one and cover gain zero. Every maximum W packing is an old maximum S packing plus exactly one ordinary r-page.

Every actual r-page has at least one old supported spoke. Indeed a minimum W cover has size tau(S); its restriction to the old tight components must already use that many edges. It has no edge available outside old supported components. A page with two old background spokes and restored base r would therefore be uncovered.

The whole one-base footprint property applies to every old clique D: all ordinary r-pages use at most one D edge in total. Moreover at most ONE page can use that particular edge, since r and one of its spoke edges determine its apex uniquely.

## At least two pages leave only one critical edge

If there are at least two distinct r-pages, EVERY old edge is resilient in W. For a supported edge g in a clique D, choose an r-page whose spokes avoid D; it exists by the preceding whole-footprint observation. Choose a maximum D packing avoiding g, and maximum packings in every other clique avoiding the chosen page's at-most-one footprint there. Append that page. This gives an m-packing avoiding g. For an old background edge g, at most one page uses it, so choose another page and append it to an avoiding old maximum packing. Thus

    Crit(W)={r}.

But a u-exclusive neighbor a exists by minimum degree at least four: u already has only v,x,y among the nonexclusive neighbors. Since a is not adjacent to v, every Q triangle on ua corresponds to an actual u-link rim incident to a in W. Triangle codegree at least two gives at least two distinct such rims. Neither is xy, so both must be critical in W. This contradicts Crit(W)={r}.

## Exactly one page gives a triangle and isolated edges

It remains that W has one new page T. Its two old spokes lie in at most two old clique components; if both were in one clique, that clique would force the missing base r. At least one spoke is supported, by the unchanged-cover argument above.

The critical-edge set of W is EXACTLY:

    all three edges of T;
    plus the edge opposite the supported T-spoke in each supporting K4.

There is no additional edge from a supporting K5 and no other critical edge anywhere. Here is a complete packing check. Every maximum W packing must use T because old S has packing m-1. Therefore each T edge is critical. In a supporting K4, every maximum local packing avoiding its used T-spoke contains the opposite edge; that edge is also critical. Every other edge can be avoided simultaneously with that single footprint in a maximum local packing: two adjacent edges can be avoided in K4, and any two prescribed edges can be avoided in K5. Components untouched by T can avoid any one edge at full size, and old background outside T is never used. These choices produce an m-packing avoiding each asserted noncritical edge. Deleting a claimed critical edge still leaves the resilient old S packing of size m-1, proving the loss is exactly one.

The extra opposite K4 edges are disjoint from T. If both spokes are supported in distinct K4 components, those components already share T's apex. They cannot share any additional vertex without sharing an old clique edge and merging, which would force r present. Thus the two extra opposite edges are also vertex-disjoint from each other. Arbitrary other vertex sharing does not alter the critical graph. In particular Crit(W) is a triangle plus at most two isolated edges.

Choose a u-exclusive neighbor a as above. It has at least two distinct critical rims incident to it, so it must lie on T; vertices on the isolated critical edges have critical degree one. Its only two critical neighbors are the other two T vertices. Both are actual neighbors of u because they supply the two u-link rims. Hence ALL THREE T vertices lie in N_Q(u).

The same argument applies at v, which also has an exclusive neighbor by minimum degree at least four. It forces all three T vertices into N_Q(v). This contradicts the assumption that u,v have exactly two common neighbors. Thus the unique-page case is impossible as well.

## Result and exact remaining branch

No packing-critical edge of exact-defect-two W can be cover-ineligible. Every critical rim deletion therefore has defect one with the displayed exact parameters. If that residual is resilient, minimum-Q naming may legitimately identify its one active C12 support plus tight pieces. If it is fragile at a further edge f, proper CS gives

    B=W-{r,f}, nu(B)=m-2, tau(B)=2m-4,
    W=B+{r,f} with packing gain2 and cover gain2.

Those two subsequent reconstruction obligations are not proved here. The result does not supply the missing lower bound tau(W)>=2m-2 in the general empty-link case; W may have larger defect. It is an actual exclusion of the direct tight descent using the marked endpoint neighborhoods and all real triangles, not a general classification of defect-two W.

Sources: notes/matching26_canonical_outside_packing_v1.md; accepted whole-one-base old-clique footprint facts; the ordinary K4/K5 one- and two-edge avoidance facts; fixed-G proper CS; accepted minimum-Q triangle codegree and degree bounds. No graph enumeration or numerical computation was used.
