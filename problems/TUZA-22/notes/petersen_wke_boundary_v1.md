> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Petersen: a precise boundary to the triangle-free WKE mechanism

TUZA-22 restoration role, frozen2026-11-15 UTC. Ordinary proof candidate; no novelty claim. This refutes the auxiliary assertion that all triangle-free subcubic graphs are WKE. It does not refute the actual WKE exclusion, CS, or Tuza.

Define the Petersen graph L on u_i,v_i for i modulo5, with outer edges u_i u_(i+1), inner edges v_i v_(i+2), and spokes u_i v_i. It is cubic, triangle-free, has10 vertices and15 edges.

Suppose matching M of size r and vertex set Q of size q<=r witness WKE. Set S=V(L)-Q. Every edge of L[S] must belong to M, so L[S] is a matching. Cubic degree counting gives

    e(L[S])=15-3q+e(L[Q]).

If r<=3, then q<=3 and |S|>=7; the displayed count gives at least6 induced edges, impossible for a matching on at most10 vertices (and in particular on10-q vertices).

If r=4, q<4 is already impossible. For q=4, S has6 vertices and e(S)=3+e(Q). To be a matching it must have exactly3 edges, so e(Q)=0 and these three matching edges saturate S. No further M edge can be added, because all S vertices are used and Q is independent. This contradicts r=4.

If r=5, M is perfect. Count its spokes: the number is odd because the unmatched outer vertices must be paired along the outer5-cycle. Hence there are1,3,or5 spokes. Three spokes are impossible: the remaining two indices would have to be adjacent in both the outer cycle (difference1) and inner cycle (difference2).

Five spokes give one perfect matching; its complement is the two displayed5-cycles. With one spoke, rotate so it is u0v0. The remaining matching is forced:

    u1u2, u3u4, v2v4, v1v3.

Its complementary edges form the two5-cycles

    u0-u1-v1-v4-u4-u0,
    u2-u3-v3-v0-v2-u2.

The five rotations exhaust the remaining perfect matchings. Thus for every perfect M, L-M is two disjoint5-cycles and its vertex-cover number is6, exceeding r=5. This excludes the last case and proves L is not WKE.

For orientation, the cone over L has nu5,tau6 and is far from tight. A perfect rim matching gives the five apex triangles, and the ten apex spokes give upper bound5. View L also as the Kneser graph on the2-subsets of a5-set, adjacent when disjoint. An independent family of pairs is either a star (size at most4) or a triangle family (size3), so alpha(L)=4. The standard cone cover formula10-|W|+e(L[W]) and |W|-e(L[W])<=alpha(L) give tau>=6; the six spokes outside an independent four-set attain6.

Therefore failure of the WKE certificate is not itself a tightness phenomenon. A minimum CS obstruction could only use such a link if its arbitrary outside attachments defeat the available strict-cover/packing mechanisms. That remains a different question.
