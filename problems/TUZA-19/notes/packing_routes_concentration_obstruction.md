# Canonical centres can fail for every concentration-optimal type1 packing

Status: complete ordinary proof with a standalone exact local-profile/full-triangle check; independent review pending. This is an auxiliary obstruction, not a Tuza counterexample. The graph has an explicit support-contained cover of size 29<2nu=30 and a heavy/light matching giving arbitrary-centre star gluing. Originality is unestablished.

## Exact selection claim refuted

For a triangle packing P write d_P(v) for the number of packed triangles containing v. Its concentration is F(P)=sum_v d_P(v)^2. For an all-type1 maximum packing, every packed triangle has exactly one edge supporting actual private pages; call that edge its private base and the opposite vertex its canonical centre. A canonical-centre support cover C must cover every actual triangle, lie in B=E(P), and satisfy

    |C intersect B_v| <= 2 |P_v|

for P_v the packed members whose canonical centre is v and B_v their edge union.

**Theorem.** There is a 32-vertex graph G with 75 edges, 70 actual triangles and nu(G)=15 having all-type1 maximum packings that globally maximize F among ALL maximum packings. For EVERY such all-type1 F-maximizer, no canonical-centre support cover exists. The same assertion holds when F-maximization is replaced by lexicographic maximization of the nonincreasing vertex-incidence sequence. Nevertheless these prescribed packings admit support covers of size29 and compatible arbitrary-centre star groupings.

Thus both the local acyclic private-page order and the two genuine global concentration optimizations fail to imply this canonical-centre rule. This does not refute a concentration strategy that chooses centres jointly with cover states, incorporates noncanonical groups, or uses mixed private-K4/type0 packings.

The distinction matters: maximizing F only among all-type1 packings need not allow private-page swaps. Here F-maximality is proved over ALL maximum packings, and the displayed maximizer happens to be all-type1.

## The available ordering lemma, and what it does not give

If P globally maximizes F among maximum packings and ab z is private for T=ab c, replacing T by ab z is another maximum packing. The change in F is

    (d_P(z)+1)^2-d_P(z)^2 + (d_P(c)-1)^2-d_P(c)^2
      = 2(d_P(z)-d_P(c)+1).

It cannot be positive, so d_P(c)>d_P(z). Hence the directed relation from opposite packed vertices to private-page apices is acyclic. This exact necessary condition remains valid. The graph below satisfies the stronger global optimum hypothesis and still defeats canonical-centre compatibility.

## Eight-vertex core

Use vertices a,b,x,c,d,w,y,z, represented in the certificate by 0,1,2,3,4,5,6,7 respectively. Take the union of the two complete graphs

    K4[a,b,x,y], K4[c,d,w,y]

and triangle acz. There are no other edges. The two K4s meet only at y, and ac is a new edge from the last triangle.

Every actual triangle is one of the four faces of the first K4, one of the four faces of the second K4, or acy, acz. No other triangle occurs: the only edge between the exclusive sides of the K4s is ac, whose common neighbors are exactly y,z; z has only neighbors a,c. Thus the core has15 edges and10 actual triangles.

Prescribe P0=(abx,cdw,acy). Its three members are edge-disjoint. An arbitrary packing uses at most one face from each K4 and at most one of acy,acz, because K4 has no two edge-disjoint triangles and the last two share ac. Hence nu(core)=3. Every maximum packing has exactly this three-block form.

Relative to P0, the unique private bases are bx,dw,ac, and the private pages are bxy,dwy,acz. All members are type1. Their canonical centres are a,c,y. The private arrows are a->y,c->y,y->z; these are acyclic, and their packing degrees satisfy 2>1>0.

Every support cover must contain R={bx,dw,ac}. The remaining actual triangle constraints are

    {ab,ay}, {ax,ay}, {cd,cy}, {cw,cy}.

