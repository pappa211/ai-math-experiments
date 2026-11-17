> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: pseudoforest cover reduction to a spanning two-factor

2026-11-16. **ACCEPT as an ordinary necessary-condition theorem.** Reviewed source: `notes/coordinator_pseudoforest_cover_two_factor_reduction_v1.md`, SHA256 `d6410115d97b1c436b4c5456f9f024411be4e14e93d708d0d05375b16bb27088`.

The zero-degree case uses the actual triangle-cover property: every link rim edge must be selected because neither hub spoke is selected. Nonisolated minimum-CS vertices have nonempty links by codegree, and each connected link component has minimum degree two. A connected pseudoforest with that degree condition is exactly a cycle, already excluded.

The leaf case needs only the closed component containing the selected neighbor w. Every edge of L−w is selected, so it is a pseudoforest even when C has arbitrarily many components or the component L−w is disconnected. The new ordinary apex-pseudoforest theorem applies at precisely that closed-component scope with all outside attachments retained. No assumption that C is a minimum triangle cover occurs.

After these cases are excluded, every selected component has minimum degree two and at most as many edges as vertices, forcing equality and degree two throughout. Discarding isolated G vertices at the outset is explicit and sufficient. The asserted class-local minimality scope is hereditary under graph-edge deletion as required by the imported reduction theorem.

The stated C5 and K3-plus-edge K5 examples correctly block an unsupported K5-free conclusion. The result is only a spanning-two-factor restriction for a hypothetical minimum CS failure; it is neither equality classification for all pseudoforest-cover graphs nor a global cover-availability statement. No finite certificate enters this reduction.
