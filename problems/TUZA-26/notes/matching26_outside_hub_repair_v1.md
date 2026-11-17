> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Changing the outside packing at a book hub

Frozen ordinary supporting note v1, TUZA-26, 2026-11-17. Independent review required. This supplies an actual outside-packing operation and a precise one-unit obstruction to the proposed closest-cover bridge. Neither availability nor a global classification is asserted.

## Empty endpoint links and an actual third link

Use the accepted codegree-two interface: uv has exactly the common neighbors x,y; L=Q-{uv,ux,vx,uy,vy}; nu(Q)=k and nu(L)=k-1; M is a maximum L packing. Suppose both actual usable endpoint links are empty. Then M contains no u- or v-triangle, so M=M_0. Define

    A=N_Q(u)-{v,x,y}, B=N_Q(v)-{u,x,y}.

These sets are disjoint. Fix a reserved book hub h and write g for the other hub.

Partition M into triangles containing g and triangles not containing g. Retain the latter. Form the ACTUAL usable g-link on N_L(g), deleting every rim edge occupied by the retained triangles. The old g-triangles form a maximum matching in this link: a larger matching would augment M in L.

If this link has a maximum matching containing an edge ab with a in A and b in B, replace the old g-triangles by that matching's actual triangles. This gives a maximum L packing M' containing gab and still containing no u/v-triangle. All u/v-spokes are therefore unused. Replace

    gab by uga, vgb, uvh.

These three actual Q triangles are edge-disjoint: their old rims ga,gb differ, and the last triangle uses the other hub. Every other M' triangle is disjoint from their rims because it was disjoint from gab; all endpoint spokes and uv are new. The final packing has k+1 triangles, contradiction.

Thus, in any surviving interface, EVERY usable A-B edge in this third link is excluded from EVERY maximum matching of that link. This is an exact ordinary matching obstruction tied to a real outside-packing exchange, not a matching of cover edges. The smallest matching-level barrier is a P4 p-a-b-q: its unique size-two matching is {pa,bq}, while its cross edge ab belongs to no maximum matching. This illustrates the barrier only; it is not a graph satisfying the complete minimum-Q profile.

## An explicit four-for-two repair

There is an even more direct repair. Suppose M contains distinct triangles

    T_1=gap, T_2=gbq,

where a in A and b in B. The five vertices g,a,p,b,q are distinct by edge-disjointness of the two triangles; p,q are not u,v. Suppose pq is an actual edge not occupied by M-{T_1,T_2}. Then remove these two triangles and append

    uga, vgb, gpq, uvh.

The first two use the freed rims ga,gb and previously unused endpoint spokes; gpq uses the other freed g-spokes gp,gq and the supplied unoccupied edge pq; the last triangle uses uv and the two h-spokes. These four triangles are pairwise edge-disjoint and avoid the retained packing. Their net gain is two, again producing k+1 triangles. This proof allows p or q to equal h and retains every outside triangle and background edge.

No edge ab is needed for this direct repair. If ab is also actual and unoccupied by the retained packing, the same operation factors into the neutral outside switch

    gap,gbq -> gab,gpq

followed by the three-for-one book repair. If ab is occupied elsewhere, the direct four-for-two operation remains valid and avoids it entirely.

This genuinely changes the outside packing by using gpq. It is not obtained by merely releasing two labels and replacing only endpoint fans; the separate release-compression theorem correctly rules out any added power from that latter maneuver in the absence of a jointly releasing singleton.

## Why closest full-page covers do not yet supply this repair

Let K=Q-uv with tau(Q)=tau(K)+1. Minimum full-page K covers F_x,F_y containing P_x and P_y can be chosen closest outside their four marked spokes. Their full disagreement graph supports only exchanges among ACTUAL minimum K covers. The global property that every Q triangle T is contained in a minimum Q cover does not, by itself, put such a third cover in that same minimum-K family:

* If the supplied minimum Q cover also contains uv, removing uv gives a minimum K cover containing T, provided T avoids uv.
* If it omits uv, it is a K cover with tau(K)+1 edges. Its one extra edge must be paid before a minimum-cover exchange argument can use it.

The second alternative is real even in the retained seven-vertex all-triangle-cover control. No generic closeness argument may discard this unit.

## Exact prescribed control for the lost unit

Use the already preserved double-cone graph Q: hub edge 23 joined to rim cycle 0-1-6-4-5-0. Let e=01, K=Q-e and T=245. Then

    tau(Q)=6, tau(K)=5,
    min{|F|: F covers K and E(T) subset F}=6.

All three values have short ordinary certificates; no optimization is needed here.

For tau(Q)>=6, first suppose a cover omits23. Each of the five spine triangles 23i requires a spoke; with at most five edges there must be exactly one selected spoke at each rim vertex and no rim edge. The selected 2-spokes must form a vertex cover of the odd rim cycle, requiring at least three, and likewise the selected 3-spokes require at least three. This exceeds five. If a cover contains23, its remaining edges must cover the ten rim triangles. Every other edge lies in at most two of these rim triangles, so at least five more edges are needed. The following six-edge cover proves equality and contains ALL of T:

    F_T={24,25,45,03,12,36}.

It omits01 and covers all fifteen actual Q triangles. For K, the five-edge cover

    {02,12,24,35,36}

and tau(K)>=tau(Q)-1 give tau(K)=5.

Finally suppose a size-five K cover contains24,25,45. The three old triangles023,123,236 are not hit by those edges. Their pairwise intersections show that covering all three with the remaining two slots requires23: without23, distinct choices are needed from {02,03}, {12,13}, and {26,36}. After choosing23, the last slot would have to cover both035 and346, whose edge sets are disjoint. This is impossible. The displayed F_T is already a size-six K cover containing T, proving the constrained value exactly.

This retained control has nu(Q)=nu(K)=4, hence Q has defect two and K defect three; K is fragile at24,34,45,46, as proved in matching26_doublecone_exchange_diagnosis_v1.md. It also fails the required global two-edge resilience. It therefore does NOT refute the proposed full-profile discriminator. It proves the narrower logical point: full-triangle eligibility in Q need not supply a minimum K cover containing that triangle, even though tau rises by exactly one on inserting uv. The complete-profile argument still needs to use its packing resilience/defect assumptions to recover or pay this unit.

## Remaining concrete obligation

The global closest-cover route must force either a jointly releasing occupied triangle, an allowed cross edge in the actual third-hub matching, or a real outside switch such as the four-for-two repair above. An unpacked triangle can connect two occupied labels in the disagreement graph, while common-cover edges can hide other actual crossings; neither phenomenon by itself produces the needed outside packing. No new graph census, solver run, defect-two naming or claim of universal Tuza is made.

Sources: notes/matching26_endpoint_link_operations_v1.md; notes/matching26_one_outside_triangle_repair_v1.md; notes/matching26_release_set_compression_v1.md; notes/apex_full_disagreement_cover_operation_v1.md; evidence/codegree_two_cover_falsifier_n7.json; notes/matching26_doublecone_exchange_diagnosis_v1.md. Root independently identified the actual third-hub matching obstruction. This note supplies the complete physical replacement and the explicit constrained-cover control.
