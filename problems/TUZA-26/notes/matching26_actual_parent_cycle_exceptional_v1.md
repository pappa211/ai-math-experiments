> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Distinct-intersection tight triple cube: one exceptional family is paid, v1

Frozen ordinary proof candidate, TUZA-26, 2026-11-17. Independent review requested before promotion. This completes the one-exceptional branch of the exact cube; it does not address another triple-residual profile. No computation.

## Scope and basic exact interfaces

Use the same literal cube as matching26_actual_parent_cycle_core_v1.md:

    T=abx, U=bcy, V=caz,
    single gains (2,2), pair gains (3,5), total gains (4,8)

over B with literal K4/K5 triangle components and arbitrary retained background/shared vertices. All six core vertices are distinct. Suppose exactly one individual family is exceptional, relabeled as T. Its two full apices are p,q, outside the entire six-vertex core. U,V are type A or B in the terminology of matching26_actual_parent_cycle_nonexceptional_v1.md.

At least one old T-spoke is supported in B: otherwise the complete new K5-e family would be an edge-disjoint triangle component from old B, giving single cover gain three rather than two. For any supported spoke at terminal t, a minimum B-cover through it plus the other t-to-apex spoke and the T-base opposite t covers the entire T-family with increment two.

The edge pq is absent. If present, the old triangles apq and bpq would put a,b in the same old clique, contrary to absent ab. Every old clique contains at most one old T-spoke: two terminal endpoints would force an absent T-base, and two apex endpoints would force absent pq. Thus all supported T-spokes lie in distinct old triangle components.

For any type B family, its old full-apex spoke opposite the extra-book base is background, or its canonical cover would give single gain at most one. The whole-one-base footprint fact applies to all actual ordinary pages and will be used explicitly below.

## 1. Type A restrictions remain valid with the exceptional partner

A type A family cannot omit a base opposite the common vertex with either partner. Its two other bases would hit every mixed pair triangle; combine them with the partner's increment-two cover above a suitable minimum B-cover. This gives pair gain at most four. The increment-two cover exists also for the exceptional partner by the preceding paragraph.

Therefore a type A U omits exactly bc, with cover {by,cy}, and a type A V omits exactly ca, with cover {cz,az}. They cannot both be type A: those four outer bases hit every mixed U/V triangle, because the only closure of both omitted central bases would require ab, absent from B. Hence at most one of U,V is type A.

## 2. The exceptional T cannot meet a type B U whose extra base is by

Suppose U has unique full apex r and nonempty extra by-pages bys. Its canonical cover is {by,cr}, and cr is background.

The complete mixed T/U family is aby,bcx,bxy when the corresponding old edges are present; the fourth potential cross edge ac is absent from B. The U-cover hits aby and bxy. If any T-spoke at a were supported, the exceptional increment-two cover could use the opposite base bx, hitting bcx as well. The pair would have cover gain at most four. Consequently ap and aq are background.

The edge cx must be present. Otherwise any increment-two cover of T, together with the canonical U-cover, covers every pair triangle in four additional edges. Since cx is present and cr is background, xr is absent: otherwise cxr would be an old triangle containing cr. It follows also that r differs from p and q, whose old x-spokes are present.

Choose any extra by-page bys and label p,q so q!=s. The four actual triangles

    axp, abq, cyr, bys                              (1)

are edge-disjoint. The full apices lie outside the six-vertex core. The extra apex s differs from r; it may be the core vertex z and this causes no edge collision. The only possible common b-spoke of the exceptional page and extra page would require q=s, which was excluded.

The known background spokes ap,aq,cr leave supported old footprint contained in

    xp,bq,yr,bs,ys.

An old clique sees at most one of xp,bq by the exceptional-family footprint fact. It also sees at most one of yr,bs,ys: yr is a spoke of the actual ordinary by-page byr from the full apex, so all three belong to the whole by-family footprint.

Any two remaining footprint edges in one old clique must be adjacent:

- xp with yr would force the absent edge xr;
- xp with bs would force absent bx;
- xp with ys, when s!=p, would put p,s in the clique. The old edges bp,bs then create old triangle bps, putting b in that clique and forcing absent bx. If s=p, the two edges xp,yp are adjacent and allowed;
- bq with yr or ys would force absent by;
- bq with bs are adjacent at b.

Thus every old clique can pack at full size avoiding the complete footprint, using K4 adjacent-pair avoidance and K5 two-edge avoidance. Appending (1) gives pair packing gain at least four, contradicting the exact gain three.

