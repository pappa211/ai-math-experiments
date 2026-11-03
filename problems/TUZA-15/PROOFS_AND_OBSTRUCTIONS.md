# TUZA-15 proofs and obstructions

Publication annotation: discovery-stage `independent_final_verification: NOT_RUN` labels below are historical. The later authenticated audit is VERIFIED_AS_FROZEN; see [full reconstruction](verification/INDEPENDENT_PROOF_AUDIT.md) and [targets](verification/FROZEN_TARGETS.md). The mathematical proof is preserved.

Final discovery proof freeze, 3 November 2026. Claims below are ordinary mathematical arguments; fresh criticism and final claim status are recorded separately. All graphs are finite and simple, triangles are ALL actual graph triangles, packings are edge-disjoint and covers use graph edges. Write p=nu(G), D(G)=2nu(G)-tau(G). B(K) means every nonempty shared-edge triangle component of K has literal K4 or K5 edge support. Triangle-free background edges and shared vertices between blocks are allowed.

## 0. Exact input boundary

The accepted public five-degenerate proof supplies clique parameters/avoidance (Lemmas2/2A), hereditary combined-minimal criticality (Lemma3), balanced reduction accounting (Lemma3A), triangle codegree>=2, robustness, the degree-five link classification, degree-five low-neighbor exclusion and degree-five overlap restrictions. These local results do not assume five-degeneracy; that hypothesis first enters the second peeling argument. This mission does not rename these known facts as new theorems.

Throughout, a minimum combined obstruction means an edge-minimum failure of P in the specified subgraph-closed class, with isolated vertices discarded (or ties broken by vertex count). This harmless normalization is required before asserting minimum degree or discharging every vertex. Such an obstruction has tau=2p, nu(G-e)=p and tau(G-e)=2p-1, one nonempty triangle component and no triangle-free edges. Every proper subgraph satisfies P. This is a different object from an inequality-only minimal counterexample, which has tau=2p+1 and tau(G-e)=2p; it is also different from a minimum failure of two-red S/E. We never import irreducibility from either of the latter objects.

For B(K), nu(K) and tau(K) add over its component supports, tau(K)=2nu(K), a maximum K4 packing avoids a star, and a maximum K5 packing avoids any two edges. Accordingly a local packing Q extends a maximum K packing when the ENTIRE used-edge footprint in each K4 is a star and in each K5 has size<=2. Edges of K unsupported by triangles cause no packing conflict and are not silently assigned to blocks.

For an actual balanced tuple with r deleted-compatible packed triangles and a 2r-edge cover of ALL lost triangles, combined minimality gives B(K), nu(G)=nu(K)+r and tau(G)=tau(K)+2r. These are the old identities. The new obligations below concern the actual restoration.

## 1. R6: a closed six-neighbor component with two disjoint missing edges

**Statement (standalone residual-block interface).** Let v have a connected component C={1,2,3,4,5,6} in its link G[N(v)], with G[C]=K6-{12,34}. Thus C is CLOSED in the link: no edge joins C to N(v) minus C. Other neighbors of v and all other graph incidence are unrestricted. Put W={1,2,3,4,5},

R=E(G[W]) union {56},
K=G-({v1,v2,v3,v4,v5,v6} union R).

There are nine edges in R. If B(K), then D(G)>=2. More precisely, if an edge of R has a triangle with apex outside {v} union C, then nu(G)>=nu(K)+6 and tau(G)<=tau(K)+10. If no such page exists, nu(G)>=nu(K)+5 and tau(G)<=tau(K)+7, so D(G)>=3.

There is NO maximum-degree, graph-order, mad, or bound on outside pages in this statement. The residual block assumption is explicit.

**Proof.** Let B=G[{v} union C]=K7-{12,34}. The five triangles

v14, v23, v56, 135, 245

are pairwise edge-disjoint and every used edge is absent in K. Let X=R union {v6}, of size10. Any triangle using a deleted spoke lies in B, by closedness. Such a triangle either uses v6 or has its rim in E(G[W]) subset R. Any other lost triangle uses R and meets X directly. Hence X covers ALL lost triangles, and

nu(G)>=nu(K)+5, tau(G)<=tau(K)+10.

The whole surviving edge set of B in K is {61,62,63,64}. W is independent in K and56 is absent. Consequently every residual clique meets W in at most one vertex.

We need an ordinary finite fact about the fixed core B: after forbidding ANY ONE edge, B still has five edge-disjoint triangles. Label v=0. The automorphisms permuting the nonedge pairs {1,2},{3,4}, swapping their endpoints and permuting {0,5,6} reduce existing edges to three orbits. Explicit witnesses are:

