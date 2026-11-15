# A global compression route: exact transfers and two scoped failures

Status: ordinary arguments plus literal certificate checks; research stopped after the fixed cone extension. No unrestricted Tuza proof or counterexample. The root/coordinator and producer jointly derived this package: the producer proposed the compression transfer and first control, the root proposed the rook and cone controls and original-cone optimum formulas, and both supplied/check-reconstructed the explicit compressed certificates. These exchanges are not an independent final review. Fresh-critic review of this frozen package is pending and belongs in a separate review record. No historical novelty is claimed.

## Exact candidate fixed before testing

Every graph below is finite and simple. All triangles are actual graph triangles, including newly created triangles after an operation, and every cover consists of actual graph edges. Write d(G)=tau(G)-2nu(G).

For distinct ordered vertices a,b with deg(a)>=deg(b), let

    R = N(b) \ (N(a) union {a}).

When R is nonempty, the allowed compression K_ab(G) deletes bx and adds ax for every x in R, leaving every other edge unchanged. The receiver is a and donor is b. No vertex is identified or removed. Added edges were absent, deleted edges were present, and no loop is introduced; both vertex count and edge count stay fixed.

The first global availability candidate was:

    C_T: For every finite simple G having an allowed compression,
         there is an allowed compression K_ab with d(K_ab(G)) >= d(G).

The intended terminal class consists of graphs with no allowed compression. Before testing, the first decisive point was whether all allowed moves on one fixed graph could strictly decrease d. The exact six-vertex control below answers yes.

## Termination and terminal transfer, proved directly

Let Q(G)=sum_v deg(v)^2. If r=|R|, only the degrees of a and b change, by +r and -r respectively. Therefore

    Q(K_ab(G))-Q(G) = 2r(deg(a)-deg(b)) + 2r^2 > 0.

The integer Q is bounded by n(n-1)^2, so every sequence of allowed compressions terminates.

At a terminal graph, for every pair with deg(a)>=deg(b), one has

    N(b)\{a} subseteq N(a)\{b}.

Thus every pair of vertices is comparable by the vicinal-neighborhood inclusion. This total comparability is inherited by induced subgraphs. A graph with total comparability has an isolated or a dominating vertex, as follows. Choose a minimum-degree vertex u and maximum-degree vertex v. If u is isolated, stop. Otherwise take a neighbor x of u. If x=v, then uv is an edge. If x is different from v, comparison of x with v transfers the neighbor u from x to v, again giving uv. For any other w, comparison of u with w transfers the neighbor v from u to w. Hence v is dominating. Repeating this argument after deletion produces an ordering in which every vertex is added as isolated or dominating.

This construction gives a threshold representation directly: dominating insertions form a clique, isolated insertions form an independent set, the independent-side neighborhoods are nested, and the clique-side closed neighborhoods are nested. This is exactly the threshold definition in the primary source cited below; no unproved terminal characterization is needed.

Bonamy et al., Theorem 1, proves tau<=2nu for all finite simple threshold graphs. This published theorem is an explicitly imported terminal dependency, not a theorem reproved or fully audited here. Were C_T true, iterating its nondecreasing-defect choices would give

    d(G) <= d(G_1) <= ... <= d(H) <= 0

at a threshold terminal H, proving unrestricted Tuza. This is an integral cover/packing transfer, not a fractional argument.

## First obstruction: two K4s sharing one edge

Let G have vertices0,...,5 and edges E(K4[0,1,2,3]) union E(K4[0,1,4,5]). Its actual triangles are

    012,013,023,123,014,015,045,145.

Every triangle belongs to one of the two K4s. Two triangles inside one K4 share an edge, so nu<=2; triangles023 and045 give nu=2. Each K4 needs two cover edges, and their edge sets intersect only in01, so a two-edge cover of both is impossible. The set{01,23,45} is a cover, giving tau=3 and d=-1.

Vertices0 and1 have degree5 and all other vertices degree3. The only allowed nontrivial compressions have receiver in{2,3}, donor in{4,5}, or the reverse. There are exactly eight, all equivalent under graph automorphisms. For receiver2 and donor4, the operation replaces45 by25. The complete actual triangle list becomes

    012,013,014,015,023,025,123,125.

