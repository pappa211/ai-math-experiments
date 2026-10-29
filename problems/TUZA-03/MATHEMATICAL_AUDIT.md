# Independent mathematical audit

## Decision and verification method

The six selected priority results survive fresh reconstruction at their exact written hypotheses: A exact equality; B essential edge; C flat remainder; D closed-boundary equality deletion and companion stability; E mixed/shared-apex exact-two-apex bowtie; F compression. These are accepted ordinary proofs using the published inputs stated below, not external peer review or certification of historical priority. No proof of unrestricted restoration, OCT-five, or fixed c<3 density extension was found or claimed.

The reconstruction reviewer independently rebuilt A–D and checked the star support. A separate adversarial reviewer independently rebuilt D–F and every E case, including the repaired open-wedge case and C9/SPGT lemma. The principal reviewer independently reconstructed the boundary and compression mechanisms, the equality argument, and the essential-edge free-page mechanism. A separate published-source reviewer checked exact statements and current primary-source comparisons. Previous campaign reviewer agreement was not counted as fresh verification. Separate Lean statement review checked the implementers' final definitions and theorem types.

The imported TUZA-02 source is the preserved remote TUZA-03 baseline: all 48 files matched prior hashes. No standalone remote TUZA-02 workspace was found. All selected proofs were read from actual source snapshots, not substituted by executive summaries. Current public TUZA-01 matched all 41 preserved publication files at commit 78462f29a64ef04714f0f2e42aaf42684057e7d9. All original imported files and snapshots are independently hash-checked at finalization.

## Scope decisions and unresolved obligations

- The HKT flat input is confirmed for K4-free flat graphs without planarity; its equality components are five-wheels. The conditional source concern in the reconstruction reviewer’s raw report is therefore discharged by the separate primary-source review.
- HNS is not a slack-one theorem. The frozen Lean HNSInput retains its explicit published extraction plus graphical conversion boundary. New graphical exhaustion is proved separately. D1/D2 in fact need extraction only, a sharper dependency than the conservative wording of some ordinary notes.
- Classical König is used only for finite bipartite graph matching and vertex cover. In Lean, the boundary triangle map, its injectivity, graph-edge disjointness including shared rims, and cover conversion are proved.
- The essential-edge broader statement does not need a slack-one premise: deletion and Aharoni first imply tau(H)<=2h−1, and slack at least two is elementary.
- Flat restoration has no triangle-tripartiteness premise. The wheel augmentation is the additional substantive step; its book/equality subcases are not separate novelty claims.
- E assumes each complete individual new family is exactly the seven specified triangles. The full family also includes mixed triangles. Every case is checked with that distinction retained.
- F preserves four optimization values and designated restored edges; it neither bounds h nor improves known linear decision-kernel sizes.
- Stable four-spoke descent with an explicit five-active-spoke premise is accepted. The full dependency chain deriving that premise in every reduced critical instance was not independently checked end-to-end and is excluded as a main theorem.
- Other archived structural claims are marked not independently checked, not silently accepted or declared false. Exact source locations and hashes are in THEOREM_INVENTORY.md.

## Fresh reconstruction report

# Fresh reconstruction of the restoration and closed-boundary arguments

Date: 29 October 2026. This review was conducted from the immutable verification snapshots, by a newly assigned mathematical reconstruction reviewer. The local constructions were reconstructed before reading the old TUZA-02 synthesis audit. Old agent agreement is not counted as new evidence. No Lean claims are made in this document.

## Scope and notation

All graphs are finite and simple. D(H) means the **full** family of graph triangles, with graph edges as hypervertices. A triangle packing is edge-disjoint; a triangle cover consists of graph edges. Write h=nu(H). Restored triangles T1,T2 are edge-disjoint and all six of their edges are absent from H. Their vertex triples can meet in zero or one vertex. Write Gi=H+E(Ti) and Fi=D(Gi) minus D(H). These are individual restoration families. Mixed triangles in G=H+E(T1)+E(T2) belong to neither Fi.

The inherited deep input is: a 3-partite full triangle hypergraph satisfies tau<=2nu (Aharoni); if equality holds, HNS and TUZA-01's graphical extraction supply h edge-disjoint K4s. I rechecked the elementary graphical extraction in the frozen manuscript: three graph triangles forming a loose hypergraph 3-cycle are uvx,uvy and either uxy or vxy, and their union is exactly K4. I did not independently reprove the published HNS theorem. Source verification belongs to the separate literature review.

A useful additional elementary deduction is **equality exhaustion**. If h edge-disjoint K4s exist and nu(H)=h, every H-triangle is a face of one of them. Otherwise it meets each block in at most one edge (two edges force all three vertices into that K4); choose in every block a face avoiding that edge and append the extra triangle. This gives h+1 triangles. Consequently equality blocks are isolated triangle components, despite possible shared graph vertices and arbitrary old triangle-free edges.

## A. Two-triangle exact-equality restoration

**Exact statement.** If D(H) is 3-partite, tau(H)=2nu(H), and H is obtained by deleting two edge-disjoint triangles of G, then tau(G)<=2nu(G).

**Status:** accepted ordinary proof, using the published inputs above. This is additional to the public TUZA-01 single-triangle theorem but pre-existed TUZA-02 in the supplied follow-up note. It must not be attributed as a TUZA-02 discovery. Historical novelty was not independently searched by this reviewer.

**Reconstruction.** A maximum H-packing plus T1,T2 shows nu(G)>=h+2. A minimum H-cover plus the six restored edges shows tau(G)<=2h+6, settling nu(G)>=h+3. Assume nu(G)=h+2. Then nu(Gi)=h+1, since every Gi-packing can be appended by Tj, and Ti can be appended to an H-packing.

Ui=V(Ti) is independent in H. Each equality K4 meets Ui in at most one vertex, so choose its opposite face. The resulting fixed h-packing avoids all vertices of Ui. Every edge of a new triangle in Fi meets Ui, so it is compatible simultaneously with every Fi-packing. Thus nu(Fi)=1.

An edge-intersecting triangle family with no common edge is contained in the faces of one K4. Indeed choose abc,abd and a third triangle avoiding ab. The third is acd or bcd. A further triangle containing ab must then be abc or abd to meet the third; one avoiding ab is among acd,bcd. Such a family can be covered by any chosen K4 edge and its opposite edge. A family with a common edge has a one-edge cover.

If T1,T2 are vertex-disjoint, no triangle uses edges of both, and two two-edge covers suffice. In the bowtie case let T1=vab and T2=vcd. The only mixed triangles are vxy, where x in {a,b}, y in {c,d}, and xy is an H-edge. If both Fi have one-edge covers, use these and va,vb. If F1 needs two edges and F2 one, the K4 containing F1 has its fourth vertex outside {v,a,b,c,d}: vc and vd are absent from G1. Neither abc nor abd can be present in G1, because it would belong to F1 outside that K4. Thus each of c,d has at most one H-neighbor in {a,b}, so there are at most two mixed triangles. Include va or vb in a two-edge F1-cover so as to hit one mixed triangle; the one-edge F2-cover and one further edge cover the remainder. If both Fi need two edges, the cross edges have maximum degree one on both sides. They are a matching of size at most two; choose one endpoint on each side covering the matching, and the corresponding spokes in the two two-edge covers. Again four edges cover all new triangles. Add an old cover to obtain tau(G)<=2h+4.

