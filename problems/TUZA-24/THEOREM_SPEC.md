> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-24 theorem specification — frozen v1

The sole final mathematical target is full forest-cover CS for arbitrary finite simple graphs. This specification is frozen before dependent implementation; independent reviewer acceptance is required. Ordinary source candidate headers and later acceptance reviews are preserved separately. No universal CS, forest-cover availability, WKE availability or external matching theorem is assumed.

## Actual graph semantics and final target

For V : Type u with [Fintype V] [DecidableEq V], reuse Tuza23.GraphAPI: triangles G is the entire actual unordered three-vertex clique family; edges t are unordered two-element subsets. Packing uses pairwise disjoint edge supports and allows shared vertices. GraphCover G C requires C to consist of actual G edges and meet every actual triangle. Existing optimizer/witness bridges give genuine maximum nu and minimum tau. B and CS retain exact TUZA-23 meanings: each nonempty shared-edge-connected triangle-component support is a literal K4/K5; tau≤2nu and equality iff B. All crossing triangles, isolates and arbitrary background edges are included.

Define `selectedGraph C := Tuza23.addEdges (⊥ : SimpleGraph V) C`, so adjacency is distinct endpoints with their unordered pair in C. Define `ForestCover G C := GraphCover G C ∧ (selectedGraph C).IsAcyclic` using pinned Mathlib acyclicity, and `HasForestCover G := ∃ C, ForestCover G C`.

```lean
theorem forest_cover_cs {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (h : HasForestCover G) : Tuza23.CS G

theorem forest_cover_inequality {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (h : HasForestCover G) :
    Tuza.tau (Tuza.triangles G) ≤ 2 * Tuza.nu (Tuza.triangles G)
```

The supplied forest cover need not be minimum, connected, nonempty or spanning its support. The ambient graph need not be acyclic, sparse or connected; no degree, density or order bound is permitted. A forest cover may contain extraneous actual triangle-free edges. Restriction to any same-vertex subgraph H uses C intersect graphEdges H, and heredity must be proved.

## Optional separately advertised anchored target

For ANY supplied C with ForestCover G C:

```lean
∃ I D : Finset (Finset V),
  Tuza.Packing (Tuza.triangles G) I ∧ Tuza23.GraphCover G D ∧
  C ∩ Tuza.support I ⊆ D ∧ D.card ≤ 2 * I.card
```

I is existential, not prescribed and not asserted maximum. D may use ANY actual G edges; it need not lie in C or be minimum. This is a separate theorem; full CS alone does not establish it. Anchor status may remain NOT_ATTEMPTED/INCOMPLETE if bypassed by a completed CS route.

## Matching and pointed interfaces

Use finite unordered actual-edge families, compatible with Tuza06.LinkMatching:
- EdgeMatching L M: each member is an actual 2-clique of L and distinct members have DISJOINT VERTEX sets.
- matchingVertices M: union of endpoints of all matching edges.
- MaximumMatching L M: EdgeMatching and every EdgeMatching N has N.card≤M.card.
- VertexCover L Q: every actual L edge meets the VERTEX set Q.
- ResidualVertexCover L M Q: every actual edge outside M meets Q.
- isolate L U: same-vertex graph with all edges incident to U removed. Removed vertices remain isolated.

Pointed target: if (isolate L {w}).IsAcyclic, then there exist M,Q with EdgeMatching L M, ResidualVertexCover L M Q, Q.card≤M.card, and w∈matchingVertices M implies w∈Q. Arbitrary disconnected L, isolates and empty matchings are included. No minimality or CS is a hypothesis.

Perfect-matching and deficiency arguments must state their active vertex set. In L-w, the retained isolated w is NOT counted as a forest vertex for a perfect/nonperfect branch. Use an explicit active set or a proved induced-subtype bridge; the convention may not silently change. General maximum matching and cover optima do count arbitrary isolates harmlessly. Path/alternation/exposure definitions must be frozen with the first such module and independently reviewed before use.

## Chosen initial proof architecture and hypothesis boundaries

Develop the matching/pointed positive milestone alongside the class-local CS equality architecture. The latter selects a minimum failure within HasForestCover, proves every strict edge subgraph has forest cover by heredity, then obtains proper-subgraph CS. M0, codegree, robustness and balanced reduction must be instantiated from these proved premises. Their conditional form is not a hidden global-CS assumption.

A selected forest leaf produces an apex-forest full link. Both perfect and nonperfect branches must be discharged for full CS. Every augmentation must establish the UNION of its surviving edges in EACH residual literal clique block satisfies the actual avoidance theorem. Individual triangle avoidability is insufficient. Lost triangles on deleted rim edges include all outside pages.

Optional K4-only equality requires an explicit proof excluding K5 forest covers. B remains the general K4/K5 definition throughout.

## Acceptance and amendment policy

Accepted proof closures contain no sorry/sorryAx, project-defined unproved axiom, native_decide/native trust, unsafe proof escape or trusted external solver result. Report standard propext/Classical.choice/Quot.sound when present. Source scans and actual declaration/type/reference/axiom audits include private/generated helpers. Every reused local module is rebuilt from its copied source; existing pinned compiler/mathlib artifacts are a disclosed boundary.

Freeze accepted mathematical source before independent clean-output verification. Any unproved matching/apex/compatibility premise in the final forest statement makes it CONDITIONAL/INCOMPLETE. A tactic/API failure is not a source counterexample. Substantive specification changes require a separate amendment and renewed review.

Amendments: none at v1 freeze.
