> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# TUZA-09 — LP geometry, exact obstructions, and a restricted colored reduction

Status: ordinary mathematical arguments, not Lean proofs. No historical-novelty claim. AI-produced ordinary proof notes; subsequently reviewed internally.

## 1. Initial independent possibilities

Before selecting a route, three different possibilities were considered:

1. Round an optimal fractional cover using its zero/half/large coordinate structure and complementary slackness. This is already substantially present in Chapuy et al.; a novel claim needs additional control by the integral packing.
2. Bound the covering gap by the packing gap, or make quantitative packing integrality force covering integrality. The exact cone examples below refute this entire form of inference.
3. Translate a carefully restricted optimal support into a properly colored graph, so that triangle packings become rainbow matchings. This retains the resource collisions discarded by ordinary fractional rounding, but the resulting target remains unproved.

A fourth possibility, a universal fixed denominator for optimal LP solutions, is already ruled out in primary literature; see the source audit. No computation of only small denominators can establish that hypothesis.

## 2. Exact cone correspondence

**PROVED_ORDINARY.** Let H be any finite triangle-free simple graph, and let G be its cone: add a new vertex a and all edges av, v in V(H). Write m(H) for the ordinary matching number, m_f(H) for the fractional matching optimum with constraints sum_{e incident v} x_e <= 1, and vc(H) for the ordinary vertex-cover number. Then

    nu(G) = m(H),   nu*(G) = tau*(G) = m_f(H),   tau(G) = vc(H).

**Proof.** Every triangle of G is uniquely a-u-v-a for an edge uv of H, because H has no triangles. Two such triangles share a spoke if and only if their corresponding H-edges meet. Distinct triangles never share their rim edge. Thus integral triangle packings correspond exactly to matchings of H. The fractional constraints at spokes are exactly the vertex-capacity constraints for a fractional matching of H; the additional rim constraint x_uv <= 1 is redundant. This proves the packing equalities.

For a vertex cover S of H, the spokes {av:v in S} meet all triangles, so tau(G) <= vc(H). Conversely, in any triangle edge cover C of G, replace each selected rim edge uv by one of its incident spokes, say au. A rim edge lies in just one triangle, which the replacement still meets. Replacements can only decrease cardinality. At the end only spokes are selected, and their H-endpoints form a vertex cover. Therefore vc(H) <= tau(G). LP duality gives the remaining equality. QED.

The integral cone reduction is known in HKT and Chapuy; the complete displayed parameter correspondence is supplied here with an elementary proof to make the mission's inference independently checkable. It is not represented as new research.

## 3. A finite exact obstruction with p=0, q>0

**PROVED_ORDINARY / REFUTED AUXILIARY CLAIMS.** Let H be the Petersen graph, with vertices 0,...,9 and edges

    01,12,23,34,40,
    05,16,27,38,49,
    57,79,96,68,85.

Let G be its cone with apex 10. Then

    (nu,tau,nu*,tau*) = (5,6,5,5),   (p,q)=(0,1).

The five spoke-pair triangles {10,i,i+5}, i=0,...,4, are edge-disjoint. Every triangle uses two of the ten apex edges, proving nu <= 5. Assign fractional covering weight 1/2 to each apex edge and zero to every rim edge. Its total is 5 and it meets every triangle with equality. Together with the integral packing this proves exact primal/dual optimum 5; no floating-point LP inference is needed.

For completeness alpha(H)=4 has this elementary certificate. Identify vertices 0,...,9 respectively with

    12,34,15,23,45,35,25,24,14,13,

where ij denotes the two-element set {i,j}. The displayed graph has adjacency exactly when two sets are disjoint. It is triangle-free, since three pairwise disjoint two-element subsets would require six elements. An independent set is a pairwise intersecting family of two-element subsets of a five-element set. If all sets contain a common element, there are at most four. Otherwise, choose intersecting sets 12 and 13 after relabeling. A member omitting 1 must be 23. Every set meeting 12,13,23 is one of those three unless it contains 1 and also 2 or 3, which is again one of them. Hence such a family has at most three. Four are attained by the pairs containing 1, corresponding to vertices {0,2,8,9}. Thus vc(H)=10-4=6; six apex edges at the complementary vertices form an actual optimal triangle cover of G.

This refutes each universal assertion q <= C p for a finite nonnegative constant C; p=0 implies q=0; and existence of an integral optimal triangle packing LP solution implies an integral optimal triangle-cover LP solution. It does not refute Tuza or interpolation.

