> Curated source from TUZA-03/proof/MIXED_TWO_APEX_BOWTIE_THEOREM.md. Original SHA-256: `9466a6085b60be69f185fd063ee5c69b1994019dc0f297a927d5978844605ba1`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Exact-two-apex bowties with a mixed triangle: consolidated theorem


## Theorem and definitions

Let G be a finite simple graph. Let T1=vab and T2=vcd be edge-disjoint triangles with their unique common vertex v, and let H=G−(E(T1)∪E(T2)). Suppose the complete triangle hypergraph D(H) is 3-partite.

For each i, suppose the full family Fi of triangles created by restoring Ti alone is exactly Ti and the six triangles obtained by joining each of its three edges to each of two universal apices Pi. There are no additional pages at partial or universal apices.

If either
1. P1∩P2 is nonempty, or
2. G has a triangle using an edge of each of T1,T2,

then tau(G)≤2nu(G).

The second condition is equivalently the presence of at least one H-edge between {a,b} and {c,d}. This includes arbitrary-size remainders. No bound on their defective component is assumed.

## Precise inputs

Published inputs:
- Aharoni's theorem: tau(D)≤2nu(D) for a 3-partite 3-uniform hypergraph.
- Haxell–Narins–Szabó's equality/home-base theorem, used through the graphical equality extraction and exhaustion deduction: if a graph J has 3-partite D(J) and tau(J)=2nu(J), its complete triangle family consists exactly of the four faces of nu(J) pairwise edge-disjoint K4s.
- The Strong Perfect Graph Theorem, used in the nine-cycle page lemma below.

Archived/new ordinary deductions, with full arguments retained:
- the slack-zero restoration branch and the essential-packing-edge branch in baseline/TUZA-02;
- alternative/ADJACENT_APEX_MAXIMAL_COST.md, which forces nonadjacent same-family apices in a critical stable case;
- the full constituent proofs linked under each case below.

The equality exhaustion statement is a project deduction from the published HNS theorem, not a quotation of the published theorem. The archived branches and this deduction have been independently read and criticized in this project; they are not being represented as externally certified theorems.

## Critical reduction and an equality-extraction rule

Put h=nu(H). Appending T1,T2 gives nu(G)≥h+2, while adding their six edges to an H-cover gives tau(G)≤tau(H)+6. If tau(H)≤2h−2, the conclusion follows immediately. If tau(H)=2h, the archived slack-zero branch applies.

A counterexample must therefore have
    tau(H)=2h−1, nu(G)=h+2, tau(G)=2h+5.
The archived essential-edge branch lets us assume H is packing-edge-stable. Each individual restoration has actual cover gain three: otherwise covering the other restoration with its three edges saves one from 2h+5. The adjacent-apex lemma then says that the two apices of either individual family are nonadjacent.

Exactness implies all apices are outside W0={v,a,b,c,d}. It also implies that the H-edges inside W0 form a matching between {a,b} and {c,d}. For example, if c were adjacent to both a,b, c would be an additional page apex for ab. Thus the number m of mixed triangles is 0,1,or2; relabel to make their cross edges ac and, when m=2, bd.

Here is the rule used repeatedly. Suppose Q is a q-packing of G, A is a set of old H-edges containing every old edge used by Q, and B is a cover of every new G-triangle with A⊆B and |B|=2q+1. Then J=H−A satisfies
    nu(J)≤h+2−q,
    tau(J)≥tau(G)−|B|=2(h+2−q).
Aharoni forces equality. Hence J has exactly h+2−q isolated K4 face families. Negative right sides already contradict the displayed packing. In an equality K4, any independent vertex set meets at most one vertex, so a face avoiding that set can be chosen. All choices are simultaneous because the K4 edge supports are disjoint.

## Shared apex pairs

Write P1={p,q}, P2={p,r}, allowing q=r.

If m=0, the row-v covers {vp,vq,ab} and {vp,vr,cd} have a union of size at most five. If q=r and m≤1, {vp,vq,ab,cd} plus one edge for the mixed triangle has size at most five. Either gives tau(G)≤tau(H)+5.

For m=2 take
    Q={vac,vbd,abq,cdr},
    A={ac,bd,aq,bq,cr,dr,vp},
    B=A∪{ab,cd}.
