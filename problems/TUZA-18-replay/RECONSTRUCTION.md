# Reconstruction of the common-vertex packing theorem

**Verdict.** The two frozen statements follow from the argument below for finite simple graphs. The cover belongs to the allowed edge set of the specified packing. The proof uses only replacements of at most two packed triangles. The finite checker supplies separate evidence for its recorded domains.

## Statements and notation

Let \(P\) be a packing of \(k\) pairwise edge-disjoint triangles, all containing \(v\). Set \(B=E(P)\). A triangle outside \(P\) is private for \(T\in P\) if it meets \(B\) in a single edge, which belongs to \(T\). A private \(K_4\) completion of \(T\) is a copy of \(K_4\) containing \(T\) such that all three other faces are private for \(T\). Let \(A(P)\) be \(B\) together with the edges of all these completions, computed from this original \(P\).

The local statement guarantees at least one of the following.

1. For some \(j\in\{0,1,2\}\), remove \(j\) members of \(P\) and insert \(j+1\) pairwise edge-disjoint triangles avoiding the edges of the retained members.
2. There is a set \(C\subseteq A(P)\) of at most \(2k\) edges meeting every triangle of \(G\).

When \(P\) is maximum, the first possibility would give a larger packing, so the second proves the common-vertex theorem. For the local statement the alternatives may coexist. We prove the second under the assumption that the first is unavailable. When \(k=0\), any triangle would be a zero-member augmentation, so the empty cover suffices under this assumption.

## Classifying the edges between active pairs

Write \(M\) for the edges opposite \(v\) in the packed triangles. The spokes of \(P\) are distinct, so \(M\) is a matching. Put \(U=V(M)\), \(W=N(v)\setminus U\). Any triangle avoiding \(v\) must meet \(M\) since otherwise it could be appended to \(P\). It meets exactly one matching edge. Call such a triangle an old page, its matching edge its base, and the third vertex its tip. A pair is active when its base supports an old page. Write \(S\subseteq M\) for the active bases. The graph on \(W\) is edgeless, as an edge there would also give a triangle avoiding \(B\).

For two distinct active pairs \(i=\{a,b\}\) and \(j=\{c,d\}\), take one old page on each. If these pages are edge-disjoint, they can replace the two packed triangles with those bases. They use no spokes and no other matching edge. If a cross edge between \(i\) and \(j\) were unused, it could form a third triangle with \(v\) and the freed spokes, giving a forbidden two-member augmentation. Two pages on these bases can share an edge only if each tip lies on the opposite pair. In fact a shared edge cannot be either base since the pages have distinct matching edges, and any shared nonbase edge must join the two tips, one in each base.

The bipartite graph between \(i\) and \(j\) has the following exhaustive cases.

| Cross edges | Consequence |
|---|---|
| Zero | No constraint between the pairs. |
| One, or two disjoint | Neither pair has a possible tip in the other. Any two pages are disjoint and use no cross edges, contradicting the two-member exchange. |
| Two meeting at \(c\) | The edges \(ac,bc\) give the old page \(abc\). A different tip on \(ab\) would lie outside \(j\), and every tip on \(cd\) lies outside \(i\). The resulting pages would leave the cross edges unused. Thus \(c\) is the only tip on \(ab\). Orient the pair relation \(i\to j\) with center \(c\). |
| Three | Relabel them \(ac,ad,bc\). The internal tips are \(c\) for \(ab\) and \(a\) for \(cd\). A page on \(ab\) with an external tip is disjoint from \(acd\) and leaves \(bc\) unused. A page on \(cd\) with an external tip is disjoint from \(abc\) and leaves \(ad\) unused. Record the two opposite arcs. |
| Four | Both endpoints of each pair are tips on the other. Any page with an external tip is disjoint from an internal page on the other base. Together they use just two of four cross edges, which is impossible. Record the two opposite arcs. |

The directed graph on the active pairs has outdegree at most one. Each outgoing relation requires all old tips on its tail base to lie in its head pair. Two distinct heads have disjoint vertex sets and the tail has at least one tip. Every weak component has a unique terminal object, either a sink or a directed cycle. To see uniqueness, follow outgoing arcs from each pair to its eventual sink or cycle. The eventual terminal object is constant across every arc and thus across the weak component. A directed two-cycle is precisely a pair of opposite arcs from the three- or four-edge case.

## Paying for a spoke at an unmatched vertex

If an endpoint \(a\) of an active pair \(\{a,b\}\) has a neighbor \(w\in W\), the apex triangle \(vaw\) is available after removing \(vab\). An old page \(abx\) with \(x\ne w\) is disjoint from it and also avoids all retained packed triangles. To prevent this one-member augmentation, every old tip on \(ab\) must be \(w\). The edge \(bw\) therefore exists. Applying the same reasoning to every neighbor in \(W\) shows that \(w\) is the unique such neighbor for the pair. The actual \(K_4\) on \(v,a,b,w\) has other faces meeting \(B\) respectively in \(ab,va,vb\). This makes \(vw\) permissible in the original \(A(P)\).

This active pair is a sink because its tip lies outside \(U\). Mark every sink obtained in this way. If \(r\) sinks are marked and \(W_0\) is the set of their unmatched tips, then \(|W_0|\le r\). There is at most one marked sink per weak component, even if several components use the same unmatched tip.

## Choosing the spokes and checking the budget

On active endpoints consider the graph of cross edges, omitting the bases. We construct an independent set \(I\) of size \(|S|+r\). Peel pairs of indegree zero outside the sink or cycle of each component, retaining their parent until they have been peeled. Each peeled pair has only its two edges to a single parent center among the pairs then present. At a sink choose one endpoint, or both if the sink is marked. At a two-cycle choose both endpoints of one pair, since the bases are omitted. On a longer cycle, select in each pair the endpoint other than the center of its incoming arc. A cross edge on the cycle always meets an excluded center. These initial selections meet the per-pair count and give one extra vertex for every marked sink.

Restore peeled pairs in reverse order. If the pair's parent center is absent from \(I\), add one endpoint. If the center is present, remove it and add both endpoints. Both operations preserve independence and increase \(|I|\) by exactly one. A marked sink can lose selected endpoints during restoration, but the extra cardinality survives. Consequently the cover will pay for one spoke per marked sink even when later exchanges select different vertices.

Define \(C=S\cup\{vx:x\in U\setminus I\}\cup\{vw:w\in W_0\}\). Active bases and matched spokes lie in \(B\), and each unmatched spoke was justified by its private completion. These three sets are disjoint, giving

\[
|C|=|S|+2k-|I|+|W_0|=2k-r+|W_0|\le 2k.
\]

An old triangle is hit by its active base, even when its tip lies outside \(N(v)\). An apex triangle on two matched vertices is covered by its active base, a spoke to an inactive endpoint, or a spoke at the endpoint omitted from \(I\) on a cross edge. An apex triangle on one matched and one unmatched vertex has a selected spoke at the inactive matched endpoint or at the tip of the marked active pair. An apex triangle on two unmatched vertices is impossible because \(W\) is independent. These cases cover all actual triangles of \(G\).

Thus the local dichotomy and its maximum-packing consequence hold with the original allowed edge set. The unrestricted existence of an appropriate common-vertex maximum packing, or of an allowed cover for general maximum packings, remains outside the two statements.

[Frozen theorem](frozen/notes/criticality_star_pk_theorem.md) · [Frozen corollary](frozen/notes/criticality_star_local_dichotomy.md) · [Machine comparison](checker_comparison.json)
