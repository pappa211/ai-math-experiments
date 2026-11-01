> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# TUZA-10: independent mechanism notes

These notes were developed directly from the stated reduction R, without initially consulting literature or earlier workspace reports. They do not make a novelty claim.

## Setting

Let J be a finite simple triangle-free graph, properly edge-colored by c. A feasible vector x satisfies x_e >= 0, sum_{e incident v} x_e = 1 for every vertex v, and sum_{e:c(e)=a} x_e <= 1 for every color a. Write rho for the largest rainbow matching and vc for the ordinary minimum vertex cover number. The target is vc(J) <= 2 rho(J,c).

## A general LP observation

For nonempty J, every extreme point of the feasible polytope has a coordinate x_e >= 1/2. The empty graph is excluded from this assertion.

Proof. Restrict attention to the m positive coordinates of an extreme point, and let q be the number of tight color inequalities. If every positive coordinate were below 1/2, every vertex would be incident with at least three positive edges, and every tight color would contain at least three positive edges. Consequently n <= 2m/3 and q <= m/3. The active equation matrix therefore has at most n+q <= m rows. If either counting inequality is strict its rank is below m. In the equality case all support edges belong to tight colors, and the sum of the vertex rows is twice the sum of the tight-color rows. Its rank is again below m. This contradicts extremality on the positive support. The argument does not require triangle-freeness or proper coloring.

This observation is not half-integrality and does not establish an inductive reduction preserving vertex saturation.

## The selected fallback: cycle supports with color multiplicity at most two

Assume J is a disjoint union of cycles of length at least four, and each color occurs on at most two edges. Equivalently, the uniform vector x_e = 1/2 is feasible on all edges and every vertex has degree two.

Let q be the number of components that are 4-cycles whose opposite edge pairs each have one common color. Then

    vc(J) <= 2q + (9/5)(rho(J,c)-q).

In particular vc(J) <= 2 rho(J,c), with equality if and only if every nonempty component is one of those alternating 4-cycles. This statement concerns the entire graph J; it does not cover arbitrary extra zero-weight edges attached to a degree-two support.

Proof. Form the conflict graph L whose vertices are the edges of J, joining two vertices when the corresponding edges meet or have the same color. Each vertex has its two cycle neighbors and at most one additional color neighbor, so its degree is at most three. Rainbow matchings of J are exactly independent sets of L.

A K4 component of L has four vertices each with both its cycle neighbors among the other three vertices. Thus these four vertices contain an entire cycle component of J. As J has no triangles, that component is a 4-cycle. The two non-cycle edges of the K4 join its two opposite pairs and therefore are precisely the equal-color pairs. Conversely every alternating 4-cycle produces an isolated K4, because its two colors already occur twice. Removing all such components subtracts 2q from vc and q from rho.

The remaining conflict graph has maximum degree three and no K4 component. Brooks' theorem (with paths, cycles, and components of lower maximum degree treated directly) gives a proper 3-coloring, hence an independent set of size at least m'/3, where m' is its number of vertices. For each remaining original cycle of length l >= 4, its vertex cover has size ceil(l/2) <= 3l/5. Thus vc(J') <= 3m'/5 <= 9 rho(J',c)/5. Add back the q alternating 4-cycles. If J' is nonempty, rho(J',c)>0, making the comparison with 2 rho strictly smaller.

The color-line graph construction plus Brooks makes this a routine deduction, not an asserted new theorem.

## Possible sharpening: open in these notes

The proposed sharpening is

    vc(J) <= 2q + (5/3)(rho(J,c)-q).

It is not proved here. The constant 5/3 could not be improved: on a 9-cycle, color its consecutive edges

    a, b, a, c, d, c, e, f, e.

The three consecutive blocks of three edges each allow at most one member of a rainbow matching (two consecutive edges meet, and the first and third repeat a color). Therefore rho <= 3. Edges numbered 1,4,7 form a rainbow matching, so rho=3, whereas vc=5.

The earlier 9/5 proof improves to 5/3 immediately when every odd cycle has length at least nine: ceil(l/2)/l <= 5/9 on such odd cycles, and the even-cycle ratio is 1/2. Only 5-cycles and 7-cycles obstruct this particular argument. Color repetitions between distinct cycle components prevent an unjustified sum of separate component rainbow matching numbers.

No unsaved exploratory computation is included as evidence. The source-era finite checks are recorded in the historical COUNTEREXAMPLES_AND_TESTS.md (not included in this public archive). Current public fixed-example verification uses [check_tuza_examples.py](../../../tools/check_tuza_examples.py).

## Small-rho rigidity

If rho=1 under the original hypotheses, then J is either K2 or an alternating 4-cycle, apart from the empty graph.

Indeed every pair of disjoint edges has the same color. A vertex with degree at least three forces its entire connected component to be a star: any edge at distance one from that vertex but not incident with it would be disjoint from two differently colored incident edges. With maximum degree two, a component is a path or cycle, and a path of four edges is impossible because its first and third, second and fourth, and first and fourth edges would force adjacent edges to have the same color. Triangle-freeness leaves stars, paths of at most three edges, and 4-cycles. Vertex saturation rules out stars larger than K2 and paths of two edges. On a path of three edges the two outer edges have weight one, and they have the same color, violating its color cap. A 4-cycle must have opposite equal-color pairs; its two color caps force all four weights to equal 1/2. Finally, two distinct nonempty components force every edge in each to have a common color, hence properness forces each such component to be K2, and two such components violate the common color cap.

This settles only rho=1, not general R.
