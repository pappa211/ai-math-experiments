> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Counterexample to an incomplete gain-one equality converse

Status: REFUTED incomplete auxiliary formulation; exact optima proved below. This is NOT a counterexample to Tuza.

The independent critic observed that merely prescribing six new pages over an old K4 is insufficient for equality. Their new spokes must also avoid every other old block support. This condition is included in the corrected theorem A9.

## Exact graph

Let H be the union of two K4s:
B on vertices {a,b,c,d};
C on vertices {a,z,p,q}.
They share only vertex a and have disjoint edge supports. There are no other edges. Thus nu(H)=2 and tau(H)=4.

Form G by adding zb,zc,zd. Its new triangles are EXACTLY the six z-pages on the edges of B, so B becomes the K5 on {a,b,c,d,z}. The other old K4 C shares the edge az with that K5.

However, az was already an edge in C's old support. Consequently the new z-pages on ab,ac,ad each use two old support edges. This is precisely the forbidden circumstance in A9's equality proof.

## Exact optima

nu(G)=3. For the upper bound, all triangles belong to the K5 or C, so any packing has at most 2+1=3 triangles. For the lower bound, take two K5 triangles avoiding az (K5 has a maximum packing avoiding any specified edge), and append one C triangle. Its only possible shared edge with the K5 is az, which was avoided.

tau(G)=5. For the upper bound, choose a four-edge minimum K5 cover containing az and add the opposite C edge pq; az,pq cover C. For the lower bound, any G cover uses at least four K5 edges to cover the K5. The triangle apq has no K5 edge, so at least one additional edge is required.

Thus (nu,tau)=(3,5), giving strict slack one. G is not block-type: the K5 and K4 share az and therefore belong to a single non-clique triangle component.

The corrected A9 configuration explicitly requires every new K5 spoke to lie outside ALL old supports, and excludes this example.
