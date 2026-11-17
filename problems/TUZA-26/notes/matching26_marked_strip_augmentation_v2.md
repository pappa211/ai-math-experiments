> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Compatible-page strip augmentation, with optional hub edge

TUZA-26 ordinary packing operation, version 2. Version 1 is preserved unchanged. This version removes the codegree-two restriction, allows the hub edge to be absent, and uses the sufficient complete boundary in K rather than the unnecessarily stronger boundary in Q. Availability of the region remains OPEN.

## The marked interface

Let Q be a simple graph, let e=uv be an edge, and put K=Q-e. Suppose nu(Q)=nu(K)=k. Let x,y be DISTINCT common neighbors of u,v, and define

    P_x={ux,vx}, P_y={uy,vy}, L=K-P_x-P_y.

Assume x,y are a COMPATIBLE pair, meaning nu(L)=k-1. No cover, defect, minimum-Q naming, connectivity or degree hypothesis is used in the augmentation below.

In the main application compatible pairs are supplied by two-edge resilience of Q. Indeed fix any common neighbor x. A k-packing of Q-P_x cannot be entirely in K-P_x, since appending uvx to any k-packing of K-P_x would contradict nu(Q)=k. Thus it uses an e-page uvy for some y different from x. Removing that page leaves k-1 triangles in K-P_x-P_y. The opposite inequality follows from nu(K-P_x)<=k-1 by the same appending argument. Consequently the compatibility graph on the common neighbors has no isolated vertex, at every codegree.

## Complete-boundary region

Suppose K contains a path v_0=u,v_1,...,v_l=v with distinct vertices, all different from x,y, and all spokes xv_i,yv_i. Let D contain precisely those path edges and spokes, together with xy IF that edge is present in K. Put

    B={xu,yu,xv,yv} union ({xy} if xy is present).

The complete boundary condition concerns ALL actual K triangles T not wholly contained in D:

    E(T) intersect E(D) is contained in B.

This is an edge-boundary condition, not a vertex-privacy or induced-subgraph assumption. Arbitrary shared vertices, retained background edges and external triangles are allowed, provided every actual crossing triangle satisfies the displayed condition.

The augmentation applies if either

    (i) l>=3, with xy present or absent; or
    (ii) l=2 and xy is absent.

## Local calculation and actual augmentation

If xy is absent, every D triangle is a rim triangle consisting of one hub and one path edge. A packing uses at most one triangle per path edge, and alternating the hubs along the path attains l. After removing the four endpoint spokes, the remaining D triangles use only the internal path, which has l-2 edges; hence at most l-2 of them can be packed. This also covers l=2: the remaining D graph has no triangle.

If xy is present and l>=3, write m=l-2>=1. After removing the four endpoint spokes, the D triangle family is exactly the join of xy with the internal path of length m. Its packing number is m: alternating rim triangles attain m; a packing has at most one spine triangle through xy, and such a triangle prevents using every path edge incident with its apex, leaving at most 1+(m-1)=m triangles. The case m=1 is K4 and is included. The two endpoint rim edges survive only as background relative to D.

Now take a (k-1)-packing M of L and remove every triangle whose edge set lies in D. At most l-2 triangles are removed, by the local calculation. Every retained triangle is outside D, so the complete K-boundary condition permits it to use only edges of B from D. It uses none of the four endpoint spokes, since M lies in L. Therefore its only possible D edge is xy, when that edge exists.

Append the l alternating-hub rim triangles on the full path of D. They are pairwise edge-disjoint and avoid xy. They avoid every retained outside triangle, including every allowed crossing triangle. The resulting actual packing in K has size at least

    (k-1)-(l-2)+l=k+1,

contradicting nu(K)=k. This is a concrete augmentation; it discards no outside graph edges or vertices and makes no inference from an abstract matching to a triangle packing.

## Why the boundary is in K, and the sharp short exception

The proof uses only packings and triangles of K. Requiring the boundary condition in Q is sufficient but stronger than necessary. At l=2, the restored triangle uvv_1 necessarily crosses the two private rim edges, so a complete Q-boundary would make that case empty. The K-boundary correctly permits this restored triangle, which is irrelevant to the constructed K packing.

When l=2 and xy is present, the local residual has a spine triangle rather than zero triangles, so the two-triangle gain fails. This exception is sharp for the stated packing hypotheses: take Q=K5 on u,v,x,y,z, e=uv, and the path u-z-v. Then D=K is K5-uv, the outside-K boundary condition is vacuous, nu(Q)=nu(K)=2, and deleting the four marked spokes leaves only triangle xyz and background uz,vz, so nu(L)=1=k-1. The four-spoke residual loses only one local packing triangle. No exclusion of this case is claimed.

## Exact remaining availability problem

For the conditional minimum Q, every page has a compatible partner. The operation therefore applies at arbitrary codegree whenever one such pair has a literal marked strip with the complete K-boundary above. It is not enough to find an alternating path or a factor component in the bipartite minimum-cover disagreement graph: the actual graph edges must form D, and every K triangle crossing a private D edge must be excluded or repaired.

A minimum Q cover containing all edges of a crossing triangle need not contain e. Without e, it has tau(K)+1 old edges and cannot simply be treated as a minimum K cover. Thus universal triangle eligibility alone has not yet supplied the needed boundary cleanup.

Dependency chain: accepted no-blocker/single-deletion packing profile -> compatible page pairs at all codegrees -> this strip augmentation (PROVED_ORDINARY, independent review requested) -> availability of a complete-boundary strip or another paid operation (OPEN) -> elimination of the remaining core (OPEN) -> Tuza.

Relied sources: notes/matching26_book_exchange_v2.md for the compatibility argument; notes/matching26_marked_strip_augmentation_v1.md for the earlier marked codegree-two operation. No numerical computation, census, or external source was used.
