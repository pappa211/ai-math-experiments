> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: perfect unicyclic remainders with triangular cycle

Verdict: ACCEPT USING THE STATED ORDINARY MINIMUM-CS INPUTS. Primary notes/apex_unicyclic_triangle_cycle_perfect_exclusion_v1.md, SHA58d8ca562d17313aa4df6e9ca5992dd707589625aed00ebbfdd3da09da7bdc4c. Reviewer: challenger, 2026-11-16 UTC.

The general residual-triangle substitution is valid: a surviving rim triangle lies in one literal residual block, whose cover can contain all three triangle edges at an extra cost of at most one (K4 costs3, K5 costs4 using the complementary pair edge). M continues to cover all outside pages on deleted matching bases. The reduced hub-spoke cover handles every other lost triangle, and the total2nu(G)-1 estimate is correct. No hidden restriction to internal pages occurs.

For three odd pendant paths, the displayed perfect matching uses the first edge at each cycle vertex. The complementary internal gaps are covered by the even-position path vertices. Adding w and two cycle vertices gives r cover vertices; after paying for the surviving triangle in the old cover, only w and the gaps remain, giving r-2. All path lengths, including length one, and all w-neighbors are handled.

For one odd and one even path, I checked the matching/cover sizes t+s+2 and every complementary edge, including t=0 and s=1. The only possible K4 link is wabc and its bc edge is removed, so the residual three-link-vertex bound holds. The wb/wc rim augmentation has the full two-edge-star footprint. After those adjacencies are excluded, neither b nor c lies in a residual link triangle, even though b has its extra pendant neighbor; this suffices for the external bc-page footprint argument. The alternate matching has the stated size and avoids bc.

Once bc has no further page, hb is already in the extension cover. Removing ha,bc and adding ac therefore saves one edge. The changed hub triangles hab,hac,hax1,haw are met by hb,ac,ax1,hw respectively, and all other removed matching-base pages retain their base. This is an exact lost-triangle audit with arbitrary outside pages.

The morphology assembly is exhaustive. A bare triangular cycle is not perfectly matchable. One pendant path must be odd. With two branches, a sole bridge attaching the odd triangle to the off-cycle branching vertex is forced in every perfect matching, contradicting the morphology's forbidden branch-joining edge; the remaining two cycle attachments have opposite path parity. Three branches have the three odd paths already handled. Thus every perfect unicyclic remainder with triangular cycle is excluded.

The conclusion is precisely the stated all-size branch. No finite four-branch table, Kotzig theorem, or general WKE-to-CS transfer is used. Longer-cycle perfect remainders and nonperfect remainders remain separate.