For m=1 and q≠r take
    Q={vac,abq,cdr,vbp},
    A={ac,aq,bq,cr,dr,vp,bp},
    B=A∪{vb,cd}.
In both cases Q is a four-packing, B is a nine-edge cover of the entire new family, and W0 is independent in H−A. The rule gives h−2 equality K4s with faces avoiding W0.

When q≠r, the five new triangles
    vac,abp,vbq,cdp,vdr
are edge-disjoint. When q=r (necessarily m=2 in this branch), use
    vcp,vaq,vbd,abp,cdq.
Every edge of these triangles touches W0, so they combine with the h−2 old faces, yielding h+3 triangles, contradiction.

The complete edge-by-edge cover and disjointness verification is in [COMMON_APEX_BOWTIE_RESTORATION.md](../alternative/COMMON_APEX_BOWTIE_RESTORATION.md). Thus all overlapping-apex cases are settled.

## Disjoint apices with two mixed triangles and a cross-apex edge

Write P1={p,q}, P2={r,s}. Assume ac,bd are present and relabel any cross-apex edge as pr. Take
    Q={vpr,vac,vbd,abq,cds},
    A={vp,vr,pr,ac,bd,aq,bq,cs,ds},
    B=A∪{ab,cd}.
Q is a five-packing (vpr is old); B covers all new triangles. The rule gives h−3 equality K4s in H−A. Again W0 is independent there. Choose old faces avoiding W0.

The six-packing
    vpr,vac,abp,vbq,cdr,vds
is compatible with those faces: every edge except pr touches W0, and pr was deleted. This yields h+3 triangles. Full verification is in [CROSS_APEX_DOUBLE_MIXED_BOWTIE.md](../alternative/CROSS_APEX_DOUBLE_MIXED_BOWTIE.md).

It remains to handle m=1, or m=2 with no cross-apex edge.

## The common nine-cycle extraction

For either m=1 or2, use
    Q={vac,abp,vbq,cdr,vds},
    A={ac,ap,bp,bq,vq,cr,dr,ds,vs}.
A is the edge set of the nine-cycle
    a-p-b-q-v-s-d-r-c-a.
For m=1 take B=A∪{ab,cd}; for m=2 take B=A∪{vb,cd}. The second choice hits the additional mixed triangle vbd. The rule gives an equality remainder J=H−A with k=h−3 K4 blocks.

Set W={v,a,b,c,d,p,q,r,s}. Exactness forbids any additional terminal-apex edge beyond the twelve prescribed spokes. The retained boundary edges in J are vp,vr,aq,cs, together with the cross-apex edges and, if m=2, bd.

### Cross-apex edges must form a matching

Assume pr is present. The triangle vpr survives in J and forces a K4 vprx, with x outside W. If ps is also present, repeat the same extraction after interchanging r,s. This independently forces a K4 vpsy in H, with y outside W.

Return to the first J. Exactly one edge of vpsy was deleted, namely vs. Its faces vpy and psy survive and share py. Equality exhaustion requires them to belong to the same K4, whose fourth required edge is vs, a contradiction. Interchanging the families handles any pair of incident cross-apex edges.

Thus the cross-apex graph is a matching and has at most two edges. No packings from different remainders were combined; each remainder separately forces a concrete K4. Full proof: [CROSS_APEX_MATCHING_FROM_TWO_EQUALITY_REMAINDERS.md](../alternative/CROSS_APEX_MATCHING_FROM_TWO_EQUALITY_REMAINDERS.md).

### Nine-cycle page lemma

If a graph L has a C9 on W, an independent outside part X, and arbitrary W–X edges, then, when nu(L)≤4, either tau(L)=nu(L), or the entire triangle family is a single full nine-wheel, of parameters (4,5).

For completeness, represent each triangle by (i,x), its base-cycle edge and apex. Its intersection graph has clique columns i; adjacent columns are joined only between equal apex labels. An induced cycle of length≥5 must visit all nine columns: in a proper interval of used columns, an endpoint column has one vertex with too few cycle neighbors, or two consecutive vertices whose neighbors in the next column create a chord. Thus C5,C7 are absent; a C9 has one vertex per column and one common apex. Longer odd holes would give at least five disjoint triangles. Neighborhoods are disjoint unions of cliques, excluding odd antiholes of length≥7. If there is no full wheel, SPGT and the common-edge property of triangle cliques give a cover of size nu.

