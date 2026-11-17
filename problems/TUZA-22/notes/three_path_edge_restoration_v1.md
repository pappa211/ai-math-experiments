> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three missing path edges restore equality only by creating a K4

Frozen ordinary proof candidate, 2026-11-16. Let B(H), let ab,bc,cd be missing edges on four distinct vertices, and set G=H+{ab,bc,cd}. If tau(G)=2nu(G), then B(G). With new triangles, equality forces exactly the four faces of a new K4 on {a,b,c,d}, whose old edges ac,ad,bd are all triangle-free in H.

Put m=nu(H). If new triangles exist, insertion and the three-edge cover bound give nu(G)=m+1, tau(G)=2m+2. Every new triangle is either an ordinary page on one restored base, or abc when ac is old, or bcd when bd is old. There is no triangle using all three path edges.

## 1. Two elementary compatibility facts

Ordinary pages on two adjacent missing bases are simultaneously compatible with a maximum H packing whenever they are edge-disjoint. For bases ab,bc, a block containing b sees at most two incident spokes. A block not containing b can see only the other spokes ax,cy of pages abx,bcy. If these two were disjoint, x,y would be distinct old neighbors of b inside that clique; the old triangle bxy would force b into the block, contradiction. Thus every whole block footprint is a star of size at most two. The same proof applies to bases bc,cd.

Also, if ac is old, the two-new triangle abc is simultaneously compatible with ANY ordinary cd-page cdz with z!=a. They are edge-disjoint: z cannot be b because bc was absent in H. The triangle abc has only the old edge ac. A block containing disjoint edges ac and dz would contain c,d and force the missing cd; the only other paired footprint, ac and cz, is incident. Hence all footprints are avoidable. Tightness therefore forces

    ac in H => every ordinary cd-page has apex a.        (1)

Symmetrically,

    bd in H => every ordinary ab-page has apex d.        (2)

These statements include arbitrary outside apices and use the ENTIRE selected footprints.

## 2. The middle base has no ordinary page

If neither end base had an ordinary page, all new triangles would contain bc, giving a one-edge extension cover and strictness. Thus at least one end has a page.

Suppose bc has an ordinary page bcu. Its apex lies outside {a,b,c,d}, because ab and cd are absent in H. By Section1, every page on an adjacent end base must intersect it, hence must have the same apex u. If both ends had pages, abu and cdu would be edge-disjoint; their whole old footprint in every block is a star at u of size at most two, so they append simultaneously, impossible. By reversing the path, suppose only ab has pages. The fixed ab-page also forces EVERY middle page to have apex u. Thus ordinary new pages are exactly abu and bcu.

If bd were old, Section1 applied symmetrically to bcd and abu would force u=d, impossible. So bcd is absent. If ac is absent too, the old edge bu covers all new triangles. If ac is present, the old triangle acu exists in H; choose a minimum H cover containing its supported edge ac, and add bu. The pair covers abu,bcu and abc. Both cases give a G cover of size at most2m+1, contradiction.

Therefore bc has no ordinary page.

## 3. Both end bases must have pages

Suppose only ab has ordinary pages. If bd is absent, every new triangle contains ab, giving strictness. If bd is present, (2) forces every ab-page to be abd. Then ad is old. If ac were old, acd would be an ordinary cd-page, contrary to assumption. Hence ac is absent, and the complete new family is abd,bcd, covered by their common old edge bd. Again equality fails. The symmetric case is identical.

Thus both end bases have ordinary pages.

## 4. Disjoint end pages force a strict old-cover configuration

Take ordinary end pages abx and cdz that are edge-disjoint. Each has at most one spoke in any old block. A K5 avoids any two edges, and a K4 avoids two incident edges. Therefore failure to append the pair requires an old K4 containing a pair of disjoint spokes, one from {ax,bx} and one from {cz,dz}.

The pair bx,cz cannot lie in one block, since that would force bc to be old. The pair ax,cz would force ac old, and then (1) gives z=a, making those spokes incident rather than disjoint. The pair bx,dz similarly forces bd old and x=d by(2), again making the spokes incident. The ONLY remaining possibility is an old literal K4

    B on {a,d,x,z}, containing the opposite edges ax,dz.

These four vertices are distinct. In particular x!=d and z!=a. Equations(1),(2) now force ac and bd both absent. Thus there are no two-new-edge triangles; all new triangles are ordinary end pages.

Consider any other ab-page aby. It is disjoint from the fixed cdz page: ordinary end pages can share an edge only when their apices are respectively d and a, but z!=a. The same preceding analysis shows its only possible compatibility obstruction is an old K4 on {a,d,y,z}. Since that block contains the old supported edge ad, it must be the SAME actual triangle component B. The whole one-nonedge footprint lemma for ab permits at most one page spoke in B; since ax is already that spoke, ay=ax and y=x. Hence there is only one ab-page. Symmetrically there is only one cd-page.

A minimum cover of the old K4 B can be chosen to contain its opposite pair ax,dz. Together with minimum covers of all other H blocks, it already covers BOTH new pages. This gives tau(G)<=2m, contradiction.

Consequently no end-page pair is edge-disjoint.

## 5. The only remaining family is a new K4

Ordinary pages on disjoint bases ab,cd can intersect only if the first apex lies in {c,d} and the second in {a,b}. The first apex cannot be c because bc is absent in H; the second cannot be b for the same reason. Thus any intersecting pair is exactly

    abd, cda,

sharing ad. Since both end families are nonempty and EVERY opposite pair intersects, these are their only pages. In particular ac,ad,bd all exist in H. The two-new triangles abc,bcd also exist, so the complete new family is exactly the four K4 faces on {a,b,c,d}. We have already ruled out every ordinary middle page and every outside end page.

If any of ac,ad,bd is supported in H, choose a minimum H cover through that edge and add its opposite edge in the K4. This covers every new triangle and costs at most2m+1, contradiction. Hence all three old edges are background. The new K4 support is disjoint from every old triangle component; there are no other new triangles. Therefore B(G).

## Dependencies and limits

Only elementary K4/K5 packing avoidance, minimum clique covers through prescribed edges, uniqueness of the actual triangle component containing an old supported edge, and the whole one-nonedge page-footprint lemma are used. No CS induction, finite enumeration or bounded outside-attachment hypothesis is present. This proves the P4 shape of three-edge restoration; the disconnected three-edge shapes remain separate.