**Critical audit points.** The proof never needs one maximum H-packing avoiding U1 union U2. The two separate compatible packings establish separate bounds on nu(Fi); the final operation is a cover union. The mixed list is exhaustive because two restored edges from different triangles must meet at their unique common vertex. The argument includes h=0.

## B. Packing-essential-edge restoration

**Precise core statement.** Assume D(H) is 3-partite, tau(H)=2h-1, and some e satisfies nu(H-e)=h-1. Then tau(G)<=2nu(G). If nu(G)=h+2, at least one individual Fi has tau(Fi)<=2.

**Broader report statement.** The explicit slack-one premise can be omitted: Aharoni on H-e gives tau(H)<=tau(H-e)+1<=2h-1. Slack at least two is immediate from the old cover plus six edges. Thus the proof establishes restoration whenever the tripartite remainder has any packing-essential edge. This broadening does not require the equality theorem.

**Status:** accepted ordinary proof using Aharoni, the inherited equality extraction, and finite Hall matching. No new project lemma is silently assumed.

**Free-page reconstruction.** Put e=xy, J=H-e, k=h-1. Cover deletion and Aharoni force 2h-2<=tau(J)<=2nu(J)=2h-2. Exhaustion gives k K4 blocks. A block contains at most one of x,y. If it contained x and touched two different e-pages through xw1,xw2, then yw1w2 would be a J-triangle sharing the block edge w1w2 but not a block face; exhaustion rules this out. It cannot touch an x-spoke and y-spoke because then it would contain x,y and the missing edge xy. Each block therefore touches at most one old e-page, in at most one edge. Cover that block by the touched edge and its opposite edge. If all e-pages touched blocks, these 2k edges would cover H, contradicting tau(H)=2k+1. Hence some page Q=xyw is edge-disjoint from every block.

**Hall classification reconstructed.** Restore a triangle on independent U={a,b,c}, with new family F. Let N_ab,N_bc,N_ca be page-apex sets. Different-base, different-apex pages are disjoint, and all other page pairs meet. Thus page packings correspond exactly to matchings between bases and apices. If tau(F)=3, every N is nonempty (otherwise the other two bases cover F), and no two N are the same singleton (their common spoke and the third base cover F). When nu(F)<=2, Hall's three-set criterion therefore fails only on all three sets: their total union has exactly two elements p,q. A graph apex occurs in one or three base sets, never exactly two. All sets are nonempty and no two are the same singleton, so both p and q occur in all three. F consists exactly of T plus its six pages on p,q.

**Apex-edge forcing reconstructed.** Suppose nu(H+T)<=h+1=k+2 and tau(F)=3. Faces of the k blocks avoiding U are compatible with all F, so nu(F)<=2 and the Hall classification applies. If pq is not an H-edge, Q meets U and {p,q} each in at most one vertex; thus Q contains at most one of the six old spokes. Choose two pages on different bases and at different apices avoiding this possible spoke. If the forbidden spoke is up, take the p-page on the base opposite u and any different q-base. The two pages, Q, and the k faces form k+3 triangles, a contradiction. Hence pq is an H-edge. If pq differs from e, at least two of pqu (u in U) avoid e; they are J-triangles sharing pq, hence faces of the same K4. That K4 would contain two independent U vertices, impossible. Therefore pq=e.

**Compatibility and finish.** As in A, only nu(G)=h+2 requires work. If either Fi has a two-edge cover, combine it with an old cover and all three edges of the other restored triangle, giving 2h+4. This covers mixed triangles because every triangle absent from Gi uses an edge of Tj. Otherwise both apex pairs are {x,y}. In the disjoint case abc,def use abx,acy,dex,dfy. In the bowtie case vab,vcd use abx,vay,cdy,vcx. These four triangles have disjoint edges. Each old block contains at most one of x,y, so its face avoiding those vertices avoids all four pages. This yields k+4=h+3 triangles, contradiction.

**Boundary.** Packing-essential means present in every maximum packing, equivalently nu(H-e)=h-1. It is not a property of minimum covers. The theorem does not classify arbitrary stable slack-one remainders.

## C. Full flat-remainder restoration

**Exact statement.** If every edge of H lies in at most two H-triangles, then restoring any two edge-disjoint triangles gives tau(G)<=2nu(G). No triangle-hypergraph tripartiteness is required.

**Imported input requiring separate source confirmation:** Haxell–Kostochka–Thomasse, *Packing and Covering Triangles in K4-free Planar Graphs*, Theorem 2: all K4-free flat graphs satisfy tau<=3nu/2, with equality triangle components five-wheels (equivalently their triangle-intersection graph is a disjoint union of C5s). The paper title alone is not the hypothesis. The separate literature reviewer must confirm the nonplanar scope and equality form.

**Status:** elementary deduction accepted, conditional only on that exact published input being verified; no gap found in the new five-wheel argument. The complete flat theorem is stronger in hypotheses than merely applying B to tripartite flat H.

**Structural reduction.** In a flat H every K4 is an isolated triangle component because each block edge already lies in two faces. Remove all such edge supports to get K4-free flat R. Parameters add over triangle components. HKT gives tau(H)<=2nu(H). At slack one, 1=2nu(R)-tau(R)>=nu(R)/2, so nu(R)=1 or 2. For nu(R)=1, tau(R)=1 and all triangles share an edge, which supports at most two triangles. For nu(R)=2, tau(R)=3 is equality in HKT and precisely one five-wheel remains. At slack zero R is triangle-free. No vertex-disjoint decomposition is asserted.

**Five-wheel augmentation, complete local check.** Let F be a single restored family with tau(F)=3 and independent terminals U. All page-apex sets are nonempty and each pair admits distinct representatives, by the cover argument in B. A five-wheel W retains packing number two after any one edge deletion: in the triangle-cycle of length five, a deleted spoke forbids two consecutive triangles and a deleted rim edge forbids one, leaving two nonadjacent available triangles.

If U meets W at most once, choose two pages on different bases and with different apices, one base avoiding the possible W-terminal. They consume at most one W-edge; append two surviving wheel triangles. If U meets W twice, these are nonadjacent rim vertices a,c; write U={a,b,c}, rim a,r,c,s,t, hub z, and b outside W. N_H(b) intersect V(W) is independent, since adjacent neighbors would create a nonwheel triangle sharing a W-edge. Consider the page sets B=N_ab and C=N_cb. If either has an outside-W apex, choose distinct representatives with at least one outside W: if C is the singleton containing the chosen B-apex, choose another B-apex and exchange the roles. This consumes at most one W-edge and the earlier argument applies.

