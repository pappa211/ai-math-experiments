# User-requested AC boundary criticism

Frozen 2026-11-04 within the original TUZA-17 mission. This follow-up answers the user's explicit request to check the matching-three estimate, budget four with larger matching, the next unresolved boundary, and realizability under the full hypotheses. The late critic developed the budget-five classification/elimination below and the coordinator independently checked it. This is collaborative internal AI proof development, not blind final verification. No Lean or separately commissioned final audit was run.

## Definitions and indispensable bound

H is a finite simple graph with a three-colouring of its graph edges rainbow on EVERY actual H triangle. X is a vertex subset and L=H[X] is triangle-free. G adds a fresh apex z with neighborhood exactly X. Write p=nu(G), m=mu(L), b=2p−tau(H), and

    lambda = min {vc(L−C) : C is a MINIMUM H triangle-edge cover}.

AC is precisely lambda≤b. Matching and vertex-cover numbers of L are ordinary graph parameters; nu and tau of H/G are triangle packing and edge-cover parameters.

For any maximum L matching M, deleting its EDGES gives J=H−M. Appending M's m apex pages to an arbitrary J packing proves nu(J)≤p−m. Cover deletion gives tau(J)≥tau(H)−m. J inherits the rainbow triangle colouring, so Aharoni gives

    tau(H)−m ≤ tau(J) ≤ 2nu(J) ≤ 2p−2m.

Therefore m≤b. This bound uses the full AC hypotheses and has the correct direction. At equality m=b every inequality is equality; the already audited saturation proof gives a compatible minimum H cover. It is an existence conclusion, not a conclusion about every minimum cover.

## Direct verification: m=3 really gives vc(L)≤4

Let M be any maximum matching in a triangle-free graph F, and U its unmatched vertices. For every matching edge xy, one endpoint has no neighbor in U. Otherwise neighbors u of x and v of y in U either differ, giving an augmenting path u−x−y−v, or coincide, giving a triangle.

For m=3 choose one such safe endpoint from each matching edge. Among these three chosen vertices, some pair s,t is nonadjacent, since F is triangle-free. Then V(M) minus {s,t} covers all edges: U is independent because M is maximal; neither removed vertex has a neighbor in U; and the two removed vertices are nonadjacent. It has four vertices. Thus vc(F)≤4, with no finiteness-of-search assumption.

The same argument gives vc(F)≤2m−2 for m≥3. Removing just one safe endpoint gives vc(F)≤2m−1 for m≥1. The small values are vc≤1 at m=1, vc≤3 at m=2, and vc≤4 at m=3. C5 and C7 show the latter two bounds can be tight.

## Budget four: exact quantifiers

If b=4:

- m≤3: every minimum H cover C works, since deleting C cannot increase vc(L), and the bounds above give vc(L−C)≤vc(L)≤4.
- m=4: the saturation theorem supplies at least one compatible minimum H cover. The argument does not assert that every minimum cover works.
- m≥5: impossible under the AC hypotheses, because m≤b=4.

Thus there is no remaining budget-four case. A putative graph with b=4 and m≥5 must fail at least one asserted optimum or eligibility hypothesis; it cannot be an overlooked hard AC instance.

## Classification at the apparent next boundary

**Lemma.** A finite triangle-free graph F with mu(F)=4 and vc(F)=6 is exactly the disjoint union of two C5s and isolated vertices.

**Proof.** If some vertex v is covered by every maximum matching, then mu(F−v)=3. The previous estimate gives

    vc(F) ≤ 1+vc(F−v) ≤ 1+4=5,

contradiction. Hence no vertex is universally covered by maximum matchings.

Apply the already proved elementary Gallai argument in A_ELEMENTARY_MATCHING_BLOCKER.md to each connected component. Each nontrivial component has a near-perfect matching and, because every vertex can be avoided by a maximum matching, is factor-critical: deleting any vertex leaves a perfect matching. Such a component with matching number r has 2r+1 vertices. A nontrivial triangle-free component cannot have r=1, since factor-criticality on three vertices would force all three edges. Consequently the nonzero component matching numbers partition four either as 4 or as 2+2.

The first case has one nontrivial component on nine vertices. Every triangle-free graph on nine vertices has an independent four-set. To see this elementarily: a vertex of degree at least four has four independent neighbors; a vertex of degree at most two leaves at least six vertices outside its closed neighborhood, and every triangle-free six-vertex graph has an independent triple, which can be joined to the original vertex. The remaining possibility, every degree exactly three, is impossible on nine vertices by the handshake parity identity. The six-vertex observation is the elementary Ramsey argument: for any vertex, three neighbors give an independent triple; otherwise at least three nonneighbors contain a nonadjacent pair, unless they form a forbidden triangle. Thus the nine-vertex component has vertex cover at most five, contradiction.

In the second case each component is triangle-free and factor-critical on five vertices. It cannot be bipartite: a near-perfect matching would cover every vertex in the smaller side, contradicting the absence of a universally covered vertex. Hence it contains an odd cycle, necessarily C5; any additional chord would create a triangle. Both components are exactly C5. Isolated vertices are harmless. QED.

This is an unbounded classification for matching number four; no enumeration of all ambient graph orders is being claimed or used.

## Budget five is also settled

