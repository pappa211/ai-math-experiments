# Track A — mixed packet augmentation and actual private-fan closure

**Final reviewed scope:** The fresh independent critic accepted the complete fixed-cover chain after the last author handoff. Together with the stated accepted ordinary Tuza inputs, S holds for tau<=8 and nu<=4; E follows. The self-contained structural theorem is k<=3 plus an all-red triangle implies tau<=6. Final controlling proofs/status are PROOF_AND_OBSTRUCTIONS.md §9, notes/TRACK_B.md §§17–18, and notes/INDEPENDENT_CRITIC.md §§26–27. Earlier freezes and pending-review labels below are preserved chronological stages and are superseded by this signoff. General S/E remain unresolved.


## A0. Independently reconstructed automatic regime

For any maximum full triangle packing P of size nu and minimum cover C of size tau, if t members are all-red, the disjoint packed triangles consume at least (nu-t)+3t distinct red edges. Thus tau >= nu+2t, t <= floor((tau-nu)/2), and k(G,C) >= nu-floor((tau-nu)/2). If 2tau <= 3nu then the latter integer is at least ceil(tau/2). No assumption tau<=2nu was made. Write loss=nu-k and allowance=nu-ceil(tau/2). S at C is exactly loss<=allowance. If tau is either 2nu or 2nu-1, allowance=0. The condition tau>=2nu-1 ALONE does not imply allowance=0: tau>2nu would instead have negative allowance and refute Tuza if exactly certified.

## A1. Unique private witnesses, including the K4 concern

**PROVED_ORDINARY, independently reconstructed.** If Q_e and Q_f are actual one-red triangles for distinct red edges e,f, and share a blue edge, no actual two-red triangle has red set {e,f}.

If e,f are disjoint they cannot occur together in a triangle. Otherwise write e=uv, f=uw. A shared blue edge forces Q_e=uva and Q_f=uwa for one fourth vertex a; their shared blue edge is ua, and va,wa are also blue. If uvw exists, vw cannot be blue, for then vwa is an actual all-blue triangle. Hence vw is red. This is exactly the full K4 closure: uvw retains its third red edge when uv,uw are removed. The geometry omits no triangle containing both deleted reds.

If e and f each have exactly one ACTUAL private witness, replace e,f in C by their common blue edge. Every affected T1 is repaired, the preceding paragraph treats every affected T2, and no T3 loses all three reds. The replacement would save one edge, contradicting global cardinality minimality. Therefore all unique actual private witnesses pack together. Uniqueness only in a chosen subfamily is insufficient.

A useful mixed consequence is that for a T2 with red edges e,f, ANY chosen private witness of e and ANY chosen private witness of f are edge-disjoint. The red resources differ and shared blue would contradict the preceding closure fact. Every red edge has a private witness because a minimum cover is inclusion-minimal.

## A2. Actual private-fan dichotomy around an all-red triangle

**Literal new restricted lemma, PROVED_ORDINARY; independently reconstructed by Track B while reviewing A10.** Let R=abc be any all-red actual triangle of a globally minimum cover C. Let A_R be the set of outside vertices x for which at least one of abx,acx,bcx is an actual private triangle. Then exactly one of the following holds:

1. |A_R|>=3, and there is a private 3-packing using each edge of R once, with three distinct outside apices.
2. |A_R|=2, say {x,y}; all six cross edges from {a,b,c} to {x,y} are blue. The edge xy is either absent or red. Thus the induced five-vertex graph is K5 minus xy, or K5 with red triangle abc and red edge xy.

In particular every all-red triangle has a private 2-packing in its local fan. This does not assert these private triangles are disjoint from the rest of a maximum packing.

Proof. Construct the bipartite graph whose left vertices are ab,ac,bc and whose right vertices are A_R, with e-x meaning that ex is private. Every left vertex has a neighbor. Two left vertices cannot have a singleton union of neighborhoods: then their unique actual private witnesses would share a blue spoke, contrary to A1. Consequently all left pairs have at least two neighbors. If |A_R|>=3, these three elementary Hall conditions give a matching saturating the three left vertices. The associated private triangles are edge-disjoint: their red edges differ; their blue edges join distinct outside vertices to vertices of R.

If an apex is adjacent to two left vertices, all three spokes to a,b,c are blue and it is adjacent to all three left vertices. Therefore each apex has degree one or three. A_R cannot have size one by the pair condition. If |A_R|=2 and either apex has degree one, the two left vertices not adjacent to it have a common singleton neighborhood, again impossible. Both apices have degree three. Finally xy cannot be blue, since axy would be an all-blue actual triangle. This proves the dichotomy. QED.

**Exact exchange in the exceptional fan.** In case 2, C'=(C minus {ab,ac}) union {ax,ay} is another globally minimum cover. The only private triangles on the two removed reds have apices x,y and are hit by ax or ay. The only triangle containing both removed reds is abc, whose red bc remains. Thus all affected triangles are covered and the cost is unchanged. If xy is red, abc becomes eligible and axy becomes all-red: this is a genuine K5 migration, not an automatic improvement. Other external triangles can change color too, so no global all-red-count claim follows.

## A3. Mixed packet boundary theorem and a strict finite potential

**PROVED_ORDINARY as a conditional exchange theorem, not an existence theorem.** Fix a cover C, a full triangle packing P, and a selected subpacking A subset P. Write a_i for the number of i-red members of A. Let U be red edges unused by P. Choose any eligible packing Q such that every red edge used by Q belongs to E(A) or U. In particular Q may contain BOTH T1 and T2 triangles, and its T2 members may combine red edges from different old members. The following conditions are literal graph-edge conditions, not merely a red-label matching:

* Q is pairwise graph-edge-disjoint, on both red and blue edges.
* No red resource used by Q lies in P outside A.

