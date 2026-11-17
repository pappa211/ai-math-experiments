> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh symbolic review: all-size four-branch CS exclusion

Verdict: ACCEPT USING THE DECLARED FINITE AND HISTORICAL INPUTS. Reviewer: challenger, 2026-11-16 UTC. Primary frozen note: notes/four_branch_cs_link_exclusion_v1.md, SHA-256 63073280de746c6925b4765d2dad2e5a52c8749827889c0831e174db59dd4d91.

This review reconstructs the unbounded-domain reduction, triangle-preserving lift, complete outside footprint, and hereditary consequence. It does not duplicate the coordinator's independent363-profile computation. I inspected its separate receipt evidence/four_branch_cs_independent_validation.json: exact domain set equality and all363 literal certificates were checked by a checker that did not import the producer;193 RIM and170 STRICT, zero UNKNOWN. The producer's matching optima remain unused.

## Domain completeness

The already reviewed ordinary exclusions remove at most three branches, the triangle-bearing subcubic case, literal K4 links, and the K4-free triangle-bearing case with at least four even nondirect paths. The triangle-free case separately uses the historical four-branch WKE finite theorem and the Kotzig-dependent strict WKE restoration; neither is being relabeled ordinary here.

For a remaining closed component, the codegree input gives minimum link degree at least two. Suppress its degree-two interiors. Returning paths are excluded. On a branch pair there is at most one nondirect path, and a direct edge can coexist with it only when its length is even. Hence the six listed states exhaust the possibilities. Four branch vertices, one degree greater than three, at most three even nondirect paths, the accepted cycle-rank inequality, K4-freeness, and the presence of an actual triangle are exactly the retained restrictions. Subdivisions do not change the degrees or p-3 cycle rank. Canonical relabeling under the24 branch permutations therefore cannot omit an actual remaining component.

The DE2/DE4 distinction is load-bearing and correct. A direct edge plus a genuinely length-two path creates an ear triangle. That path is kept fixed under reconstruction. A longer even parallel path is reduced only to length four and therefore never creates a spurious ear triangle. A singly even path has no direct closing edge; an odd path cannot coexist with one. Consequently every canonical triangle is either entirely on direct branch edges or is a fixed DE2 ear. All canonical actual triangles survive all later lifts unchanged. Conversely interiors have degree two, so there is no additional kind of triangle involving an interior vertex.

## Simultaneous lift

For uv replaced by u-x-y-v, if uv belongs to P, replacing it by ux,yv and adding x to Q increases both sizes by one; the only newly uncovered nonmatching edge xy is met by x. If uv does not belong to P, choose its endpoint u in Q, add xy to P and y to Q; ux is met by u and yv by y. Existing matching edges are unaffected, and new interior vertices were unused.

Independently, the comparison matching Z gains one by replacing a selected uv with ux,yv or otherwise adding xy. This does not require compatibility between P and Z, since they are alternative matchings. No subdivided edge lies in the fixed rim triangle T, so the property Z subset E(L) minus E(T) persists, as does the deleted P-edge of T. Thus strict slack, larger size, and the RIM size inequality all persist through arbitrary repeated two-vertex subdivisions.

## Full residual and outside-triangle audit

Delete every hub spoke to the closed link component and the matching P. All triangles lost through a rim P-edge are met directly by P, including pages with apex outside the link. Every triangle lost through a hub spoke corresponds to an edge of this closed link component and is met by P or a hub spoke to Q. Therefore the cover cost is at most2s, while s hub triangles on P append to every residual packing. Strict tuples contradict the minimum-CS accounting. Balanced tuples give literal B(K) and the exact packing residual.

Because L is K4-free, any residual clique block contains at most three vertices of L. It follows that Z has at most one surviving rim edge in each block. A RIM triangle T has at most one surviving edge in a block: if two survived, all three T vertices would be in that clique, forcing its deleted P-edge to survive as well. Thus the total footprint is at most one Z edge plus one T edge. If both existed and were disjoint, the block would contain four link vertices. Hence their union is a star of at most two edges. The accepted literal K4/K5 avoidance property supplies maximum block packings avoiding the ENTIRE union, not merely one triangle's footprint at a time.

Hub spokes create no residual footprint, since all were deleted. Z and T are mutually disjoint in graph edges by the saved RIM condition; shared vertices are allowed. This appends at least s+1 actual triangles. Arbitrary outside attachments have been included in the deletion cover and in the residual block avoidance; no number-of-apices or fixed-core bound is introduced.

## Hereditary class consequence

For H3(G), the graph of edges lying in at least three actual G triangles, arbitrary edge deletion can only remove heavy edges. Thus4-degeneracy of H3 is hereditary under the required edge-subgraph relation. In a minimum CS failure, discard isolated vertices as usual; every remaining vertex has a nonempty link. The theorem supplies at least five branch vertices in one such component, and their five hub spokes have actual codegree at least three. Therefore every remaining vertex has H3-degree at least five, contradicting4-degeneracy. This is a valid class-minimality argument and proves combined CS for the empty-heavy-five-core class under the declared inputs.

## Exact label and limitations

Accepted all-size conclusion: every nonempty closed link component of a global or hereditary-class minimum CS failure has at least five branch vertices. Accepted hereditary consequence: CS for graphs whose heavy-edge graph H3 is4-degenerate. Evidence label is PROOF_USING_DECLARED_INPUTS, including the new363-record FINITE_CERTIFICATE family and historical triangle-free WKE/Kotzig inputs. This review does not establish unrestricted availability of such a component, a new all-size Lean theorem, or unrestricted Tuza.

Additional scoped files read for this review: the frozen assembly; evidence/four_branch_cs_independent_validation.json; notes/triangle_free_wke_link_exclusion_v1.md. The ordinary four-branch precursor notes were reconstructed in my separately frozen earlier reviews, without a duplicate finite run.
