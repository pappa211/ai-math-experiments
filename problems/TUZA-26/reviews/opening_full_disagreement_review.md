> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: full disagreement-graph cover operation

Verdict: PASS, PROVED_ORDINARY for notes/apex_full_disagreement_cover_operation_v1.md, SHA-256 abda1ab37997115b06cc60c61328552756502f79038645750c03a1930a38c384. The operation and minimal-pair reachability claims are exact; their availability and geometric interpretation remain OPEN. No computation or Lean verification was needed.

For minimum K covers F,F', put D=F intersect F' and A,B their differences, each of size n. The disagreement graph includes every cross pair supplied by every actual triangle missed by D. If Z covers this bipartite graph, D union Z hits every actual K triangle: any missed triangle would supply an uncovered H edge. Therefore every H vertex cover has at least n vertices, while either side is a cover of size n.

The perfect matching exists by the stated direct Hall proof: a deficient subset S of A would give the smaller H cover(A-S) union N(S). This auxiliary matching is not a triangle packing; third-edge collisions remain possible and are explicitly preserved.

Fix matched pairs(a_i,b_i). A size-n H cover chooses exactly one endpoint of each pair. Write z_i=true for a_i and false for b_i. Edge a_i b_j requires z_i OR NOT z_j, so the directed implication is j -> i. With this orientation, selecting prescribed a_i and b_j is possible exactly when there is no directed path i -> j. If the path exists, z_i=true forces z_j=true. Otherwise the forward reachable set from i is a valid true set, excludes j, and gives the desired literal H cover. Zero-length paths correctly prohibit selecting both endpoints of one matched edge.

For a codegree-two missing edge uv, choose minimum K covers containing the respective full spoke pairs. The positive cover gap makes each cover miss the other pair, so the two x spokes lie in A and the two y spokes in B. If ANY x index lacks a directed path to ANY y index, the constructed minimum H cover selects a spoke from each page. D union Z is a minimum K cover meeting every new uv-page, hence a Q cover of size tau(K), an actual one-edge saving. A surviving profile consequently forces all four specified directed reachabilities. This strictly refines the earlier undirected-component obstruction.

For covers chosen to minimize the outside symmetric difference, the additional closure claims are valid. Replacing F by the H cover with true set equal to the forward closure of the two x indices retains both x spokes. If that closure omitted a variable, the new cover would agree with F' on its matched b endpoint and strictly decrease the outside difference. The four reachabilities keep both y indices inside that closure, so the removed variables are indeed outside variables. Minimality forces the closure to contain every variable.

Dually, let Bcl be the indices that reach at least one y index. Its complement is forward-closed. Replacing F' by the corresponding H cover retains both y spokes and reduces the difference from F unless Bcl is the whole index set. Both x indices belong to Bcl by the four reachabilities. Thus every disagreement variable lies on a directed route from some x-spoke index to some y-spoke index.

This describes all minimum H vertex covers and the resulting family of minimum K covers. It does not assert that every minimum K cover, even within F union F', is an H vertex cover. Nor does a directed route identify a simple path in the original graph: its vertices are matched PAIRS OF COVER EDGES, its arcs are witnessed by triangles, and repeated original vertices or third edges remain uncontrolled. The actual cover-saving construction is accepted; forcing a failed reachability or extracting a geometrically valid strip remains open.

Frozen UTC: 2026-11-16T23:27:09.933082+00:00
