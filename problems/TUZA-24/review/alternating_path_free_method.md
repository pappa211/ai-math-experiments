> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Path-free forest matching decomposition

This is an implementation reorganization of the frozen ordinary forest matching claims, not a correction to their mathematical statement. The formal modules define `Exposable G v` directly by the existence of a maximum actual-edge matching omitting v. They do not assert or depend on equivalence with alternating reachability.

The checked route is:

1. Equality between a matching and a vertex cover implies that each matching edge meets the cover in precisely one endpoint and every cover vertex is matched. A finite representative bijection proves both facts.
2. Consequently every exposable vertex avoids every matching-equal cover, and the exposable vertices are independent whenever such a cover exists.
3. In a forest, if v cannot be exposed, deleting v strictly lowers matching cardinality. Forest minmax on the deletion, followed by restoring v to the cover, gives a minimum cover containing v.
4. Put D=all exposable vertices, A=neighbors of D, and Z=the remaining vertices. Every minimum cover contains A. If an A vertex were matched to a non-D vertex, the previous step would produce a minimum cover containing both endpoints of that matching edge, impossible. Every Z vertex therefore has its partner in Z.
5. Filtering any maximum matching by whether its edges meet A gives exactly |A| edges in that part, and a matching saturating exactly Z in the other part. Thus `|M|=|A|+|M_Z|` without an implicit active-vertex count.
6. A single-edge exchange from an exposed D vertex makes every incident edge allowed. A maximum matching omitting one D neighbor of an A vertex supplies a second D neighbor.
7. The subgraph consisting of edges incident with D is a forest. Every A vertex has degree at least two in it. Therefore both leaves of any nontrivial component are in D. All original edges incident with D remain in this subgraph, so these leaves are original graph leaves. This proves the two-exposable-original-leaves fact without alternating paths.

Ambient isolated vertices are intentionally in D. The two-leaf theorem requires the supplied exposed root to have an actual neighbor and returns actual degree-one vertices. Thus isolated vertices retained by `isolate` cannot accidentally serve as the original leaves.

## Development validation

`AlternatingForestExchange`, `AlternatingForestDecomposition`, `AlternatingForestAllowed`, and `AlternatingForestLeaves` have each compiled successfully through the serialized monitored runner. This is development kernel checking; final independent source/dependency rebuilding and declaration/axiom audits belong to the coordinator/reviewer closeout.

Successful receipt labels: `alternating-exchange-01`, `alternating-decomposition-02`, `alternating-leaves-02` (Allowed module), and `alternating-leaves-04` (Leaves module). Early failed diagnostics were elaboration repairs only (classical tactic layout, graph symmetry/irreflexivity structure projections, and one renamed bound variable), not mathematical counterexamples.
