> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: four-branch K4-containing link exclusion

Decision: ACCEPT USING DECLARED INPUTS. Reviewer: TUZA-22 challenger, 2026-11-16 UTC. Frozen primary: notes/four_branch_k4_link_exclusion_v1.md, SHA25680e48be8de314cc6b5ee8cdfefebd8862ab36a302eb34d3e7ef4d6955eb35992.

I reconstructed all path-count cases and checked the final t=4 packing and cover footprints literally. No gap was found.

The K4 vertices exhaust the four branch vertices, so the reviewed loop/parallel restrictions give exactly the core plus even nondirect paths, at most one per pair. A balanced matching deleting exactly one core edge leaves two shared-edge triangles on the residual diamond; B would require the absent edge in their literal block, so the immediate contradiction is valid. The two-vertex tuple lift preserves that exact core-edge condition and is not used as a general CS subdivision theorem.

For t=2,3, the low-degree core vertex supplies the displayed three-matching and three-cover, including the unique omitted-vertex ear leg if present. For t=1, both the short-ear replacement and the long-path tuple have the claimed sizes. The residual induced link is triangle-free in these cases, so the old-footprint bounds are correct.

For t>=4 the spanning unicyclic ear-pair assignment gives distinct matched core endpoints, and each path contributes the stated alternating matching. In the residual, an unassigned short ear contradicts B. Any surviving two nondirect edges in one block would require either an absent tip-tip edge or a residual short-ear triangle with both legs surviving; the latter was already excluded. The unassigned-long-path and cycle-assignment reversals therefore have the complete single-matching-edge footprints claimed, and their safe-page endpoints lie in no link triangle.

For the final t=4 shapes, P and Q both have r+3 elements. In the K4-block branch, the displayed r+5 triangles are pairwise edge-disjoint: their hub spokes partition into {c,z}, {a plus all path interiors}, and {b,d}; the two ear triangles use distinct core bases and the final triangle acd supplies the remaining three core edges. All six core edges are used, replacing the one residual core triangle. The outside old footprints are exactly bx,cy and the r alternate path edges. Two such edges cannot lie in another residual clique: tips x,y have only their one surviving core neighbor, long interiors have no link triangle, and any disjoint pair would require missing cross adjacencies. Thus all other residual block packings can avoid their complete footprints simultaneously.

In the K5-block branch, I checked the alternate assignments for both the three-ear cycle plus fixed pendant path and the four-ear cycle. The unchanged selected path bases are deleted, so they add no old footprint. An outside page on a selected short leg has apex outside the entire link, and every disjoint pairing with an alternate surviving leg requires a missing tip-to-core edge or the selected deleted leg. The two-star bound is therefore complete.

The final replacement X has exactly2r+8=2s+2 edges, including r=1. Its four core edges and hd cover every core hub triangle; tip spokes cover short-ear hub triangles; core bases cover their ear triangles; P_path covers all pages on its deleted bases; the even path spokes and h t1 cover the complementary path hub triangles. No omitted outside short-leg page remains after the preceding exclusion. The residual K5 has a minimum cover triangle abc plus dq, so the three-edge overlap with X gives the required strict saving.

The result excludes the exact K4-containing four-branch closed-link class, with arbitrary outside attachments. It does not classify K4-free triangle-bearing kernels or turn historical WKE certificates into CS proofs. No finite computation was used in this reconstruction.
