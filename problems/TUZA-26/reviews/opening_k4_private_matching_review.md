> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: K4 private edges under full triangle eligibility

Verdict: PASS, PROVED_ORDINARY for notes/apex_k4_triangle_boundary_v1.md, SHA-256 b5b55a83b1866c4fcffa5dff81f11070269643693c4ee2fc9bf798e8c09132af. This elementary cover operation requires the stated EVERY-TRIANGLE minimum-cover premise. It is not available from individual edge eligibility alone.

For a literal K4 D, suppose two private edges are adjacent. Their triangle T has at most one edge in the COMPLETE outside-triangle boundary F. Choose a minimum H cover containing T. Replace its three T edges by a two-edge opposite-pair K4 cover retaining the possible single F edge. Such a cover exists through any prescribed K4 edge.

Every internal D triangle is now hit. A removed private edge belongs to no outside triangle by definition; the possible removed boundary edge was reinserted. Every other original cover edge remains. Therefore the replacement is an actual H cover with at least one fewer edge, contradiction. Possible overlaps with already-selected edges only increase the saving.

Thus private edges form a matching of size at most two. The complete boundary has at least four edges, and when exactly four its two private edges are opposite. In particular every K4 boundary of size at most three is excluded, with arbitrary vertex sharing and outside triangles through F retained.

This is valid at the later minimum-Q stage where universal full-triangle eligibility has already passed independent review. It introduces no graph deletion, naming, packing assumption or numerical verification. It must not be moved earlier in the dependency chain before that eligibility theorem.

Frozen UTC: 2026-11-17T00:19:49.884896+00:00
