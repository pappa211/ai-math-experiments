> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Full closed-link apex-cycle exclusion

Frozen ordinary assembly using an authenticated historical local input, 2026-11-16. No finite census or Kotzig theorem is used.

## Theorem

In a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class, no closed link component L has a vertex w such that L-w is a cycle.

The new ordinary all-size parity proof `apex_cycle_link_exclusion_except_w5_v2.md` (SHA 35a9a91da716f14c026bb3b651e0cf1c28b36ebb5d41712aa54eba5f46234145) excludes every such link except the full wheel on five vertices, w+C4. Its corrected Section5 uses the explicit alternate matchings P_0,P_1, not the invalid odd-gap endpoint switch preserved in the unreviewed v1 draft.

The remaining W5 is exactly K_(2,2,1). It is excluded by the authenticated pinned local proof in `sources/public/papers/tuza-five-degenerate/main.md`, Section5.3, titled "The remaining type K_(2,2,1)". That source is copied from public commit 4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4. The all-size conclusion therefore follows by combining the new proof with this existing local case, not by relabeling W5 as WKE.

## Exact historical scope audit

The inspected source starts Section5 with a five-vertex CLOSED LINK COMPONENT L and uses only class-local minimum-CS conclusions, literal B residuals, and clique avoidance. It does not require the hub to have no other link components, nor the ambient graph to satisfy degeneracy or a density bound in this local case.

For W5, its six-vertex hub-plus-link graph is K6 minus two independent rim edges. The source deletes all local edges, exhibits four edge-disjoint local triangles, and covers every lost triangle by the eight rim edges. Thus balanced accounting supplies a B residual. Every old clique block meets the six local vertices at most once.

The remaining lost triangles are exactly arbitrary outside pages on those rim edges. A four-edge cover of the six-vertex local graph forces that page family to have cover number at least four under equality. The source lists four bad pairs forming a perfect matching on the eight possible bases; every other pair admits a local three-packing avoiding both bases. It then proves, by actual endpoint/apex cases, that absence of two disjoint pages on good bases would give a two-edge cover of the entire page family. Hence a good disjoint pair exists. Those two outside pages append to the local three-packing and maximum residual block packings, because the entire old footprint in each block is at most two spokes sharing its unique local vertex. This contradicts the balanced packing count.

This is the required arbitrary-attachment equality argument. No assertion that W5 is WKE is made, and the inequality-only published antecedent is not substituted for the source's explicit CS extension.

## Consequence and remaining unicyclic work

The bare-cycle branch of the apex-unicyclic program is now excluded. In a candidate closed link L with connected unicyclic remainder F=L-w, that remainder must have at least one attached tree.

In the perfect-matching branch, the separately accepted morphology restricts F to at most three degree-three vertices, and the new triangular-cycle assembly removes every case whose unique cycle is C3. Thus the remaining perfect branch has cycle length at least four and one or two degree-three vertices. The nonperfect remainder branch remains open; no forest-attachment availability or general WKE-to-CS implication is assumed.

Dependencies remain ordinary at their exact scopes: authenticated historical §5.3; new corrected apex-cycle proof; ordinary parallel-thread exclusion and M0/M3/clique facts used there. Fresh reviews are maintained separately.
