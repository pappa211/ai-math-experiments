> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Matching proof route and reusable scope

TUZA-24 uses finite families of actual two-vertex edges. Distinct matching edges
are vertex-disjoint. VertexCover and ResidualVertexCover are ordinary vertex
covers, separate from actual triangle-edge covers. All isolation operations
retain the ambient vertex type. Exposable includes ambient isolates, while the
explicit active set in deficiency statements excludes them.

The checked reusable chain is:

- ForestMatching: constructive leaf induction gives a matching and equally
  sized vertex cover; weak duality establishes true maximum cardinality.
- AlternatingForestExchange / Decomposition: a vertex is exposable by some
  maximum matching exactly when it lies in no matching-equal minimum cover.
  Deletion and forest minmax establish the difficult direction. Equality-cover
  saturation forces every maximum matching to pair A=N(D) into D and to use a
  perfect matching on Z. This replaces alternating-path bookkeeping while
  preserving the ordinary decomposition and quantifiers.
- ForestMatchingSlack: a forest supported on nonempty S has fewer than |S|
  edges. A nonempty perfect matching on incident support therefore admits a
  residual vertex cover strictly smaller than the matching.
- PointedForest.pointed_apex_forest: for arbitrary finite L and any w with
  isolate L {w} acyclic, there exist M,Q with EdgeMatching L M, a vertex cover
  Q of L-M, |Q|<=|M|, and w in Q whenever M meets w. Disconnected graphs,
  isolated vertices and an isolated apex are included.
- ForestMatchingUnique: forest matchings with the same incident vertex support
  are identical. Consequently the Z part of every maximum forest matching is
  the same, and Z is empty when every edge is avoidable by a maximum matching.
- ForestMatchingLeafRetention: a maximum matching containing a prescribed edge
  can be changed to expose an original leaf when an explicit active set has
  positive deficiency and no isolated active vertices. Deleting the prescribed
  adjacent pair changes at most one vertex in each remaining component.
- ForestMatchingLeafAvoidance: with active deficiency at least two, a maximum
  matching avoiding an actual edge can also expose an original leaf outside
  both endpoints. An unmatched active vertex outside those endpoints exists
  because a maximum matching cannot leave both endpoints unmatched. Two
  exposable leaves in its cut-forest component then supply the original leaf.
- ForestMatchingDeficiency: if every maximum forest matching has an equally
  large disjoint peer, a nonperfect active set of order at least four has
  deficiency at least two. Under hypothetical deficiency one, every residual
  edge lies in its peer, so exposed vertices have degree at most one. Every A
  vertex then has an unmatched D neighbor. The unique unmatched active vertex
  forces |A|<=1; Z is empty, giving active order at most three.
- ForestMatchingSafeEdge: in the D-A forest, a marking true on all original
  leaves and on one A vertex, but never on both endpoints of an allowed edge,
  forces an allowed edge with two unmarked endpoints. The proof propagates the
  Boolean invariant marked(x) iff x is not exposable through the D-A component.
  This is the source parity argument without choosing an ordered path.

The changes above reorganize proofs; they do not alter the accepted ordinary
claims. The generic exposed-set and equality-cover arguments are useful beyond
forests whenever the necessary hereditary matching/cover equality is available.
The exported all-size theorems retain their actual forest hypotheses.

Cycles block specific steps: an odd cycle need not satisfy matching/vertex-cover
equality; a four-cycle has two different perfect matchings on the same support;
and deleting one perfect matching of a four-cycle leaves an equally large
matching, so the strict residual saving fails. Thus the completed forest chain
supplies no unrestricted cover-availability theorem and no unrestricted Tuza
or equality classification. These are mathematical limits, not compiler limits.

Final acceptance and any remaining verification limits are recorded separately
in INDEPENDENT_REVIEW.md and AXIOM_AUDIT.md. Development receipts establish
kernel compilation in the pinned Mac environment; they are distinct from the
independent final rebuild and theorem-level audit.