Triangles014,023,125 are an edge-disjoint three-packing. The three edges{01,02,12} cover every triangle. Thus nu=tau=3 and d=-3. By symmetry every allowed compression strictly lowers d, refuting C_T.

This graph itself has the common-vertex maximum packing{023,045}. Therefore it does not refute a proposal that already exempts every graph with a common-vertex maximum packing.

## Whole-class repair and its existing C7-square discriminator

Let S be the entire class of graphs admitting a maximum triangle packing whose members share a vertex. The reviewed PK-star theorem in this workspace proves Tuza for S. A mathematically substantive repair, rather than adding a selected exception, is

    C_TS: For every finite simple G outside (threshold graphs union S),
          there is an allowed compression with nondecreasing d.

The same finite-potential transfer would prove unrestricted Tuza from C_TS, since either terminal class satisfies the target inequality.

The already frozen C7-square control does not refute this repair. On vertices modulo7 join cyclic distances1 and2. Its nu=3,tau=4,d=-2, and the largest packing through any vertex has size2. All42 ordered compressions exist. The14 cyclic-distance2 moves preserve d; the other28 give nu=tau=4 and d=-4. For receiver0 and donor2, the operation replaces23,24 by03,04. It has the common-vertex maximum packing{012,035,046} and a four-cover{01,03,06,45}. Thus this preserving move actually enters S. Exact finite results here are only a discriminator, not evidence for a global availability theorem.

## Second obstruction: the fixed 4 by4 rook graph

The coordinator proposed this single structural control after the C7-square result. No graph-order census or parameter search was run. Its vertices are (i,j), with0<=i,j<=3; two distinct vertices are adjacent exactly when they share a row or a column. In formulas below the string ij denotes the vertex(i,j), and a dot separates two such vertex names in an edge.

The eight rows and columns are edge-disjoint K4 blocks. Every actual triangle lies wholly in exactly one row or column: if two vertices share a row and the third is outside that row, it cannot share a column with both. Each K4 packs at most one triangle and needs two cover edges. Choosing one triangle and an opposite-edge matching cover in each block proves exactly

    nu=8, tau=16, d=0.

Every vertex has degree6, so a packing through one vertex has size at most3<8. The graph is outside S. It is not threshold, since the induced vertices00,01,22,23 form two disjoint edges and therefore have neither an isolated nor a dominating vertex; this contradicts the inherited threshold construction proved above.

All ordered distinct pairs are allowed. Row permutations, column permutations and transposition give exactly two orbits:96 adjacent ordered pairs and144 nonadjacent ordered pairs. It suffices to inspect the following two representatives, preserving all actual triangles.

### Adjacent receiver00, donor01

Put a=00. Replace each edge01.i1 by a.i1 for i=1,2,3. The eight K4 blocks survive, with column1's vertex01 replaced by a; their edge sets are still disjoint. The only triangles in addition to their faces are

    (a,10,11), (a,20,21), (a,30,31).

The following eleven triangles form an edge-disjoint packing:

    (00,01,02);
    (10,12,13), (20,22,23), (30,32,33);
    (10,20,30), (11,21,31);
    (02,12,22), (03,13,23);
    (a,10,11), (a,20,21), (a,30,31).

Take an opposite-edge matching cover in each surviving K4, choosing each row i's matching to include i0.i1 and i2.i3. The row choices cover the three extra triangles, so this is a sixteen-edge cover. Hence

    nu(K_ab(G))>=11, tau(K_ab(G))<=16, d(K_ab(G))<=-6<0.

No exact optimum is needed or claimed for the compressed graph.

### Nonadjacent receiver00, donor11

Again put a=00. Move the four donor edges to12,13,21,31 onto a. The two affected K4 blocks become

    row1' = {a,10,12,13}, column1' = {a,01,21,31}.