Otherwise B,C lie inside W and are nonempty, not the same singleton. Their possible vertices are respectively {z,r,t} and {z,r,s}. Independence and absence of neighbors a,c force N_H(b) intersect W={r,s} or {r,t}; all other subsets make a set empty or make both the same singleton. By reflection take {r,s}. Then acz,abr,cbs,zst are four edge-disjoint triangles: their edge sets are {ac,az,cz}, {ab,ar,br}, {bc,cs,bs}, {zs,zt,st}. This verifies the exceptional packing explicitly.

**Book core.** Suppose the residual component has nu=tau=1 and other components are K4s. Choose block faces avoiding U. If nu(F)>=3, append three F-triangles. Otherwise B's Hall classification gives apices p,q. Flatness forces pq absent because otherwise pq lies in the three old triangles pqu. Any old book triangle Q therefore meets U and {p,q} each in at most one vertex, and has at most one page spoke. Two pages can avoid it as in B, and append Q. In both cases packing increases by at least two over H.

**Restoration conclusion.** In slack one, if nu(G)=h+2, each intermediate graph has packing h+1, so the augmentations force tau(Fi)<=2. Combine an old cover, one Fi-cover and the other restored triangle's three edges. At slack at least two the old cover plus six edges suffices. At slack zero all triangles are isolated K4 faces, and A's elementary four-edge new-family cover argument applies. Hence the full theorem uses HKT and elementary arguments; neither Aharoni nor HNS is needed.

**Additional content and redundancy.** The five-wheel augmentation is the substantive new local step; the book case under a tripartiteness hypothesis is already covered by B because a book spine is packing-essential. The flat result removes that tripartiteness requirement and covers the stable wheel core. Its slack-zero portion is the prior equality argument with K4 witnesses supplied directly by flatness/HKT. Do not count that portion as a new equality theorem.

## D. Closed-boundary equality deletion and stability

**Exact equality-deletion statement.** Suppose D(H) is 3-partite and tau(H)=2h-1. Let U,P be disjoint independent vertex sets, W=U union P. For every actual H-edge px with p in P and x outside W require at most one common U-neighbor of p,x. Let A be any subset of the existing U-P edges and K=H-A. If tau(K)=2nu(K), then H has a packing-essential edge. Neither |A| nor h nor graph order is bounded.

**Status:** accepted ordinary proof using Aharoni, equality extraction/exhaustion, and König's finite bipartite matching-cover theorem. This reviewer independently checked all steps, including the actual-edge restriction and the companion general stability criterion.

**Lost family and simultaneous faces.** Let L=D(H) minus D(K). Every lost triangle is upx with u in U, p in P and x outside W, and uses exactly one A-edge, since U,P are independent. Write k=nu(K) and choose its equality K4 blocks. A block meets W in at most two vertices. With at most one, choose the face outside W; its edges cannot occur in L because each L triangle has only one outside vertex. With two the block is {u,p,x,y}, up is retained, and choose pxy. Edge xy is impossible in L. If px belonged to some lost triangle pxt, then t in U and pt in A; but u is already a common U-neighbor of p,x, so uniqueness implies t=u, contradicting retention of up. Similarly for py. Hence one selected face per block is simultaneously compatible with every L triangle. This is stronger than choosing faces separately for a particular L-packing.

**König step.** Partition L by terminal u. Different rows have disjoint edge supports: up and ux identify u, and a shared px would violate the common-neighbor condition at that actual edge. For fixed u, construct a bipartite graph Bu with sides P and the outside neighbors of u; edge px is present precisely for triangle upx in L. Triangle packings in the row are matchings of Bu. A vertex cover gives a triangle cover by the u-spokes. Conversely any triangle-cover rim edge px can be replaced by one of up,ux without increasing size, because it covers only its own row triangle. Thus the row cover number equals the vertex-cover number of Bu, and König gives tau(Lu)=nu(Lu). Disjoint supports allow summation: tau(L)=nu(L).

**Slack arithmetic.** The compatible faces give h>=k+nu(L); splitting any H-packing into retained and lost triangles gives h<=k+nu(L). Let d=h-k=nu(L). Monotonicity of cover number rules out d=0, since tau(K)=2h would exceed tau(H)=2h-1. Union of covers gives 2h-1<=2k+d, hence d<=1. Therefore d=1 and L has a common edge g. Every H-g triangle is retained, so nu(H-g)<=k=h-1; single-edge deletion lowers a packing by at most one, proving essentiality.

If H is packing-edge-stable, no such K can be equality. Aharoni and integrality give tau(K)<=2nu(K)-1, while edge deletion gives tau(K)>=2h-1-|A|. Hence nu(K)>=h-floor(|A|/2).

**Companion stability criterion.** Under the same boundary conditions suppose K=H-A satisfies nu(K)=h-d and tau(K)=2nu(K)-1. Let L_A be the full H-triangle family using A, including triangles that use any subsequent edge g. If nu(L_A)>=d+2, then K is stable. Otherwise essential g gives equality J=K-g with h-d-1 blocks. The preceding face construction applies to J and the original full L_A: retained up edges are not in A, and no step assumes a lost triangle avoids g. Append d+2 disjoint lost triangles to those faces to obtain h+1 H-triangles, contradiction. Different terminal rows have disjoint supports, so d+2 nonempty rows suffice.

**Exact-two-apex application.** If U has three terminals and its individual new family is exactly the two-apex family on nonadjacent p,q, the boundary hypothesis holds automatically: an outside vertex x adjacent to two U vertices would be a third page apex. This is not automatic for a union of two restoration boundaries. For compatible pages abp and bcq delete their four old spokes A={ap,bp,bq,cq}. If the actual intermediate graph has parameters (h+1,2h+2), appending those pages gives nu(H-A)<=h-1; A union {ac} covers the entire new family, giving tau(H-A)>=2h-3. Aharoni and stable equality exclusion force (nu,tau)=(h-1,2h-3).

The stronger existence of a stable descendant additionally uses the five-active-spoke footprint theorem. Its short six-spoke counting step checks, but its arbitrary-pair-deletion classification is outside this review's complete dependency audit. Therefore the general companion criterion and the four-spoke slack-one conclusion are accepted here; the full stable-descent application must inherit a separate explicit status for that extra dependency. Stability alone does not let the damaged restoration family be reused in an induction.

## Supporting results and exclusions

The single-defective-component reduction in TUZA-02 is accepted: triangle components have disjoint edge supports; their full graph triangle families are exactly their defining components; Aharoni gives nonnegative integer slacks adding to one; equality exhaustion makes every zero-slack connected component one K4. This gives no bound on the defective component's order.

The three K4-star proofs were also read and their displayed local packings checked. The avoidance exception is precisely when a central forbidden edge and a leaf forbidden edge are both opposite the attachment vertex. The three-page repair listed in the source is disjoint from its d-1 old faces. The all-three-terminals cases exhaust independent triples in the triangle cactus. No gap was found, but these remain supporting restricted cores, not a classification.

