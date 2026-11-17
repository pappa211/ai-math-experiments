> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh reconstruction of red-book tree rerooting

Reviewer: restoration agent, 2026-11-16. Result: ACCEPT at the stated parameterized scope, with the attachment limitation retained.

Reviewed `notes/red_book_tree_rerooting_v1.md`, SHA5b33930813c67689a5dc98662a7f267c8490e00621ae51b3f8e3d71a9f38020e. I also read the exact book-cover count and the elementary exchange reconstruction in `hd_wang_book_defect_count_v1.md` and `hd_wang_full_survivor_exclusion_v1.md`.

The auxiliary graph is genuinely a simple pseudoforest: a repeated unordered edge would give two paired books with the same four blue cross edges, and outdegree at most one bounds each connected component to at most one cycle. An auxiliary triangle would supply three disjoint red bases and all blue cross pairs, hence an actual all-blue triangle. The directed/root count includes missing-opposite paired spines and singleton spines correctly.

A diagonal flip preserves the UNION of the four blue book edges and only repartitions it between P and Q. Every other book and singleton support is disjoint from that union, and the newly used opposite was unused. Thus both packings, maximum size k, survivor size q, blue disjointness and the singleton blue set W all persist. In an unused-root tree, the outdegree sum forces a unique zero-outdegree root, no singleton spine and no missing-opposite paired spine; reversing the unique path moves that root without changing any K4 support.

After rerooting at c, any actual red-c triangle avoiding W misses all singleton triangles and all used red spines. If every paired book had a page avoiding it, independent choices plus the singletons would give a maximum packing disjoint from that triangle, contradiction. Therefore it meets both pages of a book, and the elementary actual-edge geometry makes it exactly one of that book's opposite pages. The converse holds because every incident K4 has unchanged blue support disjoint from W. This proves the full identity for ALL actual pages, not merely selected ones. Since singleton red spines are outside the tree, deleting all singleton triangles has exactly the claimed effect.

The support-subgraph statement is also sound: every edge in its K4 union is either one of the tree's red bases or a displayed blue edge, so every actual triangle inside that subgraph is covered by the page identity. No isolation from outside triangles follows.

For the count, each nontrivial unused-root tree contributes r paired slots and one distinct unused opposite, hence r-1 to q-g; if r>=2 then r<=2(r-1). Other components contribute their entire paired-slot count to q-g, including an isolated missing-opposite paired spine. A one-edge unused-root component is exactly the regular case. Summing proves the bound2(q-g), and the previously proved singleton cover count gives2(s-1) at its stated strict-H-D hypotheses.

I manually checked the seven-vertex guardrail's complete triangle list, exact-one minimum cover, packing upper bound, P/Q blue disjointness, auxiliary edge and extra04-page through blue02. It correctly prevents promotion of regular slots to actual B components. The guardrail has s=0 and is not claimed to satisfy the strict-H-D hypotheses needed for the parameter bound.

No new computation or external theorem was used in this review. The remaining uncontrolled blue-edge attachment boundary and missing survivor lower bound are material and remain explicit.
