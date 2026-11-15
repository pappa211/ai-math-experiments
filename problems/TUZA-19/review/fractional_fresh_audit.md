# Independent fresh-context AI audit: unique half-cover embedding

Review completed 2026-11-15, within the original TUZA-19 research clock. Verdict: **the frozen theorem and its stated obstruction scope survive this independent reconstruction; no mathematical correction is requested.** This is an ordinary mathematical AI review plus separate finite computation, not human review or Lean verification. It does not establish unrestricted Tuza.

## Input identity, controls, and independence

- Frozen input: `notes/fractional_routes_halfcover_embedding.md`.
- SHA-256: `6166d3f4202cb91769e09508ba6601db56f320e06b6a2032e9b6960c738d7434`, matched before reconstruction and after checker execution.
- Requested reviewer controls communicated by parent: Astra / Ultra. The review context does not independently expose the actual serving model or reasoning-effort value. The general developer identity says Codex based on GPT-6; this is not evidence of an independently verified precise model identity.
- Mission start retained: `2026-11-15T01:53:58Z`; research cutoff retained: `2026-11-15T09:23:58Z`; hard deadline retained: `2026-11-15T09:53:58Z`. No clock was reset. Review clock observations: `02:13:41 UTC` and `02:16:42 UTC`.
- Host observed directly with `uname -s`: Darwin. Canonical `LOCAL_ENVIRONMENT` directory was observed. Computation ran only on that local host.
- Inputs read before the initial reconstruction verdict: this frozen note, `AGENTS.md`, `MISSION.txt`, and `operations/clock.json`. No producer checker, producer evidence, `RESEARCH_LOG`, executive status, or separate favorable review was read. No external source was needed for the elementary theorem. No historical repository was accessed.
- Independence qualification: the frozen note itself contains the producer sentence saying the root had found no immediate defect. That sentence was inevitably visible as part of the assigned input; the reviewer did not consult any supporting review or use that sentence as mathematical evidence.
- The initial proof assessment was sent to the parent before writing or running the checker. The checker was independently authored from the reconstructed definitions and imports only the Python standard library.

Additional exact input hashes:

| Input | SHA-256 |
|---|---|
| `AGENTS.md` | `03130ddf542fa57094ec18d43a81cf9e306073fd5defa27079347ea791ed18cf` |
| `MISSION.txt` | `26356f13532fa68c7a3362f42c65369abec51adb49531c18549f509e1fe42cda` |
| `operations/clock.json` | `db8baaaf29708e4be97741aa4ce9df1216c63c4895ab50bbdda5c9eeca715781` |

## Reconstruction for the full quantifiers

Let J be any finite simple graph, with isolated vertices allowed, and orient each of its m edges independently in either direction. For each oriented edge uv, use four vertices that occur in no other attachment, and place a wheel with apex u and rim v,a,b,c,d. The argument below needs no property of J, no bound on its order, and no condition on the orientation.

Each wheel has ten distinct edges. Its only edge with both ends in the original vertex set is uv. Thus another wheel cannot duplicate any of its fresh-vertex edges, and a different original core edge cannot duplicate uv. This proves edge partition and counts |V(J)|+4m vertices and 10m edges.

For triangle ownership, take a triangle with a fresh vertex q. Both other vertices must be neighbors of q, and all such neighbors belong to q's own wheel. Hence all three vertices lie in that wheel. The graph induced on those six vertices has only the wheel edges: among its two original vertices the sole possible edge is uv, which is already present; all other edges touch a vertex fresh to this attachment. A five-cycle rim has no triangle or chord, so the only triangles in the wheel are its five apex/rim-edge triangles. Triangles with no fresh vertices are exactly the triangles of J. This proves the exhaustive disjoint classification and 5m+t(J) count. Sharing arbitrarily many original endpoints among attachments introduces no overlooked triangle family.