| Forbidden edge | Five triangles |
|---|---|
|13|014,025,036,156,246|
|15|013,024,056,146,235|
|56|013,025,046,145,236|

All displayed edges exist and no edge repeats in a row. The three orbit types are between the two missing pairs, from a missing-pair vertex to a singleton, and between singletons. These exhaust all nineteen existing edges. The tiny search in checks/dense_six_probe.py found the certificates; the explicit witnesses and symmetry are the ordinary proof, not an inference from sampled graphs.

Suppose an external page i j x exists on f=ij in R, with x outside B. Choose the five-packing in B avoiding f. It is disjoint from that page: the only possible common edge is f. Its residual footprint is a subset of the star {61,62,63,64}.

If f lies inside W, a residual clique contains at most one endpoint i or j, and hence at most one page spoke. A local surviving edge in that clique, if present, is6t for its unique W vertex t. If a page spoke is also present, its W endpoint must be t, so the two edges share t. If f=56, a residual clique cannot contain both5 and6. A clique containing5 sees only possible spoke5x and no local surviving edge. A clique containing6 may also contain one W vertex t in{1,2,3,4}, so its entire footprint is contained in{6x,6t}. A clique containing neither endpoint sees no page spoke. Thus in every case the ENTIRE footprint of the six selected triangles in each block is a star of size<=2. Extra outside vertices, repeated page apices and other crossing triangles do not enlarge this selected footprint. Existing clique avoidance appends all six triangles to a maximum residual packing. This proves nu(G)>=nu(K)+6 and hence D(G)>=2 using tau(K)=2nu(K).

If no external page on R exists, every lost triangle lies in B: lost-spoke triangles lie there by closedness, and other lost triangles use R and by hypothesis have their apex there. The seven actual edges

v1,v2,35,36,45,46,56

cover B. They are precisely the existing within-part edges of the bipartition {v,1,2}|{3,4,5,6}; its complement is bipartite and triangle-free. A minimum K cover plus these seven edges covers G. With the original five-packing this yields D(G)>=3. QED.

**Combined-minimal corollary.** No minimum combined obstruction in ANY hereditary class has this closed link component. The displayed five-packing and X give a genuine balanced reduction, so old Lemma3A supplies B(K). The standalone statement then contradicts tau(G)=2nu(G). This fills the equality gap in Puleo Proposition5.1, Case2, and also permits other link components at v. It does not classify every six-vertex WKE link.

## 2. TWIN: two closed hub neighborhoods

**Statement.** Let u,v,a,b,c,d,w be distinct vertices, with uv and all eight edges from {u,v} to{a,b,c,d}, as well as uw,vw, present. Require G[{a,b,c,d}]=K4 and wc,wd present; wa and wb may be present or absent. Require {v,a,b,c,d,w} to be a CLOSED component of the link at u, and {u,a,b,c,d,w} a CLOSED component of the link at v. Other link components and outside incidence are arbitrary.

Let R={ab,bc,cd,da}. Delete all eleven core edges incident with u or v and the four edges R, retaining all other graph edges, to obtain K. If B(K), then D(G)>=2.

**Proof.** The five triangles P={uab,ucd,vbc,vad,uvw} use only deleted edges. Put

X={ab,bc,cd,da,uw,vw,ua,ub,vc,vd}, |X|=10.

Every triangle using a deleted core spoke is entirely within the seven-vertex core, by the two closed-link hypotheses. A triangle containing uv is hit by ua,ub,vc,vd,uw or vw according to its third vertex. A triangle at u not containing v either meets ua,ub,uw or has rim cd, which is in X. A triangle at v not containing u either meets vc,vd,vw or has rim ab. Every other lost triangle uses R and meets X directly. Thus all lost triangles are covered and tau(G)<=tau(K)+10.

Replace P by the six actual triangles

Q={wuv,wcd,auc,avd,bud,bvc}.

They are pairwise edge-disjoint, and avoid wa,wb and ab. Their ENTIRE surviving footprint in K is F={wc,wd,ac,bd}. The absent cycle edges constrain simultaneous membership in a residual clique. The pairs (wc,wd),(wc,bd),(wd,ac),(ac,bd) respectively require at least one of cd,bc,da,ab to be present; these are deleted. Thus the only possible two-edge footprints are {wc,ac}, a star at c, and {wd,bd}, a star at d. No three edges are pairwise compatible. Every residual K4 sees a star and every K5 at most two edges. Append Q to a maximum residual packing to obtain nu(G)>=nu(K)+6. Hence D(G)>=12-10=2. QED.