The other six row/column K4s remain. There are overlaps along edge a.10 between row1' and column0, and a.01 between column1' and row0. The donor11 retains only the nonadjacent neighbors01 and10, so it lies in no actual triangle. In addition to the eight blocks' faces, the only triangles are

    (a,20,21), (a,30,31), (a,02,12), (a,03,13).

Pack all four extra triangles together with these eight faces:

    (01,02,03), (10,12,13), (20,22,23), (30,32,33),
    (10,20,30), (01,21,31), (02,22,32), (03,23,33).

This gives twelve edge-disjoint actual triangles. The following block covers meet every face and every extra triangle:

    row0:    {a.01, 02.03}
    column0: {a.10, 20.30}
    row1':   {a.10, 12.13}
    column1':{a.01, 21.31}
    row2:    {20.21,22.23}
    row3:    {30.31,32.33}
    column2: {02.12,22.32}
    column3: {03.13,23.33}.

There are14 distinct cover edges because a.01 and a.10 each occur twice. Therefore

    nu(K_ab(G))>=12, tau(K_ab(G))<=14, d(K_ab(G))<=-10<0.

The complete triangle counts are35 and36 in the adjacent and nonadjacent cases respectively, checked literally. These constructive bounds prove that every allowed compression of the rook graph strictly lowers d, refuting C_TS.

## Componentwise terminal repair and the fixed cone extension

The rook graph has eight literal K4 shared-edge triangle components. Each is a known terminal. Thus a further substantive repair closes the threshold/star terminal classes under decomposition into shared-edge triangle components, where packing and cover numbers add because component edge supports are disjoint. The rook graph does not refute this repaired availability claim.

The coordinator supplied one structurally motivated extension: add a universal apex z to the same rook graph. Call the result J. This is a single fixed control, not a family census. We now prove

    nu(J)=16, tau(J)=24, d(J)=-8.

Every triangle is either an old row/column K4 face or an apex triangle based on a rim edge. There can be at most eight old packed faces and at most eight apex triangles, the latter consuming disjoint pairs of the sixteen spokes. For a matching attaining the bound, use

    00.01, 12.13, 20.22, 31.33,
    10.30, 11.21, 02.32, 03.23.

This is a perfect matching of the rim, using exactly one edge from each K4 block. In each block choose an old face avoiding its matching edge. The eight old faces and eight apex triangles on the matching are edge-disjoint, proving nu=16.

For an arbitrary cover, let U be the rim vertices whose spokes are not in the cover. Every rim edge with both endpoints in U is then forced into the cover. In a K4 block with t vertices in U, the minimum old-edge cover subject to those forced edges is

    f(0),f(1),f(2),f(3),f(4) = 2,2,2,3,6.

For t<=1 use an opposite-edge pair; for t=2 use the forced edge and its opposite; for t=3 the forced triangle covers all faces; for t=4 all six edges are forced. These are optimal by the forced-edge count and the ordinary K4 two-cover lower bound. Since blocks have disjoint edge supports and each rim vertex belongs to exactly two blocks, every cover has size at least

    16-|U| + sum_B f(t_B)
      = 16 + sum_B (f(t_B)-t_B/2)
      >= 16+8 =24.

An8/8 checkerboard partition of the rook vertices gives two vertices of U in every row and column. The eight complementary spokes plus an opposite-edge pair in each K4 attain24.

All actual triangles belong to one shared-edge triangle component. Indeed, adjacent rim edges yield apex triangles sharing a spoke, the connected rim propagates this relation, and every old face shares an edge with an apex triangle. No common-vertex maximum packing exists: an apex-centered packing has size at most8, and one through a rim vertex has size at most3 because its degree is7; both bounds are below16. The induced rook graph still contains an induced2K2, so J is not threshold. Its single triangle component is therefore outside the componentwise threshold/star terminal class.

All nontrivial degree-directed compressions are between rim vertices. Moving to the apex has empty R, and using the apex as donor fails the degree condition. Rim moves retain exactly the same two symmetry orbits as before.

For the adjacent orbit, modify the earlier eleven-triangle rim packing by replacing the column3 face(03,13,23) with(03,13,33). Its unused rim edges contain the six-edge matching

    00.03,02.32,11.12,13.23,21.22,31.33.

