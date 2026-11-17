> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A rejected cover-critical size shortcut: an actual graph obstruction

Coordinator exploratory hypothesis and ordinary counterexample candidate. This concerns an auxiliary size bound, not Tuza or CS.

Tempting shortcut: perhaps a graph in which deleting every edge lowers its triangle-cover number has m<=4tau. A linear edge bound could help turn cover criticality into a small global kernel. Risk: this discards the tightness and degree hypotheses of a minimum CS failure. The following actual graph refutes the shortcut, so it is retired rather than used in the primary program.

Let L be the graph obtained from K6 by replacing every edge uv by a three-edge path u-a_uv-b_uv-v, with all30 internal vertices distinct. Then L is triangle-free, with36 vertices and45 edges. Let G be its cone with new apex z, so G has37 vertices,81 edges and45 actual triangles (one per rim edge).

To compute alpha(L), choose s original vertices in an independent set. All original vertices are now nonadjacent. Each subdivided path contributes at most one internal vertex unless neither endpoint is selected, in which case its two internal vertices are still adjacent and again contribute at most one; if both original endpoints are selected, neither internal vertex can be chosen. Thus the maximum size for a fixed original subset is

    s+15−binom(s,2).

The internal choices on distinct paths are independent, so this bound is attained. Its maximum is16, at s=1 or2. Hence tau(G)=tau_vertex(L)=36−16=20 by the cone cover identity.

The link L has a perfect matching of18 edges. Choose a perfect matching of the original K6. On its three subdivided paths take both outer edges; on every other path take the middle edge. These18 edges cover all36 link vertices. Thus nu(G)=18.

Every edge of G is cover-critical. First, every link vertex lies in some minimum vertex cover of L: for an original vertex choose a maximum independent set using a different original vertex; for an internal path vertex choose the single original vertex outside that path and take the opposite internal vertex on its path. Therefore deleting any spoke zv lowers tau by one (restrict the corresponding minimum link cover; reinsertion gives the reverse bound).

For each rim edge e, alpha(L−e)=17. If e is an outer path edge, select both original endpoints of that path; the formerly forbidden internal endpoint freed by deleting e adds one to the s=2 optimum. If e is a middle path edge, select one original vertex outside that path and select both of its now nonadjacent internal vertices, adding one to the s=1 optimum. Deleting one edge can increase independence number by at most one, so these constructions are exact. Therefore deleting any rim edge lowers the cone cover number from20 to19.

Consequently G is triangle-cover-critical at every actual edge, but

    m(G)=81 >80=4tau(G).

It is not a Tuza counterexample: tau20<36=2nu. Its internal subdivision vertices have graph degree3, and it is far from tight. Thus the obstruction does not meet the full minimum-CS premises. It demonstrates exactly why cover criticality alone cannot justify the proposed linear edge bound.

No computation, abstract hypergraph realization, or external critical-graph theorem is needed for this construction. The maximum-independent-set formula and every edge-deletion witness are displayed explicitly. Pending fresh review if promoted to the accepted obstruction ledger.