This reviewer has not completed an independent proof audit of the mixed/shared-apex bowtie theorem, the parameterized compression theorem, every two-edge-deletion dependency, or every TUZA-03 structural lemma. They must not inherit acceptance merely from this report. No unrestricted two-triangle theorem, OCT-five result, or fixed c<3 density result is proved here. No novelty priority claim is made.

## Recommended formalization boundary

A's finite covering argument is a natural next deduction over TUZA-01's explicit Aharoni/HNS hypotheses, but formalization must prove the stronger intersecting-family K4 classification and all mixed bowtie cases. B requires actual new work for free-page existence, Hall classification, and apex compatibility; none should become opaque project-specific inputs. D requires a full graph lost-family model, row edge-disjointness, the bipartite cone equivalence, simultaneous face selection, and the slack argument. Formalizing only the last arithmetic inference should be labelled a partial lemma, not a verification of D. C can take the precise published HKT theorem as input, but the wheel augmentation and flat graph-to-component deductions must be proved if C itself is claimed Lean-verified.


# Fresh adversarial report

# Fresh adversarial reconstruction: closed boundaries, mixed bowties, compression

Date: 29 October 2026. This review was performed afresh from the frozen proof files, without using the earlier reviewers' acceptance as evidence. All source reads, the independent witness checker, and this report are in the remote verification workspace. No original source was modified. This report distinguishes a fresh proof reconstruction from external certification and from Lean checking.

## Verdict and scope

1. **Closed-boundary equality deletion: accepted ordinary proof**, subject to the separately audited graphical equality extraction/exhaustion theorem and the published Aharoni and König inputs. Its unbounded scope and its actual-edge local boundary hypothesis survive review exactly as written.
2. **General companion stability criterion: accepted ordinary proof**, subject to Aharoni and graphical equality extraction/exhaustion. It does not need König and does not need a slack-one hypothesis on H itself. This is a particularly suitable separate Lean target.
3. **Stable four-spoke application: the final deduction is verified, but its five-active-spoke premise has an additional project-specific dependency chain.** The clean standalone version with “at least five active spokes” as an explicit hypothesis is proved below. Do not represent this review alone as independently closing the entire pair-deletion/HKT-structure chain used to deduce that premise in reduced critical instances.
4. **Mixed/shared-apex exact-two-apex bowtie theorem: accepted ordinary proof relative to independently verified TUZA-02 exact-equality and essential-edge restoration branches.** Every new TUZA-03 case and the C9 page lemma was reconstructed in this review. The exact full individual-family hypotheses are essential. No defect was found in the final repaired versions.
5. **Parameterized compression: accepted complete elementary ordinary proof.** It does not use tripartiteness, HNS, HKT, SPGT, or a slack-one assumption. The four claimed optimization parameters and old packing-edge stability are preserved, with the stated bound.

No selected theorem is claimed Lean-verified by this report. Historical novelty needs the separate literature review. The strongest substantive contribution in this scope is the closed-boundary compatibility/integrality mechanism; the mixed bowtie theorem is also a nontrivial joint-restoration result. Compression is useful rigorous infrastructure, with a deliberately loose bound, rather than evidence of a bounded unrestricted search.

## Conventions and the common imported equality input

All graphs are finite simple graphs. A triangle packing is a set of pairwise graph-edge-disjoint triangles; tau is the minimum number of graph edges meeting all graph triangles. For a triangle subfamily L, nu(L) and tau(L) mean those same optimization problems restricted to L. The full triangle hypergraph has vertex set E(H) and one hyperedge for every actual H-triangle. “3-partite” refers to this hypergraph, not to a 3-partition of the graph vertices.

The equality input used below is: if D(J) is 3-partite and tau(J)=2nu(J)=2k, its complete nonempty triangle family is precisely the four faces of each of k K4 blocks with pairwise disjoint edge supports. This consists of the published HNS input plus the project's graphical extraction and exhaustion deduction. The present review uses that exact statement; checking its published-source fidelity and TUZA-01 boundary is assigned separately. A collection of selected K4 witnesses without exhaustion would be insufficient for several bowtie arguments.

Subgraphs obtained by deleting graph edges retain tripartiteness of their full triangle hypergraphs. One edge deletion lowers either packing or covering number by at most one. Covers and packings of different triangle components add because components are defined using shared graph edges.

## D1. Closed-boundary equality deletion

### Exact statement

Suppose D(H) is 3-partite, nu(H)=h, tau(H)=2h-1. Let U,P be disjoint independent graph-vertex sets, W=U union P. Assume that for every **actual H-edge** px with p in P and x outside W, at most one vertex of U is adjacent in H to both p and x. Let A be any subset of E_H(U,P), without any cardinality bound. If K=H-A has tau(K)=2nu(K), then H has a packing-essential edge. Consequently, if H is packing-edge-stable, every such A satisfies

    nu(H-A) >= h-floor(|A|/2).

Neither independence of P nor the local uniqueness hypothesis may be discarded. The condition is not asserted automatically for the union of two restoration boundaries.

### Independent reconstruction

Let L be all H-triangles absent from K. A triangle containing up in A cannot have its third vertex in U or P because both are independent. Thus every L-triangle is upx with u in U, p in P, x outside W, and it contains exactly one A-edge.

Write k=nu(K). In an equality K4 there are at most two W vertices, at most one from each independent side. If there are at most one, select a face avoiding W. Its edges have both endpoints outside W, whereas every edge in an L-triangle meets W. If there are two, call them u,p and write the block upxy. The edge up survives, hence is not in A. Select pxy. The edge xy cannot lie in L. If px lay in a lost triangle ptx, then t is in U and pt is in A. The actual edge px has both u and t as common U-neighbors, so t=u, contradicting that up survives. The same handles py. All chosen faces are mutually edge-disjoint because block supports are disjoint. This gives one fixed k-packing compatible with **every** L-triangle, not merely with separately chosen witnesses.

Partition L by its unique U vertex: L=disjoint union L_u. Distinct rows have disjoint edge supports. Edges meeting U identify their row directly. A common px edge in two rows would violate local uniqueness at px. For one row u, let B_u be the bipartite graph with parts P and outside vertices adjacent to u, and an edge px precisely for the triangle upx in L_u. Two L_u triangles conflict exactly when their B_u edges share an endpoint; hence nu(L_u) is the matching number of B_u. A vertex cover of B_u gives the triangle cover consisting of its u-spokes. Conversely, every rim edge px in a triangle cover can be replaced by up (or ux): within the row it covers only that single triangle. This produces a B_u vertex cover of no larger size. König gives tau(L_u)=nu(L_u); disjoint supports give tau(L)=nu(L).

The compatible k-packing and a maximum L-packing prove nu(H)>=k+nu(L). Conversely, splitting any H-packing into K and L portions proves the reverse inequality. Put d=h-k=nu(L). Monotonicity excludes d=0 because then tau(K)=2h>tau(H). Separately covering K and L yields

    2h-1 <= 2k+d,
    2d-1 <= d.

