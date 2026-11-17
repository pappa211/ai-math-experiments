> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Induced apex lists: C4 is exact, C6 is not

Status: ORDINARY_PROOF_CANDIDATE; frozen for independent review. This is a boundary for extending notes/one_sided_forest_exact_packing_v1.md. No computation or arbitrary-list realization assumption is needed.

## A. Every minimum whole C4 core is packable exactly

Suppose V(G)=A∪B, B independent, G[A]=C4, and C=E(G[A]) is a minimum triangle cover, so tau(G)=4. Every triangle is a private page with apex in B. The support of an apex on C consists of no edges, one edge, two incident edges, or all four edges: any set containing opposite edges uses all four core vertices and hence all four edges. Call an apex universal when its support is all four edges.

Minimum-cover replacement gives, for every S⊆C,

    sum_b nu_matching(S[N(b)]) >= |S|.                       (1)

Indeed replacing S by minimum spoke covers gives the corresponding vertex-cover inequality, and every link here is bipartite.

If there are no universal apices, every nonempty link has matching number1. Thus (1) is ordinary Hall for an SDR assigning distinct apices to all four bases. Those pages pack.

If there are at least two universal apices, assign the two opposite-edge matchings of C4 to two such apices. Those four pages pack.

Suppose there is exactly one universal apex a. Let F⊆C consist of the edges having at least one other apex. For every adjacent pair of bases S, a contributes only1 to (1), so S meets F. Therefore F meets every adjacent pair in the four-cycle of base indices, and hence F contains an opposite pair e,f. No nonuniversal apex can support both e and f, so choose distinct other apices on them. Give the complementary opposite pair to a. These four pages pack. Therefore

    private q = nu(G) = tau(G) = 4.

This covers arbitrary numbers of apices and arbitrary induced neighborhoods, including vertices with no triangles.

## B. A literal C6 counterexample to exact packing

Use core vertices0,...,5 and all six cyclic edges01,12,23,34,45,50. Add independent apices6,...,10 with neighborhoods

    N(6)={5,0,1,2}, N(7)={1,2,3}, N(8)={2,3,4},
    N(9)={3,4,5},   N(10)={4,5,0}.

There are no other edges. This is an actual graph with11 vertices,22 edges and11 triangles. The triangles in cyclic order are

    (0,1,6), (1,2,6), (1,2,7), (2,3,7), (2,3,8),
    (3,4,8), (3,4,9), (4,5,9), (4,5,10), (0,5,10),
    (0,5,6).

Completeness follows directly: the core and apex set are triangle-free; each triangle must use one apex and an edge in its induced neighborhood. Apex6 supports a three-edge path and each other apex a two-edge path, giving exactly the displayed eleven triangles.

Two displayed triangles share an edge exactly when they are consecutive in the displayed cyclic order. Pages with different apices can intersect only on a common base; pages with the same apex intersect exactly when their bases are incident. In particular, the two end pages at apex6 have disjoint bases and do not share an edge. The triangle intersection graph is therefore C11, not an abstract surrogate missing additional actual triangles.

It follows that nu(G)=5: every other triangle gives a five-packing, and an independent set of C11 has at most5 vertices. Every graph edge belongs to at most two triangles, so every ordinary cover needs at least ceil(11/2)=6 edges. All six core edges cover all triangles, proving tau(G)=6. The cover C consisting of the entire C6 is minimum, yet its maximum private packing is5. Consequently the induced-neighborhood restriction on lists does NOT restore Hall sufficiency for general even-cycle cores.

For direct inspection a five-packing is

    (0,1,6), (1,2,7), (2,3,8), (3,4,9), (4,5,10).

This is not a Tuza counterexample:6<2*5. It is tripartite because the even core is bipartite and the apices are independent.

## C. An unbounded even-cycle family with a gap of one

Let the core be C_(2r), r>=3, with cyclic edges e1,...,e_(2r). Put one independent apex a on the four consecutive vertices inducing the three-edge path {e_(2r),e1,e2}. For each i=2,...,2r-1, put a fresh independent apex b_i on the three consecutive vertices inducing the path {e_i,e_(i+1)}. No other edges are present.

All supports are induced paths because2r>=6. There are2r-1 apices,4r-1 total vertices,8r-2 graph edges and4r-1 actual triangles. The triangle intersection graph is the odd cycle

    a/e1, a/e2, b2/e2, b2/e3, b3/e3, ...,
    b_(2r-1)/e_(2r-1), b_(2r-1)/e_(2r), a/e_(2r).

The consecutive-pair argument of Section B is unchanged. Hence

    nu = private q = 2r-1,     tau = |C| = 2r.

The cover lower bound is the triangle count divided by the maximum edge multiplicity2. An alternating cycle packing attains the packing upper bound. At r=2 the proposed apex-a neighborhood would contain the whole C4, introducing the fourth page; this is exactly why the construction cannot contradict Section A.

## D. Role and boundary

The forest proof's clique-block hypothesis is load-bearing, even with genuinely induced apex supports and a full minimum ordinary cover. C4 is a strictly larger exact class; C6 is already a counterexample to exact equality q=tau. Both are tripartite settings, for which published strict-factor Tuza results exist. This note supplies no new factor-two theorem and makes no claim about arbitrary cover-component mixing. It records a literal obstruction that any proposed Hall conversion must accommodate.