Write H for all wheel spokes. The proposed cover x has x_e=1/2 on H and zero otherwise. Every wheel triangle has two spokes, hence load 1; every original triangle has three spokes, hence load 3/2. The proposed packing y gives 1/2 to every wheel triangle and zero to original triangles. Every spoke lies in exactly two wheel triangles and every rim edge in exactly one, so its edge loads are respectively 1 and 1/2. Both vectors are feasible and have value 5m/2, giving the fractional optimum by weak duality.

To prove uniqueness, a fractional triangle cover means nonnegative edge weights with each triangle's weight sum at least 1; adding the usual upper bounds x_e<=1 would not affect the proof. For an arbitrary optimal cover z, subtracting the dual objective gives the identity

    sum_e z_e - sum_T y_T
      = sum_e z_e (1-load_y(e))
        + sum_T y_T (sum_{e in T} z_e - 1).

Every summand is nonnegative, while their sum is zero. Consequently every rim coordinate is zero and every wheel-triangle inequality is tight. The five spokes of a wheel therefore satisfy z_i+z_(i+1)=1 cyclically. The recurrence z_(i+1)=1-z_i alternates, and the fifth equation forces z_0=1-z_0, so all five coordinates are 1/2. Edge partition determines all coordinates. This proves uniqueness in the full fractional LP, which implies uniqueness among optimal half-integral covers under either customary interpretation of that term.

On original vertices H contains exactly E(J). Every added vertex has precisely one incident edge in H, its apex spoke. Thus J occurs as the induced original-vertex graph, with only four additional leaves per edge. Taking complete graphs proves unbounded chromatic number; arbitrary induced J also gives arbitrary core geometry and unbounded treewidth. No imported treewidth theorem is needed for the construction; the standard monotonicity of treewidth under taking subgraphs yields the stated consequence.

There are no tight original-triangle inequalities because their load is 3/2. Each tight two-spoke constraint joins consecutive spokes in one wheel. Each spoke belongs to exactly its own wheel, including its marked core spoke. Therefore the graph of tight pairs is exactly m separate C5 components, even if the original vertices are heavily shared.

For packing, any selection of edge-disjoint local triangles in a wheel corresponds exactly to a matching of the rim C5: adjacency of two rim edges means sharing the apex spoke at their common rim vertex, and disjoint rim edges give edge-disjoint apex triangles. Hence at most two local triangles can be used per wheel. The original triangles in any global packing form a packing of J, giving nu(W)<=2m+nu(J). The triangles uab and ucd are disjoint in each wheel and avoid uv. Across wheels their graph edges remain disjoint. They can be combined with every triangle of any maximum packing of J, giving equality.

For covering, restrict any global edge cover to one wheel. Only wheel edges can hit its five local triangles. Replace any selected rim edge by either of the incident apex spokes; that rim edge appears in only its own local triangle, which its replacement also hits. Replacements can reduce size by duplication but cannot increase it. The resulting spokes correspond to a vertex cover of C5 and need at least three elements. Therefore every global cover uses at least three edges in each disjoint wheel edge set, proving tau(W)>=3m. Selecting the spokes to v,b,d covers all five local triangles and includes uv. Doing this in every wheel selects all original graph edges and therefore covers all original triangles. It uses exactly 3m edges, proving equality.

For m=0 every edge set and triangle family is empty. The unique fractional vector is the empty vector, even when there are arbitrary isolated original vertices. Both integral parameters are zero. All four theorem items remain correct.

## Objections tested and their resolution

No objection below required changing the frozen proof. They are preserved as adversarial checks, rather than omitted because they were resolved.

