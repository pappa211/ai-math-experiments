> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Paying once per residual triangle in the simultaneous-cover collapse

Frozen ordinary proof candidate, 2026-11-16. No computation, matching theorem beyond the existing WKE interface, or external source result is a premise.

Let L be a closed link component at h in a minimum combined-CS failure G, globally or in an edge-subgraph-hereditary class. Let P,Q be an actual WKE tuple, s=|P|, |Q|<=s. For ANY set S of L vertices, put F=L-S, let Z be the outside-S mates of S in P, and let t be the number of ACTUAL F triangles. Then

    s <= |S|+|Z|+t.                                      (1)

This extends the accepted triangle-free deletion-set collapse, which is t=0. It imposes no restriction on how the F triangles intersect. In particular, for S={w},

    s <= 1+1_{w is matched by P}+ #(triangles of L-w).    (2)

## 1. Balanced residual and the two triangle types

Delete all h-spokes to L and all P edges, obtaining K. Standard balanced accounting supplies nu(K)=nu(G)-s, tau(K)=2nu(K), and literal B(K); if |Q|<s there was already a strict contradiction. Every lost non-hub triangle is hit by P, and every lost hub triangle has its rim in P or meets Q.

Partition the t actual F triangles into t0 triangles disjoint from P and t1 triangles meeting P. A matching meets a triangle in at most one edge, so for each of the t1 broken triangles choose its vertex opposite that P edge. Let W be the set of chosen opposite vertices; |W|<=t1.

## 2. One old cover through EVERY supported F edge

For an old literal K4/K5 block B, let q=|V(B) intersect V(F)|. This intersection is a complete clique in F-P. Consequently all its binom(q,3) triangles are among the intact t0 triangles, and every intact F triangle belongs to exactly one old block. Hence

    sum_B binom(q_B,3)=t0.

There is a cover of B containing ALL edges of that q-clique, of size at most tau(B)+binom(q,3). Here is the complete elementary check:

| q | containing block | suitable cover size | excess over minimum |
|---|---|---:|---:|
|0 or1|K4 or K5|minimum|0|
|2|K4 or K5|minimum through the prescribed edge|0|
|3|K4|the three triangle edges|1|
|3|K5|the three triangle edges plus the complementary pair edge|0|
|4|K4|all six edges|4|
|4|K5|the six edges of the K4|2|
|5|K5|all ten edges|6|

The excess is at most binom(q,3) in every row. In the q=4,K5 row each triangle uses at least two of the four clique vertices, so one of those six edges covers it. The q=3,K5 row is the familiar triangle-plus-complementary-pair cover. Covers through one prescribed edge exist by clique symmetry.

Choosing these covers independently in the actual triangle components of K produces a K cover D containing EVERY triangle-supported edge of F-P, with

    |D| <= 2nu(K)+t0.                                   (3)

This is simultaneous. An old block may contain vertices outside L or in S, and the table covers the entire old block; no attachment or individual-page independence is assumed.

## 3. Every remaining F edge is hit by Z or W

Take e=xy in F-P that is not hit by D, and suppose neither endpoint lies in Z. Then e is unsupported in K. Actual-edge codegree at least two supplies a G triangle xyz other than hxy.

If z lies outside L and is not h, its two spokes to x,y survive: P has both endpoints in L, and the only deleted hub spokes are incident with h. Thus that page would survive, contradiction. An apex in another h-link component is also impossible because its adjacency to x joins it to L.

If z lies in S, a deleted spoke zx or zy would make x or y an outside-S mate in Z. Since neither endpoint is in Z, both spokes survive, again a contradiction.

Therefore z lies in F. For xyz to be destroyed, one of its edges other than e belongs to P. It is a broken F triangle, and its opposite vertex belongs to W and is an endpoint of e. Thus W hits e.

It follows that S union Z union W is a vertex cover of (L-P)-D. All edges meeting S are already covered; the remaining edges are exactly the F edges audited above.

## 4. Final strict cover count

The set

    D union P union {hu : u in S union Z union W}

covers every actual G triangle. Surviving triangles are met by D, lost non-hub triangles by P, and the other lost hub triangles by the residual vertex cover. From (3), its size is at most

    2nu(K)+t0+s+|S|+|Z|+t1
      = 2nu(G)-s+|S|+|Z|+t.

Since tau(G)=2nu(G), inequality(1) follows. This proves the theorem at arbitrary outside-attachment scope.

## Immediate use and boundary

For a connected triangular unicyclic F=L-w with no perfect matching, the ordinary exposed-leaf/complement lemma supplies a WKE matching of size nu_match(F)+1. Since F has exactly one triangle, (2) gives nu_match(F)<=2, sharpening the earlier bound three. The original twelve-shape/374-certificate proof remains valid but is no longer needed if the two matching-number-two shapes are handled ordinarily.

For a disconnected pseudoforest F the same bound counts only its triangular-cycle components, not its longer cycles. WKE existence must still be established; multiple full even-wheel components sharing w are a genuine non-WKE boundary. No general apex-pseudoforest exclusion is inferred from this numerical restriction alone.

Dependencies: authenticated class-local M0/codegree; balanced WKE deletion; and elementary literal K4/K5 covers. The accepted general S triangle-free collapse is the t=0 special case, but its proof is reproduced and extended here rather than invoked circularly.
