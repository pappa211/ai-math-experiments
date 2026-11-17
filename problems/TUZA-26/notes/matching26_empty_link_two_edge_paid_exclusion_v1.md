> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Empty-link two-edge B restoration has a paid contradiction

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-17. Independent review required. This closes the exact B+two-edge branch by actual cover/packing operations, without enumerating the previously bounded domain.

## Exact interface and bare-page supply

Use the full minimum-Q codegree-two outside-packing interface: uv has common neighbors exactly x,y, W=Q-{u,v} has nu(W)=m=nu(Q)-1, Q has minimum degree at least five and every edge has triangle codegree at least two, every actual Q triangle is wholly contained in a minimum Q cover, and every u/v-link rim other than xy is critical in W.

Suppose distinct edges r,f satisfy

    B=W-{r,f}, nu(B)=m-2, tau(B)=2m-4,
    B has only literal K4/K5 triangle components,
    nu(W)=m, tau(W)=2m-2.

All background and arbitrary vertex identifications remain. Every maximum W packing is an old maximum B packing plus two disjoint ORDINARY pages, one per base. A triangle using both restored bases could not supply the gain two.

Each base has a B-BARE ordinary page, whose two old spokes belong to no B triangle. Otherwise choose minimum old-clique covers through that base's whole one-edge-per-clique footprint and add the other restored base. This covers every ordinary page, all mixed two-base triangles, and all old triangles with at most tau(B)+1 edges, contradicting the cover gain two.

The whole-family footprint property is used in its exact form: an old clique sees at most one edge from ALL ordinary pages on a fixed missing base. Two distinct footprint apices would create an old triangle through the opposite base endpoint, merging it into the clique and forcing the missing base.

## 1. A compatible pair of bare pages gives adjacent private K4 edges

Suppose there are edge-disjoint bare pages T_r,T_f. Append both to any old maximum B packing. Every old supported edge can be avoided by varying its local clique packing, because both pages have zero old supported footprint. A background edge outside the two pages is absent from this maximum packing. Therefore

    Crit(W) is contained in E(T_r) union E(T_f).

Two edge-disjoint triangles share at most one vertex. Let A=N_Q(u)-{v,x,y}, and define the v-exclusive set similarly. These sets are nonempty by minimum degree five. An exclusive vertex a adjacent to u has at least two distinct u-link rims incident to it, by Q triangle codegree at least two on ua. Both are critical in W, since a is not x or y.

If the two pages share a vertex s, s cannot be exclusive to one endpoint. An exclusive neighbor of the OTHER endpoint would then be a different, nonshared page vertex, and its two critical incident rims would force its entire page, including s, into that other endpoint's neighborhood, contradiction. Every exclusive vertex is therefore a nonshared page vertex. Its only possible two critical neighbors are the other vertices of its page, so its whole page lies under that endpoint.

The two endpoints must select DIFFERENT pages, because selecting the same page would give three common neighbors. Nor can either endpoint have an exclusive vertex in both pages. Relabel so that the exact neighborhoods are

    N_Q(u)={v} union V(T_r) union {x,y},
    N_Q(v)={u} union V(T_f) union {x,y}.

These are exact: every other neighbor would be another exclusive vertex, already accounted for. If the pages share s, it is a common hub, and minimum degree five forces the other common hub outside BOTH pages; otherwise one endpoint would have degree four. If the pages are disjoint, each page contains at most one common hub, again by the same degree count. Thus each selected page has exclusive vertices.

We now choose a bare spoke e of one page which belongs to NO other W triangle and has an exclusive endpoint a. Such a choice always exists:

* If the pages are vertex-disjoint, the other restored base has no endpoint in either page. Every bare spoke is unique to its own ordinary page. Choose one incident to an exclusive vertex.
* If their shared vertex s is a base endpoint of at least one page, choose that page and its spoke opposite s. Both endpoints of that spoke lie outside the other page, hence outside the other base. They are exclusive vertices.
* Otherwise s is the apex of BOTH pages. The bases are disjoint and neither has an endpoint in the other page. Every bare spoke is unique to its page; choose one at a nonshared, exclusive vertex.

Uniqueness is literal: B-bareness excludes old triangles, the chosen spoke and its own base determine its page uniquely, and it is disjoint from the other restored base so cannot occur in a page or mixed triangle using that base.

Write T_r for the chosen page and take its exclusive endpoint a under u. The four vertices D={u} union V(T_r) form K4. The spoke e is PRIVATE in this K4: its only W triangle is T_r, a u-page on it lies inside D, and a v-page is impossible because a is exclusive.

The edge ua is also PRIVATE. Any Q triangle on ua has its third vertex in the exact displayed neighborhood of u. A third vertex v is impossible since av is absent. A third vertex z in {x,y} outside T_r would require an actual rim az; this is critical because a is exclusive, but it lies in neither selected page, contradicting the critical envelope. Thus every such triangle stays in D.

The adjacent private edges ua and e violate the accepted K4 private-edge lemma under whole-triangle eligibility. Explicitly, choose the actual D triangle containing them, take a minimum Q cover containing its three edges, and replace those three edges by an opposite-pair K4 cover retaining its possible single exposed edge. This saves one edge while preserving all outside coverage. Hence a compatible bare pair is impossible.

It remains to analyze the two possible base geometries when EVERY bare r-page intersects EVERY bare f-page.

## 2. Adjacent bases: the joint-cover obstruction gives two impossible exceptions