**Theorem.** Under the literal AC hypotheses, AC holds whenever b≤5.

The previously audited argument settles b≤4. Suppose b=5. Matching bound m≤5 applies. If m=5, use saturation. If m≤3, the ordinary vertex-cover bound gives vc(L)≤4, so every minimum cover works. If m=4 and vc(L)≤5, again every minimum cover works. The only apparent difficulty has m=4 and vc(L)=6, so the classification gives L=2C5 plus isolates.

Assume for contradiction that AC fails here. Since vc(L)=6 and b=5, every minimum H cover C must leave vc(L−C)=6. But deleting ANY single edge of either C5 lowers its vertex-cover number from three to two, and hence lowers vc(L) from six to five. Therefore NO minimum H cover contains ANY edge of L.

For e in E(L), this forces tau(H−e)=tau(H). Indeed, if deletion lowered tau by one, a minimum cover of H−e together with e would be a minimum H cover containing e, contradiction. The general one-edge cover-loss bound rules out a larger decrease.

Take a maximum matching M of L, with |M|=4, and put J=H−M, k=p−4. Delete one matching edge first at zero cover cost; the other three cost at most three. Thus

    tau(J) ≥ tau(H)−3 = (2p−5)−3 = 2k.

The original matching-state bound and Aharoni give tau(J)≤2nu(J)≤2k. All terms are equal, so J is tight. The audited tight-matching-deletion transfer (B_FROZEN_ADDENDUM_2.md) splits the instance by the two link components. Each has matching number two, so each satisfies AC; the transfer proves AC for the whole instance, contradiction.

This proves absence of AC FAILURE at b=5. It does **not** prove that no eligible instance can have the numerical triple b=5, m=4, vc(L)=6. In such an instance a compatible minimum cover must exist. Numerical realizability and violation realizability are different claims.

## Exact first stratum not covered by these proofs

A useful additional bound is:

    triangle-free mu(F)=5 implies vc(F)≤7.

If a universally covered vertex exists, delete it and use vc≤6 for matching number four, then add the vertex back. Otherwise the same Gallai component argument leaves nonzero matching partitions 5 or 3+2. In the first case the nontrivial component has eleven vertices, contains an independent four-set by the nine-vertex argument, and has vertex cover at most seven. In the second case the components have seven and five vertices, with vertex-cover bounds four and three. This proves the estimate. No external Ramsey theorem is left unproved.

Consequently, at b=6, a failure can only have

    m=5, vc(L)=7, lambda=7.

Here m≤4 is automatic from vc(L)≤6, m=6 is saturation, and m≥7 is impossible. Thus b=6, m=5, vc(L)=7 is the first **conditional numerical stratum** not settled by the current proofs. It is not a claimed realized AC counterexample or even, without an H construction, a demonstrated full apex instance at that budget.

The remaining task includes simultaneously realizing an eligible H, its exact tau(H), the exact apex packing p, b=2p−tau(H)=6, the specified induced link, and the minimum-cover interaction. Passing searches cannot establish that this stratum is empty; a link graph alone cannot establish that it is nonempty under the full budget constraint.

## Realizability controls, with explicit limits

`checks/critic_boundary.py` and `evidence/critic_boundary.json` give two deliberately separate controls.

1. **An actual connected link shape.** On vertices Z/11Z, join i to i±1 and i±4. Direct exact enumeration checks triangle-freeness, mu=5, alpha=4 and vc=7, and supplies a proper vertex three-colouring. This realizes the link parameters. Taking H=L itself is eligible but gives tau(H)=0 and nu(G)=5, hence b=10, not b=6. It therefore does not realize the first uncovered apex stratum.

2. **Actual budget/matching numbers without the hard cover parameter.** Let L be a five-edge matching on ten vertices. Add one old common hub adjacent to all ten vertices, and a disjoint old triangle. H has six edge-disjoint old triangles and tau(H)=nu(H)=6. Adding z adjacent to the ten link vertices permits at most one page on each matching edge plus the disjoint old triangle, so nu(G)=6. Thus b=6 and m=5 are genuinely realized by a properly four-colourable eligible H. However vc(L)=5 and choosing its five rim edges plus one edge of the isolated triangle gives lambda=0. This is automatic for AC and does not realize vc(L)=7.

As of this freeze, this critic has NOT established a full eligible H realizing all of b=6, m=5 and vc(L)=7 together. The coordinator assigned a separate bounded construction attempt. Its outcome must be stated separately and must not be replaced by either control above. No nonexistence conclusion is drawn from the absence of such a construction here.

## Evidence and status

The boundary control script completed in 0.216 seconds under a 60-second/512 MiB sampled-RSS watchdog. It imports no producer code. The unbounded proofs above are ordinary arguments, with Aharoni/HNS used only through the already audited matching bound, saturation and tight-residual component transfer. The classical Gallai reasoning is fully proved in the mission's elementary supplement.

Budget four: SETTLED, with the every-cover/existence distinction explicit. Budget five: SETTLED by the classification and minimum-cover exclusion argument. First conditional unresolved numerical stratum: b=6, m=5, vc(L)=lambda=7. Full realization of that stratum and full AC: NOT_ESTABLISHED by this review. Independent_final_verification: NOT_RUN.
