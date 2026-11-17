> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A sharp failure of cover-only missing-edge availability

Frozen control for independent review. This refutes only a relaxed cover-only proposal; it is not a Tuza counterexample and is not in the required minimum-Q class.

## Literal graph and failed assertion

Take a C5 on rim0-1-6-4-5-0 and join both vertices2,3 to every rim vertex and to each other. Let e=01. Its common neighbors are exactly2,3. Both e-triangles lie in minimum covers:

    012: {01,02,12,24,35,36},
    013: {01,03,13,25,26,34}.

Both displayed six-edge sets meet EVERY actual triangle. Thus codegree two does not prohibit both page triangles from belonging to minimum covers. The graph has16 actual edges and15 triangles, all recorded in evidence/double_cone_C5_control.json.

## Ordinary exact optima

A cover of size6 is the hub edge23 together with all five rim edges. For the lower bound, consider any cover.

If23 is selected, let R be its chosen rim edges. For each hub separately, its selected spokes must form a vertex cover of C5-R. Hence the remaining cost is at least |R|+2 vc(C5-R), which is at least5. Explicitly for |R|=0,1,2,3,4,5 the lower bounds are6,5,6,5,6,5 respectively. Thus total cost is at least6.

If23 is not selected, each hub-pair triangle23v forces at least one of2v,3v into the cover. This costs at least5. If at least6 spokes are selected there is nothing to prove. Otherwise exactly one spoke is selected at each rim vertex, giving a two-coloring of C5. An odd cycle has a monochromatic edge. The triangle on that edge and the OTHER hub then requires the rim edge as a sixth cover edge. Therefore tau(Q)=6.

The four triangles023,246,136,345 form an explicit edge-disjoint packing. Every vertex of Q has even degree. A five-packing would use15 of its16 edges, leaving exactly one edge. The degrees of a union of triangles are all even, whereas subtracting one edge from this even-degree graph makes two degrees odd. Thus a five-packing is impossible, and nu(Q)=4. Defect is TWO, not one.

The same four-packing avoids01. Hence K=Q-01 has nu4. The first displayed six-cover minus01 covers K with5 edges, while adding01 to any K cover covers Q, forcing tau(K)>=5. Thus K has (nu,tau)=(4,5), defect THREE.

## Essential failed hypotheses

Deleting {01,24} leaves no four-packing. Such a packing would use12 of the14 surviving edges, leaving two edges. Original degrees were all even, so those two edges would have to pair the four odd vertices0,1,2,4. The three possible pairings fail:01 and24 were deleted;02+14 uses absent14;04+12 uses absent04. Thus packing is at most3. A matching lower witness is recorded below. Consequently Q is NOT two-edge resilient and K is NOT single-edge resilient.

The graph is triangle-supported and triangle-connected, has minimum degree4, and the finite exact receipt reports that every one of its15 triangles is contained in some minimum cover. These additional facts do not repair the failed defect/resilience hypotheses. No inference about the actual minimum unknown Q follows.

## Bounded discovery and exact cover-exchange scope

The frozen targeted generator fixed e=01 and its two common neighbors2,3, allowing all other actual edges with no additional common neighbor. Six vertices give576 labelled graphs; all were checked without a witness. On seven vertices, the run stopped at this witness after5632 of27648 presentations (0.374 seconds). This is NOT a complete seven-vertex census and was not a search for unknown defect-one cores. No further order was launched.

K has exactly seven minimum five-edge covers. Exactly one contains both02,12, and exactly one contains both03,13; they are the two displayed covers with01 removed. Their outside parts are disjoint three-edge sets, so minimum outside exchange distance is3. This last finite uniqueness claim is pending independent exhaustive subset replay over the3003 five-subsets of15 actual K edges. The counterexample to the cover-only assertion itself already follows from the ordinary exact optimum and the two displayed covers.

Sources are the literal graph and local scripts only; no new external theorem beyond elementary odd-cycle parity is used. Required numerical independence: fresh direct cover-subset enumeration and literal witness checks, not a second invocation of the discovery oracle.

Three-packing after deleting01,24: [[2, 3, 5], [1, 2, 6], [3, 4, 6]].