**Combined-minimal corollary.** The five-packing P and X invoke old balanced accounting, so a minimum combined obstruction cannot contain this configuration. This includes adjacent degree-six twins N[u]=N[v] when their common five-neighbor graph is K5 or K5-e (choose w at an endpoint of the missing edge). It also includes a K4 plus a fifth vertex with at least two neighbors, after relabeling, and hubs of unbounded degree with other closed link components. This is a strict extension of the boundary reasoning, not an assertion of full low-degree independence without the remaining link classification.

## 3. THIN: Puleo7.7 with explicit exact link, not irreducibility

**Statement.** Let v have degree6 and link K6 minus a perfect matching. Let u be a neighbor with degree7. Define W=N(u) intersect N(v)={a,b,c,d}, ordered as a cycle ab,bc,cd,da in the link. Let q be v's unique neighbor outside N[u], and p1,p2 the two neighbors of u outside N[v]. Define

X={ab,bc,cd,da,uv,up1,up2,vq},
K=(G-X)-{u,v}.

If B(K), then D(G)>=2. Consequently this exact configuration cannot occur in a minimum combined obstruction.

**Proof.** The exact link gives missing pairs uq,ac,bd, so q joins every vertex of W. All named vertices are distinct by their neighborhood definitions. The four triangles uab,ucd,vbc,vad use deleted edges. X hits every triangle at u or v: after deleting X, a possible such triangle would need two neighbors in W, whose cycle edges are removed and diagonals absent. All other triangles lost in K use X and are directly covered. Thus tau(G)<=tau(K)+8. The five triangles

uab,qcd,vuc,vad,vbq

are pairwise edge-disjoint. Their entire surviving footprint is {qc,qd,qb}. W is independent in K, so every residual clique contains at most one of these three edges. This uses a one-edge-per-block bound, NOT arbitrary-star avoidance in K5. Hence nu(G)>=nu(K)+5, yielding D(G)>=2. For the combined-minimal corollary, the original four-packing and eight-edge X supply B(K) by known balanced accounting. QED.

Puleo's Definition2.5 merely defines thin by the complement CONTAINING a perfect matching. His no-reduction context also supplies complement maximum degree<=1, making it exactly that matching. We explicitly assume the exact link here; we have NOT proved the lemma for every vertex called thin under the bare definition.

## 4. DOM: dominated dense six-link configurations

Let v have degree6, u adjacent to v, N[v] subset N[u]. Put W=N(v)-{u}, |W|=5, Z=N(u)-N[v], s=|Z|, and K=(G-X)-{u,v}, where X=E(G[W]) union {uv} union {uz:z in Z}.

If the link of v is K6 and d(u)<=8, then |X|=11+s<=13. The core on{u,v} union W is K7 and has a seven-triangle decomposition. Label its vertices0,...,6; the triples 013,026,045,124,156,235,346 form one explicit edge decomposition (each of21 edges occurs exactly once). Every packed edge is absent in K. All triangles at u or v meet X; in particular a triangle at u with a vertex in Z meets its selected u-spoke. Hence, provided ONLY that tau(K)<=2nu(K),

tau(G)<=2nu(K)+13<2(nu(K)+7)<=2nu(G).

If the link of v is K6-e and d(u)<=7, the missing edge lies inside W since u dominates v. Label it w1w2. The six triangles

uw2w5,uw3w4,vw2w3,vw4w5,uvw1,w1w3w5

are pairwise edge-disjoint and lie on deleted edges. Here |X|=10+s<=11<12, again strict under residual inequality alone. These observations lift the stated dense-link portion of Puleo7.6 without requiring irreducibility or a block hypothesis. The complete-link branch extends the degree bound to8. They do not prove that all dominated six-links have these forms.

## 5. SEP: one-edge triangle separation forces strictness

**Statement.** Suppose G=G1 union G2, E(G1) intersect E(G2)={e}, and EVERY actual triangle of G belongs to at least one Gi. The edge e is triangle-bearing in both Gi. Assume Tuza for Gi and Gi-e, and assume B(Gi) whenever Gi is tight. Then tau(G)<=2nu(G)-1.

**Proof.** Put ni=nu(Gi), di=ni-nu(Gi-e) in{0,1}. If d1=d2=1, a minimum cover of G1-e, a minimum cover of G2-e and e cover all triangles at cost at most2(n1-1)+2(n2-1)+1=2(n1+n2)-3. A maximum packing of G1 and one of G2-e combine, so nu(G)>=n1+n2-1. The desired strict inequality follows.

