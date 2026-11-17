> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Initial independent semantic review

Reviewer: tuza24_review. Status: frozen specification v1 ACCEPTED at the source semantics level. No TUZA-24 proof completion or compilation is asserted. No compiler process has been invoked by this reviewer. The original mission clock remains 2026-11-16T09:49:08Z; this review does not reset it.

## Specification and interface acceptance

Reviewed THEOREM_SPEC.md SHA-256 `01c6ccd96320f3402c0220886abf5fbe2bd674c6ea6f94385e523f264e013232` and Tuza24/MatchingAPI.lean SHA-256 `e6e25fe100c6369c865dda5b98d16d74b074d290b12627b69f394bc7710025a6`. Full file identities are recorded in initial_semantic_source_hashes.json.

The specification faithfully states full forest-cover CS for arbitrary finite simple graphs admitting any actual acyclic triangle-edge cover. It imposes no minimum-cover, order, degree, density, connectivity or nonemptiness hypothesis. Its CS is the unrestricted TUZA-23 conclusion with exact equality iff literal shared-edge triangle-component K4/K5 support. The optional anchored theorem has existential packing I, allows arbitrary actual edges in D, and requires precisely C intersect support(I) contained in D. It does not silently prescribe a maximum packing.

EdgeMatching is vertex-disjoint actual unordered edges, correctly distinguished from edge-disjoint triangle Packing. VertexCover and ResidualVertexCover quantify all actual graph edges. MaximumMatching compares against every matching. Isolate preserves the ambient vertex type while removing incident edges. PointedWitness states the required conditional inclusion of w in Q, and imposes no unsupported maximum-matching conclusion. Arbitrary isolates and disconnected graphs are present. The explicit perfect/nonperfect active-set warning correctly excludes retained isolated w from that branch's vertex count.

A constructive forest matching/cover theorem producing M,Q with |Q|≤|M|, plus weak duality against arbitrary matchings, is enough to derive |Q|=|M| and MaximumMatching M. A separate numeric matching-number definition is optional. This is an ordinary mathematical observation, not an accepted Lean theorem.

## Ordinary proof reconstruction

The forest-cover CS assembly and anchored notes were independently checked against the two apex-forest branch notes and the prior formalization plan. No mathematical counterexample or missing hypothesis has been found in this reconstruction. This is source-level mathematical review; it is not formal verification of the branch arguments.

Heredity uses C intersect E(H). The restricted cover meets every actual H triangle and its selected graph is a subgraph of the original forest. Thus minimization inside the forest-cover class supplies CS for every proper same-vertex subgraph of the chosen failure; it does not assume universal CS. Isolating vertices is sufficient and avoids a hidden finite-type change.

A leaf v of a nontrivial selected-cover component has unique selected neighbor w. Every full-link edge away from w belongs to C, because the two corresponding spokes cannot cover that triangle. Any full-link component away from w would be a forest of minimum degree at least two, impossible. The entire active link is consequently one connected closed component. Public full-link matching reduction can therefore be used directly after proving this geometry, without requiring an additional closed-component version.

The perfect branch pays for w using the strict edge count after deleting the forest perfect matching; the connected extremal case becomes an alternating path. The nonperfect branch requires the exposable-leaf and alternating-reach facts actually supplied in its source. Maximum matching, residual forest covers, and both branch cases must be proved rather than promoted to assumptions. In the safe external-page case, safety and the deleted base constrain each residual clique block's UNION of surviving matching and page edges. In the internal-triangle case the forest restriction limits the block's active link vertices. These full-union arguments, not separate triangle avoidability statements, are what authorize augmentation.

The pointed proof's cases are exhaustive: w sees an exposable even-reach vertex; otherwise the unreached perfectly matched set is nonempty; otherwise it is empty and the odd-reach set covers the link. Forest matching/cover equality and strict forest edge count pay the required Q cardinality. No Gallai–Edmonds, Konig, Kotzig, census, CS or external solver premise is needed in the ordinary proof. The even/odd reach partition and exposure by flipping still require explicit Lean proofs with reviewed path definitions.

The anchored induction removes all hub spokes and the chosen rim matching. It directly covers every outside page on a removed rim edge, independently of the outside apex. Old packing edges lie in the residual graph, new hub triangles use deleted edges, and the pointed implication covers the only possible selected spoke vw. This establishes the correct existential anchor once its individual obligations are formalized.

## Concrete obligations to preserve

1. Never count isolated retained w as an active vertex of the forest L-w in perfect/nonperfect arguments. Empty graphs, isolates and multiple forest components remain included.
2. Full-link restriction and all actual graph triangles are essential; a restricted triangle family does not suffice.
3. Before constructing an actual GraphCover from Q, trim Q to the hub's actual neighbor set. PointedWitness itself allows arbitrary Q, and public LinkMatching deliberately does too. Trimming preserves coverage/cardinality; w remains when relevant because vw is actual. Without trimming or equivalent actual-edge restriction, the constructed spoke cover could contain nonedges.
4. Residual B must follow from proper-subgraph CS plus the balanced accounting equality, never merely from residual tightness.
5. Every clique compatibility check must cover the entire augmented footprint in each residual block, including surviving matching edges and external-page spokes together.
6. Final acceptance requires independently rebuilt local sources, actual declaration/type/reference/axiom audits including private/generated helpers, and truthful theorem-ledger status. This preliminary acceptance supplies none of those receipts.
