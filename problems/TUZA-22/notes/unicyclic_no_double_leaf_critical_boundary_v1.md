> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# No-double-leaf does not repair the critical-edge selection lemma

Frozen ordinary auxiliary refutation and exact link repair, 2026-11-16. No computation is used.

## Counterexample with at most one original leaf per vertex

For n>=3 let F have a cycle of length2n alternating vertices A_0,D_0,A_1,D_1,...,A_(n-1),D_(n-1), and add one private leaf u_i adjacent to each A_i. There are no other edges.

This is connected, triangle-free and unicyclic. Each vertex has at most one original leaf neighbor. Its bipartition has sides A={A_i} of size n and B={D_i,u_i} of size2n. Thus nu(F)<=n, with equality by the n private leaf edges. Every maximum matching M saturates every A_i.

Let R=F-M. It has 3n-n=2n edges and maximum degree at most two: each A_i has degree exactly two after its matching edge is removed, while D_i and u_i had degree at most two already. Every component is a path or an even cycle, since R is bipartite.

A path with l edges has matching number ceil(l/2), and an even cycle with l edges has matching number l/2. Therefore

    nu(R)=n + (number of odd-edge path components)/2.

But R is a subgraph of F, so nu(R)<=n. Consequently every path component has an EVEN number of edges. Each is an odd-order path, whose matching and vertex-cover numbers both equal half its edge count, and whose every edge can be avoided by a maximum matching. An even cycle has the same edge-avoidance property by its two alternating perfect matchings.

It follows that tau_vertex(R)=n and tau_vertex(R-e)=n for EVERY e in E(R). This holds for EVERY maximum F matching, including every choice exposing an original leaf. Such matchings exist: replace A_j u_j in the all-leaf matching by a cycle edge incident with A_j, exposing u_j.

Thus the revised proposed alternative "strict matching-complement cover or a critical edge other than the exposed-leaf edge" is false even after imposing at most one original leaf per parent. The counterexample does not evade that necessary parallel-thread restriction.

## The actual closed-link family is nevertheless excluded

Let L=F+w with arbitrary w-adjacencies and minimum degree at least two. In particular every u_i sees w. Suppose L is a closed link at h in a minimum CS failure.

Choose distinct i,j. Let M contain A_i u_i, match A_j to one of its cycle neighbors D, and match every other A vertex to its private leaf. This is a maximum F matching of size n exposing u_j. Set P=M union {wu_j}, and Q=A union {w}. Both have size n+1; Q covers L-P. Balanced deletion gives a B residual.

If w sees some A_i, use that i in the construction. The actual triangle T=w A_i u_i meets P in its leaf base. Let Z consist of either alternating perfect matching of the A-D cycle, together with wu_j. It has size n+1 and avoids all of E(T). As F is triangle-free, L is K4-free; hence the matching-plus-rim footprint in each residual block is a star of at most two edges. Appending its n+2 triangles contradicts the packing number.

If w sees no A_i, then L is bipartite with parts A union {w} and B, and hence triangle-free. The same Z avoids f=A_i u_i in P. Codegree supplies an outside page on f, and the standard triangle-free full-footprint audit appends n+2 triangles, again a contradiction.

So this entire unbounded counterfamily to the isolated matching lemma has a direct ordinary CS link exclusion. The unresolved general nonperfect branch must retain BOTH supported-edge cover invariance and rim/external matching augmentation. Neither isolated critical-edge statement supplies a sufficient all-size alternative.

The construction is a falsifier of a proposed intermediate matching lemma, not a CS counterexample. No finite evidence, Kotzig theorem, or unsupported degree assumption is used.