Otherwise, a maximum packing avoiding e on a side with di=0 combines with an unrestricted maximum on the other side, giving nu(G)>=n1+n2. If either side is slack, the union of minimum covers has size at most2(n1+n2)-1. If both are tight, e belongs to a clique triangle block on both sides. In each K4/K5 block there is a minimum cover containing a prescribed edge, so choose minimum Gi covers both containing e. Their union saves one shared edge, again giving the desired bound. QED.

A minimum combined obstruction therefore has no graph-edge articulation node in its bipartite incidence graph between actual edges and actual triangles. Removing such a node partitions triangle nodes into nonempty groups. Group supports overlap only in e; any actual triangle in a support belongs to that group (it shares one of the other edges with a group triangle). All triangles of G already occur as nodes, so no crossing family is discarded. Each group has a triangle containing e by connectedness. The proper-subgraph hypotheses then follow from combined minimality.

This is an elementary conditional strictness lemma. It differs from TUZA11's flat-piece inequality across a boundary of at most4/5 edges, but no new general gluing method or historical priority is claimed. It leaves more highly connected obstructions untouched.

## 6. Transfer map and irreducibility boundary

Puleo's original discharging is valid if all his Lemma2.7(a)-(h) conclusions hold. We do not assert them merely because G is a combined-minimal obstruction. The final Section16 instead uses a proved weighted-neighbor argument that avoids his degree9 condition(f); the optional lifted(g) is also unnecessary. R6 handles the complement-two-independent-edge clause at degree6. TWIN handles the dense degree-six twin pair. THIN and DOM handle specified degree7 interactions once the exact link hypotheses are known. The completed six-link exclusions and density consequence appear below; high-degree and donor interactions are separately audited. No full mad<7 theorem follows just from these initial reductions.

## 7. Graph-specific obstruction diagnostic and failed shortcuts

The Fano plane viewed as a rank-three incidence hypergraph has packing1 and cover3, with a point deletion leaving packing1 and cover2. Inequality-only criticality and abstract exchanges alone cannot exclude it. Fano does not satisfy combined tightness tau=2nu and is not a countermodel to that whole package. The new arguments use actual endpoint geometry: residual cliques contain every pair of their vertices; absent rim edges forbid simultaneous footprint edges; all triangles of a core and all external pages are accounted for. An abstract hypergraph does not supply these forced graph edges or the K4/K5 avoidance property. Fano exclusion alone is not a full realization theorem.

K6 is an ACTUAL graph negative control for dropping the equality premise. It has one triangle component, robust K5 links, codegree4, nu4,tau6 and for every edge e, nu(K6-e)=4,tau(K6-e)=5. Four triangles123,145,246,356 pack; no five pack since that would use all15 edges of an odd-degree graph. A3+3 partition covers with6 edges and Mantel's bound forces at least15-9=6. After edge deletion the bound14-9=5 and a minimum cover containing e give tau5; symmetry of the unused-edge packing supplies nu4. Its D=2, not0. It is NOT a counterexample to the combined equality conjecture.

The already known K5 three-spoke avoidance failure is not new: delete three incident edges at a vertex, leaving K4 plus a pendant edge, of packing number1 rather than2. The four-edge star also fails. Every application above bounds the entire footprint separately in each residual block. Passing a fixed core test never certifies arbitrary boundary behavior; the symbolic arguments provide that obligation.

## 8. BIP: unbounded bipartite-link exclusion

**Statement.** A minimum combined obstruction in any hereditary class has NO bipartite connected component in ANY vertex link. There is no bound on the order of that component, the hub degree, the graph degree, or the outside attachments.

**Proof.** Let H be a bipartite closed link component at v. Known triangle codegree>=2 implies delta(H)>=2: each neighbor x in H corresponds to vx, whose triangles give distinct H-neighbors of x. Let M be a maximum matching in H. There is another maximum matching M' distinct from M. If M leaves x unmatched, choose a neighbor y; y must be matched, and replacing its matched edge by xy gives another maximum matching. If M is perfect, orient nonmatching edges from one bipartition class to the other and matching edges back. Every vertex has an outgoing edge, using delta(H)>=2 on the first class. A finite directed cycle alternates between matching and nonmatching edges; flipping it gives M'. Choose f in M minus M'.

By Konig's theorem choose a minimum vertex cover Q of H of size r=|M|. Delete the spokes from v into V(H) and the matching edges M, leaving K. This is a proper actual edge-subgraph, retaining all other hub neighborhoods. The r hub triangles based on M use only deleted edges, and X=M union {vq:q in Q} has size2r. Closedness ensures that every lost-spoke triangle lies at v over an H-edge and hence meets the selected Q-spokes; every other lost triangle uses M. Known balanced accounting therefore supplies B(K) and nu(G)=nu(K)+r.

