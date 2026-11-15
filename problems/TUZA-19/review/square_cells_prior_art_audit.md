# Bounded prior-art screen: square K4 cells

**Result: no obvious known-corollary containment was established by this focused screen; originality remains unresolved.** This is an attribution review, not a new mathematical audit of the target theorem. The earlier independent proof audit is `review/square_cells_fresh_independent_audit.md`.

## Frozen target and scope

Inspected `notes/global_routes_square_cells_matching.md`, SHA256 `1c59c9c58a0ba5b0ad9c5d90d3f0d1f3794b4300f7b28a06524da0f71ee39c2c`.

The target is ordinary Tuza, tau(G) <= 2 nu(G), for finite simple G whose actual triangles are uniquely owned by literal K4 cells. Each cell has a designated boundary C4 and two opposite diagonals; each diagonal is private to its cell and is never a boundary edge elsewhere. Boundary edges may occur in arbitrarily many cells. Its proof uses a two-internal-vertex auxiliary matching gadget and Tutte–Berge. It does not prove an odd-cover inequality or availability of this cell structure in arbitrary graphs.

## Primary sources actually inspected

1. Aparna Lakshmanan S, Csilla Bujtás and Zsolt Tuza, *Small Edge Sets Meeting all Triangles of a Graph*, Graphs and Combinatorics 28 (2012), 381–392, online 17 April 2011. [Publisher](https://link.springer.com/article/10.1007/s00373-011-1048-8). The primary abstract gives Tuza for odd-wheel-free graphs and for graphs whose edges admit three colors with each triangle rainbow, including all four-colorable graphs. The full subscription article was not inspected. The inclusion of K4 among the excluded odd wheels is corroborated explicitly in the later primary paper below. The locally saved publisher HTML is a successful HTTP 200 page with a cookie-related query suffix; it is not a full-article receipt.

2. The same authors, *Induced cycles in triangle graphs*, [arXiv:1410.8807v3](https://arxiv.org/pdf/1410.8807v3), 18 October 2015. Read Section 3.3, printed pages 23–25; visually checked Theorem 18 on printed page 24. The theorem proves Tuza when the triangle-intersection graph T(G) is perfect. Its proof replaces a clique of common-edge triangles by one cover edge, and a clique of K4 faces by two opposite edges. The note on pages 24–25 explicitly credits Puleo's larger class excluding only odd wheels with rim length at least five, and says the older odd-wheel-free result also excluded K4. This does not establish the target cell class: the example below has an induced C5 in T(G).

3. Gregory Puleo, [arXiv:1308.2211v3](https://arxiv.org/pdf/1308.2211v3), 13 April 2015. Inspected Proposition 4.8 and Corollary 4.11 with proof, printed pages 12–13. Corollary 4.11 assumes **no subgraph** isomorphic to an odd wheel W_n with odd rim length n >= 5, and obtains Tuza through weak König–Egerváry neighborhoods. This is not merely an induced-wheel exclusion. The square-cell example below contains W5 even as an induced subgraph on the original vertices, so this theorem does not contain the target class.

4. Penny Haxell, Alexandr Kostochka and Stéphan Thomassé, *A Stability Theorem on Fractional Covering of Triangles by Edges*, author manuscript dated 1 March 2010, [primary author PDF](https://perso.ens-lyon.fr/stephan.thomasse/liste/fractuza.pdf). Inspected Section 2, printed page 3. Their K4-structure starts with one K4 and adds each later K4 along exactly one existing edge, with its other five edges absent from the existing structure. Other vertex coincidences are allowed. This named gluing model is narrower than arbitrary cyclic sharing of the target's boundary edges. It is used in a fractional-cover stability argument; its definition alone is not an integral Tuza theorem for the present class. The example below cannot be ordered as such a K4-structure.

A brief primary introduction check of the already archived Munaro accepted manuscript concerned K4-free classes, which cannot contain any nonempty target cell system. No claim rests on secondary search snippets, theses, ResearchGate copies, or unrelated weak-saturation results. Tuza's 1990 full article was not available in this pass; earlier abstract-only inspection does not resolve its complete scope.

## Explicit scope controls

These are elementary ordinary deductions for comparing hypotheses, not claims of new graph constructions or a second proof of the target.

For any finite triangle-free simple graph J, construct F(J) by adjoining an apex a adjacent to all of J, then, for each uv in E(J), adding a fresh vertex b_uv adjacent exactly to a,u,v. Designate the K4 on {a,u,v,b_uv} as a cell, with boundary a-u-b_uv-v-a and diagonals uv and a-b_uv.

Every triangle containing b_uv stays in that cell. A triangle containing no fresh vertex must be a-u-v because J is triangle-free; it too belongs to exactly that cell. The two diagonals are private and never boundary edges elsewhere. Thus F(J) satisfies the exact target hypotheses. All its K4 subgraphs are precisely these cells: without a fresh vertex the largest possible clique has order three, and a fresh vertex has exactly the other three vertices of its cell as neighbors.

Take J=C5. Then:

- Its original rim is an induced C5, so F(J) is not chordal.
- The apex and original rim induce W5. Thus neither the original odd-wheel-free class nor Puleo's broader odd-wheel exclusion contains the target class.
- The five apex/rim triangles induce a C5 in T(F(J)), so the perfect-triangle-graph theorem does not contain the target class.
- The five K4 cells form a cycle of shared apex spokes. In any ordering, the last cell has both shared spokes already present, contradicting the exactly-one-old-edge condition of the Haxell–Kostochka–Thomassé K4-structure. There are no alternative K4 blocks available, as established above.

The three-edge-color rainbow class also does not contain the target class. In any such coloring of F(J), the color of a-v would give a proper three-coloring of J, because triangle a-u-v forces the two spoke colors to differ. Choose a triangle-free four-chromatic J, for example the Mycielski graph of C5. For completeness, this J has original vertices v_i on C5, clones u_i adjacent to v_(i-1),v_(i+1), and a new vertex w adjacent to all u_i. It is triangle-free. If it were three-colored, take w's color to be 3; all clones use 1 or 2. Recolor each original vertex of color 3 by its clone's color. Clone adjacency makes this a proper two-coloring of C5, impossible. A four-coloring is obtained by copying an original three-coloring to the clones and giving w a fourth color. Consequently F(J) has no rainbow three-edge-coloring. Moreover it contains the cone over J, so it is not four-colorable.

Under the usual linear-hypergraph convention, distinct hyperedges intersect in at most one vertex. Clique expansions with that restriction and no additional cross triangles have edge-disjoint cell cliques, whereas the target allows two shared cell vertices and a shared boundary edge. Their triangle packing/covering problem is additive in the edge-disjoint case; that observation does not establish the target with shared edges. No exact primary theorem covering arbitrary boundary sharing was located under the focused clique-sum, unique-K4, cell, or linear-hypergraph searches.

## What this does and does not establish

The checked class-containment shortcuts fail for explicit reasons. The published HKT K4 gluing definition is a real structural antecedent and should be acknowledged if discussing related K4-based arguments, while Tutte–Berge is classical and not an originality claim.

This pass did **not** exhaust older papers, all reducibility consequences, or all possible translations to matching theorems. In particular, failure of containment in the listed sufficient classes does not prove the new theorem has no known derivation. An exact prior statement was not located in the bounded search; label the proof as an ordinary result of this run with originality unresolved, not as a new published theorem or a verified novelty claim.

## Receipt and limits

The pass started at 2026-11-15T06:58:09Z and remained within the original TUZA-19 clock. Twenty focused search queries are preserved in `sources/square_cells_prior_art/web_search_receipt.json`; downloaded primary bytes and exact URLs are recorded in `download_receipt.json`. Selected excerpts and one rendered primary theorem page are retained in that directory. `inspection_receipt.json` records final hashes and completion time.

No author contact, publication, remote mathematical computation, finite census, Lean run, or new verification of the target theorem was performed. All filesystem work was on the authorized Darwin host. AI source review is distinct from human review and formal verification. Requested controls were Astra/Ultra; exact serving metadata was not independently exposed.

