> Curated source from TUZA-03/alternative/SINGLE_CROSS_APEX_SINGLE_MIXED_BOWTIE.md. Original SHA-256: `59cb843ea9d7d347d32e112d3e6c24c6d45337bc799483167aaa6e7da1c57d8c`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# A bowtie with one mixed triangle and at most one cross-apex edge


## Hypotheses

Work in the remaining slack-one, packing-edge-stable counterexample regime:
nu(H)=h, tau(H)=2h-1, nu(G)=h+2, tau(G)=2h+5.
The restored triangles are vab and vcd. Their individual new families have exactly two universal apices, P1={p,q} and P2={r,s}, with the four apices distinct and outside W0={v,a,b,c,d}; all twelve corresponding spokes are old edges. Each apex pair is nonadjacent. There is exactly one old edge between {a,b} and {c,d}, which after relabeling is ac. Finally there is at most one edge between P1 and P2. If present, independently exchange apex names so that this edge is pr.

The maximal-cost reductions supply these exact-family assumptions; this note proves that the specified case cannot be a counterexample.

## Extract an equality remainder

The five G-triangles
    vac, abp, vbq, cdr, vds
are edge-disjoint. Their old-edge footprint is
    A={ac,ap,bp,bq,vq,cr,dr,ds,vs}.
The eleven-edge set
    B=A union {ab,cd}
covers every new G-triangle: the sole mixed triangle uses ac; each individual base triangle uses ab or cd; and each page contains at least one listed old spoke. Therefore
    tau(H-A)>=tau(G)-11=2h-6.
The five-packing is compatible with any H-A packing, giving nu(H-A)<=h-3. By Aharoni, equality holds throughout. Put J=H-A and k=h-3. Its entire triangle family consists of k isolated edge-disjoint K4 face families.

Let W={v,a,b,c,d,p,q,r,s}. The full induced H[W] is specified by the twelve spokes, ac, and the possible edge pr. Indeed, any further terminal-apex edge would create an additional apex for one individual new family; the terminal cross-edge and apex cross-edge hypotheses exclude all others. Thus H[W] has only the possible triangle vpr. The induced J[W] consists of vp,vr, the possible edge pr, and the two isolated edges aq and cs. If pr is absent, its first component is the open wedge p-v-r.

The edges A form the nine-cycle
    a-p-b-q-v-s-d-r-c-a.

## Choose equality faces compatible with every lost old triangle

Let F be all H-triangles absent from J. No such triangle lies entirely in W, since the only possible triangle vpr survives. Every F-triangle therefore has exactly one A-edge and one vertex outside W.

If pr is present, the J-triangle vpr belongs to a unique equality K4 on {v,p,r,x}. Its fourth vertex x lies outside W: no other W vertex is adjacent in J to all of v,p,r. Moreover x has no H-neighbor in {a,b,c,d}. For example, if xa existed then x, already adjacent to v, would be an additional apex for the restored edge va; x cannot be p or q. The other three cases are identical. Choose the face prx. It is disjoint from every F-triangle: the edge pr is not in A and both its endpoints are in W; an F-triangle using px would need an A-edge at p, namely pa or pb, but x touches neither a nor b; the argument for rx is identical.

If pr is absent, an equality K4 may instead contain vp or vr. For a block {v,p,x,y}, both x,y lie outside W: no third W vertex is adjacent to both v,p in J. Neither x nor y touches a,b,c,d in H, since either would then be an additional apex for one restored family, and neither can equal any of p,q,r,s. Choose the face pxy. Its edge xy cannot lie in F (each F-triangle has only one vertex outside W). Its edges px,py could lie in F only through A-edges pa or pb, but x,y touch neither a nor b. Thus the face is compatible with all F. A block containing vr is handled identically by a face avoiding v. No equality block contains both vp and vr because pr is absent.

All remaining equality K4s with two W vertices contain aq or cs. Their pair of W vertices must form a J-edge; the preceding cases account for every other such edge. None contains three W vertices.

Consider a K4 on {a,q,x,y}. Both x,y lie outside W. Neither can be adjacent in H to v or b: adjacency to v together with a, or to b together with a, would give an additional first-family apex, different from p,q. (In particular neither x nor y can equal p, since pq is absent.) Choose its face qxy. An F-triangle cannot use xy because it has only one vertex outside W. It cannot use qx or qy: its A-edge would have to be qb or qv, and neither x nor y touches b or v. Hence this face avoids all F. For a block containing cs, choose its face avoiding c; the same argument uses the impossibility of its other vertices touching v or d.

For every remaining equality K4, its intersection with W has size at most one. Choose a face avoiding W. Every F-triangle has two W vertices, so all its edges meet W, and this chosen face avoids F.

These choices give a fixed k-packing in J compatible simultaneously with every F-triangle.

## The nine-cycle page contradiction

Any H-packing has at most k J-triangles and at most nu(F) lost triangles, while the fixed old k-packing is compatible with a maximum F-packing. Hence
    nu(F)=h-k=3.

Form a graph L from the cycle edges A and all spokes between W and V(H) minus W that occur in F; omit every other edge. Its full triangle family is exactly F. Indeed, its base on W is C9, its outside vertex set is independent, and every triangle of L is an H-triangle containing an A-edge. Conversely every F-triangle was retained.

By alternative/CYCLE_PAGE_SMALL_PACKING_INTEGRALITY.md, tau(F)=nu(F)=3. Combining a minimum J-cover with a three-edge F-cover gives
    tau(H)<=2k+3=2h-3,
contradicting tau(H)=2h-1.

Thus the stated configuration satisfies the two-triangle restoration bound. This result requires exactly one mixed terminal edge and at most one cross-apex edge. It does not cover two or more cross-apex edges without further argument.

## Audit correction

The parent independently identified that the first at-most-one-edge draft omitted the surviving open wedge vp,vr when pr is absent. The corrected proof explicitly treats equality blocks containing either wedge edge. The prior draft is preserved as SINGLE_CROSS_APEX_SINGLE_MIXED_BOWTIE.before-open-wedge-repair.md. This correction does not affect the exactly-one-cross-edge case.