The rim edge f has another triangle besides vf, by known codegree>=2. Since H is bipartite, its apex cannot lie in H. Thus this is an external f-page fx. Combine it with the r hub triangles based on M'. They are edge-disjoint, because M' is a matching, f is avoided, and x lies outside H union {v}.

Every residual clique meets V(H) in at most two vertices: its intersection is a clique of H-M, which is bipartite. It sees at most one local M' edge. It sees at most one page spoke, since f was deleted and a clique cannot contain both endpoints of f. If both a local edge and a page spoke occur, their H endpoints must coincide; otherwise that block would contain three H vertices. Hence the entire block footprint is a star of size<=2. The established clique compatibility appends all r+1 triangles to a maximum residual packing, contradicting the exact increment r. QED.

This is a new derived interaction argument in this mission, built on Puleo's old bipartite/weak-Konig reduction and the accepted project block compatibility. The statement is about minimal COMBINED obstructions, not all graphs or all tight graphs without a proper-subgraph induction premise. The graph-specific step is the clique intersection/absent-base argument; neither generic hypergraph criticality nor an arbitrary K5 star is used.

**Corollary.** Every finite locally bipartite graph containing a triangle satisfies tau(G)<=2nu(G)-1. The class is subgraph-closed. If combined P failed, choose a minimum failure; robustness provides a nonempty link component, which is bipartite and excluded above. Thus P holds in this class. A K4 or K5 triangle block cannot occur in a locally bipartite graph, so nonempty triangle support prevents equality. The inequality for this class is prior work of Aparna Lakshmanan–Bujtas–Tuza, also recovered by Puleo4.4; this mission's strictness and local obstruction statement must retain that attribution. Historical originality of strictness is unestablished pending a fuller prior-art check.

## 9. Additional donor and adjacency proofs

The complete ordinary proof of exclusion of a degree7 vertex subsuming a degree5 vertex, including all Z-edge/no-Z-edge cases and arbitrary external pages, is frozen in notes/SCOUT_B_RESULTS.md, sectionB4. It uses only the accepted degree5 package and ordinary local witnesses, not the six-link classification. SectionB2 there proves the four-common-neighbor degree6 adjacency case is strict under the six-link shapes now established in Section11; with TWIN and the old degree5 results it gives low-degree independence. These references are part of this private proof package, not unsupported executive assertions. The complete degree8 exclusion is Section15 and notes/SCOUT_B_DEGREE8.md.


## 10. THREE-SUN: page restoration and a retained-triangle saving

Let H be a closed component of the link at v with central triangle abc and independent ears x,y,z adjacent respectively to {a,b},{b,c},{c,a}, with no other H-edges. Other link components and all outside incidence are arbitrary. Set M0={az,bx,cy}, M1={ax,by,cz}. Delete the six vH spokes and M0 to obtain K. The three hub triangles on M0 use only deleted edges, and X=M0 union {va,vb,vc} hits ALL lost triangles: closedness handles lost spokes; other lost triangles use M0. Combined minimality and old balanced accounting force B(K) and nu(G)=nu(K)+3.

The residual J=H-M0 is triangle abc with pendant edges ax,by,cz. Suppose f in M0 has an external page with apex t outside the cone. This page plus the three hub triangles on M1 are edge-disjoint. By cyclic symmetry take f=az. Their entire surviving footprint is {ax,by,cz,at,zt}. A residual clique meets H in a clique of J, contained in abc or one pendant edge. It therefore sees at most one M1 edge and at most one page spoke (az is absent). If both occur, the only possible pairs are {ax,at} and {cz,zt}, each a two-edge star: all other pairs require a missing ear-to-center or ear-to-ear edge. Hence block avoidance appends four triangles, contradicting the forced increment3.

There are no external pages on M0. Every lost triangle is therefore in the cone over H. The six edges Z={va,vb,vc,ab,bc,ca} cover all these triangles: each hub triangle has a central endpoint, and each rim triangle has a central edge. The triangle abc survives in K, so EVERY minimum K-cover overlaps Z. Their union costs at most tau(K)+5, contradicting the forced increment6. This proves exclusion with unrestricted outside incidence. QED.

The retained-triangle cover saving has a precedent in Cui–Haxell–Ma's planar equality arguments; no claim to invent that principle is made.

## 11. Finite certificates and the complete six-link classification

**Claim.** A degree-six vertex in a minimum combined obstruction has link K6, K6-e, or K6 minus a perfect matching.

