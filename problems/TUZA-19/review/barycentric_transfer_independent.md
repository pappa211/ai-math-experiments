# Independent review of the barycentric weighted-transfer obstruction

Verdict: PASS for the stated nonnegative integer-capacity theorem and its numerical-transfer obstruction. The universal equality and repeated-subdivision argument reconstruct without a mathematical gap. This is an ordinary AI mathematical review plus an independent finite literal check, not a Lean proof or a novelty determination.

Reviewed input: `notes/global_routes_barycentric_transfer.md`, SHA256 `f7ce814b0d747ad8011cc896e65253a9230cc814f156d0cf5da2a276f7aafc93`. Its exact bytes are preserved in `evidence/barycentric_independent_review/reviewed_note_f7ce814b.md`. I read the producer statement/proof but did not read or run its checker or evidence. The independently written checker imports only Python standard-library modules. All computation ran on the local Darwin host with the pinned native Python 3.12.12 environment. Requested reviewer controls were Astra/Ultra; actual serving model and reasoning-effort metadata were not independently exposed. The original mission clock applies.

## Definition audit and the one wording clarification

The formal assertion is: for each nonnegative **integer** vector w on the edges of X(K4), the minimum total w-cost of an edge set meeting all actual triangles equals the largest integer-multiplicity triangle packing whose load on each edge is at most w. The same vector is used for packing capacity and cover cost. There is no fractional-packing substitution and no mismatch between triangle multiplicity and an ordinary triangle set.

These are the definitions in Chapuy, DeVos, McDonald, Mohar and Scheide, *Packing triangles in weighted graphs*, arXiv:1012.0372v2 (25 May 2015), printed page 3. Their edge-by-triangle matrix A is the transpose of the reviewed note's B. The source also explains the parallel-edge interpretation. This review uses the source only to compare definitions, not to import a weighted Tuza theorem. Primary PDF: https://arxiv.org/pdf/1012.0372v2 . The equations were checked in text and visually on the rendered page. The downloaded 20-page PDF is preserved with SHA256 `94b364846d151504cbd1fc21176f2641b324406c40cd7ccccf27088648b7c281`, retrieval receipt and relevant page image in the review evidence directory.

The title's “arbitrary weights” and any condensed report should say “arbitrary nonnegative integer weights/capacities.” This is a scope clarification, not a defect in the formal claim. With real capacity 1/2 on every X(K4) edge and integer triangle multiplicities, the packing number is 0 while the cover cost is 6. The universal equality is therefore false for arbitrary real capacities under that integer-packing convention. Zero integer capacities, however, cause no problem. The scalar r in the transfer inequalities may remain any positive real number.

## Reconstructed incidence and LP proof

The construction includes exactly the old vertices, edges and actual triangles as faces, with higher cliques deliberately excluded. Two new vertices are adjacent exactly when their faces are comparable. Every actual new triangle must use one face of each of the three ranks and hence is precisely a flag v ⊂ e ⊂ T. This excludes unlisted closure triangles.

For K4, every flag has a unique label permutation (p1,p2,p3,p4). The two flags through any new edge differ by one adjacent transposition: positions 1–2 for a fixed (e,T), 2–3 for fixed (v,T), or 3–4 for fixed (v,e). Thus every new edge lies in exactly two flags of opposite permutation parity. The graph D whose vertices are flags and whose edges correspond to new graph edges is bipartite. Its unsigned vertex-edge incidence matrix B is precisely the triangle-edge incidence matrix of X(K4).

Signing all rows in one side of D makes every column have one +1 and one −1. For each square submatrix, either some column has at most one nonzero and determinant expansion applies inductively, or every column retains both entries and the row sum is zero. This proves total unimodularity directly. Transposition, row signs and adjoining unit rows preserve the property by the same determinant argument.

The continuous LP pair is

    min { w^T y : B y ≥ 1, y ≥ 0 },
    max { 1^T x : B^T x ≤ w, x ≥ 0 }.