1. **Could wheels sharing endpoints create an uncounted mixed triangle?** No: any fresh vertex localizes the whole triangle to its own wheel, while triangles entirely on original vertices are retained explicitly.
2. **Could a marked edge be identified across attachments?** No: simple J supplies exactly one attachment per unordered core edge; fresh vertices separate all other edges. Arbitrary orientation does not alter this.
3. **Does exhibiting primal and dual solutions prove uniqueness?** Not by itself. The nonnegative equality-gap identity above supplies the missing implication, and the odd-cycle equations determine every coordinate. The frozen proof already contains this argument.
4. **Can a fractional optimum use negative rim weights or other unconstrained coordinates?** No under the standard nonnegative fractional-cover definition. Every graph edge belongs to one wheel; there are no edge coordinates outside the proof. Isolated vertices add no coordinates.
5. **Does the packing lower bound conflict with core triangles?** No: the selected two local triangles per wheel avoid every original edge; meeting a core triangle at a vertex is allowed in edge-disjoint packing.
6. **Can an external edge cover a local wheel triangle and evade the local lower bound?** No: an edge hitting a triangle must be one of its three graph edges. The edge partition therefore makes the local three-edge lower bounds additive.
7. **Is the claim about all independently chosen local optima too strong?** The note only refutes the universal choice rule. The minimum local cover a,c,d avoids the marked edge, so choosing it everywhere leaves all core triangles uncovered whenever J has one. Conversely v,b,d yields compatible local minima; an existential compatibility theorem survives.
8. **Does the example challenge Tuza itself or its minimal counterexamples?** No. The exact formulas give 2nu(W)-tau(W)=m+2nu(J), with strict positive slack for m>0. It is a universal structural-gate obstruction, not a minimal-counterexample obstruction.
9. **Does failure of the chosen structural gate rule out all fractional rounding?** No. Packing-sensitive schemes could pay for the original triangles using the slack. The note explicitly preserves this possibility. The final decision to stop this particular route is a research judgment, not an impossibility theorem.

## Finite independent computation

Checker: `review/fractional_fresh_checker.py`.

Checker SHA-256: `3090c14955aaf4028cbc8fb89676819c27cf4d27b568bdeda6093e337c773326`.

Output: `evidence/fractional_fresh/checker_results.json`.

Output SHA-256: `5b05e2ec2882b6f77c155a285bdf6c4252504304ae5a519b67a4f893cf42f139`.

Observed execution: Python 3.12.12 on Darwin; PASS, 101 constructions, 100 with independently computed exact integral packing and cover numbers. The recorded checker elapsed time was approximately 0.122 seconds. No external solver, producer checker, or mathematical library was used.

Coverage includes every labeled graph on at most three vertices in every edge orientation; every labeled graph on four vertices in one orientation; additional bowtie, C5, reversed-K4 and mixed-K4 interfaces; and K5 for LP/support geometry only. The checker enumerates all vertex triples of each constructed graph, checks the exact triangle ownership equality, builds the primal/dual certificate with rational arithmetic, and computes the full rank of the equalities forced by positive dual weights and slack dual edge constraints. It separately verifies the support graph, tight components, the compatible cover, and the deliberately incompatible local cover state.

For integral checks, packing is computed as a maximum independent set of the actual triangle-conflict graph using exact recursion and connected components. Covering is computed as a minimum hitting set of the actual triangle list using exact recursion, valid dominance deletion of contained edge-incidence masks, and component splitting. Neither routine returns the asserted closed-form formula; the independently computed integers are compared with it after the computation. These finite tests are diagnostics only. The arbitrary-J theorem rests on the reconstruction above.

Reproduce from the mission workspace:

```sh
source LOCAL_ENVIRONMENT
python3 review/fractional_fresh_checker.py
```

The output records elapsed time, so a repeat changes the output-file hash even when every mathematical result agrees.

## Verification boundary and final assessment

The full elementary theorem, all orientations, isolated vertices, edge and triangle counts, unique fractional optimum, tight-pair geometry, exact integral parameters, and the declared structural-gate obstruction were reviewed. The wording about EVERY-local-optimum failure and existential compatibility is accurate. No unresolved mathematical objection to those claims was found.

Historical attribution, originality, and the accuracy of the summaries of TUZA-09, TUZA-14B, TUZA-16 and the two cited papers were not audited. Those sources are not dependencies of the elementary result, and the review does not inherit their verification status. No claim was made about proving unrestricted Tuza, a universal rounding theorem, or applicability to hypothetical minimal violations. No Lean or other formal verification was run. The appropriate status is: **ordinary proof independently reconstructed by a separate AI context, with independent finite diagnostic checks, and no claim of human or formal verification.**
