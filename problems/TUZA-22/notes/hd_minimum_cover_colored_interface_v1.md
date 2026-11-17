> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Original H-D: exact minimum-cover and colored-matching interface

Frozen ordinary reductions, 2026-11-16. Source_audit reconstruction; the one-edge bipartization consequence was independently supplied by the coordinator. The original H-D quantifier remains unchanged and unresolved. This note is an alternative structural interface, not another asserted sufficient-class availability theorem.

Assume nu(G)=k>=1 and for EVERY actual triangle T,

    nu(G-E(T))=k-1, tau(G-E(T))=2k-2.                    (HD)

The target remains a set of at most two actual graph edges whose deletion lowers packing number. No minimal-CS hypothesis is assumed here.

## 1. Minimum-cover intersections are rigid

Let C be ANY minimum ordinary triangle-edge cover of G and let t=tau(G). Removing C intersect E(T) from C leaves a cover of G-E(T). Hence

    1 <= |C intersect E(T)| <= t-(2k-2).

The lower bound holds because C covers T. Conversely a minimum cover of G-E(T), together with its three missing triangle edges, covers G. Therefore

    2k-1 <= t <= 2k+1.

If t=2k-1, every actual triangle meets every minimum C in exactly one edge. If t=2k, every minimum C is triangle-free as a selected-edge graph. These are exact original-H-D consequences, not statements about near-tight residuals of a minimum-CS failure.

## 2. The strict branch is an entire private family

Suppose t=2k-1 and fix a minimum C. Put B=E(G) minus C. Both selected graphs C and B are triangle-free; moreover no actual triangle has two selected C-edges. All actual triangles are therefore private relative to C. This is stronger than retaining the private subfamily of a general minimum cover, and the Clebsch private-only counterexample cannot be imported after discarding its nonprivate triangles.

Construct a simple edge-colored graph J whose vertices are the B-edges. For each actual triangle with edges {c,p,q}, where c belongs to C and p,q to B, add the J-edge pq with color c. A pair of incident actual graph edges has at most one triangular completion, so J is simple. A fixed color forms a matching: fixing its base edge and one other edge determines the triangle. Thus J is properly edge-colored.

J is triangle-free. Three pairwise adjacent B-edges either form an actual B-triangle, which is impossible, or share one graph vertex. In the latter case the three J-adjacencies require all three edges between their other endpoints to lie in C, creating a C-triangle, also impossible.

Actual triangle packings are exactly rainbow matchings of J: distinct colors enforce disjoint selected bases, while disjoint J endpoints enforce disjoint B-edges. Crucially the graph endpoints producing J and its colors remain part of the model; an arbitrary properly edge-colored triangle-free graph has not been proved realizable in this way.

## 3. Minimum-cover optimality survives every triangle deletion

For a color set S subset C, write J_S for the graph consisting of its colored edges and let vc denote ordinary vertex-cover number. Any actual triangle cover can be described by retained C-colors and selected B-edges, so exactly

    tau(G) = min_(S subset C) [ |C|-|S|+vc(J_S) ].

Consequently C is minimum precisely when vc(J_S)>=|S| for every S.

Now take ANY J-edge pq of color c, corresponding to actual triangle T. In the strict H-D branch, C minus {c} has size2k-2 and is a minimum cover of G-E(T). In the colored representation this residual deletes color c and vertices p,q. Applying the same exact formula gives the stronger family of inequalities

    vc(J_S - {p,q}) >= |S|
    for every S subset C minus {c}, for every edge pq of color c.       (R)

The residual rainbow matching number is exactly k-1, while J has rainbow matching number k. Thus (R) retains the original cover-equality information after the deletion of BOTH noncover edges of every actual triangle. It is stronger than the ordinary color-subset Hall inequality alone.

No rainbow-matching minmax is inferred from (R). The earlier abstract K4 one-factorization obstruction violates the present triangle-free-J condition, but excluding it does not by itself prove a general theorem. Matching families are not matroids.

If one additionally assumes there is no one-/two-edge blocker, every actual triangle edge has codegree at least two. Otherwise, if f occurs only in T, deleting the other two edges destroys exactly the same triangle family as deleting all of T, already giving a two-edge blocker. Hence every color class of J has at least two edges, and every J vertex belonging to a triangle has degree at least two. These elementary necessary conditions do not establish a blocker.

## 4. A declared-input exclusion of nearly bipartite selected covers

If C is bipartite, choose a proper two-coloring of its vertices, extending it arbitrarily to other graph vertices. Color C-edges with a first edge color, and color B-edges according to whether their endpoints have equal or different vertex colors. Every actual triangle has exactly one C-edge, whose endpoints differ; its two remaining edges therefore have opposite parities. Thus every actual triangle is rainbow under an edge-three-coloring.

More generally suppose C minus {e} is bipartite for some selected edge e. Since C is minimum, e has an actual triangle witness T containing it. In G-E(T), every surviving triangle still has exactly one C minus {e} edge. The same parity construction makes every residual triangle rainbow. Its H-D tightness and the accepted rainbow-edge-three-color CS theorem force that residual to have B support. The accepted one-classified-residual H-D theorem then supplies the required blocker and, for k>=2, classifies G as a union of K4 triangle components. That classification has tau=2k, contradicting the strict branch.

Therefore for k>=2, any surviving strict-branch H-D candidate must have EVERY minimum C remain nonbipartite after deletion of EVERY one of its edges. The k=1 book case is not excluded and already has a one-edge blocker.

This last paragraph is PROOF_USING_DECLARED_INPUTS: it imports the accepted Aharoni/Haxell–Narins–Szabo rainbow CS transfer, plus the ordinary one-classified-residual restoration theorem. The earlier intersection identities, actual colored model, and residual inequalities (R) are ordinary. No universal bipartization availability, new finite ladder, or unrestricted H-D proof is claimed.