These are two independent K1,2 vertex-cover problems. The unique minimum residual cover is {ay,cy}, so the unique minimum support cover has size5.

There is NO cover with at most two support edges in each packed member. If ay is absent, both ab and ax must be selected, giving abx three selected edges together with its forced base bx. Thus the singleton quota at centre a forces ay. Similarly the singleton quota at centre c forces cy. Then acy has all three of its edges selected and violates its singleton quota at centre y. This rules out every canonical-quota cover, not merely minimum covers.

It does not rule out arbitrary grouping: the five-cover has loads(1,1,3), and heavy acy can pair with light abx at a. The other light member remains singleton.

The original P0 has F=13 but is not globally F-maximal. For example the common-y packing(bxy,dwy,acy) has F=15. This is why the eight-vertex core alone refutes only the local ordering/acyclicity strengthening.

## Neutral K5 padding

At EACH of a,b,x,c,d,w attach a fresh K5 by identifying exactly one of its vertices with that core vertex; all four other vertices are new and used by no other block. Add no cross edges. Denote these six shared vertices by S. In each attached K5 pack two triangles sharing its attachment vertex, with their other endpoints partitioning the four fresh vertices into two pairs. Let P be P0 plus these12 packed triangles.

Every triangle of the resulting graph is uniquely in the core or in one attached K5: a triangle spanning exclusive sides of a vertex sum would require a missing cross edge. Thus there are32 vertices,75 edges and70 triangles. The packed supports of different blocks are edge-disjoint. The packing number is the sum3+6*2=15, since each K5 has packing number2, and all these local optima can be united. Every maximum packing factors into one core maximum and one maximum packing in each K5.

For completeness, nu(K5)=2: three triangles would use9 of its10 edges, leaving one edge; the union of triangle edge sets has even degree at every vertex while K5 also has even degrees, so the leftover graph would have even degrees, impossible for one edge. Two edge-disjoint triangles are explicit.

Every member of P remains type1. A vertex sum adds no triangle or packed edge within an old block. A two-triangle star packing in K5 has private pages exactly on its two opposite bases; each base has the two opposite-pair vertices as private apices. Its two packed members have the attachment vertex as canonical centre.

Every support cover in a K5 block needs its two private bases and at least two of the four spokes. Indeed the cross-base triangles impose a C4 on the four spokes, whose minimum vertex cover is2. Therefore each attached K5 consumes at least2 residual edges, exactly its added residual quota of2 at its attachment centre. It provides no spare canonical quota to the core member at that centre.

Consequently the groups at a and c can still allocate at most one residual edge to abx and cdw respectively. The group at y is still the singleton acy with residual quota1. The four core constraints give the same contradiction as before. No canonical-centre support cover exists.

The precise support minimum is5+6*4=29 by block factorization, and it is attained. This already proves Tuza for the witness.

## Global F optimality over every maximum packing

Any two edge-disjoint K5 triangles share exactly one vertex and use all five vertices. Thus their vertex-incidence profile is(2,1,1,1,1). If their common vertex is the attachment v, the attached block contributes2 at v and1 at each private vertex. Otherwise it contributes1 at v,2 at one private vertex, and1 at each other private vertex.

Let t=d_Q(v) be the core packing incidence of v. Replacing an attached K5 maximum packing by a star centred at v changes F by

    (t+2)^2-(t+1)^2 + 1^2-2^2 = 2t >= 0.

No triangle packing outside that block changes. Therefore every maximum packing can be normalized to stars at all six attachment vertices without decreasing F.

For a core maximum packing Q let H(Q)=sum_{v in S}d_Q(v), and F0(Q)=sum_{v in core}d_Q(v)^2. In a normalized packing,

    F = F0(Q) + 4 H(Q) + 48.

The constant48 is six contributions of4 from the attachment-vertex square expansions and24 from the fresh vertices.

