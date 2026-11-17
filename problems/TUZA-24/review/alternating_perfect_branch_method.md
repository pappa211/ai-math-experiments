> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Perfect apex-forest branch without ordered paths

The formal theorem `Tuza24.perfect_apex_link_excluded` has the exact hypotheses:

- `hG : Tuza23.MinimalCS G`;
- an actual edge `G.Adj v w`;
- `(isolate (linkGraph G v) {w}).IsAcyclic`;
- an actual vertex-disjoint edge matching M in that isolated full link;
- `matchingVertices M = (peelNeighbors G univ v).erase w`.

Its conclusion is `False`. The explicit active set is the full neighborhood with w removed. Retained isolated vertices outside that set do not count towards perfectness or deficiency.

## Proof reorganization

The frozen ordinary proof identifies the remaining forest as an ordered even path. The formal proof avoids that representation without changing the mathematical claim.

Write F for the forest link, r=|M|, S=matchingVertices M, and R=E(F)\M. The acyclic edge count on S gives |R|≤r−1. If this is strict, choosing one endpoint from every R edge yields a residual forest cover B with |B|+1<r. The same saving exists if two R edges intersect: their common vertex covers both. Adding the apex produces a strict link reduction, contradicted by the checked minimal-CS accounting.

Consequently R is itself a matching and |R|+1=r. Since |S|=2r and |support(R)|=2r−2, exactly two S vertices are unmatched by R. Every such vertex is an original F leaf: its only possible incident edge is its M edge, because every other actual edge belongs to R. For each f in M, at least one of these leaves lies outside f. Otherwise both leaves form f, and isolating f leaves an acyclic graph on 2r−2 active vertices containing 2r−2 actual edges, impossible. Robustness of the full link supplies r≥2.

The resulting leaf t is adjacent to w by the checked minimum-link-degree consequence. Thus R together with wt is a matching of size r avoiding any prescribed original M edge f.

- If an M edge ab forms an apex triangle, use the original matching reduction and augment by the size-r matching R+wt plus wab, with t outside {a,b}.
- If an apex triangle exists but none has its base in M, its base belongs to R. Use the reduction matching R+wt. A constrained endpoint choice on M covers each remaining M edge and all surviving apex spokes, with exactly r vertices. Then M plus the apex triangle is the larger augmented packing.
- If the full link has no triangle, choose an M edge ab. Checked codegree supplies an external page on ab with its other apex outside the full neighborhood. Use R+wt avoiding ab and append this page.

The internal and external page augmentation interfaces prove the complete union footprint is a star of at most two edges in each residual literal clique block. No individual-triangle-only compatibility inference is used.

This route handles disconnected forests and full links directly. It neither asserts an ordered path nor assumes a hidden connectedness premise. It does not change an ordinary mathematical claim.

## Development evidence

The following modules compiled through the authorized serialized monitored runner:

- `PerfectForestStructure`, receipt label `perfect-structure-02`.
- `PerfectForestExclusionBase`, receipt label `perfect-exclusion-base-01`.
- `PerfectForestExclusionTools` and `PerfectForestExclusion`, receipt label `perfect-exclusion-02`.

This records development kernel checking only. Final semantic acceptance, clean source rebuild, and complete declaration/axiom closure audits remain coordinator/reviewer responsibilities.
