> Curated source from TUZA-03/alternative/COMMON_APEX_BOWTIE_RESTORATION.md. Original SHA-256: `535c6d08c115e7e66c286f522eb023034fed585cf7fcf5290aac003245558a0b`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Joint restoration for a bowtie whose two-apex families share an apex


## Statement in the remaining slack-one branch

Let T1=vab and T2=vcd be edge-disjoint triangles sharing exactly v. Let H be obtained by deleting their six edges from G. Suppose D(H) is 3-partite, and write

    nu(H)=h,    tau(H)=2h−1.

For i=1,2 let Fi be the triangles created by restoring Ti alone to H. Assume each Fi is exactly its base triangle and its six pages at two apices, and the two apex pairs have a nonempty intersection. Write

    P1={p,q},    P2={p,r},

where q=r is permitted.

Then tau(G)≤2nu(G).

Together with the separately established equality-slack branch and the elementary slack-at-least-two branch, this gives the full two-triangle conclusion under the stated shared-apex hypothesis.

## Shape and small-cover cases

All apices lie outside W={v,a,b,c,d}. For example, c cannot be an F1 apex because vc is absent from H. If c were adjacent to both a,b, the triangle abc would nevertheless be an F1 page at an additional apex c, contradicting the exact two-apex description. The symmetric observations imply that the cross edges among {a,b} and {c,d} form a matching.

These cross edges are the only H-edges within W. Each produces one mixed triangle vxy; no other mixed triangle is possible. Let their number be m∈{0,1,2}.

If m=0, the two row-v covers

    {vp,vq,ab},    {vp,vr,cd}

have union of size at most five and cover every new triangle. If q=r and m≤1, the four-edge union {vp,vq,ab,cd} together with one edge per mixed triangle still has size at most five.

In all these cases,

    tau(G)≤tau(H)+5=2h+4≤2nu(G),

because T1,T2 can be appended to a maximum H-packing.

It remains to treat:
1. m=2, with q=r or q≠r; and
2. m=1 with q≠r.

## Critical identities and the equality mechanism

Suppose, for contradiction, tau(G)>2nu(G). The elementary packing and cover bounds force

    nu(G)=h+2,    tau(G)=2h+5.

In each remaining case below, we exhibit:
- a four-packing Q of new triangles;
- seven old edges A containing every old edge used by Q;
- two restored edges D such that B=A∪D covers the full new family F, including mixed triangles;
- all H-edges within W among A.

Put R=H−A. Compatibility with Q gives nu(R)≤h−2. Since B covers every new triangle and every old triangle using A, a cover of R completes it to a G-cover. Therefore tau(R)≥tau(G)−9=2h−4. Aharoni then forces

    nu(R)=h−2,    tau(R)=2(h−2).

If h<2, Q already contradicts the critical packing identity, so only h≥2 needs this argument.

The set W is independent in R. From the h−2 edge-disjoint K4 witnesses supplied by the graphical HNS equality consequence, choose one face avoiding W in every witness. These old faces are simultaneously compatible with EVERY new triangle, because every edge of a new page, base triangle, or mixed triangle touches W.

Thus it suffices in each case to exhibit a five-packing in F: it combines with the old faces to contradict nu(G)=h+2.

## Case 1: two mixed triangles

Relabel c,d so the cross edges are ac and bd. Take

    Q={vac, vbd, abq, cdr},
    A={ac,bd,aq,bq,cr,dr,vp},
    D={ab,cd}.

The four triangles in Q are edge-disjoint: the two mixed triangles use the four restored v-spokes and distinct cross edges; abq and cdr use the two remaining restored bases and four distinct old spokes. This remains true when q=r.

The nine-edge B=A∪D covers F:
- ab,cd hit both bases and all pages on those bases;
- aq,bq hit the q-pages on va,vb;
- cr,dr hit the r-pages on vc,vd;
- vp hits all p-pages whose base contains v;
- ac,bd hit the mixed triangles.

Both H-edges within W are in A, so the equality mechanism applies.

If q≠r, a five-packing is

    P={vac, abp, vbq, cdp, vdr}.

Its edges are

    vac: va,vc,ac
    abp: ab,ap,bp
    vbq: vb,vq,bq
    cdp: cd,cp,dp
    vdr: vd,vr,dr.

All fifteen are distinct; q≠r is precisely what distinguishes vq from vr.

If q=r, use instead

    P={vcp, vaq, vbd, abp, cdq}.

Its edges are

    vcp: vc,cp,vp
    vaq: va,aq,vq
    vbd: vb,bd,vd
    abp: ab,ap,bp
    cdq: cd,cq,dq.

Again all fifteen are distinct. Both subcases contradict the critical identity.

## Case 2: one mixed triangle and distinct nonshared apices

Relabel so the only cross edge is ac; now q≠r. Take

    Q={vac, abq, cdr, vbp},
    A={ac,aq,bq,cr,dr,vp,bp},
    D={vb,cd}.

The displayed four triangles are edge-disjoint, with old edges exactly A.

The nine-edge B=A∪D covers F as follows:
- vb hits T1, and cd hits T2 and all pages on cd;
- vp hits every p-page whose base contains v;
- bp hits the remaining p-page on ab;
- aq,bq hit every q-page of F1;
- cr,dr hit the r-pages on vc,vd (and also their page on cd);
- ac hits the unique mixed triangle.

The only H-edge within W is ac, which lies in A. The equality mechanism again applies. The same distinct-apex five-packing

    P={vac, abp, vbq, cdp, vdr}

has the fifteen distinct edges listed in Case 1 and yields the contradiction.

This proves the statement. QED.

## Scope

This argument handles arbitrary-size old remainders whenever both individual new families are exact two-apex families and their apex pairs intersect. It uses a joint nine-edge cover and four-packing to force an equality remainder, then a different five-packing after simultaneous K4-face avoidance.

It does not handle disjoint apex pairs in the bowtie case, vertex-disjoint restored triangles, or an individual new family of packing number three. Those remain parts of the unrestricted problem.
