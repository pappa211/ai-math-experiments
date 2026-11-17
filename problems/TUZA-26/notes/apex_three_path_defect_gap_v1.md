> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A three-edge path cannot restore the defect-one gain-two profile

Frozen ordinary proof candidate, TUZA-26, 2026-11-16, awaiting independent criticism. This treats packing gain two, distinct from TUZA22's equality-restoration gain-one argument. Full actual triangles and arbitrary background are retained.

## Theorem

Let L be a finite simple graph satisfying B(L): every nonempty old triangle component has literal K4 or K5 support. Arbitrary background and shared vertices are allowed. Let a,b,c,d be distinct vertices and S={ab,bc,cd} three missing edges. Set Q=L+S and r=nu(L). Then

    nu(Q)=r+2  implies  tau(Q)<=2r+2.

Equivalently, the three-edge path cannot have simultaneously nu(Q)=r+2 and tau(Q)=2r+3. Neither resilience, connected triangle support nor absence of isolated vertices is needed.

## Reused elementary facts

An ORDINARY page on a restored base uv is uvx with both old spokes ux,vx in L; a B-BARE page has both old spokes outside old triangle support. Ordinary ab-apices can be outside {a,b,c,d} or d, never c; ordinary cd-apices can be outside or a, never b. Every ordinary bc-apex is outside {a,b,c,d}.

For a fixed base, an old clique receives at most one spoke from its ENTIRE ordinary-page family. Otherwise two old neighbors of one base endpoint inside that clique, together with their clique edge, form an old triangle forcing the other endpoint into the same literal triangle component, contrary to the base being missing. Therefore if a base has no bare ordinary page, minimum old clique covers can be selected through all its old page spokes at total cost2r. Adding the other two restored edges covers Q. Under the contrary assumption tau(Q)=2r+3, EVERY base consequently has a bare ordinary page.

Any two edge-disjoint ordinary pages on adjacent restored bases append to a maximum old packing. An old clique receives at most one spoke per page. A two-edge footprint is incident: if the two outer spokes were disjoint in a clique not containing the common base endpoint, its two distinct old neighbors there would form an old triangle forcing that endpoint into the clique. K4 and K5 maximum packings avoid two incident edges. Thus three edge-disjoint ordinary pages append whenever at least one END page is bare (the other two pages are on adjacent bases). Three edge-disjoint ordinary pages also append when at least TWO pages are bare, since the remaining single page has at most one old spoke in each clique. Both conclusions would give r+3, forbidden.

These footprint arguments are already present at their stated scope in TUZA22 notes/three_path_edge_restoration_v1.md and notes/three_star_edge_restoration_v1.md. This proof does not assume that arbitrary pairs on disjoint bases are compatible.

Suppose for contradiction tau(Q)=2r+3. All three bases have bare pages by the preceding facts. The only possible new triangles besides ordinary pages are abc if ac is old, and bcd if bd is old.

## 1. No bare end page has an internal apex

Suppose abd is a bare ab-page, so ad and bd are background. Choose a bare cd-page.

If its apex is an external vertex z, any ordinary middle page bcx with x!=z is disjoint from both abd and cdz. Two of the three are bare, so they append, contradiction. Thus the middle page family has only apex z; because it has a bare page, bcz is bare. But bd,bz,dz are all old and form triangle bdz, contradicting the background status of bd (indeed all three displayed edges are background). Hence the chosen bare cd-page must be cda, so ac and ad are background.

Now fix a bare middle page bcx. An external ordinary ab-page aby with y!=x would be disjoint from bcx and cda; two are bare, so three append. If y=x, the old edges ac,ax,cx form triangle acx containing the background edge ac, again impossible. Thus ab has only its internal page abd. Symmetrically cd has only its internal page cda: a different external apex gives three appendable pages, and apex x gives the old triangle bdx containing background bd. Every middle page contains bc; the two possible two-restored-edge triangles also contain bc. The pair {ad,bc} therefore covers ALL new triangles, a contradiction after adjoining an old minimum cover.

