> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Independent actual common-four-neighbor review

Reviewer: separate AI `review` agent, not the author of these modules. UTC snapshot: 2026-10-30T19:50:15.161854+00:00. All source inspection and retained artifacts are on the external verification server.

PASS: no material mathematical defect, private-label omission, or hidden outside-attachment condition was found. `minimal_no_four_common` is an actual universal graph theorem: the only mathematical inputs are MinimalObstruction, two actual degree-five vertices, their distinctness and nonadjacency, and common-neighborhood cardinality four. It is not conditional on a canonical pattern existing. The successful exact-type/axiom log is `logs/compile-194424-Tuza06.OverlapFour.log`, with only `propext`, `Classical.choice`, and `Quot.sound` in its transitive axiom report. Current source hashes match its recorded top source hash. Final frozen-source reproduction and replay remain separate steps.

| Source under lean/Tuza06 | SHA-256 |
| --- | --- |
| `OverlapFour.lean` | `085fbe07e42481dc2783d85f2ce7a77d9440ea10dadc1700daadbc85d37fd780` |
| `OverlapFourTools.lean` | `f9d52c23ac994600347ecbbeee91275deb69e1970167cfdf30a7fa991fdecb52` |
| `OverlapReorder.lean` | `4e0bc65000f8b7c05b148819f07de28cea7a107183368bf862a2bd9ae5e6a688` |
| `OverlapFourFinite.lean` | `89ac96c70097d748911841849a45c8ab4998e48118ddd16c3a10e14a5c2da27a` |
| `OverlapFourNear.lean` | `6f005f969c3dc868edf80a15606e2ef5dd41f90b21630df0cb66eb0561feb633` |
| `OverlapFourClique.lean` | `6adf070ed9c35a5d305e243e3af15d98bd4a860655a456a4cc3f1f3548f54d49` |

## Actual private vertices and distinct labels

`four_common_private_vertices` subtracts the actual four-element intersection from each actual five-element neighbor set, proving both differences are singletons. The private vertices are constructed from these cardinality-one differences, rather than supplied as arbitrary named labels.

The first private vertex p belongs to the first center's canonical neighbor labeling. `fourPrivateOrder` exhausts all five possible positions, fixes the hub, moves p to label five, and is proved injective with an explicit inverse. Its exact neighbor-set and edge-set relabeling equations are proved. In a near core, if p was an endpoint of the original missing edge, the missing edge becomes {4,5}, so the common four-neighbor set is a clique. Otherwise the missing edge remains {1,2} inside the common set. Complete-core relabeling preserves every edge. Thus every position of the unique missing edge relative to p is covered.

`shared_four_data_of_private` proves the second center's COMPLETE actual neighbor set is precisely the first four old neighbor labels plus q. The second center y is outside the old core because it is distinct and nonadjacent to the first hub, while every other old core vertex neighbors that hub. The second private vertex q is also proved outside the old core: it is outside the first hub's neighborhood by its set difference, and it cannot be the first hub because the centers are nonadjacent. It differs from y because q actually neighbors y. Since p is an old core vertex, q also differs from p. These proofs justify the eight-label injection with no hidden coincidence case.

## Realization and arbitrary q-spokes

`shared_four_embedding` extends the actual six-label injection by y and then q, preserving all original labels through a checked reordering. `shared_four_lower_edges` verifies all old core edges and all five actual y-spokes directly from exact neighborhoods. It imposes no adjacency or nonadjacency at q beyond its required spoke to y and its exclusion from the first center's neighborhood.

The generic `shared_four_realizes` uses `hRule` only to account for pairs absent from the finite Upper graph. Such a pair must be a loop, xy, xq, yp, or the specified genuinely missing old common edge. Each is proved absent in the actual graph from irreflexivity, the exact neighborhoods/set differences, or the actual core edge equation. All other pairs, including unknown q-to-common-vertex edges and pq, are permitted in Upper. Thus the finite upper graph is an over-approximation of actual local adjacency rather than an unproved induced-core restriction.

Both deleted-center neighborhood bounds are derived from the actual exact neighborhoods. Every triangle incident with either center therefore lies in the eight-label image and is covered by the proved generic multi-center reduction. Noncentral vertices may have arbitrary additional neighbors outside this image. The finite lower graph is used only to certify selected actual triangles; no missing edge from the lower graph is assumed absent in G.

## The two reductions and near-private case

When the unique old missing edge lies inside the common four-set, the near pattern has a four-packing and a seven-cover and is immediately strict. The four packed triangles are realized using actual core/common edges.

When the common four-set is complete, the clique pattern has a balanced four/eight reduction. A fifth selected triangle uses p over a common edge. Its actual existence is checked from the full core, or from the near core whose only missing edge touches p at the fourth common vertex. The finite `four_last_P` and `four_last_Aug` checks explicitly show that every selected triangle avoids that missing edge. Therefore the same augmentation is valid for both a full old link and the near link with a private-endpoint missing edge; no assertion that the whole old link is a clique is needed.

Deleting all common rim edges makes those four vertices independent in the residual. The fifth triangle's surviving footprint is only the two spokes from p to its base endpoints. The terminal-star augmentation theorem constructs a compatible maximum residual packing in arbitrary K4/K5 blocks. Exact balanced accounting then gives the contradiction.

The final theorem first obtains the actual private singleton sets, relabels p by all five cases, constructs SharedFourData, and invokes the appropriate complete/near reduction. No private-neighbor adjacency, forbidden attachment, or pattern realization remains an extra hypothesis of `minimal_no_four_common`.

This resolves the universal common-four-neighbor case. The common-three-neighbor clique conclusion and the global assembly remain separate milestones until proved and checked; this review does not infer them from the canonical pattern files.