If a full wheel and a page at another apex coexist, the latter page together with a four-matching of the eight remaining wheel bases gives five packed triangles. Thus at nu≤4 the wheel is the whole family; its cover number is five. This proves the lemma. Full details and the path-base corollary are in [NINE_CYCLE_PAGE_INTEGRALITY.md](../alternative/NINE_CYCLE_PAGE_INTEGRALITY.md).

### Compatible equality faces

Let Fout be the H-triangles lost on deleting A whose third vertex is outside W. They form exactly a C9-page graph. The following choices give faces compatible with every Fout-triangle.

- A K4 with at most one W vertex has a face avoiding W.
- If pr survives, the block containing vpr is vprx. Exactness prevents x from adjoining a,b,c,d. Choose prx.
- If pr is absent, a block vpxy has x,y outside W and neither adjacent to a,b,c,d. Choose pxy. Handle vr similarly.
- A block aqxy has x,y nonadjacent to v,b, by exactness of the first family. Choose qxy. Handle cs by choosing the face avoiding c.

Each assertion follows by inspecting a possible shared edge with a lost triangle: it would require one of the forbidden outside-to-terminal adjacencies. Full verifications, including the previously omitted open-wedge case, are in [SINGLE_CROSS_APEX_SINGLE_MIXED_BOWTIE.md](../alternative/SINGLE_CROSS_APEX_SINGLE_MIXED_BOWTIE.md).

### Finish m=1

There are zero, one, or two disjoint cross-apex edges.

For zero or one, every equality block is one of the compatible types above. There are no lost internal-W triangles. All k old faces coexist with Fout, so nu(Fout)≤3. The page lemma gives tau(Fout)≤3. An old 2k-cover plus this cover has size≤2h−3, contradicting tau(H)=2h−1.

For two, label the retained edges pr,qs. The only additional lost internal triangle is Z=vqs. All blocks are compatible except possibly one containing qs. If such a block exists, omit it: nu(Fout)≤4. The pure-wheel exception is impossible, since its outside apex would also be an additional apex for vab. Therefore tau(Fout)≤4. Choose a minimum J-cover containing qs in its block; this already hits Z, and the total cover has size≤2k+4=2h−2.

If no qs block exists, all k faces are compatible, so tau(Fout)≤3; adding qs to cover Z gives the same upper bound. Contradiction. Full proof: [SINGLE_MIXED_TWO_CROSS_APEX_BOWTIE.md](../alternative/SINGLE_MIXED_TWO_CROSS_APEX_BOWTIE.md). Its adjacent-two-edge subcase is valid but unnecessary after the matching lemma.

### Finish m=2 with no cross-apex edge

The retained boundary is vp,vr,aq,cs,bd. H[W] has no triangle, so all lost triangles belong to Fout. Every equality block has a compatible face except possibly one containing bd. Omit that block if present, obtaining nu(Fout)≤4. The same exact-apex condition excludes the pure-wheel exception, and tau(Fout)≤4. Thus tau(H)≤2k+4=2h−2, contradiction.

Full proof: [DOUBLE_MIXED_NO_CROSS_APEX_BOWTIE.md](../alternative/DOUBLE_MIXED_NO_CROSS_APEX_BOWTIE.md). All possibilities in the stated theorem are exhausted.

## Independent criticism and retained gap

The constituent arguments passed the following independent ordinary audits:
- review/COMMON_APEX_BOWTIE_INDEPENDENT_AUDIT.md;
- review/TRIPARTITE_BIPARTITE_GRAFT_AND_BOWTIE_AUDIT.md;
- review/MIXED_BOWTIE_AND_FOOTPRINT_INDEPENDENT_AUDIT.md.

The audit repaired an omitted open-wedge K4 case in the initial zero-cross-apex proof; its failed draft is preserved. A longer three-cross-apex proof is also retained but is unnecessary after the two-remainder matching argument.

This theorem leaves open disjoint restored triangles, disjoint-apex bowties with no mixed triangle, and the general individual-family packing-three branch. The full two-triangle restoration theorem and unconditional OCT-five consequence remain unproved.
