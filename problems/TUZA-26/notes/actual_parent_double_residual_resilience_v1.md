> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent double-triangle residual resilience

Frozen ordinary composition v1, TUZA-26, 2026-11-17. This is an actual-parent theorem, not a theorem about arbitrary defect-one graphs. All graph triangles are actual; every packing is edge-disjoint. Background edges are retained at every restoration.

## Statement

Let G be the fixed minimum-edge counterexample to combined CS, using the archived extraction, actual single-triangle residual profile, simultaneous two-triangle extension, and strict C12 restoration at their stated scopes. Write nu(G)=k and tau(G)=2k. For every pair of edge-disjoint actual triangles T,U, put R=G-E(T)-E(U). Then

    nu(R)=k-2; delta(R) is either 1 or 2.

Moreover, if delta(R)=1, then R is single-edge packing-resilient:

    nu(R-e)=nu(R)=k-2 for every actual edge e of R.

There is NO assertion that the triangle support of R is connected or lies in C12. No defect-two support is classified. The statement does not force the existence of a pair with defect-one R.

## Proof and exact dependency order

Simultaneous two-triangle extension gives nu(R)=k-2. Cover extension and proper-subgraph CS bound tau(R) between 2k-6 and 2k-4, giving defects 0,1,2. If defect is zero, proper CS gives B(R). The already archived full CS theorem for B plus two edge-disjoint missing triangles, including its lower equality case and arbitrary background, then gives B(G), contradicting the parent. This exclusion is an archived dependency; it is not a new counting conclusion. See apex_actual_parent_two_triangle_decision_v1.md.

Suppose delta(R)=1 and e is critical. With m=k-3, proper CS and deleting one cover edge give

    B=R-e: (nu,tau)=(m,2m), B(B);
    R=B+e: (nu,tau)=(m+1,2m+1);
    G=B+e+E(T)+E(U): (nu,tau)=(m+3,2m+6).

The independently reviewed exact square in actual_parent_critical_square_v1.md uses resilience of the ACTUAL G-T and G-U, together with the explicit K5-e neutral-insertion lemma, to prove

    (nu,tau)(B+T)=(nu,tau)(B+U)=(m+2,2m+2).

Neither defect-two intermediate is named. If T and U are vertex-disjoint, apex_actual_parent_disjoint_restoration_v1.md rules out this square: simultaneous old-cover savings give tau(G)<=2m+5, or the only failed joint saving is an adjacent pair in one old K4, avoidable by an explicit four-page packing giving nu(G)>=m+4.

Otherwise write T=abc, U=ade. The same square note obtains a B-bare ordinary e-page E0=ijp, with e=ij and old background spokes ip,jp. Deleting these spokes from B gives B' with unchanged old triangles and optima. Consequently

    H0=G-E(E0)=B'+E(T)+E(U),
    (nu,tau)(H0)=(m+2,2m+3).

H0 is an ACTUAL single-triangle residual of G; its triangle support is connected and single-edge resilient, while arbitrary background stays present. Each separate new family over B' has packing number exactly one. Thus each is a book or K4, at the exact scope of the archived one-triangle incidence classification.

The cross graph J between {b,c} and {d,e} is an actual subgraph of K2,2. Its six isomorphism types are exhausted by the following independently reviewed proofs:

| J | Source | Conclusion on triangle support of H0 |
| --- | --- | --- |
| Empty or one edge | apex_actual_parent_low_gain_j0_j1_v1.md | C12 via literal fresh-clique geometry, or W5; inadmissible cases paid |
| Two disjoint edges | matching26_actual_parent_j2_classification_v2.md | Packing/cover contradiction |
| Two adjacent edges | matching26_actual_parent_j2_classification_v2.md | Exactly stars 4,44,45,444,445,455 |
| Three edges | actual_parent_large_cross_graph_v1.md | K5-e |
| Four edges | actual_parent_large_cross_graph_v1.md | K5 edge-glued with one old K4 or K5 |

The corrected J2 v2 explicitly permits arbitrary background. All conclusions classify triangle support only. Complete ordinary pages, old crossing triangles, repeated attachment edges and freshness are included in the cited proofs. In every surviving case H0 has C12 support. The archived strict actual-parent restoration theorem excludes this support for G-E(E0), contradiction. Hence R has no critical edge, proving the theorem.

## What changed, and what did not

The new reduction excludes the entire fragile defect-one branch of EVERY actual double-triangle residual, by rebasing at a bare critical-edge page and classifying the supplied low-gain residual. It is an availability statement conditional on an actually fragile defect-one double residual: the bare page and the paid case split are proved to exist in that branch.

This result does not select a defect-one pair, classify its potentially disconnected resilient support, settle defect-two double residuals, or prove simultaneous extension of three triangles. These are remaining actual-parent obligations. It does not import minimum-Q minimality, two-edge resilience, minimum degree, or private-boundary reductions. The alternative wider-Q route still has its own missing universal paid-operation arrow. Unrestricted Tuza, universal CS and global R remain open.

## Independent receipts and source binding

- reviews/opening_actual_parent_square_review.md
- reviews/opening_actual_parent_disjoint_review.md
- reviews/opening_actual_parent_j0_j1_review.md
- reviews/opening_actual_parent_j2_review.md (v2 only)
- reviews/opening_actual_parent_large_cross_review.md

The composition has been sent for a separate quantifier/dependency review. Ordinary proof only: no new finite census, exact-solver run or Lean claim. Exact archived source hashes are recorded in the cited notes and source ledgers.
