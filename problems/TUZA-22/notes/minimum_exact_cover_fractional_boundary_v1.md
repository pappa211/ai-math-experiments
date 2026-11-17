> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every minimum cover can be exact while the fractional optimum is smaller

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. Source_audit, 2026-11-16 UTC. This answers the coordinator's proposed fractional-integrality shortcut negatively in the unweighted actual-graph setting. It is not a counterexample to original H-D, Tuza, or CS.

## Literal graph and values

Let P be the Petersen graph in its Kneser model: its ten vertices are the two-element subsets of {1,2,3,4,5}, and two vertices are adjacent exactly when the subsets are disjoint. Add two new vertices a,b, join each to every vertex of P, and do not add ab. Call the resulting graph G.

The graph has 12 vertices, 35 edges, and exactly 30 actual triangles. P is triangle-free because three pairwise disjoint two-element subsets would require six symbols; the two apices are independent. Thus every triangle is precisely a+e or b+e for an edge e of P. P is 3-regular and has 15 edges.

I prove

    tau(G)=11,       tau_fractional(G)=10,

while EVERY minimum ordinary triangle-edge cover of G meets EVERY actual triangle in exactly one edge. In fact there are exactly five minimum covers, and their selected-edge graphs are each K_(2,4) together with three isolated K2 components. In particular all these minimum covers are bipartite.

## Elementary Petersen facts

An independent set of P is a pairwise-intersecting family of two-element subsets. Such a family either has a common symbol, or has size at most three: if it contains xy,xz but has no common x, it must contain yz, and no fourth distinct pair can intersect all three.

Consequently alpha(P)=4, and its maximum independent sets are exactly the five stars

    I_i = { {i,j}: j != i }.

Every vertex outside I_i has exactly two neighbors in I_i. Also P-I_i is a matching of size three: on the six pairs of the other four symbols, each pair is disjoint from precisely its complementary pair.

For any Q subset V(P), write e(Q)=|E(P[Q])|. Deleting at most one vertex for each induced edge leaves an independent set, so

    |Q|-e(Q) <= alpha(P)=4.                              (1)

Moreover equality holds only when Q is a maximum independent set. If equality held and P[Q] had a vertex of degree at least two, removing that vertex would increase |Q|-e(Q), contradicting (1). Hence P[Q] is a matching plus isolated vertices. If it contained an edge, deleting one endpoint of each matching edge would give an independent four-set I, and a deleted endpoint would have exactly one neighbor in I. This contradicts the two-neighbor property of every maximum independent set. Thus Q is independent and has size four.

## Exact cover formula and all minimizers

Write any triangle cover as a set D of Petersen edges together with spoke sets aQ_a and bQ_b. Each Q_x must cover every edge of P-D. Conversely that condition suffices, because these are all actual triangles.

It follows that

    tau(G) = min_Q [ 2|Q| + |E(P-Q)| ].                 (2)

For the upper bound choose D=E(P-Q) and both spoke sets Q. For the lower bound, given D choose a minimum vertex cover Q of P-D; replacing both spoke sets by Q cannot increase the cover size, and E(P-Q) is a subset of D.

Since P is 3-regular,

    2|Q|+|E(P-Q)| = 15-|Q|+e(Q) >= 11.

Taking Q=I_i attains 11. This proves tau(G)=11.

Now take ANY minimum cover D,aQ_a,bQ_b. Both Q_a and Q_b must have the minimum possible cardinality q for a vertex cover of P-D; otherwise replacing the larger spoke set reduces the total. For either x in {a,b}, the canonical cover

    E(P-Q_x), aQ_x, bQ_x

has size at most |D|+2q=11. By optimality its size is exactly 11, and therefore E(P-Q_x)=D. The equality case of (1) shows Q_x is one of the independent four-sets I_i.

Each actual triangle now meets the cover exactly once. If its Petersen base is in D=E(P-Q_x), neither of its apex spokes is selected. Otherwise exactly one of its two endpoints belongs to the independent set Q_x, so exactly one spoke is selected and its base is not in D.

Finally E(P-I_i) is a matching whose six endpoints are precisely V(P)-I_i. Thus D determines I_i uniquely, forcing Q_a=Q_b=I_i. The five displayed covers are all the minimum covers. Their edges are the eight spokes from a,b to I_i and the three independent Petersen edges on its complement.

## Fractional certificates

Assign fractional cover weight 1/2 to each of the 20 apex spokes and zero to all Petersen edges. Every actual triangle has two such spokes, so this is a feasible fractional cover of cost 10.

For a matching dual certificate, assign weight 1/3 to each of the 30 actual triangles. A spoke belongs to exactly three triangles, receiving total load one. A Petersen edge belongs to exactly two triangles, receiving load 2/3. This is a feasible fractional triangle packing of weight 10. Weak duality therefore proves tau_fractional(G)=10 exactly.

## Role and boundary

This refutes the implication

    every minimum ordinary triangle cover is exact-one
        => tau(G)=tau_fractional(G),

including the stronger hypothesis that all minimum covers are bipartite. No weighted-edge simulation, arbitrary hypergraph, discarded private family, finite census or solver claim is involved.

The example does not satisfy original H-D. For instance it has a packing of at least nine triangles: in the usual outer-pentagon/inner-pentagram Petersen drawing, assign its five spoke matching edges to apex a; assign two disjoint outer-cycle edges and two disjoint inner-cycle edges to apex b. These base edges are all distinct. Hence nu(G)>=9, whereas tau(G)=11, so any residual has cover at most 11 and cannot have the H-D-required value 2nu(G)-2>=16. The precise ordinary packing optimum is unnecessary here.

The additional original-H-D endpoint-deletion inequalities (R), and the residual packing equality, remain separate constraints. This note asserts no all-size fractional bound from them and does not classify which of them this example satisfies.
