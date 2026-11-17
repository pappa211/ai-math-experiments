> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: double-cone C5 cover control

Verdict: PASS, PROVED_ORDINARY for the exact optimum and failed resilience claims, plus VERIFIED_FINITE for the complete prescribed minimum-cover replay. Reviewed notes/double_cone_C5_cover_control_v1.md, SHA-256 7a0e0ce26c974a4e0beb85323a04af75a1affe4abc049044c68b3378538c5db8. This control refutes only relaxed cover-only availability.

## Ordinary values and scope

The literal graph joins adjacent hubs2,3 to every vertex of the rim cycle0-1-6-4-5-0. It has16 edges and15 triangles. Edge01 has exactly the two common neighbors2,3. The displayed six-edge covers containing012 or013 are actual covers.

For tau(Q), selecting hub edge23 leaves a spoke-cover problem in each copy of the rim. If R is the selected rim-edge set, the required cost excluding23 is at least |R|+2 vc(C5-R). Its lower bounds as |R| runs0 through5 are6,5,6,5,6,5, so total cost is at least6. Without23, the five hub-pair triangles force at least five spokes. If exactly one spoke is chosen at every rim vertex, this gives a two-coloring of an odd cycle and hence a monochromatic rim edge; the triangle at the other hub requires that rim edge as a sixth cover edge. The hub edge together with all five rim edges is a cover of size6. Thus tau(Q)=6.

The four listed triangles023,246,136,345 are pairwise edge-disjoint and avoid01. Every Q vertex has even degree. A five-packing would leave exactly one unused edge out of16, which would force odd degrees at its endpoints in the union of packed triangles. This is impossible. Therefore nu(Q)=nu(Q-01)=4.

Deleting01 from a displayed page-containing six-cover gives a five-cover of K=Q-01; extension by01 gives the matching lower bound. Hence tau(K)=5. Q has defect two and K has defect THREE.

For Q-{01,24}, a four-packing would leave two unused edges among14. Its four odd-degree vertices are exactly0,1,2,4, so those two edges must form a pairing of that set. The three pairings fail because01/24 were deleted or14/04 are absent. The displayed three-packing235,126,346 is valid. Thus edge24 is packing-critical in K, and Q also fails two-edge resilience. This control is not a connected resilient defect-two predecessor and is not a minimum-unknown-Q or Tuza counterexample.

## Independent finite replay

The separately authored scripts/opening_cover_operation_controls.py reconstructs this graph from its literal cycle and two hubs. It imports no author discovery script or optimizer. It directly checks all3003 five-subsets of K's15 actual edges against every actual K triangle. Exactly seven are covers. Because the ordinary proof establishes tau(K)=5, these are exactly all minimum K covers.

Exactly one contains P_2={02,12}; exactly one contains P_3={03,13}. They are the source's displayed marked covers minus01. Their outside parts are disjoint three-edge sets, so the minimum outside exchange distance is exactly three.

The same run checks all8008 six-subsets of Q's16 edges. Exactly31 are covers, and it stores an actual minimum cover containing each of all15 triangles. It also directly checks support, shared-edge triangle connectivity, minimum degree four, the four-packing, the critical-deletion three-packing and the parity pairing obstruction. The two unique marked covers have one balanced disagreement component with five edges on each side, containing all four spokes; this agrees with the separately reviewed component obstruction.

This is a single prescribed graph replay, not a census or continuation of discovery. The author discovery history (all576 order-six presentations and a stopped prefix at5632/27648 order seven) was not rerun and is not a premise of acceptance.

The run also validates the literal stored witnesses for the two named book controls, as separately detailed in the book review. Total elapsed time was0.02162625000346452 seconds, one local process, zero solver threads. The process exited. Source hashes were stable.

Checker SHA-256: 187e75d6682deffe7a824215991a50272c06341d4deecc164d81323b6fe151ff.
Receipt evidence/opening_cover_operation_controls.json SHA-256: c792531993568b3a790baf6c764db6f484726be8acb8bf65c867bca099217c9b.

The operation requiring outside distance at most one remains valid. What this control refutes is availability based only on codegree two and page-containing minimum covers, even if every triangle individually lies in a minimum cover. The actual programme must retain K's single-edge resilience and exact defect two, together with Q's stronger global hypotheses. No conclusion about that full availability problem follows from this control.

Frozen UTC: 2026-11-16T22:59:46.470482+00:00
