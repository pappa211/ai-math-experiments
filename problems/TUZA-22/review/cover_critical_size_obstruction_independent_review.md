> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Cover-critical size shortcut obstruction — independent review

**ACCEPT** the displayed actual graph as an ordinary counterexample to the auxiliary implication that edgewise triangle-cover criticality forces m<=4tau. It is not a minimum-CS example or a Tuza counterexample.

In the three-edge subdivision L of all15 edges of K6, the36 vertices and45 edges are correct. The graph is triangle-free because every original edge was subdivided and all internal vertices are private to their path. For a fixed selected set of s original vertices, a path with both endpoints selected permits no internal vertex; every other path permits exactly one. All internal choices on different paths are independent, so the maximum independent-set size for that fixed subset is exactly s+15-C(s,2). Its maximum is16 at s=1or2. The cone identity therefore gives tau=36-16=20.

The perfect matching consists of six outer edges on three paths corresponding to an original perfect matching and twelve middle edges on the other paths. It covers all36 vertices, so the cone packing number is18. Its37 vertices,81 edges and45 actual triangles are exact: all triangles are hub-plus-rim-edge triangles.

For every original link vertex, a maximum independent set using a different single original vertex avoids it. For any internal vertex, choose a single original vertex outside its path and choose the other internal path vertex; completing each remaining path gives a16-set avoiding the specified vertex. Thus every link vertex lies in some minimum vertex cover. Removing its hub spoke deletes precisely the hub triangles on its incident link edges, and the corresponding minimum vertex cover minus that vertex covers all remaining triangles with19 edges. Restoring the spoke gives the reverse bound, so the new triangle-cover number is exactly19.

For a deleted outer rim edge u-a, select both original endpoints u,v of that path and include the newly freed internal vertex a, obtaining17 independent vertices. For a deleted middle rim edge a-b, select a single original vertex outside the path and both internal vertices, again obtaining17. A single edge deletion raises independence number by at most one, so both bounds are exact. The cone identity after a rim deletion gives cover19 as well. Hence every actual edge is cover-critical.

The numerical contradiction is81>80=4tau, whereas tau20<36=2nu. The degree3 subdivision vertices and failure of tightness explicitly prevent importing this obstruction into the full minimum-CS interface. No abstract hypergraph realization or unverified critical-graph result is used.

Reviewed source SHA-256: `2dbb115c69f986fee9de948490f52228cc8b6133e991ea6becb2078042e8c580`.

Completed UTC: 2026-11-15T23:10:25.003013+00:00.
