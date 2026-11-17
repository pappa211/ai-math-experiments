> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: independent branch vertices in a closed link

Verdict: ACCEPT, ordinary all-size proof at the stated class-local minimum-CS scope. Reviewed2026-11-16 by source_audit. Frozen source `notes/independent_branch_link_exclusion_v1.md`, SHA256 `aa815f2bba0b2940bd1930b0717aad59c931402fbc14c3f1c1947aa019a0c285`.

I reconstructed the suppression, matching counts, and residual footprints separately. The theorem depends on the previously accepted link-deletion and parallel-thread exclusions, plus class-local M0 and literal K4/K5 avoidance; no additional finite or external input is required.

## Suppressed shape and incidence assignment

Minimum link degree two and no returning threads reduce every noncycle component to paths between branch vertices. Independent branch vertices eliminate direct paths; the accepted parallel-thread result eliminates multiple remaining paths. Hence the suppressed core is genuinely simple, with minimum degree at least three and all thread lengths at least two. Triangles in the link would be a closed cycle, a returning thread, or would contain a direct edge between branches, so the remaining link is triangle-free.

For a branch subset S, every even core edge incident to S contributes at most two to its degree sum, while all odd edges contribute at most2o. Thus 3s<=2N+2o and s-N<=o-ceil(s/2), including odd s with the required rounding. For o>0 the Hall deficiency is at most o-1; adding that many universal dummy vertices proves the asserted maximum incidence matching bound. For o=0, N>=3s/2 directly gives saturation of every branch. This is a genuine bipartite matching argument.

## Arbitrary thread lengths

On an odd path with2r interior vertices, selecting consecutive interior pairs gives r matching edges and leaves exactly r-1 pairwise disjoint interior gaps. On an unassigned even path with2r-1 interior vertices, r-1 matching pairs leave either end interior vertex exposed and again r-1 disjoint gaps. On an assigned even path, adding the branch-to-first-interior edge and matching all remaining interior pairs gives r matching edges and the same number r-1 of gaps. One vertex per gap plus all branches covers every nonmatching link edge. Interior vertex sets and assigned branches are disjoint across threads, so the counts |P|=o+a+B0 and |Q|=b+B0 are literal. The strict branch is valid even when the numerical incidence lower bound is negative.

## Balanced all-even augmentation

There are m>=3b/2>b core edges, so at least one even thread is unassigned. Its exposed vertex may be placed next to endpoint u. Since every branch is assigned somewhere, u is matched to x on another thread. Replacing ux with the unassigned-thread boundary edge preserves matching cardinality and avoids ux. This is an explicit matching swap, not an assumption about maximum matchings.

The second triangle on ux has apex z outside the entire neighborhood of the hub: an apex inside its closed link component would make a link triangle, and an apex in another component would connect the components. Thus it cannot collide through hub spokes with the alternate matching's hub triangles. All triangles appended to the balanced residual are literally edge-disjoint.

A residual clique block has at most two link vertices. It therefore contains at most one surviving alternate-matching edge. The extra page has at most one surviving spoke in any block because its base ux was deleted. If those two surviving edges were disjoint, the block would contain three link vertices, contradicting triangle-freeness. Hence the entire appended family's footprint is at most two adjacent edges per old block. This is exactly the accepted avoidance scope, so all old blocks can be packed simultaneously and the augmentation succeeds.

The class consequence is hereditary because actual edge codegrees cannot increase under edge deletion. A triangle with at most one high edge prevents a link edge between two branch vertices, contradicting the theorem in a smallest failure. K5 is excluded by the hypothesis, so equality there is K4-only. The statement makes no claim that the third edge joining two high-edge endpoints is itself high.
