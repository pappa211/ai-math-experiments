> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exact triangle-deletion frontier in the no-blocker core

Frozen ordinary accounting note for review. This is a map of remaining obligations, not an availability theorem. The fixed-G/minimum-Q universe is unchanged; proper-subgraph CS supplies nonnegative defects and classifies zero only. Current composed core theorem gives two-edge resilience and every-triangle extension.

Write nu(Q)=k and tau(Q)=2k-1. For every actual triangle T, J=Q-E(T) has nu(J)=k-1 and defect one or two; B(J) is impossible. Every deleted edge and every background edge remains literal in restoration.

## A finite critical-deletion frontier

An actual packing-critical edge lowers nu by exactly one. Its deletion lowers tau by zero or one. Therefore it lowers defect by two or one. Proper-subgraph CS prevents negative defect.

If delta(J)=1, either J is resilient or ANY critical edge e gives B(J-e): nu=k-2 and tau=2k-4. Such e creates a triangle in J because reinsertion raises packing. Thus excluding the minimum-Q triangle-plus-edge B restoration would prove resilience of EVERY defect-one triangle residual, not only a selected one. Its connected active support would then be C12 by explicit Q minimality, with possible tight pieces and retained background requiring reconstruction.

If delta(J)=2, the exhaustive alternatives are:

1. J is resilient, with defect two. Its components are either one defect-two component plus tight components, or two defect-one components plus tight components. In the latter case resilience names both active components by minimum-Q reasoning. In the former case the defect-two component is NOT named by that reasoning.
2. Some critical e gives defect zero, hence B. This is the same triangle-plus-edge B profile just described: nu(Q)=nu(J-e)+2, tau(Q)=2nu(J-e)+3.
3. Some critical e gives defect one and is resilient. Its active support is named, but restoration now consists of T plus e and has cover increase FOUR over that residual.
4. Some critical e gives defect one and remains fragile at f. Then J-{e,f} is B, with nu(Q)=nu(J-{e,f})+3 and tau(Q)=2nu(J-{e,f})+5. This is a triangle-plus-two-edge restoration, not the reviewed three-edge restoration theorem.

The list is complete for following critical edges from this one triangle residual. It does not prove that case1 or any other case occurs. In particular a hypothetical exclusion of case2 does NOT establish resilience of a defect-two J; cases3 and4 remain.

## What exclusion of all defect-one residuals would imply

If (a) the triangle-plus-edge B exclusion passes review and (b) complete named triangle restoration with packing increase one and cover increase two is excluded for minimum Q, then EVERY actual triangle residual has defect two. Equivalently EVERY actual triangle T is contained in SOME minimum Q cover. The cover may depend on T; no single minimum cover is asserted to contain all triangles.

For such a T, cover extension and the full-triangle minimum cover give, for every D subset E(T),

    tau(Q-D)=tau(Q)-|D|.

Together with two-edge resilience, this supplies the exact chain, with p=k-1:

    J:                  nu=p,   tau=2p-2, defect2;
    J+one T edge:       nu=p+1, tau=2p-1, defect3;
    J+two T edges:      nu=p+1, tau=2p,   defect2;
    J+all three edges:  nu=p+1, tau=2p+1, defect1.

These are exact accounting identities, not a contradiction or a paid descent. Resilient defect-two residuals remain outside the minimum-Q naming rule. No arbitrary replacement graph is compared to Q.

## Controls and relevance

Two K5s sharing one edge is a named two-edge-resilient defect-one graph. It has both defect-one and defect-two triangle residuals. For literal cliques01234 and01567, deleting023 gives a fragile defect-one residual whose critical edge14 leaves B; deleting234 gives a defect-two residual, and deleting its critical spine01 leaves a resilient K5-e support. Thus broad claims that two-edge resilience forbids these frontier branches are false. The proposed exclusions concern minimum unknown Q and use its paid boundary constraints and three-connectivity. These controls must not be removed from C12 or described as Tuza counterexamples.

Conditional implication chain: archived minimum-CS framework -> minimum Q (CONDITIONAL); composed core constraints (PROVED_ORDINARY plus independently checked finite interfaces); triangle residual frontier (ordinary accounting, review pending); useful residual availability and complete payment -> contradiction (OPEN); universal CS -> Tuza (PROVED logically). This route does not require global R.
