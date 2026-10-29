> Curated source from TUZA-03/alternative/SINGLE_MIXED_TWO_CROSS_APEX_BOWTIE.md. Original SHA-256: `192433dd17c26561c7e45d0a9760eec402bde1a7f09ca3c5ce6b11dd01fad38d`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# One mixed triangle and exactly two cross-apex edges


Assume a critical counterexample with nu(H)=h, tau(H)=2h-1, nu(G)=h+2, tau(G)=2h+5. The restored triangles are vab and vcd; their exact two-apex sets are P1={p,q}, P2={r,s}, disjoint and outside all five terminals. Same-family apex pairs are nonadjacent. The only terminal cross-edge is ac. Assume exactly two edges join P1 to P2.

If the two cross-apex edges are adjacent, interchange the two restored families if necessary so their common endpoint lies in P1, then label them pr and ps. If they are disjoint, label them pr and qs. Denote the second edge by e; thus e=ps or e=qs.

Use the same five-packing
    vac, abp, vbq, cdr, vds
and old-edge footprint
    A={ac,ap,bp,bq,vq,cr,dr,ds,vs}.
The set A union {ab,cd} covers every new triangle and has eleven edges. Therefore J=H-A is an equality graph with nu(J)=k=h-3, tau(J)=2k, by the maximal-cover/equality-extraction argument. Its full triangle family is isolated edge-disjoint K4 face families.

On W={v,a,b,c,d,p,q,r,s}, J has edges vp,vr,pr,e,aq,cs. Its only triangle is vpr. The full H[W] has exactly two triangles: vpr and Z, where Z=vps if e=ps and Z=vqs if e=qs. Every other H-triangle absent from J has one A-edge and a vertex outside W. Call their family Fout. Thus all lost triangles are Fout union {Z}.

The graph formed by A and the W-to-outside spokes of Fout has full triangle family Fout and is a C9-page graph, with base order a-p-b-q-v-s-d-r-c-a.

All J-K4 blocks except possibly one containing e have faces compatible simultaneously with every Fout-triangle:

* The unique block {v,p,r,x} containing vpr uses face prx. Its outside vertex x cannot touch any of a,b,c,d, by the exact-apex hypotheses. Thus no Fout-triangle can use px or rx; none uses pr because both endpoints lie in W and pr is not in A.
* A block containing aq uses a face avoiding a, because its outside vertices cannot touch v or b. A block containing cs uses a face avoiding c, because its outside vertices cannot touch v or d. These are exactly the verified cases in SINGLE_CROSS_APEX_SINGLE_MIXED_BOWTIE.md; the additional edge e creates no third boundary vertex in either block.
* Every block with at most one W vertex has a face avoiding W.

To verify exhaustion, any two W vertices in one J-K4 are adjacent in J. The listed boundary edges are vp,vr,pr,e,aq,cs. The first three belong to the unique vpr block, and the last two have been treated. An e-block cannot coincide with the vpr block: if e=ps it would force rs, and if e=qs a four-vertex block containing v,p,r cannot contain both q and s. Such a block also cannot contain a third W vertex, as no boundary triangle contains e. There is at most one e-block.

If e belongs to a J-K4, omit that block and use the compatible faces in all k-1 others. This gives nu(Fout)<=h-(k-1)=4. NINE_CYCLE_PAGE_INTEGRALITY.md gives tau(Fout)=nu(Fout)<=4: its pure-wheel exception is forbidden because an outside universal apex would be an additional apex for the first restored family. Choose a minimum J-cover containing e; in the e-block choose e and its opposite edge, and choose any minimum covers in the remaining blocks. This J-cover also covers Z. Adding an Fout-cover gives tau(H)<=2k+4=2h-2, contradiction.

If e belongs to no J-K4 support, all k equality blocks have compatible faces, so nu(Fout)<=3 and tau(Fout)<=3. A minimum J-cover, an Fout-cover, and e cover H in at most 2k+4 edges, again a contradiction.

Therefore this cross-edge pattern cannot be a critical counterexample. Combined with the at-most-one-cross-edge result, the only still-open one-mixed-triangle exact-two-apex bowties have three or four cross-apex edges (unless further reductions eliminate them).
