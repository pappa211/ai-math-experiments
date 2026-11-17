> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh challenger review: triangle plus disjoint matching minimum cover

Verdict: ACCEPT as an ordinary all-size theorem at the stated minimum-cover shape. No unresolved mathematical objection found. I reconstructed the argument independently from the frozen source, then checked its book-restoration dependency. This is internal AI review, not Lean verification or a novelty claim.

Every actual triangle contains a cover edge. Vertex disjointness of the matching bases and the terminal triangle prevents a triangle from containing two matching bases or one matching base together with a terminal edge. Two terminal edges force the terminal triangle itself. Thus the family partition into matching-base books and the complete terminal-page family is exact, including all possible crossing triangles.

For one triangle selected from every matching-base book, any edge intersection requires reciprocal endpoint choices between two matching bases. A selected apex lies on at most one other base, so every selection has conflict degree at most one. Appending the terminal triangle is always valid: it shares no edge with any matching-book triangle, even when a book apex is a terminal.

The terminal family needs at least three cover edges, because a two-cover together with the matching would improve the assumed minimum cover. A pairwise-edge-intersecting actual triangle family is a book or lies in a K4, and has a two-cover, so this family has a packing of two.

Universal perfect-selection rigidity is sound: fix a triangle from book i; its unique possible partner book j must have every choice intersect it. Fixing one j choice then forces every i apex into the j base, and reciprocally all j apices into i's base. This pairs whole books. Three cross edges give two triangles sharing a cross edge and allow replacement of two cover bases by that edge. Other matching-book triangles cannot contain either removed base, and terminal pages remain covered by the terminal edges. Minimum-cover optimality therefore excludes that case, leaving literal K4 families.

For even r, either a selection has at least two isolates and supplies the larger packing immediately, or all selections are perfect and the rigid K4 families are edge-disjoint from the terminal family. Both yield strictness. The empty matching r=0 is included.

For odd r under equality, every selection has exactly one isolate. If every book apex belongs to a matching base, all book support avoids the terminals and adds to a terminal two-packing, contradicting equality. Thus a triangle with apex outside every matching base exists; it is isolated against every book choice. Fixing it forces all remaining book selections to be perfect. Their supports are fixed K4 pairs, disjoint in edges from the remaining book even if it shares vertices via apices. After deleting the terminal triangle, every actual triangle belongs to these K4s or the one remaining book; there is no unclassified crossing triangle. The already independently reviewed book-residual triangle restoration theorem therefore applies exactly and forces the remaining book to complete to K5.

The inequality, parity strictness, and equality description follow. The k4/n13 exclusion additionally needs the separately stated eight-edge-cover endpoint kernel; it is not an unconditional graph-order bound.

Checked dependencies: notes/book_residual_triangle_restoration_v1.md and review/book_residual_restoration_independent_review.md; matching-book rigidity was reconstructed directly rather than imported as an unexplained assertion.

Reviewed source SHA256: 34cd1e06b0d49684979f4ba0f89c0e0954fc15e917b2629260431058840512b9
UTC: 2026-11-15T22:34:59.397217+00:00
