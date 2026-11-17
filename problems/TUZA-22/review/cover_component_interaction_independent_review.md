> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Minimum-cover component conflict architecture — fresh review

**ACCEPT the exact triangle-family, local-cover, conflict-graph and weighted-packing claims, and the displayed local counterexample.** The proposed favorable local bound is explicitly false; the architecture remains an exploratory representation, not a global theorem.

Every triangle's selected cover edges belong to a single connected cover component, since any two triangle edges share a vertex. No C_j edge enters G_i for i different from j: any generating triangle containing it would have been assigned to j. Therefore any actual G_i triangle, which must meet the original cover, meets C_i and belongs to F_i. This validates the exact family claim despite G_i being an edge-support union rather than an induced graph. A cover of F_i smaller than |C_i| would combine with all other cover components to improve the global minimum, proving the exact local cover number.

An internal selected triangle has all edges within A_i, whereas a triangle assigned elsewhere has two vertices in its own disjoint cover component and at most one in A_i. It cannot share an edge with the internal triangle. An external i-page has precisely one C_i base and one apex outside A_i. Cross-family edge sharing with a j-page requires that apex to be in A_j and the j-apex to be in A_i; the common edge is crossing between those two sets.

Thus any external page can have conflicts with only one other cover component, fixed by its apex. Its two spokes each meet at most one selected triangle in that other component because that selected family is already a packing. The conflict graph has maximum degree2, and each nontrivial component stays on one fixed unordered component pair. It is bipartite, hence a path or even cycle. Independent selections contribute at least half of each external component, with the stated extra half-unit at odd-order paths. All internal members may be kept. This proves the displayed lower bound without discarding any actual crossing triangle or using a matroid analogy.

In K5-e with the three-vertex triangle as minimum cover, all triangles belong to one cover family. The sole internal triangle conflicts with every external page. External pages use three bases and two apices; an edge-disjoint page packing has size at most2, attained with different bases and apices. The maximum proposed weight is therefore2, below the cover size3. Its ordinary cover number3 is exact. This refutes the proposed local sufficient condition at a literal minimum-cover component.

For downstream phrasing, the general favorable bound for every component would imply unrestricted Tuza through the weighted inequality, but the representation does not show that arbitrary graphs admit a connected minimum cover or that the one-component case alone is equivalent to the full conjecture. The mathematical claims do not need either assertion. Any continuation must use additional simultaneous global cover replacement or graph-specific exchanges to control the demonstrated local deficit.

Reviewed source SHA-256: `726b0c03acb30f74c0338f33a52669b050c8a4b147e8a40b595b43282eba28de`.

Completed UTC: 2026-11-15T23:33:45.804872+00:00.
