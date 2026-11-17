> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: role-assignment controls

**PASS for the K5 ordinary obstruction and the finite K2-join-C5 obstruction.** The latter was reconstructed and checked by a separate algorithm, not by importing the discovery search. Neither example is a Tuza counterexample. No role census or original ORTools replay is claimed.

## K5 ordinary proof

For two triangles abc,abd sharing ab in K5, the remaining triangle cde is edge-disjoint from both. If the two occurrences of ab receive different roles, then these three triangles are role-disjoint: their only potentially shared graph-edge resource is ab, and its two roles differ. Thus an assignment with no role-disjoint triple must give every occurrence of any fixed graph edge the same role. At a K5 vertex, any pair of its four incident edges occurs together in a triangle, whose edge roles are distinct. Those four edges would require four distinct roles, contradicting the availability of only three. The ordinary packing number is two, so this proves the claimed obstruction directly.

## Independent K2-join-C5 reconstruction

`reviews/critic_role_check.py` constructs the graph from a five-cycle on 0,...,4, both hubs 5,6 joined to every rim vertex, and the hub edge 56. It derives all actual triangles from adjacency, obtaining 16 edges and 15 triangles. Independent exact packing and cover enumeration gives nu=4,tau=6 and saves witnesses in `reviews/critic_role_check.json`.

There is also a short independent packing upper bound: every vertex of this graph has even degree (four on the rim, six at the hubs). Five edge-disjoint triangles would use fifteen of its sixteen edges, leaving one edge. The used union has even degrees, as does the original graph, so the one-edge remainder would have even degrees, impossible. The checked four-packing attains the bound.

For every five-triangle family, the checker builds the disjunction that some pair sharing an actual graph edge assigns equal roles to their occurrences of that edge. These disjunctions are necessary and sufficient to forbid role-disjoint five-families. A larger role-disjoint family contains a five-subfamily, and the ordinary four-packing is role-disjoint under every assignment. Thus satisfiability of all these clauses is exactly the proposed role maximum of four.

The checker derives all 3,003 five-families, 2,533 distinct clauses, and 41 inclusion-minimal clauses. Removing a duplicate or a superset of another positive disjunction preserves solutions. It independently verifies the certificate's actual triangles, edge-occurrence indices, all shared-edge pairs, and the complete minimal-clause set. No certificate count or verdict is used as a substitute for these derivations.

## Distinct complete search

The author's search uses six-permutation domains per triangle. The independent checker instead creates one color variable for each of the 45 triangle-edge occurrences. Within each triangle the three variables must have different colors. It branches on the *equalities in a remaining disjunction*, merging the chosen occurrence components. Every satisfying role assignment makes at least one equality in the selected disjunction true, so this branching covers all possibilities. Direct triangle collisions and forced equalities are propagated soundly.

At each stable state, an independent exact DSATUR backtracking search tests three-colorability of the component inequality graph. Fixing the first triangle's colors to 0,1,2 loses no solution under global color permutation. Only exhaustive coloring failure prunes a state; no heuristic failure or timeout is treated as UNSAT. Memoization reuses only fully rejected states.

The result is **UNSAT_EXHAUSTIVE**: 15 equality-search nodes, 247 coloring-search nodes, six non-three-colorable terminal states, and two reused rejected states. The coincidence of 15 nodes with the author's count does not identify the algorithms; the state representation, branching objects, and secondary exact search are different. The checker ran locally with the pinned Python and standard library, using no discovery imports or solver package.

The checker separately finds and saves a satisfying role assignment for the unit-equality relaxation. Hence that weaker relaxation really is insufficient on this graph. The additional clauses, not the relaxation alone, establish the obstruction. The exact implication is that **every role assignment has a role-disjoint family of at least five**, exceeding ordinary nu=4; no exact optimum for every assignment is asserted.

## Status handling and limits

I inspected `evidence/role_status_correction.diff` and the relevant corrected control flow. The changes return no solution values for statuses other than OPTIMAL/FEASIBLE, require an OPTIMAL ordinary baseline before fixing nu, propagate a missing incumbent as UNKNOWN, and accept a small role family as successful only when its optimization is certified optimal. A feasible family larger than the certified baseline remains a valid counterexample to the current role assignment and supplies a sound blocking clause. The role-assignment solver's own status is checked before its values are read.

`evidence/role_status_mock.json` is correctly labeled a mock control-flow test. The corrected ORTools algorithm remains **NOT_RUN_DEPENDENCY_ABSENT**; neither reading its patch nor the independent pure-Python obstruction search changes that status. The complete historical connected-graph role census remains unreproduced.

Reproduce the new bounded check from the private workspace:

    source PRIVATE_PATH_REMOVED
    python reviews/critic_role_check.py

The receipt contains the checked certificate/note hashes, source checker hash, exact graph and optimum witnesses, satisfiable relaxation witness, search statistics, and branch trace. This is finite exact verification plus the separate K5 ordinary proof, not Lean verification, external peer review, or a universal structural theorem. No mathematical discrepancy remains at these scopes.
