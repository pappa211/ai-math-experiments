> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent specification review, v1

Verdict: ACCEPT THEOREM_SPEC.md v1 as the intended exact mathematical contract. This is an independent AI semantic/source review, not compilation evidence. The reviewed specification hash and source hashes are in reuse_source_inspection_hashes.json. No Lean or Lake command has been run by this reviewer.

The R2 type quantifies over arbitrary finite vertex types (including empty), actual SimpleGraph graphs, and a finite set of at most two distinct unordered nonedges. Addition introduces exactly those edges. Hypotheses are B(H) and tightness of H+F; conclusion is B(H+F). No hidden CS, minimality, footprint, bounded-order, attachment, nonemptiness or full-inequality hypothesis is specified. This faithfully matches frozen notes/r2_proof_v1.md, SHA256 c636a53ea94cfcb35382b52c5637321a788e90d4185141ee71036fd89ebcdd13.

Actual unordered triangles, edge-disjoint packings with vertex sharing, actual-edge graph covers and optimum witness existence are explicit. The internal Covers predicate allowing extraneous members is acceptable only through the promised graph-edge-restricted optimum bridge. B uses actual shared-edge triangle components and complete support equality. Its decomposition alternative has an existing proved equivalence including all crossing triangles. Background edges, isolates, disconnected graphs and shared vertices remain allowed.

Whole-footprint means the union of both spokes of ALL ordinary pages of one old nonedge in each old clique component. Existing pointwise/two-page lemmas do not establish that statement. M0 is correctly separate, conditional on proper-subgraph CS only; the historical degree-conditioned CombinedStatement is explicitly excluded. Forest target is existence of ANY forest actual-edge cover, not a minimum forest cover or an acyclic ambient graph.

One clarification for implementation: M0 connectedness must say all actual triangles are connected under shared-edge adjacency. Ordinary connectedness of the graph edge support alone is weaker and insufficient to match the intended component reduction. This is a precision clarification, not a change to the R2 contract. The two natural notions should be separately named if both are proved.

Final acceptance remains conditional on inspecting actual definitions/theorem types, clean-source build, theorem-level axiom closures and meaningful semantic controls. No code theorem is certified by this specification acceptance.