Thus d=1 and tau(L)=1. Take an edge g meeting all L-triangles. Every triangle of H-g belongs to K, so nu(H-g)<=k=h-1; deletion of one edge gives equality. This proves essentiality. For stable H equality in K is impossible, so Aharoni gives tau(K)<=2nu(K)-1. Together with tau(K)>=2h-1-|A| this yields the floor bound.

### Adversarial checks

- The K4 choices are simultaneous and use only the stated actual-edge uniqueness. No global outside-neighborhood hypothesis is smuggled in.
- Triangles using an A-edge have exactly one outside vertex; this is why the face avoiding W works.
- The cover integrality is a bipartite-cone theorem at every packing number. There is no hidden bounded-order, small-packing, or SPGT restriction.
- The edge g covering L need not belong to A. The argument needs only containment of the triangles of H-g in K, not equality of those triangle families.
- The theorem does not say every deletion loses at most one packed triangle; the bound is floor(|A|/2).

Source: `snapshots/TUZA-03/rigidity/CLOSED_BIPARTITE_BOUNDARY_EQUALITY_DELETION.md`.

## D2. General companion stability criterion

### Exact statement

Assume D(H) is 3-partite and nu(H)=h. Let U,P,A satisfy exactly the independence and local boundary conditions above. Put K=H-A, and suppose

    nu(K)=h-d, tau(K)=2(h-d)-1.

Let L_A be the **full** family of H-triangles using A, including triangles that might also use an edge g considered later. If nu(L_A)>=d+2, then K is packing-edge-stable.

### Proof reconstructed

If g were essential in K, then J=K-g has nu(J)=h-d-1. The one-edge cover-loss bound gives tau(J)>=2(h-d)-2, and Aharoni gives the reverse inequality. Thus J is equality. The face-selection proof in D1 applies to every J block with respect to the original H,U,P,A: a retained up is still outside A, and local uniqueness is a statement about H. It produces h-d-1 faces compatible with every L_A triangle, even if some L_A triangle uses g. Appending a (d+2)-packing from L_A gives h+1 H-triangles, contradiction.

This proof needs no hypothesis tau(H)=2h-1 and does not use the integrality of L_A. A theorem implementation should preserve those features. A sufficient row condition is that at least d+2 U rows contain an A-edge lying in an H-triangle. Pick one triangle in each row; the row supports are disjoint by local uniqueness.

### Four-spoke corollary and its boundary

Suppose additionally H is stable slack one, restoring abc has exactly two universal apices p,q with pq absent, and the restored graph has parameters (h+1,2h+2). Exactness gives the boundary condition for U={a,b,c}, P={p,q}: any outside vertex adjacent to two terminals would itself be an additional page apex.

Two compatible pages on different bases and different apices use a four-spoke path A. Those pages append to any H-A packing, giving nu(H-A)<=h-1. A plus the unused base edge covers the entire individual new family and all old triangles destroyed by A, giving tau(H-A)>=2h-3. Aharoni forces packing h-1 and cover 2h-3 or 2h-2; D1 excludes equality, so the descendant is slack one.

If at least five spokes are active in H, choose A with an active deleted spoke in every terminal row. With six active spokes any four-spoke path works. With exactly five, make the deficient row the middle: if ap is inactive, use pages abp and acq, so A={ap,bp,aq,cq}; aq,bp,cq are active. Three nonempty rows give nu(L_A)>=3. Apply D2 with d=1 to obtain stability.

The proof that reduced critical instances have at least five active spokes additionally uses `EXPENSIVE_FAMILY_DEFECT_FOOTPRINT.md`, its cover-excluded pair avoidance theorem, and the pair-deletion structural classification. I read the five-active-spoke deduction and the pair-deletion file; the final counting and augmentation deduction is sound given pair avoidance. I have not independently reconstructed every dependency of the pair-deletion classification, in particular its cover-excluded stability and HKT edge-gluing classification. Therefore the general criterion and the explicitly five-active-spoke corollary are fully reconstructed here; the reduction to that premise must be cited to its own audited chain or left conditional in a consolidated account. No iteration follows: deleting A damages the expensive family, and no replacement expensive family is supplied.

Source: `snapshots/TUZA-03/proof/CLOSED_BOUNDARY_DESCENT_STABILITY.md`.

## E. Exact-two-apex mixed/shared bowtie

### Exact statement

Let G be finite simple, T1=vab and T2=vcd edge-disjoint triangles sharing exactly v, and H=G-(E(T1) union E(T2)). Assume D(H) is 3-partite. For each i, the complete family of triangles in H+E(T_i) but not in H consists **exactly** of T_i and its six pages at two distinct vertices P_i adjacent to all three terminals. In particular there are no additional partial-apex pages. If P1 intersects P2, or if some G-triangle uses an edge of each T_i, then tau(G)<=2nu(G).

The second alternative is equivalent to an H-edge between {a,b} and {c,d}. This theorem does not settle vertex-disjoint restored triangles, disjoint-apex unmixed bowties, or arbitrary families of packing three.

### Critical reduction and necessary full-family bookkeeping

Let h=nu(H). Appending T1,T2 gives nu(G)>=h+2; adding their six edges to an H-cover gives tau(G)<=tau(H)+6. Slack at least two settles immediately. The slack-zero branch is the separately audited TUZA-02 exact-equality restoration theorem. In a remaining counterexample,

    tau(H)=2h-1, nu(G)=h+2, tau(G)=2h+5.

The TUZA-02 essential-edge theorem excludes essential edges of H. Each individual restoration must have actual cover increase three, since adding the other restored triangle's three edges completes a cover of G. This uses actual tau of intermediate graphs, not just the cover number of a chosen new-family subcollection.

The adjacent-apex lemma is independently reconstructed as follows. For any terminal u, deleting its pair of spokes preserves tau(H), because those two spokes and the opposite base cover the individual new family at cost three. If pq were present, delete triangle upq. Aharoni and cover loss force equality with h-1 K4 blocks. The terminal set {u,p,q} is independent in the remainder, so choose one face avoiding it from each block, compatible with every lost triangle. The lost family has packing one, and contains pqa,pqb,pqc. A triangle not containing pq cannot meet all three in edges: it would need three edges of the bipartite graph between {p,q} and {a,b,c}, impossible. Thus all lost triangles contain pq, so pq is essential. This contradicts stable H. Therefore same-family apex pairs are nonadjacent.

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

### C9-page lemma reconstructed

Let L have induced C9 on W, independent outside part X, and arbitrary W-X spokes. Represent a triangle by (i,x), its cycle base and outside apex. Its intersection graph I has clique columns i, and adjacent columns are joined only between equal apex labels. The neighborhood of any vertex is the disjoint union of its same-column clique and at most two singletons. Hence no neighborhood contains an induced P3; this excludes odd antiholes of length at least seven, whose vertex neighborhoods contain P3.

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

### Independent finite witness checks

