> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Matching triangle cover theorem — independent reconstruction

Source: `notes/matching_cover_proof_v1.md`. Verdict: **ACCEPT as an ordinary scoped theorem**, including equality characterization. No unresolved mathematical objection found. This is AI proof review, not Lean verification or a novelty assessment.

Delete inactive edges from the matching transversal M, leaving r active edges. Every triangle contains exactly one matching edge, since two matching edges cannot fit on three vertices. Thus the entire actual family partitions into nonempty books with disjoint bases.

Choose one triangle per book. A selected triangle abx can share an edge with a triangle on another base cd only if x lies in{c,d} and the second apex lies in{a,b}. The matching has at most one base containing x. Thus each chosen triangle has at most one neighbor in the edge-conflict graph. Its components are edges and isolated vertices; choosing one triangle from each component gives a packing of size at least ceil(r/2). Since M covers all triangles, tau<=r<=2nu.

Under tau=2nu>0, both inequalities force r=tau=2nu, an even number. Any one-per-book selection with an isolated triangle must have at least two isolated triangles, because the remaining components have even size. Its maximum independent set would have size greater than r/2, contradicting nu=r/2. Hence **every** possible selection has a perfect-matching conflict graph.

Fix a triangle in book i with base ab and apex x. Its only possible conflicting book j is the base containing x, and every choice of triangle from j must conflict with it; otherwise complete that choice arbitrarily in other books to produce an isolated i-triangle. Thus every j-apex lies in{a,b}. Fixing any such j-triangle, whose apex belongs to i's base, now forces every i-apex into j's two base endpoints. This reciprocal conclusion is independent of choices in all remaining books. It pairs whole books consistently, not merely triangles in one selection.

Each pair therefore has only its four base endpoints. Since both books are active and cross-intersect, at least three of the four cross edges occur. Three cross edges give exactly two triangles sharing a cross edge; replacing the two matching-base cover edges by this one edge covers their entire pair and saves one edge, contradicting tau=r. Four cross edges give all four faces of K4. Every actual triangle belonged to a book at the start, so no crossing triangle can join pairs. Their vertices, and hence supports, are disjoint because their bases form a matching. Any graph edge not in those supports lies in no triangle. Therefore all triangle components are K4. The converse is immediate by component additivity, subject to the theorem's matching-transversal hypothesis.

The stronger vertex-disjointness conclusion for tight triangle components is valid within this class. A graph formed by K4 components sharing vertices satisfies the numerical equality, but generally does not admit such a matching transversal; the theorem does not assume that all B graphs do. K5 is excluded from this class because its cover number4 exceeds its maximum matching size2.

The equivalent description as a triangle-free graph plus a matching is exact: delete the transversal to get a triangle-free spanning graph; conversely every triangle formed on adding a matching contains exactly one added edge. The equality/inequality result is unconditional within this graph class. General matching-transversal availability, and B-plus-matching restoration with old supported blocks, remain unavailable.

Reviewed source SHA-256 at first review: `8b852db1f0e2a6135d383afa1d731eae5f0dc5242a04bbff4c8bd6e6605f8672`.
Review completed UTC: 2026-11-15T21:59:02.964607+00:00.
