> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: balanced book-cover exchange and controls

Verdict: PASS, PROVED_ORDINARY for notes/matching26_book_exchange_v2.md, SHA-256 cb501bb2ea47b0ad3f6bc55550088fa4bc743fd12bfffb83641ab2ea1895b282; VERIFIED_FINITE for direct replay of the prescribed named-control witnesses. Availability of a suitable exchange remains OPEN. No Lean verification is claimed.

## Full disagreement graph and exact operation

For two minimum K covers F,F', let D be their intersection and A,B their differences. Every actual triangle missed by D has nonempty intersections with both A and B. Adding all cross pairs makes those intersections lie in one connected component of the bipartite disagreement graph H. Consequently choosing one whole side of each component, together with D, covers every actual K triangle.

Replacing A_i by B_i in F and the reverse in F' gives both cardinality inequalities by minimum-cover optimality. Thus each component is balanced, including the exclusion of isolated vertices, and every component-side choice has the same minimum size. This proof accounts for ALL actual triangles unhit by D; omitting a triangle would invalidate the operation.

Each uv page supplies at most two component literals, one for each spoke in F union F'; a spoke in D already satisfies the page. Positive literals select the A side, negative literals the B side, and an empty clause is unsatisfiable. A satisfying assignment therefore constructs a genuine minimum K cover meeting every uv-page, hence a Q cover of size tau(K), contradicting the assumed one-edge cover increase. This is an exact conditional paid operation. No completeness of this family among all minimum covers is claimed or needed for a supplied satisfying assignment.

For exactly two page apices, covers containing the respective full pairs miss the opposite pair. The two Boolean clauses are simultaneously satisfiable whenever some x spoke and some y spoke belong to different components: choose the A side at the former and the B side at the latter. Conversely if no such cross-component pair exists, all four spokes lie in one component, and the clauses force incompatible choices. Hence a surviving codegree-two profile forces all four spokes into one balanced component. This is a precise obstruction and does not alone give a packing contradiction or an available cover exchange.

## Compatibility from two-edge resilience

For fixed x, a maximum Q-P_x packing has k triangles. Because K-P_x has only k-1, it contains an actual uv-page at some y different from x. There can be only one selected uv-page because they all share uv. Removing it leaves k-1 triangles in K-P_x-P_y. The reverse inequality follows from containment in K-P_x. Thus the compatibility graph on page apices has no isolated vertex. This argument uses Q two-edge resilience explicitly; the connected named local-profile control below need not satisfy it.

## Corrected third-edge-collision example

Review found a missing actual triangle in V1's illustrative K5-uv disagreement graph. Triangle xyz contributes the extra cross edge yz--xz. V2 correctly uses the full six-cycle plus chord, with three perfect matchings. Their selected triangles are (uxy,vxz,vyz), (uxz,vxy,uyz), and (uxy,vxy,xyz), with third-edge collisions vz, uz, and xy respectively. The third matching was absent from V1's description. The warning remains correct: a matching of cover edges is not automatically an edge-disjoint triangle packing. The revised full graph also retains the page z missed by both covers. The main balanced-component and compatibility proofs did not rely on the erroneous illustrative count.

## Independently validated named controls

The separately authored checker scripts/opening_cover_operation_controls.py directly validates the actual witnesses in evidence/matching26_book_controls.json. It compares the literal Q graphs and their packing/cover values to the already independently accepted exact C12 opening baseline, then checks every stored packing and cover against actual triangles. It imports no author script or optimizer and performs no graph census.

For central_K4_star_555 with e=45, Q has nu7,tau13. The K packing and cover prove nu7,tau12, with the matching upper/lower inequalities inherited from Q by edge deletion. All32 individual surviving-edge deletion witnesses are seven-packings, establishing single-edge resilience. Actual triangle reconstruction confirms full support and one triangle component. For each of the three page apices0,1,6, an explicit six-packing and ten-cover of K-P_x are checked. Appending the removed Q triangle bounds packing above by6, while cover extension from K gives tau>=12-2=10. Thus all three pair profiles are exact; their supplied twelve-edge K covers contain P_x.

The global blocker {01,23} is certified by a six-packing, and every remaining triangle lies in one of the three K5 leaf pieces, giving the matching upper bound. Deleting triangle123 leaves exactly the three literal K5 components, so the residual is B with nu6,tau12,defect0. The two-vertex leaf separator is immediate from the literal fresh construction. This control shows that the listed local connected resilient defect-two book profile is insufficient for payment; it fails stronger global hypotheses of the required minimum Q.

For two K5s sharing01 and deleting01, the checker validates all18 single-edge deletion four-packings and all six page-pair profiles (nu3,tau4), with actual covers containing the pairs. The old triangle support has two components, so this is an additional weaker-scope control, not a counterexample to connected triangle-support conclusions.

The author's cover-pool and packing-product generation counts were not independently regenerated. They are not needed: the independently accepted Q optima, direct literal witness replay, and ordinary deletion/append bounds establish every claimed control value. No optimizer correctness or unneeded implementation statistic is promoted.

Both controls and the separate double-cone replay ran together in0.02162625000346452 seconds, one native process, zero solver threads; the process exited. Checker SHA-256 187e75d6682deffe7a824215991a50272c06341d4deecc164d81323b6fe151ff; receipt evidence/opening_cover_operation_controls.json SHA-256 c792531993568b3a790baf6c764db6f484726be8acb8bf65c867bca099217c9b.

## What remains open

The component criterion provides a concrete construction if its clauses are satisfiable. A theorem forcing such a pair of covers from the FULL global hypotheses is still missing. Under the present cover-gap assumption, every tested pair necessarily has an unsatisfiable page system; discovering that fact alone restates the obstruction. A useful next step must force satisfiability, produce a different exact cover repair, or extract a fully paid region while retaining all third-edge collisions and crossing triangles.

Neither the connected star555 control nor the fragile-defect-three double-cone control belongs to the required full minimum-Q universe. They rule out weakened arguments, not the actual resilience/defect-two/global-constraint programme. The minimum-Q naming rule still does not classify K or its defect-two page-pair residuals.

Frozen UTC: 2026-11-16T23:02:15.996518+00:00