Adding the six apex triangles gives a seventeen-packing. For the nonadjacent orbit, the earlier twelve-packing leaves the six-edge matching

    00.01,10.11,12.22,13.33,21.23,31.32,

so adding those apex triangles gives an eighteen-packing.

For covers in each compressed cone, choose all rim edges whose endpoints have the same checkerboard color and the eight spokes in one color class. Every old triangle has a same-color edge; every apex triangle either has such a rim edge or meets a selected spoke. In the adjacent compression the same-color rim-edge count is17, and in the nonadjacent compression it is16. Consequently

    adjacent orbit:    nu>=17, tau<=25, d<=-9<-8;
    nonadjacent orbit: nu>=18, tau<=24, d<=-12<-8.

These are explicit feasible bounds, not asserted compressed optima. The literal verifier reconstructs every actual triangle:80 in J,83 after the adjacent move, and84 after the nonadjacent move. It checks all64 original and compressed edges, every packing, every cover, the residual matchings, and the single shared-edge triangle component.

Thus every allowed compression of J strictly lowers d. This refutes even the availability claim with threshold/star terminal classes closed under shared-edge triangle-component decomposition.

## Exact stopping conclusion and remaining terminal caveat

The cone J is already covered by the entire previously proved one-apex K3/K4/K5-block theorem: its base rook graph has eight literal K4 triangle components, with shared graph vertices permitted. See the exact hypotheses in `coordinator_pk_block_extension.md`. Therefore J does not refute a still stronger availability proposal also exempting all graphs in that theorem. Such an availability claim remains unproved here. No unrestricted reduction follows from the controls.

The completed conclusions are the direct finite-potential transfer and failures of three precisely stated universal-availability proposals: threshold terminals alone, threshold plus whole-graph common-vertex terminals, and closure of those terminals under shared-edge triangle-component decomposition. No terminal is enlarged by merely adding a selected witness. All controls satisfy ordinary Tuza. No claim restricted to hypothetical positive-defect graphs is refuted by these nonpositive-defect controls.

Research on this branch stopped after the two representative cone checks. No further graph, census, terminal repair, or speculative global lemma was pursued. The strongest theorem-supported terminal enlargement remains an unproved global obligation, so unrestricted Tuza is unresolved.

## Source, evidence, staging, and model provenance

Primary terminal source: Marthe Bonamy et al., *Tuza's Conjecture for Threshold Graphs*, DMTCS24:1 (2022), #24, Theorem1. DOI10.46298/dmtcs.7660; arXiv2105.09871v3. Primary PDF: https://dmtcs.episciences.org/articles/7660/download . The theorem statement and conventions on printed pages1–2, and the threshold definition on printed page5, were inspected. The full proof was not audited. PDF SHA256: bda9d94f8c6fcbfe3b19fb27ee2729f664f6da2025083c4badf0c559e312ab07. Only this terminal theorem and definition are imported.

The first literal verifier checks exactly the three initial controls (C7-square, coneC5, and edge-glued K4s) and all their70 allowed compressions; all triangles and exact tiny packing/cover optima are reconstructed. The rook verifier checks one fixed graph and its two representative compressions using only explicit feasible certificates and complete triangle enumeration; it invokes no optimizer. The cone verifier checks the one fixed apex extension and its two orbit representatives in the same way. A preliminary residual matching computation on the two fixed rim certificates returned sizes5 and6; changing one specified adjacent face supplied the explicit six-edge matching checked in the final cone certificate. All three verifiers check preserved edge count. The finite optimality checks are not proofs of a global theorem.

Files are staged in SCRATCH_OUTPUT/tuza18-final-global-compression-20261114T2010Z because the permitted private research workspace is outside this agent's writable sandbox roots. Sources remain unchanged. The coordinator may import the hashed staged files into the authorized private workspace. No server, installation, external message, publication, or accepted-source write occurred.

Requested configuration from the parent mission: GPT-6 Astra / Ultra. Actual runtime model and reasoning metadata are not exposed to this agent; no requested-versus-actual equality is claimed.