Robustness makes its link connected, since every component has at least five vertices. Triangle codegree makes its minimum degree at least2. First consider a six-vertex link H whose complement has maximum degree at least2. The artifact gives the following certificate for each such graph, up to isomorphism.

A nonsymbolic certificate is a matching M in H and a vertex set Q covering H-M, with |Q|<=r=|M|. Delete v and M to obtain K. Equivalently for a closed component at a larger hub, delete just its spokes and M. The r hub triangles on M use only deleted edges. X=M union {vq:q in Q} covers every lost triangle: hub triangles have rim in M or meet a Q-spoke; other lost triangles use M. If |Q|<r the reduction is strict. Otherwise balanced accounting forces B(K) and exact packing increment r.

Two balanced certificate forms are used:

1. **Residual nonclique.** The certificate lists actual edge-sharing-connected triangles of H-M whose vertex union S has more than five vertices or is not a clique. They must belong to one residual triangle component, contradicting literal K4/K5 support. Outside vertices cannot supply an absent edge between fixed vertices.
2. **Local packing gain.** There are r+1 edge-disjoint actual triangles in the cone over H. Let D be their ENTIRE surviving rim footprint. For every clique C of H-M of size<=4, D intersect E(C) is a star; for every clique of size<=5 it has at most two edges. Any residual K4/K5 block meets H in exactly such a clique; there are no selected surviving edges outside H. Thus these checks bound the entire block footprint even with arbitrary outside vertices. Old avoidance appends r+1 triangles, contradicting the exact increment r.

The four symbolic exceptions are K2,4, K3,3-e, K3,3, and the three-sun. The first three are excluded by the unbounded BIP proof; Section10 handles the fourth.

The57 representatives comprise19 residual-nonclique,34 local-gain, and4 symbolic certificates. The generator uses installed NetworkX representatives, but completeness does NOT assume the atlas complete: verification enumerates all32768 labeled six-vertex graphs. All11982 connected minimum-degree-two graphs with complement maximum degree>=2 are in the verified template orbits. A fresh critic independently replayed every predicate and all labeled graphs using a separate standard-library checker, without reading/importing the generator or NetworkX; it found no missing, extra or duplicate orbit. This is finite-assisted ordinary mathematics, not a Lean proof. The exact finite predicates and the symbolic lift to arbitrary outside incidence are separate obligations.

The remaining complement has maximum degree<=1, so its edges form a matching of size0,1,2,or3. R6 excludes size2. The other three possibilities are exactly the stated links. QED.

## 12. Low-degree independence and four high neighbors

**Claim.** All degree<=6 vertices of a minimum combined obstruction are independent; every degree>=7 vertex has at least four degree>=7 neighbors.

Minimum degree5 follows from known robustness. The public degree-five package excludes adjacent5/5 and5/6. For adjacent6/6, Section11 gives common-neighbor count4 or5. Count5 gives twins; domination in a link excludes a perfect matching complement, so their common five-link is K5 or K5-e, excluded by TWIN. Count4 is the strict reduction in notes/SCOUT_B_RESULTS.md SectionB2. For its C4 case use cycle order w1,w2,w4,w3, so w1w2 and w1w3 exist. Both private neighbors join all four common vertices. The common link is K4 or C4, since K4-e would produce the excluded two-edge complement matching. B2's explicit5/9 or6/11 tuple is strict. The initial tuples in TWIN and B2 are from Puleo Proposition5.2 Cases3 and2 respectively; the new work supplies their validity under combined minimality and TWIN's strict residual restoration.

Now let v have degree k>=7 and at most three high neighbors B. A degree-six neighbor would need at least four common neighbors with v, by Section11; all must be high by low-degree independence. This is impossible. All low neighbors are therefore degree5, each needing at least three common neighbors by the old five-link classification. Thus |B|=3 and every low neighbor joins all B. There are at least four low neighbors; two share {v} union B of size4, contradicting the old degree-five common-neighbor bound<=3. QED.

## 13. Complete combined theorem for mad<25/4

**Theorem.** Every finite simple graph G with mad(G)<25/4 satisfies tau(G)<=2nu(G), with equality iff every nonempty shared-edge triangle component has literal K4 or K5 support. Triangle-free background edges and vertex sharing are allowed.

**Proof.** The class is subgraph-closed. A minimum-edge failure of the combined statement has all structural properties in Sections11–12. Give each vertex its degree as initial charge, and let each degree5/6 vertex receive1/4 from every neighbor. Low vertices are independent: a degree5 vertex ends with25/4; degree6 ends with30/4. A degree k>=7 vertex has at most k-4 low neighbors and ends with at least k-(k-4)/4=3k/4+1>=25/4. Total charge is unchanged, giving average degree>=25/4, contrary to mad<25/4. The reverse equality implication is the known block parameter calculation. QED.

