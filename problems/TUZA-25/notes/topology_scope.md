> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Cohomology, cut covers, and the unpaid interface

Let X be the triangle complex of the entire finite simple graph: C0 over vertices, C1 over actual edges, C2 over all actual triangles, with F2 coboundaries d0 and d1. No geometric triangle is omitted. Assume m=|E|>0 and t=|T|>0 for the normalized constants below; empty triangle families are separate trivial cover cases. Write Z1=ker d1 and B1=im d0.

For any triangle cover C subset E, set F=E\C. On every triangle, d1(F)=1+|C intersection T| modulo2. Since a cover hits each triangle1,2,or3 times, the support of d1(F) is exactly the triangles hit twice. This is an identity, not an inequality or a rounding theorem.

An odd cover meets every triangle in1 or3 edges. The entire family is {E symmetric-difference Z: Z in Z1}. Cut covers are {E symmetric-difference B: B in B1}. Thus equality of these families is equivalent to H1=Z1/B1=0. Equality of their minimum cardinalities is weaker: the frozen K5 ring has H1 dimension1 but tau=min odd-cover size=min cut-cover size=12. It provides an explicit control against inferring family equality from equal optima.

Define dist(A,L)=min{|A symmetric-difference Y|:Y in L}. Use edge norm |A|/m and triangle norm |Q|/t, and define

    h_Z = min_(A notin Z1) [(|d1 A|/t)/(dist(A,Z1)/m)],
    h_B = min_(A notin B1) [(|d1 A|/t)/(dist(A,B1)/m)].

If the minimization set is empty, state that degenerate case separately (or assign +infinity). For a finite graph with t>0, h_Z is positive automatically; its quantitative magnitude, not mere positivity, is the useful question. A nonzero cohomology class forces h_B=0: take A in Z1\B1. This does not force h_Z=0. For h_Z>0, a nearest cocycle Z to F satisfies

    |F symmetric-difference Z| <= (m/t) |d1 F| / h_Z.

Consequently C'=E symmetric-difference Z is an odd cover and

    |C'| <= |C| + (m/t) (#triangles hit twice by C)/h_Z.

Replace Z1 with B1 only under a justified h_B bound. The m/t factor is necessary with the stated normalization. This proximity estimate contains an additive error; it gives no signed saving and no cover bound2nu. Exact change is |C'\C|−|C\C'|, so a useful payment theorem must control which changes add or remove cover edges. No such theorem was obtained by the ring computation.

For a fixed maximum packing P of size nu and any two-coloring, each packed triangle has1 monochromatic edge if nonmonochromatic and3 if monochromatic. If a is the number of monochromatic packed triangles and b the number of monochromatic graph edges outside support(P), the cut-complement cover has cardinality nu+2a+b. The inequality2a+b<=nu is therefore exactly the desired cut-cover budget, with no construction or availability supplied by the identity.

The unrestricted cut-cover proposal is false even on triangle-free C5: nu0, minimum cut complement1. This does not address the scoped proposal on nonempty triangle-supported shared-edge-connected two-edge-resilient graphs. The ring satisfies that domain and passes its cut bound12<=16. The reported blow-up-cone obstruction is not independently recreated in this track and does not satisfy two-edge resilience; it cannot be substituted for a scoped counterexample.

A cochain with small coboundary is a set of graph edges with few parity defects. Its definition does not select a proper vertex region, specify crossing triangles, or yield a smaller graph. A valid successor would need (i) an explicitly proper region R with all crossing triangle incidences, (ii) finite boundary states realized by an actual smaller simple graph, and (iii) exact packing/cover transfer a<=2b. The64 response states of an entire residual supply none of (i)–(iii) alone. This exploratory route is presently an interface obligation, not an advancing proof mechanism.

Status: elementary identities reconstructed here, awaiting fresh reviewer; ring is separately finite-verified. No expansion catalogue or claim of novel expansion theory. The bounded audit is complete unless a concrete replacement mechanism emerges.
