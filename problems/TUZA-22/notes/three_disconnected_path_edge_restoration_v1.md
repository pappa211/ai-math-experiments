> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A missing two-edge path and a disjoint edge reduce to R2

Frozen ordinary proof candidate, 2026-11-16. Let B(H), let ab,ac,de be missing edges on five distinct vertices, and G=H+{ab,ac,de}. If tau(G)=2nu(G), then B(G). With any new triangle, equality leaves at least one restored edge in no actual triangle, so the accepted two-edge theorem applies.

Put m=nu(H). As usual, a new triangle and tightness imply nu(G)=m+1, tau(G)=2m+2. The new triangles are ordinary pages on the three bases and possibly the sole two-new-edge triangle T=abc, present exactly when bc is old. No triangle uses de together with another restored edge.

If de has no ordinary page, it lies in no triangle, and R2 finishes immediately. Thus suppose that de has a page.

## 1. Compatibility rules

Two edge-disjoint ordinary pages can fail to append simultaneously to a maximum H packing only when an old K4 contains disjoint spokes from them, an opposite pair. This follows from the whole one-base footprint lemma, K4 star avoidance and K5 two-edge avoidance.

Ordinary pages on the adjacent bases ab,ac are ALWAYS compatible when edge-disjoint. In a block containing a their footprint is a two-edge star. In a block not containing a, disjoint spokes bx,cy would put two distinct old neighbors x,y of a inside it; the old triangle axy would force a into the block, contradiction. Hence, if both adjacent bases have pages, every such page has one common apex u and each family is a singleton abu or acu.

Also, two edge-disjoint ordinary pages are compatible whenever the apex of one is a vertex of the other. A common apex gives star footprints. If the apex is the other's base endpoint, disjoint spokes inside one old block would force both endpoints of that missing base into the clique. This is the same ordinary rule proved in the three-matching case.

## 2. The two-new-edge triangle cannot occur

Suppose T=abc exists, so bc is old. Every de-page is edge-disjoint from T: its base vertices lie outside {a,b,c}, and its apex supplies at most one common vertex. The only possible obstruction to appending it with T is an old K4 containing bc opposite one of its old spokes. Therefore bc lies in a literal old K4 B, and its opposite edge in that block must occur in EVERY de-page. Since the missing de cannot have both endpoints in B, all de-pages have the same apex. Relabel d,e so that they consist exactly of

    dez, with V(B)={b,c,d,z}, opposite pair bc,dz.

Here z is outside {a,b,c,d,e}: it differs from b,c,d by the opposite-pair requirement, from e as a page apex, and from a because B cannot contain the missing ab or ac.

Consider an ordinary ab-page abx, if one exists. It is edge-disjoint from dez, because z is neither a nor b. An obstruction using dz would have to be B and would require the ab-page spoke to equal the opposite edge bc. This is impossible: ax cannot be bc, and bx=bc would require x=c, whereas ac is absent in H.

The remaining possibility uses ez in another old K4 B'. If its other spoke is bx, B' contains b,z and therefore the old edge bz already in B; then B'=B, impossible since e is outside B. If its other spoke is ax, B' contains x,z. The old edges bx from the page, bz in B, and xz in B' form an actual old triangle joining B to B'; this forces a and b into the same clique, contradicting the missing ab. The vertices in this triangle are distinct whenever the proposed spokes are disjoint, as required for an obstruction.

Thus every hypothetical ab-page is compatible with dez, giving m+2 triangles. No ab-page exists. By symmetry no ac-page exists either.

The complete new family is consequently just T and dez. A minimum cover of the old K4 B can be its opposite pair bc,dz, so a minimum H cover already meets all new triangles, contradicting tau(G)=2m+2. Hence T is absent, and bc is not an old edge.

## 3. Both adjacent bases cannot have ordinary pages

Suppose both do. By Section1 they are exactly abu,acu, with u outside {a,b,c}.

First let u lie outside {d,e}. Any de-page dez is then edge-disjoint from BOTH fixed pages. If z were in the vertex set of either, the final compatibility rule of Section1 would already give an augmentation; thus z is outside {a,b,c,u}. Its two K4 obstruction blocks both contain u and z, since every fixed-page spoke contains u and every de-page spoke contains z. They therefore share the old edge uz and are the same block B.

The de-page has only one spoke in B, and its opposite edge there is unique. The selected spoke of abu and of acu must consequently be the SAME edge, namely au. Thus B contains au and an opposite de-page spoke. Since au belongs to only one old triangle component, repeating the argument for every de-page forces that same block and that same opposite edge; as only one of d,e can lie in B, the de-page family is a singleton. A minimum H cover using that opposite pair in B covers abu,acu and the complete de-family. Since T is absent, it covers every new triangle, contradiction.

Now let u be d or e; interchange the endpoints to take u=d. The two adjacent pages are abd,acd. Every de-page must intersect BOTH: if it were disjoint from either, the apex d of that fixed page belongs to the de-page, so Section1 would give compatibility. To intersect abd its apex must be a or b, and to intersect acd it must be a or c. Hence its apex is a and the de-family consists exactly of dea. All three new pages share ad, so one edge added to a minimum H cover gives tau(G)<=2m+1, contradiction.

Therefore at least one adjacent base has no ordinary page.

## 4. Finish by R2

The absent two-new-edge triangle was the only other possible triangle using that inactive adjacent base. Thus it belongs to no actual triangle in G. Removing it changes neither nu, tau nor the actual triangle family. The resulting tight graph is H plus two nonedges, so R2 gives B; the same conclusion holds in G.

The argument uses only ordinary clique avoidance, actual old-triangle component closure, and the whole one-nonedge page-footprint lemma. No finite census, graph-order bound, CS induction or outside-attachment restriction is used. Every cover contradiction above actually applies whenever nu(G)=m+1 and tau(G)>=2m+2, a useful stronger scope for the full restoration assembly.
