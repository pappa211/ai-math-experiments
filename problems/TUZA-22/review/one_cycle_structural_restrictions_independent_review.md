> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: one-cycle structural restrictions, corrected v2

Decision: ACCEPT v2. The v1 isolate omission was a real scope issue and is explicitly corrected; no frozen v1 text was silently changed.

Reviewed source: notes/one_cycle_cover_structural_restrictions_v2.md
SHA256: 7babfa30ce8a867763d4e28db8a5a1a0a3042dde7774629d8e5570169c1c5a20

A selected leaf is adjacent to every vertex of the unique selected cycle Z and has its selected parent outside Z. Any full-graph chord ab of Z would create a triangle with the leaf whose two spokes are unselected, forcing ab into the selected cover and creating a second cycle. Therefore Z is induced in G.

For a selected-degree-zero vertex x, every link edge lies in the cover. With isolates discarded, x has an incident edge and minimum codegree makes its link nonempty. A nonempty subgraph of a one-cycle graph with minimum degree at least2 can only be exactly that cycle, so the link is Z and its vertex set is N(x). Link robustness excludes orders3/4; at larger order deletion of any cycle vertex leaves a forest, so the reviewed apex-forest exclusion applies. Thus all remaining vertices are selected-supported.

The consequent connected leafless selected graph is a spanning cycle; if disconnected, every extra nonempty tree component has a leaf. The earlier leaf-adjacency result retains the isolated selected K2 exception. These conclusions are structural restrictions only, not a proof of one-cycle equality classification.

The five-vertex wheel guardrail is correct: matching number2, and every three-vertex induced subgraph contains two incident edges. No deletion of a matching can make a three-vertex independent set, so every matching complement has vertex-cover number at least3 and the link is not WKE. This does not affect the reviewed apex-forest class.