`/scripts/check_bowtie_witnesses.py` enumerates local graph triangles directly from edge sets, then checks every displayed packing, containment of its old footprint in A, the relation |B|=2|Q|+1, and coverage of the complete new triangle family. It checks 70 cases, varying all optional local apex-only edges in the shared-apex branches and all cross-apex subsets in the disjoint branches. All passed. Results: `certificates/bowtie_witness_checks.json`.

This is a check of finite witness lists only. It is not an exhaustive test of arbitrary remainders and does not replace the equality, compatibility, or C9 proofs. Execution was remote; no Lean build or heavyweight search was run.

Primary source: `snapshots/TUZA-03/proof/MIXED_TWO_APEX_BOWTIE_THEOREM.md`. Constituent files independently read: `ADJACENT_APEX_MAXIMAL_COST.md`, `COMMON_APEX_BOWTIE_RESTORATION.md`, `CROSS_APEX_DOUBLE_MIXED_BOWTIE.md`, `CROSS_APEX_MATCHING_FROM_TWO_EQUALITY_REMAINDERS.md`, `SINGLE_CROSS_APEX_SINGLE_MIXED_BOWTIE.md`, `SINGLE_MIXED_TWO_CROSS_APEX_BOWTIE.md`, `DOUBLE_MIXED_NO_CROSS_APEX_BOWTIE.md`, and `NINE_CYCLE_PAGE_INTEGRALITY.md`, all under `snapshots/TUZA-03/alternative/`.

## F. Parameterized restoration compression

### Exact statement

Let H be finite simple, nu(H)=h, and nu(H-e)=h for every e in E(H). Add six absent edges forming two edge-disjoint triangles to obtain G; let S be their endpoints, |S|<=6. There exists a **subgraph**, not necessarily an induced subgraph, G' containing all added edges. With H' equal to G' minus those six edges,

    nu(G')=nu(G), tau(G')=tau(G),
    nu(H')=nu(H), tau(H')=tau(H),
    |V(G')| <= 6h²+3h+454.

H' remains packing-edge-stable. If D(H) is 3-partite, so is D(H'). More precisely, the nonisolated part of the old full triangle hypergraph is retained unchanged; deleted old graph edges are triangle-free hypergraph vertices. No claim of preserving the whole graph, induced structure, all covers, or all packings as literal subsets is made.

### Elementary proof reconstructed

For an edge ab, use an h-packing avoiding ab, available by stability. Every page abx must meet this packing or could be appended. A packing triangle avoids ab and therefore contains at most one of a,b; it can meet at most two distinct pages via its incident edges at that endpoint. Hence every H-edge lies in at most 2h triangles.

Fix any maximum h-packing P. Every H-triangle meets one of its 3h edges. Counting incidences bounds the number of triangles by 6h². Every such triangle has at least two vertices in V(P), so the set A of all old-triangle vertices has size at most 3h+6h². This includes h=0, when A is empty.

Retain A union S. An outside vertex w belongs to no old triangle. Any G-triangle through w must use an added edge, which has both endpoints in S. Thus every edge incident to w except an edge to S lies in no G-triangle; remove all those edges. The remaining triangles through w are exactly pages wxy on added bases with x,y in its exact S-neighborhood. Classify outside vertices by that neighborhood. There are at most 2^6=64 types. Keep at most seven vertices per type, yielding

    |A|+|S|+7*64 <= 6h²+3h+454.

All old triangles survive, so both old optimization parameters remain equal. For any retained old edge e, its old triangle incidence is unchanged; an h-packing avoiding e still lies wholly within A. Hence old packing-edge stability is preserved, including retained triangle-free edges. Tripartiteness restricts directly.

Any G-packing has at most six new triangles, since each consumes a distinct one of the six added edges. It therefore uses at most six distinct outside vertices. Within each truncated type injectively relabel the used outside vertices to retained representatives, fixing A union S. Neighborhood equality preserves triangles; injectivity preserves graph-edge disjointness. This sends every G-packing to a G'-packing of the same size; the reverse inequality follows from subgraph inclusion.

