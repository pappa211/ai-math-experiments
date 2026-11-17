> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Distinct-intersection tight triple cube: all nonexceptional families are paid, v1

Frozen ordinary proof candidate, TUZA-26, 2026-11-17. Fresh independent review requested. This supplements matching26_actual_parent_cycle_core_v1.md without modifying that accepted partial source. It closes all cases in its exact cube where none of the three individual families is exceptional K5-e. The exceptional-family branch remains OPEN.

## Scope and terminology

Use the exact B-restoration cube of the preceding source:

    T=abx, U=bcy, V=caz;
    single gains (nu,tau)=(2,2), pair gains (3,5), total gains (4,8).

All six core vertices are distinct; B retains all old background and shared vertices. Every individual family has q=2. A nonexceptional family has one of two forms:

- Type A: a two-own-base cover, equivalently no full apex and ordinary pages on exactly two bases.
- Type B: exactly one full apex, with a nonempty set of additional ordinary pages on exactly one base; the canonical two-edge cover is that extra-book base and its opposite old full-apex spoke.

The exact ordinary-page closure gives these forms: an apex on two bases is full; two different extra-book bases together with the full apex give a three-matching. Two full apices give the separately excluded-from-this-note exceptional family. The full-apex p for any of T,U,V is outside the entire six-vertex core: every other core vertex misses at least one endpoint of the relevant triangle in B.

## 1. If a type A family occurs, the cube is impossible

For a shared pair of triangles, a type A family cannot omit the base opposite their common vertex. Otherwise its two selected bases are both incident with that common vertex and hit every mixed triangle between the pair. Combining its two-edge cover with the other nonexceptional family's two-edge cover and a minimum B-cover would give pair cover gain at most four.

Apply this to both partners of T=abx. A type A T must omit a base incident with a and with b; therefore it omits exactly ab and is covered by {ax,bx}. Similarly a type A U omits bc and a type A V omits ca.

Two type A families are impossible. For T and U, their four outer bases {ax,bx,by,cy} cover every individual new triangle and every mixed pair triangle: the only possible mixed triangle using both omitted bases ab,bc would require ac in B, but ac is absent. A minimum B-cover plus these four edges contradicts the pair cover gain five. Relabel for any other pair.

Thus if a type A family exists it is unique. Relabel it as T; U,V are type B. The complete mixed list for the T/U pair is aby,bcx,bxy, as their old closing edges permit. The T-cover {ax,bx} already hits the latter two. If U's extra-book base were by, its canonical cover would also hit aby, giving pair gain at most four. Hence U's extra-book base is not by. Likewise the T/V pair shows V's extra-book base is not az.

But the accepted shared-pair type-B payment in matching26_actual_parent_cycle_core_v1.md Section 2 says the U/V extra-book bases cannot both be incident with their common vertex c. At least one must therefore be the opposite base: by for U or az for V. Both were just excluded. This contradiction pays every configuration containing a type A family.

The initial type A shared-pair rule was independently observed by apex_challenger; the proof above includes the full cover operation at the current nonexceptional scope.

## 2. Three type B families have only two cyclic base assignments

The shared-pair type-B payment leaves exactly the two assignments established in the preceding source:

    extra-book bases (ax,by,cz), or (bx,cy,az).

They are interchanged by swapping a,b and swapping y,z, which permutes the three triangles. It is enough to handle the first.

Let p,q,r be the respective unique full apices of T,U,V. The canonical covers are

    {ax,bp}, {by,cq}, {cz,ar}.

The opposite old spokes bp,cq,ar are background in B. If one were supported, a minimum B-cover through it plus the corresponding extra-book base would give single cover gain at most one, contrary to the exact gain two.

## 3. Pair cover gain forces three background diagonals

For T/U, the four canonical cover edges {ax,bp,by,cq} hit every individual new triangle. Among mixed triangles they hit aby and bxy; the only possible unhit one is bcx. Consequently cx must be present and background in B. If absent, the four edges cover the pair; if supported, choose a minimum B-cover through cx and get the same forbidden pair cover gain at most four.

Rotating the labels proves that ay and bz also are present and background. No extra old triangle has been dropped in this argument; the individual families and the three possible mixed pair triangles are the complete pair family.

## 4. These background edges forbid every off-diagonal full-apex incidence

The old edges

    xq, xr, yp, yr, zp, zq

are all absent from B. For example xq or xr would form the old triangle cxq or cxr through the background edge cx, since cq and cr are old full-apex spokes. Likewise yp or yr would form an old triangle through background ay, and zp or zq one through background bz.

It follows that p,q,r are pairwise distinct: xp,yq,zr are present old full-apex spokes, so any identification would contradict the corresponding absent off-diagonal incidence. Any extra ax-page axs has s different from p by the unique-full-apex description, and different from q,r because xq,xr are absent. Its apex may be the core vertex y or a vertex outside the core; the argument does not assume all extra apices fresh.

## 5. An explicit five-packing, with complete old footprints

Choose any extra ax-page axs, which exists by the type B definition. Take the five actual triangles

    abc, bxp, cyq, azr, axs.                       (P)

They are edge-disjoint. The first uses the three central restored edges. The next three use the distinct outer bases bx,cy,az and their full-apex spokes. The last uses the remaining outer base ax and two old spokes. The only potential old-spoke collision with azr would require s=r, which was excluded; its collision with bxp would require s=p. Other full apices lie outside the six-vertex core. In the permitted equality s=y, the last triangle is axy and still shares no edge with any other member of (P).

The known background edges bp,cq,ar cannot meet an old triangle packing. Thus the supported old footprint of (P) is contained in

    {xp,yq,zr,as,xs}.

Every old clique contains at most ONE distinct edge from this set:

- two edges among xp,yq,zr would force an absent off-diagonal incidence between an outer vertex and the other full apex;
- as cannot coexist with xp or zr, since ax or az is absent from B; it cannot coexist with yq, since that would make the background edge ay an edge of the old clique;
- xs cannot coexist with yq or zr, since xq or xr is absent; it cannot coexist with xp by the whole-family footprint fact for the missing base ax, whose actual pages axp and axs supply the two old x-spokes;
- as and xs cannot coexist because ax is absent.

These statements remain valid when s=y; any background edge in the displayed upper envelope simply contributes no supported footprint. Choose in every old K4/K5 a maximum packing avoiding its possible single footprint edge. Their union is a maximum B-packing and is edge-disjoint from all five triangles in (P). Therefore

    nu(G)>=m+5,

contradicting the cube's exact value m+4.

This pays both cyclic assignments and completes the nonexceptional theorem.

## Exact remaining boundary

PROVED CANDIDATE: the distinct-intersection tight triple cube cannot have three nonexceptional individual q=2 families. The proof gives concrete cover savings or an actual five-packing over B, with arbitrary old components, shared vertices, all mixed triangles and all background retained.

OPEN: configurations with an exceptional two-full-apex K5-e family. A separately frozen shared-exceptional-family theorem limits their number, but this note neither imports an unreviewed version nor completes the remaining one-exceptional combinations. No broader triple profile, degree catalogue, graph census, or defect-two naming is started.

Dependencies: matching26_actual_parent_cycle_core_v1.md SHA f04765cce7ded9dd664cf770878d9347b1e618288f8585c27e91dacfdaf65741, independently accepted in reviews/opening_actual_parent_cycle_core_review.md SHA b0437500ec69da969dacbf3d4599e66effa30b5f07720df54d8999507eb6578e; archived exact one-triangle family classification and whole-family footprint facts already pinned there; elementary K4/K5 one-edge packing avoidance. No numerical work.
