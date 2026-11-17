> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A pseudoforest cover need not normalize to tree/triangle components

Status: REFUTED_AUXILIARY_NORMALIZATION, ordinary certificate using the elementary Mantel equality theorem. Challenger, 2026-11-16 UTC. This identifies a graph outside the newly proved tree/triangle-cover class; it is not a Tuza or CS counterexample.

Let G be the complete multipartite graph with parts

    {A0,A1}, {B0,B1}, {C0,C1}, {d}.

Equivalently G is K7 minus three disjoint edges. It has18 edges; each of the six paired vertices has degree5 and d has degree6.

Every triangle cover removes at least6 edges, because a triangle-free graph on seven vertices has at most floor(49/4)=12 edges by Mantel's theorem. A cover of size6 exists: partition the vertices into {A0,A1,d} and {B0,B1,C0,C1}, retain all cross edges as K3,4, and select the remaining edges. The selected graph is the P3 with center d on the first side and the C4=K2,2 on the second. Thus tau(G)=6 and G has a pseudoforest cover.

The equality case of Mantel's theorem says that every triangle-free seven-vertex graph with12 edges is K3,4. Hence every six-edge cover of G must leave such a residual. The endpoints of each missing G-edge must lie on the same bipartition side, because every cross pair in K3,4 is an edge. A side of size3 therefore consists of one paired part together with d, and the size4 side consists of the other two paired parts. Consequently EVERY minimum cover is isomorphic to C4 disjoint P3.

On seven vertices, a selected-edge graph whose components are only trees or literal triangles has at most6 edges. Indeed a triangle component has as many edges as vertices, while each tree component (including an isolate) has one fewer; seven is not divisible by three, so at least one tree/isolate component is necessary. If such a graph covered G, its size would therefore have to be exactly tau(G)=6. But every six-cover has the forbidden C4 component. Thus G admits NO triangle cover with only tree and literal-triangle components, even a nonminimum one.

For an independent packing parameter check, the following five triangles are edge-disjoint:

    A0 B0 C0,
    A1 B1 C1,
    d A0 B1,
    d C0 A1,
    d B0 C1.

A six-packing would use all18 edges, decomposing G into triangles. Every vertex degree in a triangle decomposition is even, contradicting the six degree-five vertices. Hence nu(G)=5. The graph is strictly within Tuza: tau6<2nu10.

The example disproves the shortcut “every graph with a pseudoforest triangle cover already admits a tree/triangle-component cover.” It does not disprove CS for the larger pseudoforest-cover class. Longer-cycle cover components therefore present a genuine new availability/interface question rather than a relabeling of the accepted mixed-cover theorem.
