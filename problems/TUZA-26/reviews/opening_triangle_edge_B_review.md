> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: triangle plus one edge over B

Verdict: PASS, PROVED_ORDINARY at the exact modular scope. This is an independent reconstruction of the all-size argument, not Lean verification or a new finite replay.

Reviewed source: notes/apex_triangle_edge_B_exclusion_v1.md, SHA-256 ebad542d5e946ac6fef858a1da26883074b53678321ca1d73a6d3eda9e66c674.

The theorem requires triangle-supported Q with nu=m+2, tau=2m+3, two-edge packing resilience, and B(Q-(T union {e})) of packing m, where e is outside the actual triangle T. Its three additional premises are indispensable to the scope: no literal K4/K5 with complete outside-triangle boundary of size at most two, minimum support degree at least four, and no genuine K5 triangle leaf. These premises are established for the fixed-G minimum unknown Q by the already accepted composition, but are not asserted for arbitrary defect-one graphs.

## Independent reconstruction

Write L=Q-(T union {e}), K=L+T, and N for all actual K triangles absent from L. The T terminals are independent in L. A new packing is either T itself or pages with distinct bases and distinct apices. In each old B clique its footprint is a star of at most two edges. A maximum K4/K5 packing avoids that star, independently in every old triangle component, so nu(K)=m+nu(N). Background edges cause no obstruction to this extension.

If N has a two-edge cover {f,g}, then K-f has at most one new triangle in any packing, since every surviving new triangle contains g. Thus Q-{e,f} has packing at most m+1, contradicting two-edge resilience. The same argument handles a one-edge cover. The edge f lies in K and differs from e.

The actual page incidence has only singleton or full (three-base) apices. With packing at most two and no two-edge cover, it consists of exactly two full apices x,y and no other pages. Three full apices, two full plus another page, or one full plus singleton pages on two bases produce a three-packing. All remaining cases admit a two-edge cover, including the central triangle T. Hence N is exactly the seven-triangle K5-xy family. If xy were old, old triangles axy,bxy would force a,b into the same literal B clique and restore missing ab, a contradiction.

Each old component therefore contains at most one of the six core spokes. The entire ordinary e-page family also contributes at most one distinct edge to any old component: two same-endpoint spokes force an old triangle on their other endpoints, merging the absent endpoint into that clique. Opposite-endpoint spokes immediately force missing e.

If e has no T endpoint, there is no mixed triangle using both e and a T edge. Every old component then has complete boundary at most two, including when e=xy, and the first paid premise removes all of them.

If e=au, its other endpoint is outside the forced five-vertex core. There is at most one mixed triangle, say abu; otherwise bcu would be an extra T page. Every old component except possibly the one containing ub again has boundary at most two. The exceptional component must contain one core spoke bx and one ordinary e-page spoke uz. The old-triangle argument axz forces z=x. Its complete boundary is consequently the actual triangle ub,bx,ux.

Every private vertex of this exceptional clique is outside the named core and restored-edge terminals. All other old components have already disappeared. A triangle involving a private vertex outside its clique would have to be one of the fully enumerated new families, and an ordinary e-page would add an unlisted boundary edge. Thus all its incident Q edges are internal, using triangle-supportedness. A K4 gives a degree-three vertex; a K5 gives exactly the forbidden genuine triangle leaf. This establishes freshness rather than assuming it from the boundary size alone.

It follows that m=0. K has precisely the K5-xy triangle family, possibly with arbitrary triangle-free background. Any e-page having at most one core spoke appends to a two-packing of the core avoiding that spoke. For example, to avoid ab use acx,bcy, and to avoid ax use aby,bcx. Such a page would contradict nu(Q)=2. Every e-page must therefore use two core spokes, forcing e=xy and all its apices inside the core. Triangle-supportedness now makes Q's nonisolated support exactly K5, whose cover number is four, contradicting tau(Q)=3. This explicitly closes the arbitrary-background tail.

## Countercontrol and exact consequences

The broad statement without paid geometric premises is REFUTED. For Q=K5[01234] union K5[01567], T=023 and e=14, the ordinary values are Q:(4,7), J=Q-T:(3,5), L=J-e:(2,4), and K=L+T:(4,6). The first residual piece in J is a book with spine14; L has only the second K5 triangle component. K has a K5-14 core whose only old supported spoke is01. The old K5 has complete outside-triangle boundary {01}, violating the first paid premise.

The two-edge resilience of this control can also be reconstructed without optimization: K5 has a two-packing avoiding any two prescribed edges (check adjacent and disjoint deletions); distribute the deletions between the two cliques, and make one local packing avoid their shared edge01. Cover numbers follow by restriction to the two cliques/book and covers meeting at01. This is an existing C12 model, not a minimum-Q or Tuza counterexample.

The author control script and receipt were inspected separately. The receipt contains 191 explicit deletion cases and records the displayed values. No independent execution of that script, exhaustive certificate replay, or optimizer correctness is claimed here; the proof and countercontrol acceptance above are ordinary.

For the accepted minimum-Q framework, every defect-one triangle residual is now single-edge resilient: a critical edge would leave B with precisely the excluded profile. For a defect-two triangle residual, a critical deletion cannot leave defect zero; it must leave defect one. This does not prove resilience of that defect-one residual, resilience of the defect-two residual, complete triangle restoration, or availability of any globally paid reduction.

## Dependency order and status

This review uses the previously accepted composition review (SHA-256 7bc1d773a33c52ebbd88be077bf07d4a0be9d1e97c95ab4cee31d2c579b9b5f6), especially the paid boundary exclusions, degree-three programme and K5 leaf exclusion. The new proof itself uses no later named triangle-restoration result and no defect-two classification. The exact K5-e family is deduced directly, not inferred from minimum-Q naming. Proper-subgraph CS is used only for the stated consequences and defect-zero classification.

No gap found at this scope. Universal CS/Tuza, global R, and useful residual availability remain open.

Frozen UTC: 2026-11-16T22:28:38.490362+00:00