Write r=ab,f=ac. Ordinary pages on these bases intersect exactly when they have the SAME apex; the reciprocal terminal possibilities would use both restored bases and are not ordinary. Thus the two nonempty bare families are both the same singleton apex p. The bare pages are abp and acp. In particular ap,bp,cp are old background edges, and bc is ABSENT: if present, bcp would be an old triangle, contradicting bareness.

Suppose every old clique admitted a minimum cover containing both of its whole ordinary-family footprints, when present. Combining those local covers would cover every nonbare ordinary page. Adding ap would hit both bare pages. There is no mixed two-base triangle because bc is absent. This would cover W with tau(B)+1 edges, contradiction.

Therefore some old clique fails this joint-cover condition. K5 admits any pair in a minimum cover. K4 admits one edge or an opposite pair; its only obstruction is TWO DISTINCT ADJACENT footprint edges. Let D be such a K4. It must contain a: otherwise touching both families requires b,c in D, contrary to absent bc. It cannot also contain b or c, since ab,ac are missing from B. Its footprints are consequently aq and at for distinct nonbare apices q,t, with actual pages abq and act. Neither apex is p because ap is background.

The pages abq and act are disjoint. D has a maximum triangle packing avoiding adjacent edges aq,at. Every other old clique sees at most one of their spokes: if a second clique contained both remaining spokes bq,ct, it would contain b,c and force absent bc. Any clique containing another of aq,at would share an old supported edge with D and be D itself. Thus old full-size avoiding packings together with these two pages give a maximum W packing using NEITHER bp nor cp.

Both bp and cp are therefore resilient in W. Each has exactly ONE W triangle: it is B-bare; its own base gives the original page at p; and the other base is disjoint from that spoke. Q triangle codegree at least two requires an endpoint page on each, making each a critical rim unless it is xy. Both distinct edges would have to equal xy, contradiction.

This explicitly pays the adjacent-footprint joint-cover obstruction; it does not assume two adjacent K4 footprints lie in a minimum two-edge cover.

## 3. Disjoint bases: either a cover saving or a central K4 payment

Write r=ab,f=cd. Ordinary pages on the two bases intersect only through reciprocal terminal apices. Since every bare pair intersects, no bare apex lies outside the four terminals. Relabel a chosen pair as the bare faces abc and acd. Thus ac,bc,ad are old BACKGROUND edges.

All old cliques admit joint minimum covers of both ordinary-family footprints. Indeed a clique touching both base families must contain one endpoint of each base. It cannot contain {a,c}, {a,d}, or {b,c}, because those edges are background. Its only possible endpoint pair is {b,d}. Then bd is an old supported clique edge. The ACTUAL central pages abd and bcd both exist, and each already uses bd. The whole-family footprint lemma forces BOTH entire footprints in that clique to be the SAME edge bd. Thus no distinct adjacent K4 pair occurs at all. A clique touching just one family needs only its one prescribed eligible edge. Combining these local minimum covers covers every nonbare page.

If bd is absent or supported, the only bare central faces are abc and acd. (When bd is supported, abd,bcd are nonbare and already covered by its prescribed footprint.) Add ac to the old cover and cover W at cost tau(B)+1, contradiction.

The remaining case is that bd also is background. The four vertices a,b,c,d then form an actual central K4 in W with all FOUR ordinary faces bare. The packing gain two forces some external ordinary page P: two triangles wholly in this K4 cannot be edge-disjoint. Suppose P is on r, with an apex outside the four terminals; the other case is symmetric.

P is disjoint from EITHER central f-face acd or bcd. Its supported old spokes meet each old clique at most once, so it and either chosen bare face append over a full old B packing. For any of the four old central C4 edges ac,ad,bc,bd, choose the f-face avoiding that edge. P avoids every old central edge and B packings use none of them because they are background. This gives a maximum W packing avoiding the queried edge. Hence all four old central C4 edges are resilient in W.

The COMPLETE outside-Q boundary of the literal central K4 is contained in

    {ab,cd,xy}.

Every external W page meets it only in its restored base ab or cd. There is no mixed two-base triangle because the bases are disjoint, and no old B triangle uses any of its old background edges. Endpoint pages on those four old C4 edges are impossible except at xy, by their established resilience. This accounts for all actual triangles with arbitrary outside background. The accepted K4 at-most-three-boundary exclusion now supplies the paid cover contradiction.

## Conclusion and exact scope

Compatible bare pairs are excluded by an actual K4 private-edge saving. The only remaining adjacent and disjoint base geometries are excluded by the explicit old-cover/packing repairs above. Therefore NO B+two-edge restoration with the displayed gains(2,2) can occur in the supplied minimum-Q outside-packing interface.

Combined with the accepted direct-B and multiple-page reductions and the candidate unique-page exclusion, this eliminates the entire EXACT tau(W)=2nu(W)-2 branch. The larger-defect W branch, and global availability of a codegree-two edge satisfying nu(Q-{u,v})=nu(Q)-1, remain OPEN. The earlier32-vertex domain is not enumerated or used as a proof premise.

Sources: notes/matching26_canonical_outside_packing_v1.md; notes/matching26_empty_link_defect_two_descent_v1.md; notes/matching26_two_edge_critical_envelope_v1.md for local packing interpretation only; notes/apex_k4_triangle_boundary_v1.md; the accepted full minimum-Q profile and ordinary B footprint/cover/packing facts. Root supplied the adjacent joint-cover obstruction and disjoint central-K4 repair; matching_geometry checked their complete actual triangle scope and supplied the compatible-bare-pair private-edge reduction. No numerical computation or graph enumeration was used.
