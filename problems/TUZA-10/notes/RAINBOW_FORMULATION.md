> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Exact colored-support formulation

## R (unproved in this mission unless explicitly updated)
For every finite simple triangle-free graph J=(V,E), every proper edge-color map c:E→C, and every real nonnegative vector x with vertex sums exactly 1 and color sums at most 1, vc(J)≤2ρ(J,c). Here vc uses ONLY vertices in V. A rainbow matching has disjoint endpoints and distinct colors. Each x_e≤1 follows from a vertex equation. Zero edge weights are allowed; isolated vertices are excluded except the empty graph. Summing vertex equations gives sum x=|V|/2. Rational certificates suffice: the feasible polytope has rational coefficients and a nonempty such bounded polytope has a rational vertex.

Do not replace vc by an unrestricted hypergraph transversal or rho by the ordinary matching number. The associated 3-uniform hypergraph has vertex set V⊔C and triples {u,v,c(uv)}. It is linear because J is simple and properly colored. Its matching number is rho, but its transversal number may be strictly smaller than vc. It is 3-partite with sides A,B,C if J is bipartite with sides A,B; a general triangle-free graph need not admit such a bipartition. These distinctions persist under saturation.

## Verified translation from TUZA-09
Source: accepted TUZA-09 [LP_GEOMETRY.md](../../TUZA-09/notes/LP_GEOMETRY.md), sections 7–8. Let G be finite simple and y an OPTIMAL fractional edge cover of all graph triangles, with values 0 or 1/2. Put B={e:y_e=1/2}, Z={e:y_e=0}; require the graph (V(G),B) triangle-free. Every triangle has exactly two B edges (feasibility excludes fewer; triangle-freeness excludes three).

Vertices of J are actual B edges. Each G triangle gives an edge joining its two B edges, colored by its Z edge. Two B edges determine at most one triangle, so J is simple. For fixed Z edge ab, triangles abv have pairwise disjoint pairs {av,bv} as v varies, so coloring is proper. A triangle in J would correspond to three pairwise incident B edges. Three pairwise incident distinct simple-graph edges either form a triangle (excluded) or a star. A star would force all three edges among its leaves to be in Z, forming a triangle of y-weight zero (excluded). Therefore J is triangle-free.

A set of G triangles is edge-disjoint iff its J edges have disjoint B endpoints and distinct Z colors. Thus nu(G)=rho(J,c). A cover of G restricted to B is exactly a vertex cover of J; denote its minimum tau_B(G)=vc(J). Unrestricted tau(G) can be smaller, because Z edges are allowed there.

Choose an optimal fractional triangle packing z, using finite LP duality. Complementary slackness with y forces sum_{T containing b}z_T=1 for each b in B. At each z-edge the packing capacity is ≤1. Consequently x_{edge(T)}=z_T is exactly the fractional certificate in R. Conversely these capacity checks certify the half cover's optimality when the rest of the graph construction is valid. We do not claim an arbitrary abstract colored J admits such a graph realization.

## Implication boundaries
Proved translation + R would give tau(G)≤tau_B(G)=vc(J)≤2rho(J,c)=2nu(G) for the stated optimal-zero/half triangle-free-support class. No reduction from arbitrary G to this class is available. Universal half-integrality is already false; restrictions on the *auxiliary J* in the fallback narrow the class further. The ordinary triangle-free support graph B and its auxiliary J are distinct graphs.

The fallback cycle theorem applies only when J itself is a disjoint union of cycles of length≥4 and each color occurs at most twice. In that class x_e=1/2 is an explicit certificate. Even a proof with a better coefficient in that class does not settle R or unrestricted Tuza.

## Nearby false variants
Color capacities and vertex saturation cannot simply be dropped: three disjoint edges with one common color have vc=3, rho=1. x_e=1 saturates vertices but violates color capacity; x_e=0 satisfies color capacity but violates saturation. Triangle-freeness also matters: K4 with its three perfect-matchings as colors and x_e=1/3 has all vertex sums1 and color sums2/3, but vc=3>2rho=2. Proper-color deletion is tested separately; no failure is to be asserted without an explicit feasible witness.

The claimed ~16,000 Claude random tests have no authenticated executable/log input here and are not included in TUZA-10 coverage.