For covers, take a minimum G'-cover C and any truncated type with seven retained vertices W_N. Let D_N be the added bases whose endpoints lie in its common neighborhood, |D_N|<=6. If some xy in D_N were absent from C, each of the seven pages wxy would require a distinct incident spoke wx or wy in C. Thus C has at least seven edges incident with W_N. Replace all C edges incident with W_N by D_N. No other triangle loses coverage, because every triangle using a W_N edge is one of its added-base pages. This yields a smaller cover, contradiction. Hence C contains every D_N, so the same C also covers all deleted vertices' pages. Therefore tau(G)<=tau(G'), and subgraph monotonicity gives equality.

### Adversarial findings

No gap found. Seven representatives ensure a strict improvement over at most six bases; six would not justify this exact argument. The proof preserves the four stated integer parameters, not fractional parameters or counts of optimal solutions. It neither bounds h nor reduces unrestricted restoration to finitely many graphs. Edge stability is required for the codegree bound. The final constant 454 is 6+7*64; the theorem deliberately retains types with no pages in that loose bound. The algorithm can enumerate all triangles/types once a maximum packing is supplied; no efficient maximum-packing computation is asserted.

Source: `snapshots/TUZA-03/proof/PARAMETERIZED_RESTORATION_COMPRESSION.md`.

## Publication and formalization recommendations from this review

- State D1 and D2 separately, with all boundary hypotheses in the displayed statements. D2 is valuable even if D1 remains ordinary-only in Lean.
- Present the stable four-spoke consequence first with at least five active spokes explicit; add its reduced-critical-instance application only after the structural dependency chain is independently accepted.
- Present E as a single complete theorem with individual/full family definitions and a short case table. Preserve the repaired open-wedge argument and the pure-wheel exclusion; neither is optional exposition.
- Present F as exact parameter preservation for fixed h, with no “finite solution of the unrestricted conjecture” claim.
- The unrestricted two-triangle restoration theorem, OCT-five, and the proposed fixed-c<3 density extension remain unproved. No result above changes that status.


# Fresh published-source review

# Fresh published-source and originality audit

Date: 29 October 2026. Role: independent source checking and bounded literature comparison. This review read the selected mathematical arguments rather than relying on the prior executive summaries. It is separate from the reconstruction and adversarial workstreams. No external researcher was contacted. No priority claim follows from a search that found no predecessor.

## Findings

The published inputs used by the selected proofs have the required scope, provided their integer/fractional and graph/hypergraph distinctions are retained. In particular, HKT's flat-graph theorem has no planarity hypothesis. The potentially substantial project contributions are the compatible restoration arguments and the closed-boundary mechanism, not the underlying Aharoni, HNS, HKT, Hall, König, or perfect-graph theorems.

A targeted new comparison matters for the compression claim: linear-size decision kernels for edge-triangle packing and covering already exist. The project's quadratic bound must not be advertised as an improved kernel. Its distinct proposed content is simultaneous, exact preservation of both optimization parameters of both the old and restored graph, with the designated restored edges retained.

The unrestricted two-triangle theorem, OCT five, and the fixed c<3 density extension remain unproved in the supplied arguments. No checked external source fills that gap.

## 1. Sources independently checked

### Aharoni: tripartite matching-cover inequality

Ron Aharoni, *Ryser's conjecture for tripartite 3-graphs*, Combinatorica 21 (2001), 1–4, [publisher record](https://link.springer.com/article/10.1007/s004930170001), DOI 10.1007/s004930170001. The required input is tau<=2nu for finite 3-partite 3-uniform hypergraphs. The publisher record was checked; the accessible HNS author manuscript also explicitly attributes and derives this inequality in Section 3, Proposition 3.2(iii) and its following paragraph. This audit did not independently reprove Aharoni's topological argument. Graph-edge deletion preserves the required tripartition because surviving triangles form a subhypergraph of the full old triangle hypergraph.

### HNS: equality and home-base extraction

P. Haxell, L. Narins, T. Szabó, *Extremal Hypergraphs for Ryser's Conjecture*, JCTA 158 (2018), 492–547, [author manuscript dated 18 March 2018](https://page.mi.fu-berlin.de/szabo/PDF/ryser.pdf), DOI 10.1016/j.jcta.2018.04.004. Theorem 1.1 characterizes equality by home-base structure. Definitions 7.1–7.4 and Proposition 7.5, manuscript pp. 19–21, support simultaneous disjoint loose-cycle extraction. Three auxiliary matchings saturating the central triples give distinct vertices within each part; distinct parts and the partition ensure all other required disjointness. Parallel hyperedges are allowed, so simple triangle hypergraphs qualify. The conversion of a loose cycle of actual graph triangles into a K4 and exhaustion of all triangles by equality blocks are elementary project deductions, not a direct quotation of HNS. No HNS slack-one classification is supplied by this source.

### HKT: K4-free flat graphs

P. Haxell, A. Kostochka, S. Thomassé, *Packing and Covering Triangles in K4-free Planar Graphs*, Graphs and Combinatorics 28 (2012), 653–662, [author manuscript dated 21 April 2011](https://www.kostochk.web.illinois.edu/docs/accepted/plan-ht.pdf), DOI 10.1007/s00373-011-1071-9. Theorem 2, manuscript p. 2, assumes K4-free and flat, meaning each graph edge lies in at most two triangles. It proves tau<=3nu/2 and identifies equality with five-wheel components. It does **not** assume planarity. The triangle-component reading is confirmed by Claim 5, Lemma 8, and the proof of Theorem 2 on pp. 3–5: the triangle graph is a disjoint union of C5s. Thus arbitrary overlap at graph vertices and extra triangle-free edges do not invalidate the intended decomposition. A five-wheel here has five rim vertices and a sixth hub vertex.

### HKT: fractional stability

The same authors, *A Stability Theorem on Fractional Covering of Triangles by Edges*, European Journal of Combinatorics 33 (2012), 799–806, [author manuscript dated 3 February 2011](https://www.kostochk.web.illinois.edu/docs/accepted/frac-ht.pdf), DOI 10.1016/j.ejc.2011.09.024. Theorem 1, p. 2, starts from fractional tau*>=2nu-x, and supplies nu-floor(10x) edge-disjoint K4s plus floor(10x) further triangles. Its following paragraph characterizes fractional equality by K4 triangle components. Neither the premise nor equality may be inferred from integer slack one. Section 2's K4 attachment definition requires exactly one old edge in the new block, not two fresh vertices. Claims about fresh-vertex stars therefore require the additional project argument before they cover general HKT structures.

### Strong Perfect Graph Theorem

M. Chudnovsky, N. Robertson, P. Seymour, R. Thomas, *The strong perfect graph theorem*, Annals of Mathematics 164 (2006), 51–229, [publisher](https://annals.math.princeton.edu/2006/164-1/p02), DOI 10.4007/annals.2006.164.51. A graph with no induced odd cycle of length at least five and no complement of one is perfect. This is the external input in the nine-cycle-page part of the mixed-bowtie proof. The cycle-page intersection-graph analysis and the fact that its cliques admit a common graph-edge cover remain project obligations. Perfectness alone does not identify triangle-edge covers in an arbitrary triangle-intersection graph. The shared-apex subtheorem does not require this source.

### Bilaterally complete tripartite graphs

N. Amarnani, A. De Burgos, W. Broughton, *Packing and Covering Triangles in Bilaterally-Complete Tripartite Graphs*, [arXiv:2307.08824v1](https://arxiv.org/html/2307.08824v1). Definition 1 and Theorem 1 assert tau=nu for ordinary vertex-tripartite graphs having two complete bipartite sides. The paper expressly acknowledges an alternative derivation from older matching results. Consequently the closed join of an independent apex set to a bipartite graph is covered directly. The adjacent-apex join is not ordinary tripartite when it contains a K4, though deleting its apex edge allows an application. This result should be cited for the corresponding supporting material, not presented as a new general two-apex theorem.

### Existing kernels: a necessary originality comparison

Z. Sheng, M. Xiao, *A Discharging Method: Improved Kernels for Edge Triangle Packing and Covering*, [arXiv:2308.16515v1](https://arxiv.org/html/2308.16515v1), 31 August 2023. The definitions in Section 2 are threshold decision problems; the paper gives 3k-vertex kernels for each. Section 4 includes reductions that lower the parameter. Earlier work includes Y. Yang, *Towards optimal kernel for edge-disjoint triangle packing*, Information Processing Letters (2014), [DOI 10.1016/j.ipl.2014.02.003](https://doi.org/10.1016/j.ipl.2014.02.003), with a 3.5k-vertex decision kernel. These sources establish that polynomial or linear bounded reductions for individual triangle problems are not new. Their stated guarantees do not automatically preserve the four original optimum values and six designated restored edges demanded here.

### Other scope comparisons

H. Lu and X. Ma, [*Matching stability for 3-partite 3-uniform hypergraphs*, arXiv:2410.15673v2](https://arxiv.org/html/2410.15673v2), Theorem 1.3, assumes balanced classes of size n>max{m,162}, at least (m-1)n²+3n-m edges, and matching number m; its conclusion is tau=m. A linear tripartite hypergraph has at most n² hyperedges, so for m>=2 this does not supply the graphical slack-one input.

Z. Liu and Q. Zeng, [*Tuza's Conjecture under an Edge-Count Condition*, arXiv:2610.15539v1](https://arxiv.org/html/2610.15539v1), Theorem 1.3, gives fixed c<2 and sufficiently large order under e(G)>=n²/4-cn. Its OCT lemma and density argument do not establish OCT five or c<3. S. Wang, [*A Bound Below 2.8 for Tuza's Conjecture*, arXiv:2609.13831v1](https://arxiv.org/html/2609.13831v1), uses the complete family of triangles with exactly one red edge in Lemmas 2.1–2.3. That premise is not a license to discard mixed restored triangles or to replace a full family by an arbitrary selected family. Neither preprint's separate formalization claims were rerun here.

## 2. Exact project contribution and source boundary

The following assessments are about source validity and additional content. Final proof classifications also require the reconstruction and adversarial reports; this source review alone is not a substitute for those reviews.

| Candidate | Source boundary and additional content | Recommended treatment |
|---|---|---|
| A. Two-triangle exact equality | G finite simple, T1,T2 edge-disjoint, full D(H) tripartite, tau(H)=2nu(H). TUZA-01 publishes one-triangle restoration and K4 avoidance; the two-triangle extension needs the new-family and mixed-bowtie four-edge cover argument. It already appears in the pre-TUZA-02 follow-up preserved in `context/PRIOR_FOLLOWUP_CANDIDATE.md`. | Include as foundation, credit as prior follow-up rather than TUZA-02 discovery. Do not imply it is part of TUZA-01's existing Lean theorem. |
| B. Essential-edge restoration | Requires integer slack one and nu(H-e)=nu(H)-1. Aharoni puts H-e at equality; free-page construction, Hall classification, and the common-apex-pair packing contradiction are additional elementary deductions. | Strong main theorem if the fresh mathematical audit accepts it. Separate its arbitrary-order scope from the known very-small-packing cases. |
| C. Flat-remainder restoration | H need only be flat; no full-triangle tripartition is required. The K4-plus-small-core slack-one classification is a short HKT consequence. The five-wheel compatible augmentation is the substantive extra step. The book case under tripartiteness follows from B; the zero-slack elementary cover argument is inherited from A. | Strong main theorem, citing HKT prominently. Present one full flat theorem with the wheel lemma, not several duplicative claims of new classification. |
| D. Closed-boundary deletion and companion stability | Disjoint independent U,P; uniqueness only for actual edges px with p in P and x outside U union P; A any subset of old U–P edges. König applies separately to the bipartite terminal cones. The new content is simultaneous compatibility with equality K4 faces, then slack accounting or stability contradiction. | Substantive general structural result, no graph-order or packing-number bound. The criterion is conditional on its exact boundary hypotheses. |
| E. Exact-two-apex mixed/shared bowtie | Each **individual** restored family must be exactly the base triangle plus six pages at two universal apices; full new family also includes mixed triangles. The shared-apex branch and mixed disjoint-apex branch are different deductions. The latter uses the nine-cycle-page lemma and SPGT. | Potential main result after complete fresh case audit. If only shared-apex cases are verified, publish precisely that subtheorem and retain the rest as unverified. |
| F. Compression | Finite H with deletion of every one edge preserving nu(H)=h; two restored edge-disjoint triangles. No tripartiteness or slack-one hypothesis is needed for the bound. Preserves nu/tau of G and H, six added edges, full old triangle hypergraph up to irrelevant edges, and edge stability. | Useful appendix or methods lemma; quadratic bound is not a superior packing/cover kernel, not an absolute finite reduction, and not a bound on h. |

### Mathematical spot checks independent of the previous reviews

1. HNS extraction is correctly specialized to a full triangle hypergraph. Three pairwise-intersecting graph triangles with distinct shared edges generate all six K4 edges. Once h edge-disjoint K4s have been extracted from equality, an additional triangle would meet each in at most one edge; choose faces avoiding those edges and append it. This establishes exhaustion. The extra fourth face exists because the model is an actual graph.
2. HKT's equality case applies after K4 isolation in a flat graph: each K4 edge already lies in two faces, so no external triangle can use it. For defect one, the K4-free remainder has nu at most two; its nu=2 case forces equality in the 3/2 bound. The near-equality classification is therefore a deduction, not a newly imported stability theorem.
3. The wheel augmentation in the stated proof genuinely uses component isolation. If an outside terminal b had adjacent neighbors in the wheel, their edge would lie in an extra old triangle. In the two-rim-terminal case the allowed nontrivial neighbor pattern is the one used to construct three pages and one old wheel triangle. Omitting component isolation would invalidate that classification.
4. The boundary uniqueness restriction in D is used twice: it separates edge supports of terminal cones, and prevents a chosen equality face from sharing a P-to-outside edge with a lost triangle at a different terminal. The full lost family must be retained in the companion stability argument even when it uses the subsequently deleted edge.
5. The compression count is not a consequence of ordinary critical-hypergraph order bounds. Its elementary argument instead bounds every old edge codegree by 2h using a maximum packing avoiding that edge; seven representatives per one of at most 64 external-neighborhood types give a strict cover-replacement improvement. Six representatives would require an additional equality-case argument not present in the stated proof. A packing uses at most six new triangles because their added-edge supports are disjoint.

## 3. Search record and limits

Fresh query families on 29 October 2026 included: `Haxell Kostochka Thomasse flat Theorem 2 five wheel`; `Tuza two triangle deletion restoration tripartite equality`; `Tuza closed boundary exact two apex bowtie`; `"two-triangle" "Tuza"`; `"Tuza" "flat" restoration`; `"Tuza" "essential edge"`; `"triangle packing" "edge-stable" compression`; `"triangle-3-colorable" equality K4`; `"triangle-3-colourable" "two" triangles`; `"Tuza" "packing-critical" edge`; `"Tuza" "bowtie" graph`; `Tuza triangle edge deletion odd cycle transversal five graph 2026`; `"triangle packing" "kernel" "edge-disjoint" quadratic vertices`; and the titles of the Aharoni, HNS, HKT, bilateral-complete, SPGT, and Sheng–Xiao papers.

The comparison used author manuscripts, arXiv versions, and publisher pages. Unrelated commercial/person-name hits and secondary summaries were not used as theorem evidence. The search found no exact earlier statement of A–E or of F with its simultaneous exact-preservation guarantees. This is bounded negative evidence only: alternate terminology, unindexed work, unnoticed corollaries, and unpublished work remain possible. No complete citation-graph traversal or specialist originality assessment was performed.

An additional caution: a search result describing an unrelated Lean project incorrectly stated Tuza for all K4-free graphs. It was not used. Repository descriptions and purported formal proofs must not replace exact source and declaration inspection.

## 4. Reproducibility and publication advice

Fresh primary copies and SHA-256 hashes are recorded in `literature/primary/SOURCE_MANIFEST.json`. The HNS and fractional HKT PDFs match the already archived bytes. PDF text was inspected through the web reader; the remote machine lacks `pdftotext`, `pypdf`, `fitz`, and `pdfminer`, so this review does not claim a successful remote text-extraction run. No package was installed for this purpose.

The source folder is private research evidence. Do not copy third-party PDFs or raw HTML wholesale into the sanitized publication tree. Publish citations, concise scope comparisons, and the project's own proof text. Retain the distinction between published inputs, new ordinary deductions, and only those deductions that the final Lean audit actually verifies. The bibliographic recommendation is to lead with B, C, and D if their fresh proof audits pass, use A as a credited foundation, include E only at its independently checked scope, and place F with methodological limitations in an appendix.
