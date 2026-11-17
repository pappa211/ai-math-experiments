> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A degree-four vertex with an induced four-cycle link

Frozen root candidate v1. This is an actual supplied-vertex reduction in minimum Q, not a claim that a degree-four vertex exists. Every-edge codegree at least two makes the link of any degree-four vertex C4, K4-e, or K4. This note treats the C4 case and leaves its final named restoration OPEN.

Let c have four neighbors A={a,b,d,e}, inducing cycle ab,bd,de,ea and no diagonals ad,be. Put J=Q-c and nu(Q)=k. A J-cover extends by the two c-spokes at opposite cycle vertices, so tau(J)>=2k-3. A packing uses at most two c-triangles, with an opposite pair of rim edges if two. Proper CS thus leaves nu(J)=k-1 or k; gain two is impossible.

## Positive gain is excluded

Assume nu(J)=k-1. Choose any c-spoke, say ca. The universally proved predecessor K=Q-ca is single-edge resilient with nu=k. In K, c has a three-vertex path link, so at most ONE c-triangle can be packed. If an actual J edge were critical, K minus that edge would have packing at most k-1, contradiction. Thus J is resilient. Proper CS and the cover transfer give delta(J)=0 or1.

If J is tight B, a literal old clique contains at most one A rim edge: two adjacent rim edges force an absent diagonal, and two opposite rim edges force both absent diagonals. Choose maximum old clique packings avoiding all rim edges, then append two opposite c-triangles. This gains two over J, contradicting the assumed gain one.

Thus J has one resilient defect-one active component C, named C12 by minimum-Q, and possibly tight pieces. Every tight piece has complete Q boundary at most one old rim edge, since the only new triangles use c and a rim edge. The reviewed tight-boundary reduction excludes every such piece. Any remaining vertex outside C other than c can have supported Q edges only among its at most two cycle neighbors and c: old background becomes triangular only through c. Its degree is at most three, forbidden. Therefore all four A vertices lie in C. Their old cycle is an induced C4 in C, contrary to the reviewed induced-C4-free property of all twelve models. Positive gain is impossible.

## Neutral exact payment and resilience of opposite residuals

Now nu(J)=k. Every rim edge is critical in J, or its c-triangle could append to a k-packing. Each opposite matching M loses two packing units, since two c-triangles could otherwise append. The reverse bound is ordinary two-edge deletion.

Choose a minimum Q cover containing cab. It contains ca,cb,ab. It cannot contain a third c-spoke because deleting three spokes from the cover would contradict tau(J)>=2k-3. Hence it contains exactly ca,cb among c-spokes; the opposite page cde forces de into its old part. Thus tau(J)=2k-3, and every opposite rim matching M belongs to a minimum J cover. Consequently R=J-M has nu=k-2,tau=2k-5,defect1.

No minimum J cover contains two ADJACENT rim edges: one c-spoke at the common vertex of the two remaining rim edges would extend that cover to Q with tau(J)+1=2k-2 edges.

Suppose R has a critical edge f. Then S=J-(M union{f}) is tight B with nu=m=k-3,tau=2m. For every minimum S cover D, the set D union M union{f} is a minimum J cover. Thus f cannot be one of the two remaining rim edges, as it would be adjacent to M. Neither remaining rim edge can be supported in S: if one were, choose a minimum old-clique cover containing it, again obtaining adjacent rim edges in a minimum J cover. BOTH remaining rim edges are therefore background in S.

Every maximum J packing has exactly m old triangles and THREE ordinary pages, one on each restored edge. This follows from gain3 over S and the fact that at most three new triangles can be edge-disjoint; using two restored edges in one triangle would preclude the required count. A page on either M base cannot have apex in A, since a diagonal is absent. Hence neither such page uses an old remaining rim edge. Since f is outside the cycle, its ordinary page uses at most one old rim edge. At least one of the TWO remaining background rim edges is consequently unused by this maximum J packing, contradicting its criticality in J.

Therefore EVERY opposite-pair residual R is resilient, without predecessor K4 completion. Its active defect-one support can legitimately be named, but full restoration is still an obligation.

## Strong actual interface for that restoration

Let N be the other opposite rim matching, retained in R. Two-edge resilience of Q gives nu(Q-M)=k. Its only c-triangles are the two disjoint pages on N, while R has packing k-2. Hence R has a maximum packing avoiding BOTH edges of N.

For any ordinary page on M, its apex lies outside A. If a maximum R packing could avoid N and its two old page spokes, appending that page and BOTH c-pages on N would create k+1 triangles. Thus that combined footprint blocks maximum R packings.

Every tight R component can avoid this footprint at full size: it contains at most one N edge, and if a page spoke also lies there it is incident with that N edge. Other pieces receive at most one page spoke. Any obstruction therefore lies in the named active C12 support. This is a concrete simultaneous footprint constraint; it does NOT by itself confine both page spokes to C. Appending only one ordinary page to R gives k-1, which would be insufficient to contradict criticality in J. That tempting confinement shortcut is explicitly rejected.

Next operation: remove the tight pieces under their complete boundaries and solve the resulting named matching restoration with the two N edges jointly avoidable. No arbitrary defect-two graph is named, and no unrestricted conclusion is claimed.
