> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# TUZA-10 ordinary proofs and obstructions

Status: ordinary mathematics, no Lean theorem. R remains unresolved in this session. No historical novelty is claimed. The accepted hypotheses in [RAINBOW_FORMULATION.md](RAINBOW_FORMULATION.md) are unchanged.

## 1. A complete restricted theorem, from known machinery

Let J be a finite disjoint union of cycles, each of length at least four, properly edge-colored so that each color occurs at most twice. Let k count its alternating bichromatic C4 components. Then

    vc(J) <= 2k + (9/5)(rho(J,c)-k) <= 2rho(J,c).

Equality in the last bound holds if and only if every component is an alternating bichromatic C4 (the empty graph is included vacuously). If no remaining cycle has length five or seven, replace 9/5 by 5/3.

**Proof.** The color-line graph L has one vertex for each J edge, with adjacency for endpoint or color conflict. Its independent sets are precisely rainbow matchings of J. Each vertex has two cycle-neighbors and at most one additional color-neighbor, hence maximum degree three. If four vertices form a K4, all degree slots are internal, so in particular both cycle-neighbors of each vertex lie among the four. Thus they form one whole cycle of J, which is C4. Its opposite pairs must be the two equal-color pairs. Conversely such a C4 creates a K4 component of L; its colors occur nowhere else.

