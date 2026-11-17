> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three restored triangles: inequality proved, equality still open

Status: ordinary proof of the inequality and exact diagnosis of the remaining equality/extension branches. No full three-triangle CS theorem is claimed.

## One more triangle preserves the inequality after CS

Suppose K satisfies combined CS and T is a missing triangle, all three of its edges absent from K. Put G=K+E(T). Then tau(G)<=2nu(G).

If K is tight, CS gives B(K), and the accepted one-triangle restoration theorem supplies CS(G). Otherwise tau(K)<=2nu(K)-1. The restored T appends to every K packing, while its three edges extend any K cover, giving

    tau(G)<=tau(K)+3<=2nu(K)+2<=2nu(G).

Moreover, if G is tight but not B, K must be strict and all these inequalities must be equalities:

    nu(G)=nu(K)+1,    tau(K)=2nu(K)-1.

## Apply this to B plus three edge-disjoint missing triangles

Let B(H), m=nu(H), and let T1,T2,T3 be edge-disjoint missing triangles, with arbitrary permitted vertex overlap and arbitrary background attachments. Each graph H+Ti+Tj satisfies full CS by the accepted two-triangle restoration theorem. Applying the preceding lemma to the third triangle proves

    tau(H+T1+T2+T3)<=2nu(H+T1+T2+T3).

The equality classification remains open. If G is a tight non-B example in this restoration class, every two-triangle intermediate Kij must satisfy

    nu(Kij)=nu(G)-1,    tau(Kij)=2nu(Kij)-1.

The three restored triangles themselves pack with every H maximum packing, and nine cover edges suffice over H. Thus, writing k=nu(G), only k=m+3 or k=m+4 can occur under equality. In the first branch every one-triangle new-family packing number q_i equals1 (books or a single K4, by the exact one-triangle interface); in the second branch q_i<=2. These are genuine equality obligations, not solved by the inequality induction.

## Why full three-triangle restoration would not alone prove three-packing extension

Let G instead be a minimum CS failure with nu(G)=k and tau(G)=2k, and prescribe any three edge-disjoint triangles. Delete their nine edges to obtain R. Proper-subgraph CS and cover extension give

    2k-9<=tau(R)<=2nu(R),    nu(R)<=k-3.

Hence nu(R) is either k-3 or k-4. In the latter branch, tau(R) can be either

    2k-8=2nu(R),     or     2k-9=2nu(R)-1.

A hypothetical full CS theorem for B plus three triangles would exclude the first alternative, because it makes B(R). It would NOT exclude the second alternative, which leaves a defect-one residual.

The accepted two-triangle extension theorem gives nu(G-E(Ti)-E(Tj))=k-2. If the surviving three-deletion residual has nu(R)=k-4 and tau(R)=2k-9, each such pair-deletion residual has cover number exactly2k-6: the lower bound is cover extension from G, and the upper bound comes from adjoining the remaining triangle to R. Those pair residuals therefore have defect two. This is an exact narrowed branch, not a contradiction.

No broad enumeration was launched for the three-triangle equality problem. Further work must handle the actual mixed triangles and complete old-clique footprints, or find a separate structural exclusion of the remaining defect-one branch.

Dependencies: accepted one- and two-triangle CS restoration, M0, proper-subgraph CS, and accepted arbitrary two-triangle extension. No new computation or external theorem is used.
