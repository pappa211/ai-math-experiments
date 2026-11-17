> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Link excess and the first one-cycle leaf interface

Status: ordinary corollaries of the accepted link-vertex-deletion theorem; frozen for review.

Let G be a minimum combined-CS failure with isolates discarded, and let L be any nonempty connected closed link component. Put n=|V(L)|, m=|E(L)| and mu=m-n+1. The accepted theorem says every component of L-w contains a cycle for every w in V(L). Hence L-w has at least n-1 edges, so

    m-deg_L(w)>=n-1,
    deg_L(w)<=mu.

Therefore

    mu>=Delta(L).

Summing the degree inequalities yields2m<=n(m-n+1), or m(n-2)>=n(n-1). Since robustness gives n>=5, integrality implies

    m>=n+2.

Equality deg_L(w)=mu implies every component of L-w is unicyclic. These statements count the actual induced link edges and do not presuppose triangle-freeness.

Now let C be ANY triangle cover of G with exactly one selected cycle, and let v be a selected leaf with unique selected neighbor w. Every edge of the link at v outside w is selected in C. By the link-vertex-deletion theorem every component of this selected induced graph contains a cycle. As C has only one cycle in total, there is exactly one such component, it is unicyclic, and it contains every neighbor of v except w. Thus the whole link L=G[N(v)] is connected and

    L-w is connected unicyclic,
    mu(L)=deg_L(w)=Delta(L).

In particular deg_L(w)>=3: if it were at most2, minimum link degree2 and the maximum-degree equality would make L a cycle, whose mu is1, a contradiction.

If deg_L(w)=3, then L is subcubic with minimum degree2 and mu3. Writing n3 for its number of degree3 vertices gives

    2m=2n+n3,
    mu=1+n3/2,

so n3=4. All remaining link vertices have degree2. This identifies an unbounded-order but four-branch structural interface; it does not itself prove a WKE equality reduction or exclude that interface. The distinction between a WKE inequality certificate and a combined-CS exclusion remains essential.

Dependencies: `notes/link_vertex_deletion_cyclic_components_v1.md`, SHA-256 `1369c2ed436c3d3f166e5dc2b27df57dd9d98ccd08ac60a07eef47310b629791`, freshly accepted in `review/challenger_link_deletion_cyclic_review.md`; the authenticated minimum-link-degree/robustness inputs; and the actual cover-leaf identity. No computation or new external theorem is used.