Delete these k components. The remaining L has no K4 component. Brooks' theorem yields a 3-coloring: components of maximum degree at most two can be colored with three colors directly; every connected component of maximum degree three other than K4 is three-colorable by Brooks. Thus rho(J')=alpha(L')≥|E(J')|/3. For every cycle of length l≥4, vc(C_l)=ceil(l/2)≤3l/5. Summing gives vc(J')≤3|E(J')|/5≤9rho(J')/5. Deleted components have disjoint palettes, so both relevant quantities add: vc=2k+vc(J'), rho=k+rho(J'). If J' is nonempty then rho(J')>0 and 9rho(J')/5<2rho(J'), proving the equality characterization. If odd cycle lengths5 and7 are excluded, ceil(l/2)≤5l/9 on every residual cycle; the same argument gives 5/3. QED.

The exact correspondence is Le–Pfender's color-line graph, and Brooks is the substantive standard theorem. This is a derived restricted result rather than an asserted original method; see the historical PRIOR_ART.md and rainbow source-audit records (not included in this public archive); the companion report gives current public references. The ordinary proof is complete for arbitrary cross-component repeated colors. Adding independent component rainbow numbers without checking palettes would be invalid.

Editorial correction in this curated copy: the historical aside incorrectly described odd cycles as having chromatic number four. Odd cycles have chromatic number three; the degree-at-most-two case is handled directly. The theorem and Brooks deduction are unchanged.

## 2. The specific unproved sharpening

For the same class, conjecture vc(J)≤2k+(5/3)(rho(J,c)−k). A single C9 with consecutive colors a,b,a,c,d,c,e,f,e has vc=5 and rho=3: each of the three consecutive triples of edges permits at most one selection, while their middle edges form a rainbow matching. Thus5/3 would be best possible for abstract J after the C4 exceptions.

Only the extension across short odd cycles (length5,7) is missing from section1's argument. In precise conflict-graph form the needed bound is alpha(L')≥(3/5)sum_C ceil(|C|/2), where L' is a disjoint union of designated cycles plus a matching of color-conflict edges, with no K4 component. Finite survival is not a proof of this bound. There is no established induction/exchange lemma controlling all cross-cycle color links, so this is insufficient for GO. It may be easier than R because every conflict degree is at most3 and color conflicts form a matching; arbitrary R has neither property. Historical priority remains unresolved in the bounded search.

## 3. Why the half-integral reduction is false

The separate exact Petersen witness/proof file from the exact certificate calculation supplies an admissible proper triangle-free instance with x=1/3, yet no feasible x in {0,1/2,1}. Its short linear identity forces one coordinate to equal1/3 in EVERY feasible solution. Therefore an arbitrary feasible certificate cannot first be replaced by a feasible half-integral certificate. Ordinary uncolored fractional perfect-matching half-integrality does not survive the simultaneous color inequalities.

This refutes mechanism2's auxiliary claim in the historical IDEAS_FIRST.md record (not included in this public archive), not R. The witness has vc=6 and rho=4. Section4 proves it is not a TUZA09 graph-realizable support system, so it does not refute a more restricted graph-realizable half-integrality assertion. No such assertion is proved here.

## 4. A genuine realizability restriction: repeated-color path closure

Let J be obtained by the COMPLETE TUZA09 reduction from a simple graph G with optimal zero/half cover and triangle-free positive support B. If four distinct J vertices e1,e2,e3,e4 form a path and c(e1e2)=c(e3e4), then J also contains e1e4 with color c(e2e3).

**Proof.** Write the repeated zero edge as ab. The first and last J edges represent distinct G triangles abu and abv, u≠v and u,v outside {a,b}. Thus {e1,e2}={au,bu}, {e3,e4}={av,bv}. Because e2 and e3 lie in a common graph triangle, they meet. The only possible cross-pair intersections are au with av, or bu with bv. Interchanging a,b if needed, take e2=au and e3=av. Their triangle forces the edge uv, which is its zero edge and the color c(e2e3). Now e1=bu and e4=bv, and uv also completes the graph triangle buv. The complete triangle family therefore creates e1e4 with the same color uv. QED.

Consequences:
- For cycle-union J, the forced alternating C4 is an entire component. With color multiplicity≤2, removing those components leaves a TRIANGLE-FREE subcubic color-line graph. Indeed a conflict triangle either consists of three pairwise incident J edges (impossible in a triangle-free graph of degree2), or contains a same-color pair; properness makes that pair disjoint and the third edge gives the path just analyzed. Three equal colors are excluded by multiplicity≤2.
- The no-half-integral Petersen witness is not graph-realizable: J path0-1-2-3 has colors0,1,0 but J edge03 is absent. Thus the abstract obstruction cannot be silently imported into G-triangle supports.
- The C9 extremizer in section2 also violates this closure: each repeated-color three-edge path lacks its closing chord. Its sharpness is only abstract.

This closure is an elementary consequence of full graph-triangle incidence, related to the pair-hypergraph closure constraints in Aharoni–Zerbib. We do not claim it is historically new. It does not characterize all realizable systems.

**Rejected construction, preserved for accuracy.** Adding a hub to the seven-cycle squared and declaring both rim edges and spokes positive would produce an appealing two-cycle conflict pattern only if all-positive triangles were omitted. It is invalid: the hub with two consecutive rim vertices makes a triangle inside B. Therefore it is not evidence for a graph-realizable lower bound. The error was caught before any result used it.

## 5. Primary mechanism gap and a limited LP fact

The endpoint set S of a maximum rainbow matching M need not cover J; edges of J[V\S] may repeat used colors. Vertex saturation and color capacities give global mass inequalities, but no replacement operation has been proved that converts these into a vertex cover of size2|M|. Endpoint/color deletion need not preserve vertex saturation. Therefore an induction invoking R on that residual would be circular or invalid without an additional feasible residual certificate.

For nonempty J, every extreme feasible x has at least one coordinate≥1/2. Here is a self-contained proof. Let m be its positive-coordinate count, n the number of vertices, q the number of tight color constraints. If all positive x<1/2 then every vertex and every tight color needs≥3 incident positive entries. Hence n≤2m/3 and q≤m/3. If n+q<m, the active equality matrix on the positive support has deficient column rank. If equality holds, every support edge is in a tight color and sum(vertex rows)=2sum(tight-color rows), again giving rank<m. A nonzero kernel perturbation in both directions preserves positivity and all strict slacks for sufficiently small magnitude, contradicting extremality. QED.

This elementary sparse-extreme-point observation is not half-integrality, and supplies no saturation-preserving induction. The empty graph must be excluded from the coordinate assertion.

The rho=1 classification in [INDEPENDENT_MECHANISM_NOTES.md](INDEPENDENT_MECHANISM_NOTES.md) is also an ordinary proof (only K2 or an alternating C4 can occur under all hypotheses). It does not resolve rho≥2. No credible bounded general proof architecture emerged from these facts.

## 6. Implications and campaign decision

Cycle theorem -> standalone restricted cover/rainbow bound -> support-preserving Tuza only when the exact TUZA09 auxiliary J satisfies the cycle/multiplicity conditions -> NO established reduction to arbitrary finite G.

The abstract no-half-integral witness -> refutes a proposed fractional-skeleton reduction; it does not refute R, and closure excludes its graph realization.

The 5/3 sharpening has a precise single missing lemma but only finite evidence plus the no-short-odd-cycle case. Neither a plausible formula nor a finite census supplies a GO mandate. Proposed verdict: REDIRECT. Preserve the known-machinery corollary and exact obstructions; do not launch formalization, publication or another autonomous campaign.
