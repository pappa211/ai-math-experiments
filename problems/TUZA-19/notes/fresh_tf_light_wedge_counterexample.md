# TF does not forbid two light edges in one actual triangle

Status: **actual nine-vertex counterexample, with ordinary lower and upper proofs and independent literal verification.** This refutes the proposed TF-alone availability gate. It does not refute Tuza, the gate with two-edge resilience added, or the gate with triangle-free heavy-edge graph added. No padding or enlarged census was pursued. Original TUZA-19 research cutoff remains 2026-11-15 09:23:58Z. Requested model controls Astra / Ultra; exact serving identity and effort are not independently exposed.

Write c(e) for triangle codegree, call an edge light if c(e)<=2, and use TF to mean that every actual triangle is contained in some minimum triangle edge cover.

## The full graph and all its triangles

On vertices 0,...,8, let the edge list be

    01 02 03 04 12 13 15 16 18 24 26 27 28 34 35 45 46 47 56 67 68 78.

Here ij means the unordered edge {i,j}; three-digit strings denote triangles. Enumerating all three-subsets gives exactly

    012 013 024 034 126 128 135 156 168
    246 247 267 268 278 345 456 467 678.

There are 22 edges and 18 actual triangles. Both 01 and 02 are light edges of triangle 012: their complete page lists are {012,013} and {012,024}, respectively. The other tips are 3 and 4, so this is precisely the distinct-tip case left open by the earlier K4 exchange. The missing edges 14 and 23 preclude the unwanted local K4 closure.

The exact parameters are

    tau(G)=8,  nu(G)=6.

In particular tau<2nu. The graph is TF, as certified below, despite triangles containing two or even three light edges.

## Ordinary proof that tau is at least eight

Assign fractional packing weight 1/2 to all actual triangles except 126,246,278,678, which receive zero. The fourteen positive weights total seven. Every edge has load exactly one except 78, which has load zero. This is checked directly from the two lists above and independently in `ordinary_lower_certificate.json`.

Suppose a cover C has at most seven edges, and write x_ij for its binary edge indicators. Summing its intersections with the half-packing shows that |C|=7, x_78=0, and every positive-weight triangle meets C in exactly one edge. In particular the cover inequalities for 278 and 678 become

    x27+x28>=1,    x67+x68>=1.

Adding the exact-one equations for 267 and 268 gives

    2x26+x27+x28+x67+x68=2.

Thus x26=0 and both displayed inequalities are equalities. With t=x27 in {0,1}, the individual equations imply

    x27=x68=t,    x28=x67=1-t.

The remaining exact-one equations force the following successive values. Each step uses two equations with complementary right sides t and 1-t: their shared nonnegative binary variable must be zero.

| Equations used | Forced values |
|---|---|
| 247 and 467 | x47=0, x24=1-t, x46=t |
| 128 and 168 | x18=0, x12=t, x16=1-t |
| 156 and 456 | x56=0, x15=t, x45=1-t |
| 135 and 345 | x35=0, x13=1-t, x34=t |
| 013 and 034 | x03=0, x01=t, x04=1-t |

Finally the exact-one equation for 012 gives x02=1-2t, whereas the equation for 024 gives x02=2t-1. Therefore t=1/2, contradicting its binary definition. No cover of size seven or smaller exists, proving tau>=8. This argument does not use solver UNSAT output.

## Explicit full-triangle covers and TF

The following table gives an eight-edge cover containing every edge of the specified triangle. Each row is checked against all 18 actual triangles. The ordinary lower bound proves that each is minimum, so the table proves TF and tau=8.

| Triangle | Eight-edge cover |
|---|---|
| 012 | 01 02 12 15 27 34 46 68 |
| 013 | 01 03 13 16 24 28 45 67 |
| 024 | 02 04 13 16 24 28 45 67 |
| 034 | 03 04 12 15 27 34 46 68 |
| 126 | 03 12 16 24 26 35 46 78 |
| 128 | 03 12 15 18 24 28 45 67 |
| 135 | 04 12 13 15 27 35 46 68 |
| 156 | 01 15 16 24 28 34 56 67 |
| 168 | 01 04 16 18 27 35 46 68 |
| 246 | 01 15 24 26 28 34 46 68 |
| 247 | 12 13 24 27 34 47 56 68 |
| 267 | 02 13 18 26 27 34 56 67 |
| 268 | 02 13 26 28 34 47 56 68 |
| 278 | 02 03 16 27 28 35 46 78 |
| 345 | 01 16 24 28 34 35 45 67 |
| 456 | 04 12 13 27 45 46 56 68 |
| 467 | 01 04 16 28 35 46 47 67 |
| 678 | 12 13 24 34 56 67 68 78 |

