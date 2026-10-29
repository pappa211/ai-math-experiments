> Curated source from TUZA-03/alternative/CROSS_APEX_DOUBLE_MIXED_BOWTIE.md. Original SHA-256: `814c7f7ac6df5876e89967942f81d0cf70e9a3ae4a914615e56a1d3abdf901d3`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# A cross-apex edge resolves the double-mixed bowtie with disjoint apex pairs


## Statement

Let T1=vab,T2=vcd and H=G−(E(T1)∪E(T2)), with D(H) 3-partite, nu(H)=h, tau(H)=2h−1. Suppose the individual new families are exact two-apex families with disjoint apex pairs

    P1={p,q},    P2={r,s}.

Suppose both possible mixed triangles occur: after relabeling, the cross edges are ac,bd. If there is any H-edge between P1 and P2, then tau(G)≤2nu(G).

Relabel the apices so the given cross-apex edge is pr. All four apices and all five bowtie vertices are distinct. The exact family condition implies the cross graph among {a,b} and {c,d} is a matching, so ac,bd are its only edges.

## Equality extraction from an old triangle plus four new triangles

Assume a violation. The elementary bounds force

    nu(G)=h+2,    tau(G)=2h+5.

The following five triangles are edge-disjoint:

    Q={vpr, vac, vbd, abq, cds}.

The first is an OLD triangle of H, since v is adjacent to every apex and pr is the given old edge. The next two are mixed new triangles, and the last two are new pages. Their edges are respectively

    vp,vr,pr;  va,vc,ac;  vb,vd,bd;  ab,aq,bq;  cd,cs,ds.

Let

    A={vp,vr,pr,ac,bd,aq,bq,cs,ds},
    B=A∪{ab,cd},
    R=H−A.

The set A consists of nine old edges and contains every old edge of Q. Thus any R-packing combines with Q, implying nu(R)≤h−3.

The eleven-edge B covers the entire new family F:
- ab,cd hit the base triangles and all pages on those bases;
- vp hits the p-pages on bases va,vb;
- aq,bq hit the q-pages on those bases;
- vr hits the r-pages on bases vc,vd;
- cs,ds hit the s-pages on those bases;
- ac,bd hit the two mixed triangles.

It also covers every old triangle using A. Therefore a cover of R completes B to a cover of G, and

    tau(R)≥tau(G)−11=2h−6.

Aharoni gives tau(R)≤2nu(R), and the displayed five-packing gives 2nu(R)≤2h−6. Hence

    nu(R)=h−3,    tau(R)=2(h−3).

When h<3, Q already contradicts the critical packing identity, so only h≥3 needs this step.

## A compatible six-packing

The five bowtie vertices W={v,a,b,c,d} are independent in R: the six restored edges were absent from H and the only old cross edges ac,bd lie in A. Choose a W-avoiding face from every equality K4 witness in R. This gives h−3 old triangles whose edges all have both endpoints outside W.

The six triangles

    P={vpr, vac, abp, vbq, cdr, vds}

are edge-disjoint. Their eighteen edges are

    vpr: vp,vr,pr
    vac: va,vc,ac
    abp: ab,ap,bp
    vbq: vb,vq,bq
    cdr: cd,cr,dr
    vds: vd,vs,ds.

Distinctness follows from the four distinct apices and the displayed distinct restored edges.

All edges of the five new triangles in P touch W, so none meets a chosen old face. For the old triangle vpr, its edges vp,vr touch W and its remaining edge pr was deleted from R. Thus it too is compatible with every chosen old face.

The combined packing has (h−3)+6=h+3 triangles, contradicting nu(G)=h+2. QED.

## Consequence

After the shared-apex bowtie theorem, a still-unresolved bowtie with two mixed triangles and exact two-apex individual families must have disjoint apex pairs and no edges between those pairs. Each pair is itself nonadjacent by the maximal-cover-cost apex lemma. Therefore all four apices are independent.

In that residual shape every old triangle contains at most one of the twelve spokes: two spokes within one family would require adjacent terminals or adjacent apices; spokes from different families can meet only at v, and a triangle using them would require a forbidden cross-apex edge.

The one-mixed-triangle case with disjoint apex pairs remains outside this proof. No claim of a complete two-apex or unrestricted theorem is made.