Every core maximum consists of one face from each K4 and one of acy,acz. There are20 such packings: if acy is selected, each K4 has two faces avoiding its already-used attachment edge ay or cy; if acz is selected, all four faces of each K4 are available. Directly, H<=8. Equality requires selecting abx and cdw, since these are the only K4 faces having three S vertices. Either central triangle then gives F0=13. If H<=7, always F0<=15: this follows immediately by listing the20 cases, or by the bounds that only a,c can have incidence2 from their K4 and the central triangle, y has incidence at most3, z at most1, and the other four vertices at most1, with total incidence9. The exact20-case list is retained and independently replayable.

Hence H=8 gives F=13+32+48=93, whereas H<=7 gives F<=15+28+48=91. The displayed P attains93, so is globally F-maximal among ALL maximum packings.

The equality description also characterizes every F-maximizer. It must have core faces abx,cdw and central face acy or acz. All six S vertices then have positive core incidence, so every attached K5 must actually be centred at its attachment: a noncentred local choice loses the strictly positive amount2t. If the central face is acz, the other two core members abx,cdw each have a private K4 completion through y, so the packing is not all-type1. Therefore EVERY all-type1 F-maximizer has exactly the original core packing P0, with arbitrary pair partitions only inside the attached K5s. The canonical quota contradiction applies to all of them.

## Lexicographic incidence optimality

The same normalization never decreases the sorted incidence sequence. If t=0, it merely exchanges incidences1 and2 between v and the former private common vertex. If t>=1, it raises v from t+1 to t+2>=3 while lowering a private incidence from2 to1; the largest changed value increases, giving a strict lexicographic improvement.

In a normalized maximum packing only a and c can have incidence4, and the displayed P has both. Therefore a lexicographic maximizer must have core incidence2 at both a and c. If acy is used, this already forces the K4 faces abx,cdw (a face containing a and y would share ay with acy, and similarly at c). If acz is used, y has incidence at most2. Thus after attaining the two4 entries, only b,x,d,w can attain incidence3; all other vertices have incidence at most2. The displayed P attains all four3 entries, forcing the core faces abx,cdw. The remaining core face is acy or acz and the sorted sequence is

    (4,4,3,3,3,3, followed by twenty-five1s, then0).

This proves global lexicographic optimality and the same all-type1 characterization. The canonical failure therefore survives this stronger selection rule too.

## Compatible arbitrary-centre cover and scope

Take the unique five-edge core support cover and any four-edge support cover in each K5. In each K5 the two local packed members have loads3 and1 and meet at the attachment vertex, so match that heavy/light pair. Match core heavy acy to core light abx at a; leave cdw unmatched and light. These pairs saturate every heavy member. By the frozen heavy/light equivalence, they give an allowed common-centre partition with all budgets respected. This explicitly separates failure of canonical centres from failure of existential SG.

The new result does not refute PK-all or PK-exists, any arbitrary-centre compatibility claim, nonlocal cover changes, or changes to a mixed packing. It specifically prevents using degree concentration, even optimized globally and lexicographically, to justify the canonical opposite-private-base centre assignment. No assumption about a hypothetical minimal Tuza violation is tested or refuted.

## Evidence and provenance

The full32-vertex edge list, all70 actual triangles, the15-packing, every private page, the29-cover and explicit heavy/light matching are retained in evidence/packing_routes/concentration_witness.json. The standalone checker checks/packing_routes_concentration_witness.py imports only Python's standard library and no historical producer scripts. It enumerates all actual triples, the20 core maximum packings, the15 local K5 maximum packings, and all1280 possible global sorted-degree/F profiles (20 core choices times2^6 attachment profiles). The two local attachment profiles are exhaustive because choosing which private vertex is the common one only permutes otherwise private coordinates.

The all-size/local factorization argument and the concentration optimality proof are ordinary mathematics; the finite literal/profile check supports this specific witness. No Lean verification, independent review, historical-originality assertion, or unrestricted proof is claimed here.
