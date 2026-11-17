> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: apex triangle with one odd pendant path

Verdict: ACCEPT USING THE DECLARED MINIMUM-CS AND K4-PEELING INPUTS. Primary notes/apex_triangle_odd_pendant_link_exclusion_v1.md, SHA b2e77ded7379826a436aa0c1a69f81c1e0facaec66553477d6facd66fb591f23. Reviewer: challenger, 2026-11-16 UTC. This is an ordinary unbounded local exclusion, not a finite certificate or general apex-unicyclic theorem.

I reconstructed the matching and cover for all t>=0, including the length-one pendant path. P has bc and the alternating path matching, Q has w,a and the even-index internal path vertices; both have t+2 members, and Q covers every complementary F-edge and all w-edges. The loss cover includes every removed rim edge, so arbitrary outside pages on any such edge are covered. Closedness accounts for all removed h-spokes. Balanced accounting therefore has its exact stated scope.

Although L may contain K4 on w,a,b,c, that is its only possible K4 because F has exactly one triangle. Its bc edge is deleted, so a residual clique block still contains at most three L vertices. This distinction correctly handles the triangle-bearing case.

If wb or wc exists, replacing bc by that edge in the comparison matching gives t+2 hub triangles disjoint from abc. The whole residual footprint is at most one matching edge plus one surviving rim edge; disjointness of these two would require four L vertices in a block. The two-edge-star avoidance is simultaneous and valid.

For a further bc-page bcy, the exact neighbor lists force y outside N(h). The alternate matching {ab,wz,x1x2,...} is valid and has the same size, including when t=0. Every page spoke survives, and no residual block can contain a page endpoint b or c together with two additional L vertices: only a remains as an available link neighbor once bc is deleted. Thus any matching-edge/page-spoke footprint again shares an endpoint. The claimed augmentation excludes ALL further bc-pages, not just displayed link triangles.

The cover substitution was checked triangle by triangle. Replacing ha,bc with hb,ac handles hbc and abc; every lost triangle using ha is among hab,hac,hax1,haw and is covered respectively by hb,ac,ax1,hw. Other removed matching edges remain in the cover, so their unrestricted outside pages are not lost. The symmetric substitution is equally valid. If ac or ab is triangle-supported in K, a minimum cover of its literal residual block can contain that edge, giving the claimed one-edge overlap saving.

Finally, if neither ab nor ac is supported in K, every outside page on either would survive in K: its apex is outside N(h) by the exact b,c link lists, and neither of its other edges can be a deleted h-spoke or P rim edge. This rules those pages out. The edges hb,hc have no outside page by closedness, and bc has only its two already counted pages. Hence the ENTIRE actual outside boundary of the literal habc K4 is contained in ha, and the separately accepted star-boundary peeling theorem applies.

No arbitrary w-neighbor restriction was introduced: all w-edges remain covered by hw in the extension, and all longer path pages remain covered by their unchanged P edges. The proof genuinely resolves the stated one-branch triangle-cycle perfect-unicyclic shape. The remaining even-cycle, multiple-branch and nonperfect cases stay open. No finite four-branch or Kotzig premise is used.
