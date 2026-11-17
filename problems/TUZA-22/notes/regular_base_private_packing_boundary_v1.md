> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Regular-base page families: a boundary beyond unicyclic full packing

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. Source_audit, 2026-11-16 UTC. This is a literal one-sided graph obstruction to extending `unicyclic_cover_drop_one_packing_v2.md` to arbitrary selected base components. It is not a counterexample to original H-D or Tuza.

## 1. General regular construction

Let A be a triangle-free r-regular graph, r>=2, and let m=|E(A)|. Add r independent vertices a_1,...,a_r, each adjacent to every A vertex. Call the graph G. Its complete actual triangle family consists of one page a_j+e for each e in E(A) and each j. Let C=E(A).

For any triangle cover, let D be its selected A-edges and let Q_j be the vertices whose a_j-spokes are selected. Each Q_j is a vertex cover of A-D. Conversely these conditions cover every actual triangle. Consequently

    tau(G)=min_Q [r|Q|+e(A-Q)] = min_Q [m+e(A[Q])] = m.     (1)

Here regularity gives e(A-Q)=m-r|Q|+e(A[Q]). Thus C is a minimum cover.

EVERY minimum cover is exact-one. Given any minimum D,Q_1,...,Q_r, all Q_j have the same minimum vertex-cover size q for A-D, or replacing a larger one would improve the cover. For each j the canonical cover E(A-Q_j), with Q_j used at every apex, has cost at most m. Equality in (1) forces Q_j independent and E(A-Q_j)=D. Therefore a triangle whose base lies in D has neither spoke selected, while every other page has exactly one selected spoke at its own apex. No symmetry restriction on the original minimum cover was imposed.

The fractional optimum is also m: assign weight1/r to every triangle for a feasible fractional packing. Each base belongs to r pages and each apex spoke belongs to r pages, so all loads equal one. The ordinary cover C gives the matching upper bound.

Suppose additionally that EVERY edge uv of A belongs to some perfect matching M. For T=a_1uv, the residual cover C-{uv} has size m-1. A fractional residual packing of the same size is explicit:

* assign weight1 to the a_1-pages on M-{uv};
* for each of the other r-1 apices, assign weight1/(r-1) to every page on A-M.

All these pages survive deletion of T. Every remaining base receives load one. The first apex's surviving selected spokes receive load one, while each other apex spoke sees exactly r-1 complementary matching edges and also receives load one. Hence

    tau(G-E(T))=m-1                                       (2)

for EVERY actual triangle T. Thus the exact-one property and all cover-side endpoint-deletion inequalities (R) hold.

Finally, a packing with m pages is precisely a proper r-edge-coloring of A: the chosen apex is the edge color, common bases cannot repeat, and equal-apex pages conflict exactly on incident bases. A class-II regular base can therefore satisfy (1)--(2) while lacking a full m-page packing.

## 2. Completely explicit Petersen instance

Take A=Petersen and r=3. Then G has13 vertices,45 edges and45 actual triangles; C is the connected15-edge Petersen base. Its cycle rank is15-10+1=6, outside the unicyclic theorem's scope. The exact values are

    tau(G)=tau_fractional(G)=15,    nu(G)=13,
    tau(G-E(T))=14,                 nu(G-E(T))=12

for EVERY actual triangle T.

Here is an elementary verification of the required Petersen matching facts. In the usual drawing use outer cycle u_i u_(i+1), inner star edges v_i v_(i+2), and spokes u_i v_i, with indices modulo5. A perfect matching uses an odd number of spokes. Three spokes are impossible: the remaining two indices would have to be adjacent both on the outer cycle and on the inner star. Thus the perfect matchings are the all-five-spoke matching and the five matchings with one chosen spoke; after that spoke, each remaining four-vertex path has its unique perfect matching. Every Petersen edge occurs in at least one of these six matchings.

The complement of the five-spoke matching is the two displayed five-cycles. For the one-spoke matching at index0, the complement cycles are

    u0-u1-v1-v4-u4-u0,
    u2-u3-v3-v0-v2-u2.

Rotation proves the same for all five one-spoke choices. Hence every perfect matching has two odd five-cycles as its complement, and no two perfect matchings are edge-disjoint.

A page packing is a proper three-edge-coloring of its chosen Petersen base edges. Fourteen chosen edges would require color-class sizes5,5,4, giving two disjoint perfect matchings; fifteen is likewise impossible. Thirteen is attained by assigning one perfect matching to one apex and deleting one edge from each complementary five-cycle, then alternating the other two colors on the two remaining four-edge paths. Thus nu(G)=13.

For the residual after T=a_1uv, the first apex contributes at most four pages, and each other apex at most five. A packing of thirteen would therefore have one of the other colors be a perfect matching M avoiding uv (two perfect color classes are impossible). The complement of M is two five-cycles, with uv on one of them. The remaining two colors would need eight of their nine surviving edges: all four edges of that first opened five-cycle and four of the other cycle. But the opened cycle is a four-edge path with endpoints u,v. Both endpoint edges must avoid color a_1, whose two endpoint spokes were deleted. A proper two-coloring of a four-edge path gives different endpoint colors, contradiction. Hence the residual packing is at most twelve.

To attain twelve, choose a perfect matching containing uv, use its other four edges at a_1, and use four edges at each of the other two apices by breaking and alternating the two complementary five-cycles. This also verifies the triangle-deletion packing equality directly, without a solver.

## 3. Precise boundary

This example has the exact-one property for ALL minimum covers, cover-drop-one for ALL actual triangles, and packing-drop-one for ALL actual triangles. Nevertheless it fails the crucial original-H-D near-tight equation: residual cover14 is far below 2nu(G)-2=24. No unrestricted H-D implication is refuted.

It also has a two-edge packing blocker: delete two adjacent Petersen base edges. A thirteen-page packing would color all thirteen remaining base edges and would contain a perfect color class. Both removed edges lie in the same complementary five-cycle of that perfect matching, leaving the other odd five-cycle intact for the remaining two colors, impossible. Thus packing drops below thirteen.

The obstruction to a full local page packing here is integral edge coloring, despite fractional integrality and all the stated cover/packing deletion equalities. The unicyclic residual-forest minmax step cannot be replaced by a general full-page assertion. No numerical census, imported optimizer, weighted simulation, or external theorem is a premise, and no novelty claim is made.
