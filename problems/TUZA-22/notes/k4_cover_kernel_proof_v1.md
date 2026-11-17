> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Eight-edge triangle-cover kernel for packing at most four — frozen v1

TUZA-22 independent verifier, ordinary proof candidate under explicit local structural hypotheses. Awaiting fresh review. The minimum-CS corollary uses the archived class-independent M3/SIX inputs at their exact scope. No finite census or unbounded-attachment extrapolation is used. This bounds the packing-four obstruction; it does not exclude it.

## Structural lemma

Let G be a finite simple graph with no isolates satisfying all of the following:

1. Every actual edge belongs to at least two actual triangles.
2. Every nonempty component of every vertex link has at least five vertices; in particular every vertex has degree at least five.
3. A degree-five vertex has at least nine edges in its link, and a degree-six vertex has at least twelve edges in its link.
4. nu(G)<=4.
5. An actual-edge triangle cover C has size eight and contains all three edges of some actual triangle T.

Then every vertex is incident to C, and therefore |V(G)|<=13.

The numerical link bounds in item3 are weaker than the archived M3/SIX classifications (degree5 links K5 orK5-e; degree6 links K6,K6-e orK6 minus a perfect matching). They are stated explicitly so the elementary kernel proof does not hide those dependencies.

## Proof: any outside vertex forces a tiny complete core description

Suppose v is outside V(C). As in the six-edge kernel, every neighbor of v is in V(C): an edge joining two outside vertices could belong to no triangle hit by C, violating item1. Also

    G[N(v)] = C[N(v)],

because an edge within its neighborhood but outside C would form an uncovered triangle with v. Each neighbor's degree in this link is the codegree of its spoke at v, so the link has minimum degree at least two. Consequently

    5 <= d(v) <= |E(G[N(v)])| <=8.

Degrees five andsix contradict the respective lower bounds9 and12 in item3. The link is connected when d(v) is seven oreight: otherwise item2 would require at least ten neighbors.

If d(v)=8, its link has exactly eight edges and minimum degree two, so it is C8. All C edges then lie in that link; C8 contains no triangle, contradicting T subset C.

Suppose d(v)=7. A seven-edge link is C7, which contains no triangle. Only one C edge could then lie outside the link. T cannot lie inside the link, and a triangle with a vertex outside the neighborhood would require at least two C edges outside the link. Thus this case is also impossible.

The only possibility is d(v)=7 with an eight-edge connected link. All eight C edges lie in N(v), so

    N(v)=V(C), and C=G[N(v)]

is a connected seven-vertex/eight-edge graph of minimum degree two containing T.

## Exact classification of the cover core

For such a graph C, the sum over vertices of(degree minus2) is2. Hence either one vertex has degree four and the other six have degree two, or two vertices have degree three and the other five have degree two.

In the first case, following the degree-two chains from the unique branch vertex gives two cycles meeting only at that vertex. Their lengths sum to eight, and one must be the triangle T, so the lengths are3 and5.

In the second case, suppressing degree-two chains leaves either three paths between the two branch vertices (a theta graph), or a path between them with one cycle at each end (a dumbbell). In the theta case, the three path lengths sum to eight; a triangle requires lengths1 and2 for two paths, leaving length5 for the third. In the dumbbell case, the two cycle lengths p,q are at least three and the joining path length l is at least one, with p+q+l=8. A triangle forces, up to interchange, (p,q,l)=(3,3,2) or(3,4,1).

Thus the four and only four possible cores are:

- Triangle abc and five-cycle a-d-e-f-g-a sharing a.
- Triangle abc and path a-d-e-f-g-b of length five.
- Disjoint triangles abc,def joined by path c-g-d of length two.
- Triangle abc and four-cycle d-e-f-g-d joined by edge c-d.

This is an ordinary bounded-core classification proved from the arbitrary-attachment hypotheses, not a census assertion.

## Outside multiplicity is impossible

Every other vertex outside V(C) satisfies the same argument and is adjacent to all seven core vertices. Outside vertices have no mutual edges by the first paragraph. Because the initial v sees the entire core, no extra core edge can exist: it would create a triangle missed by C. Hence the full graph is this exact core plus an independent set of universal-to-core outside vertices.

If two outside vertices v,w exist, the core contains at least five edges that can be partitioned into two matchings. Explicit selections are:

- Shape1: the four-edge path a-d-e-f-g, alternately colored v,w, plus the disjoint edge bc colored v.
- Shape2: the five-edge path a-d-e-f-g-b, alternately colored v,w.
- Shape3: the six-edge path b-a-c-g-d-e-f, alternately colored v,w.
- Shape4: the six-edge path b-a-c-d-e-f-g, alternately colored v,w.

Replace each selected core edge xy of color v (respectively w) by triangle vxy (respectively wxy). Within one color the core edges are a matching, so their apex spokes are disjoint. Between colors the spokes have different apices and no core edge is repeated. Thus these give at least five pairwise edge-disjoint actual triangles, contradicting nu(G)<=4.

Therefore there would be exactly one outside vertex. Each possible core has a degree-two vertex, whose full G-degree would be exactly three, contradicting item2's degree-at-least-five consequence. No outside vertex exists.

Finally C consists of T's three edges and five other edges, so its endpoints number at most3+2*5=13. QED.

## Minimum-CS corollary and remaining obligation

For a minimum CS failure G with k=4, reviewed M0 gives tau(G)=8. Reviewed R1 and residual accounting give tau(G-E(T))=5 for every actual triangle T; adding E(T) to a minimum residual cover therefore supplies a minimum G-cover C of size eight containing T. M0 removes isolates; archived M3 supplies item1 and item2 and the degree-five link classification; archived SIX supplies the degree-six classification, hence item3. All these local statements have been authenticated as class-independent in the TUZA-15 audit; the sparse-class final theorem is not used in this argument.

Consequently a minimum CS failure with packing number four has at most thirteen vertices. This is a finite vertex reduction at k=4, not proof that no such graph exists. Unlike the at-most-nine-vertex/nu<=3 case, no automatic mad<7 conclusion is supplied here. Any subsequent exhaustive search would need a proved complete enumeration domain and exact certificates; existing sampled restoration graphs or unverified historical censuses do not settle this residual finite class.

## Review targets

Check the outside-neighbor/actual-link identity, the degree-five/six input scope, connectedness forced by the five-vertex link-component lower bound, the C7/C8 exclusions using the covered triangle, the complete bicyclic classification including BOTH dumbbell cases, and every explicit two-matching construction. Degree-four/eight link restrictions beyond the stated inputs are not assumed.
