> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: paid K5 triangle-leaf deletion

Frozen 2026-11-16T22:08:03.103448+00:00. **PASS — PROVED_ORDINARY at the supplied literal-leaf, fixed-G minimum-Q scope.** Reviewed notes/apex_k5_triangle_leaf_v2.md, SHA-256 `f2f2a16eb2c4869023ab3da62b2a4f4c36ef99155d3d1284198259abf6bf3341`. The deletion Q->P=Q-y has exact packing loss one and cover loss two, and P is connected, supported, resilient and defect one. Its named reconstruction contradicts minimum unknown Q. No predecessor K4-completion, general degree bound, or later blocker-boundary result is a premise.

## Exact payment

For J with old triangle A and the two private K5 vertices x,y, let K=J-E(A), p=nu(J), and b=max_e nu(J-e). Every Q cover uses at least four edges in D=K5[A+x+y]; its non-D edges must cover K because K triangles contain no A edge and no private vertex. Conversely E(A) plus xy is a four-edge D cover and, together with a K cover, covers all actual Q triangles. Thus tau(Q)=4+tau(K) exactly. This agrees with the general leaf formula because tau(J)>=tau(K)+1.

At most two new triangles fit. Two use at least one old A edge; one can use none, namely xya. Conversely xbc together with xya uses only prescribed old base bc. Therefore nu(Q)=max(p+1,2+b). Since nu(K)<=p-1 by appending A, a gain-two branch would contradict proper CS on K. Consequently nu(Q)=p+1, tau(Q)=2p+1, every A edge is critical, and K has nu=p-1,tau=2p-3.

Cover restriction gives tau(J)>=tau(K)+1=2p-2; critical-edge cover extension gives tau(J)<=2p-1. The upper alternative is excluded by the archived adjacent-critical lemma: A would be an isolated K3 triangle component of J and all other components tight, so replacing A by K5 would make B(Q), incompatible with defect one. Hence tau(J)=2p-2. P=J+x has nu=p. Its cover upper bound is2p-1 by one new spoke. Conversely any P cover includes an edge uv of the literal K4 D0=A+x; adding y-spokes to the other two vertices covers every y-page, so tau(Q)<=tau(P)+2. This forces tau(P)=2p-1, proving the exact payment.

## Specific resilience descent

If an actual P edge g were critical, proper CS and cover extension make P-g tight B. If g lies in D0, its surviving diamond puts both missing-edge endpoints in one literal B component, impossible. Otherwise D0 survives inside one old component Z, which is K4 or K5. All new y-pages are within Z+y because y has exactly D0 as its neighbors; no other old component shares a supported edge with that new family.

For Z=K4, adjoining y changes its local packing from one to two, so nu(Q-g)=p, contradicting Q resilience at nu(Q)=p+1. For Z=K5, the local graph is K6 minus the edge from y to the fifth old vertex. Partition its vertices3+3 with that missing pair in the same part; the five actual within-part edges hit every triangle. Replacing the old K5 cover of size four therefore costs at most one, giving tau(Q-g)<=2p-1 and tau(Q)<=2p, contradiction. This exhausts the literal B possibilities and proves P resilience. Arbitrary shared vertices/background introduce no uncounted page under the exact y-neighborhood premise.

## Supported connectivity and literal named expansion

Every J edge outside A was already triangular in J, since a private vertex can contribute an old edge only in A. All A edges and x-spokes remain in D0. Thus P stays supported. Every old triangle component formerly connected through the K5 leaf uses an A edge, and the surviving K4 retains all these interfaces, so P's nonempty triangle family remains connected. Exactly four supported y-edges are deleted, giving a strict fixed-G supported-edge decrease. The separate Q minimum, not CS alone, names P.

Its x has degree three, is simplicial, and deleting it does not lower packing. W5 has no degree-three simplicial vertex; the two-K5 model has minimum degree four. In K5-e, deleting either degree-three peripheral vertex leaves K4 and lowers packing, so that model is excluded by the exact zero gain. In a central-K4 star model, the degree-three simplicial vertices are precisely private K4-leaf vertices or untouched central vertices; each closed neighborhood is a literal K4 construction piece. This follows directly from the frozen twelve definitions. Adding y to that neighborhood replaces that K4 piece by K5 while preserving all other attachment edges and fresh private vertices. Hence Q lies in the exact fresh-edge class; its given defect one invokes the independently reconstructed archived classification and makes Q C12, contradiction.

This proof also validates the isolated general resilience lemma at its stated numerical premises. It does not assert resilience descent for arbitrary additions. It handles a supplied actual minimum-degree-four leaf but does not prove such a leaf exists; the later boundary programme must establish that geometry independently. There is no circular use of minimum degree four or later reconstruction in this leaf theorem.
