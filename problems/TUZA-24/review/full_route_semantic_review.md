> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent semantic reconstruction of the complete forest-cover route

Status: the reviewed complete route is mathematically and semantically ACCEPTED at the source level. All snapshot identities and matching coordinator compilation receipts are in full_route_semantic_source_hashes.json. This is not yet the final independent clean-build/declaration-audit receipt. No compiler has been invoked by this reviewer. No correction to the theorem specification or ordinary mathematical claim was needed; the proof reorganizes several path arguments into finite matching/cover arguments.

## Final theorem scope

The final declaration `Tuza24.forest_cover_cs {G : SimpleGraph V} (hG : HasForestCover G) : Tuza23.CS G` has exactly the requested arbitrary finite-graph hypothesis. Expanding HasForestCover requires existence of an actual triangle-edge cover whose selected graph is acyclic. It does not require the supplied cover to be minimum, connected, nonempty or optimal in any sense. Expanding CS gives tau≤2nu and equality iff the existing literal K4/K5 component predicate B. There is no hidden matching, deficiency, WKE, generic CS, census, order, degree, outside-attachment or compatibility hypothesis in this final declaration.

The separate `forest_cover_anchor` and `forest_cover_inequality` retain the earlier accepted unconditional scope. `forest_cover_equality` exports the general B equivalence. Optional `forestCover_no_five_clique` rules out any actual 5-clique under any supplied ForestCover. `forest_cover_equality_k4` assumes exactly HasForestCover and equates equality with ComponentK4, which literally requires K4 edge support for each nonempty actual shared-edge triangle component. B itself is not redefined. Triangle-free background edges and shared vertices remain unrestricted, and the empty triangle-family condition remains vacuous.

## Class-local minimum failure and active vertices

ForestCover heredity is proved by restricting C to the actual edges of H. A minimum CS failure chosen inside this hereditary class therefore has proper-subgraph CS on the same ambient finite vertex type. This is the exact premise passed to the previously verified M0/codegree/small-link/balanced-reduction framework; no theorem for arbitrary graphs is assumed.

A selected leaf v with its unique selected neighbor w supplies an acyclic full link after isolating w. `linkGraph G v` still includes every actual link edge and retains all outside vertices as isolates. The proof need not establish a separate connectivity theorem: its branch lemmas work directly on this full-link representation.

Every active vertex of S=N_G(v) minus {w} has a forest neighbor, because its full-link degree has two distinct neighbors and at most one can be w. Conversely every forest edge has endpoints in S. Therefore S is exactly the nonisolated support relevant to matching deficiency. The retained apex and unrelated ambient isolates are excluded from S. An original forest leaf sees the apex by the same two-neighbor property. The active set has at least four vertices from the checked five-vertex full-link bound.

ForestCS chooses a true maximum forest matching. If its support equals S, the perfect branch applies. Otherwise its support is a proper subset of S and the proved identity |support M|=2|M| yields strict active deficiency. These cases exhaust the representation; no silent convention about isolated vertices changes between them.

## Perfect branch

The exact perfect-branch assumption is support(M)=S, not perfectness on the entire ambient type. It implies |M|≥2 from |S|≥4 and covers every incident forest endpoint. Strict forest edge counting and endpoint choice give either a residual vertex cover Q with |Q|+1<|M| or a residual edge family R which is a matching with |R|+1=|M|. The strict alternative yields a strictly cheaper full-link cover after adding w and contradicts the checked minimal reduction accounting.

In the balanced alternative there are exactly two active vertices unmatched by R. Each is an original forest leaf, since every forest edge outside M belongs to R and a matching has only one edge at a vertex. For every f in M one such leaf lies outside f: if f contained both, isolating f would leave at least as many edges as nonempty active vertices, contrary to acyclicity. This is the precise substitute for choosing a path endpoint away from f.

If some M edge forms an apex triangle, use M as the balanced reduction and R plus an apex edge to an R-unmatched original leaf outside the triangle base as the larger packing's matching. If no M edge forms an apex triangle but some link triangle exists, its base lies in R. Use R plus an apex leaf edge as the balanced reduction, and choose one endpoint of each M edge while including every remaining apex neighbor. At most one endpoint of each M edge is marked, so constrained_matching_vertexCover proves this is possible and exactly matching-sized. The augmented packing uses M plus the apex triangle. If the link has no triangle, codegree supplies an actual page outside the full neighborhood on any chosen M edge; R plus an apex leaf edge avoids its base and therefore all page edges.

All three augmentation cases call the reviewed full-union footprint interfaces. No path ordering, finite link census or unstated choice of a compatible residual packing enters.

## Original-leaf preservation under deletions

ForestMatchingBoundary uses the actual bridge property of acyclic graphs. After isolating both endpoints of an edge, a remaining component has at most one vertex attached to that pair: two attachments to one endpoint create a cycle, and attachments to opposite endpoints create a cycle through the removed edge. Cutting one edge separates its endpoints.

