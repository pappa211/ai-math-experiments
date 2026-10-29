> Curated source from TUZA-03/alternative/DOUBLE_MIXED_NO_CROSS_APEX_BOWTIE.md. Original SHA-256: `f5b14a208f88e6087dfa8841c3f68a69fec51295d231df56bbe5ea50dbd7a6e1`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Two mixed triangles and no cross-apex edges in the exact-two-apex bowtie


Assume the critical counterexample equations nu(H)=h, tau(H)=2h-1, nu(G)=h+2, tau(G)=2h+5. The restored triangles are vab and vcd. Their exact two-apex sets are {p,q} and {r,s}, disjoint and outside the five terminals. Each same-family apex pair is nonadjacent, and assume there are no edges between the two apex sets. There are two mixed triangles, so after relabeling the old terminal cross-edges are ac and bd.

Consider the five-packing
    vac, abp, vbq, cdr, vds.
Its old-edge footprint is
    A={ac,ap,bp,bq,vq,cr,dr,ds,vs}.
All individual-family pages meet A. The set
    B=A union {vb,cd}
has eleven edges and covers all new triangles: vb and cd hit the restored bases, ac hits vac, and vb hits vbd. Thus
    tau(H-A)>=2h-6.
The five-packing gives nu(H-A)<=h-3. Aharoni forces equality. Write J=H-A and k=h-3; all J-triangles form isolated edge-disjoint K4 face families.

Let W={v,a,b,c,d,p,q,r,s}. The induced H[W] consists precisely of the twelve spokes and ac,bd. In particular it is triangle-free. This uses the exact-apex condition to exclude any further terminal-apex edge, and the stated absence of all apex edges. The induced J[W] consists of
    vp,vr,aq,cs,bd.
The deleted edges A form C9 in the order a-p-b-q-v-s-d-r-c-a.

Let F be all H-triangles absent from J. Every member contains exactly one A-edge and one vertex outside W: there are no H-triangles within W.

All equality K4s except possibly the one containing bd have a face compatible simultaneously with every F-triangle. Here are the full cases.

* A block with at most one W vertex has a face avoiding W, hence every F edge.
* A block containing vp has form {v,p,x,y}, with x,y outside W. Neither x nor y touches a,b,c,d in H, because either adjacency, together with its edge to v, would create an additional apex for one restored family. None can equal any of p,q,r,s. Choose face pxy. Its edge xy cannot meet an F-triangle, and an F-triangle using px or py would require its A-edge to be pa or pb, impossible because x,y avoid a,b. A block containing vr is handled identically.
* A block containing aq has form {a,q,x,y}, with x,y outside W. Neither x nor y touches v or b, since together with its edge to a this would create an additional first-family apex. Choose face qxy: xy is outside W, and an F-triangle using qx or qy would require A-edge qv or qb, impossible. The cs case is identical, with c avoided and v,d forbidden.

These exhaust the nonexceptional cases because two W vertices in one K4 must be adjacent in J, and J[W] has only the five listed edges. No block contains three W vertices. There is at most one exceptional K4 containing bd, since equality K4s have disjoint edge supports.

Choose one compatible face in each nonexceptional block and omit the exceptional block if present. This gives a packing of size at least k-1, compatible with every F-triangle. Therefore
    nu(F)<=h-(k-1)=4.
(If no exceptional block exists, the stronger bound nu(F)<=3 follows.)

Form L from A and all W-to-outside spokes appearing in F. Its full triangle family is exactly F, its base is C9, and its outside part is independent. Apply NINE_CYCLE_PAGE_INTEGRALITY.md. Its exceptional single-wheel possibility cannot occur: such an outside apex would be adjacent to all nine vertices of W, in particular v,a,b, creating an additional apex for the first restored triangle. Hence
    tau(F)=nu(F)<=4.

Combining a minimum J-cover with an F-cover now yields
    tau(H)<=2k+4=2h-2,
contradicting tau(H)=2h-1.

Thus this case obeys the two-triangle restoration bound. Combined with CROSS_APEX_DOUBLE_MIXED_BOWTIE.md (at least one cross-apex edge) and COMMON_APEX_BOWTIE_RESTORATION.md (overlapping apex sets), this settles every exact-two-apex bowtie configuration with two mixed triangles. This conclusion is conditional on independent acceptance of those cited candidates and the present proof.
