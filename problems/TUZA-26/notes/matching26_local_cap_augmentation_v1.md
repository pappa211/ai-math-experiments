> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A local cap gives an augmentation or a compulsory triangle

TUZA-26 ordinary operation, frozen 2026-11-16. This replaces the full-strip boundary by an explicit local triangle condition. Arbitrary middle edges, shared vertices, background and outside triangles are retained. The theorem does not assert that a cap must exist in every remaining minimum Q.

## Interface and local hypotheses

Let Q be a simple graph, e=uv an edge, K=Q-e, and x,y distinct common neighbors of u,v. Put

    P_x={ux,vx}, P_y={uy,vy}, L=K-P_x-P_y.

Assume nu(Q)=nu(K)=k and that x,y are compatible, namely nu(L)=k-1. The accepted no-blocker profile supplies a compatible partner for every common neighbor, at arbitrary codegree, as proved in matching26_marked_strip_augmentation_v2.md.

A cap is a vertex c outside {u,v,x,y}, with xc,yc in E(L), and an endpoint w in {u,v}, such that:

1. wc is an edge of L lying in NO actual triangle of L.
2. Among actual L triangles using xc but not yc and actual L triangles using yc but not xc, EVERY cross pair shares an edge.

Condition 2 is completely local. Define the non-spine apex sets

    A_c=(N_L(x) intersect N_L(c)) minus {y},
    B_c=(N_L(y) intersect N_L(c)) minus {x}.

Then condition 2 is equivalent to: A_c is empty, or B_c is empty, or A_c=B_c={r} for one vertex r. Indeed the non-spine triangles xcr and ycs share an edge if and only if r=s, in which case the common edge is cr. Degenerate apices are excluded automatically by the neighborhood definitions and the removal of the opposite hub.

No prohibition on other triangles through c is made. For example, triangles through c using neither xc nor yc may be arbitrary, and one of A_c,B_c may contain arbitrarily many vertices when the other is empty. Condition 1 concerns every actual L triangle, including those using outside or background edges.

## Packing dichotomy and actual repair

Take ANY maximum packing M of L, of size k-1. If M uses both xc and yc, condition 2 prevents them from being used in two distinct triangles. Therefore M must contain the single triangle xyc; in particular xy must be present.

Suppose instead M omits triangle xyc. At least one of xc,yc is then unused by M. Call its hub h, and call the other hub h'. Append the two actual Q triangles

    wch and uvh'.

Both triangles exist by the cap edges and the original uv-page hypotheses. They are edge-disjoint: the first uses wc,ch,wh; the second uses uv,uh',vh', and c is distinct from u,v,x,y. The edge wc is unused by M because it belongs to no L triangle. The edge ch was chosen unused. All four endpoint spokes and uv are absent from L, so every remaining appended edge is unused by M as well. Hence M plus these two triangles is a (k+1)-packing of Q, contradiction.

Consequently, under the stated packing profile, EVERY maximum L packing contains the EXACT triangle xyc. This is stronger than saying that it uses the hub edge xy.

## Consequences

* If xy is absent, a single cap is impossible: the repair always applies.
* If xy is present, every edge of triangle xyc is packing-critical in L. Deleting any one such edge lowers nu(L) from k-1 to k-2: no maximum packing survives, while deleting the single compulsory triangle from M leaves a packing of size k-2.
* Deleting all three edges of xyc likewise gives nu(L-E(xyc))=k-2, by the same lower witness and the single-edge upper bound.
* Two DISTINCT caps, attached to either or both of u,v, are impossible. Every maximum L packing would have to contain both of their spine triangles, which share edge xy. Equivalently, if xy is absent either cap already repairs the packing.

These are actual packing statements. No cover-edge matching is interpreted as a triangle packing, and no defect-two graph is named.

## Constant cap boundary as a strip corollary

Suppose K contains the earlier two-hub strip over u=v_0,...,v_l=v, l>=3, with optional xy. The first internal vertex a=v_1 is a cap if each actual K triangle using one of

    uv_1, xv_1, yv_1

is wholly contained in that literal strip. In L, uv_1 belongs to no strip triangle because its endpoint hub spokes were deleted. The only surviving non-spine strip triangles through xv_1 or yv_1 use the same internal rim edge v_1v_2; thus condition 2 holds. The analogous three-edge boundary at b=v_(l-1) makes b a second, distinct cap.

Therefore TWO clean cap boundaries exclude the marked strip while allowing EVERY crossing on EVERY middle spoke and middle rim edge. The middle path is not used in the cap theorem; it is merely one way to certify the local triangle lists. Even one clean cap suffices when xy is absent, and otherwise forces a specific critical triangle in L.

This corollary keeps arbitrary outside triangles, including those crossing the middle of the candidate strip. It only requires the three explicit cap edges to have the stated complete local triangle lists. No privacy of the cap vertex itself is required.

## Sharp control and remaining work

The compulsory-triangle outcome cannot be replaced by an unconditional contradiction. Take Q=K5 on u,v,x,y,c and e=uv. Then nu(Q)=nu(K)=2, while L consists of triangle xyc and background edges uc,vc. Thus nu(L)=1. The vertex c is a cap at either endpoint, both non-spine apex sets are empty, and every maximum L packing is exactly xyc. This is a sharp control for the local packing hypotheses; it does not satisfy the unknown core's defect-one hypothesis.

The remaining availability problem is now local: obtain a cap from the closest full-page covers or repair a concrete violation of one of its two conditions. Common cover edges may still hide a triangle through wc or allow non-spine triangles xcr,ycs with r different from s. The full disagreement implication graph alone does not exclude either pattern. Universal full-triangle cover eligibility gives a minimum Q cover containing such a crossing triangle, but need not give a minimum K cover containing it, because the Q cover need not contain e.

A specific next operation is now available for the coordinator: if the cap's compulsory spine occurs, use its three critical L edges and the exact nu(L-E(xyc))=k-2 in the global defect/cover argument. This note proves the packing premise only; no unsupported cover equality or smaller defect-two naming is asserted.

Dependency chain: accepted global no-blocker profile -> compatible page pair -> local cap repair/compulsory triangle (PROVED_ORDINARY, independent review requested) -> cap availability or payment for the compulsory-triangle residual (OPEN) -> elimination of the remaining core (OPEN) -> Tuza.

Relied source: notes/matching26_marked_strip_augmentation_v2.md for the compatible-pair interface. No numerical computation, graph census or external source was used. The single-cap simplification was suggested by the coordinator after the author's clean-cap strip repair, and independently checked informally by the apex worker.
