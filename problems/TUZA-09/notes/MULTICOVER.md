> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Multicover splitting: exact obstructions and limits

Status: PROVED_ORDINARY for the elementary results below; no Lean validation. These are independently checked arguments, not claims of historical novelty. All graphs are finite and simple. Write `M_2(G)` for the minimum **unnormalized** integer multiplicity sum with triangle load at least 2. Thus CKSU's normalized `tau*_2` equals `M_2/2`, not `M_2`.

## Initial independent idea generation

Before inspecting the construction, three directions were separated:

1. Treat splitting as a simultaneous coloring problem on single-multiplicity edges, retaining actual graph triangles.
2. Permit rounding to different graph edges, and measure a genuine repair cost against unused packing budget rather than assuming decomposition.
3. Investigate an integer-decomposition property of the triangle-cover polyhedron, distinct from existence of an ordinary cheap cover.

The first and third directions have exact small obstructions. The second remains potentially meaningful only with substantial information beyond multicover optimality; the cone reduction below shows why.

## A. Exact splitting criterion

Let `m:E(G)->{0,1,2}` be any 2-fold multicover. Set `D={e:m(e)=2}` and `S={e:m(e)=1}`. For every triangle avoiding D, either two or three edges belong to S. Define constraints on colors of S:

- If a triangle avoiding D has exactly two S-edges, those edges must receive different colors.
- If such a triangle has three S-edges, its three colors must not all agree.

**Proposition A (PROVED_ORDINARY).** The multiset m can be partitioned into two ordinary triangle covers if and only if these pair and triple constraints admit a two-coloring.

**Proof.** If a partition exists and both copies of a double edge occur on one side, move one copy to the other side. The donor still contains that edge, so its coverage is unchanged; the recipient cannot lose coverage. Normalize all double edges this way. Each side now contains D. Every remaining triangle must see a singleton copy on both sides, giving precisely the constraints. Conversely, place one copy of D on each side and partition S by a satisfying coloring. A triangle containing D is hit on both sides. Every other triangle is hit on both sides by the applicable pair or triple condition. Each side is an ordinary set. QED.

Consequently, decomposability plus `sum m <=4 nu` guarantees **at least one** cover of size at most `2 nu`. It does not itself guarantee both sides have that bound. All positive-multiplicity edges need not be retained in the chosen ordinary cover.

If the graph of pair constraints is bipartite and there are no triple constraints, the condition is satisfied. The absence of triple constraints is essential: Proposition B gives a bipartite pair graph with an unsatisfiable combined system. This criterion is elementary and does not constrain arbitrary-graph Tuza by itself.

## B. An optimal, budget-tight K5 multicover that cannot split

Take vertices 1,2,3,4,5. Put multiplicity 0 on 12 and 34, and multiplicity 1 on all other edges. Its total is 8. No triangle contains both zero edges, so every triangle has load at least 2.

**Optimality.** Consider any integer 2-cover of K5. If no edge has multiplicity zero, its total is at least 10. Otherwise choose a zero edge uv. The three constraints on uvw give sum at least 6 on the six edges joining {u,v} to the remaining three vertices. The triangle on those three remaining vertices adds at least 2. The sets counted are disjoint, so every 2-cover has total at least 8. Thus `M_2(K5)=8`.

**Packing number.** Triangles 123 and 145 are edge-disjoint. Three edge-disjoint triangles would use nine of ten edges. Their union has even degree at every vertex, but deleting one edge from K5 leaves its two endpoints with odd degree. Hence three are impossible, and `nu(K5)=2`. The multicover therefore exactly meets the budget `4 nu=8`.

**No split.** Apply Proposition A. Pair constraints include

`13!=23`, `14!=24`, `15!=25`, `13!=14`, `23!=24`, `35!=45`.

The pair graph is a 4-cycle on {13,23,24,14}, and two isolated edges {15,25}, {35,45}; it is bipartite. Complementing both colors if necessary, let color(13)=0. Then colors(23), (24), (14) are 1,0,1. Write color(15)=a, color(25)=1-a, color(35)=b, color(45)=1-b. The four all-singleton triangles 135,145,235,245 require, respectively,

`a OR b`, `(NOT a) OR b`, `a OR (NOT b)`, `(NOT a) OR (NOT b)`.

For each of the four Boolean assignments to (a,b), one of these clauses fails. Thus no split exists.

Nevertheless an ordinary cover of half the multicover size exists: `{13,24,25,45}`. Its complement is the complete bipartite graph with parts {1,3} and {2,4,5}. The obstruction is to decomposition, not to Tuza and not to rounding to one cover.

This example does **not** show that every optimal 2-cover of K5 is nonsplittable: doubling any minimum ordinary cover gives a decomposable optimal 2-cover. Nor is this specific vector asserted to be produced by CKSU.

## C. K6: a nonsplittable optimal multicover in the CKSU construction

Let G=K6 on vertices 1,...,6, and put m=0 on the perfect matching `{12,34,56}`, m=1 elsewhere. Each triangle contains at most one matching edge, so m is a 2-cover of total 12.

**Packing optimum.** The triangles `{135,146,236,245}` are edge-disjoint and use precisely the 12 positive edges. A packing of five triangles would use all 15 edges; every vertex would then have even degree in their union, contrary to degree 5 in K6. Thus `nu(K6)=4` and 12<=16=4nu.

