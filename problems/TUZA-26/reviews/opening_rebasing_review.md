> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent compatible-pair rebasing review

Status: ACCEPTED ORDINARY for the exact retention obstruction, conflict-component constraints, and conditional hybrid augmentation. Availability remains OPEN. No computation or Lean check.

The compatible-partner argument is valid: a maximum Q-P_z packing must contain an uv-page, and removing that page yields the exact compatible residual of size k-1. The global optimization over compatible pairs and their maximum packings is finite and legitimate; it is not a new graph-minimality or naming premise.

The strict retention inequality is correct. An r-packing after deletion of all old outside edges would join M_0 to make a maximum rebased packing. Any outside triangle among its r triangles immediately improves the globally maximized outside count. Otherwise all r triangles are endpoint fans, and the missing z-spokes prevent their rims from using either za or zb. At most one uses ab. The actual outside crossing T can therefore be appended or replace that one fan triangle, contradicting either maximum size or global canonicality. This proves nu(L_zw-E(M_0))<=r-1; it does NOT prove extension or retention.

The actual bipartite conflict graph includes every shared physical edge. Component-side choices therefore produce literal packings. Choosing every positive imbalance gives a K packing of size k-1 plus their sum, and nu(K)=k bounds that sum by one. Integrality and total imbalance zero yield exactly the stated all-balanced or unique +1/-1 pattern. Equal total sizes alone would not give balance. Identical triangles do form isolated balanced pairs, because each original side is a packing.

A +1 swap produces a maximum K packing and must hit every page pair, or the corresponding uv-page could append in Q. This proves the marked-page responsibilities of C_+ and C_-. In the unbalanced case arbitrary balanced-side choices are still maximum K packings, so the additional three-way page responsibility is exact. If the compatible pairs share an apex, all hybrids lie in its blocker-deleted K subgraph of maximum k-1 and imbalance is impossible.

The localized hybrid is valid. The components containing old z/w-spoke triangles are at most four; they include C_- when it exists. Adding C_+ makes the total selected imbalance zero. Choosing N on those components removes every forbidden old spoke and keeps a maximum L_zw packing, while retaining M elsewhere. All old intersections with T were the two z-fan triangles and are removed. Thus if the selected N sides avoid T, the hybrid avoids T and the two actual triangles T and uvz append to give k+1. This is an explicit conditional augmentation, not a proof that the avoidance occurs. At most five components need change, or two when the pairs share an apex; their sizes and triangle boundaries are unbounded.

The closest-rebase claim is also correct. A nontrivial balanced component outside the marked selected set can be switched to its M side inside L_zw, increasing the number of common triangles. It contains no common triangle already, because those form isolated identical pairs. This contradicts closestness. It still supplies no profitable outside retention.

## What would actually pay the obstruction

The strict inequality is a negative result for retaining all M_0, not evidence that a maximum rebased packing extends it. Nor does localization to five arbitrary conflict components yield a proper region with a controlled response.

One exact cover formulation of the missing payment is available. Put D_*=L_zw-E(M_0), with s=|M_0| and r=k-1-s. Proper CS and the proved retention loss give tau(D_*)<=2r-2. A literal extension of a D_* cover to Q at additional cost at most 2s+2 would therefore give

    tau(Q)<=2r-2+2s+2=2k-2,

contradiction. Equivalently that extension bound, together with tau(Q)=2k-1, would force tau(D_*)>=2r-1 and hence nu(D_*)>=r, paying precisely the missing retention unit.

This extension bound is NOT proved. Naively adding all three edges of every old outside triangle plus the five marked book edges costs 3s+5, missing the required budget by s+3. Whole-triangle Q-cover eligibility does not supply an extension of an arbitrary residual cover at the cheaper price, and a cover matching does not provide it. An actual boundary/cover construction achieving that bound, or an explicit outside-packing replacement with positive net gain, would be genuine progress. Merely counting the conflict components is not.

Bound source: `notes/apex_compatible_pair_rebasing_v1.md` SHA-256 `317077a91ed455313c53456d6b7054236422cfc1698289e8127946821a999f81`.