Let B be the members of P outside A that intersect Q. Since those intersections cannot be red, they are blue; B contains no all-red member. Let s be the number of red edges used by A but not Q, and u the number of formerly unused red edges in U used by Q. Let q_i be the number of i-red members of Q, i=1,2. Then

    q_1+2q_2 = a_1+2a_2+3a_3-s+u,
    d := |Q|-|A| = a_2+2a_3-s+u-q_2,
    P' = (P minus (A union B)) union Q,
    |P'|-|P| = d-|B|,
    allred(P') = allred(P)-a_3.

Proof. P' is a packing by definition of B and the assumed disjointness of Q. Red-resource counting gives the first identity. Subtracting |A| and q_2 gives the second. Blue-only boundary conflicts show no all-red member is removed in B, and Q is eligible, giving the last identity. These are exact integer equalities. QED.

Consequently, if a_3>0 and |B|<=d, the move strictly increases the lexicographic potential (packing cardinality, minus all-red count). If P was maximum-cardinality, |B|<d is impossible and equality removes at least one all-red member without losing cardinality. If P is already maximum-cardinality with the fewest all-red members among such packings, EVERY feasible mixed packet containing an all-red old member has |B|>=d+1.

This is a genuinely nonlocal sufficient criterion: A and Q may span arbitrarily many old triangles, and both old and new T2 resources are counted. It does not assert that a useful packet exists. Any sequence of certified improvements terminates, since there are finitely many packings and the displayed potential strictly increases. Uncertified local rotations can cycle; a cycle is not progress under this theorem.

### Private fan packets are only one subclass

The local facts A1/A2 supply packets: a T2 has an edge-disjoint pair of private witnesses, and a T3 has a private pair, or a triple in its wide-fan case. T1 members may be rerouted through another private witness. Any selected node may also contribute just one private replacement when that suffices to repair color. Before combining packets, all BLUE conflicts across different packets must be checked; distinct red labels alone are insufficient.

If the local chosen private witnesses are globally disjoint, q_2=0 and the boundary rule applies. Replacing a T3 by a private pair gives one unit of boundary allowance; a private triple gives two. Expanding an obstructing T2 to two private witnesses gives one additional unit. These are the concrete branching credits of an alternating fan. When private choices collide, mixed T2 recombination can exchange two red resources for one blue resource and continue the fan. The exact identity above accounts for that cost via -q_2. The twenty-vertex cone below demonstrates why a private-only closure rule is inadequate.

### Exact cover exchange does not yet close this fan

For admissible S subset C (no actual T3 wholly in S), let F(S) contain each blue edge forced by a T2 whose red pair is in S, and let H_S have the remaining blue edges as vertices and the unhit T1 blue pairs with red label in S as its edges. The exact repair cost is

    beta(S)=|F(S)|+vc(H_S),

and global minimality gives beta(S)>=|S| for EVERY admissible S. The packet theorem and this identity use the same resources: F(S) is the collection of one-blue/two-red constraints; H_S contains two-blue/one-red constraints. A matching in H_S must additionally obey red labels, and forced blue resources in F(S) may already belong to other packets. An all-red triangle also makes S inadmissible, so its three red resources cannot simply be deleted as one repair demand.

**Precise missing general bridge.** Starting from a maximum full packing whose all-red count exceeds allowance=nu-ceil(tau/2), derive either (i) a feasible mixed packet with a_3>0 and |B|<=d, or (ii) an admissible S with beta(S)<|S|, contradicting minimum C. Neither implication is proved. Even reaching the minimum possible all-red count among full maximum packings could be stronger than S: a maximum eligible packing need not a priori extend to a maximum full packing. We therefore do not declare this proposed bridge equivalent to S. In the tight/one-off cases tau in {2nu,2nu-1}, it would have to eliminate every all-red member; in the connected K4-book family, positive all-red loss is allowed and exactly consumes the allowance.

## A4. Four-face collision accounting

The following local taxonomy explains why a fan cannot use an abstract hypergraph in place of the actual graph.

Let T=uvw be T2 with red uv,uw and blue vw. Let an incoming private Q=vwz have red wz and blue vw,vz. They share the blue blocker vw. If the sixth edge uz is absent, there are only the two existing faces of this four-vertex pattern. If uz is blue, the other two actual faces are uvz (T1 with red uv) and uwz (T2 with reds uw,wz). If uz is red, they are uvz (T2) and uwz (T3). Thus a local routing move may create an all-red face; this resource is not silently discarded.

For two private triangles uvx,uvy sharing blue uv, consider their red edges. If they are ux,uy (adjacent), all of vx,vy,uv are blue. The sixth edge xy is absent or red; if present it produces all-red uxy and private vxy. If the two reds are ux,vy (disjoint), then vx,uy,uv are blue. A blue xy gives two further T1 faces uxy,vxy; a red xy gives two T2 faces; an absent xy gives neither. Relabeling u,v covers the symmetric cases. These are direct color/closure checks, not free augmentations.

The strict potential in A3 is evaluated only AFTER assembling a globally compatible packet. This avoids treating repeated K4 rotations, or the historical ten-vertex cover-migration cycle, as well-founded progress.

## A5. Exact genuinely nonlocal mixed control on the existing20-vertex cone

The graph is the authenticated TUZA-14 reduced cone over the19-vertex triangle-free base H, with apex19, independent base set I={0,1,2,3,4,5}, and thirteen red spokes to the other base vertices. This is an AUTOMATIC-regime control: (tau,nu,k)=(13,9,9), so 2tau=26<=27=3nu. It is not new hard-regime evidence.

A new independently authored fixed-graph checker regenerates all48 actual triangles, verifies H triangle-free, rejects all50,388 independent7-subsets of H, and retains I as an independent6-set. Thus alpha(H)=6. Cone triangle cover equals base vertex cover: selected spokes give vertices and each selected rim edge can be replaced by one endpoint, with no cardinality increase. Hence tau=19-6=13. Every cone triangle uses two distinct spokes, so nu<=floor(19/2)=9; the displayed nine-packing attains it. Private triangles each use an I-spoke, so private k<=6, also attained.

Consider this eight-edge base matching (each edge uv stands for triangle uv19):

    M = {3-17, 1-9, 5-18, 8-14, 4-11, 10-15, 0-7, 12-13}.

The unmatched base vertices are {2,6,16}. There is no edge between them and no alternating path of length3. Thus the corresponding eligible eight-packing has no augmentation replacing at most one old triangle. It is still not globally maximum.

The alternating path

    2 -- 9 == 1 -- 10 == 15 -- 6

has nonmatching edges marked -- and old matching edges marked ==. Remove private triangle (1,9,19) and T2 triangle (10,15,19); insert private triangles (2,9,19),(1,10,19) and T2 triangle (6,15,19). This replaces two old triangles by three, producing a maximum eligible nine-packing. The selected red usage changes from3 to4: formerly unused red spoke6-19 is consumed. Blue usage changes from3 to5, including previously unused blue spoke2-19. All other packing edges remain disjoint. In A3, a_1=a_2=1, a_3=0, s=0,u=1,q_2=1,B=empty, so d=1.

This is a concrete mixed one-red/two-red nonlocal augmentation, with an exact certificate that a one-old-triangle local search would stop too soon. The ordinary matching representation of cones supplies the missing global augmenting-path theorem in this restricted class. For general actual graph triangles, red resources are edges rather than spoke endpoints; a Berge-style alternating path theorem with the required mixed capacities has not been established.

A separate maximum-private prepacking of six triangles, from base edges

    {5-8,2-14,1-10,0-6,4-11,3-13},

cannot extend past eight eligible triangles. Its seven remaining base vertices admit a matching of size2 and no size3 matching, checked by every three-edge subset. Thus retaining a maximum private prepacking can lose a full eligible optimum, even though a mixed reorganization attains nine. This is an auxiliary obstruction, not S/E failure.

Discovery sampled matchings only in this one fixed graph, with seed141414; the first example whose shortest augmenting path has length at least5 appeared at zero-based trial2941, in about0.037s. The preserved certifier uses literal matchings and exhaustive tiny checks, not random search. Evidence: checks/track_a_mixed_path.py and evidence/track_a_mixed_path.json. Its direct certificate run took about0.019s.

## A6. A two-edge cover pivot can lose an old T1 member

For Track B cross-review, suppose C maximizes k among all optimum covers, P is maximum eligible for C, and a free all-red R=abc has the two-apex fan {x,y} of A2. For each a in R, the optimum pivot removing ab,ac and adding ax,ay makes R eligible. Therefore some member of P must become all-red, or P together with R would enlarge after the pivot.

The lost member is either a T2 using one of ax,ay, or, when xy is red, the T1 triangle axy containing BOTH newly red edges. This second possibility must not be omitted: the historical one-edge-swap rule that only T2 members can be lost does not extend unchanged to a two-edge swap. Distinct a rows use disjoint blue pairs, and a T2 has only one blue edge; hence each T2 blocks at most one row. P contains at most one axy because these triangles share red xy. Thus if xy is absent there are at least three distinct T2 blockers. If xy is red there are at least three T2 blockers, or one axy plus at least two distinct T2 blockers. This is a scoped necessary condition, not an unconditional migration theorem.

## A7. Fixed-control tests and truthful limits

checks/track_a_fans.py freshly regenerated actual graph triangles for14 fixed graphs and271 specified optimum covers: the264 historical all-optimum controls; the20-vertex cone; two cover-drop colorings; three small fully K4-decorated books; and K5 minus an edge. Minimum-cover identities for historical controls are explicitly reused authenticated receipts, not newly recertified by that script. The20-vertex cone received its independent alpha/minimum proof in A5. New decorated-book minima have the saturated-block lower bound.

The 488 all-red fan instances split into186 exact two-apex fans and302 wide fans with a private3-packing. All186 equal-cost fan pivots were checked on the full actual triangle family. There were1,312 T2/private-pair checks and3,474 shared-private-blue instances with a triangle containing both red labels; all retained its third red. A newly authored include/exclude packing DP also optimized full cardinality and then minimum all-red count. No maximum-extendible-threshold failure occurred in this fixed domain; automatic controls do not count as hard-regime exploration.

checks/track_a_packets.py examined123 all-red seeds in fixed full maximum packings chosen to maximize all-red count. It found74 direct private color repairs and49 unrepaired seeds; expanding at most four old nodes added no further repair. No state/time cap was reached. This is bounded packet search, not a complete no-augmentation certificate. The initial exploratory version required at least two private replacements of a T3; it was corrected to include one-witness color repair before final interpretation. Only the corrected result is the retained evidence. The private-only subclass still does not represent all mixed packets, as A5 explains.

The historical nine-vertex unique-witness obstruction still prevents safe maximum prepacking; the20-vertex example now additionally exposes a concrete nonlocal mixed path and a private6 forced-extension loss. Clebsch cones have no all-red triangles for any minimum cover, so A2 is vacuous there while mixed matching remains relevant. K4 is allowance-zero with no all-red minimum cover; K5 is allowance-zero and every all-red maximum-packing seed tested has a direct repair. Cover-drop remains a counterexample to cross-cover unique-witness deletion bounds. The three old near misses remain automatic. Connected K4-decorated books have loss=allowance=1 at the all-core-red optimum and approach ratio2; a full eligible maximum need not exist there, and the packet mechanism must respect that permitted loss.

## A8. Independent cross-review of the distinct mechanisms

Track B's K4/K5 attachment inheritance was reconstructed independently. Its exact cover lower bound uses edge-disjoint block supports and residual edges; one may not silently apply it to repeated gadgets on the SAME root edge. Its all-optimum characterization requires the core restriction still cover all core triangles. With those scopes, the residual S/E inheritance and minimal-obstruction exclusion of pendant K4/K5 blocks are valid.

The coordinator's LP proposal also checks mathematically, conditional on the precise primary-source Furedi theorem. If x is an optimal fractional packing, tau*=sum x, and x_i is the mass on i-red triangles, then tau*+x_2+2x_3<=tau. With g=tau-tau*, eligible fractional mass is at least tau-3g/2. If g=0, every positive-weight triangle is T1 for any fixed globally minimum C. Actual graph triangle hypergraphs are Fano-free: any pairwise edge-intersecting triangle family either shares one common edge or lies among the four K4 faces, whereas the Fano configuration has seven pairwise-intersecting triples and no common point. Thus the stated rank3 Fano-free fractional matching bound would yield private packing>=ceil(tau/2) when tau*=tau. Exact source verification and the final LP statement belong to the coordinator; this note is an independent check of its algebra and realizability hypothesis, not a claim to have reaudited the paper.

## A9. Track verdict and next question

The scoped fan dichotomy, exact exceptional pivot, mixed packet boundary theorem, explicit mixed path, and the stronger low-packing classification in A10 are ordinary mathematics with finite implementation checks. None proves S or E. Historical novelty is UNESTABLISHED. No Lean, publication, external upload, installation or source-workspace mutation was used.

The highest-value missing assertion is a red/blue-capacitated fan theorem that links the simultaneous exact inequalities beta(S)>=|S| to either a low-boundary mixed packet or a quantitatively permitted loss certificate. The two-apex case exposes the K5 terminal; saturated K4 attachments expose a nonlocal obstruction whose loss exactly matches allowance. A useful general theorem must charge those terminals to allowance, not insist on zero loss outside the tight/one-off regimes, and must include T2 recombination rather than forcing a private prepacking.


## Control and obstruction obligations

The nine-vertex unique-witness example prevents forcing witnesses into a maximum packing. The twenty-vertex cone prevents ignoring T2 packets even with at most two private witnesses per red. The Clebsch cone, K4/K5, the cover-drop graph, the three TUZA-13 near misses, and the newly discovered edge-attached-K4 family are designated controls. Exact targeted tests and source identities will be recorded in checks/track_a* and evidence/track_a*. No passing finite count will be interpreted as S/E.

## A10. Low-packing classification from the actual fan — strongest new scoped theorem

**Literal statement recorded by 2026-11-02 19:38:20 UTC; PROVED_ORDINARY, coordinator independently reconstructed the key argument concurrently, and Track B independently reconstructed and accepted the entire proof. Further final critic review is a separate mission gate.** Let C be a globally minimum triangle cover of G. Suppose C contains an all-red actual triangle and k(G,C)<=2. Then all actual triangles of G lie in one induced five-vertex block H, which is either K5 minus one edge or K5. In the first case tau(G)=3,nu(G)=k(G,C)=2; in the second case tau(G)=4,nu(G)=k(G,C)=2. Edges outside H may remain, but belong to no actual triangle. No assumption of Tuza is used.

Proof. Let R=abc be all-red. A2 excludes a wide fan, since its private3-packing would force k>=3. Hence the private apex set is exactly {x,y}, all six cross edges are blue, and xy is absent or red. Let H be the induced graph on {a,b,c,x,y}. Its six R-private triangles admit a pairwise edge-disjoint private2-packing avoiding ANY prescribed graph edge of H. There are only these edge orbits under relabeling a,b,c and x,y:

| Prescribed edge | Avoiding private2-packing |
| --- | --- |
| ab, a red edge of R | acx, bcy |
| ax, a blue cross edge | aby, bcx |
| xy, when present/red | abx, acy |

Each displayed pair has distinct red edges and distinct apices and is directly edge-disjoint.

Suppose a red edge e lies outside E(H). Minimum C gives an actual private witness Q_e. Since H is induced, Q_e has a vertex outside V(H), and therefore has at most one edge in E(H). Select one of the displayed private2-packings avoiding that edge (or any displayed pair when there is no intersection). The pair and Q_e are three eligible edge-disjoint triangles, a contradiction. Thus C subset E(H). All six cross edges are blue, so C is exactly E(R), together with xy if that edge exists; hence |C|=3 or4.

Now suppose an actual triangle Q has a vertex outside V(H). It has at most one edge in E(H), and all red edges lie in E(H). Since C covers Q, exactly one of its edges is red. Thus Q is private, and the same root-avoiding private2-packing yields three eligible triangles, a contradiction. Consequently every actual triangle lies in H. Both possible H have maximum full/eligible packing2. Their displayed covers have size3 and4 respectively, and C is globally minimum by hypothesis, proving the stated exact optima. QED.

**Self-contained corollary.** For every minimum C, k(G,C)<=2 implies nu(G)=k(G,C). If no all-red triangle exists this is immediate because every triangle is eligible; otherwise the theorem gives both equal2. Therefore nu(G)=3 implies k(G,C)=3 for EVERY minimum C. More generally nu>=3 always implies k>=3.

**Near-tight consequence with literal fixed optima.** S holds for every graph with (tau,nu)=(5,3) or (6,3): k=nu=3 reaches ceil(tau/2). The pair (5,3) is genuinely one-off, and (6,3) tight. This conclusion does not assume the universal inequality tau<=2nu; the exact optima are hypotheses. Combining this with an externally accepted ordinary Tuza theorem for nu<=3 would prove S for that full low-packing class, but that is a separate explicitly sourced dependency and is not needed for the self-contained classification.

This theorem closes the proposed tiny two-blocker configuration: a full3-packing with one all-red member could leave only two eligible members only if the entire triangle support were K5/K5-e, which has nu2. No abstract three-uniform replacement is used. Historical novelty remains UNESTABLISHED.

## A11. Bounded frontier at nu=4: precise wide/thin bottlenecks

This final bounded investigation does NOT prove k<=3 implies tau<=6, and does not claim S for (tau,nu)=(7,4) or (8,4). The low-packing theorem A10 is the reviewed stopping point. The following auxiliary deductions and literal obstruction were generated during the bounded follow-up; they are available for criticism and are not labeled independently reviewed here.

### Wide fans: the root-avoidance gap is real

For an all-red R, its private-apex incidence graph has three left red labels. Each outside apex is adjacent to either one or all three labels, by actual triangle closure. A private triangle Q for a red edge outside E(R) has at most one vertex v in R. It therefore intersects R-private witnesses only through at most two blue spokes incident with v. To find a private3-packing in the fan disjoint from Q, delete the affected incidences from the three-left bipartite graph and ask whether it still has a matching saturating all three labels. This is an exact small matching criterion, not an assertion of robustness.

**Concrete auxiliary refutation of automatic robustness.** Let R=abc be red, let x,y,z be three universal blue apices, and add red edge xy. These are all13 graph edges. C={ab,ac,bc,xy} is globally minimum: the induced K5 on a,b,c,x,y needs four cover edges, and C covers every actual triangle. Three distinct-apex private witnesses give nu>=3. Four triangles would use12 of13 edges; their union has even degree everywhere. The graph has four odd-degree vertices a,b,c,z, so deleting one edge cannot leave all degrees even. Hence nu=k=3. Every private witness vxy of red xy blocks every private3-packing around R: the two red labels incident with v would both be forced to use the sole remaining apex z. Thus a wide fan plus an outside red edge need not produce four eligible triangles. This example has tau4, not tau7/8, and refutes only that auxiliary extension.

**Conditional robust-fan lemma.** If each red edge of an all-red R has at least four actual private witnesses, and C has any red edge outside E(R), then k(G,C)>=4. Choose a private witness Q of the outside red. Removing its at most two fan-blue spokes deletes at most two apex choices from each of the two red labels incident with its possible R vertex, and none from the opposite label. The remaining neighbor sets have sizes at least2,2,4. Every singleton and pair has enough neighbors, and the union contains at least four, so the three-left Hall conditions hold. The resulting private3-packing is disjoint from Q. If Q has no R vertex, no deletion is needed. QED.

Consequently, any putative k3,tau>=7 pair has, in each all-red triangle, a red edge with at most three private witnesses. The example above shows the numerical four-witness hypothesis cannot simply be reduced to three in this particular robust-fan assertion.

### Thin fans: a two-blue-edge bottleneck remains

Let H be the induced K5/K5-e thin fan. For an eligible private2-packing outside H whose red labels lie outside E(H), each selected triangle intersects H in at most one BLUE edge. A local private2-packing avoiding those intersections would give an eligible4-packing.

Direct local analysis gives the exact obstruction shapes. In K5-e, a private2-packing avoids any two forbidden blue edges precisely when those edges have no common endpoint; pairs sharing either an R vertex or an apex can obstruct. In K5 (where the three xy-private triangles are also available), all pairs can be avoided except {ax,ay} for one R vertex a. Any zero- or one-edge forbidden set is avoidable in both blocks. The small checker enumerates all15 two-blue-edge pairs in each block and records the exact witnesses/failures.

There is a useful existence fact about the outside red labels: for ANY three distinct red edges of a minimum cover, their complete private families contain an edge-disjoint pair. Otherwise their union is a pairwise edge-intersecting family of actual graph triangles. Such a family either shares one common graph edge or lies among the four faces of one K4. A common red edge cannot serve three different private labels. A common blue edge makes every relevant red's actual private witness unique, contrary to A1. Among three K4 faces carrying three distinct private red labels, the only possible labels are the edges of the fourth face; each is again uniquely private within the complete relevant families, contradicting A1. If all four K4 faces are private, counting their four red incidences gives exactly two red graph edges, insufficient for three labels. This proves the fact.

For tau>=7, at least three red edges lie outside a thin K5 block (at least four outside K5-e), so an outside private2-packing exists. What is NOT proved is that one can choose such a pair whose intersections avoid the exceptional two-blue-edge patterns. Further closure analysis begins to propagate private witnesses and red labels through additional K4 configurations; no complete reduction or charging argument was established within this bounded follow-up. That is the explicit first remaining thin-fan obstruction.

Taken together, these two cases sharpen the next problem without asserting the desired nu4 conclusion: either control a red label with at most three private witnesses in a wide fan, or force a nonbottleneck outside private pair for a thin fan. The existing connected K4-decorated triangle has (tau,nu,k)=(6,4,3), so a correct theorem could at most force tau<=6 at k3; it cannot demand zero eligible loss merely because nu4.


Track A freeze: all five checks/track_a_*.py scripts completed successfully; no owned computation remains running. No local commit was made by this delegated context. Final source A10 is independently cross-reviewed by Track B and coordinator; A11 remains a bounded partial frontier with no general nu4 claim.

## A12. Renewed frontier: thin-fan theorem at eligible packing three

**Literal theorem, frozen at20:10:38 UTC and subsequently ACCEPTED ORDINARY by the fresh independent critic.** Let C be a globally minimum triangle cover, and suppose k(G,C)<=3. If an all-red triangle R has exactly two actual private apices, then tau(G)<=6. This is a conditional theorem excluding BOTH thin-fan cases at the unresolved thresholds tau7/8. It does not settle a graph in which every all-red triangle has a wide fan. No assumption of Tuza or of nu is used.

Write R=abc and its apices x,y. Let H=G[{a,b,c,x,y}]. By A2, H is K5-e or K5, with C_H=C intersect E(H) equal to {ab,ac,bc}, plus xy when present. Let D=C minus E(H). If |D|<=2 then tau<=6 immediately. Assume |D|>=3.

### Step1: choose a genuinely obstructing outside private pair

By the three-red-label lemma in A11, the complete private families of any three edges of D contain an edge-disjoint pair Q1,Q2. Each Qi has a vertex outside H, since its red edge is outside the induced H. Thus Qi meets H in at most one edge, and that edge is blue. If their two intersections admitted a private2-packing of H avoiding them, those two local triangles together with Q1,Q2 would be an eligible4-packing. Hence both intersections exist and form one of the exceptional blue pairs in A11.

In particular their H roots are vp,vq with a common vertex v. The two roots lie in the bipartite blue graph K3,2 of H, so p,q are in its same side. In K5, the only exceptional pair has v in R; in K5-e, v may be in R or may be an apex. Write

    Q1=vpu,   Q2=vqw,

where u,w are outside H. The two outside vertices differ: otherwise Q1,Q2 would share edge vu. The full vertex intersection of Q1,Q2 is therefore exactly {v}.

### Step2: every actual private witness of every D-edge passes through v

Let Q be ANY actual private witness with unique red edge in D, including witnesses for the red labels of Q1 or Q2. Suppose v is not in Q. Its intersection with H is at most one blue edge h.

If there is no such h, then a disjoint pair Q,Qi would have at most one H-edge to avoid and would extend by a local private2-packing to four. Thus Q must intersect BOTH Q1 and Q2. But a triangle intersecting each of two edge-disjoint triangles whose vertex intersection is {v} must contain v: choose one shared edge with each; these two edges lie in Q and hence meet at a vertex, which can only be v. Contradiction.

If h exists and is disjoint from both vp and vq, the same argument applies, because two disjoint forbidden blue edges are avoidable in both H types. If h meets, say, vp without containing v, then it contains p. It cannot also meet vq: that would make h=pq, whereas p,q lie on the same side of the blue K3,2. Consequently h is disjoint from vq. Its two H endpoints are disjoint from {v,q}, and Q's third vertex is outside H. Therefore Q and Q2 have at most one common vertex and are edge-disjoint. Their H roots h,vq are disjoint, so the local private2-packing extends them to four, again impossible. This exhausts h and proves the claim.

Notice that the argument uses the complete actual private families. It does not infer uniqueness from a chosen witness set.

### Step3: all remaining uncovered triangles form one cone

Every D-edge therefore either is a spoke vz, or is a rim edge st whose private witness is vst. For a rim edge, v is its only possible private apex; hence that witness is unique. The endpoints s,t have blue spokes vs,vt. Two such rim red edges cannot share an endpoint, because their unique private witnesses would share the corresponding blue spoke, contradicting A1. Thus the D-rim edges form a matching. No endpoint of this matching supports a D-red spoke, because its spoke is blue. The red graph D is a star centered at v, together with a matching on other vertices, and is triangle-free.

Consider any actual triangle left uncovered by C_H. Its red edges all lie in D. If it is T1, Step2 puts it through v. If T2, its two red edges must be two star spokes: two rim reds are disjoint, and a red spoke cannot meet a red rim endpoint. Hence it also contains v. There is no T3 wholly in D. Consequently EVERY triangle uncovered by C_H contains v.

Define a base graph J on neighbors of v by putting st in E(J) exactly when vst is an actual triangle uncovered by C_H. Vertices whose v-spoke is in C_H are isolated or may be omitted. Every edge of J corresponds to an eligible triangle for C, since D is triangle-free. Moreover J is triangle-free: an actual triangle on three J vertices has all three of its graph edges outside C_H, so it would itself be a triangle uncovered by C_H and would not contain v, contradicting the preceding paragraph.

Every vertex cover Z of J repairs all triangles left by C_H by adding the spokes {vz:z in Z}. Therefore global minimality gives

    |D| <= vc(J).

### Step4: J has matching number at most two

There is one private triangle L inside H edge-disjoint from EVERY J-cone triangle. If v=a is a red-triangle vertex, take L=bcx. The spokes vb,vc belong to C_H, so b,c are omitted from J; the edges of L cannot appear in any J triangle. Relabeling gives the other R-vertex cases. If v=x is an apex (possible only for K5-e), take L=aby. The vertex y is not a neighbor of x because xy is absent; edge ab is in C_H. Again none of L's edges occurs in a J-cone triangle. The case v=y is symmetric.

Three matching edges of J would yield three mutually edge-disjoint eligible cone triangles, all disjoint from L. Hence nu(J)<=2.

An elementary triangle-free graph with matching number at most two has vertex cover at most three. More precisely, it either has vertex cover at most two or its nonisolated graph is exactly C5. Indeed in the bipartite case ordinary Konig gives vc=nu<=2. Otherwise a shortest odd cycle has length5, since length>=7 contains a3-matching. It has no chord. Any edge outside that C5, whether incident with the cycle or disjoint from it, combines with a2-matching in the appropriate remaining cycle vertices to give a3-matching. Thus only isolated vertices can remain, and vc(C5)=3.

For H=K5-e this already proves

    tau=3+|D| <= 3+vc(J) <= 6.

### Step5: the C5 exception is impossible when H=K5

Here v is a vertex of R, say a, and H's other red edge is xy. If vc(J)>2, Step4 gives J=C5 plus isolates. Both x and y are on that cycle, since the original Q1,Q2 give incident J edges at x,y. The edge xy is not an edge of J, because it belongs to C_H. Thus x,y are nonadjacent on the cycle. Label its order

    x - z - y - t - s - x.

The actual triangle xyz exists, using the red edge xy. At most one of xz,yz is D-red, since D-rim edges form a matching; therefore xyz is eligible. The two J-cone triangles axs and ayt are eligible and edge-disjoint. These three triangles are pairwise edge-disjoint and all avoid L=bcx: the vertices z,s,t are outside H, since b,c were omitted from J. Thus

    {xyz, axs, ayt, bcx}

is an eligible4-packing, contradiction. Hence vc(J)<=2, and

    tau=4+|D| <= 4+vc(J) <=6.

This completes the theorem in both thin cases. QED. Fresh independent critic acceptance was received after literal freeze.

### New exact frontier after this theorem

A putative minimum-cover pair with k3 and tau>=7 must have a WIDE private fan around every all-red triangle. A11 further forces at least one edge of each such triangle to have at most three private witnesses. The known (tau,nu,k)=(6,4,3) decorated-triangle example is wide and remains a sharp control. No argument yet bounds the number of outside red labels supported by several such low-multiplicity wide fans, and no six-edge cover has been constructed for that general configuration. This is the remaining general step, not a completed proof of S at nu4.

## A13. Three witnesses on every root edge already force tau<=6

**Conditional theorem; independently derived by coordinator and reconstructed by Track A and fresh critic.** Let C be minimum and k(G,C)<=3. If an all-red triangle R has at least three actual private witnesses on EACH of its three red edges, then tau(G)<=6. This strengthens the four-witness sufficient condition in A11.

Let N_e be the private-apex set for each root edge e. If C has no red edge outside R, the conclusion is immediate. Otherwise choose a private triangle Q for an outside red edge. Since its red label is not a root edge, Q has at most one R vertex. If it has none, it is disjoint from a private3-packing around R, giving four. If it has R vertex a and its red edge is incident with a, it meets fan resources in at most one blue spoke. Deleting that spoke removes at most one apex option from the two labels incident with a, leaving neighbor-set sizes at least2,2,3; Hall still gives a private3-packing disjoint from Q. Thus a blocking Q must be axy with red xy and blue ax,ay.

Deleting x,y from the two incident neighbor sets leaves them nonempty, while the opposite label still has at least three neighbors. The ONLY possible failed Hall condition is that the union of those two remaining incident sets is a singleton {z}. Since both original sets have size at least three, they must both be exactly U={x,y,z}. Every apex in two labels is universal by actual closure, so U is precisely the set of universal apices. The opposite label contains U but MAY have extra exclusive apices; equality with U is not asserted.

Repeat for any private witness of any outside red label. The same Hall argument forces a three-element common neighbor set for its two incident labels. Any two two-element subsets of the three root labels intersect, so this new pair shares a label with the already identified pair whose neighbor set is exactly U. Hence its forced triple is again U. Its outside red label is an edge between two elements of U. Therefore

    C minus E(R) subset E(G[U]),
    tau=|C| <=3+binom(3,2)=6.

QED. A putative k3,tau>=7 pair must therefore have a root edge with at most TWO private witnesses in EVERY all-red triangle, and A12 says every such triangle is wide. This is a necessary obstruction condition, not a proof that such a pair cannot exist.

## A14. A further bounded subcase with no universal apex

**New small conditional lemma, independently reasoned by Track A after the coordinator suggested its one-witness subcase; subsequently ACCEPTED ORDINARY by the fresh independent critic.** Suppose k<=3, R is all-red, no private apex is shared by two root labels, and at least two of the root edges have at least three private witnesses. Then tau<=4.

The three private-apex sets are disjoint. Every choice of one witness from each label is therefore a private3-packing. An outside-red private triangle Q meets fan blue resources only through at most two spokes at one R vertex. It can block every such private3-packing only by meeting EVERY private witness of some single root label. This is impossible for the two labels with at least three witnesses, so only the third label e=ab can be the target. If e also has at least three witnesses, there is no outside red at all.

If e has two witnesses abx,aby, a blocking Q must use the two blue spokes ax,ay or the two spokes bx,by. Thus Q is axy or bxy, with red label xy. All outside red labels consequently lie in the singleton {xy}, giving |C|<=4.

If e has one witness abx, every private witness of each outside red f must meet one of its blue edges ax,bx. A fixed red f has at most one private witness containing each given blue edge, because two distinct triangles cannot share both f and that blue edge. If f had only one private witness, it would conflict with the unique witness of e, contradicting A1. Hence f has exactly two private witnesses, one through ax and one through bx. The two actual triangle incidences force f=xy for a fourth vertex y, with private triangles axy,bxy. Their other blue edges ay,by make aby a second private witness of e, contradiction. Therefore no outside red exists and |C|=3. QED.

This does not classify the remaining wide fans. With no universal apex, at least two red labels must now have at most two witnesses in a putative k3,tau>=7 pair. One or two universal apices can couple several small label neighborhoods, and the exact cover-exchange constraints still contain T2 obligations between outside red labels. No argument here bounds all those red labels by three or constructs a six-edge cover. The general nu4 problem remains open in this work.

### Renewed-pass closeout

The renewed pass was authorized as a bounded mathematical continuation beginning at the actual 19:57:51 UTC clock, with substantive progress sent by20:10:38 UTC. A12 is independently accepted by the fresh critic, who checked the complete-family quantifier, the arbitrary-subset three-label lemma, the cone reduction including T2, and the C5 exception. A13 is independently cross-reconstructed; A14 is a separately scoped further conditional, also accepted after fresh independent reconstruction. No broad graph census or new background computation was launched in this pass. Historical A10 and its provenance remain unchanged. The general unresolved claim is now confined to all-wide fans with a low-multiplicity root label (and further A14 restrictions when there are no universal apices), not to the thin K5/K5-e obstruction closed by A12.

Final renewed-pass freeze:20:18 UTC approximate label; actual final clock recorded in the delegated handoff. No owned background job, solver, installation, or original-workspace write occurred. A12–A14 are ordinary proofs accepted in fresh independent criticism; the all-wide low-multiplicity general bridge remains unproved.

## A15. No universal private apex: complete conditional classification at k<=3

**Literal conditional theorem, derived jointly with the coordinator; ACCEPTED ORDINARY after fresh independent reconstruction of all cases.** If C is minimum, k<=3, and one all-red triangle R has NO universal private apex, then tau<=6. Here a universal apex means an outside vertex giving private triangles on all three edges of R. This includes the fully K4-decorated triangle sharp control (tau6,nu4,k3).

Write the three nonempty private-apex sets N_e. They are pairwise disjoint, because an apex in two is universal. Thus EVERY selection of one private witness per root edge is a private3-packing. Every private witness Q for an outside red must block all such selections; equivalently Q meets the ENTIRE private family of at least one root label. Since Q contains at most one R vertex and meets at most two fan-blue spokes there, only root labels of multiplicity one or two can be blocked.

### Classify every outside red edge

First let f have neither endpoint in R. All its private witnesses must have their apex in R in order to hit the fan. If it has only one private witness, blocking a singleton root family contradicts A1, while blocking a two-witness family automatically supplies a second private witness at the other endpoint of that root edge. Hence f has at least two private apices a,b in R. If f=uv, this forces u,v both to be private apices of root ab. Under the disjoint-apex hypothesis, its private witnesses can block the fan only if N_ab={u,v}; otherwise another ab witness avoids them. Therefore every outside rim red is exactly the apex-pair edge belonging to a root label with exactly two private witnesses. There is at most one such outside red per two-witness root label.

Next let f=au, with a in R and u outside. A private witness of f has its third vertex outside R, since a second R vertex would introduce a second red root edge. It meets at most ONE fan-blue spoke and so must hit the unique witness of a singleton root label incident with a. There are at most two possible such private witnesses. A single one would conflict with that root's unique witness, contrary to A1. Thus BOTH root edges incident with a must be singleton labels, and f has exactly the two corresponding private apices. Outside red spokes occur only at a vertex between two singleton root labels.

### Count the outside reds, with minimum-cover exchanges

Let s be the number of singleton root labels.

* s=0: there are no outside red spokes and at most three apex-pair rim reds. Thus |C|<=6.
* s=1: there are no outside red spokes and at most two apex-pair rim reds. Thus |C|<=5.
* s=2: all outside red spokes have one common R center a, and there is at most one apex-pair rim red. Let x,y be the two singleton apices incident with a. Every private witness of an outside red spoke au is aux or auy. No two leaves u,v of this star can have a BLUE edge: ux,vx are blue, so uv would create an all-blue triangle uvx. Remove every red spoke of this star and add ax,ay. This repairs every affected T1; a T2 with both removed reds would require the impossible blue uv; no all-red triangle loses all three reds, because the removed set is a star. The swap is valid, so minimum C forces at most two star spokes. Therefore there are at most three outside reds and |C|<=6.
* s=3: there are no apex-pair rim reds. All outside reds are spokes from a,b,c. The same star replacement shows at most two at each center. We now show that four such red spokes force an eligible4-packing, contradicting k<=3.

For the last case name the unique root witnesses abx,acy,bcz. No edge between x,y,z can be blue: each pair already has a common blue R neighbor (a,b,c respectively). Consequently no outside red spoke can end at an apex: for example az would require zx,zy blue for its two private witnesses. All outside red leaves therefore lie outside the six vertices a,b,c,x,y,z.

If four spokes have center counts (2,2,0), write a's leaves u,v and b's leaves w,t, ordering them so v!=t. Then

    {auy, avx, bwz, btx}

is a private4-packing. If the center counts are (2,1,1), write a's leaves u,v, b's leaf w and c's leaf t. If w!=t, use

    {aux, avy, bwz, ctz}.

If w=t, order u,v so v!=w and use

    {auy, avx, bwx, cwz}.

The only repeated-apex leaf collisions are exactly those excluded by the stated inequalities. Cross-apex blue-edge collisions are impossible because no leaf is one of x,y,z. Red spokes are distinct. These exhaust four chosen spokes when each center has degree at most two. Hence at most three outside reds exist, and |C|<=6. QED.

The proof uses complete actual private families and global cardinality minimality, not a local choice of witness representatives. The remaining all-red fan case is a positive number of universal apices; A16 below removes two or more.

## A16. The thin-fan proof actually needs only two universal apices

**Strengthening identified by the fresh independent critic and independently checked by Track A.** A12's conclusion remains true if the all-red triangle has ANY two universal private apices, even when additional private apices exist. Thus k<=3 and at least two universal apices imply tau<=6.

Choose two universal apices x,y and form the same induced H=K5/K5-e. The red set C_H and all local private2-packings and forbidden-pair classifications are unchanged. All additional root-private triangles are already hit by C_H. A12's outside-family argument concerns only red edges D=C minus E(H), and none of its steps requires x,y to be the entire private-apex set. The proof that all triangles uncovered by C_H form a cone, its matching bound and its C5 exception therefore applies verbatim. This is a hypothesis weakening of the accepted proof, not a finite-test inference.

Together A15 and A16 reduce any putative k3,tau>=7 pair having an all-red triangle to EXACTLY ONE universal private apex at each all-red triangle. A13 additionally gives a root label with at most two private witnesses. No general resolution of that remaining case is claimed here.

## A17. One universal apex and no unique root witness

**Coordinator's conditional theorem, independently reconstructed by Track A and accepted by the fresh critic.** If C is minimum, k<=3, an all-red R has exactly one universal private apex x, and every root edge has at least two private witnesses, then tau<=6.

Write N_i={x} union A_i for the three root labels, where the nonempty exclusive sets A_i are pairwise disjoint. An outside-red private witness Q must block every private3-packing around R. It has at most one R vertex, and a red spoke would let it meet at most one fan-blue edge. Deleting one such edge leaves a matching saturating all three labels, so Q must have its red edge between two outside apices and meet the fan through two blue spokes at an R vertex.

Delete those two apex choices from the two incident label sets. The opposite set has at least two neighbors. Hall can fail only by emptying an incident size-two set {x,y_i}, or by leaving both incident sets equal to {x}; the latter requires two size-two labels {x,y_i},{x,y_j} and deletion of y_i,y_j. Thus every outside red edge is either x-y_i for a two-witness label, or y_i-y_j for two such labels. There are no outside red spokes.

If at most two root labels have exactly two witnesses, there are at most three possible outside red edges, proving |C|<=6. Suppose all three labels have exactly two witnesses. The entire red set lies on the seven vertices R union {x,y_ab,y_ac,y_bc}, with D=C minus E(R) contained in the K4 on the four apices. Every actual triangle also lies on these seven vertices. Indeed a triangle with an outside vertex has at most one edge in this seven-vertex set and hence, since all reds lie there, would be private. A private root witness would contradict the exact displayed apex sets, while a private D witness outside R would fail to block the fan and give four eligible triangles.

The graph induced by these seven vertices has exactly twelve compulsory edges before D: three root edges, three blue edges from R to x, and six blue edges joining each exclusive y_i to the endpoints of its root edge. Each opposite R-to-y_i edge is absent: blue would make y_i universal, while red contradicts the outside-red classification. An edge between two apices cannot be blue, because any two apices share a blue R neighbor. Hence the graph's triangle-support graph has exactly 12+d edges, where d=|D|, and |C|=3+d.

If d>=4, at least one exclusive apex y_i has D-degree at least two, because every D edge touches an exclusive apex. Start with the cut R | {x,y_ab,y_ac,y_bc}, having nine compulsory cross edges and no D cross edge. Move y_i and one endpoint of its root edge to the other side. Direct counting leaves eight compulsory cross edges and adds all deg_D(y_i)>=2 incident D edges. The resulting cut has at least ten edges. Its complement is a triangle cover of size at most (12+d)-10=2+d, smaller than C of size3+d. This contradicts global minimality. Thus d<=3 and tau<=6. QED.

**Combined structural consequence.** A15 excludes zero universal apices; A16 excludes two or more; A17 excludes one universal apex when all three root labels have at least two witnesses. Therefore, if k<=3 and tau>=7, every all-red triangle has exactly one universal private apex and at least one red edge with a unique actual private witness. There cannot be two unique root labels, because their unique witnesses would share a blue spoke at the common universal apex, contrary to A1. Thus each all-red triangle has exactly one uniquely witnessed red edge.

This does not prove S for nu4: changing the minimum cover may be necessary in the next argument.

## A18. Restricted existential theorem: E for nu<=4

**Coordinator's theorem, independently reconstructed by Track A and accepted by the fresh critic, conditional only on the separately accepted ordinary Tuza input for nu<=4.** For every finite simple graph with nu(G)<=4, there exists a globally minimum triangle cover C with

    k(G,C) >= ceil(tau(G)/2).

The internal accepted project input is ordinary Tuza, tau<=2nu, for graphs with packing number at most four, from the authenticated TUZA-11/TUZA-12 Liu audit (including its documented printed-table correction). This note does not claim to re-prove or re-audit that external theorem. The new argument concerns eligibility relative to globally minimum covers. No unrestricted Tuza inequality is assumed.

### Exact one-pivot repair at (tau,nu)=(7,4)

Let C be any globally minimum cover. If k(G,C)>=4, it is already favorable. Otherwise A10 gives k=3. Take any maximum full packing P of size four. It cannot be wholly eligible. The red-count inequality tau>=nu+2t shows that it has at most one all-red member, so it has exactly one, call it R. The other three triangles P0 are eligible and edge-disjoint from R. Since R uses three of C's seven red edges, these three members use at most four red edges altogether. Thus at most one member of P0 is T2.

By the structural consequence of A15-A17, some red edge e of R has exactly one actual private witness Q. Let f,g be Q's two blue edges. Each of the two one-edge pivots

    C_f=(C minus {e}) union {f},
    C_g=(C minus {e}) union {g}

is a globally minimum cover: the only private triangle uncovered by deleting e is Q, repaired by f or g; every former T2/T3 retains a red edge, and the size remains seven.

The members of P0 avoid e because they are edge-disjoint from R. Adding a single blue edge can make a packed member all-red only if it was T2 and that edge was its sole blue edge. There is at most one such T2 member in P0, so at most one of the two distinct choices f,g is blocked. Choose the other pivot. All three P0 members remain eligible, and R becomes T2 after e is removed. They are still edge-disjoint. Thus the chosen globally minimum cover admits the full eligible packing P0 union {R} of size four.

This is an explicit optimum-cover migration from ANY unfavorable cover at (7,4). It does not prove the original specified C favorable, so it is an E statement and not S.

### Lift from tau7 to tau8 at nu4

Let tau(G)=8,nu(G)=4. Choose an edge e in any minimum cover C0 and set H=G-e. The cover C0 minus {e} shows tau(H)<=7; adding e to any cover of H gives a cover of G, so tau(H)>=7. Hence tau(H)=7. Also nu(H)<=4. The accepted ordinary Tuza theorem in this scoped packing range gives7<=2nu(H), forcing nu(H)=4. The preceding case supplies a minimum seven-cover A of H and an eligible four-packing P in H. Then A union {e} is a minimum eight-cover of G, and every triangle of P avoids e, so all four remain eligible. This proves E at (8,4).

### Remaining values and exact dependency

For nu=4 and tau<=6, A10 gives k>=3 for every minimum cover, enough for the threshold. The accepted ordinary bound excludes tau>8 in this packing range. For nu<=3, the previously proved A10 consequence and the accepted ordinary Tuza bound give S, hence E; empty graphs and nu0 are immediate. Therefore E holds throughout nu<=4.

The exact (7,4) one-pivot argument uses no ordinary Tuza assumption because its two optima are explicit hypotheses. The tau8 reduction uses ordinary Tuza only on the edge-deleted graph whose packing number is at most four. The statement covering all nu<=4 also uses that accepted bound to exclude larger tau. No finite count is used as a proof, and no universal S/E resolution or historical novelty claim follows.

## A19. Final six-vertex endpoint: C-double-star closure

The remaining endpoint has root triangle R=abc and exact private-apex sets

    N_ab={x}, N_ac={x,y}, N_bc={x,z}.

The fixed eligible fan packing is P={abx,acy,bcz}. Let H be the induced six-vertex graph on a,b,c,x,y,z, and W the remaining vertices. The complete singleton-case proof is being consolidated in Track B section18 and the coordinator's main workbook. This section preserves the decisive C-double-star step and its independent checks; it does not replace those complete-family classification prerequisites.

### Exact classification facts used

Every outside private witness must intersect P. Every apex pair xy,xz,yz is absent or red, since any blue such edge would make an all-blue triangle with c. Opposite edges az,by are absent: they cannot be blue without changing the stated root-apex sets, and if red they have no private witness meeting P. The complete private families of core red edges stay inside H.

Every red edge outside H is either a red spoke from a,b,c to W or a red rim from y or z to W. No W-W red exists: its private witness could not meet P. No x-W red exists: its private witnesses can occur only at a,b; a sole one conflicts with the unique abx, while both create a second private apex for ab. A y-W red has a unique private witness at a OR c (both would create another ac apex); a z-W red similarly at b OR c.

Outside red spokes have private-apex sets contained in {x,y} at a, {x,z} at b, or {y,z} at c. An x-only witness at a or b is impossible by A1 with unique abx. Thus every nonunique outside red edge is exactly one of three double-star types: a-spoke with apices x,y; b-spoke with apices x,z; c-spoke with apices y,z. All other outside reds are uniquely witnessed. Since ab is already uniquely witnessed, A1 gives at most two outside unique red labels.

At most one double-star type can occur. For an a-double au and b-double bv, {aux,bvz,acy,bcx} is an eligible4-packing. For an a-double au and c-double cv, use {aux,cvz,acy,bcx}; for a b-double bv and c-double cu, use {bvx,cuy,acx,bcz}. The leaves lie outside H, and the displayed edges remain disjoint even if the two leaves coincide whenever that coincidence is consistent with the coloring.

The no-double case has a cover of size at most six: replace all core reds by the local H-cover {ac,cz,bx,xy when present} and retain the at most two outside unique reds. A crossing triangle would escape this replacement only if it were an outside private witness of a removed core edge, which the complete classification excludes.

For an a-double star, xy is absent because a leaf u has ux,uy blue and would otherwise make uxy a private triangle disjoint from P. Every such u has b,c absent and no other incident red: blue bu/cu creates an all-blue triangle with x; red cu makes cux private and disjoint from P; red bu would force a forbidden b-double. If two outside unique witnesses existed, they would be disjoint from aux and bcx, giving four eligible triangles. Their H-blue roots cannot be ax,bx (A1 with abx), and lie among ay,cy,bz,cz; the leaf u cannot occur in them. Thus at most one outside unique red remains. The five-edge local cover {ax,ay,bc,cz,bx} repairs the entire a-double star and covers H; retain the one possible outside unique red. There is no crossing T2 with a removed star spoke and core edge, because bu,cu are absent. This gives a six-cover. The b-double case is symmetric.

### C-double star: safe replacement and the last four forbidden-root pairs

Assume only the c-double-star type occurs, and let cu be one such spoke. Then uy,uz are blue. The edge ux is absent: blue ux makes cux private and disjoint from P, and red ux is forbidden by the x-W classification. The edge yz is absent, since if it were red then uyz would be a private triangle disjoint from P. Neither au nor bu can be blue: respectively auy or buz would be all-blue. If au or bu is red, it is an outside UNIQUE red and will be retained below.

Let q<=2 be the number of outside unique red labels. Replacing all core reds and ALL c-double spokes by any local H-cover containing cy,cz, while retaining the q outside unique reds, is globally valid:

* every removed c-double's private triangles are repaired by cy or cz;
* two removed c-double spokes cannot be in a T2, because a blue edge between their leaves would form an all-blue triangle with y; no W-W red exists either;
* a removed c-double cu and a removed core red can meet in a crossing triangle only through ac or bc; its third edge au or bu is absent or a retained outside unique red, never blue;
* an outside triangle supported only by a removed core red would be an outside private witness of a core edge, already excluded.

If xy is absent, {cy,cz,ac,bx} is a four-edge cover of H. If xz is absent, use {cy,cz,bc,ax}. Thus unless BOTH xy and xz are red, the replacement plus q<=2 outside unique reds gives a cover of size at most six.

Suppose xy and xz are both red. There is a five-edge H-cover containing cy,cz, for example {cy,cz,ac,bx,ax}. It remains to prove q<=1. Suppose instead that the two outside unique witnesses are Q1,Q2. Together with unique abx they form an eligible3-packing. Each of cuy,cuz must meet Q1 or Q2, or it would enlarge this packing to four; it does not meet abx. No single Qi can meet BOTH cuy and cuz: it cannot contain their red edge cu, and the remaining two-edge possibilities would require the absent yz or two disjoint graph edges.

Therefore, after relabeling, one witness Q_Y blocks cuy and one Q_Z blocks cuz. The H-blue root of Q_Y is ay or cy; that of Q_Z is bz or cz. Indeed an intersection with cuy either uses cy itself, or uses uy and makes Q_Y=auy; the corresponding statement holds for cuz. Each Qi has at most one H edge because its red label lies outside the induced H.

For each possible forbidden-root pair, H has the following eligible two-packing:

| H roots to avoid | Local eligible pair |
| --- | --- |
| cy,cz | axy,bcx |
| cy,bz | axy,bcx |
| ay,cz | bxz,acx |
| ay,bz | abx,cxy |

These pairs are directly edge-disjoint and each triangle contains a red and a blue edge. Adding the edge-disjoint unique witnesses Q_Y,Q_Z gives an eligible4-packing, contradiction. Hence q<=1. The five-edge local cover plus this one retained unique red gives a six-cover. This closes the c-double branch.

Track B independently checked this C-double argument, including the safe replacement's crossing T2 cases and all four local pairs. The fresh critic is reviewing the complete combined singleton theorem before any promotion of the unrestricted k3 conditional. Existing E for nu<=4 remains separately established regardless of the outcome of this final strengthening.
