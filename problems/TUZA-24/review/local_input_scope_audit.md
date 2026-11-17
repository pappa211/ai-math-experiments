> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Source-level scope audit of additional public local inputs

Status: usable statements identified; final independent rebuild and actual declaration audit still required. This review does not assert that copied or new TUZA-24 modules have compiled. The public source identities and complete local import closure of the four entrypoints are in public_local_input_closure.json (30 local modules). The lexical scan strips comments and strings; no forbidden proof escape token was found in that source closure. This is a source scan, not a substitute for inspecting elaborated declarations and collected axioms.

| Input | Exact mathematical premise | Conclusion and relevance |
| --- | --- | --- |
| UniqueEdge.minimal_edge_two_triangles | MinimalObstruction G and an actual G edge A | Two distinct full actual graph triangles containing A; no bound on degree/order or outside vertices |
| SmallLinks.minimal_link_two_neighbors | MinimalObstruction G, LinkClosed G v C, a in C | Two distinct C-neighbors of a |
| SmallLinks.minimal_closed_link_size | MinimalObstruction G, LinkClosed G v C, C nonempty | At least five active vertices in C |
| Reducible.reduction_witness_packing / reduction_witness_cover | Actual ReductionWitness G U X P | Packing lower bound and cover upper bound for actual removed graph |
| Reducible.minimal_balanced_reduction | MinimalObstruction, reduction witness, nonempty P, exact cost 2|P| | Exact residual equality and ComponentCliques, with proper-subgraph Good proved first |
| MatchingReduction.minimal_link_matching | MinimalObstruction G, full LinkMatching G u M Q, M nonempty, |Q|≤|M| | Exact packing loss |M|, residual equality, residual ComponentCliques |
| SmallLinksOperations.minimal_balanced_removeEdges | MinimalObstruction, actual removed edge, packing support deleted, cover cost≤2|P|, exhaustive loss cover | Proper residual Good, exact accounting and residual ComponentCliques |

MinimalObstruction is literally failure of unrestricted Good together with Good for every strict edge-subgraph on the same finite vertex type. Good is equivalent to unrestricted CS. Its separate theorem minimal_obstruction_degenerate has an extra degree hypothesis, but the definition and the input theorems above do not. The forest-cover heredity theorem must supply the class-local premise before using these inputs.

LinkClosed requires all C vertices to neighbor the hub and every link neighbor of C to remain in C. It does not require connectivity; each actual connected link component is one permissible instance, and the full neighbor set is another. The small-link exclusions therefore permit other link components and arbitrary external pages. UniqueEdge and SmallLinks proofs obtain actual triangles, use actual deleted-edge residuals, and invoke previously proved clique decomposition/avoidance facts.

LinkMatching has actual 2-clique members, full-neighbor containment, vertex-disjoint matching members, and a cover disjunction for every actual edge of the full link. It does not presume Q disjoint from the matching or from its endpoints. The residual graph deletes every edge incident to the hub and every edge in M union spokes(u,Q). All outside pages on M are covered directly by their removed base; they are not discarded from the triangle quantifiers. The reduction's X may contain redundant nonedges, so an eventual actual GraphCover adapter must trim Q to genuine hub neighbors.

The public GraphPeeling import contains a separate degree-conditioned peeling theorem and is imported by MatchingReduction for peelNeighbors. The presence of this unused conditional theorem is not a degree premise in minimal_link_matching. Likewise Statement contains the historical degree-conditioned CombinedStatement definition; final targets must retain Tuza23.CS. The elaborated dependency audit will establish the actual constant-reference closure and distinguish these declarations from used premises.

No external Aharoni–Haxell/HNS statement, matching oracle, general WKE-to-CS bridge, census total or unproved forest-cover availability premise appears in the reviewed theorem types. The full forest theorem still requires the actual all-size forest matching and perfect/nonperfect augmentation proofs; these local inputs alone do not imply it.
