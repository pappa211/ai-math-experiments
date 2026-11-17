> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Subcubic Hamiltonian graphs have WKE certificates

TUZA-22 restoration role, frozen2026-11-15 UTC. ORDINARY_PROOF_CANDIDATE pending review. No historical-priority claim.

**Theorem.** Every finite simple graph L with a Hamiltonian cycle and maximum degree at most3 is WKE. Thus, conditional on the separately reviewed triangle-free WKE link exclusion, no minimum CS failure has a closed link component that is triangle-free, Hamiltonian, and subcubic.

Fix a Hamiltonian cycle C. All edges outside C form a matching D, since each vertex has at most one non-cycle incident edge.

If |V(L)|=2r, take one alternating perfect matching M of C. Then L-M is the union of the other alternating cycle matching and D. A union of two matchings is bipartite (its components are paths and even cycles), so by the elementary bipartite matching/vertex-cover theorem it has a vertex cover Q of size at most r. Thus (M,Q) witnesses WKE.

If |V(L)|=2r+1, choose a vertex w unmatched by D, which exists because the order is odd. Let z be a cycle neighbor of w. Take the unique alternating matching M of the path C-z, of size r. The remaining cycle edges C-M consist of a two-edge path centered at z together with r-1 disjoint edges. After also deleting z, L-M-z is the union of those r-1 cycle edges and the surviving chord matching. It is bipartite on2r vertices. Moreover w is isolated: its remaining cycle edge went to z, its other cycle edge belongs to M, and it has no chord.

Therefore L-M-z has maximum matching size at most r-1 and a vertex cover Q_0 of size at most r-1. Then Q=Q_0 union {z} covers L-M and has size at most r=|M|. This witnesses WKE. QED.

The result handles all odd/even cycles and cycles with any matching of chords, including the C7/C8 plus-one-chord interfaces. Triangle-freeness is not needed to construct WKE, but it is essential to the current combined-obstruction exclusion because it bounds residual clique footprints. This theorem does not cover arbitrary cubic graphs without a Hamiltonian cycle or arbitrary higher-degree Hamiltonian links.
