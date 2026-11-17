> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh coordinator review of packing-two defect-one classification

Verdict: ACCEPT as a complete ordinary scoped theorem. I reconstructed the endpoint cases from the frozen statement, including all displayed packings/covers. This is independent AI review of a proof authored by the source-audit agent; no external human review or Lean verification is asserted.

An outside-outside edge has unchanged codegree when the terminal triangle is restored. Since the residual cover number is one, its triangles form a book. Any nonbase spoke outside the terminal triple would have codegree exactly one in the full graph, impossible. Hence the base is wholly outside and at least two terminal vertices are page apices. No other outside-outside edge exists, because every edge has positive codegree. Every additional nonisolated outside vertex is an independent clone adjacent to all three terminals by codegree>=2.

Two such clones give the displayed3packing ade,abf,bcg. With one clone and three common neighbors of d,e, abf,acd,bce is a3packing. With precisely two common terminal neighbors, a single extra c-spoke permits the stated3packing; without it, {ab,de,cf} covers all actual triangles. With no clone and only two common neighbors, {ab,de} plus the sole possible c-spoke covers everything. Thus only K5 remains under tau4,nu2. Every listed packing is pairwise edge-disjoint, and the triangle list in each cover case is forced by the complete endpoint classification, so no outside/crossing triangles are omitted.

The minimum-CS corollary uses explicitly the archived class-independent codegree>=2 input M3, plus M0 and reviewedR1. It excludes packing2 for this different obstruction; it does not extend originalH-D or import its prior theorem. The global blocker for larger packing numbers remains open.

Reviewed source SHA256: 4db2de16d1c48275250425d08f9ee928cfac3d37bd7497cfda745964cdf9075b
UTC: 2026-11-15T22:06:05.775931+00:00
