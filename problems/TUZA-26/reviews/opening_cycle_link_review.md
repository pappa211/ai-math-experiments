> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: induced-C4 degree-four link reduction

Verdict: PASS, PROVED_ORDINARY for notes/degree_four_cycle_link_v1.md, SHA-256 ea0c9644a97ee4d5778574d0d3b060a3f8580064eb210b1dec86b56b9c7a0876. Positive gain is excluded; neutral opposite-pair residuals are resilient and satisfy the stated simultaneous footprint. Final restoration remains OPEN. No new finite replay or Lean verification was needed.

## Positive gain

For the degree-four vertex c with induced rim cycle ab,bd,de,ea, a J=Q-c cover extends by two opposite c-spokes, so tau(J)>=2k-3. Proper CS excludes packing loss two, leaving nu(J)=k-1 or k.

In the gain-one case, delete ca from Q. The already proved universal single-edge predecessor is resilient and has packing k. Its remaining c-link is a three-vertex path, so any packing uses at most one c-triangle. A critical J edge would leave at most k-2 old triangles plus one c-triangle, contradicting that predecessor's resilience. Thus J is resilient, with defect zero or one.

If J is B, each old clique contains at most one rim edge: two adjacent edges force an absent diagonal and two opposite edges force both. Full old packings can avoid every supported rim edge, while background rim edges are already unused. Appending two opposite c-pages gives gain two, contradiction. Therefore J has a smaller resilient defect-one active support C, legitimately named C12, plus possible tight pieces. Each tight piece has complete Q boundary at most one rim edge, so the paid boundary theorem removes it.

Any support vertex outside C other than c can only lie on old background edges that become triangular through c. These are rim edges, so it has at most two cycle neighbors and c, giving degree at most three. Minimum degree forces all four rim vertices into C. To make the last step explicit, the already accepted universal vertex of C makes C induced in J: any additional internal J edge forms an old triangle through that universal vertex and joins C. Thus all four rim edges belong to C and the absent diagonals remain absent. This is an induced C4 in a frozen C12 member, contradicting the independently checked C4-free property. No extra C12 eligibility fact is used.

## Neutral opposite-pair accounting and resilience

With nu(J)=k, every rim edge is critical and each opposite rim matching reduces packing by exactly two, by appending one or two c-pages and the ordinary deletion lower bounds. A minimum Q cover containing cab cannot include a third c-spoke, because its old part would violate tau(J)>=2k-3. With exactly ca,cb, it must select the opposite edge de. This proves tau(J)=2k-3 and joint minimum-cover inclusion of each opposite matching. Thus R=J-M has nu=k-2,tau=2k-5,defect one.

No minimum J cover can contain adjacent rim edges: the two remaining rim edges share a vertex, whose single c-spoke would complete a Q cover at cost2k-2. If R were fragile at f, S=J-(M union{f}) would be B with nu=m=k-3,tau=2m. Every minimum S cover plus M and f is a minimum J cover. Therefore f cannot be either remaining rim edge, and neither of those edges can be supported in S, since it could then be selected in a minimum old-clique cover and create an adjacent selected rim pair.

A maximum J packing has m old triangles and exactly three ordinary pages, one on each restored base. An M-page cannot have an apex in A, because a necessary diagonal is absent. It therefore uses neither remaining old rim edge. The f-page uses at most one such edge. At least one of the two background remaining rim edges is unused by the maximum packing, contradicting its criticality (equivalently permitting another c-page). Hence every opposite residual is resilient, without a predecessor completion assumption.

## Exact simultaneous interface

Let N be the other opposite rim matching. Two-edge resilience gives a k-packing of Q-M. Its only c-triangles are the two pages on N, while its old residual R has packing k-2. Both c-pages must occur, leaving a maximum R packing avoiding BOTH N edges.

An ordinary M-page has apex outside A. If a maximum R packing avoided N and both of that page's old spokes, the page plus both N c-pages would append as three edge-disjoint triangles, producing k+1. Their mutual disjointness is literal: M and N are different rim edges, the ordinary apex is outside A and c, and the c-pages use opposite rim bases. Therefore the combined footprint obstructs all maximum R packings.

Each tight R clique can nevertheless avoid its portion at full packing size. It contains at most one N edge. If it also contains a page spoke, that spoke is incident to its N edge: the endpoint opposite that edge on the restored base cannot lie in the clique, since the base is absent. Other cliques see at most one page spoke. K4/K5 maxima avoid these one-edge or adjacent-two-edge sets. Any remaining obstruction therefore lies in the named active C12 component.

The proof does NOT infer that both page spokes lie in C. Appending only one page to a packing of R produces k-1, not the k needed to contradict criticality in J. The source correctly rejects that insufficient-gain shortcut and instead retains the simultaneous N-plus-page condition. Complete boundary removal and final named matching restoration are still separate obligations.

Frozen UTC: 2026-11-17T00:13:29.606519+00:00