Here y is indexed by actual graph edges and x by actual flag triangles. For integer w, both constraint systems have integral right-hand sides and totally unimodular coefficient matrices. At any vertex, an invertible tight square submatrix has determinant ±1, so Cramer's rule gives integer coordinates. The packing polytope is nonempty and bounded: each triangle variable is bounded by the capacity of any of its three edges. The covering problem is feasible and, because w is nonnegative, each coordinate can be truncated at 1 without violating a row whose demand is 1. Its optimum can therefore be attained in the compact box 0 ≤ y ≤ 1; adding these bounds preserves total unimodularity. Its integral optimum is an edge set. Strong finite LP duality now gives the asserted equality of integer packing and edge-set cover optima. This argument includes zeros in w and does not infer universal integrality from finite weight tests.

At unit weights, either parity class consists of 12 edge-disjoint triangles and the 12 rank-1/rank-2 edges meet every flag exactly once. These feasible witnesses plus weak duality establish ν=τ=12. The old K4 has ν=1 and τ=2. For any integer w, writing the common new optimum as z, the proposed weighted transfer would require 2r ≤ z ≤ r with r>0, an immediate contradiction. The unweighted instance is the special case z=12. No theorem about Tuza's conjecture on the target class is needed to disprove this transfer gate.

## Repeated subdivision and exact scope

The general sufficient hypothesis is combinatorial: every old edge belongs to exactly two actual old triangles, and cyclic orientations of all these triangles give opposite directions on every common edge. Isolated old vertices are harmless. No additional surface, connectedness or vertex-link hypothesis is needed.

Color each flag according to whether its triangle orientation directs its edge away from the flag vertex. The two flags through a new (v,e) edge have opposite colors by old coherence. Those through (e,T) have opposite colors because they use opposite endpoints. Those through (v,T) have opposite colors because the two incident edges of a cyclically oriented triangle are incoming and outgoing. These three cases also prove that every new edge belongs to exactly two actual new triangles. Thus the new flag dual is bipartite and the same integer-weight equality follows.

Orient each small triangle in cyclic increasing-rank order for one color and the reverse order for the other. On any common edge the rank pair is fixed, so the two opposite-colored triangles induce opposite directions. This proves preservation of the entire hypothesis, including both the exactly-two condition and coherent orientations. The tetrahedral boundary admits such orientations, so induction proves the claimed result for every positive number of iterations. This is an all-iteration ordinary proof; checking two iterations is only a literal construction control.

The obstruction rules out the specified common-scaling numerical transfer from all finite simple input graphs, including every positive iteration of this particular operation on K4, even when integer edge capacities are chosen freely. It does not refute a transfer required only on positive-defect graphs, nor transfers with additive corrections or materially different gadgets. It is not a counterexample to Tuza's conjecture.

## Independent literal evidence

`checks/barycentric_transfer_independent.py` builds the base K4 from its six literal edges; enumerates all actual triangles; constructs all face-comparability edges; enumerates all actual triangles again after each of two iterations; checks exact flag closure and the two-triangle incidence condition; checks opposite flag colors, coherent orientations and explicit packing/cover certificates. The first-step flag colors are also independently compared with permutation parity.

Results:

| Graph | Vertices | Edges | Actual triangles | Exact ν=τ |
|---|---:|---:|---:|---:|
| X(K4) | 14 | 36 | 24 | 12 |
| X²(K4) | 74 | 216 | 144 | 72 |

Three explicitly constructed integer-capacity families per graph are checked by equal-valued primal/dual certificates, including zero capacities and triangle multiplicities greater than one. These families are generated from nonnegative integer flag potentials x using w_e=x_a+x_b for the incident flag pair. The rank-1/rank-2 edge set meets each flag exactly once, so its cost equals the feasible packing value Σx. They are not exhaustive weight tests and are not used as the proof of universal equality.

Reproduce on the authorized Mac:

    source LOCAL_ENVIRONMENT
    cd https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-19
    python3 checks/barycentric_transfer_independent.py

Checker SHA256: `bc996883b881f3c71c6f9c516c24894169803a0629901e76b350c82f92bcc467`.
Initial successful full literal receipt: `evidence/barycentric_independent_review/literal_check.json`, SHA256 `8d2777f88ed567b476fa599f5a740bb318556598d1831d224b5667bc7fef2026`. The receipt preserves all face labels, edges, actual triangles, incidence pairs, colors, orientations and certificates, together with host, Python and source hashes. Rerunning updates its timestamp and hash. No solver, random-minor test, imported producer code, remote computation or formal verification was used.