The root's exact certificate file [EXACT_RESULTS.json](../certificates/EXACT_RESULTS.json) independently verifies this graph under the same standard labels. The ordinary argument above does not rely on that code.

## 4. Packing integrality can coexist with asymptotically full covering gap

**PROVED_ORDINARY conditional only on the standard existence of triangle-free graphs with independence ratio tending to zero.** That existence is explicitly used in the inspected HKT construction.

For any triangle-free H on n vertices, construct D(H) with two disjoint labeled copies H x {0,1} and the additional matching edges (v,0)(v,1), one for each v. D(H) is triangle-free: a triangle within one layer would be a triangle of H; a triangle meeting both layers would need two cross-layer edges incident with a common vertex, but cross-layer edges form a matching. Its n cross edges give a perfect matching, and no matching on 2n vertices exceeds n. Every independent set intersects either layer in an independent set of H, so alpha(D(H)) <= 2 alpha(H).

Take G to be the cone over D(H). The cone correspondence and the perfect matching prove

    nu(G) = nu*(G) = n,
    tau(G) = 2n-alpha(D(H)),
    p(G)=0,
    q(G)=n-alpha(D(H)) >= n-2alpha(H).

The fractional upper certificate is again 1/2 on all 2n spokes, and the matching supplies an integral lower certificate. Also tau(G) <= 2n is immediate. If alpha(H)/n tends to zero, then q(G)/nu(G) tends to 1. Every G is K4-free because its base D(H) is triangle-free.

Consequences: no universal bound q <= (1-epsilon)nu with fixed epsilon>0 holds, even under p=0 and K4-freeness; likewise q=o(nu) under p=0 is false. In particular, exactness of the packing LP does not make covering rounding negligible. These are elementary consequences of known cone/Ramsey mechanisms; novelty is not asserted. Tuza itself holds for every cone here, since the endpoints of a maximal matching of its base form a vertex cover of size at most twice the matching number. The family diagnoses information loss in a proposed bridge; it is not evidence against Tuza.

## 5. The whole linear gap frontier is unavoidable

**PROVED_ORDINARY.** For each theta in [0,1], the closure of the set of achievable normalized gap pairs (p/nu,q/nu) for finite simple graphs with nu>0 contains (theta,1-theta).

All four parameters nu,nu*,tau,tau* are additive under graph disjoint union: triangles never cross components, feasible solutions restrict independently, and optimum component solutions combine. Each K4 has (nu,p,q)=(1,1,0). For theta<1 take a prism-cone graph from section 4 with packing n, and a_n disjoint K4 copies, where a_n/n tends to theta/(1-theta). The union has nu=n+a_n, p=a_n, q=(1-o(1))n, giving the claimed limiting pair. The endpoint theta=1 is achieved by K4 itself.

Hence, for nonnegative real coefficients A,B, any valid universal inequality A p+B q <= C nu requires C >= max(A,B). This is only a necessary condition, not a proof of any such inequality. It rules out improving the linear compensation frontier inward and demonstrates why a successful sharp mechanism must accommodate both endpoint geometries and their disjoint mixtures.

## 6. Interpolation has no easy counterexample test

**OPEN IN THIS MISSION:** tau(G) <= nu(G)+nu*(G) for all finite simple graphs. No proof or refutation was obtained; bounded searches did not establish its literature status. It is weaker than Tuza because nu*>=nu. A counterexample to interpolation would automatically violate Tuza. Therefore searching small graphs for its refutation is not an easier way to reject a speculative bridge. The examples above approach equality in interpolation with p=0 and show that a uniform improved coefficient is unavailable in that regime. Known Tuza classes automatically satisfy interpolation.

## 7. A precise colored-support reduction

**PROVED_ORDINARY reduction; OPEN target, not a GO recommendation.** Suppose G has an optimal fractional triangle cover y with values only 0 and 1/2. Let B be its positive support and Z its zero edges. Assume the graph with edge set B is triangle-free. Every triangle of G then has exactly two B-edges and one Z-edge: feasibility excludes zero or one B-edge, and triangle-freeness of B excludes three.

Define a graph J whose vertices are the actual edges in B. For every triangle T of G, join its two B-edges by an edge of J, colored by its Z-edge. J is simple, because two different graph edges lie in at most one graph triangle. Its coloring is proper: triangles with the same Z-edge xy have distinct third vertices, and their pairs of B-edges are disjoint.

