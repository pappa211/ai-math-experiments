> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh coordinator review: six-edge cover kernel and packing-three exclusion

Verdict: ACCEPT both elementary lemmas as ordinary proofs; accept the minimum-CS corollary as PROOF_USING_DECLARED_INPUT with its stated M0/R1/M3/T0 dependencies. No finite census or unproved bounded-attachment inference enters.

For an outside vertex v, any outside neighbor would give an edge in no triangle, because no edge of a triangle containing two outside vertices can belong to C. All its neighbors therefore lie in V(C). Its induced link equals C restricted to that neighbor set, with minimum degree2 and order>=5. At most6coveredges force order5or6. On sixvertices every degree is2 and all6edges are used, so the fixed covertriangle forces two disjoint triangles. On fivevertices, fiveedges would forceC5; the fixed covertriangle would then require>=2 additional coveredges outside, unavailable. All6coveredges are thereforeinside, and the two vertices outside the terminaltriangle must be joined to eachother and eachtoone terminal. This gives exactlybowtie ortriangle-plus-three-edge-path. Thus every outsidevertex is universaltoallV(C), no extracoreedge canexist, and outsideverticesareindependent.

All three stated fourpackings are valid. In shape3, v uses disjoint coreedges ad,be and w uses disjoint de,ab; the other shapes are equally literal. Twooutsidevertices contradictnu<=3; oneoutsidevertex makes a coredegree2vertex havefull degree3, contradictingdelta>=5. Hence everyvertex isincidenttoC and n<=9.

The density argument is exact: a9vertex subgraph of average>=7 has>=32edges, atmost4missing; a random6set sees atmost5/3missingedges onaverage, so somehas<=1. The four listed octahedraltriangles useeachcross-partedgeexactlyonce and avoidany prescribedmissingedge placedwithinapart. Eightvertex density>=7 forcesK8. Thusmad<7 is provedbeforethehistoricalT0 isinvoked. This is notanunrestricteduseofT0.

The resulting minimumCS packinglowerbound4 is a scoped exclusion, not an all-size blocker or a new result for originalH-D. Its status retains the declared ordinary/computer-assisted TUZA15 input.

Reviewed SHA256: a8acd2b605c6ed3345dd46a007ca6f4a286daa4023eaa6cf03e9cffd8e9ebe29
UTC: 2026-11-15T22:09:37.061077+00:00