The quarter-charge rule and arithmetic are precisely Puleo Theorem6.1, which proved the inequality. This mission supplies its structural premises for COMBINED minimality, using the exact finite certificates and symbolic boundary arguments above. This intermediate theorem alone does not prove mad<7; the complete stronger conclusion is established in Sections15–17. Historical originality is UNESTABLISHED; independent_final_verification is NOT_RUN.

This class goes beyond five-degeneracy: K7 has mad6 but is not five-degenerate. Conversely K5,9 is five-degenerate with average degree45/7>25/4. Thus the two hypotheses are incomparable. Maximum degree<=6 is a direct corollary, since mad<=maximum degree<=6<25/4.


## 14. Optional high-degree subsumption lift (not needed by Section16)

**Claim.** If a degree k>=10 vertex v in a minimum combined obstruction subsumes a degree<=6 vertex w, it has at most k-6 low (degree<=6) neighbors.

Suppose otherwise. Write A for its low neighbors and B for the others, so |A|>=k-5>=5, |B|<=5. Low-degree independence gives A independent. Every a in A has at least three neighbors in B; a degree6 member has at least four. Subsumption gives d_B(w)=d(w)-1>=4, hence |B|>=4. We construct an A–B matching M incident with w and a vertex cover Q of H-M, H=G[N(v)], with |Q|=|M|, following the matching cases in Puleo Lemma7.3.

If |B|=4, greedily match three vertices of A-w to distinct B vertices and w to a fourth; take Q=B. If |B|=5 but b in B has no A-neighbor, the same construction saturates B-b; take Q=B-b. This is a cover of H: an edge within B incident with b still has its other endpoint in Q. In both cases M has size4 and contains an edge at w.

Otherwise |B|=5 and all its vertices have A-neighbors. Put T=union of N_B(a) for a in A-w. If |T|=3, choose three distinct a1,a2,a3 in A-w and distinct b1,b2,b3 in T, and choose b' in N_B(w)-T. Take M={a1b1,a2b2,a3b3,wb'} and Q=B-b'. This covers H-M: no A-w vertex joins b', and wb' was deleted. If |T|>3, Hall's condition holds for matching all B. A singleton has a neighbor. A two-element B0 has w as a neighbor, and at least one other A-neighbor because otherwise all A-w neighborhoods would equal B-B0 of size3. A subset B0 of size>=3 meets every A-neighborhood, so it has at least |A|>=5 neighbors. Thus choose a matching saturating B. If it omits w, replace the edge matched to some b in N_B(w) by wb. Take Q=B, |M|=5.

The hub triangles on M and X=M union {vq:q in Q} give a balanced singleton reduction to K=G-v-M. No B-internal edge was deleted. Let W=N(w)-{v}, a subset of B. If d(w)=5, G[W] is K4 or K4-e. If d(w)=6, it is K5 or K5-e: domination rules out the perfect-matching complement of its six-link. In a near-clique case, W itself contains an induced diamond. In a clique case, write wb for the unique M-edge at w, and choose distinct c,d in W-b. The vertices {w,b,c,d} induce a diamond in K, missing wb. In either case two actual triangles share an edge but their missing diagonal precludes a literal clique triangle component. This contradicts B(K). QED.

This lifts the stated conclusion of Puleo7.3 by an explicit residual-diamond contradiction; it does not import his no-reducible-set hypothesis. The alternate final discharging argument below does not need this lemma or his Lemma7.4.

## 15. Degree-eight subsuming-five exclusion

The full exhaustive ordinary proof is preserved in notes/SCOUT_B_DEGREE8.md. It contains the singleton residual-diamond obstruction, all independent-Z cases, all near-clique-W cases, and the full-W/all-active-Z page-family argument. Every page family consists of ALL actual external pages on the relevant rim; residual footprints are checked for arbitrary attachments. The fresh critic independently reconstructed every case and accepted the full lemma; see ADVERSARIAL_REVIEW.md.

## 16. Complete weighted discharging proof for mad<7

Use the degree5/6 classification and independence above. For a low vertex, call a neighbor a subsumer if its closed neighborhood contains the low vertex's closed neighborhood. Send charge as follows: a degree5 vertex takes2/3 from every subsumer; a thin degree6 vertex (exact complement perfect matching) takes1/6 from every neighbor; a non-thin degree6 vertex takes1/4 from every subsumer. These are Puleo's charge rules, but we justify the high-degree bounds for combined minimality separately.

