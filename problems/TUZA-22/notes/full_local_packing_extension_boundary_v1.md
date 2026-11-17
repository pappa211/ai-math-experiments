> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Full local packings do not absorb arbitrary partial choices

Ordinary literal boundary, source_audit, 2026-11-16. This guards the original H-D full-page conflict-parity approach. No computation or external theorem is used.

Let the selected base graph be the path 0-1-2-3. Add two independent vertices a,b, each adjacent to all four path vertices. There are six vertices, eleven edges and exactly six actual triangles: one a-page and one b-page on each of the three bases. The selected base cover C has size three.

The three pages a01,b12,a23 pack, so nu=3; the base cover gives tau=3. Every actual edge belongs to at most two triangles. Therefore EVERY minimum cover of size three covers the six triangles without any overlap: each of its edges must cover exactly two distinct triangles. In particular every minimum cover is exact-one.

Every page extends to a full three-page packing: alternate the apex names along the base path, starting with the chosen page's prescribed apex. After deleting any actual triangle T, the other two members of that packing survive, while C minus T's unique base covers all surviving triangles with two edges. Thus both residual parameters equal two, and local cover-drop-one holds for every triangle.

Nevertheless the two pages a01 and b23 are edge-disjoint and form a maximal packing of size two. Neither page on the middle base can be added: a12 uses a1 from the first page, and b12 uses b2 from the second. A second page on either outer base conflicts on that base. Hence this partial packing does not extend to any full three-page packing, despite every individual page extending.

Consequently, when a global maximum packing is restricted to one selected component family, one cannot automatically complete that partial restriction to a full local base packing. This failure already occurs with forest bases, all minimum covers exact, full local packing, and both one-triangle deletion equalities. It does not refute the proved existential forest anchor or unicyclic full-packing lemma. It identifies the simultaneous-extension premise that a future global conflict-parity argument must supply or avoid.

This local example has one-edge packing blockers and is not an original-H-D near-tight candidate. It is not being promoted to the earlier maximum-private-packing extension counterexample; the two-page partial choice is not maximum in its local family.