**Multicover optimum.** On K4, summing its four triangle-load inequalities counts each edge twice and gives `sum m>=4`. For any integer 2-cover on K6, either every edge is positive, giving total at least 15, or some uv has m(uv)=0. Summing the four triangle inequalities uvw forces total at least 8 on edges from {u,v} to the other four vertices. Their induced K4 contributes at least 4. These sets are disjoint, so total is at least 12. Therefore `M_2(K6)=12`.

**No decomposition.** Any split into two covers would color every positive edge red or blue so every triangle already contains both colors. Assign arbitrary colors to the three missing matching edges. This would give a two-coloring of all K6 edges without a monochromatic triangle. Such a coloring is impossible: from any vertex, at least three incident edges have the same color, say red, to a,b,c. If any of ab,ac,bc is red there is a red triangle through the chosen vertex; otherwise abc is blue. QED.

**Precise connection to the published construction (source-specific inference).** For the displayed packing, every external triangle meets at least two packing edges, belonging to distinct packing triangles. Thus all four packing triangles are type 0. CKSU Section 4.1 assigns half to their edges. Section 4.3 has no demanding triangle here, because such a triangle requires exactly one type-0 edge. Hence its construction can return this very multicover without spending the remaining credit.

This last trace uses the source's actual definitions; it is not an implementation reproduction or an audit of its lengthy appendix proofs. It refutes the claim that the construction's output is universally decomposable.

Again, one half-budget ordinary cover exists, even inside the support: `{13,15,35,24,26,46}`. Its complement in K6 is K3,3 with parts {1,3,5} and {2,4,6}. Its complement **inside S** is not another cover. Thus this witness does not refute universal one-cover rounding for the construction's chosen outputs.

## D. Even optimal 2-cover cost cannot universally be halved

Let F be triangle-free and form G by adding an apex a adjacent to every vertex of F. Its only triangles are `{a,u,v}` for `uv in E(F)`.

**Proposition D (PROVED_ORDINARY, known reduction context).** `nu(G)=matching(F)` and `tau(G)=vertex_cover(F)`.

**Proof.** Two apex triangles share an edge exactly when their base edges share an endpoint. Thus edge-disjoint triangles correspond exactly to matchings. A vertex cover U of F gives the triangle cover `{au:u in U}`. Conversely, from any triangle cover C, replace every selected base edge uv by one endpoint spoke au, keeping existing spokes and dropping duplicates. The removed base edge occurs in only its own apex triangle, and its replacement hits that triangle, so this operation cannot uncover any triangle. The final selected spokes correspond to a vertex cover of F and are no more numerous than C. QED.

For F=C5 with vertices 1,...,5 in cyclic order, the five spokes once each give a 2-cover of size 5. Assign weight 1/2 to every one of the five apex triangles. Each spoke belongs to two such triangles and each base edge to one, so this is a feasible fractional triangle packing of weight 5/2. For any 2-cover m, direct multiplication and summation gives

`sum_e m(e) >= sum_T (1/2) sum_{e in T} m(e) >= 5`.

Thus `M_2(G)=5`, while matching(C5)=2 and vertex_cover(C5)=3. In particular `tau(G)>M_2(G)/2`.

For the disjoint union of two copies of this cone, all four quantities add, yielding `nu=4`, `M_2=10`, `tau=6`, and `nu*=5`. Therefore even the softened statement `tau<=ceil(M_2/2)` fails: 6>5. Additivity follows because triangles and graph edges lie entirely within components, so both feasibility and objective costs separate.

This is not a Tuza counterexample: 6<=8=2nu. It says minimizing a multicover can consume the wrong resource for later rounding. The budget slack is material, and a universal successful mechanism must relate repair cost to packing information rather than multicover optimality alone.

The cone reduction is not offered as historically new. CKSU's discussion already invokes Kortsarz--Langberg--Nutov (2010) for a triangle-free vertex-cover reduction; independent proofs above make the exact finite claim checkable. coordinating AI research is auditing related HKT constructions separately.

## E. What survives, and what remains unproved

- REFUTED: every 2-cover with total <=4nu decomposes into two ordinary covers.
- REFUTED: every optimal such 2-cover decomposes; K5 is additionally budget-tight.
- REFUTED: CKSU's particular construction always produces a decomposable 2-cover; K6 is a direct trace.
- REFUTED: an optimal 2-cover can always be rounded to one ordinary cover of at most half its cost, even allowing arbitrary graph edges and ceiling; two C5 cones suffice.
- PROVED_ORDINARY: the exact pair/triple coloring criterion and cone reduction.
- OPEN IN THIS MISSION: whether extra retained packing information can bound a one-cover repair cost by the unused `4nu` budget. Neither the coloring criterion nor a definition of repair cost supplies such a bound.

For a fixed capped multicover with d doubles and s singles, selecting all D and solving the residual pair/triple transversal gives a cover. Its exact forced-D support-restricted cost is `d+tau(H)`. Writing `tau(H)-s/2` as a deficit is only bookkeeping. The needed inequality `tau(H)-s/2 <=2nu-d-s/2` is unproved and can be too strong because a best ordinary cover may omit some D or use zero-multiplicity edges. It must not be presented as a new gap-compensation theorem.

The literature's charging budget is used to enforce half-integral triangle constraints. The preceding exact constructions expose global compatibility requirements absent from the scalar feasibility certificate. A credible continuation would need a new invariant for one-cover exchange, not a blanket splitting lemma. These findings support REDIRECT for this lens, not GO for a proof campaign.
