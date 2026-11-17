> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent reconstruction: exact packing for an entire forest core

Verdict: ACCEPT `notes/one_sided_forest_exact_packing_v1.md` at its stated one-sided induced-forest scope.

The block-graph Hall argument is complete. On an end clique, Hall-tight sets are closed under union because neighborhood size minus set size is nonnegative and submodular. Their union X0 identifies exactly the colors whose deletion would prevent an SDR. For a reduced test set containing the cut vertex, each forbidden color gains exactly one unit of independent-set capacity when X0 is restored: a chosen end-clique vertex conflicts only with that cut vertex, and the cut vertex no longer supports the color in the reduced instance. This proves the exact capacity identity and preserves every Hall inequality. Induction then extends via an SDR avoiding the cut vertex's chosen color.

The line graph of a forest is a clique-block graph, with independent color-supported sets corresponding exactly to matchings of available base edges. Full ordinary minimum-cover optimality supplies the sum of vertex-cover numbers for EVERY core-edge subset because all such subsets are forests and every actual triangle has one core edge. Forest vertex-cover/matching equality converts these inequalities to the Hall hypotheses. The resulting proper edge-list coloring gives one actual page per core edge without shared spokes. The original core-edge cover gives the matching upper bound, so private nu=nu=tau=|C|.

No additional internal edge is silently allowed: the ENTIRE induced core must be a forest. The proof is a self-contained unit-weight reconstruction of the attributed Hall mechanism, not a claim that matchings form a matroid and not a claim of novelty. The weighted primary theorem is not needed for this conclusion.
