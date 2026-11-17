> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent semantic acceptance of complete R2 source

Verdict: ACCEPT the reviewed source proof of exact all-size R2, subject to the still-required independent clean build, exact elaborated type/axiom audit and semantic controls. Reviewed hashes are in r2_final_semantic_hashes.json. This reviewer has not run a compiler at this stage.

## Exported theorem

Tuza23.r2 has arbitrary finite V with DecidableEq, H : SimpleGraph V and F : Finset (Finset V). Its only mathematical hypotheses are Nonedges H F, F.card<=2, B H and tau(triangles(addEdges H F))=2nu(triangles(addEdges H F)). Its conclusion is B(addEdges H F). This is exactly THEOREM_SPEC.md v1. No graph-order bound, component count bound, page bound, attachment condition, nonemptiness, optimizer witness, footprint condition, CS, M0, arbitrary finite certificate premise or unproved restoration hypothesis appears in this statement.

The proof first separates no-new-triangle, in which the complete triangle-family equality preserves B. In the new case, exact accounting forces F.card=2 and the two required optimum increments. It extracts distinct size-two sets from the finite set F, then partitions those into vertex-disjoint edges or edges with a common endpoint. The latter gives three distinct endpoint labels because the two edges are distinct. Nonedges discharges the absent-adjacency requirements in both branches. This covers zero, one and two inserted edges without an ambient vertex enumeration.

## Adjacent case and page geometry

edges_disjoint_of_common_vertex correctly says any two vertex sets whose intersection has at most the specified single vertex have disjoint unordered two-edge families. adjacent_pages_same_apex uses actual old adjacency to exclude an ordinary page apex being the opposite new endpoint. If two distinct page apices were used, only the common base endpoint could be shared, contradicting edge intersection. There is no restriction on the other ambient vertices.

adjacent_tight_impossible derives bare ordinary pages from exact tau, not as an extra theorem premise. The universal page-versus-bare intersection consequence forces all ordinary pages of both kinds to one apex x. If the third endpoint edge bc existed in H, actual old triangle bcx would support a bare spoke. Thus bc is absent; the proof separately checks that bc is neither of the inserted pairs, excluding a triangle using both new edges. Every remaining new triangle is hit by ax; old minimum cover plus ax costs at most 2m+1, contradicting the derived 2m+2. It has not silently discarded two-new-edge triangles or arbitrary old background edges.

The disjoint page geometry proves membership of each apex in the opposite base using actual unordered support intersection. no_triangle_two_disjoint_edges is the exact cardinality obstruction: two disjoint two-element edges cannot fit in a three-vertex actual triangle.

## Four-set and disjoint case

four_set_opposite_subset, opposite_pair_covers_four_set and four_set_triangle_contains_opposite_of_missing are symbolic finite-set cardinality arguments. They do not enumerate graph orders or assume an ambient K4 before proving it. The underscore-prefixed size-two hypothesis in the first helper is redundant locally, not a missing proof; its callers need size two to turn the opposite set into an edge.

DisjointRestoration obtains two fixed bare pages and uses each against EVERY ordinary page of the other kind. All ordinary apices are therefore forced into the opposite pair. Together with impossibility of a two-disjoint-new-edge triangle this proves that ALL actual new triangles lie on S, the four endpoint vertices.

For any missing G edge inside S, every actual triangle in S contains its opposite pair. Adding that pair to an old minimum cover saves a cover edge, contradiction. Thus S is a literal actual K4. This is a faithful compression of the source's missing-cross-edge case; it proves a general four-set fact instead of enumerating presence patterns.

If any S edge were in old triangle support, componentCliques_min_cover_containing chooses an old minimum cover including that edge. Its opposite pair, added to that cover, hits all new triangles, again too cheap. Hence the ENTIRE S edge support is disjoint from old triangle support, not merely from a selected old packing or cover.

componentCliques_add_disjoint_K4 lifts all old literal cliques into G and inserts S into their exhaustive decomposition. Edge independence uses full old support, while exhaustiveness splits each ACTUAL G triangle into old/new. Therefore crossing triangles and arbitrary vertex sharing are accounted for. Its intermediate hypotheses are all proved by DisjointRestoration before the final R2 theorem uses the result. It is not an assumed restoration axiom.

## Separation from M0 and scope

R2's import closure contains the historical MinimalObstruction module because GraphAPI uses its Good bridge and no-new-triangle helper; this does not mean the theorem assumes MinimalCS. Its proof uses unconditional component preservation, clique choices, augmentation and cover bounds. The separately authored Tuza23.M0 module is not imported by R2. The final type contains no minimality premise.

No change to the ordinary mathematical statement was exposed. The generic opposite-pair lemmas are a proof organization refinement, not a new hypothesis or stronger advertised conclusion. Exact R2 remains equality restoration, not full CS after arbitrary two-edge insertion. Universal Tuza, universal CS and blocker existence are not established by it.

## Type-level contract guard recommendation

Include a positive exact-type assignment with precisely the frozen binders. A negative fixture may attempt applying r2 with Nonedges, cardinality and augmented tightness but no B H; require a type/elaboration error at the missing B argument. This establishes that the exported API requires the old B premise. It does NOT prove mathematical independence or falsity of a theorem with that premise removed. The same caveat applies to missing Nonedges or cardinality guards, since some strengthened variants may themselves be true. Keep expected-negative fixtures out of accepted proof imports and record their actual diagnostic scope.
