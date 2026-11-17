> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A forest triangle cover need not have a minimum forest representative

Status: REFUTED_AUXILIARY_NORMALIZATION, ordinary literal certificate. Challenger, 2026-11-16 UTC. No computation was needed.

Take a core triangle abc, two distinct full apices v,x adjacent to all three core vertices but not to each other, and three fresh degree-two vertices y_ab,y_ac,y_bc adjacent only to the endpoints of their subscripted core edge. There are no other edges. The complete triangle family is abc, the six full-apex pages, and the three dedicated pages ab y_ab, ac y_ac, bc y_bc.

The three core edges form a cover. The three dedicated pages are edge-disjoint, so tau=nu=3. The minimum cover is UNIQUE and equals the cyclic core triangle.

To verify uniqueness, any three-cover of the original K5-minus-edge subgraph must include a core edge to hit abc. If it contains exactly one, say bc, then its two remaining edges must be av and ax to cover both ab/ac pages at each full apex. If it contains exactly two core edges, the two pages on the third base require two more edges, impossible. Thus the only three-covers of that subgraph are

    {ab,ac,bc}, {bc,av,ax}, {ac,bv,bx}, {ab,cv,cx}.

Each of the last three misses two dedicated new pages. A cover of the full graph using a new spoke instead of three old-subgraph edges would leave the old subgraph covered by at most two edges, impossible. Therefore only the core triangle is a minimum cover of the full graph.

Nevertheless the full graph has the forest cover

    {bc,av,ax,a y_ab,a y_ac}.

Its components are a four-edge star at a and the disjoint edge bc. It covers the original subgraph by the three-edge forest alternative and covers the added pages explicitly. Hence existence of a forest triangle cover does not imply existence of a MINIMUM forest triangle cover, even when ordinary tau and nu are exactly known.

This is a strict Tuza graph (tau=nu=3), not a combined-CS counterexample. It does not refute a normalization that uses tightness or the stronger additive-local-cost invariant. It explains why the arbitrary-cover hereditary class and the minimum-cover shape class must remain distinct in the mixed-cover program.
