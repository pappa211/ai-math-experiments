> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: minimum covers made of triangle and matching components

Decision: ACCEPT, ordinary all-size inequality theorem. The exact conclusion is tau<=2nu for graphs admitting a MINIMUM ordinary triangle cover of the stated shape. No equality classification or universal availability follows.

Frozen source: notes/matching_and_triangle_cover_tuza_v1.md
SHA256: edaee8f2824300400202a61da373b06207426abb6fe2f1e3854fa4e468d6ac2d

## Local families and choices

A triangle's selected edges necessarily lie in one selected-edge component. Hence each isolated selected matching edge has a private page, and the family belonging to a literal triangle component has ordinary cover number3 by global minimum-cover replacement. The source's elementary pairwise-intersecting actual-triangle argument is valid and yields a private two-packing.

The exact private-two classification was also checked separately in review/triangle_component_normalization_independent_review.md. Here the source states it self-containedly: the three apex lists are nonempty, an apex on two bases is on all three, and failure of an SDR leaves either a singleton union for two lists or a total union of size2. The first gives a two-cover and the latter forces exactly two full apices. This uses actual graph closure. Three private pages have distinct bases and apices, so their local edge-disjointness is justified. No assumption about an absent apex edge is made.

## Potential target graph and actual packing

The potential graph J correctly records mutual apex ownership, regardless of the present base exclusions. Each incident J neighbor requires one of the core's chosen apex slots; therefore its degree is at most1,2,3 for the respective local packing sizes. Across vertex-disjoint cores, no base can coincide with another base or spoke. A shared spoke necessarily joins reciprocal apices. Thus the graph records every possible cross-page conflict, and an independent set of cores supports all chosen pages at those cores.

An internal core triangle has no edge in common with a page based at a different core. Consequently adding one internal triangle at each unselected triangle core is valid even when that core contains another selected page's apex. This proves the exact objective t+sum_I w_i with weight1 on matching cores and private-two triangle cores and weight2 on private-three triangle cores.

## Weighted lemma

The induction is sound. A degree3 vertex has weight2, and selecting it removes exactly4 vertices, paying the required half per removed vertex. A newly isolated all-weight1 odd cycle cannot appear after deletion: each of its vertices already had its two cycle neighbors and had original degree at most2, so the cycle was already an isolated component before any deletion. This statement uses the original weight/degree condition and remains valid through all recursive stages.

When the remaining maximum degree is2, paths and even cycles pay at least half by cardinality. On an odd cycle containing a weight2 vertex, a maximum cardinality independent set can be chosen to contain that vertex; its weight is at least floor(n/2)+1. Thus every nonexceptional component meets the claimed half bound.

## Exceptional components and scope

Every all-weight1 odd-cycle component consists exclusively of private-two triangle cores: matching cores have degree at most1. The accepted two-full-apex compatibility theorem supplies two pages per core while retaining the same two apices. Because J was defined by potential reciprocal targets, these replacements cannot introduce an interaction with any other component. This is the load-bearing distinction from an actual-conflict graph, and the frozen proof gets it right.

If s exceptional triangle cores are removed, they contribute2s pages. The other cores contribute t' +(t'+r)/2, where t'=t-s. Total at least(3t+r)/2 follows, with surplus s/2 from the exceptional portion. Ordinary minimum-cover optimality gives tau=3t+r, completing the inequality.

All selected objects are literal actual triangles. Additional triangles elsewhere in G do not harm the exhibited packing; the cover assumption accounts for them in the local-family partition. No finite computation, matroid-union assertion or external asymptotic result is used. Equality can still occur in the inequalities of this argument, so the separate equality/CS limitation in the source is correct.
