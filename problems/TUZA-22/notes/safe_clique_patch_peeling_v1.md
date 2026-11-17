> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Safe tight-patch peeling and the exact K5 boundary

Status: ordinary proof candidate. This generalizes the accepted active-family argument to a literal already-classified patch; it does not assert that such a patch exists in every graph.

Let P be an edge-subgraph of G consisting of the triangle support of a nonempty B graph. Let A be the union of the edge supports of all actual G triangles not wholly contained in P. Set D=E(P) intersect E(A). Suppose a maximum P packing avoids the ENTIRE set D.

Then CS(A) implies CS(G). Indeed, every actual G triangle is either wholly in P or among the outside triangles included in A. Any actual A triangle wholly in P would use only boundary edges; this is not automatically excluded by the avoidance hypothesis and need not be excluded: the packing upper bound can assign each G triangle wholly in P to P, and all others to A. Thus nu(G)<=nu(P)+nu(A). Conversely, the chosen maximum P packing avoids all A edges, so it combines with a maximum A packing. Therefore

    nu(G)=nu(P)+nu(A).

Covers combine to give tau(G)<=2nu(P)+tau(A). If G is tight and A satisfies CS, then A is tight and B(A). Any edge of D is triangle-supported in P by the definition of P and triangle-supported in A by its definition. Both B graphs have minimum covers containing that edge, so if D is nonempty their covers overlap and give tau(G)<=2nu(G)-1. Thus tightness forces D empty, and the accounted triangle families yield B(G).

The maximum P packing has at least one triangle, and all its edges are outside A; hence A is a proper edge-subgraph. Therefore a minimum-edge CS failure admits no such patch.

For a literal K4, a maximum packing is a single face and its complement is a three-edge star. Thus the criterion is exactly that D be contained in a star, as treated in `k4_star_boundary_peeling_v1.md`.

For a literal K5, two edge-disjoint triangles necessarily share exactly one vertex, since there are only five vertices. Their six edges leave precisely the four cross edges between the two other vertex pairs, which form a C4. Conversely the complement in K5 of any C4 is exactly two triangles sharing the fifth vertex. Consequently

    a maximum K5 packing avoids D  iff  D is contained in a C4 of K5.

Thus every literal K5 in a minimum CS failure has an outside-triangle boundary not contained in any C4. Every set of at most two K5 edges is contained in a C4, so the boundary has at least three edges. If it has exactly three, the only peelable isomorphism type is a three-edge path P4; the other possible types are a triangle, a three-edge star, or a disjoint union P3+K2. The latter three are genuine avoidance failures, not overlooked boundary cases.

This theorem uses ALL actual outside triangles and an explicit entire-boundary packing witness. Arbitrary outside graph incidences and background edges are allowed; they are not inferred harmless from a bounded core test.

Dependencies: elementary K4/K5 packing and cover facts, plus CS(A) or proper-subgraph CS in the minimal-obstruction corollary. No external theorem or computation is used.
