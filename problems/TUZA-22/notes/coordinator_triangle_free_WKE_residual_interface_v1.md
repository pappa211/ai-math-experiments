> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A triangle-free WKE residual exposes the full local cone packing

Frozen ordinary conditional interface for fresh review, coordinator, 2026-11-16 UTC. This is a necessary condition on a minimum-CS graph, not a universal WKE exclusion.

Let L be a closed link component at h. Let P be a matching of size r and Q a vertex cover of R=L-P with |Q|<=r. Let K be obtained by deleting all h-spokes to L and P. Balanced minimum-CS accounting gives |Q|=r, B(K), nu(K)=nu(G)-r and tau(K)=2nu(K). Assume additionally that R is TRIANGLE-FREE. Let U be the spanning subgraph of R consisting of edges lying in no actual triangle of K. Let A be the literal cone on L with apex h, a subgraph of G.

## 1. Simultaneous support removal

Every old K4/K5 block contains at most two vertices of L, since three would be an R triangle. Thus it contains at most one R edge. Choose in each old block a minimum cover containing that edge whenever present. The resulting minimum K cover D contains ALL triangle-supported R edges simultaneously, while it contains no unsupported R edge. The accepted residual-cover substitution inequality therefore gives

    vc(U)=vc(R)=r.

This is stronger than the individual supported-edge invariance. No assertion that U is known from L alone is made. A locally computable necessary superset is obtained by retaining the R edges that occur in an L triangle containing a P edge: minimum-CS codegree forces every unsupported R edge into this superset, since its non-hub page must be destroyed on P. Consequently that superset also has vertex-cover number at least r.

If R is bipartite, U is bipartite and has a matching of size r by the ordinary bipartite matching-cover equality. One elementary proof chooses a maximum matching, follows alternating paths from unmatched vertices on one side, and takes unreached vertices on that side together with reached vertices on the other; this covers every edge and has one vertex per matching edge. This is an ordinary declared elementary input, not a new matching theorem.

## 2. Every packing in the whole cone lifts

Let J be ANY edge-disjoint actual triangle family in A, including an arbitrary mixture of hub and rim triangles. Its intersection with old K consists only of R edges. Each old block contains at most one such edge. Choose maximum old block packings avoiding that edge, and append J. The whole footprint is avoided simultaneously. Hence

    |J|<=r, and therefore nu(A)=r,

because the r hub triangles on P already form an A-packing. In particular no restriction to one rim triangle or to retaining the original P is necessary. Any local multi-rim augmentation in the cone is automatically valid with arbitrary outside attachments.

## 3. An outside page forces a local packing-critical base

Suppose f=ab belongs to P and abx is an actual page with x outside N_G(h). For any packing J in A-f, the page is disjoint from J. In an old block its footprint has at most one surviving spoke, since f is absent from K. The J footprint has at most one R edge. If that edge and the page spoke were disjoint, the block would contain three distinct vertices of L (a and the two rim endpoints, or b and them), contradicting triangle-freeness of R. Thus the combined footprint has at most two incident edges in every block. Choose maximum old packings avoiding it and append J and abx. It follows that

    nu(A-f)<=r-1.

This applies to every deleted base having any outside page. Therefore a local size-r packing avoiding such a base already excludes the tuple, even if the packing contains many rim triangles. Closedness excludes a non-hub outside page apex in another component of the h-link.

## 4. A conditional proper-cone consequence

If no edge of P has an outside page, every triangle lost in forming K lies entirely in A. A minimum A cover together with a minimum K cover therefore covers G. If A is a PROPER edge subgraph of G, class-local CS applies to A. The equation nu(A)=r and equality of G force tau(A)=2r and B(A). Since L is connected and nonempty, all hub triangles form one shared-edge triangle component and include every A edge, so A is a literal K4 or K5. Thus L is K3 or K4, excluded by the authenticated closed-link robustness in a minimum CS failure.

Accordingly any surviving tuple with R triangle-free and A proper must have at least one outside page on P, and every such base is packing-critical in A. The case A=G does not allow induction on A and is expressly not closed by this argument. No proof that these necessary conditions are contradictory in general is supplied.

## Scope and next question

This interface is ordinary and uses only balanced CS minimality, the existing residual-cover inequality, and elementary K4/K5 footprint avoidance. It has no finite census premise. The next mathematical question is to exploit the simultaneous conditions vc(U)=r, nu(A)=r, and criticality of all outside-supported P bases. Treating U as all of R, asserting every P base has an outside page, or applying CS to A=G would be invalid shortcuts.
