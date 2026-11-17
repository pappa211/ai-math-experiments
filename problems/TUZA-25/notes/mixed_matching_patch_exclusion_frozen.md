> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Excluding nonempty tight patches in the zero-gain matching reconstruction

Coordinated ordinary deduction for fresh review, 2026-11-16. This uses the exact marked-edge transfer, not an inference that shared vertices are fresh.

## Precise setting

Use `residual_matching_component_confinement.md`: H=J plus the four new triangle-supported spokes from x to a literal K4 A; R=J-M for an opposite pair M in A. R has one resilient defect-one triangle component and other literal K4/K5 components Q. Delete only each Q's nonboundary edges to obtain the active K, retaining every vertex, boundary edge and background edge. Let F be the boundary-edge set and r=sum_Q nu(Q). The proved identities are

    nu(H)=r+nu(K),  tau(H)=2r+tau(K-F).

Assume H has connected triangle support, is resilient and defect one, and nu(H)=nu(J) (zero gain). Assume proper-subgraph CS for K when it is proper. For the final exclusion use this separate, explicit minimality premise:

> H is a minimum-supported-edge graph, among proper edge-subgraphs of a fixed minimum-CS counterexample, whose triangle support is connected, resilient, defect one, and outside C12.

Thus a strictly smaller connected/resilient/defect-one subgraph is named by this wider-class MINIMALITY, not by CS. No leaf availability or membership in frozen F follows from this premise alone.

## Zero gain descends to the active region

Let E_x be the four x-spokes. No tight Q contains x or an x-spoke, because Q is a triangle component of R before x is added. Applying the same packing partition after deleting E_x gives

    nu(J)=r+nu(K-E_x).

Consequently nu(H)=nu(J) implies

    nu(K)=nu(K-E_x).

All background edges at x remain retained. They belong to no present triangle, so this equation has the same triangle-packing meaning as deleting x from the support.

The exact cover transfer and CS(K) give defect(K) in {0,1}. If defect(K)=0, connected triangle support and the literal K5 on A union {x} force K's entire triangle support to be that K5. Deleting E_x leaves its K4 on A and lowers nu from two to one, contradiction. Therefore K has defect one, as well as connected triangle support and resilience supplied by the marked-edge transfer.

## A named active region cannot have zero gain at x

If at least one Q was removed, K has strictly fewer supported edges than H. Under the displayed wider-class minimality premise, K's support belongs to C12.

K contains a literal K5, so it is neither W5 nor K5-minus-an-edge. It is one of the ten archived fresh-edge defect-one models. In each of those explicit constructions, every support vertex of degree four is a private vertex of a K5 piece: private K4 vertices and unattached central-K4 vertices have degree three; K4 attachment endpoints have degree at least five; the shared endpoints of two K5s have degree seven. The vertex x has exactly four triangle-supported neighbours, namely A, and so is private to a K5 piece.

Deleting E_x changes that K5 piece into a K4 and leaves the other pieces and their attachment edges intact. Exact fresh-edge packing additivity lowers nu by one. Background edges create no replacement triangle because deleting edges cannot create triangles. This contradicts nu(K)=nu(K-E_x).

Hence **under the stated wider-class minimality, the zero-gain matching reconstruction has no tight R component at all**. R itself has the single named active component, possibly with background; its support is named because it is a strictly smaller connected/resilient/defect-one subgraph. Reconstructing H from that named R and the matching remains a separate step.

## Optional hub fact (not needed by the preceding exclusion)

Suppose a graph's active triangle support P has a universal support vertex h. Let a literal clique Q share exactly one edge f with the active edge support, and suppose every actual triangle using a Q edge but not wholly contained in Q uses only the boundary edge f. Then Q and P share no support vertex beyond the endpoints of f.

If h belongs to Q and there are three common vertices, the two hub edges to other common vertices are shared, contradicting the one-edge intersection. If h is outside Q, choose two common vertices u,v with uv different from f (possible among three common vertices). The triangle huv is actual, uses Q edge uv, and is not wholly in Q, contradicting the boundary hypothesis. This is a proof with actual crossing triangles accounted for; it does not treat arbitrary shared vertices as fresh by declaration. Background-only vertices may already exist in the vertex universe and remain irrelevant to this support statement.
