> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent disjoint third-triangle partial payment review

Status: ACCEPTED ORDINARY for zero or one K5-e peripheral in U. The two-peripheral case remains separate. No resilience or connectedness of the double residual, minimum-Q property, computation or Lean verification is used.

For every ordinary U two-packing, the whole old-clique footprint is a star of at most two edges, because an old clique cannot contain two U terminals. Thus a full old packing avoids it. All C spokes are old background, so the old packing is edge-disjoint from every C packing. If the selected U pair has at most one C edge in its footprint, a maximum packing of the literal single-edge-resilient K5-e avoids it. Combining gives m+4, contradicting the supplied m+3. This argument keeps arbitrary old shared vertices and other background edges.

If U avoids both peripheral vertices, its terminals are all outside C. Every ordinary page has at most one C vertex, hence no C edge; the q_U=2 pair immediately contradicts the preceding bound.

For U=xde, only xd/xe pages with core apices a,b,c can meet C, and each has exactly one edge xz there. Every two-packing must therefore have pages on both bases with distinct core apices. Fix xda,xeb. A de-page with apex z!=a is edge-disjoint from xda; for z=a it is edge-disjoint from xeb. These pairs have at most one C edge, excluding every de-page. An xd or xe page with any other apex similarly pairs with the fixed opposite-base page and is excluded. The remaining apex sets are nonempty and disjoint: a common apex would create an actual de-page from its two old spokes. Inside a three-element core, one set is a singleton. The displayed C cover through its spoke, plus the opposite U base, covers all new triangles with four edges. A V/U mixed triangle is impossible because their terminal triples are vertex-disjoint. Adding an old minimum cover saves one as claimed.

Thus any still admissible disjoint restoration must have U=xyd and restore the missing peripheral edge. A literal K5 glued to K4 is an admissible local control, so this remaining interface is not excluded by the present argument. Its full-family classification and the subsequent actual SINGLE-residual strict restoration require a separate proof.

Bound source: notes/actual_parent_triple_disjoint_partial_v1.md, SHA-256 8ab651495634eacd6f2c37b5adf8473526d3030ce651c572edc73effc85313c7.