This excludes bare abd. Reversing the path excludes bare cda. Consequently all bare end-page apices are external.

## 2. The two ends cannot share a bare apex

Suppose abx and cdx are bare, for external x. These two pages are edge-disjoint. An ordinary middle page bcy with y!=x would be disjoint from both, and two bare pages make the three appendable. Thus ALL middle pages have apex x, and bcx is bare because the middle family has a bare page.

Hence ax,bx,cx,dx are background. The old crossedges ac,ad,bd are absent, since each would complete an old triangle through x containing these background spokes. The fourth crossedge bc is absent by definition. No two-restored-edge triangle or internal end page exists.

If there were external end pages aby and cdz with y,z both different from x, they would be disjoint from bcx and from each other (y,z may equal; sharing only an apex vertex does not share an edge). Their whole old footprints are compatible with maximum old packings: a clique receiving spokes from BOTH end pages would contain one endpoint from {a,b} and one from {c,d}, forcing an absent old crossedge. Thus each old clique receives at most one spoke total. Append these two pages and the bare bcx to obtain r+3, contradiction.

Therefore at most one end family has apices other than x. If only the ab family varies, {ab,cx} covers every new triangle; if only cd varies, use {bx,cd}. These are two-edge extension covers, contradiction. Thus the bare apex sets of the two ends are disjoint.

## 3. Distinct bare end apices always give a two-edge cover

Choose bare abx and cdy with external x!=y. Any middle ordinary page with apex outside {x,y} is disjoint from these two bare pages and gives r+3. Therefore all middle apices lie in {x,y}. Choose a bare middle page; by reversing the path and renaming x,y if needed, assume bcx is bare.

Every ordinary ab-page must have apex x. Any other apex z (including the allowed internal apex d) would give three edge-disjoint pages abz,bcx,cdy, with the latter two bare. Thus the ab family is exactly {abx}. The old edge ac is absent, because ax and cx are old background and would complete triangle acx. Hence abc is absent.

If the middle family has only apex x, the pair {bx,cd} covers all ordinary pages, and it also covers the only possible two-restored-edge triangle bcd. This is a two-edge extension cover, contradiction.

Otherwise bcy also exists. Every ordinary cd-page must then have apex y: for any other apex z, the three pages abx,bcy,cdz are edge-disjoint, and the bare END page abx makes the two adjacent remaining pages simultaneously compatible. They would append to give r+3. Thus the cd family is exactly {cdy}.

The old edge bd is absent. Otherwise bd,by,dy would form an old triangle containing background dy from the bare page cdy. Consequently bcd is absent as well. The entire new family is now exactly

    abx, bcx, bcy, cdy.

It is covered by {bx,cy}, another two-edge extension cover. This final contradiction proves the theorem.

## Control, implication and remaining gap

The TUZA25 five-K4 P4 control has nu(L)=2,tau(L)=4 and nu(Q)=5,tau(Q)=6: packing gain THREE. It refutes an unrestricted gain-at-most-two shortcut and is consistent with this theorem. Our argument explicitly permits three appended pages and uses them only to contradict the stated gain-two premise. No arbitrary disjoint-end footprint avoidance is asserted.

For a conditional minimum unknown Q outside C12, accepted blocker saturation says a blocker pair has a defect-one residual. If that residual has a critical edge g, proper-subgraph CS yields B(Q−{e,f,g}), with total packing loss two and cover loss three. The theorem excludes this configuration whenever the three edges form P4. It does not force a blocker, force fragility, or classify the remaining triangle, matching or P3-plus-edge shapes. The no-blocker case remains separate.

Implication labels: minimum-CS framework -> Q is CONDITIONAL on archived profile/restoration; Q plus accepted saturation and fragility -> three-edge-B gain-two profile is PROVED at those premises; P4 profile -> contradiction is this frozen ordinary candidate awaiting criticism; existence of some usable excluded shape or a paid alternative in every remaining Q is OPEN; universal CS -> unrestricted Tuza is PROVED. This is a new constraint on a genuine failed-descent obstruction, including cores of minimum degree at least four, with no full availability conclusion.
