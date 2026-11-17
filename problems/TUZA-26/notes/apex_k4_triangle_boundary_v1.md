> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-eligible K4 regions have a matching of private edges

Frozen ordinary paid-cover lemma v1, TUZA-26, 2026-11-17. Independent review required. This uses the later universal full-triangle-cover property and is stronger than the earlier small-boundary K4 exclusion at that additional scope.

Let H be finite simple, and suppose every actual H triangle is contained in some minimum triangle cover of H. Let D be any literal K4 subgraph. Define its COMPLETE outside-triangle boundary F to be all D edges belonging to an actual H triangle not wholly inside D. Then the private edge set E(D)-F is a matching.

Indeed suppose two private edges were adjacent. They lie in an actual D triangle T, so T contains at most one boundary edge. Choose a minimum H cover containing all three edges of T. Choose a minimum two-edge D cover which contains the possible single edge of T intersection F; any prescribed K4 edge belongs to its opposite-pair minimum cover. Replace the three selected T edges by that two-edge D cover, keeping every other cover edge unchanged.

Every internal D triangle is covered by the replacement. Every outside triangle previously met by a removed private edge is impossible by the COMPLETE boundary definition. Any removed boundary edge of T is retained in the new D cover. Thus this is an actual H cover with at least one fewer edge, contradiction.

Consequently |F|>=4, and if |F|=4 its two private edges are opposite. In particular no literal K4 with complete boundary at most three can occur. The statement permits arbitrary vertex sharing, background, and crossings through F; no fresh gluing or graph deletion is assumed.

This is an explicit cover-saving operation whenever the forbidden private-edge pair is available. It does not guarantee a literal K4 or a small boundary in an arbitrary graph. In the conditional minimum Q, the independently established universal full-triangle-cover premise licenses this later reduction. It must not be applied at an earlier stage where only individual edge eligibility has been proved.
