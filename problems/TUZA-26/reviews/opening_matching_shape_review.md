> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: three-matching-edge B restoration

Frozen 2026-11-16T21:20:38.739078+00:00. **PASS for the all-size conditional exclusion, using independently reconstructed ordinary lemmas and a separately authored complete finite interface check.** Reviewed notes/matching26_three_connected_exclusion_v1.md, SHA-256 `a592cd8fdfcc534e2292f14b0b10c24527403597ad18d5375c73ff6d24407f52`, and notes/matching26_terminal_confinement_v1.md, SHA-256 `3abdfc2def6e00dbfe361de5dc64b31bf8826a1024158d575197869832392836`. The exact scope is triangle-supported, shared-edge-triangle-connected, single-edge-resilient, three-vertex-connected Q, with B(Q-S) for a three-edge matching S, and packing gain two / cover gain three. Three-connectivity excludes isolated-vertex ambiguity. No global C12 classification, Q-order bound, finite census of Q, or Lean verification is a premise.

## Ordinary terminal confinement

Single-edge resilience gives a maximum packing of Q-si of size m+2. It contains at most m old triangles and at most two new triangles, since each uses one of the two remaining matching bases. Therefore it contains exactly m old triangles and one page on each remaining base. Any B-bare si-page is disjoint from all old triangles; if it missed both new pages it would append and give m+3. Pages on distinct matching bases share an edge only when their apices are reciprocal endpoints of the other base. Thus every bare page has a terminal apex. Moreover, if its apex lies in base sj, the sj-page of every such maximum packing must meet it. The pair of new pages must simultaneously meet every bare si-page. These assertions hold for every maximum packing, not merely for some conveniently chosen one.

Cover gain three supplies a bare page on each base by the whole one-base footprint lemma. A triple of disjoint ordinary pages with at least two bare pages appends to old maximum packings, since the third page has at most one supported spoke per old component. These are exact all-size premises for the finite reduction.

## Complete finite domain, independently regenerated

Let E0 be the union of spokes of all bare pages. All these edges lie among the twelve terminal crossedges, are old background, are used by a page, and contain no old triangle. All three base families are nonempty, and no triple of their pages is edge-disjoint. Conversely a page with both spokes in E0 is actually bare, so the complete bare-page families are reconstructed from E0; the table does not omit hidden bare pages.

The fresh checker scripts/opening_matching_domain.py imports no author module. It constructs all4096 crossedge sets by subset size, with set-based triangle and page geometry. It independently finds the 48 S-preserving permutations by testing all720 permutations of six vertices. The eight supplied representatives are accepted only after their complete orbits are proved pairwise disjoint and to cover exactly the independently retained147 labelled skeletons. Thus no orbit count or completeness claim is taken on trust.

For every representative, the checker considers every supergraph of E0 inside the twelve crossedges. It rejects any terminal old triangle containing an E0 edge. It constructs every terminal page plus a symbolic outside apex6, removes a page only when it forms three disjoint pages with bare pages on the other two bases, and checks the necessary disjoint-pair condition supplied by every single-base deletion. It independently reproduces all29 retained extension states across seven feasible types, including every allowed-apex list. Type7 has no such state. The additional-edge unions, type4's conditional edge35 restriction, triangle-freeness of all retained terminal graphs in types2–6, and all listed possible attachment-edge sets agree exactly with the frozen proof.

The outside symbol is valid: a page on a matching base with a nonterminal apex is edge-disjoint from every page on any other base, whether that other apex is terminal, the same outside vertex, or a different outside vertex. Replacing outside apices by6 therefore preserves every edge-intersection predicate used by these necessary tests. It does not assume that at most one real outside vertex exists. The extension tests intentionally ignore some old-packing constraints; that makes an overapproximation and cannot exclude an actual Q improperly.

Evidence: evidence/opening_matching_domain.json records all147 labelled orbit members, all48 permutations, every retained extension, deletion-pair witnesses, exact source/checker hashes, and host/Python metadata. The serial standard-library run took0.0303 seconds; no process remains. This is VERIFIED_FINITE for the exact domain, distinct from the ordinary reduction to that domain.

## Types0/1: simultaneous old-cover choices are justified

Type0's two new cover edges are02 and45. Every uncovered A/B page contains a present edge among13,14,15. Each such edge must be supported: otherwise its page's other spoke, already bare, would make it a bare page and enlarge E0. Two required edges cannot lie in one old component:14 and15 force missing45;13 with14 forces old34 and then old triangle034 through bare03/04;13 with15 similarly forces035. Thus the required supported edges belong to distinct old components, whose minimum covers can be chosen independently through those edges. Adding02,45 gives cost2m+2.

Type1 uses12,45 and required supported edges03,14,15. An old clique containing03 with either14 or15 would contain missing01; one containing14 and15 would contain missing45. Again the local cover choices combine. Extra34/35 edges add no uncovered page beyond the independently checked table. Both types contradict cover gain three without assuming simultaneous eligibility within one old component.

## Type2: the one-bare augmentation

After deleting45, resilience supplies disjoint pages on A=01 and B=23. Their core apices in the other base always make them intersect, so the A page must be01x with x=4 or5; B apices remain0 or1. If an outside C page45y existed, it would be edge-disjoint from that A page and either B-bare page230/231. The A/C pair is compatible with old maximum packings because x is a C endpoint: a K4 containing opposite spokes from the two pages would contain both endpoints of missing45. K5 avoids any two spokes; incident footprints are avoidable in K4. The B-bare page has no old supported footprint. All three append, contradiction. Thus every page is terminal in types2–6.

## Exact old-component boundaries and three-connectivity

Each old component must share an edge with a new page: a shared-edge triangle path from it to the nonempty new family first leaves through such a page. Since all new pages are terminal, that component contains a supported terminal edge. The independently checked induced terminal L graphs are triangle-free, so an old literal clique contains at most two terminals. It has exactly the two endpoints of one permissible attachment edge. The only possible edges are14/15,13/15,03/15,15,or none in types2–6 respectively. Type4's extra35 cannot attach a component because it occurs in no new page.

At most one old component uses an attachment edge. Components on adjacent attachment edges already share their common terminal, so another shared vertex would create a shared edge and merge them. For type4's disjoint03 and15 attachments, a shared outside vertex x creates old triangle13x through bare13, contradiction. Consequently private vertices are distinct across all old pieces, and every old clique is a literal fresh attachment at its two terminal endpoints.

A private vertex has no edge to a different region: every Q edge is triangular; any triangle using that private vertex is old because all new triangles are terminal; it therefore lies in its unique old component. Thus removing the attachment endpoints genuinely separates the nonempty private part of a K4/K5 from the other four terminals, contradicting three-connectivity. This is a graph separator, not merely a one-edge triangle boundary.

If there is no old component, every Q triangle is a terminal page, so all its old spokes are bare and Q has exactly S+E0 as its edge support. In each type2–6, removing0,1 separates nonempty sets2,3 and4,5, directly checked for every representative. Three-connectivity again fails. This exhausts the finite cases and completes the all-size exclusion.

## Strategic relevance and limits

The proof excludes the three-edge-matching shape for fragile blocker residuals in the three-connected conditional minimum Q. It handles arbitrary old clique pieces and background at their complete boundary, rather than bounding the order of Q. Its status is an accepted ordinary reduction plus VERIFIED_FINITE interface, not a Lean-kernel-checked theorem. It does not force a blocker, settle a resilient blocker residual's reconstruction, or handle the no-blocker branch. The remaining P3-plus-edge shape needs its own proof; no conclusion about that shape is imported here.
