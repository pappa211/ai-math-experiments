# Triangle restoration and closed-boundary deletion

## Abstract

For a finite simple graph G, let nu(G) be its maximum number of edge-disjoint triangles and tau(G) its minimum triangle edge-cover number. We study graphs obtained by restoring two edge-disjoint triangles to a remainder H. We give complete ordinary proofs of restoration when the full triangle hypergraph of H is tripartite and tight, when it has a packing-essential edge, and when H is flat without a tripartiteness assumption. We also prove an unbounded closed-boundary equality-deletion theorem and stability criterion, a mixed/shared-apex exact-two-apex bowtie theorem, and a parameterized compression preserving four exact optimization values. The exact-equality, essential-edge, and closed-boundary deductions have conditional Lean proofs with their published inputs explicit. The flat, mixed-bowtie, and compression results have complete audited ordinary proofs and are not Lean-formalized.

The unrestricted two-triangle restoration conjecture, OCT-five, and the proposed fixed c<3 density extension remain **UNPROVED**. None is a consequence of the scoped results here. Historical originality has not been established; the targeted source comparison found no exact predecessor for the restoration and boundary statements.

## 1. Conventions, published inputs, and contribution

All graphs are finite and simple. A triangle is an actual graph triangle, and a triangle component means connectedness under shared graph edges. Components may share graph vertices. For a triangle family F, nu(F) and tau(F) denote the corresponding packing and graph-edge-cover optimization values. D(H) is the **full** triangle hypergraph: its vertices are graph edges and its hyperedges are all H-triangles. Its tripartiteness means a three-labeling of graph edges rainbow on every triangle, and does not mean an ordinary vertex tripartition of H.

Let T1,T2 be edge-disjoint triangles of G, put H=G−(E(T1) union E(T2)), and set h=nu(H). Write Gi=H+E(Ti). The individual family Fi is D(Gi) minus D(H). A triangle using restored edges from both triangles belongs to neither individual family. The full new family includes these mixed triangles. For edge-disjoint triples, either their vertex sets are disjoint or they meet in exactly one vertex.

We use these published inputs:

