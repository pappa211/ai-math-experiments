> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent ordinary review of the strict H-D survivor restrictions

Coordinator,2026-11-16 UTC. ACCEPT after reconstructing every book and endpoint case:

- notes/hd_wang_full_survivor_exclusion_v1.md, SHA256 a18dd329e75dd4eaafd17d6584a59792641b3df0adbf3794e58d5eea565e97df.
- notes/hd_wang_one_missing_survivor_exclusion_v1.md, SHA256 cfc29f82836f59fddd6e2463f07dd7f1859c002b88690f0325975f0c7d2343d5.

Under nu(G)=k>=2, tau(G)=2k-1 and tau(G-E(T))=2k-2 for EVERY actual triangle, every minimum cover C is exact-one. For ANY maximum packing P, deleting its2k non-C edges leaves packing number at mostk-2.

For q=k, paired book supports are disjoint and every independent page choice is maximum. Essential unused reds force at leastk-1 good opposite-edge books. When all are good, an arbitrary third spine page must meet both pages of another good book, contradicting its opposite-edge color. A residual deletion then saves two cover edges. With exactlyk-1 good books the opposite-edge map is bijective, so an unused red has exactly its two opposite pages globally, giving the same forbidden saving.

For q=k-1, the remaining singleton T0 supplies the complete exception. Residual-cover minimality gives each unused red a page avoiding T0, forcing every paired book good and the opposite map bijective. Clean opposite pages are exactly the two in its K4; each unused opposite therefore needs a dirty page meeting T0 blue. Its one endpoint in T0 forces both spine endpoints outside T0: a spine endpoint there would make a cross blue book edge either red in T0 or overlapping T0 blue. Thus no spine page meets singleton blue. The Wang exchange says every third spine page must do so, leaving exactly two global spine pages and a two-cover-edge residual saving.

The full actual family, all independent page choices, and every outside page are accounted for. No arbitrary partial-packing completion is assumed. The published elementary exchange is attributed and reconstructed; neither its global bound nor reported Lean formalization is imported. Residual packing equality is unused. The remaining survivor regime<=k-2, two-edge blocker and unrestricted H-D remain open.
