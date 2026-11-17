> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: deficient triangle-component normalization

Decision: ACCEPT, ordinary existential cover normalization in a minimum CS failure.

Frozen source: notes/challenger_triangle_component_normalization_v1.md
SHA256: 5890b72f5bbe2157626e0f41c8576fe70e7379a427fa4cee7ae7dc8957b0e9c2

The component-assigned triangle family has ordinary cover number3: a smaller family cover would replace its three C edges in a smaller global cover. A triangle cannot use C edges from different cover components, since any two triangle edges meet. Inclusion-minimality forces a private page on each base.

The three apex lists are nonempty. An apex occurring on two bases occurs on all three by actual graph closure. A three-page packing is exactly an SDR for these lists. If no SDR exists, the only Hall failures are a two-list union of size1 or a total union of size at most2. The former admits the explicit two-cover consisting of the opposite base and the common-terminal spoke. The latter, combined with private packing at least2, forces exactly two full apices and no others. The preliminary packing-at-least2 uses the already accepted elementary pairwise-intersecting actual-triangle lemma; including the core triangle preserves pairwise intersection when all private pages intersect.

The exchange {ab,ac,bc}->{ax,ay,bc} covers the entire assigned family and removes no edge needed by any other assigned family. The bc component becomes isolated. The new x-a-y path creates a triangle component only when x,y were the two endpoints of an old isolated selected edge xy; every other attachment either remains nontriangular or enlarges/merges old components. Thus minimizing the number of literal triangle components has exactly the stated exceptional placement.

In that exception the five vertices form a literal K5. No core base has an outside page by the exact two-apex classification. An outside page on a core-apex spoke would have all three edges outside C: neither core terminal nor apex has another selected neighbor. Thus the entire outside-triangle boundary is contained in xy. The safe classified-patch lemma applies to that actual boundary; a K5 maximum packing avoiding xy exists, and a shared boundary edge saves a cover unit in the tight residual case. This excludes the exception in a minimum CS failure.

The resulting assertion is existential over an extremal minimum cover. It does not say that normalization preserves an all-triangle shape: the exchange can create forest or larger components, which remain genuine obligations. The newer supplied-three-page compatibility theorem strengthens the source's final all-q3 observation to strictness, but does not change this availability limitation.