J is triangle-free. Indeed, three pairwise incident distinct edges of a simple graph are either the three edges of a triangle or three edges of a star. The first option contradicts triangle-freeness of B. In the star option, the three adjacencies in J force all three edges among the star leaves to lie in Z; these form a triangle of y-weight zero, contradicting feasibility.

A collection of graph triangles is edge-disjoint precisely when the corresponding edges of J form a matching with pairwise distinct colors. Thus nu(G) is the rainbow matching number of J. A set of B-edges is a triangle transversal precisely when its vertices form a vertex cover of J. Consequently the smallest cover constrained to B has size vc(J); an unrestricted graph-edge cover could be cheaper by selecting edges in Z.

Because y is optimal, complementary slackness with an optimal fractional packing x makes every edge in B tight. Translated to J, x is a fractional rainbow matching that saturates every vertex of J, with total weight |B|/2 and total weight in each color at most one. These are additional constraints beyond a generic fractional perfect matching.

The unproved target is

    vc(J) <= 2 * rainbow_matching_number(J)

for these graph-derived systems with the stated fractional certificate. It would prove support-preserving Tuza for this restricted class. This is stronger than ordinary Tuza on the class, and no claim is made that it holds. It is not a general reduction of arbitrary G: neither an optimal half-integral cover nor triangle-free positive support is guaranteed. The particular auxiliary graph on half-weight edges already occurs in Chapuy's rounding proof; the proposed use of zero-edge colors is an explicitly recorded extension to investigate, not a novelty attestation.

Dropping optimality is invalid. Let G be a book of k>=3 triangles sharing one edge xy and having distinct third vertices v_i. Put y=1/2 on xv_i,yv_i and zero on xy. Then J is k disjoint edges all of one color, so vc(J)=k and its maximum rainbow matching has size 1. The fractional cover has value k, whereas choosing xy alone gives the true fractional optimum 1. Thus the hypothesis omitted in that attempted generalization is exactly where it fails.

The remaining step is substantial: one needs an exchange theorem controlling both shared B-edges and repeated Z-edge colors while producing a sufficiently small vertex cover. A generic appeal to bipartite matching, complementary slackness, or small LP denominator does not supply it. Current evidence is insufficient to justify a longer campaign on this target.


## 8. Follow-up on the colored-support target

The bipartite auxiliary-graph case is already covered by standard theorems. If J is bipartite, its fractional perfect matching proves an ordinary perfect matching by matching integrality. König's theorem gives vc(J)=|B|/2. Optimality gives |B|/2=nu*(G), so Krivelevich gives vc(J)<=2nu(G). This proves the stronger support-only conclusion in that subclass, but it is a routine consequence of existing results rather than a new bridge. If every zero-edge color appears at most once, rainbow matchings are ordinary matchings; endpoints of a maximal matching of J already give vc(J)<=2nu(G), without needing fractional optimality. Cone examples belong to this latter easy case.

Accordingly the unresolved interaction requires BOTH nonbipartite J and repeated colors. Alternating bichromatic C4 is the familiar colorful-matching obstruction, but it is bipartite and obeys the desired support bound exactly. Standard rainbow LP gap bounds control |B|/2 relative to nu(G); they do not bound vc(J) without an additional integral covering theorem. Adding ordinary matching blossom constraints alone does not erase color incompatibilities.

The root completed a targeted exact census, recorded in `experiments/SUPPORT_SEARCH.json` (historical record, not included in this public archive): all 209 NetworkX graph-atlas representatives of order at most six; 19,605 candidate support subsets; 308 eligible optimal zero/half, triangle-free supports on 80 graphs; no support-cover violation, with maximum support-cover/nu equal to 2. The LP AI contributor inspected the recorded aggregate JSON, but did not independently rerun this computation. This is bounded evidence for the stated stronger target only. Since these are very small graphs and the hypotheses are restrictive, it does not justify GO by itself.

Bounded additional primary-source searches did not locate a theorem proving or refuting the exact target. This is not a literature-openness or novelty attestation. The route remains a mathematically precise research question with an exact translation and small-domain evidence, but there is no proof architecture reducing its arbitrary-graph case to established lemmas. Nor is there a proved reduction from general Tuza instances to its restricted hypotheses. It should not receive a long proof-campaign mandate on the present evidence.
