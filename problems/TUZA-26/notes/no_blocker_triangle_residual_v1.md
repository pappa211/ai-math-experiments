> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle residuals in the no-blocker branch

Frozen ordinary candidate for independent review, 2026-11-16. This is an elementary structural refinement, with no historical-originality claim.

## Lemma: two-edge resilience forbids a B triangle residual

Let Q be finite simple and nu(Q-D)=nu(Q)=k for every edge set D of size at most two. For any actual triangle T, put L=Q-E(T). Then nu(L)=k-1 and L does not satisfy B.

The packing identity follows because deleting the first two triangle edges preserves k and deleting the third lowers packing by at most one; conversely any L packing appends T in Q, giving nu(L)<=k-1.

Suppose B(L), and put m=k-1. Write T=abc. Its three vertices are independent in L. Each restored base has an ordinary page: delete the other two T edges from Q. Packing remains k=m+1, so a new triangle on that sole surviving base must exist. Any two pages on different bases and with distinct apices are edge-disjoint, and their entire old footprint in each literal L clique is a star of at most two edges. Indeed each old clique contains at most one of the independent terminals, and both pages have spokes incident to that terminal if it occurs. Choose maximum old clique packings avoiding those stars and append the two pages, giving m+2, contradiction.

Hence every page on every base has the same apex x: fix a page on one base and compare with each of the other nonempty base families, then compare back. The complete new triangle family consists exactly of the four faces of K4 on a,b,c,x, including T. Delete two opposite edges of this actual K4. They meet every new triangle; every surviving triangle is an L triangle. Packing after that two-edge deletion is at most m, contradicting two-edge resilience. Therefore B(L) is impossible.

No delta, connectivity, CS, or maximum-degree hypothesis is used in this lemma. Arbitrary old background and all new pages are retained. It does not assert single-edge resilience of L.

## Consequence for the conditional minimum Q

If the minimum unknown Q has no blocker pair, it is two-edge resilient. It legitimately gains every-triangle extension by the preceding packing identity; this is derived anew, not inherited from the original parent. Proper-subgraph CS and the no-B conclusion give, for every T,

    nu(Q-E(T))=k-1,
    tau(Q-E(T)) in {2k-4, 2k-3},
    delta(Q-E(T)) in {2,1}.

The lower cover bound is tau(Q)-3=2k-4; the upper bound 2k-2 from CS cannot be attained because it would be B.

Moreover, delta(Q-E(T))=2 if and only if some minimum Q cover contains all three T edges. In one direction remove those three cover edges to cover Q-E(T); the lower bound forces equality. In the other add E(T) to a minimum residual cover, obtaining size2k-1.

Thus the no-blocker branch has an explicit dichotomy: triangle-contained minimum covers produce defect-two residuals; all other triangles produce defect-one residuals. Resilience and connected active-support reconstruction of those residuals are separate unresolved obligations. Neither this dichotomy nor every-triangle extension supplies an available paid reduction by itself.
