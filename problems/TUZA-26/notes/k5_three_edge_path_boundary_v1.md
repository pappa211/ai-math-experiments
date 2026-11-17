> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A literal K5 with complete three-edge path boundary is removable

Frozen root ordinary candidate v1. Work in the accepted minimum-Q universe. Let D be a literal K5 in Q. Suppose every actual Q triangle not wholly in D meets D only through a set F of three edges forming a path on four vertices. The actual boundary may be smaller. If at most two F edges occur in outside triangles, the already reviewed two-edge tight-boundary exclusion applies. Assume all three are actual boundary edges.

Delete only E(D)-F, retaining every vertex, all outside edges, and all F edges; call the residual K. Write t=nu(K). A K5 minus the three-edge path has two edge-disjoint triangles: for path a-b-c-d and fifth vertex z, use acz and bdz. They avoid F and every crossing triangle. Conversely any Q packing uses at most two triangles wholly in D, and all remaining triangles survive in K. Thus nu(Q)=t+2. Q's single-edge resilience then implies K's single-edge resilience by the same upper bound after deleting any K edge.

## Exact cover transfer

For a K cover C, let s=|C intersect F|. The minimum number of additional D edges required is

    4-min(s,2).

For s<=2, a minimum four-edge K5 cover can contain the selected path edges; every pair of K5 edges lies in some triangle-plus-opposite-edge minimum cover. For s=3, no four-edge K5 cover contains a P4: every four-edge cover is a triangle plus a disjoint edge. Five edges suffice, since the three path edges plus az,dz cover D. The displayed extension cost is therefore exact, including the case where further F edges are added as part of the extension.

Equivalently,

    tau(Q)=4+min_{P subset F, |P|=2} tau(K-P).

Indeed min_C (|C|-min(|C intersect F|,2)) is min_P min_C |C-P|, and the inner minimum is tau(K-P). A cover of K-P extends to K by adding P freely, and restriction proves the reverse inequality.

Since tau(Q)=2t+3, proper-subgraph CS and the simple four-edge cover extension imply

    tau(K) in {2t-1,2t},
    min_{P subset F, |P|=2} tau(K-P)=2t-1.

## Tight K is impossible

If tau(K)=2t, K satisfies B. Every actual boundary edge is supported in K, because its outside-D triangle survives there. Two different F edges cannot belong to one old literal clique: their endpoints would force a private D chord absent from K. Thus choose minimum covers of two distinct old clique components containing two specified F edges. They combine to a minimum K cover containing that pair, giving tau(K-P)=2t-2, contradiction.

## Defect-one K is impossible

If tau(K)=2t-1, the exact cover transfer makes EVERY F edge ineligible in a minimum K cover. If one were eligible, deleting a pair containing it would lower tau below 2t-1.

K is resilient and has defect one. Its unique active support C is strictly smaller than Q and therefore in frozen C12; all other triangle components are tight cliques. Every actual boundary edge is supported, and cannot lie in a tight component because every tight-clique edge is eligible. Hence all three F edges lie in C. Their four vertices induce exactly a P4 in C: every non-path edge among them was a private D edge and is absent from K.

No C12 model has an induced P4 all of whose edges are cover-ineligible. Here is an ordinary verification of precisely that named-family fact. W5, K5-e and the two-K5 shared-edge model have all edges eligible. In a central-K4 star model let 0 be the universal root. An induced P4 cannot contain 0. Every leaf attachment edge is eligible by choosing a root opposite-pair cover containing it and extending the leaf covers through their attachment edges. Every edge of a K5 leaf is then eligible, since a minimum K5 cover can contain the attachment edge and any specified second edge. A K4 leaf's possible ineligible edges, after deleting 0, form a star at its other attachment endpoint. With two or three leaves, every non-root central K4 edge is eligible (choose a suitable opposite pair or a triangle containing two attachment edges). With one leaf on 0a, the only additional possibly ineligible non-root central edges are the two edges from a to the other central vertices, joining that same star. Thus the ineligible-edge subgraph after deleting 0 is a disjoint union of stars. It contains no P4. This proves the stated induced-P4 obstruction without classifying any defect-two graph.

Therefore the supplied literal K5 boundary cannot occur in minimum Q. The operation deletes seven private edges with packing payment exactly2, derives a resilient defect-zero/one residual, and uses legitimate minimum-Q naming only in the defect-one case. Arbitrary outside triangles, shared vertices and old background are retained and accounted for by the complete edge boundary.

## Role and limit

This extends the reviewed tight-piece removal from at most two boundary edges to the three-edge path shape. It supports completion-free opposite-pair restoration when the deleted vertex has an induced-C4 link; unlike a K4 neighbor set, that interface has no internal completing pages to collapse a possible three-edge boundary automatically. Availability of such a piece and final restoration are separate obligations. No claim of a universal Tuza proof or historical originality is made.
