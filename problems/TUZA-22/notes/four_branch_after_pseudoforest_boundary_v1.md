> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Four-branch parity boundary after apex-pseudoforest exclusion

Frozen ordinary boundary deduction, 2026-11-16. This is not a replacement proof for the remaining finite four-branch interface.

Let L be a closed connected link component of a minimum combined-CS failure. Assume it has exactly four vertices of degree at least three. Suppress the degree-two interiors of threads. The reviewed parallel-thread theorem excludes returning loops, two nondirect paths on one branch pair, and direct plus odd nondirect pairs. Thus each branch pair has zero, one, or two core edges; a double is necessarily one direct edge plus one even nondirect thread.

Assume the surviving domain has at most three even nondirect threads in total (the earlier many-even-thread theorem treats the larger domain). Then the underlying simple branch graph must be K4, and its doubled pairs form exactly one of

    two disjoint pairs (2K2), a triangle (K3), or a path on four vertices (P4).

In the first case at most one of the other four single paths may be even. In the last two cases all remaining single paths are direct or odd nondirect. Thread lengths remain arbitrary at their specified parity.

## Proof of the reduction

Delete a branch vertex w in the actual link. Interiors of threads incident with w become dangling paths and create no cycles. Every cycle of the remaining graph is therefore represented in the three-vertex core on the remaining branch vertices. The new apex-pseudoforest exclusion says that this remaining graph is not a pseudoforest. Since any pair supports at most two paths, a multicyclic component on those three branch vertices must contain all three vertices and at least four core edges counted with multiplicity. Consequently EVERY triple of branch vertices has total pair multiplicity at least four.

Let q be the number of doubled pairs. It is at most three by the even-thread bound. If q<=1, some branch triple has no doubled pair and at most three edges, impossible. If q=2, the doubled pairs cannot share a branch vertex: the other three vertices would have no double. Thus they are disjoint. Every branch triple then has exactly one double, so all its three underlying pairs must be present. All six pairs are present globally.

If q=3, the doubled-pair graph on four vertices is a triangle, a star, or P4. A star leaves its three tips with no doubled pair and is impossible. In the triangle case, each pair from the fourth vertex lies in a triple with exactly one double, so that pair cannot be missing. In the P4 case, label the doubles ab,bc,cd. Missing ad would leave triple abd with only three core edges; missing ac would do the same to acd; missing bd would do the same to abd. Thus all remaining underlying pairs are present here as well.

These arguments prove the claimed exact structural reduction. The restrictions on additional even single paths follow immediately from the total bound of three even nondirect threads.

## Why bipartite-residual matching alone does not close the boundary

A useful ordinary exclusion certificate is a perfect or near-perfect matching P such that L-P is bipartite. A minimum vertex cover of L-P then has size at most |P|, so the tuple is WKE; the reviewed no-bipartite-residual theorem excludes it. This observation supplies certificates for some reduced states, but not uniformly.

Already the three-sun consists of a core triangle abc and vertices x,y,z with neighborhoods {a,b},{b,c},{c,a}. No matching meets every actual triangle. To hit abc it must contain a core edge, say ab. Then triangle bcy forces cy into the matching, because both other choices meet b. Triangle caz has no edge disjoint from ab and cy. Therefore removing a matching cannot make the three-sun triangle-free, let alone bipartite. The triangle-of-doubles boundary can contain this exact configuration.

This is an obstruction to a proposed certificate mechanism, not a CS counterexample. Other balanced reductions and the accepted finite four-branch certificates may still exclude these states. No ordinary all-four-branch promotion is asserted by this note.

Dependencies: `notes/apex_pseudoforest_full_exclusion_v1.md`, SHA-256 `a4329ae4b512eb74e7efbf016e9299e756309052876a876dc6ad11cc82846ceb`; `notes/parallel_thread_link_exclusion_v1.md`, SHA-256 `6eec22bff2400c5a3c07a43d41649a7b8e0d6e08f31d23c8e6e020c6f82718c4`; and the explicitly declared at-most-three-even-thread scope supplied by `notes/four_branch_many_even_threads_v1.md`. The core reduction and three-sun obstruction above are ordinary arguments, with no computation.