## Exact packing number and failure of two-edge resilience

A six-packing is

    034, 128, 135, 247, 456, 678.

All its graph edges are distinct. Every vertex of G has even degree (the degree sequence in label order is 4,6,6,4,6,4,6,4,4). A seven-packing would use 21 of the 22 edges and leave one edge, impossible because removing triangles preserves degree parity. Thus nu=6.

Deleting 01 and 03 leaves packing number exactly five. The displayed six-packing loses only 034, providing a five-packing. If a six-packing survived, the remaining two unused edges would have odd-degree vertices exactly 1 and 3. They would have to form a length-two path from 1 to 3. In G-{01,03}, their only common neighbor is 5, so the leave would be {15,35}. Vertex 3 would then have to use both edges 13 and 34 in its unique packed triangle, but 14 is absent. This contradiction excludes a six-packing. Therefore the control is not two-edge resilient; no such stronger claim is made.

The independent fixed-graph enumeration found exactly 18 maximum six-packings. It checks all 231 edge pairs and records 154 blockers; the single ordinary blocker above is sufficient for the scope boundary.

## Heavy structure and precise availability boundary

The edges of codegree at least three are

    12 16 24 26 27 28 46 67 68.

Their actual triangles are 126,246,267,268. Consequently the heavy-edge graph is not triangle-free. Among all 18 actual triangles, the numbers with 0,1,2,3 light edges are respectively 4,6,4,4. In particular even the four all-light triangles 013,034,135,345 are compatible with TF here; none contradicts the earlier all-light-face-in-K4 exclusion.

The failed statement is exactly:

    TF alone => every actual triangle has at most one light edge.

This counterexample leaves open the same conclusion under TF plus two-edge packing resilience, or under TF plus triangle-free heavy-edge graph. It therefore blocks removing the exact-one-light availability issue by TF alone, while not deciding the full stronger resource-model reduction.

## Discovery, replay and verification levels

A single inverse-design domain on nine vertices fixed the actual pages 012,013,024 and forced 01,02 to have no other pages. SAT variables represented graph edges, actual triangles, a candidate common minimum-cover size, and a full-triangle cover for each actual triangle. Exact smaller-cover separation rejected candidates with a smaller optimum. The successful run took about 68.1 seconds and is preserved in `evidence/tf_light_wedge_fresh/inverse_n9.json`. This was one targeted construction problem, not a graph atlas or escalating order census.

Discovery checker: `checks/fresh_tf_light_wedge_inverse.py`, using the existing local CaDiCaL interface. Its UNSAT outputs were only provisional discovery evidence. Final verification does not depend on them.

Independent checker: `checks/fresh_tf_light_wedge_verify.py`, standard library only, importing no producer mathematics code. It reconstructs all actual triangles from the edge list, rejects all binomial(22,7)=170544 seven-edge subsets as covers, verifies every row of the TF table, enumerates all maximum packings and all two-edge deletion pairs, and computes every codegree and heavy triangle. Removing each edge of the first minimum cover exposes a literal triangle, retained as negative controls. The additional exact rational half-packing loads were checked separately. All computation was local Darwin, Python 3.12.12. No Lean or remote computation was run.

Reproduction:

    source LOCAL_ENVIRONMENT
    python checks/fresh_tf_light_wedge_verify.py

Full data, literal receipt, ordinary fractional certificate and hashes are retained under `evidence/tf_light_wedge_fresh/`. The principal result now has an ordinary proof plus independent fixed positive and exhaustive finite checks. Fresh external-context AI review is separate; no human or formal verification is claimed. This lane stops at the decisive counterexample without gadget repairs.
