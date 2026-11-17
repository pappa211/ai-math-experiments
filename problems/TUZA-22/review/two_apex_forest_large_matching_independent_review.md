> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: two-apex forest matching bound

Source_audit, 2026-11-16 UTC. Verdict: ACCEPT at the stated class-minimum-CS scope.

Frozen source reviewed:
notes/challenger_two_apex_forest_large_matching_exclusion_v1.md
SHA256 336006afd3adfa51e842bff9e30544f29a59735b15ac7752763737d3515654e1.

I independently reconstructed the case split and read the exact simultaneous-cover input in notes/coordinator_triangle_deletion_set_WKE_collapse_v1.md. No numerical solver or producer test was used. The result is ordinary relative to the already accepted class-local CS reductions and finite bipartite Hall theorem; no GE, Kotzig, finite-certificate census, or unverified WKE availability premise enters.

Exact conclusion: if L is a nonempty closed link component in a global or hereditary-class minimum combined-CS failure, and F=L-{a,b} is a forest, then its ordinary matching number is at most three. This does not classify the remaining links or establish a suitable two-vertex deletion set in general.

## Checks that carry the proof

1. The collapse inequality is used with the supplied set {a,b}, not an assumed minimum transversal. For every exhibited WKE tuple it gives |P|<=2+z, where z is the number of F endpoints matched across this set. The source's values z=0,1,2 are exact. Covers are of L-P and include all unspecified apex neighbors by either retaining the apex or explicitly selecting every possible remaining neighbor.

2. In a perfect forest, F-M has r-c edges. The only connected exceptional case with those edges pairwise disjoint is an even path. For an extending pair of apex edges at positions i,j, deleting those positions leaves a perfect path matching precisely when the smaller is odd and the larger even. If the complementary r residual path edges form a matching, they must be the unique perfect matching, forcing the exposed pair to be the two endpoints. Thus every non-endpoint extension supplies the claimed one-unit cover saving. In the endpoint-only case, both shared endpoints force both apices to have no internal neighbors. With exclusive endpoints, internal a-neighbors are even and internal b-neighbors odd, with every a-even before every b-odd. Hence no surviving odd-position path edge has both mandatory endpoints, and the size-r strict cover exists exactly as claimed.

3. The ordinary alternating forest decomposition provides U independent, A adjacent only toward U or A/Z, no U-Z edges, and a perfect Z matching. Exposing a specified U-neighbor proves strict Hall expansion |N(Y) intersect U|>=|Y|+1. A nonperfect component exposes an original leaf or isolate, whose minimum link degree forces an apex U-neighbor. A nonempty Z saves one cover edge by forest counting; the displayed tuple then has r+1 matching edges and one crossing.

4. When both apices see U but the augmented left side fails Hall, every deficient set includes both apices, and deletion of either apex forces its neighborhood size to be exactly |A0|+1. Strict Hall gives at least 2|A0| forest edges on 2|A0|+1 vertices, so these vertices form one subdivision tree and admit no extra internal edge. Every original forest leaf/isolate must have an apex neighbor and hence lie in this core. Any proper forest extension or separate component would produce a leaf/isolate outside it. Therefore the core is all of F; this step does not silently discard a component.

5. Suppressing A gives a tree on U. Rooting it exposes the root and leaves one parent edge per subdividing vertex. A root with at least two children makes two residual edges adjacent and yields the needed cover saving. The only unreduced case is therefore an odd path whose apex U-neighbors occur at endpoints. I checked both final formulas directly. In Case5a the residual has the two stated disjoint P3s plus isolated edges, and D has r-1 vertices. In Case5b the listed Q covers the residual P3, all remaining path edges, every b-edge, and all remaining a-neighbors because av1 is absent. The matching size is r+1 in both cases, its crossings are exactly two, and r>=4 contradicts the collapse threshold four.

## Consequence and limitations

For a selected cycle cover, deleting its two selected neighbors from a link leaves paths and isolates. The already accepted apex-forest exclusions force one link component containing both neighbors. Two isolates would give forbidden parallel two-edge threads. Thus at most one isolate remains and |V(F)|<=3 nu_match(F)+1<=10, giving degree at most twelve. This is a necessary bound inside a hypothetical minimum-CS cycle-cover obstruction, not an all-graph classification or an authorization for a census.

No gap was found in the arbitrary outside-neighbor accounting, Hall equality reduction, perfect-path boundary, or final odd-path tuples.
