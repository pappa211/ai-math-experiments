# Root ordinary reconstruction: nine-vertex TF light wedge

Frozen producer: notes/fresh_tf_light_wedge_counterexample.md, SHA256 ac39e3812be0a30857b3a1b9d33dcdc2637311f85feb4e50e78d16cf7470aef1.

Verdict PASS at the stated scope. Root independently derived the half-packing tightness contradiction from the literal fourteen positive triangles before reading the completed producer proof, then read and reconstructed the complete frozen argument. The fourteen weights sum to seven; loads equal one except edge78. A seven-cover forces exact-one equations and excludes78. The two omitted cover constraints, combined with267/268, force26=0 and complementary pairs. Propagation through247/467,128/168,156/456,135/345,013/034 finally requires a binary variable to equal1/2. This is an ordinary lower proof, not a solver-UNSAT reliance.

The explicit six-packing and even degree sequence give nu6: seven triangles would leave one edge with odd endpoints. The eighteen eight-cover rows are independently checked by the producer's separate literal verifier; root inspected their role and the exact graph/triangle lists, without claiming another exhaustive run. The ordinary deletion blocker is correct: after deleting01,03 a putative six-packing leaves a two-edge path from1to3, necessarily15,35; vertex3 then needs triangle134, but14 is absent.

Thus the graph is TF with adjacent light edges, tau8<2nu12, and fails two-edge resilience. Its four heavy triangles preclude any claim against the triangle-free-heavy-edge gate. This review is ordinary root reconstruction with producer-independent prior derivation of the central lower bound; no human review or Lean formalization.
