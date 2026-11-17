> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent one-unit cover exchange and global-gap review

Status: ACCEPTED ORDINARY for the displayed auxiliary-cover exchange family. No computation or Lean verification. Bound source: notes/matching26_one_unit_cover_exchange_v1.md, SHA-256 4864911a112eba43087d75238a668710b57eaac222972c5c7c3129ecd7635aaa.

## Exact exchange proof

F contains the full x-page pair and, since no minimum K cover covers Q, misses both y-spokes. E omits uv and is a K cover exactly one edge larger. Thus the displayed A/B cardinalities are correct. Every actual K triangle unhit by D meets both A and B. A vertex cover of the FULL bipartite cross-incidence graph hits that triangle; hence a smaller-than-|A| H cover would contradict the minimum size of F. The given elementary Hall argument therefore yields a matching saturating A and exactly one unmatched B vertex.

A minimum H cover has exactly one endpoint of each matched edge and excludes the unmatched vertex. The implication orientation is correct: edge a_i b_j yields z_j -> z_i. Every neighbor of the unmatched B vertex is forced true. Forward closure gives all implications forced by the surplus vertex, and all-true is feasible.

The page criterion is necessary and sufficient WITHIN THIS H-COVER EXCHANGE FAMILY. If D already covers the x-page, selecting a matched y-spoke is possible exactly when its variable is not forced true. Otherwise both x-spokes are A vertices, and selecting a marked a_i together with a matched y-spoke b_j is possible exactly when j is outside the forced closure and is not reachable from i, including a zero-length path. The displayed closures construct the assignments. They give actual minimum K covers hitting both pages, a literal one-edge Q saving. No minimum-cover classification beyond the constructed H family follows: a general K cover need not be a vertex cover of every A/B pair from a triangle it hits by another selected edge.

If E contains an entire actual triangle T while omitting uv, T is an old K triangle. F hits T and E contains every T edge, so D necessarily hits T. The source correctly prevents T from being inserted as an unhit H edge. This is an essential restriction on using whole-triangle Q eligibility.

## Full prescribed control

The exact unhit K triangles are 023,025,035,235,345, yielding respectively 02--03,02--25,35--03,35--25,35--45. All other actual K triangles meet D={12,24,36}. The given matching leaves 45 unmatched, forcing the 35 variable; the two off-diagonal K2,2 edges propagate both directions and force 02 as well. The unique size-two H cover is A. The only available y-spoke 03 is therefore excluded, while D edge12 already covers the x-page. T245 is hidden by D edge24. This independently reconstructs the entire obstruction without a numerical replay. The separately accepted ordinary cover and packing certificates keep this as a fragile defect-three predecessor control, not a full-profile counterexample.

## Exact remaining global gap

The accepted uniform two-hub theorem excludes a supplied neighborhood; it does not provide such a neighborhood in every minimum Q. The endpoint and outside-hub operations currently require an edge of codegree exactly two, which also has not been proved to exist in every remaining Q. Minimum degree at least five, codegree at least two, and absence of these neighborhood forms do not by themselves establish a density or availability theorem.

Even conditional on a codegree-two edge, the accepted operations need one of three actual certificates: a jointly releasing occupied triangle, an allowed cross edge in a maximum actual third-hub link matching, or an outside-packing replacement such as the four-for-two repair. The release-compression theorem rules out gaining power merely by releasing more labels while retaining the rest of a fixed outside packing. The present cover lemma gives an exact sufficient exchange and exact obstruction inside its H family, but no reason that the full Q constraints prevent that obstruction. Repeatedly recording these profiles would not constitute further payment.

## One next concrete discriminator (OPEN)

Concentrate on an actual UNPACKED cross triangle T=gab over an empty-endpoint-link maximum L packing, with a u-exclusive and b v-exclusive. If ab belongs to a maximum usable g-link matching, the accepted outside-hub operation finishes. If not, both a and b are matched in EVERY maximum of that actual link: an unmatched endpoint would allow insertion of ab by replacing at most one matched edge. Moreover deleting both a,b drops the link matching number by exactly two, since adjoining ab to a matching after that deletion cannot attain the original maximum. These are ordinary local matching facts, not global packing criticality.

The concrete next bridge is to pay this local matching obstruction using the still-unused global data: choose a minimum Q cover containing T, and a maximum K packing avoiding ga (available by K resilience). If the cover contains uv it supplies a genuine minimum K cover through T; if it omits uv, use the accepted one-unit exchange without deleting the surplus. Compare the actual K packing with the marked L packing and seek an explicit neutral OUTSIDE-packing replacement that makes a cross edge allowed, or an explicit satisfying cover exchange. A successful lemma must output the triangle replacement or the saved cover, and retain every outside triangle. Merely declaring the local spokes globally critical, treating T as an unhit H edge, or identifying the cover matching with a packing would be invalid.

This discriminator uses full K resilience and full-triangle Q covers, rather than adding another bounded neighborhood case. It remains a proposed bridge, not a claimed theorem; the current weaker controls demonstrate why the extra premises are needed but do not prove their sufficiency.
