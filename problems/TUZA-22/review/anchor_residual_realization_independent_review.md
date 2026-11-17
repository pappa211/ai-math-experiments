> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: extremal anchor residual realization

Verdict: ACCEPT at the exact ordinary guardrail scope. Reviewed 2026-11-16 by source_audit. Frozen source `notes/challenger_anchor_residual_realization_boundary_v1.md`, SHA256 `87dc2d64a6c6eadfb2783df66c00b4a0fc3fb6b41c09c395837363a070f52a2c`.

I reconstructed the graph before accepting the stated interpretation. A forest cover C_R omits at least one edge of every actual triangle, so its complement contains a disjoint cover D. The added vertex b_e has exactly two neighbors, and its sole new triangle has base e. Distinct new triangles have distinct bases and entirely distinct spokes; hence P is a |D|-packing. The same D is a |D|-cover of all old and new actual triangles, certifying both optima without a solver. Selecting one spoke per new vertex extends the selected spanning tree. Each member of P uses exactly that one selected spoke, so p2=0 is the absolute minimum possible among maximum packings. Deleting those spokes leaves the original triangle family plus pendant edges.

For the wheel example, the selected edges h0,h2,h4,01,23 form a connected five-edge graph on six vertices and therefore a tree. The five wheel faces are respectively met by 01, h2, 23, h4, and h0/h4. The disjoint set {h1,h3,40} covers the same faces in groups of two, two, one. The three new triangles have no other completions because their new apices have degree two. Thus H has nine vertices,16edges,eighttriangles and nu=tau=3. The residual has exactly five wheel faces, intersection C5, nu=2 and tau=3=p1. The counting lower bound for tau is valid since every residual edge meets at most two faces.

The counterexample quantifier is EVERY extremal maximum/minimum-p2 packing. It does not rule out SOME alternative packing with a better residual. The selected tree need not be a minimum triangle cover of the internal graph H (in this example its size is eight while tau(H)=3); the anchor theorem under discussion only assumes a spanning-tree cover. This limitation is compatible with the source's stated scope and must persist if it is reused in a stronger minimum-cover setting. No violation of the budget tau(H-S)<=p1 is asserted or obtained.

No computation or external theorem is used in this review.
