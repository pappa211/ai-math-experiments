> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: weighted private-tree component lemma

Decision: ACCEPT as an ordinary scoped proof. Reviewer: TUZA-22 challenger, 2026-11-16 UTC. Reviewed primary: notes/private_tree_component_weighted_v1.md.

The hypotheses ensure that every lost triangle after removing a subset S of the tree bases is a private page on S. Color-by-color spoke covers therefore give the stated Hall inequalities; duplicate physical spokes only lower the cost and cannot invalidate the inference from ordinary minimum-cover optimality. The forest list-coloring theorem applies exactly.

I checked all residual endpoint cases. A private page's spokes are outside C, so another selected base cannot equal one. Same-apex selected pages are disjoint because their bases form a matching. Different-apex pages can conflict only on the edge joining their two apices, with reciprocal base containment. At a fixed spoke, two conflicting pages would have the same opposite apex and incident bases, contradicting proper coloring. This proves degree at most two. An outside apex cannot lie in another tree base, so every external page is isolated.

On a conflict cycle, the two different neighbors of each page occupy its two different spokes, forcing exactly the displayed base between the neighboring apices. The step-two walk has distinct tree edges because all selected bases are distinct. Repeated apex vertices do not matter: a nonempty closed trail with no repeated edge is impossible in a forest. The even-cycle parity split and the smallest cycles are therefore all covered.

Selecting a maximum independent set in each internal path and every external isolated vertex gives the stated weighted bound and the exact odd-internal-path surplus. The remaining two-C-triangle chord-book obstacle is outside the hypotheses and is explicitly retained. No arbitrary maximal-packing or general TREE statement has been inferred.