Every degree5 vertex has at least three subsumers and reaches charge>=7. Every thin6 has six neighbors and reaches7. Every non-thin6 has at least four subsumers and reaches>=7. No low vertex gives charge, by independence. A degree7 vertex loses none: B4 rules out subsumed5, DOM rules out subsumed non-thin6, and THIN rules out thin6 adjacency. A degree8 vertex has at most four low neighbors; Section15 excludes its subsumed5 neighbors, so each receives at most1/4 and the donor ends at least7.

For degree9 let t be the number of low neighbors and B the high neighbors. If t<=3, total loss<=3(2/3)=2. If t>=4 then |B|<=5; also t<=5 by the four-high-neighbors lemma. It cannot subsume two degree5 vertices a,b: the four-sets N(a)-{v}, N(b)-{v} lie in B, so intersect in at least three vertices; including v, a and b would have at least four common neighbors, forbidden by the old degree5 overlap lemma. Hence at most one payment is2/3, and each other payment is<=1/4. Loss is at most2/3+4/4=5/3<2.

For degree k>=10, if two degree5 neighbors are subsumed, the same overlap lemma forces at least six high neighbors. Thus t<=k-6 and final charge is at least k-2(k-6)/3=k/3+4>=7. If at most one degree5 neighbor is subsumed, the four-high-neighbors lemma gives t<=k-4, and total loss is at most2/3+(k-5)/4. Final charge is at least3k/4+7/12>7. The no-low-neighbor case is immediate and also satisfies the bound.

Consequently every vertex in a minimum combined obstruction has final charge at least7. Total charge is unchanged. Any minimum failure in the hereditary class mad<7 would have average degree>=7, contradicting membership in that class. Combined P therefore holds throughout mad<7. No claim of the degree9 subsumption conclusion in Puleo2.7(f) is needed; the proof does not import it, and Section14 is an optional extra, not a premise.


## 17. Final theorem, dependency boundary, and remaining frontier

**Theorem (ordinary proof with a finite certificate classification).** For EVERY finite simple graph G such that every nonempty subgraph H has 2|E(H)|/|V(H)|<7,

    tau(G) <= 2nu(G),
    tau(G) = 2nu(G)  iff  B(G).

Here B(G) means that every nonempty triangle component connected through shared actual graph edges has literal K4 or K5 edge support. All actual triangles, including crossing triangles, enter the definition. Triangle-free background edges and arbitrary vertex sharing are permitted, and triangle-free/empty graphs satisfy the equality statement vacuously.

The proof is Section16, using the known combined-minimal criticality/robustness/degree5 package, the six-link certificate theorem of Section11 (R6, BIP and THREE-SUN plus exact finite certificates), low-degree independence and four-high-neighbor lemma of Section12, TWIN/B2, THIN/DOM, and the degree7/8 donor exclusions. The new Section14 high-degree lift and SEP are independent additional results. Neither two-red S/E, Liu/Parker, Gupta's catalogue, Kandasamy's catalogue nor Puleo's no-reducible-set conclusion is a premise of this theorem. Puleo supplies reduction templates and charge rules; the combined-obstruction restoration obligations are proved here.

The fresh critic reconstructed this complete chain and independently replayed the six-link finite certificate file without reading/importing its generator. This is internal AI criticism within discovery, not separately commissioned full final verification. Evidence category: PROVED_ORDINARY_USING_PUBLISHED_INPUT, with the finite substep separately FINITE_CHECKED. No new Lean theorem, external human review or historical priority is claimed; independent_final_verification: NOT_RUN.

The hypothesis is incomparable with five-degeneracy. K7 has mad6<7 but is not five-degenerate. K5,12 is five-degenerate and has average degree120/17>7, so it is not in the mad<7 class. Nonempty7-regular graphs have average degree7 and are excluded by the strict bound. The theorem therefore does not resolve equality for all graphs of maximum degree7, nor unrestricted equality, Tuza, S or E.

The mechanism transferred is concrete: balanced reductions supply literal residual blocks; a selected packing has a proved bounded entire footprint in each such block, or closure constrains all external pages sufficiently to produce a strict cover saving. BIP allows a link component of arbitrary order; R6/TWIN allow other hub components and unbounded hub degree; the degree8 page families have unrestricted multiplicities and outside incidence. What remains unavailable is a theorem supplying such a repair for arbitrary reductions or high-density cores. A full final audit of this frozen chain is the next recommended step, not an automatically initiated new campaign.
