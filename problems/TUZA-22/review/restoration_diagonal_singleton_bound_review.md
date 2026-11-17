> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: regular diagonals and singleton-terminal count

Reviewer: restoration. Frozen 2026-11-16. Verdict: ACCEPT, ordinary all-size necessary bound under the stated cover-drop hypotheses.

Reviewed source: `notes/red_book_diagonal_singleton_bound_v1.md`, SHA-256 `28b1f4e06f001790a4558b53216abeeae44452a5cd7d92468ead05afc29f5400`.

I used my independently reconstructed rerooting and full-family reviews, then checked the new argument separately. A regular K4 has both red-diagonal page families completely controlled in the singleton-deleted graph. If one diagonal had no third global page, deleting an actual page on its opposite diagonal removes that red edge and kills both pages of the first. The old exact-one cover minus the two diagonals then has size2k-3 and covers the full residual, contradicting the universal cover equality2k-2. This does not require residual packing equality or blockerlessness.

A third page must meet a deleted singleton blue edge: its unique red edge is the regular diagonal, so it cannot meet a distinct singleton red edge. Consequently a diagonal endpoint belongs to a singleton triangle. Opposite red diagonals supply distinct vertices; they cannot belong to the same singleton triangle because their connecting K4 edge survives the deletion of every singleton triangle. This checks the important shared-vertex possibility, without assuming singleton triangles are vertex-disjoint.

Regular K4 supports are edge-disjoint, so a pair of actual vertices belongs to at most one. The9*binom(s,2) count therefore follows even when singleton triangles share vertices. Adding at most2d exceptional slots and d<=s-1 gives q<=9*binom(s,2)+2(s-1) and k<=9*binom(s,2)+3s-2 exactly. No hidden isolation assertion, maximum-Q premise or survivor lower bound is used. The bound remains parameterized in s and is not an unrestricted H-D contradiction.
