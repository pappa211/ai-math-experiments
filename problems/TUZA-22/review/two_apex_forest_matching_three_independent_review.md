> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: matching-three two-apex forest boundary

Source_audit, 2026-11-16 UTC. Verdict: ACCEPT at the exact minimum-CS scope.

Frozen source: notes/challenger_two_apex_forest_matching_three_reduction_v1.md,
SHA256 bfff33a3b97a8e7340ed94500ea8bec7903898a0b6214122918091556fc6a630.

I checked the r=3 specialization against the previously independently reviewed large-matching proof, then reconstructed the new tuples and all actual link triangles. No computation was used.

Every old nonperfect branch remains strict at r=3 except the odd path with seven F vertices, both apices adjacent to both U endpoints, and no internal-U apex neighbor. Indeed the old tuples have size4 with at most one crossing, or size5 with two crossings; the collapse bounds are at most3 or4 respectively. The old perfect-forest argument leaves precisely the single P6, with ab absent. Non-endpoint extensions in that even path need not be strict at r=3 and are correctly left unresolved.

For the P7 remainder, only the two end path edges can support actual link triangles. If one apex has no end-parent neighbor, deleting the other apex makes the link triangle-free and the supplied size4 tuple contradicts the one-vertex collapse. If b sees only the right end parent v3, I checked P={a u3,b v3,u0 v1,v2 u2} is a matching and Q={a,b,u1,v3} covers every unremoved edge. The set S={a,u3} meets all actual triangles, and its only P incidence is the internal edge a u3, so Z is empty. The resulting 4<=2 contradiction is valid. This forces both apices to see both end parents.

In the final tuple, P={a v1,b u0,u1 v2,v3 u3} and Q={a,b,v1,u2} are valid for either choice of the optional middle-parent adjacencies. P destroys each of the four actual link triangles, so R=L-P is triangle-free. The rim triangle a u0 v1 is edge-disjoint from M={a u3,b v1,u1 v2,u2 v3}. These four matching edges produce four mutually edge-disjoint hub pages, all disjoint from the rim triangle.

Balanced deletion gives the literal B residual with packing loss four. Its blocks meet L in at most two vertices because their L intersection is a clique in R. Therefore the COMPLETE surviving old-edge footprint of the five new triangles is at most one edge per old block. The standard actual K4/K5 packing avoidance is simultaneous across those edge-disjoint blocks. This appends five triangles to an old maximum packing and gives the required contradiction; no outside page was omitted.

Thus matching-three F must be P6 and ab absent. The source correctly leaves that eight-vertex link interface and all matching-at-most-two cases open. This is ordinary relative to the accepted class-local minimum-CS, balanced-deletion and simultaneous-cover lemmas; there is no finite-certificate, GE, or Kotzig input.
