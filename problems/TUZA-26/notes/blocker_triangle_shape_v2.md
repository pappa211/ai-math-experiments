> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A triangle-shaped fragile blocker triple forces K5-e

Frozen ordinary proof candidate v2, 2026-11-16, for independent review. The proof is streamlined from v1; no theorem change.

Let L be finite simple with B(L), let S={ab,bc,ca} consist of three absent edges on distinct vertices, and put Q=L+S. Assume Q has one nonempty shared-edge triangle component and, writing m=nu(L),

    nu(Q)=m+2, tau(Q)=2m+3.

Then the entire triangle support of Q is K5-e. Isolated vertices and retained triangle-free background are allowed in the statement. No single-edge resilience or minimum-counterexample premise is needed for this isolated theorem.

Proof. The terminals a,b,c are independent in L. The new triangles are exactly abc and the ordinary pages on its three bases, with apex outside {a,b,c}. If the base/apex incidence has a matching of size three, the three selected pages are edge-disjoint. In each old literal K4/K5 triangle component, the whole old footprint is a star of at most two edges: the component contains at most one independent terminal, which lies on only two selected bases. Maximum old clique packings avoid this footprint (K4 avoids a star; K5 avoids two edges). Appending the three pages contradicts nu(Q)=m+2. Thus that incidence matching number is at most two.

The following elementary cover argument uses actual triangle geometry. A bipartite incidence graph with matching number at most two has an incidence vertex cover of size at most two. If it consists of two base vertices, the corresponding restored edges cover all new pages and abc. If it consists of a base ab and an apex x, the pair {ab,cx} covers the new family; if cx is absent there are no pages outside ab and ab alone suffices. Covers with fewer vertices reduce to these cases or are even simpler.

In the remaining case the incidence cover consists of two apices x,y. Thus these are the only active page apices. The bases seen by any one apex are exactly the pairs in its set of adjacent terminals. Since all three terminal pairs are restored bases, an active apex has exactly one or three pages, never two. If x has only the page abx and y is full, {ab,cy} covers the new family. If both are nonfull, their one or two base edges cover it, including abc. With only one active apex, one base and the opposite spoke suffice (or a single base if it is nonfull). Consequently the only possibility lacking a two-edge cover is exactly two full apices.

A two-edge new-family cover would combine with a minimum L cover to give tau(Q)<=2m+2, impossible. Hence the exceptional family is forced: abc and all six pages on its three bases with apices x,y. Each of its six old spokes belongs to a three-edge cover of that family; for ax use {ax,ay,bc}, and relabel. If any spoke were triangle-supported in L, choose a minimum L cover containing it in its unique literal K4/K5 component. The overlap gives a cover of Q of size 2m+2, again impossible. Thus all six spokes are old background. They form, with S, one literal K5-xy support; xy is absent, for otherwise axy would be an old triangle supporting ax.

Every actual new triangle has been included, and its support is disjoint from every old triangle component. Shared-edge triangle connectivity forces L to have no triangles and Q's support to be precisely this K5-e. This proves the claim.

## Role and limits

For the independently checked minimum-Q saturation theorem, a blocker pair {e,f} leaves a defect-one residual. If it is fragile at g, the three-edge deletion S={e,f,g} leaves B and gives the displayed gain-two/cover-gain-three profile. Therefore S cannot form a triangle in minimum Q outside C12. The analogous star theorem forces W5. The remaining shapes P4, P3 plus a disjoint edge, and three disjoint edges are separate obligations. This does not establish that any blocker pair exists, or that a resilient pair residual can always be reconstructed.

Dependencies: literal clique avoidance and edge eligibility; the three-base incidence argument supplied above. The equivalent archived two-triangle/one-triangle page lemma is a cross-check, not a need to assume an abstract incidence statement with unrealizable two-page apex sets. No census, replacement outside fixed G, or Lean premise.
