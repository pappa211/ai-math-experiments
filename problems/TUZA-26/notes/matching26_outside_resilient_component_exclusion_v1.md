> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Outside graphs have no resilient triangle component

Frozen ordinary paid exclusion v1, TUZA-26, 2026-11-17. Independent review required. Together with the companion fragile-defect-one exclusion, this constrains EVERY component without assuming total outside defect two. It does not prove availability of the outside-packing interface.

## Exact minimum-Q interface

Let uv have exactly common neighbors x,y in the accepted conditional minimum Q, and assume

    W=Q-{u,v}, nu(W)=nu(Q)-1.

Write nu(Q)=k. Use Q triangle support/connectivity, two-edge packing resilience, cover-eligibility saturation tau(Q-e)=2k-2 for every Q edge e, proper CS inside fixed G, and the independent degree-four exclusions (in particular minimum degree five). As proved in the canonical outside note, every actual endpoint-link rim except xy is packing-critical in W.

Packing and cover numbers add over W's shared-edge-connected triangle components, even with arbitrary shared vertices. A supported edge is critical in its component exactly when it is critical in W. We prove that no such component C can be single-edge packing-resilient.

## Complete boundary and exact packing payment

If C is resilient, none of its edges is critical in W. Thus its COMPLETE outside-Q-triangle boundary is contained in {xy}: any triangle containing one of its edges and u or v would make that edge an endpoint rim, and every W triangle sharing a C edge already belongs to C. A triangle containing both u,v has no C edge.

The boundary cannot be empty. Otherwise C's triangle family would remain an isolated Q triangle component, whereas uvx is an actual Q triangle outside it. Consequently xy is an actual supported C edge, and both uxy and vxy are outside triangles on it.

Delete E(C)-{xy}, retaining ALL vertices and other edges, and call the resulting graph R. Every outside-C Q triangle survives in R, and no C triangle survives with only xy retained. Let

    r=nu(C), s=nu(R).

A maximum C packing avoids xy by resilience. It is edge-disjoint from every R packing. Conversely any Q packing partitions into C triangles and outside triangles. Hence

    k=r+s.

The same partition upper bound after deleting any R edges remains valid. In particular Q two-edge resilience gives

    nu(R-xy)=s,
    nu(R-xy-g)=s for every edge g of R-xy.

For the second equality, use nu(Q-{xy,g})=k and the upper bound r+nu(R-{xy,g}); monotonicity supplies the reverse bound. Thus R-xy is single-edge resilient. No resilience is silently transferred to an arbitrary graph of defect two.

Deleting xy separates the triangle families edgewise:

    tau(Q-xy)=tau(C-xy)+tau(R-xy).

This is an exact triangle-family decomposition, not a claim that the vertex sets are disjoint. Every crossing triangle was retained through xy and disappears from both sides when xy is deleted.

## Components of defect zero or at least two

Proper CS makes the component defect delta(C)=2r-tau(C) nonnegative.

If delta(C)=0, C is one literal K4 or K5. Its complete boundary has only xy, so the accepted tight-piece boundary reduction excludes it.

If delta(C)>=2, use proper CS on the actual proper subgraph R and combine an arbitrary C cover with an R cover:

    tau(Q)<=tau(C)+tau(R)<=2r-2+2s=2k-2,

contrary to tau(Q)=2k-1. Thus the only remaining resilient possibility has defect one.

## Defect one: legitimate naming and the eligible split

A resilient defect-one C is strictly smaller than Q and remains inside fixed G, so its support belongs to frozen C12 by the EXPLICIT minimum-Q choice. This naming is not inferred from proper CS alone.

Suppose first that xy is cover-eligible in C. Then

    tau(C-xy)=2r-2.

Q saturation and exact cover additivity give

    tau(R-xy)=(2k-2)-(2r-2)=2s.

Together with nu(R-xy)=s, proper CS makes R-xy a B graph. But restoring xy creates actual pages uxy and vxy while preserving packing nu(R)=s. This is impossible over B: every page sees at most one old edge in each tight clique, so a full old maximum packing avoids all its footprints and the page appends. Background and arbitrary shared vertices do not alter that edge-disjoint construction. Hence xy cannot be eligible in C.

