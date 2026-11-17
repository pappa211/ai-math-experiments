> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Interim semantic review: pointed forest lemma and anchored forest theorem

Reviewer: tuza24_review. Status: SOURCE SEMANTICS ACCEPTED; coordinator compilation receipts checked where recorded in interim_anchor_source_hashes.json. No independent compiler invocation or final actual-declaration audit has been performed. Full forest-cover CS is still incomplete. The compiled anchored theorem and inequality are genuine all-size positive milestones, not completion of the equality mission.

## Exact exported target meanings

`Tuza24.pointed_apex_forest` has precisely the hypothesis `(isolate L {w}).IsAcyclic` and concludes `∃ M Q, PointedWitness L w M Q`. It has no supplied matching, maximum, decomposition, vertex-cover, minimality or CS premise.

`Tuza24.forest_cover_anchor` has precisely `ForestCover G C` and concludes `∃ I D, AnchoredPackingCover G C I D`. Expanding that conclusion gives an actual triangle packing, an actual-edge cover of ALL actual G triangles, `C ∩ support I ⊆ D`, and `D.card ≤ 2*I.card`. The supplied C is arbitrary, need not be minimum, and may contain triangle-free edges. Neither I nor D is claimed optimal.

`Tuza24.forest_cover_inequality` has precisely `HasForestCover G` and concludes `tau (triangles G) ≤ 2*nu (triangles G)`. Its implicit G binder is presentation only; its mathematical scope is the frozen standalone target. The ambient finite type is arbitrary, including empty types. No degree, order, density, connectivity or nonempty-matching assumption appears in either final theorem.

## Path-free exposure proof

The reorganization from alternating paths to minimum vertex covers is mathematically sound and does not weaken the theorem. `Exposable G v` means some true maximum matching misses v. Every matching-equal vertex cover contains exactly one endpoint of each edge of any maximum matching and no unmatched vertices. Consequently exposable vertices belong to no such cover.

For a forest, if v is not exposable, maximum matching size strictly decreases on isolating v; otherwise a remaining maximum matching would expose v in the original graph. A minimum cover of the isolated forest, with v restored, is a cover of the original graph of size at most the original maximum. Weak duality forces equality. Thus each nonexposable vertex belongs to some minimum cover, using the independently constructed forest minmax theorem and no path theorem.

D is the set of exposable vertices, A its actual graph neighborhood, and Z the complement of D union A. A is contained in every equality cover. If a maximum-matching edge meeting A had a non-D partner, choose an equality cover containing that partner; it already contains the A endpoint, contradicting the unique representative property. Every A vertex is matched into D; every Z vertex is matched within Z. The proof establishes exactly `matchingVertices N_Z = Z` and `|M|=|A|+|N_Z|`.

All ambient isolates are exposable and lie in D. In particular the retained isolated apex of `isolate L {w}` lies in D, rather than inflating the perfectly matched remainder. The implementation counts matching edges and their exact support, not the cardinality of the full ambient type. The empty Z case and empty matching case are both explicit.

## Strict forest slack and pointed cases

`forest_edgeCount_lt_support` assumes a nonempty finite S containing every incident endpoint and proves edgeCount G < |S| by actual leaf deletion. It allows arbitrary isolates outside S. `matchingVertices_card` establishes exactly twice the number of matching edges. For a nonempty matching covering every incident vertex of a forest, the residual number of edges is therefore strictly smaller than the matching size. Choosing one endpoint per residual edge yields the strict residual vertex-cover saving. No minimum vertex cover is assumed in this counting step.

PointedForest then covers three exhaustive cases. An apex neighbor exposable in F is missed by a true maximum F matching; adding the apex edge and adding the apex to a matching-equal full F cover gives the witness. If the matched remainder is nonempty, its strict residual saving pays for the apex while A covers all other forest edges. If the remainder is empty and the apex has no exposable neighbor, A covers both forest and apex edges. The chosen matching avoids the apex in the latter two cases, so the pointed anchor implication is vacuous. No active-vertex convention changes within the proof.

## Full link and anchored lift

`linkGraph G v` is the full induced graph on the actual neighborhood, represented on V with all other vertices isolated. `linkGraph_edge_iff` proves its actual edge equivalence. For a selected leaf v with unique selected neighbor w, every link edge away from w belongs to C, because coverage of its actual hub triangle cannot use either spoke. Thus the isolated link is a subgraph of the selected forest.

The lift uses the public actual `ReductionWitness`: all edges incident to v and all chosen rim matching edges are removed. `remove_lost_triangle` distinguishes a triangle incident to v from a triangle containing a removed edge. The latter is covered directly by that edge, so arbitrary outside pages on removed rim edges are included without any apex restriction. The former uses the cover disjunction for EVERY actual edge of the full link. New hub triangles are edge-disjoint from the residual packing because any shared edge would both survive and be removed.

For the anchor, any selected edge in an old packing triangle survives and belongs to the restricted cover. In a new hub triangle, a selected rim edge belongs to M; the only possible selected spoke is vw, and the pointed implication places w in Q when that spoke is used. The final actualization intersects the assembled cover with graphEdges G. It preserves the anchor because all supplied C edges are actual, and preserves or decreases cardinality. Therefore redundant nonedges allowed in intermediate Q cannot leak into the final GraphCover.

Induction is on |C|. The selected edge vw is removed even if the pointed matching is empty, so the restricted supplied cover strictly decreases. Heredity retains every actual residual triangle. The empty C case gives empty packing and cover. These details cover disconnected supplied forests, isolates, extraneous selected edges and triangle-free graphs.

## Remaining acceptance boundary

The source-level milestone is unconditional and matches its advertised quantifiers. It does not yet establish the equality classification or full forest-cover CS. A later independent clean-output build and actual theorem/type/reference/axiom audit must cover the frozen local dependency closure, including private/generated helpers. Imported M0/small-link modules do not add a premise to these theorem statements; the final actual-reference audit must record which local declarations their proofs really use.
