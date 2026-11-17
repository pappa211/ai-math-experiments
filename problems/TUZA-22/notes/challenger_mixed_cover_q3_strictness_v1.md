> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A three-page triangle core forces strictness in the tree/triangle cover class

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. Challenger, 2026-11-16 UTC. This is a new equality restriction within the arbitrary-cover class of challenger_tree_triangle_cover_tuza_v2.md, not its complete CS classification.

## Statement

Let C be ANY actual triangle-edge cover of G whose components are trees or literal triangles. Suppose one triangle component T has assigned-family cover number3 and a private packing of three pages. Then

    tau(G) < 2nu(G).

No minimum-cover assumption on C is needed. All selected-cover components, outside apices and reciprocal interactions are allowed.

Also, if the potential mutual-target graph J on the q2 triangle cores contains ANY cycle component, even or odd, then tau(G)<2nu(G).

Here q2 and q3 have the exact meanings in the accepted v2 theorem: a cost-three triangle family with maximum private packing2 has precisely two full apices, while q3 supplies three private disjoint pages. Low-cost triangle families use their internal triangle, and tree families use the weighted packing relative to their own ordinary cover cost.

## 1. Supplied costs and compatibility construction

Write tau_i for the ordinary cover number of each assigned family and c=sum_i tau_i. Then tau(G)<=c. The accepted v2 proof supplies local packings and, after handling closed odd q2 cycles, a finite probability distribution of actual global packings with expected size at least c/2. Its coherent signs on the bipartite q2 target graph J retain both pages of each q2 core or omit both and add its internal triangle.

The same construction works for ANY subcollection of these assigned families, with the same local costs, after omitting the other local choices. Every ingredient is familywise and its cross-conflict geometry only becomes simpler. In particular, when a target-closed collection of q2 cores is reserved, it combines with a packing of all other families of size at least half their summed local costs. This uses the explicit construction, not a claim that ordinary cover numbers add or that a family subcollection is an induced graph.

## 2. Every q2 cycle is already strict

If a component W of J is a cycle, every q2 core on it has two distinct q2 neighbors. These consume both its full-apex slots, so all its page apices lie in W. The two-full-apices compatibility lemma gives2|W| mutually compatible pages. No selected page from W can conflict with any other assigned family, because reciprocal conflict would require an apex of its own outside W.

Each reserved core has local cover cost3. Combine the2|W| pages with the v2 compatibility construction on all other families. This yields

    nu(G) >= (c-3|W|)/2 + 2|W| = c/2+|W|/2 > tau(G)/2.

Parity is immaterial for this strictness statement. Thus when studying equality, J has only path components and isolated vertices.

## 3. Try to omit the three q3 pages coherently

Fix the q3 core T and its three supplied private pages. Suppose toward contradiction tau(G)=2nu(G). By the preceding section J has no cycle, so it is a disjoint union of paths and isolates.

Use the fair coherent-sign construction of v2 on all families. Every outcome is an actual packing and therefore has size at most nu(G). Its expectation is at least c/2>=tau(G)/2=nu(G). It follows that c=tau(G), the expectation equals nu(G), and EVERY outcome of positive probability has exactly nu(G) triangles. All finite assignments of the independent fair signs and free conflict-component orientations have positive probability.

To omit one of the chosen T-pages, consider its component of the actual external cross-conflict graph X. If that component contains no q2 core, choose its opposite class (or the empty class for an isolated page). If it contains a q2 core i, omitting the T-side means retaining the i-side, and thus imposes the requirement u_i=1. All pages from the same T lie on the same side whenever they belong to the same X component, so these requirements do not conflict locally.

If the requirements u_i=1 are consistent on the bipartite components of J, choose an outcome meeting all of them and all free omission choices. None of the three selected T-pages remains. Append the internal triangle T. It is disjoint from all internal and external members assigned to other components, since each such external member has at most one vertex in T. T has no supplied internal member of its own. This produces nu(G)+1 triangles, a contradiction.

Therefore two required q2 vertices lie in opposite bipartition classes of one J component.

## 4. An inconsistent sign requirement gives a closed strict path

Let i,j be such required q2 cores. A requirement came from an actual cross-conflict with a T-page. In particular the q2 core has one full apex in T. It therefore has at most one OTHER apex available for a q2 target and hence degree at most one in J.

Since i and j are distinct, opposite sides of a connected J component, neither is isolated. They are the two ends of that entire path component W. Its edge-length is odd, so its number k of q2 cores is even and at least2.

Each endpoint has one full apex in T and one in its neighboring core of W. Each interior core has its two full apices in its two distinct W-neighbors. Hence every page apex of every core in W lies in W or T, and no such page can conflict with a member of a family outside W union {T}. This is a statement about POTENTIAL targets and remains true when page endpoints are resampled.

The two-full-apices lemma supplies2k compatible private pages for W. Add the internal triangle T; it is disjoint from those pages, which have at most one T vertex. It is also disjoint from every other assigned family. Therefore this reserved collection gives2k+1 triangles, isolated in edge conflicts from all supplied choices outside it.

The reserved families have total local cover cost3(k+1). Apply the v2 compatibility construction to the remaining families and combine. Then

    nu(G) >= (c-3(k+1))/2 + (2k+1)
          = c/2 + (k-1)/2
          > tau(G)/2,

because k>=2 and c>=tau(G). This contradicts equality and completes the proof. QED.

## Exact consequence and remaining gap

In a tight graph admitting a tree/triangle cover, every cost-three triangle component must be of exact q2 two-full-apex type, and the q2 potential target graph has only paths and isolates. A triangle family of cost1 is also impossible under equality because selecting its internal triangle gives a strict local weight surplus; cost-two triangle families remain possible. Tree components remain unrestricted by this lemma beyond their accepted local weighted availability.

This does not classify all tight graphs in the hereditary class. In particular, q2 paths may end at larger tree components, and those interactions are not replaced by a matching-book assumption. No q2 normalization is claimed to preserve the cover-component shape. The proof uses the accepted ordinary forest anchor/external minmax, two-full-apices compatibility, and coherent averaging construction; no computation, CS minimality or historical finite certificate is required.
