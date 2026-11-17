> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: rank-two cover Tuza corollary

Source_audit,2026-11-16 UTC. Verdict: ACCEPT corrected v2, retaining the inherited finite premises.

Source: notes/challenger_two_cycle_cover_tuza_v2.md,
SHA256 8a086bbf8276250c9af094c17ed6a08f1170cebf7eba70550e33b15ac84840cd.

The class is existence of ANY triangle cover of TOTAL cycle rank at most two, not a minimum-cover-shape class. Restriction under deletion preserves the cover and cannot increase cycle rank. Removing a selected cycle edge lowers rank two to one. The accepted rank-one CS theorem then either gives a strict residual bound that extends to Tuza, or a B residual. In the latter case any new triangle appends to an old maximum packing because its two spokes occupy at most one edge in any old clique; this gives strictness. If no triangle is created, B is unchanged. The claimed equivalence with adding at most one edge to the rank-one-cover class also checks.

For a non-B tight G, all such selected cycle-edge deletions must consequently have nu unchanged and tau lower by exactly one. No equality classification of rank two follows.

I flagged the original v1 phrase EVERY VERTEX in its final selected-degree assertion: an isolated vertex has no nonempty link to contradict. V2 explicitly says EVERY NONISOLATED VERTEX and permits discarding isolates. At that corrected scope, the link lies inside the selected cover, has minimum degree at least two, and each connected component has cycle rank at most two. The degree-excess identity gives at most two branch vertices, so the accepted ordinary small-branch exclusion applies.

The main inequality and residual statement inherit the2018/2422/8220 finite interfaces only through rank-one CS. The selected-degree-zero exclusion itself uses ordinary class-local minimality and the ordinary small-branch theorem. No new computation or unrestricted availability claim is introduced. V1 is preserved and the isolate qualification is the only correction needed.
