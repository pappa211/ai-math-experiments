> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Releasing one outside triangle pays two endpoint augmentations

TUZA-26 ordinary operation, frozen 2026-11-16. This changes the previously fixed outside packing and is a concrete repair, not a distance or implication-graph exclusion. All link edges are physical graph edges and all retained packing triangles are included in the usable-link definition.

## Setup

Use the compatible-page interface and actual maximum L packing M from matching26_endpoint_link_operations_v1.md:

    e=uv, K=Q-e, L=K-{ux,vx,uy,vy};
    nu(Q)=nu(K)=k, nu(L)=k-1;
    M=M_0 union M_u union M_v.

For the automatic compatibility statement assume CODEGREE TWO, so N_Q(u) intersect N_Q(v)={x,y}. Let m_u=|M_u| and m_v=|M_v|. In the earlier note, H_u and H_v are the actual usable endpoint links with M_0 and the opposite endpoint packing retained. At codegree two, retaining the opposite endpoint packing removes no additional link edge: a common rim would have to lie on {x,y}, whereas M_u,M_v use neither x nor y.

The proved one-endpoint operation gives

    nu_matching(H_u-h)=m_u,
    nu_matching(H_v-h)=m_v

for either h=x or h=y. Otherwise one endpoint augmentation followed by page uvh already gives k+1 triangles.

## Release one actual outside triangle

Fix T in M_0. Remove T from the packing to be retained. Define H_u^T and H_v^T by allowing exactly the rim edges released by T, while continuing to exclude every rim edge used by every other retained triangle. Equivalently, in the codegree-two setting retain M_0 minus {T} and construct both endpoint links; the opposite old endpoint family still causes no additional obstruction.

For either h in {x,y}, freeing T raises each matching number by at most ONE. Indeed all newly usable rim edges are contained in the three-edge triangle E(T), and a matching can use at most one such edge. Deleting that new edge from any improved matching leaves a matching in the old usable link.

Suppose for the SAME h both increases occur:

    nu_matching(H_u^T-h)=m_u+1,
    nu_matching(H_v^T-h)=m_v+1.

Choose the two augmenting matchings. Their physical rim-edge sets are automatically disjoint. Any common rim edge would have both endpoints in the common-neighbor set {x,y}, but both links avoid h, leaving only one common vertex and hence no common edge.

Replace M_u and M_v by these matchings' actual triangles, remove T, retain every other triangle of M_0, and append the actual page uvh. The link construction excludes every retained rim edge. The opposite endpoint is excluded from each link, so cross-family overlaps could only have been common rim edges, already ruled out. Both matchings avoid h, so the uvh spokes are free; uv was absent from M. The final size is

    (k-1)-m_u-m_v-1+(m_u+1)+(m_v+1)+1=k+1,

contradicting nu(Q)=k.

This is a genuine OUTSIDE-TRIANGLE repair. The removed triangle pays for simultaneous endpoint augmentations, and the unused uv-page supplies the second net packing gain.

## Literal three-for-one special case

Suppose T={x,a,b} lies in M_0, with a,b distinct and outside {u,v,x,y}, ua and vb are actual Q edges unused by M, and the other indicated edges form actual triangles uxa and vxb. All vertices of T differ from u,v, and T avoids the reserved hub y; the assumed usable spokes and the packing hypotheses account for every old edge. Then replace T by

    uxa, vxb, uvy.

The first two triangles use different freed rim edges xa and xb, and their u/v spokes were unused. The third uses the absent edge uv and the other two deleted book spokes. These three actual triangles are pairwise edge-disjoint and avoid M minus {T}. This is the direct geometric instance of the matching repair.

## General-codegree variant

At arbitrary codegree the same proof works if the two chosen improved matchings avoid a common hub h and have disjoint physical rim edges. Automatic disjointness is specific to codegree two: in general their common rim graph is Q[X minus {h}] with occupied outside edges removed, where X is the full common-neighbor set. It is not legitimate to ignore a shared physical rim edge.

The preserved star555 control exhibits exactly this warning. For e=45, hubs0,1, the compulsory outside triangle016 can be released. Deleting hub1 from both endpoint links leaves both augmentations using the SAME freed rim edge06. The two proposed endpoint triangles046 and056 would share06. Thus the three-for-one repair is unavailable; codegree is three, not two. This is an actual edge collision, not an artifact of an auxiliary matching representation.

A smaller codegree-two control shows why joint release itself needs proof. For Q=K5-pq, e=up, hubs a,b, the common residual has only maximum packing triangleqab. Releasing that triangle augments the u-link after deleting either hub, but the p-link after deleting that hub has only the other hub as a neighbor and cannot augment. This control has a fragile predecessor and fails the full-page cover conditions, as recorded in the preceding note. No counterexample to the complete minimum-Q profile is claimed.

## Exact remaining bridge

A surviving codegree-two interface now forces, for every actual T in M_0 and every h in {x,y}, that at least one of the two endpoint matching numbers does NOT rise when T is released. The operation therefore isolates a concrete next target: force one outside triangle to release augmentations on both sides, or find a paid simultaneous release of several outside triangles. The full minimum-cover disagreement graph may help identify such a triangle, but its abstract reachability alone does not prove the needed actual link augmentations.

Dependencies: accepted compatible-page packing interface -> exact endpoint links -> single outside-triangle repair above (PROVED_ORDINARY, independent review requested) -> existence of a jointly releasing triangle or another paid repair (OPEN) -> elimination of the remaining core (OPEN) -> Tuza.

Relied source: notes/matching26_endpoint_link_operations_v1.md for the actual link definitions, codegree-two decoupling, and named controls. No numerical computation or graph search was used.
