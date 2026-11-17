> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Canonical outside packings and exact occupied-rim constraints

Frozen ordinary supporting lemma v1, TUZA-26, 2026-11-17. Independent review required. This sharpens the actual packing interface and states its remaining obstruction; no unknown defect-two support is named.

## Canonical packing

Use the compatible-page interface

    Q has nu k; L=Q-{uv,ux,vx,uy,vy} has nu k-1.

Choose among maximum L packings M one maximizing the number of triangles containing neither u nor v. Write M=M_0 union M_u union M_v as in the accepted endpoint-link note. The usable endpoint link H_u excludes v and all physical rim edges used by M_0 or M_v; define H_v symmetrically. This first lemma does not require codegree two.

BOTH H_u and H_v are triangle-free. Suppose abc were a triangle in H_u. Its vertices avoid u,v, so abc is an actual L triangle: every deleted book edge is incident to one of those endpoints. It conflicts with no retained M_0 or M_v edge. Its only possible conflicts with M_u are rim edges, and the rim matching of M_u can use at most one edge of abc. If there is none, append abc, contradicting maximum size of M. If there is one, replace the corresponding u-triangle by abc. This preserves packing size and increases |M_0|, contradicting its canonical choice. The argument at v is identical.

This does NOT make the endpoint links bipartite; odd cycles of length at least five remain possible. No general matching/vertex-cover equality is asserted.

## Stronger outside domination at codegree two

Now assume N_Q(u) intersection N_Q(v)={x,y}. Then EVERY actual triangle T avoiding u,v meets E(M_0). Equivalently,

    Q-{u,v}-E(M_0) is triangle-free.

For if T avoided E(M_0), it could intersect at most one M_u rim and at most one M_v rim. It cannot intersect both: those two edges of the triangle would share a vertex in the common-neighbor set {x,y}, whereas all old M_u and M_v rims avoid x,y because their endpoint spokes were deleted in L. Thus T conflicts with at most one packed endpoint triangle. With no conflict it augments M; with one conflict it replaces that endpoint triangle and increases |M_0|. Both contradict canonicality.

Every unpacked outside triangle therefore uses occupied edges from at least one M_0 triangle. It can use at most one edge from each distinct M_0 triangle: sharing two edges would make it that same triangle. Thus actual outside crossings are attached to specific occupied labels; they have not been erased by an abstract exchange graph.

## Exact all-maximum obstruction when endpoint links are empty

Suppose BOTH usable endpoint links are empty. Then M_u=M_v is empty, since their rim matchings lie in the usable links. Put

    W=Q-{u,v}, m=k-1.

The displayed M is an m-packing of W, and W is a subgraph of L, so nu(W)=m. Every maximum W packing is therefore also a maximum L packing consisting entirely of outside triangles.

Let r=ab be ANY actual u-link or v-link rim other than xy. It is packing-critical in W. To see this, suppose an m-packing of W avoided r. Since r!=xy, some h in {x,y} is outside {a,b}. Append the actual endpoint triangle on r and the reserved page uvh. These are disjoint from each other and from the W packing: the old rim was avoided, all endpoint spokes are outside W, and h is outside the endpoint triangle's two rim vertices. This gives m+2=k+1 Q triangles, contradiction. Thus

    nu(W-r)=m-1 for EVERY endpoint rim r!=xy.

This concerns EVERY maximum outside packing, not just the chosen occupied labels. It explains why a neutral outside switch cannot simply free one endpoint rim. The possible shared rim xy is deliberately excepted, because its endpoint triangle leaves no marked hub available for the additional uv-page.

Under the complete minimum-Q predecessor profile, a minimum K=Q-uv cover containing P_x has size2k-2=2m and contains two endpoint edges. Restricting it to W gives a cover of size at most2m-2. Consequently

    tau(W)<=2m-2, delta(W)>=2.

There is no established lower bound on tau(W) here; W is not assumed resilient or connected, and its support is NOT eligible for minimum-Q naming. This is an exact marked critical-edge interface, not a defect-two classification.

For any outside hub g in {x,y}, a maximum usable g-link matching which contained a u-exclusive/v-exclusive rim ab would make gab a triangle of a maximum W packing. The accepted three-for-one repair would then win. Thus the previously isolated third-hub matching obstruction is now consistent with an all-maximum statement: all endpoint rims are compulsory, but mixed hub triangles cannot be used to occupy two differently marked rims together. Actual neutral switches must respect both constraints.

## Elementary endpoint-cover saving, with its exact limit

A nonempty triangle-free graph H with maximum matching size r has a vertex cover of size at most2r-1. Take the 2r matched vertices. For any matched edge ab, if both a and b have unmatched neighbors, those neighbors must be the same vertex (otherwise there is a length-three augmenting path); that shared neighbor would form a triangle with ab. Hence at least one endpoint of every matched edge has no unmatched neighbor. Delete one such endpoint from the set of matched vertices; the remaining2r-1 vertices cover every edge. Unmatched vertices are independent by maximality, so no other edge is missed.

This applies to the canonical h-deleted endpoint links, whose maximum matching sizes are m_u,m_v by the already proved one-endpoint operation. It gives a genuine one-edge saving when either matching is nonempty. However combining those covers with all THREE edges of every M_0 triangle still costs an extra edge per outside triangle. Whole-triangle eligibility does not automatically remove those edges or supply a compatible minimum K cover. No conclusion about global availability is drawn from this elementary bound alone.

## Scope and remaining operation

The canonical triangle-free-link lemma and codegree-two outside domination are ordinary consequences of an explicit maximum-packing choice. The critical-rim statement is a direct packing augmentation under the exact empty-link hypothesis. The unresolved task is to exploit complete Q profile and actual cover exchanges to force a profitable outside switch or another paid operation despite compulsory rim occupancy. Enlarging a released set without changing the outside packing adds no power, by the independently accepted release-compression lemma.

Sources: notes/matching26_endpoint_link_operations_v1.md; notes/matching26_one_outside_triangle_repair_v1.md; notes/matching26_release_set_compression_v1.md; notes/matching26_outside_hub_repair_v1.md. Root proposed canonical triangle-freeness and the elementary endpoint-cover observation; matching_geometry supplied the stronger outside domination and all-maximum critical-rim constraint. No numerical computation or graph search was used.