## Defect one: the ineligible split completes a K5

If xy is ineligible in C, tau(C-xy)=2r-1. The same exact identity yields

    nu(R-xy)=s, tau(R-xy)=2s-1,

and R-xy is resilient by the earlier two-edge argument. Proper CS and component additivity give one active resilient defect-one component C' and otherwise tight B components. Its support is strictly smaller than Q, so C' is also legitimately named C12.

Restoring xy is a triangle-bearing PACKING-NEUTRAL insertion. The already accepted arbitrary-background neutral-insertion lemma in eligibility_saturation_v1.md applies exactly: C'=K5-e, xy is its missing internal edge, all new pages stay in that component, and the sole changed triangle family is its completion to K5.

No other old B triangle component can remain. Such a family is unchanged by xy restoration, shares no edge with that K5, and has no edge connection to C except possibly xy; but xy was absent before restoration and every new xy-page belongs to the K5. It would remain a separate Q triangle component, contradicting Q triangle connectivity. Thus R's triangle support is exactly this K5.

There is also no overlooked supported Q edge outside C which becomes background in R. Any Q triangle containing such an edge is not wholly inside C. Its only possible C edge is xy, which was retained, so the triangle survives in R. Every Q edge outside E(C) is therefore still supported in R. The endpoint vertices u,v are outside W and hence outside C; all their Q incident edges remain in R. The actual pages uxy,vxy place both endpoints in the K5 support. Consequently

    deg_Q(u)=deg_R(u)=4, deg_Q(v)=deg_R(v)=4,

contrary to the independently proved minimum degree five. Equivalently each is an actual degree-four simplicial vertex, already excluded independently. This final step does not infer freshness from the one-edge boundary; it proves the relevant full endpoint degrees after exact triangle-family reconstruction.

Every possible defect of a resilient component has now been excluded.

## Composition: every outside component is fragile with defect at least two

Combine this theorem with matching26_outside_fragile_component_exclusion_v1.md, which excludes fragile defect-one components at the same interface without a total-defect assumption. Proper CS excludes negative defects, and defect-zero components are tight cliques and resilient. Therefore EVERY nonempty triangle component of W is fragile and has defect at least two.

In particular, if the TOTAL defect of W is exactly two, it has exactly one triangle component, and that support is fragile of defect two. This conclusion does not need an earlier assumption that W is connected.

The possible background is also explicit. Any W-background edge g distinct from xy has a Q triangle by support; because it has no W triangle, that triangle uses u or v and makes g an endpoint rim. It would be critical in W, impossible for a background edge. Thus the only possible W-background edge is xy. A W vertex outside all triangle supports would then have at most the other endpoint of xy and u,v as Q neighbors, contrary to minimum degree five. All actual W vertices therefore belong to the retained triangle support(s), though they may be shared between components; xy may still be a triangle-free edge between such vertices.

Hence in the exact-total-defect-two branch, W is ONE fragile defect-two support plus possibly the retained background edge xy. Whether that background edge occurs and how to pay the remaining fragile support are separate obligations.

## Scope and dependencies

This is an all-total-defect component exclusion under a supplied codegree-two edge and the packing equality nu(Q-{u,v})=nu(Q)-1. It neither forces a codegree-two edge nor forces such an outside packing in the general core. Components of defect at least two are not named. The global availability arrow and unrestricted Tuza remain OPEN.

Sources: notes/matching26_canonical_outside_packing_v1.md; notes/matching26_outside_fragile_component_exclusion_v1.md; notes/eligibility_saturation_v1.md and reviews/opening_saturation_review.md (including the exact neutral insertion lemma); notes/two_edge_tight_boundary_v2.md; accepted minimum-Q two-edge resilience, triangle connectivity and degree-four exclusions; inputs/C12_frozen.json only through the already proved neutral-insertion theorem. Root developed the eligible/ineligible peel; matching_geometry independently checked the edge partition, two-edge resilience transfer, complete support reconstruction and componentwise composition. No numerical computation or graph enumeration was used.
