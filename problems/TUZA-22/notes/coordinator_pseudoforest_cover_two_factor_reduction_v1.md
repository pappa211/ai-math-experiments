> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Any pseudoforest cover in a minimum-CS failure is a spanning two-factor

Frozen ordinary consequence, 2026-11-16. No finite certificate is a premise of this reduction.

Let G be a proper-edge-subgraph-minimum CS failure, globally or in an edge-subgraph-hereditary class. Discard isolated vertices. Suppose C is ANY actual triangle-edge cover whose selected graph is a pseudoforest: each selected component has at most one cycle. The cover need not be minimum. Then C is a spanning disjoint union of cycles, with every G vertex having selected degree exactly two.

First no nonisolated G vertex v has selected degree zero. Its nonempty closed link components consist entirely of selected edges, since each triangle through v must be covered on its rim. Every such component has minimum degree at least two by the minimum-CS codegree property. A connected pseudoforest of minimum degree at least two is a cycle. Deleting a vertex from that cycle leaves a forest, contradicting the ordinary apex-forest closed-link exclusion (or the stronger apex-pseudoforest theorem).

Second no vertex v has selected degree one. Let its sole selected neighbor be w. The graph edge vw belongs to triangles, so w belongs to a nonempty closed component L of the link at v. Every edge of L-w must be selected: its hub triangle has neither spoke selected. Therefore L-w is a subgraph of C, hence a pseudoforest. The ordinary full apex-pseudoforest closed-link exclusion contradicts this. All other closed link components and arbitrary outside pages are permitted by that theorem.

Thus every vertex has selected degree at least two. In each selected pseudoforest component, the degree sum is at most twice its vertex count; equality is forced and every degree is two. Each component is consequently a simple cycle. This proves the result for the complete vertex set of G.

This does NOT classify equality for all pseudoforest-cover graphs. It removes leaves and unused vertices from a hypothetical minimum failure but leaves an arbitrary number of selected cycle components and their interactions. In particular a selected C5 can cover a literal K5, and a selected K3 together with one disjoint selected edge can also cover a K5; no general K5-free conclusion is valid for this class. The separately proved one-cycle CS theorem and two-cycle Tuza inequality retain their own explicit finite dependencies.

Dependency: notes/apex_pseudoforest_full_exclusion_v1.md, SHA a4329ae4b512eb74e7efbf016e9299e756309052876a876dc6ad11cc82846ceb, together with the authenticated class-local M0/codegree framework. No cover availability or unrestricted solution is supplied.