Fact A starts with a maximum matching containing the prescribed edge. Removing that edge gives a maximum matching after its endpoints are isolated; any larger residual matching could be restored with the edge. An originally unmatched nonisolated active vertex remains exposable there. If its remaining component is nontrivial, two exposable original leaves of that remaining forest allow one with no deleted-pair attachment. It is consequently an ORIGINAL forest leaf and can be exposed while restoring the prescribed edge. If the vertex became isolated, its only original neighbors lie in the adjacent deleted pair; acyclicity excludes adjacency to both, so it was already an original leaf. Thus no newly created deletion leaf is passed off as original.

Fact B starts with a maximum matching avoiding the edge and at least two unmatched active vertices. The edge endpoints cannot both be unmatched; hence one active unmatched vertex lies outside them. Its edge-cut component is nontrivial because its original neighbors are unchanged. That component cannot contain both cut endpoints. Two exposable leaves therefore include one outside both endpoints, whose degree is unchanged when the cut edge is restored. Maximum matching size is preserved by the given avoiding witness, so the returned matching is maximum in the original forest and still avoids the edge.

## Disjoint peers and deficiency at least two

`forest_residual_matching_cover` invokes the proved forest minmax theorem on the actual graph obtained by deleting a supplied edge family. It produces an actual matching disjoint from that family and a matching-equal residual vertex cover. It does not assume a residual optimizer oracle.

For any maximum forest matching M in the nonperfect branch, an exposed ORIGINAL leaf produces a full-link matching of size |M|+1 by appending its apex edge. If the residual matching after deleting M were smaller than M, its matching-equal cover plus w would make M a balanced reduction beaten by that larger link matching. The full footprint of a larger hub matching has at most one surviving edge per residual clique, so this contradiction uses the already verified avoidance interface. Therefore every maximum matching has an equally large edge-disjoint peer, proved within the minimal-failure branch.

Disjoint peers make every actual forest edge avoidable by some true maximum matching. The exposure remainder Z is perfectly matched in every maximum matching. Forest matchings with identical support are equal: their nonempty symmetric difference would be an acyclic graph with a leaf, but equal support forces a second distinct symmetric-difference edge at that leaf. Thus all maximum matchings share the same Z matching. Avoidability forces Z empty.

The deficiency-one refactor is valid. If |S|=2r+1, two disjoint size-r matchings already use 2r edges; strict forest counting on S forces their union to exhaust all forest edges. For a maximum matching exposing d, every incident edge at d belongs to its peer, so every exposable d has degree at most one. Every A vertex has two D-neighbors and one matching partner in D, so another D-neighbor is unmatched. There is exactly one unmatched active vertex u. All such D-neighbors equal u, and u has one original neighbor by the no-isolates assumption and the degree bound. Hence |A|≤1. Since Z is empty, r=|A|≤1, contradicting |S|≥4 and |S|=2r+1. Thus active deficiency is at least two, with no ordered-path or component-count premise.

## Allowed triangular bases and safe edges

For a triangular forest edge allowed in a maximum matching, Fact A chooses an initial maximum retaining the base and exposing an original leaf. Append that leaf's apex edge and use the proved residual cover to form a balanced reduction. Avoidability and deficiency at least two then authorize Fact B, producing another maximum avoiding the base and exposing an original leaf outside its endpoints. The new apex edge is disjoint from all edges of the apex triangle; both matchings have the same enlarged cardinality. The checked internal full-footprint augmentation contradicts minimality. Thus every triangular forest edge is unallowed in every maximum matching.

If a link triangle exists and Z is empty, its unallowed forest base has both endpoints in A: every edge touching D is allowed by the explicit one-edge swap. Mark vertices by adjacency to w. Original forest leaves are marked, and no D-A edge has both endpoints marked, since that would be an allowed triangular base. If there were no unmarked-unmarked D-A edge, each D-A edge would have exactly one marked endpoint. Starting from a marked A endpoint of the triangle, the invariant P(x) iff x is not exposable propagates along actual exposureBipartite walks to an exposable ORIGINAL leaf. That leaf is marked, a contradiction. The stronger bipartite reachability result is explicitly proved; ordinary G reachability is not substituted for it.

The resulting edge lies in a maximum matching and neither endpoint sees w. An apex-forest triangle necessarily contains w, so these endpoints belong to no link triangle. Fact A, Fact B and codegree now give the safe external-page augmentation. If the full link is triangle-free from the outset, any actual maximum-matching edge has safe endpoints. These cases exhaust the nonperfect branch and discharge every displayed helper premise.

## Optional K5/K4 refinement

The selected forest has a proper two-coloring from pinned Mathlib. Five vertices contain three of one color, yielding an actual graph triangle in a purported 5-clique. Its selected covering edge would join two same-colored vertices, contradicting proper coloring. The proof allows all selected edges and vertices outside the clique and does not use minimum-cover status.

The K4 refinement uses the existing lemma recovering an actual graph clique from literal component edge support. A K5 support would therefore produce the excluded actual 5-clique. The reverse implication is immediate inclusion of K4 among the unchanged B possibilities. Combining this within-class equivalence with the proved general equality statement gives the optional exact K4 equality theorem.

## Final acceptance boundary

No mathematical gap, counterexample, helper-hypothesis leak or scope restriction was found. Final acceptance still requires a fresh independent local-source build, actual declaration enumeration including generated/private helpers, full types and direct references, axiom collection, source-integrity checks and control review. Prior and coordinator receipts are evidence of compilation only and will not substitute for that independent audit.