- Aharoni's tripartite 3-uniform matching-cover bound, tau<=2nu. [Aharoni, Combinatorica 21 (2001), 1–4](https://doi.org/10.1007/s004930170001).
- The Haxell–Narins–Szabó equality/home-base theorem, Theorem 1.1, together with Definitions 7.1–7.4 and Proposition 7.5 for loose-cycle extraction. [HNS, JCTA 158 (2018), 492–547](https://doi.org/10.1016/j.jcta.2018.04.004), [author manuscript](https://page.mi.fu-berlin.de/szabo/PDF/ryser.pdf).
- Haxell–Kostochka–Thomassé's Theorem 2 for K4-free flat graphs: tau<=3nu/2, with equality triangle components five-wheels. The theorem does not require planarity despite the paper title. [HKT, Graphs and Combinatorics 28 (2012), 653–662](https://doi.org/10.1007/s00373-011-1071-9), [author manuscript](https://www.kostochk.web.illinois.edu/docs/accepted/plan-ht.pdf).
- Hall's finite matching theorem and König's finite bipartite matching/vertex-cover theorem. Their uses and concrete matching models are proved or described explicitly below.
- The Strong Perfect Graph Theorem, only for the cycle-page lemma in Section 6. [Chudnovsky–Robertson–Seymour–Thomas, Annals 164 (2006), 51–229](https://doi.org/10.4007/annals.2006.164.51).

The frozen TUZA-01 result proves one-triangle restoration conditionally in Lean. The two-triangle equality argument in Section 2 originated in a follow-up before TUZA-02, and is credited accordingly. Sections 3–4 develop TUZA-02 restoration deductions. Sections 5–6 develop TUZA-03 boundary and bowtie deductions; Section 7 records compression. The order follows mathematical dependencies rather than campaign chronology.

### 1.1 Graphical equality extraction and exhaustion

HNS supplies h disjoint loose three-cycles in a tripartite equality triangle hypergraph. Three graph triangles whose pairwise shared edges are distinct force a K4: two are abc and abd; a third meeting both away from ab is acd or bcd. Because the hypergraph is the full triangle family of an actual graph, the fourth face is also present. Disjoint hypergraph supports give edge-disjoint K4 blocks.

Suppose an additional triangle Q is not a face of any of these h blocks. It shares at most one edge with each block: two shared triangle edges would place all three vertices inside the complete block. Choose in each block a face avoiding that possible edge. The h chosen faces are mutually edge-disjoint and avoid Q, contradicting maximality of h. Thus all triangles are exactly the faces of the h edge-disjoint K4 blocks. Extra graph edges belonging to no triangle are harmless.

Only extraction is required for the boundary theorems in Section 5. Exhaustion is required by the free-page and some bowtie arguments. The Lean foundation retains the original explicit `HNSInput`, which packages published extraction and the graphical conversion; exhaustion itself is now proved as a new elementary deduction.

### 1.2 Elementary reductions

Appending T1,T2 to an H-packing gives nu(G)>=h+2. Adding their six edges to an H-cover gives tau(G)<=tau(H)+6. Hence slack at least two, tau(H)<=2h−2, settles restoration. When tau(H)<=2h, a packing increase of at least three also settles it. All later critical arguments retain full mixed-family bookkeeping.

## 2. Restoration from exact equality

**Exact statement.** If D(H) is 3-partite, tau(H)=2nu(H), and H is obtained by deleting two edge-disjoint triangles of G, then tau(G)<=2nu(G).


**Proof.** A maximum H-packing plus T1,T2 shows nu(G)>=h+2. A minimum H-cover plus the six restored edges shows tau(G)<=2h+6, settling nu(G)>=h+3. Assume nu(G)=h+2. Then nu(Gi)=h+1, since every Gi-packing can be appended by Tj, and Ti can be appended to an H-packing.

Ui=V(Ti) is independent in H. Each equality K4 meets Ui in at most one vertex, so choose its opposite face. The resulting fixed h-packing avoids all vertices of Ui. Every edge of a new triangle in Fi meets Ui, so it is compatible simultaneously with every Fi-packing. Thus nu(Fi)=1.

An edge-intersecting triangle family with no common edge is contained in the faces of one K4. Indeed choose abc,abd and a third triangle avoiding ab. The third is acd or bcd. A further triangle containing ab must then be abc or abd to meet the third; one avoiding ab is among acd,bcd. Such a family can be covered by any chosen K4 edge and its opposite edge. A family with a common edge has a one-edge cover.

If T1,T2 are vertex-disjoint, no triangle uses edges of both, and two two-edge covers suffice. In the bowtie case let T1=vab and T2=vcd. The only mixed triangles are vxy, where x in {a,b}, y in {c,d}, and xy is an H-edge. If both Fi have one-edge covers, use these and va,vb. If F1 needs two edges and F2 one, the K4 containing F1 has its fourth vertex outside {v,a,b,c,d}: vc and vd are absent from G1. Neither abc nor abd can be present in G1, because it would belong to F1 outside that K4. Thus each of c,d has at most one H-neighbor in {a,b}, so there are at most two mixed triangles. Include va or vb in a two-edge F1-cover so as to hit one mixed triangle; the one-edge F2-cover and one further edge cover the remainder. If both Fi need two edges, the cross edges have maximum degree one on both sides. They are a matching of size at most two; choose one endpoint on each side covering the matching, and the corresponding spokes in the two two-edge covers. Again four edges cover all new triangles. Add an old cover to obtain tau(G)<=2h+4.

**Critical audit points.** The proof never needs one maximum H-packing avoiding U1 union U2. The two separate compatible packings establish separate bounds on nu(Fi); the final operation is a cover union. The mixed list is exhaustive because two restored edges from different triangles must meet at their unique common vertex. The argument includes h=0.

## 3. Restoration with a packing-essential edge

**Precise core statement.** Assume D(H) is 3-partite, tau(H)=2h-1, and some e satisfies nu(H-e)=h-1. Then tau(G)<=2nu(G). If nu(G)=h+2, at least one individual Fi has tau(Fi)<=2.

**Broader report statement.** The explicit slack-one premise can be omitted: Aharoni on H-e gives tau(H)<=tau(H-e)+1<=2h-1. Slack at least two is immediate from the old cover plus six edges. Thus the proof establishes restoration whenever the tripartite remainder has any packing-essential edge. This broadening does not require the equality theorem.


**Free-page reconstruction.** Put e=xy, J=H-e, k=h-1. Cover deletion and Aharoni force 2h-2<=tau(J)<=2nu(J)=2h-2. Exhaustion gives k K4 blocks. A block contains at most one of x,y. If it contained x and touched two different e-pages through xw1,xw2, then yw1w2 would be a J-triangle sharing the block edge w1w2 but not a block face; exhaustion rules this out. It cannot touch an x-spoke and y-spoke because then it would contain x,y and the missing edge xy. Each block therefore touches at most one old e-page, in at most one edge. Cover that block by the touched edge and its opposite edge. If all e-pages touched blocks, these 2k edges would cover H, contradicting tau(H)=2k+1. Hence some page Q=xyw is edge-disjoint from every block.

**Hall classification reconstructed.** Restore a triangle on independent U={a,b,c}, with new family F. Let N_ab,N_bc,N_ca be page-apex sets. Different-base, different-apex pages are disjoint, and all other page pairs meet. Thus page packings correspond exactly to matchings between bases and apices. If tau(F)=3, every N is nonempty (otherwise the other two bases cover F), and no two N are the same singleton (their common spoke and the third base cover F). When nu(F)<=2, Hall's three-set criterion therefore fails only on all three sets: their total union has exactly two elements p,q. A graph apex occurs in one or three base sets, never exactly two. All sets are nonempty and no two are the same singleton, so both p and q occur in all three. F consists exactly of T plus its six pages on p,q.

**Apex-edge forcing reconstructed.** Suppose nu(H+T)<=h+1=k+2 and tau(F)=3. Faces of the k blocks avoiding U are compatible with all F, so nu(F)<=2 and the Hall classification applies. If pq is not an H-edge, Q meets U and {p,q} each in at most one vertex; thus Q contains at most one of the six old spokes. Choose two pages on different bases and at different apices avoiding this possible spoke. If the forbidden spoke is up, take the p-page on the base opposite u and any different q-base. The two pages, Q, and the k faces form k+3 triangles, a contradiction. Hence pq is an H-edge. If pq differs from e, at least two of pqu (u in U) avoid e; they are J-triangles sharing pq, hence faces of the same K4. That K4 would contain two independent U vertices, impossible. Therefore pq=e.

**Compatibility and finish.** As in A, only nu(G)=h+2 requires work. If either Fi has a two-edge cover, combine it with an old cover and all three edges of the other restored triangle, giving 2h+4. This covers mixed triangles because every triangle absent from Gi uses an edge of Tj. Otherwise both apex pairs are {x,y}. In the disjoint case abc,def use abx,acy,dex,dfy. In the bowtie case vab,vcd use abx,vay,cdy,vcx. These four triangles have disjoint edges. Each old block contains at most one of x,y, so its face avoiding those vertices avoids all four pages. This yields k+4=h+3 triangles, contradiction.

**Boundary.** Packing-essential means present in every maximum packing, equivalently nu(H-e)=h-1. It is not a property of minimum covers. The theorem does not classify arbitrary stable slack-one remainders.

## 4. Restoration from flat remainders

**Exact statement.** If every edge of H lies in at most two H-triangles, then restoring any two edge-disjoint triangles gives tau(G)<=2nu(G). No triangle-hypergraph tripartiteness is required.

The HKT Theorem 2 hypotheses and equality form stated in Section 1 were checked against the author manuscript. The flat theorem below has no planarity hypothesis.


**Structural reduction.** In a flat H every K4 is an isolated triangle component because each block edge already lies in two faces. Remove all such edge supports to get K4-free flat R. Parameters add over triangle components. HKT gives tau(H)<=2nu(H). At slack one, 1=2nu(R)-tau(R)>=nu(R)/2, so nu(R)=1 or 2. For nu(R)=1, tau(R)=1 and all triangles share an edge, which supports at most two triangles. For nu(R)=2, tau(R)=3 is equality in HKT and precisely one five-wheel remains. At slack zero R is triangle-free. No vertex-disjoint decomposition is asserted.

**Five-wheel augmentation, complete local check.** Let F be a single restored family with tau(F)=3 and independent terminals U. All page-apex sets are nonempty and each pair admits distinct representatives, by the cover argument in B. A five-wheel W retains packing number two after any one edge deletion: in the triangle-cycle of length five, a deleted spoke forbids two consecutive triangles and a deleted rim edge forbids one, leaving two nonadjacent available triangles.

If U meets W at most once, choose two pages on different bases and with different apices, one base avoiding the possible W-terminal. They consume at most one W-edge; append two surviving wheel triangles. If U meets W twice, these are nonadjacent rim vertices a,c; write U={a,b,c}, rim a,r,c,s,t, hub z, and b outside W. N_H(b) intersect V(W) is independent, since adjacent neighbors would create a nonwheel triangle sharing a W-edge. Consider the page sets B=N_ab and C=N_cb. If either has an outside-W apex, choose distinct representatives with at least one outside W: if C is the singleton containing the chosen B-apex, choose another B-apex and exchange the roles. This consumes at most one W-edge and the earlier argument applies.

Otherwise B,C lie inside W and are nonempty, not the same singleton. Their possible vertices are respectively {z,r,t} and {z,r,s}. Independence and absence of neighbors a,c force N_H(b) intersect W={r,s} or {r,t}; all other subsets make a set empty or make both the same singleton. By reflection take {r,s}. Then acz,abr,cbs,zst are four edge-disjoint triangles: their edge sets are {ac,az,cz}, {ab,ar,br}, {bc,cs,bs}, {zs,zt,st}. This verifies the exceptional packing explicitly.

**Book core.** Suppose the residual component has nu=tau=1 and other components are K4s. Choose block faces avoiding U. If nu(F)>=3, append three F-triangles. Otherwise B's Hall classification gives apices p,q. Flatness forces pq absent because otherwise pq lies in the three old triangles pqu. Any old book triangle Q therefore meets U and {p,q} each in at most one vertex, and has at most one page spoke. Two pages can avoid it as in B, and append Q. In both cases packing increases by at least two over H.

**Restoration conclusion.** In slack one, if nu(G)=h+2, each intermediate graph has packing h+1, so the augmentations force tau(Fi)<=2. Combine an old cover, one Fi-cover and the other restored triangle's three edges. At slack at least two the old cover plus six edges suffices. At slack zero all triangles are isolated K4 faces, and A's elementary four-edge new-family cover argument applies. Hence the full theorem uses HKT and elementary arguments; neither Aharoni nor HNS is needed.

**Additional content and redundancy.** The five-wheel augmentation is the substantive new local step; the book case under a tripartiteness hypothesis is already covered by B because a book spine is packing-essential. The flat result removes that tripartiteness requirement and covers the stable wheel core. Its slack-zero portion is the prior equality argument with K4 witnesses supplied directly by flatness/HKT. Do not count that portion as a new equality theorem.

## 5. Closed-boundary deletion and stability

### 5.1 Equality deletion

### Exact statement

Suppose D(H) is 3-partite, nu(H)=h, tau(H)=2h-1. Let U,P be disjoint independent graph-vertex sets, W=U union P. Assume that for every **actual H-edge** px with p in P and x outside W, at most one vertex of U is adjacent in H to both p and x. Let A be any subset of E_H(U,P), without any cardinality bound. If K=H-A has tau(K)=2nu(K), then H has a packing-essential edge. Consequently, if H is packing-edge-stable, every such A satisfies

    nu(H-A) >= h-floor(|A|/2).

Independence of P and the local uniqueness condition are both retained hypotheses; no theorem without them is asserted. The condition is not asserted automatically for the union of two restoration boundaries.

### Proof

Let L be all H-triangles absent from K. A triangle containing up in A cannot have its third vertex in U or P because both are independent. Thus every L-triangle is upx with u in U, p in P, x outside W, and it contains exactly one A-edge.

Write k=nu(K). In an equality K4 there are at most two W vertices, at most one from each independent side. If there are at most one, select a face avoiding W. Its edges have both endpoints outside W, whereas every edge in an L-triangle meets W. If there are two, call them u,p and write the block upxy. The edge up survives, hence is not in A. Select pxy. The edge xy cannot lie in L. If px lay in a lost triangle ptx, then t is in U and pt is in A. The actual edge px has both u and t as common U-neighbors, so t=u, contradicting that up survives. The same handles py. All chosen faces are mutually edge-disjoint because block supports are disjoint. This gives one fixed k-packing compatible with **every** L-triangle, not merely with separately chosen witnesses.

Partition L by its unique U vertex: L=disjoint union L_u. Distinct rows have disjoint edge supports. Edges meeting U identify their row directly. A common px edge in two rows would violate local uniqueness at px. For one row u, let B_u be the bipartite graph with parts P and outside vertices adjacent to u, and an edge px precisely for the triangle upx in L_u. Two L_u triangles conflict exactly when their B_u edges share an endpoint; hence nu(L_u) is the matching number of B_u. A vertex cover of B_u gives the triangle cover consisting of its u-spokes. Conversely, every rim edge px in a triangle cover can be replaced by up (or ux): within the row it covers only that single triangle. This produces a B_u vertex cover of no larger size. König gives tau(L_u)=nu(L_u); disjoint supports give tau(L)=nu(L).

The compatible k-packing and a maximum L-packing prove nu(H)>=k+nu(L). Conversely, splitting any H-packing into K and L portions proves the reverse inequality. Put d=h-k=nu(L). Monotonicity excludes d=0 because then tau(K)=2h>tau(H). Separately covering K and L yields

    2h-1 <= 2k+d,
    2d-1 <= d.

Thus d=1 and tau(L)=1. Take an edge g meeting all L-triangles. Every triangle of H-g belongs to K, so nu(H-g)<=k=h-1; deletion of one edge gives equality. This proves essentiality. For stable H equality in K is impossible, so Aharoni gives tau(K)<=2nu(K)-1. Together with tau(K)>=2h-1-|A| this yields the floor bound.

### 5.2 Companion stability criterion

### Exact statement

Assume D(H) is 3-partite and nu(H)=h. Let U,P,A satisfy exactly the independence and local boundary conditions above. Put K=H-A, and suppose

    nu(K)=h-d, tau(K)=2(h-d)-1.

Let L_A be the **full** family of H-triangles using A, including triangles that might also use an edge g considered later. If nu(L_A)>=d+2, then K is packing-edge-stable.

### Proof

If g were essential in K, then J=K-g has nu(J)=h-d-1. The one-edge cover-loss bound gives tau(J)>=2(h-d)-2, and Aharoni gives the reverse inequality. Thus J is equality. The face-selection proof in Section 5.1 applies to every J block with respect to the original H,U,P,A: a retained up is still outside A, and local uniqueness is a statement about H. It produces h-d-1 faces compatible with every L_A triangle, even if some L_A triangle uses g. Appending a (d+2)-packing from L_A gives h+1 H-triangles, contradiction.

This proof needs no hypothesis tau(H)=2h-1 and does not use the integrality of L_A.  A sufficient row condition is that at least d+2 U rows contain an A-edge lying in an H-triangle. Pick one triangle in each row; the row supports are disjoint by local uniqueness.

## 6. Mixed/shared-apex exact-two-apex bowties

### Exact statement

Let G be finite simple, T1=vab and T2=vcd edge-disjoint triangles sharing exactly v, and H=G-(E(T1) union E(T2)). Assume D(H) is 3-partite. For each i, the complete family of triangles in H+E(T_i) but not in H consists **exactly** of T_i and its six pages at two distinct vertices P_i adjacent to all three terminals. In particular there are no additional partial-apex pages. If P1 intersects P2, or if some G-triangle uses an edge of each T_i, then tau(G)<=2nu(G).

The second alternative is equivalent to an H-edge between {a,b} and {c,d}. This theorem does not settle vertex-disjoint restored triangles, disjoint-apex unmixed bowties, or arbitrary families of packing three.

### Critical reduction and necessary full-family bookkeeping

Let h=nu(H). Appending T1,T2 gives nu(G)>=h+2; adding their six edges to an H-cover gives tau(G)<=tau(H)+6. Slack at least two settles immediately. The slack-zero branch is Section 2. In a remaining counterexample,

    tau(H)=2h-1, nu(G)=h+2, tau(G)=2h+5.

Section 3 excludes essential edges of H. Each individual restoration must have actual cover increase three, since adding the other restored triangle's three edges completes a cover of G. This uses actual tau of intermediate graphs, not just the cover number of a chosen new-family subcollection.

The adjacent-apex lemma is independently proved as follows. For any terminal u, deleting its pair of spokes preserves tau(H), because those two spokes and the opposite base cover the individual new family at cost three. If pq were present, delete triangle upq. Aharoni and cover loss force equality with h-1 K4 blocks. The terminal set {u,p,q} is independent in the remainder, so choose one face avoiding it from each block, compatible with every lost triangle. The lost family has packing one, and contains pqa,pqb,pqc. A triangle not containing pq cannot meet all three in edges: it would need three edges of the bipartite graph between {p,q} and {a,b,c}, impossible. Thus all lost triangles contain pq, so pq is essential. This contradicts stable H. Therefore same-family apex pairs are nonadjacent.

All apices lie outside W0={v,a,b,c,d}; a terminal of the other restored triangle misses v in H. Exactness forces cross edges between {a,b} and {c,d} to form a matching: two with a common endpoint would create an additional partial-apex page for the other base. Consequently the full new family is the two individual families plus m mixed triangles, m=0,1,2. After relabeling their cross edges are ac and possibly bd. In the disjoint-apex case, exactness also forbids every extra terminal-apex edge outside the twelve specified spokes.

### Equality-extraction rule

If Q is a q-packing of G, all of its old edges lie in A, and B is a cover of **every** new triangle with A subset B and |B|=2q+1, then J=H-A satisfies

    nu(J)<=h+2-q,
    tau(J)>=tau(G)-|B|=2(h+2-q).

Aharoni forces equality. If the right side for packing is negative, Q itself already contradicts nu(G)=h+2. The A subset B requirement ensures that a J-cover plus B also covers old triangles destroyed by A. Equality exhaustion, not just extraction, is needed subsequently.

### Shared apices: all cases

Write P1={p,q}, P2={p,r}, allowing r=q. If m=0, the two row-v covers have union {vp,vq,vr,ab,cd} of size at most five. If r=q and m<=1, {vp,vq,ab,cd} plus the mixed edge has size at most five. These save one cover edge and settle.

For m=2 use

    Q = {vac,vbd,abq,cdr},
    A = {ac,bd,aq,bq,cr,dr,vp},
    B = A union {ab,cd}.

For m=1 and r distinct from q use

    Q = {vac,abq,cdr,vbp},
    A = {ac,aq,bq,cr,dr,vp,bp},
    B = A union {vb,cd}.

In each case Q is edge-disjoint, A contains all old edges of Q, and B covers the full new family. Equality gives h-2 blocks in J. All H-edges inside W0 were removed, so W0 is independent in J; choose each block's face avoiding W0. If r differs from q, the five-packing {vac,abp,vbq,cdp,vdr} uses only edges touching W0. If r=q in the m=2 case, use {vcp,vaq,vbd,abp,cdq}. These are compatible with all selected faces and give h+3 triangles, contradiction. Optional edges between apices affect only old triangles and do not invalidate either the new-family covers or these packings.

### Disjoint apices, two mixed triangles, at least one cross-apex edge

Write P1={p,q}, P2={r,s}, and relabel a present cross edge as pr. Use

    Q = {vpr,vac,vbd,abq,cds},
    A = {vp,vr,pr,ac,bd,aq,bq,cs,ds},
    B = A union {ab,cd}.

The first Q triangle is old, which is allowed. Equality gives h-3 blocks, and W0 is independent in J. Select faces avoiding W0. The six-packing {vpr,vac,abp,vbq,cdr,vds} is compatible: every edge touches W0 except pr, and pr was deleted. This contradicts critical packing.

### Common nine-cycle extraction and cross-apex matching

For m=1 or 2 use

    Q = {vac,abp,vbq,cdr,vds},
    A = {ac,ap,bp,bq,vq,cr,dr,ds,vs}.

The edge set A is the C9 in order a-p-b-q-v-s-d-r-c-a. For m=1 let B=A union {ab,cd}; for m=2 let B=A union {vb,cd}. The second choice hits vbd as well as the first restored base. Equality gives k=h-3 blocks in J.

If pr is present, vpr survives and forces a K4 vprx in J. Its fourth vertex is outside W={v,a,b,c,d,p,q,r,s}: the terminals miss v, q misses p, and s misses r. Suppose ps also exists. Swap r,s in the extraction, obtaining a K4 vpsy in H with y outside W. Returning to the original J removes exactly vs from that K4; vpy and psy survive and share py. Exhaustion forces them into one equality block, which would require missing edge vs. Contradiction. Exchanging families handles any shared endpoint, so the cross-apex graph is a matching of size at most two. This does not combine packings from distinct remainders; it combines two independently forced concrete subgraphs in H.

### C9-page lemma

Lemma. Let L have induced C9 on W, independent outside part X, and arbitrary W-X spokes, and assume nu(L)<=4. Then either tau(L)=nu(L), or its entire triangle family is a single full nine-wheel, with (nu,tau)=(4,5).

Proof. Represent the triangle family using its base edges and outside apices. Represent a triangle by (i,x), its cycle base and outside apex. Its intersection graph I has clique columns i, and adjacent columns are joined only between equal apex labels. The neighborhood of any vertex is the disjoint union of its same-column clique and at most two singletons. Hence no neighborhood contains an induced P3; this excludes odd antiholes of length at least seven, whose vertex neighborhoods contain P3.

Any induced cycle of I of length at least five must visit all nine columns. Otherwise the used columns form a proper connected interval. An endpoint column cannot contain one cycle vertex (it has at most one neighbor in the sole adjacent used column). If it contains two, they are consecutive, their other cycle neighbors lie in the next column and are distinct, and the edge between those neighbors is a chord unless the cycle has length four. A clique column cannot contain three vertices of an induced cycle of length at least four. Thus C5 and C7 are absent. An induced C9 uses one vertex per column and preserves its apex around the cycle, so it is a full nine-wheel. An odd hole of length at least eleven gives five independent vertices of I, hence a five-packing, contrary to nu(L)<=4.

If a full wheel at x exists together with a further page at y, remove that page's base from C9 and take a four-matching of the remaining eight-edge path. Its x-pages plus the y-page give a five-packing. Thus at nu(L)<=4 the full wheel must be the whole triangle family; it has (nu,tau)=(4,5), since every edge meets at most two of its nine pages and a five-spoke cover exists.

Without a wheel, SPGT applies (equivalently to the complement), so I partitions into alpha(I)=nu(L) cliques. Each clique has a common graph edge: a clique within one column has its base; a clique meeting two columns has exactly two vertices of the same apex and shares their joining spoke. There are no cliques spanning three columns. These common edges provide tau(L)<=nu(L). Therefore the stated dichotomy is correct. No computational evidence is needed for this lemma.

### Compatible faces and the remaining cases

For the C9 extraction let Fout be lost H-triangles with a third vertex outside W. The graph consisting only of A and their W-to-outside spokes has **full** triangle family Fout: its base is C9 and its outside part is independent. Outside-to-outside edges of H are intentionally omitted and play no role in this family model.

The retained J boundary contains vp,vr,aq,cs, all cross-apex edges, and possibly bd. The following compatibility checks are exhaustive except for the explicitly excluded qs or bd block:

- At most one W vertex: choose the face avoiding W.
- A block vprx: exactness prevents x adjoining a,b,c,d, because x already adjoins v. Choose prx. No Fout base is pr; possible conflicts on px or rx would require one of those forbidden terminal adjacencies.
- With pr absent, a block vpxy (or vrxy) has x,y outside W. Exactness again forbids their adjacency to all four non-v terminals. Choose pxy (or rxy). This is the repaired open-wedge case; omitting it would leave a real proof gap.
- A block aqxy has x,y outside W and neither touches v or b, by first-family exactness. Choose qxy. Its possible conflicts would require deleted bases qv or qb and hence a forbidden adjacency. The cs case is symmetric.

For m=1 and zero or one cross edge, H[W] has no lost internal triangle (the possible vpr survives). Every block is compatible, so nu(Fout)<=3. The page lemma gives tau(Fout)<=3 and hence tau(H)<=2k+3=2h-3, contradiction.

For m=1 and cross matching pr,qs, the only lost internal triangle is vqs. At most one equality block contains qs. If such a block exists, omit it to get nu(Fout)<=4. The exceptional pure wheel is impossible, because its outside apex would be adjacent to v,a,b and thus be an extra first-family apex. Therefore tau(Fout)<=4. A minimum J-cover can contain qs: choose qs and its opposite edge in that block and opposite pairs in all others. It also covers vqs. Total cover at most 2k+4=2h-2 contradicts slack one. If qs belongs to no block, all k faces are compatible, tau(Fout)<=3, and adding qs gives the same contradiction.

For m=2 and no cross-apex edge, H[W] is triangle-free. All lost triangles are Fout. Every equality block is compatible except possibly one containing bd. Omit it if present to obtain nu(Fout)<=4; the wheel is again excluded by exactness. A J-cover plus at most four Fout edges gives 2h-2, contradiction. If there is no exceptional block, the stronger three-packing bound is available.

These branches exhaust the theorem: shared apices; disjoint apices with m=2 and a cross edge; disjoint apices with m=1 and cross matching of size 0,1,2; disjoint apices with m=2 and no cross edge.

## 7. Exact parameterized compression

### Exact statement

Let H be finite simple, nu(H)=h, and nu(H-e)=h for every e in E(H). Add six absent edges forming two edge-disjoint triangles to obtain G; let S be their endpoints, |S|<=6. There exists a **subgraph**, not necessarily an induced subgraph, G' containing all added edges. With H' equal to G' minus those six edges,

    nu(G')=nu(G), tau(G')=tau(G),
    nu(H')=nu(H), tau(H')=tau(H),
    |V(G')| <= 6h²+3h+454.

H' remains packing-edge-stable. If D(H) is 3-partite, so is D(H'). More precisely, the nonisolated part of the old full triangle hypergraph is retained unchanged; deleted old graph edges are triangle-free hypergraph vertices. No claim of preserving the whole graph, induced structure, all covers, or all packings as literal subsets is made.

### Elementary proof

For an edge ab, use an h-packing avoiding ab, available by stability. Every page abx must meet this packing or could be appended. A packing triangle avoids ab and therefore contains at most one of a,b; it can meet at most two distinct pages via its incident edges at that endpoint. Hence every H-edge lies in at most 2h triangles.

Fix any maximum h-packing P. Every H-triangle meets one of its 3h edges. Counting incidences bounds the number of triangles by 6h². Every such triangle has at least two vertices in V(P), so the set A of all old-triangle vertices has size at most 3h+6h². This includes h=0, when A is empty.

Retain A union S. An outside vertex w belongs to no old triangle. Any G-triangle through w must use an added edge, which has both endpoints in S. Thus every edge incident to w except an edge to S lies in no G-triangle; remove all those edges. The remaining triangles through w are exactly pages wxy on added bases with x,y in its exact S-neighborhood. Classify outside vertices by that neighborhood. There are at most 2^6=64 types. Keep at most seven vertices per type, yielding

    |A|+|S|+7*64 <= 6h²+3h+454.

All old triangles survive, so both old optimization parameters remain equal. For any retained old edge e, its old triangle incidence is unchanged; an h-packing avoiding e still lies wholly within A. Hence old packing-edge stability is preserved, including retained triangle-free edges. Tripartiteness restricts directly.

Any G-packing has at most six new triangles, since each consumes a distinct one of the six added edges. It therefore uses at most six distinct outside vertices. Within each truncated type injectively relabel the used outside vertices to retained representatives, fixing A union S. Neighborhood equality preserves triangles; injectivity preserves graph-edge disjointness. This sends every G-packing to a G'-packing of the same size; the reverse inequality follows from subgraph inclusion.

For covers, take a minimum G'-cover C and any truncated type with seven retained vertices W_N. Let D_N be the added bases whose endpoints lie in its common neighborhood, |D_N|<=6. If some xy in D_N were absent from C, each of the seven pages wxy would require a distinct incident spoke wx or wy in C. Thus C has at least seven edges incident with W_N. Replace all C edges incident with W_N by D_N. No other triangle loses coverage, because every triangle using a W_N edge is one of its added-base pages. This yields a smaller cover, contradiction. Hence C contains every D_N, so the same C also covers all deleted vertices' pages. Therefore tau(G)<=tau(G'), and subgraph monotonicity gives equality.

## 8. Evidence, formal boundary, and open questions

### 8.1 Negative evidence and supporting computations

A wheel with five rim vertices and one hub has (nu,tau)=(2,3) and a tripartite full triangle hypergraph. Deleting its hub leaves no triangles. It refutes the proposed inequality tau(H)<=nu(H)+nu(H−U) for independent U. It does not refute restoration.

A central K4 with one, two, or three fresh K4 leaves on distinct edges of a central star has parameters (r+1,2r+1) and no packing-essential edge. These examples refute an overly small list of possible defective cores. The scoped restoration proofs for those three cores are retained as supporting TUZA-02 material.

The difference between individual and full incident families is substantive. Take K5 on 0,1,2,3,4 and add edges 15 and 35, with restored triangles 012 and 034. The remainder and restored graph have parameters (1,1) and (3,4). The full incident families have cover number three, but the individual restoration families each have cover number one. An enlarged-family formulation is therefore false.

The new verification replay regenerated all graph triangles and checked 35 recurrence certificates, the three star examples by a separate subset-enumeration implementation, their surviving packings after every single-edge deletion, and the family-definition example. An additional independent script checked 70 finite local packing/cover configurations used in the bowtie case proofs. These are named-certificate checks, not an exhaustive search over arbitrary graphs; the general theorems rest on their ordinary proofs.

### 8.2 Exact formal-verification boundary

<!-- FORMAL_BOUNDARY_START -->
| Result | Completed Lean declaration | Explicit external inputs |
|---|---|---|
| Full exact-equality restoration, including bowties | `Tuza.two_triangle_exact_equality` | `HNSInput` |
| Full essential-edge restoration, no slack premise | `Tuza.two_triangle_essential_edge_restoration` | `AharoniInput`, `HNSInput` |
| Stronger individual-family cover saving in the critical branch | `Tuza.two_triangle_essential_family_saving` | `AharoniInput`, `HNSInput` |
| Closed-boundary equality deletion, arbitrary A | `Tuza.closed_boundary_equality_deletion` | `AharoniInput`, `HNSInput`, `BipartiteKonigInput (Finset V)` |
| Stable boundary packing loss at most floor(|A|/2) | `Tuza.closed_boundary_packing_loss` | Same as equality deletion |
| General companion stability criterion | `Tuza.closed_boundary_stability` | `AharoniInput`, `HNSInput` |

`AharoniInput` states the tripartite full-graph triangle bound tau<=2nu. The frozen `HNSInput` states that a tripartite equality graph has nu edge-disjoint actual K4s; this interface includes the published home-base extraction and the ordinary graphical loose-cycle conversion inherited from TUZA-01. Those deep inputs and the conversion inside that frozen interface remain assumed in Lean. New equality exhaustion, face compatibility, mixed-family covers, Hall classification, free-page and apex arguments are proved.

`BipartiteKonigInput` is classical finite bipartite matching/vertex-cover equality, stated using an edge family of pairs between two disjoint vertex sides. It contains no triangle, boundary, or restoration conclusion. The conversion of the full lost triangle family to spoke pairs, injectivity, matching-to-triangle-packing compatibility including shared rim edges, and cover conversion are all proved in Lean.

All these declarations quantify over an actual finite `SimpleGraph V` and use `triangles G = G.cliqueFinset 3`. The extremal functions are actual packing/cover optima. The only transitive axioms reported are drawn from `propext`, `Classical.choice`, and `Quot.sound`. These axiom reports do not discharge the explicit published-input parameters.

Flat restoration, the mixed/shared-apex exact-two-apex bowtie theorem, compression, and the separate stable-four-spoke application are **not Lean-formalized** here. Their ordinary proof statuses are recorded separately. There is no Lean theorem for unrestricted restoration, OCT-five, or fixed c<3 density extension.
<!-- FORMAL_BOUNDARY_END -->

### 8.3 Significance and originality limits

The essential-edge and flat results give unbounded restoration classes. The five-wheel augmentation supplies content beyond the essential-edge branch. The closed-boundary theorem combines one simultaneous equality-block packing with an integral lost-family decomposition and applies without an order, packing-number, or deletion-size bound. The mixed/shared-apex result is a further genuine joint-restoration subclass, but exactness of both individual page families is indispensable.

Compression preserves nu and tau of both H and G, the six designated restored edges, the nonisolated part of the old full triangle hypergraph, and packing-edge stability. It does not bound h or reduce unrestricted restoration to one finite computation. Existing literature gives linear-size decision kernels for the individual edge-triangle packing and covering problems; this quadratic exact-preservation argument is not an improved kernel-size claim. [Sheng–Xiao, arXiv:2308.16515v1](https://arxiv.org/html/2308.16515v1).

A targeted primary-source review found no exact predecessor for the selected statements. This remains provisional evidence, not a priority claim or a specialist novelty assessment. HKT fractional stability has a tau* hypothesis and cannot be invoked from integer slack one. [HKT, European J. Combinatorics 33 (2012), 799–806](https://doi.org/10.1016/j.ejc.2011.09.024).

### 8.4 What remains open

Unrestricted two-triangle restoration remains **UNPROVED**, as do OCT-five and the proposed density extension for fixed c<3. The unresolved restoration remainder can be nonflat, packing-edge-stable, and of slack one. No upper bound on its defective packing number is known here. Bowties with disjoint apex pairs and no mixed triangle, and general individual families of packing three, are outside Section 6.

The boundary stability theorem does not create a new expensive restoration over its descendant. In the four-spoke application, four original spokes are removed; existence of a stable descendant is not an iterative proof. The stronger assertion deriving at least five active spokes uses additional structural dependencies not promoted to independently checked main results here.

## Attribution and provenance

This manuscript consolidates selected TUZA-02 and TUZA-03 research, preserving their distinct provenance records. The exact-equality extension is credited to the pre-TUZA-02 follow-up; TUZA-01 remains unchanged. Ordinary proof acceptance here means fresh reconstruction and adversarial checking during this verification, not external peer review. Published inputs and their authors are attributed above. New Lean declarations and proof files identify their precise mathematical scope. Third-party source manuscripts are cited, not redistributed in the publication tree.