This excludes U extra base by. By swapping a,b and U,V, it also excludes a type B V whose extra base is az. All old crossing triangles used in the exclusions above are actual, including the possible s=z case.

## 3. Two type B partners are impossible

If both U,V are type B, the accepted shared-pair type-B lemma in matching26_actual_parent_cycle_core_v1.md says their extra-book bases cannot both be incident with their common vertex c. Hence at least one is opposite c: by for U or az for V. Both alternatives were just excluded. This pays the C+B+B configuration.

## 4. One type A and one type B partner are also impossible

Relabel U as type A and V as type B. Then U has the two-base cover {by,cy}.

The extra-book base of V cannot be cz. That choice would hit the only mixed U/V triangle not already hit by {by,cy}, namely bcz. Its canonical cover together with the two U bases would give pair cover gain at most four. Section 2 excludes V extra base az. Therefore the V extra-book base is exactly ca.

Write r for V's full apex. Its canonical cover is {ca,zr}, where zr is background. In the U/V pair, the four cover edges {by,cy,ca,zr} hit every individual triangle and all mixed triangles except possibly bcz. Thus bz is present and background: absence, or a minimum B-cover through supported bz, would give pair cover gain at most four.

The T/U pair again forces ap,aq background. Indeed {by,cy} hits all mixed T/U triangles except bcx, and a supported T-spoke at a would give an exceptional incremental cover using bx.

The old edges zp,zq are absent, since each would form an old triangle through background bz using bp or bq. Since zr is a full-apex edge of V, r therefore differs from p,q.

Choose an extra ca-page cas and label p,q so q!=s. Its apex lies outside the six-vertex core: every other core vertex misses a or c in B. The four actual triangles

    bxp, abq, czr, cas                              (2)

are edge-disjoint. The only potential shared a-spoke would require q=s; all full apices are external, r differs from p,q, and s differs from the unique full apex r.

After removing the known background edges aq,zr, the supported old footprint is contained in

    bp,xp,bq,cr,cs,as.

An old clique contains at most one among bp,xp,bq. It contains at most one among cr,cs,as by the whole ca-family footprint fact, using the full-apex page car and the extra page cas.

A disjoint cross pair of footprint edges is impossible:

- bp or bq with cr or cs would force absent bc;
- bp or bq with as would force absent ab;
- xp with as would force absent ax;
- xp with cr would put p,r in the old clique, and the old edges ap,ar would create old triangle apr through the background edge ap;
- xp with cs gives the same contradiction from old triangle aps when s!=p. If s=p, xp and cp are adjacent and allowed.

Hence every old clique footprint is at most an adjacent pair, avoidable by a maximum old packing. Appending the four triangles (2) gives pair packing gain four, the final contradiction.

## Conclusion and remaining global boundary

The exact distinct-intersection tight triple cube has no configuration with exactly one exceptional individual family. Combined with the independently accepted nonexceptional closure and the separately accepted shared-exceptional-family lemma excluding two exceptional families, this excludes the entire core pattern T=abx,U=bcy,V=caz.

This is an actual cover/packing operation on the selected low-packing tight triple-residual row. It does not select a defect-one double residual, classify defect-two supports, or exclude the other four triple profiles. The common-center triple pattern is a separate worker's obligation. No minimum-Q degree, boundary or minimality condition is imported.

Dependencies: the exact one-triangle page classification and old clique footprint facts pinned in the accepted matching26_actual_parent_cycle_core_v1.md; its shared-pair type-B payment (source SHA f04765cce7ded9dd664cf770878d9347b1e618288f8585c27e91dacfdaf65741; review SHA b0437500ec69da969dacbf3d4599e66effa30b5f07720df54d8999507eb6578e); nonexceptional source matching26_actual_parent_cycle_nonexceptional_v1.md SHA 7e3de72f084d8a69543951041dee8565e73fcb417acb1b4953549de33b1cde9c, review SHA 8d5c9d7a0cdda2a587e619b3b18303c99f40659c271e794c90db30b4427afb76. The composition's at-most-one-exceptional input is apex_actual_parent_shared_exceptional_families_v1.md SHA 5af1464ce882c63ab7a4b8e1824e82d95f2164fc6e2036bf0b109c4e2e93d8d5; the proofs in this file assume exactly one and do not depend on that lemma internally. No numerical job.
