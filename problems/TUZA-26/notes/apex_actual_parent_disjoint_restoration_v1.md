> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent critical double residual: vertex-disjoint triangles are excluded

Frozen ordinary paid lemma, TUZA-26. Independent review requested. This addresses the selected actual-parent critical branch; it uses no C12 naming of an arbitrary defect-one graph and no two-edge resilience of a single-triangle residual.

## Exact supplied square

Let B satisfy the literal tight-component property, with nu(B)=m and tau(B)=2m. Let T,U be VERTEX-DISJOINT missing triangles, and let e be another missing edge outside their six edges. Put G=B+E(T)+E(U)+e. Assume

    nu(G)=m+3, tau(G)=2m+6;
    nu(B+T)=nu(B+U)=m+2;
    tau(B+T)=tau(B+U)=2m+2.

All old background, old-clique vertex sharing and ordinary crossing pages are retained. The last two lines are the exact square supplied separately from actual-parent residual resilience and the neutral-insertion argument. They are explicit premises here, not inferred merely from proper CS.

In the application, G is the literal tight non-B minimum-CS graph, R=G-T-U has defect one and critical edge e, and B=R-e. Thus m=k-3. This lemma proves that the application cannot have disjoint vertex sets T,U.

## Complete new-family alternatives and the cover payment

Let N_T and N_U be the FULL new triangle families over B for the respective single-triangle restorations. Exact one-triangle additivity gives packing number two for each. The ordinary page-incidence classification says: each family has a two-edge cover, or is precisely the seven-triangle K5-minus-edge family with two full apices and no other pages.

Each family can be covered at incremental cost two above SOME minimum B cover. If it has a two-edge cover, use any old minimum cover. If it is exceptional, it has at least one supported old spoke: otherwise its entire support is edge-disjoint from old triangles, giving cover 2m+3 rather than the assumed 2m+2. Choose an old minimum cover through that spoke and a three-edge new-family cover containing the same spoke. Only two additional edges are needed. The exceptional family has a three-edge cover containing every specified spoke, as in the archived exact interface.

If either N_T or N_U has a two-edge cover, choose the old minimum cover that realizes incremental two for the other family; add those two edges, the former family's two-edge cover, and e. This covers ALL G triangles with at most 2m+5 edges. No triangle can use one T edge and one U edge because the terminal triples are vertex-disjoint. Every triangle using e is covered by e. All remaining new triangles belong to the complete N_T or N_U family. This contradicts tau(G)=2m+6.

Hence both families are exceptional K5-minus-edge families and both have a nonempty set of old supported spokes, denoted S_T,S_U.

## The only failure of joint old-cover savings is a paid star

An old clique contains at most ONE spoke of either exceptional family. It contains at most one terminal of the restored triangle because the three bases are absent. It cannot contain both full apices x,y: the old triangles axy,bxy would merge missing terminal pair ab into one old clique, forcing ab present. Thus the two full apices are nonadjacent in B, and a clique cannot contain both. These two facts prove the one-spoke bound, including arbitrary background.

If any s in S_T and t in S_U are jointly contained in a minimum B cover, choose that cover. For each exceptional family use its three-edge cover containing the selected spoke, adding only two edges per family; then add e. Again the total is at most 2m+5, contradiction.

For literal B components, two supported edges fail joint minimum-cover eligibility ONLY when they are distinct adjacent edges of one K4. Different components can choose their covers independently; the same edge causes no difficulty; opposite K4 edges form a minimum cover; and any two K5 edges can lie in a minimum four-edge cover (put adjacent edges in the three-vertex part, or put one disjoint pair in the two-vertex part and the other in the three-vertex part).

Suppose every cross choice fails. Fix one edge t in S_U. Every edge in S_T must then belong to its same old K4 D. The one-spoke-per-clique bound forces S_T to be a singleton {s}. Reversing the argument forces S_U={t}. The two supported edges s,t are adjacent in D. ALL other spokes of BOTH exceptional families are background.

## Four pages append over that entire supported footprint

Write T's terminals as a0,a1,a2, and U's terminals as b0,b1,b2. Let x1,x2 be the full T apices and y1,y2 the full U apices. Label the T terminals so that whenever y_j is a T terminal it is a_j; label the U terminals so that whenever x_i is a U terminal it is b_i. Such labels exist because each apex pair is distinct. Use the four actual pages

    a0 a1 x1,  a0 a2 x2,  b0 b2 y1,  b0 b1 y2.

Within either family the bases and apices differ, so the pages are edge-disjoint. Across families a common edge is possible only for reciprocal terminal/apex incidence, x_i=b_i and y_j=a_j. The T page uses that cross edge only when j=i; the U page uses it only when i!=j. Therefore no shared edge occurs. Apices shared outside both terminal triples cause only vertex intersections, never an edge collision.

The entire supported old footprint of these four pages lies in {s,t}. A maximum K4 packing in D avoids that adjacent pair by taking the opposite face. Every other old clique uses an arbitrary full packing, since all its page spokes are background. Thus the four pages append simultaneously to an old maximum B packing, yielding m+4 triangles in B+T+U and hence in G. This contradicts nu(G)=m+3.

Both the joint-cover and failed-joint-cover branches are paid. The displayed exact square with vertex-disjoint T,U is impossible.

## Scope and admission controls

The proof concerns the critical-edge square above, not arbitrary restoration of two triangles. K5 with T=abc,U=ade is a SHARED-VERTEX equality control for the older two-triangle theorem and lies outside this lemma's disjoint scope. The tight-B control K4 disjoint-union K5 for the seven-edge restoration does not satisfy the displayed square: deleting the additional book spine lowers packing in one relevant intermediate, whereas the actual-parent square requires both single-triangle residuals resilient. Thus it is correctly retained as a broader admission control and not falsely excluded here.

The four-page construction is the explicit ordinary construction in TUZA22 two_triangle_restoration_v1.md Section6. The new payment here is that its old spokes need not all be bare: the only remaining supported footprint is a single adjacent K4 pair, which is avoidable. No finite computation, boundary omission, global C12 classification or unknown-core two-edge-resilience assumption is used. The shared-vertex case T intersect U={a} remains OPEN and is the next exact branch.
