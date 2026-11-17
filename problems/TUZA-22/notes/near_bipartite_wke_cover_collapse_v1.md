> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Minimum-cover collapse for a near-bipartite WKE link

Frozen ordinary proof candidate, 2026-11-16. This is a general equality interface with arbitrary outside attachments. No matching-structure theorem or finite computation is used.

## Theorem

Let L be a closed link component at h in a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class. Suppose w is a vertex such that F=L-w is TRIANGLE-FREE. Then:

1. L has no WKE tuple P,Q with |P|>=3;
2. it has no WKE tuple with |P|>=2 in which w is unmatched by P;
3. consequently, if L is WKE, its graph matching number is at most two.

A WKE tuple means P is a matching and Q covers L-P with |Q|<=|P|. The result is not yet a complete exclusion of every near-bipartite WKE link; the matching-number-at-most-two boundary remains explicit.

## Balanced residual and which F edges are supported

Put r=|P|. Delete all h-spokes to L and P, yielding K. Standard class-local counting gives immediate strictness if needed; otherwise

    B(K), nu(K)=nu(G)-r, tau(G)=2nu(G).

If P matches w, write wz for its unique incident matching edge. If w is unmatched, leave z undefined.

Take any edge e=xy of F-P. Codegree at least two supplies a page xyt other than hxy. Its apex t cannot belong to F because F is triangle-free. If t=w, both page spokes survive unless one is the deleted wz; this exception can occur only when e is incident with z. If t lies outside L, its page spokes survive: P has all endpoints in L, and neither spoke is a deleted h-edge. An apex in a different h-link component is impossible by closedness.

Therefore EVERY edge of F-P is triangle-supported in K, except possibly edges incident with z when w is matched. If w is unmatched, there are no exceptions.

## All supported F edges enter one minimum residual cover simultaneously

Every residual literal K4/K5 block contains at most TWO vertices of F. Otherwise three of its F vertices would form a triangle in F. Consequently a residual block contains at most ONE actual F edge.

Let S be the set of all triangle-supported edges of F-P. Each such edge lies in its unique triangle component, and no block contains two members of S. Choose a minimum cover of each old block containing its prescribed S edge, if there is one. This is possible for both K4 and K5. Their union D is therefore a MINIMUM K cover containing ALL of S simultaneously:

    |D|=2nu(K), S subset D.

This simultaneous choice is the key point. Shared vertices between blocks do not matter because the prescriptions concern disjoint triangle-edge supports. There is no requirement to fit two prescribed edges into one clique cover.

## The uncovered link has a two-vertex cover

In (L-P)-D, every remaining edge either is incident with w, or is an unsupported F-P edge. The latter edges, if any, are all incident with z. Thus {w,z} covers this graph when w is matched, and {w} covers it when w is unmatched.

Add P and the h-spokes to those one or two covering vertices to D. This covers every G triangle: an outside page on a deleted P edge retains its base, a removed hub triangle is covered by its D rim or by one of the selected spokes, and all remaining triangles lie in K and are met by D. Hence

    tau(G)<=2nu(K)+r+2

in the matched case, and

    tau(G)<=2nu(K)+r+1

in the unmatched case.

For r>=3 in the first case or r>=2 in the second, either inequality is strictly smaller than 2nu(K)+2r=2nu(G). This proves conclusions1-2. Equivalently, the constructed D violates the coordinator's exact minimum-residual-cover invariance.

## Matching-number consequence

If some WKE tuple has size r smaller than nu_match(L), its balanced residual can be contradicted by a larger hub matching: F is triangle-free, so L is K4-free, every old block has at most three L vertices, and a graph matching uses at most one old edge per block. Avoid those individual edges in maximum block packings and append the larger matching's hub triangles.

Therefore in a surviving minimum-CS link every WKE tuple must have size nu_match(L). Conclusions1-2 imply that a WKE near-bipartite link can survive only at matching number at most two. No assertion that every near-bipartite graph is WKE is made.

Dependencies: authenticated class-local M0/codegree, elementary clique packing avoidance and minimum covers through one prescribed edge. The proof gives its own complete lost-triangle and simultaneous-cover audits. No Gallai-Edmonds, Kotzig, finite enumeration, or all-size formalization is used.
