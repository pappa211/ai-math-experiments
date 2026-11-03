# TUZA-14B mathematical source and obstruction workbook

All graphs are finite simple. T(G) is the complete actual graph-triangle family. Covers use actual graph edges and packings are disjoint in graph edges, not necessarily vertices. C is globally minimum unless an explicitly local lemma allows a larger cover. Eligible triangles have exactly one or two edges in C. Write c=tau(G), nu=nu(G), k=k(G,C), K=max_C k, loss=nu−k, allowance=nu−ceil(c/2). S means every minimum C meets the threshold; E means at least one does. Neither universal claim is proved or refuted here.

This workbook gives complete ordinary arguments for the principal new scoped results and indexes detailed attempts and literal machine certificates. Review agreement is not a substitute for these proofs. Historical novelty is UNESTABLISHED. The final reviewed result is S for every pair with k<=3, for every graph with tau<=8, and for every graph with nu<=4, with the external dependencies stated in section9. E follows in each range. The complete fixed-cover closure is in section9.

## 1. Mandatory ratio lemma and exact integer boundary

For a maximum full packing P, let t members be all-red. Each such member consumes three different cover edges, and each remaining member at least one. Edge-disjointness gives c>=nu+2t. Deleting those t members gives

    k >= nu−floor((c−nu)/2) = ceil((3nu−c)/2).

Thus S holds when2c<=3nu. Exact ceiling arithmetic strengthens the sufficient test to2c<=3nu+1_{c even}. This is a sufficient regime, not an assumed bound on c elsewhere. Full proof, integer check and ratio tables: RATIO_AUDIT.md. The definitions give S at C iff loss<=allowance, and E iff min_C loss<=allowance. At c=2nu or2nu−1 allowance0; above2nu it is negative, which would require separate extraordinary scrutiny of a Tuza counterexample.

The previous(6,4,3),(7,5,4),(9,6,5),K7 and20-vertex controls are automatic. Every old tight graph in the retained generic ledger decomposes into K4/K5 triangle-conflict components; this is a finite structure audit, not a universal equality classification.

## 2. Closure, actual private fans and sharp low packing

A private triangle of a red edge e contains e and two blue edges. Every red edge has one because minimum covers are inclusion-minimal.

**Shared-blue closure.** Private witnesses for distinct red edges e,f sharing a blue edge cannot have an actual two-red triangle with red set{e,f}. If e,f are disjoint, they cannot form a triangle. Otherwise write e=uv,f=uw. The shared-blue geometry forces witnesses uva,uwa with ua,va,wa blue. If uvw is a triangle, vw cannot be blue because vwa would be all-blue. Thus vw is red. This is the complete K4 closure omitted by the proposed objection: a triangle containing both deleted reds retains its third red.

**Unique-witness lemma.** If two red edges have unique ACTUAL private witnesses sharing a blue edge, delete those two reds and insert that blue edge. Uniqueness repairs all affected T1 triangles, the preceding closure treats T2, and no T3 loses all three reds. This contradicts minimum cardinality. Hence all unique actual private witnesses pack together. This does not imply that they can all be prescribed in a maximum packing.

**Fan dichotomy.** For an all-red R=abc, form a bipartite graph with left vertices ab,ac,bc and right vertices the outside private apices. Every left vertex has a neighbor. Two left vertices cannot have a common singleton neighbor set, by the unique-witness lemma. Each apex meeting two left vertices meets all three, because all its three spokes to a,b,c are then blue. Therefore either the neighbor union has at least three vertices and Hall's three elementary conditions yield a private three-packing, or the union is exactly{x,y}, both apices join all three red labels, and all six cross edges are blue. In the latter case xy is absent or red: blue xy would make axy all-blue. The induced five-vertex graph is K5−xy or K5.

The exceptional fan has an exact equal-cost cover pivot:

    C'=(C minus{ab,ac}) union{ax,ay}.

The only private witnesses of the removed reds have apices x,y; abc retains bc. Thus C' is another minimum cover. This may migrate an all-red triangle and can make an OLD ONE-red packing member all-red when both newly selected blues lie in it. The old one-edge-swap blocker rule cannot be copied unchanged.

**Theorem A10.** If C has an all-red triangle and k<=2, every actual triangle lies in one induced K5 or K5−e. In either case nu=k=2 and c=4 or3 respectively.

Proof. A wide fan would give k>=3, so use the exceptional five-vertex block H on a,b,c,x,y. Its six private triangles have a private two-packing avoiding ANY specified edge of H:

| Edge orbit to avoid | Private pair |
|---|---|
| ab | acx, bcy |
| ax | aby, bcx |
| xy, when present | abx, acy |

If a red edge f lies outside E(H), its private witness Q has an outside vertex because H is induced. It meets E(H) in at most one edge. A displayed local pair avoiding that edge, together with Q, gives three eligible edge-disjoint triangles, contradiction. Hence all reds lie in H, necessarily the red abc triangle and xy when present. Any actual triangle with an outside vertex now has exactly one red edge, is private, and gives the same contradiction. All triangle support is therefore H, which has full and eligible packing number two. QED.

If no all-red triangle exists, k=nu immediately. Consequently **k<=2 implies nu=k for every minimum cover**, including k=0,1. This forces **k=nu for every minimum cover whenever nu<=3**. Sharpness occurs at nu=4: the old nine-vertex K4-ring control has c=6,nu=4,k=3. Its supports are K4s on{0,1,7,8},{0,2,3,6},{2,4,5,8}; the only cross triangle is028. The cover{02,08,17,28,36,45} is minimum by three disjoint K4 lower bounds. Eligible triangles lie within blocks, giving k=3;{028,178,236,458} is a full four-packing. This is not S failure because target3.

In particular A10 proves S under the exact hypotheses(c,nu)=(5,3) or(6,3). The statement “S for all nu<=3” additionally uses the previously accepted ordinary Tuza theorem for that range; the accepted TUZA-11 bounded-packing ladder attributes nu<=3 to Parker/preceding work and nu=4 to the audited Liu theorem, with documented printed class-9 correction378→389. No new application to arbitrary eligible subfamilies is inferred from Liu. The historical external-input acceptance is documented in the [public Liu guide](../TUZA-11/external/README.md).

Complete fan proofs, mixed-packet equations, low-k proof and bounded nu4 frontier: notes/TRACK_A.md. Independent literal checks: evidence/track_a_low_packing.json and the critic receipts.

### Two universal private apices at eligible packing number three

**Theorem A12/A16 (independently reviewed ordinary proof).** Suppose k(G,C)<=3 and an all-red triangle has two distinct common BLUE neighbors. Then tau(G)<=6. These two universal private apices need not exhaust the private-apex set: additional root-private triangles are already hit by C_H and the proof below is unchanged. This strengthens the originally proved thin-fan statement.

Let H be its induced K5 or K5−e block, C_H=C intersect E(H), and D=C minus E(H). If |D|<=2 the conclusion is immediate. Otherwise the complete private families of any three D-edges contain an edge-disjoint pair Q1,Q2. To justify this fact, a pairwise edge-intersecting triangle family either shares an edge or lies among four K4 faces. The common-edge case forces unique private witnesses sharing a blue edge. Three K4 faces with distinct private labels similarly force the opposite face's red edges to have unique witnesses; four private faces permit only two red labels. Both possibilities contradict the unique-witness lemma.

Each Qi meets H in at most one blue edge. A local private two-packing extends Q1,Q2 to four unless these two edges form an exceptional adjacent pair: vp,vq in the blue K3,2. For K5 the center v must be a red-triangle vertex; for K5−e either side is possible. Write Q1=vpu and Q2=vqw, with distinct outside vertices u,w. Their vertex intersection is exactly {v}.

Every private witness Q of a D-edge passes through v. Otherwise, if its H intersection is absent or a blue edge disjoint from both vp,vq, a disjoint pair Q,Qi extends locally to four. It would therefore have to share an edge with both Q1,Q2, forcing it to contain their sole common vertex v. If its H edge meets vp at p, it cannot also meet vq: pq is not blue in the bipartite K3,2. Its H endpoints avoid v,q, so Q is edge-disjoint from Q2 and their disjoint H roots again permit four. These cases exhaust the possibilities.

Consequently D consists of red spokes at v and a matching of red rim edges between blue neighbors of v. A rim edge has a unique private witness through v; two rim edges sharing an endpoint would contradict the unique-witness lemma. No rim endpoint has a red spoke. Every actual triangle left uncovered by C_H therefore contains v: T1 triangles do by the preceding paragraph; a T2 can only use two star spokes; D contains no T3.

Let J have an edge st exactly when vst is one of these uncovered triangles. J is triangle-free, since a triangle in J would itself be an uncovered actual triangle avoiding v. Its cone triangles are all eligible. A vertex cover of J supplies spokes repairing C_H, so |D|<=vc(J). One local private triangle L in H avoids all these cone triangles: if v=a is a red-triangle vertex, take L=bcx (b,c are excluded from J by their selected spokes); if v=x is an apex of K5−e, take L=aby (the other apex y is not adjacent to x). Hence J has matching number at most two.

A triangle-free graph with matching number at most two has vertex cover at most two unless its nonisolated part is C5, when it has vertex cover three. In the bipartite case use ordinary Konig; otherwise a shortest odd cycle must have length five, and any additional edge supplies a third matching edge together with two cycle edges. This gives tau<=3+3=6 for K5−e.

For K5, the C5 exception is impossible. Here v=a and xy is the extra red edge. Both x,y lie on J's cycle, by the original Q1,Q2, and are nonadjacent because xy belongs to C_H. Write the cycle x−z−y−t−s−x. The actual triangle xyz is eligible: xy is red and at most one of xz,yz is red because D's rim edges form a matching. The four triangles {xyz, axs, ayt, bcx} are edge-disjoint and eligible. Thus vc(J)<=2 and tau<=4+2=6. QED. The complete geometric proof and independent criticism are preserved in notes/TRACK_A.md A12 and notes/INDEPENDENT_CRITIC.md.

**Large-neighborhood wide fans (A13).** If k<=3 and all three red edges of some all-red triangle have at least three private apices, then tau<=6. For any outside red edge, a private witness Q must block the fan's private three-packing. It has at most one root vertex. Zero or one conflicting fan-blue edge leaves Hall's condition intact. With two conflicting blues ax,ay, Hall can fail only when the two affected private-neighborhood sets are the same three-set U={x,y,z}; the unaffected set has size at least three. The degree-one-or-three property of apices forces U to be the fixed set of universal apices. Every subsequent blocking witness forces the same U, since its two affected root labels share at least one of those known size-three sets. Its red edge belongs to E(U). Therefore every outside red edge belongs to E(U), and |C|<=3+3=6. The third private neighborhood may contain additional exclusive apices; equality with U is not assumed. QED.

Thus any remaining k=3, tau>=7 pair must have **only wide all-red fans, each with a red label having at most two private witnesses**. This is a necessary condition for an obstruction, not a general packing theorem.

### Complete small-packing fan reduction and the restricted E theorem

**A15: no universal apex.** If k<=3 and some all-red R has no common blue neighbor, then tau<=6. Its three private-apex sets are disjoint. Every outside-red private triangle must meet an entire root-private family, or one witness from each family would extend it to four. It meets at most two blue fan spokes, so only families of size one or two can be blocked.

An outside red edge with neither endpoint in R must have at least two private witnesses: a unique witness blocking a singleton conflicts with that root's unique witness, while blocking a two-witness family supplies its second endpoint witness automatically. Two R private apices force this red edge to be exactly the apex pair of a size-two root family. An outside red spoke at a root vertex has at most two possible witnesses, each blocking a singleton root family; uniqueness would contradict the unique-witness lemma. Thus both incident root labels must be singleton, and the spoke has exactly their two private apices.

Let r be the number of singleton root labels. For r=0 or1 there are no outside spokes and at most three or two outside apex-pair reds. For r=2, all outside spokes have one center, and there is at most one rim red. Removing all those spokes and adding their two fixed blue resource edges is a cover: it repairs T1; a T2 losing both reds would require a blue edge between leaves that already share a blue neighbor, creating an all-blue triangle. A star contains no whole T3. Minimum cardinality therefore allows at most two spokes, again at most three outside reds.

For r=3, write the unique witnesses abx,acy,bcz. There are only outside red spokes. Their leaves lie outside these six vertices: apex-pair edges cannot be blue because each pair has a common blue R neighbor, whereas a spoke ending at an apex would require two such blue edges. The same star replacement bounds each root's spoke degree by two. Four spokes now yield an explicit private four-packing. For center degrees (2,2,0), with a-leaves u,v and b-leaves w,t ordered so v!=t, use {auy,avx,bwz,btx}. For (2,1,1), with a-leaves u,v, b-leaf w, c-leaf t, use {aux,avy,bwz,ctz} if w!=t; otherwise order v!=w and use {auy,avx,bwx,cwz}. Thus at most three outside reds exist. In every case tau<=3+3=6. QED. Full incidence details are in notes/TRACK_A.md A15, independently checked by the critic.

**A17: one universal apex and no singleton label.** Suppose k<=3, R has exactly one common blue neighbor x, and every root edge has at least two private witnesses. Then tau<=6. A private outside witness must block a three-label Hall matching. One blue deletion cannot do so. With two deletions at one root vertex, the only possible failures are emptying a size-two neighborhood {x,y_i}, or leaving two incident size-two neighborhoods at the common singleton {x}. Hence every outside red lies among x and the exclusive apices y_i of the size-two root labels. If there are at most two such labels, there are at most three outside reds.

If all three labels have size two, every actual triangle lies in the seven-vertex core on R, x and its three exclusive apices. Opposite R-to-exclusive-apex edges are absent: blue would make a second universal apex, red contradicts the outside-red classification. All apex-pair edges are red or absent, because each pair has a common blue R neighbor. A triangle with an outside vertex would be a private witness on an R or outside red edge, contradicting the exact private families just classified. The core has 12 fixed edges (three R, three R-to-x, six R-to-exclusive-apex), plus d outside red edges among the four apices, and |C|=3+d.

If d>=4, some exclusive apex y has outside-red degree at least two. The cut R | {x,three exclusive apices} has nine fixed crossing edges. Flip y and one of its two R neighbors: eight fixed edges now cross, together with at least two outside-red edges. The complement of this cut is a triangle cover of size at most (12+d)−10=d+2, smaller than C. Thus d<=3 and tau<=6. QED.

Together A15, A16 and A17 prove the literal structural reduction: **if k<=3, tau>=7 and R is all-red, then R has exactly one common blue neighbor and exactly one uniquely private red edge.** At least one singleton follows A17; two would share their common private apex and contradict the unique-witness lemma.

**A18: E holds whenever nu<=4.** The near-tight (tau,nu)=(7,4) statement below is self-contained. The full packing-range conclusion uses the previously accepted ordinary Tuza ladder (Parker/preceding nu<=3; audited Liu nu=4, with its documented class-9 correction).

At (7,4), fix any minimum C. A10 gives k>=3. If k=4 there is nothing to repair. Otherwise take a full four-packing. The red-edge count forces exactly one all-red member R: zero would give k=4, and two would require at least 3+3+1+1=8 selected edges. Its other three members P0 are eligible and use at most four red edges, so at most one is two-red.

By the structural reduction R has a uniquely private red edge e, whose actual private triangle has blue edges f,g. Either replacement (C minus {e}) union {f} or (C minus {e}) union {g} is another minimum cover. All triangles containing e other than its unique private witness retain another red; the witness is hit by the added edge. A member of P0 can become all-red only if it was two-red and its sole blue is the added edge. Since at most one member is two-red, at least one of f,g is unblocked. The corresponding pivot preserves P0 and makes the edge-disjoint R eligible, yielding a full eligible four-packing. This is a **one-edge repair from any unfavorable optimum cover**, not a proof that the original cover was favorable.

At (8,4), delete any e from a minimum C. The residual has tau=7 exactly: a smaller residual cover, together with e, would improve C. Its packing number is at most four and at least four by the accepted ordinary Tuza bound for nu<=3. Apply the preceding (7,4) result and add e to the favorable residual cover. The residual packing avoids e, so remains eligible. In fact, if the original C was unfavorable, its restriction is unfavorable and the one-edge residual repair lifts to a one-edge repair of C itself.

For nu<=3 use A10's full-packing preservation and the accepted ordinary Tuza bound. For nu=4 and tau<=6, A10 forces k>=3 under every minimum cover, already enough. The accepted nu=4 ordinary theorem excludes tau>8. Hence E holds throughout nu<=4. QED.

**Cover-number corollary.** E also holds for every graph with tau<=8. For nu<=4 use A18; for nu>=5 the integer automatic criterion holds, with the extremal arithmetic tau=8,nu=5 giving 16=3·5+1. This does not assume any upper bound on tau for arbitrary graphs.

This is RESTRICTED_LEMMA_PROVED_ORDINARY with internal independent criticism. This intermediate E argument remains valid; the final fixed-cover proof in section9 strengthens its small-parameter conclusions to S. Unrestricted S/E remain unresolved, and no historical novelty or external/formal verification is asserted. The complete author proof is notes/TRACK_A.md A15–A18, with the independent reconstruction in notes/INDEPENDENT_CRITIC.md.

## 3. Mixed augmentation, progress and its remaining obstruction

The prior exact cover exchange says that, for a red deletion set S containing no T3, forced blues F(S) repair affected T2 triangles, and remaining affected T1 triangles form a blue-resource graph H_S. The exact repair cost is |F(S)|+vc(H_S). A minimum C makes this at least|S| for every admissible S. This characterizes covers, not a large eligible packing.

Track A assembles replacements using BOTH red and blue graph-edge capacities, tracks old one/two/all-red triangles and newly used red resources, and permits nonlocal T2 recombination. The finite potential is lexicographic: packing cardinality, then minus all-red packing members. An admissible cardinality increase or equal-size color repair strictly improves it. Existence of such a packet with sufficiently small boundary is the missing theorem; the potential alone cannot produce one. Complete literal accounting and the four-vertex collision cases are in notes/TRACK_A.md A3–A4.

The20-vertex cone control supplies an actual mixed length-five path. In the19-vertex base matching, replace edges1–9 and10–15 by2–9,1–10,6–15 along2–9–1–10–15–6. With cone apex19, this removes one T1 and one T2 triangle and inserts two T1 plus one T2, moving an eligible eight-packing to nine. No augmentation involving only one old triangle exists for that eight-packing. A separate maximum private six-packing extends only to eight. Exact graph, all48 triangles, tau13 certificate and literal matchings: evidence/track_a_mixed_path.json. This is an automatic-regime mechanism control, not hard-range evidence.

At nu4, the wide-fan root-avoidance shortcut already fails on the six-vertex graph consisting of red triangle abc, all blue edges to three apices x,y,z, and red xy. It has(c,nu,k)=(4,3,3); each private xy witness blocks all three-private fan packings. Conversely four private apices on EACH red edge permit Hall repair after deleting the at most two obstructed apices. Thin fans admit two-private packings avoiding two blue edges except specified common-endpoint bottlenecks. The thin-fan bottleneck is now resolved by A12 above, and A13 strengthens the wide-fan restriction to a label with at most two private witnesses. The subsequent A15–A18 reduction proves restricted E. The final section9 closes the one-common-apex, one-unique-label configuration and proves c<=6 when k<=3 and an all-red triangle exists. The corresponding step at eligible packing number four remains unproved.

## 4. Exact K4/K5 attachment reduction

Let H be a core and D a set of distinct edges. For each edge in D attach one fresh K4 or K5 using that edge as root; new vertices are disjoint and have no other neighbors. Write b=d4+2d5 and R=H−D. Supports of the blocks and E(R) partition E(G). Then

    tau(G)=2b+tau(R),    nu(G)=b+nu(H),
    k(G,C)=b+k(H,C intersect E(H))

for every minimum C. Its restriction to R is minimum and each block restriction is minimum locally.

For the cover lower bound sum the disjoint local minima and tau(R). For attainment choose every root in a local minimum cover and add a minimum cover of R. Equality forces the stated restrictions. Every triangle with a new vertex is inside its block. Each K4 has an eligible one-packing, each K5 an eligible two-packing, avoiding any prescribed root under any local minimum cover. Thus arbitrary core packings extend by local root-avoiding packings, proving the exact formulas.

For K5, label a minimum cover{ab,cd,ce,de}. For the three root orbits ab,cd,ac choose respectively pairs{acd,bce},{ace,bde},{ade,bce}. They are disjoint, one-red and root-avoiding. K4 is immediate. K5's full maximum is two: three packed triangles would use nine of ten edges and leave one edge, contradicting parity of the even degrees of K5.

The formulas give S inheritance for the specified C and E inheritance by extending a favorable residual cover; these quantifiers are different. A fewest-edge S/E obstruction cannot contain such a pendant block. This is not applicable to repeated decorations on the same root without separate analysis.

For one K4 on EVERY core edge, m=|E(H)| and R is empty. All optimum covers correspond to arbitrary triangle covers S of H, not necessarily minimum ones, with one of the three opposite-edge pairs on each leaf block. The designated all-core-red cover has k=m while nu=m+nu(H). For a b-page book, m=2b+1 and nu(H)=1, yielding the connected near-two family in REPORT.md. All optima are connected by two-for-two block exchanges, with distance equal to the number of changed block matchings, while the one-edge swap graph is edgeless. Full proofs/classification: notes/TRACK_B.md §§2–6; checks/track_b_attachments.py; independent finite receipts.

## 5. Saturated and near-saturated clique certificates

If edge-disjoint subgraphs B_i satisfy tau(G)=sum tau(B_i) and S holds in each, any minimum C restricts to minima locally. Eligible local packings combine, proving S in G even with crossing triangles. In particular actual K3/K4/K5 blocks provide explicit certificates.

**Mixed two-slack theorem.** Suppose edge-disjoint K4/K5 blocks have total cover cost2b and2b<=tau(G)<=2b+2. Then S holds.

The local inputs are: a K4/K5 cover with at most one edge above its minimum has a full eligible local packing avoiding ANY root; a K5 cover of size at most6 has one avoiding any RED root; a K4 cover of size at most4 has one avoiding any root. For the first K5 fact, a nonminimal five-cover either contains a minimum four-cover (use a one-red packing, which survives one extra red), or its blue complement is maximal triangle-free with five edges, hence a C5. Then every triangle is eligible. K4 is analogous.

For the RED-root K5 fact, suppose the eligible triangles avoiding red e have packing number at most one. Every pairwise edge-intersecting graph-triangle family either shares an edge or lies in four K4 faces. There are at least four blue edges. Every blue f occurs in at least two eligible triangles avoiding e, ruling out a common edge different from f, and four blues rule out the common-edge case altogether. In the K4-face case let z be the fifth vertex. A blue edge incident with z would give an eligible triangle avoiding e outside that K4, impossible. All blue edges lie inside the K4; each triangle formed by a blue edge f and z must contain e, forcing e=zw and every blue f incident with w. There are at most three such edges, contradiction.

Now fix a minimum C of G. At equality use saturation. If there is an outside red edge, take its private triangle Q. At most one extra red remains across all blocks, so the arbitrary-root local fact supplies b eligible triangles avoiding their possible single edge of Q. Adjoin Q.

If all reds are inside blocks, some block is overfull. Replace its restriction by a minimum local cover. Since C was globally minimum, a cross triangle Q becomes uncovered. Such a triangle meets the chosen clique in at most one edge, so it was previously PRIVATE, with its red root in that block. Use the RED-root local fact there and arbitrary-root facts in every other block, whose excess is at most one. Adjoining Q to the b local triangles gives b+1, reaching both possible thresholds. QED.

The arbitrary-BLUE-root extension is false: in K5 let the six edges of an internal K4 be red, the other four spokes blue. Every eligible triangle uses two spokes; forbidding one blue root leaves only three spokes, so no eligible two-packing can avoid it. Global minimum cardinality is what selects a PRIVATE crossing triangle and hence a RED root in the theorem.

A companion certificate allows K3 blocks when the summed local costs are at least tau−1. At equality use saturation. With one excess, every K3 still has one or two reds and remains eligible; if any K3 is present, parity of the summed local packing sizes already reaches the threshold. Without a K3 apply the one-slack subcase above. Literal proofs, all local checks, and precise boundary cases: notes/TRACK_B.md §12; evidence/track_b_one_slack.json.

**Two-slack extension with K3 blocks.** Let the edge-disjoint K3/K4/K5 blocks have total cover cost B, let r be their number of K3 blocks, and suppose B>=tau(G)−2. S follows when r=0, r=2, or r>=4. The cases r=1 and r=3 are not settled by this theorem.

Only tau=B+2 is new. Each K4/K5 restriction has at most two extra red edges and retains a full local eligible packing. For K5 this follows directly from two blue edges: adjacent blue ab,ac extend to disjoint triangles abd,ace; disjoint blue ab,cd extend to abz,cdz. Every triangle is covered, so these triangles are eligible. At most one K3 is all-red, because that consumes both extra edges. The local packing is therefore at least (B+r)/2−1, which reaches ceil((B+2)/2) when r>=4 (B and r have the same parity). The r=0 case is the mixed two-slack theorem above.

For r=2, either both K3s are eligible and local packings suffice, or one K3 R is all-red and all other block restrictions are minimum, with no outside reds. Let T be the other K3. Choose an edge of R avoiding its possible shared vertex with T. An actual private triangle Q for this edge is disjoint from T and meets each clique in at most one edge. Local clique packings avoiding those roots, plus T and Q, meet the threshold. This proof uses S's specified minimum cover throughout. Full proof and exact limits: notes/TRACK_B.md §15.

The four hard kernels not initially saturated have tau11,nu7,k7 for every optimum. One has block cost10 and the one-slack certificate. The other three have no block family reaching10, but each has one K5 and five edge-disjoint K3s, with cost9 and r=5. The new theorem therefore supplies six eligible triangles for EVERY minimum cover. Moreover the displayed blocks supply seven for all210 independently enumerated minimum covers of each kernel. Thus all32 hard kernel cases are now structurally certified. The negative cost>=10 search and scalar LP endpoint limitation remain correct. Exact blocks and all630 local witnesses: evidence/track_b_two_slack.json; independent check: evidence/critic_two_slack_check.json. Original four-kernel optimum counts148,210,210,210: evidence/critic_fractional_check.json.

## 6. Fractional gap and signed-cut mechanisms

Let t=tau*(G), delta=c−t. In an optimum full fractional packing let a_j be total weight on j-red triangles. Summing red-edge capacities gives

    a1+a2+a3=t,   a1+2a2+3a3<=c,
    a2+2a3<=delta.

The surviving eligible fractional packing has weight at least t−delta/2=(3t−c)/2. Any subfamily of actual graph triangles is Fano-free as an edge-incidence hypergraph: its pairwise edge-intersecting subfamilies share an edge or lie in four K4 faces, whereas a Fano plane has seven intersecting triples without a common point. Füredi's rank-three Fano-free theorem bounds fractional matching by twice integral matching. Therefore

    k>=ceil((3t−c)/4).

This proves S when delta<4/3 for even c or delta<2/3 for odd c. When delta0, all positive fractional mass is on private triangles, so the private packing already meets the threshold. No half-integrality or equality of eligible/full cover numbers is assumed.

Primary theorem: Füredi1981, printed157 §2, inspected through web-extracted text by Track B; direct coordinator download returned403. The author's [1991 restatement, equation(2.1), printed206](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/3F60335F218D9C250DA813F8B8A8B8CC/S1446788700032699a.pdf/on_rgraphs_and_rmultihypergraphs_with_given_maximum_degree.pdf) was downloaded and visually checked independently. Set r=3,p=0 in the bound for a hypergraph with no p+1 disjoint projective planes. Local source and hash are in evidence/literature_sources.json. Eleven rational full LPs and ten eligible LPs have exact primal/dual certificates, independently checked without the simplex implementation.

For a prescribed packing P and red deletion set S, the exact exchange constraints additionally forbid the sole blue of an unchanged packed T2 and forbid selecting both blues of an unchanged packed T1. They coexist with forced blues and positive private-witness pairs. S must contain no full T3 and meet every all-red member of P. If the combined positive/negative pair graph is bipartite L|R, complement the Boolean variables on R. Both clause signs become implications. Unit source/sink arcs encode |B| exactly and large-capacity arcs encode implications/forced values. A minimum cut of cost|S| certifies an optimum cover migration preserving P. The clause proof, actual network and integral flow/cut certificates are in notes/TRACK_B.md §11 and evidence/track_b_packing_cut.json. There is no universal existence theorem for such an S.

These tools have concrete limits. Decorated books have tau*=tau and zero all-red mass for every optimum fractional packing under every minimum cover, while integral loss differs between covers. K7 always has all-red fractional mass one, and the joint minimum cover size compatible with a full seven-packing is11 rather than9. The lower bound holds for every prescribed full packing; the eleven-cover witness attains it for one packing. The latter lower bound follows because a triangle-free nonbipartite graph on seven vertices has at most10 edges; a blue graph of size>=11 is bipartite and cannot meet every triangle in a seven-triangle edge decomposition of K7 (it would force seven within-part edges, whereas every bipartition has at least nine). An explicit eleven-cover and full packing attain the bound. These refute auxiliary potential/relaxation shortcuts, not S/E.

## 7. Primary dense construction and scope integrity

The complete analysis is notes/BARON_KAHN_STRESS.md. The exact finite fractional cover W=vertex-edge count + external-edge count/2 gives nu<=floor W. A minimum-cover certificate C plus an eligible fractional cover of value U with floor U<ceil(tau/2) would refute S; uniformity over all minima is needed for E. The actual Baron–Kahn estimates and regularity proof do not supply these exact finite cover structures or the needed second-order saving. All-red incidence is not packing loss. The construction also has an integrality gap of order its edge count, outside the new constant-gap lemma's reach.

HKT's specific K4-free near-two examples are cones, while the flat theorem assumes at most two triangles per edge. The full-graph fractional stability theorem was not silently applied to an eligible subfamily: its pattern transformations can use completion triangles excluded by the coloring. Prior TUZA-12 claw-free and ordered-lift results and TUZA-11 flat gluing retain their original hypotheses; none supplies the arbitrary colored exchange.

## 8. Independent review, evidence and unresolved quantifiers

Fresh critic notes/INDEPENDENT_CRITIC.md reconstructs the proofs, checks source theorem hypotheses, independently recounts the retained ratio ledgers, verifies the leaf reductions and exact residual optima, enumerates all minima of the four difficult kernels, and checks rational primal/dual and flow/cut certificates. Its scripts import no discovery optimizer. Author cross-reviews are separately identified. All share the same requested model family and Mac Python runtime; independence means separate contexts/algorithms, not independent human review or hardware.

Representative new evidence: new_domain_summary.json; ratio_tight_structure.json; critic_ratio_recount.json; critic_finite.json; critic_leaf_check.json; critic_fractional_check.json; track_a_low_packing.json; track_a_mixed_path.json; track_a_frontier.json; track_b_attachments.json; track_b_fractional.json; track_b_packing_cut.json; track_b_one_slack.json; track_b_two_slack.json; critic_two_slack_check.json; critic_frontier_check.json; critic_closeout_audit.json. Each resides in evidence/. See the final artifact manifest for exact filenames and hashes. Original source edges/proof identities are preserved through evidence/source_initial.json and checked again at closeout.

The exact remaining questions are existential, not accounting identities: does a low-boundary mixed packet exist, can a favorable optimum cover and sufficient packing be selected with a zero-excess signed repair, or can the required colored fractional rounding be improved? The first narrow near-tight frontier is now nu5 with tau9 or10; no upper bound tau<=10 is assumed for arbitrary nu5 graphs. Section9 closes the previous nu4 frontier for the specified cover. A general proof/refutation has not been supplied. No passing count or auxiliary refutation changes S/E's universal status.

## 9. Final fixed-cover closure and exact restricted S consequences

The final fresh critic accepted this complete chain at approximately20:52 UTC. The ordinary structural theorem is:

    C globally minimum, k(G,C)<=3, and an all-red triangle exists
    ==> tau(G)<=6.

Sections2 and its A15/A16/A17 refinements reduce a hypothetical tau>=7 pair to one universal private apex and exactly one singleton private family. Write R=abc, N_ab={x}, N_ac={x} union A, N_bc={x} union B, with disjoint nonempty exclusive sets A,B. The remaining cases are discharged below. Full author/critic provenance is preserved in notes/TRACK_B.md §§17–18, notes/TRACK_A.md A19, and notes/INDEPENDENT_CRITIC.md's final review.

If |A|,|B|>=2, every outside-red private witness has one R vertex and must meet each fan packing {abx,acy,bcz}, for all y in A,z in B. At a it must use ax or every a-A spoke; at b it must use bx or every b-B spoke; at c it must use every c-A or every c-B spoke. A red spoke has only one blue resource at that R vertex, so a/b spokes would be uniquely witnessed through x and conflict with abx, while c spokes cannot block either family. There are no outside red spokes. For a red xu, a private witness at c cannot block either entire exclusive family. Thus its allowed private apices are only a,b. If both exist, u is a second private apex of ab, contradicting N_ab={x}; if only one exists, its unique witness conflicts with abx by A1. Hence no outside red uses x. The only remaining outside reds are the apex pair of A if |A|=2 and the apex pair of B if |B|=2. There are at most two, giving tau<=5. The independent critic reconstructed this complete classification.

When one exclusive family is singleton and the other is larger, the following literal author proof applies. When both are singleton, the subsequent complete six-vertex proof applies. These ordinary arguments are independent of the finite local-table checks.

### 9.1 One nonsingleton exclusive family

This section starts from the remaining Track A structural case, not from a hypothesis inferred by computation. Let C be globally minimum, k(G,C)<=3, and R=abc all-red. There is exactly one common private apex x. Edge ab has the unique private triangle abx. Write

    N_ac={x,y},       N_bc={x} union B,

where |B|>=2, and y and all members of B are exclusive private apices. All seven types of spokes ax,bx,cx,ay,cy,bz,cz (z in B) are blue; by and az are absent or red. Let D=C minus E(R).

Every actual private triangle Q of a red edge in D has exactly one vertex in R. With zero vertices it is edge-disjoint from the eligible fan three-packing {abx,acy,bcz}, for any z in B, giving four. It cannot have two R vertices because their joining edge is another red. It must block EVERY fan packing of this form.

At vertex a, such Q must contain ax or ay. At b, it must contain bx or all b-B spokes; the second alternative is possible only when |B|=2 and Q has the two B vertices. At c it must contain cy or all c-B spokes, again the latter only for |B|=2. This is an exact intersection test: the three fan members use disjoint red labels, Q has no R-red edge, and only its spokes at its single R vertex can intersect them.

### Classification of the outside red edges

1. A red a-spoke au has all actual private apices in {x,y}. It cannot have only x, because its unique witness aux would share the blue edge ax with the unique witness abx, contrary to the minimum-cover unique-witness lemma A1. Thus every such u is blue-adjacent to y. It either also is blue-adjacent to x (a double-private spoke), or has only the private apex y.
2. There are no red b-spokes. Such a spoke could have only private apex x: a private triangle through it has just one blue b-spoke and cannot contain all |B|>=2 B-spokes. Its unique witness would conflict with abx at bx.
3. A red c-spoke cv has only private apex y. An individual private triangle cvw contains only ONE blue c-spoke cw, so it cannot block the entire B family of size at least two. In particular a second apex in B does not help: each private triangle separately must block every fan three-packing. Its unique witness is cvy.
4. Among red edges incident to x, only xy is possible. For a candidate xv, any private witness at a or b either forces v to be an exclusive apex (because a second blue R adjacency supplies the corresponding root-private triangle), or is the sole private witness and conflicts with abx. If v is in B, the forced private triangle cxv contains neither cy nor both B-spokes and fails the intersection test. A private witness at c likewise passes that test only when v=y. Thus xy is the sole surviving case.
5. Every remaining red edge has form yv, or is the pair zz' when B={z,z'}. A yv edge distinct from xy has exactly one actual private witness, at a or at c. It cannot have both because av and cv blue would imply v is another private apex of ac, contrary to N_ac={x,y}; it cannot have private apex b by the intersection test. The B-pair has its private witnesses at b and c.

By A1, at most one unique actual private witness can use ay, and at most one can use cy. The first allowance includes a possible y-only red a-spoke and a possible yv rim edge witnessed at a; they cannot both occur. The second includes red c-spokes and yv rim edges witnessed at c. Apart from double-private a-spokes, D therefore consists of at most these four types: the ay-unique edge, the cy-unique edge, xy, and the B-pair.

### Double-private a-spokes permit a smaller cover

Suppose a double-private a-spoke au exists. Then xy is absent: it cannot be blue because axy would be all-blue; if xy were red, uxy would be a private triangle for xy having no R vertex, giving four with the fan packing.

If there is a y-only a-spoke av, then bv is not blue. Otherwise choose z in B different from v (possible since |B|>=2). The triangles

    aux, abv, acy, bcz

are four eligible edge-disjoint triangles. Here u is outside B: ux, cx, cu could not all be blue, so u cannot be a B apex. Also u,v,x,y are distinct in the required places. The displayed packing contradicts k<=3. For a double-private a-spoke av, bv also cannot be blue, now because vx and bx are blue and a blue bv would give the uncovered triangle bvx.

Remove ab, every red a-spoke in D, and the possible ay-unique rim edge yv. Add ax and ay. This produces a triangle cover:

* Any newly uncovered triangle with exactly one removed red edge would be an actual private witness, and is hit by ax or ay; a retained red edge already covers every other such triangle. The unique witness of ab is abx; a-spoke private witnesses use ax/ay; the removed rim edge has its unique witness using ay.
* A triangle containing two removed a-spokes has its third edge between their outside endpoints. Every such endpoint is blue-adjacent to y, so that third edge cannot be blue; if red it was retained, unless it is the removed rim edge. It cannot be that rim edge because none of those endpoints is y.
* A triangle containing removed ab and a removed a-spoke av would need blue bv to become uncovered, and this was excluded above.
* The removed rim edge yv cannot lie in a triangle with removed ab (the edges are disjoint: v is not a or b), or with a removed a-spoke au. In the latter case v=u would be necessary, but then uy is blue by item1, contrary to yv being red. The other possible shared endpoint y cannot be an a-spoke endpoint because ay is blue.

The resulting cover has at most six edges: the retained ac,bc; the two added ax,ay; at most one cy-unique edge; and at most one B-pair. Therefore tau<=6.

### No double-private a-spoke

If none exists, |D|<=4 by the classification. If tau>=7, all four types must occur: xy, a B-pair zz' (so B has exactly two members), an ay-unique edge with private witness Qa, and a cy-unique edge with private witness Qc. The four triangles

    abx, Qa, Qc, bzz'

are eligible and edge-disjoint. Qa and Qc are edge-disjoint by A1. Qa has vertices a,y,v and Qc has c,y,w; neither can use x because its red label would then be xy, already a separate type. Neither can contain a second R vertex, by the initial private-triangle observation. Hence both avoid abx. Finally bzz' has only the R vertex b and the two B vertices, whereas Qa and Qc each have their displayed R vertex, y outside B, and only one remaining vertex. Each shares at most one vertex with bzz', so has no common edge. This contradicts k<=3. Thus tau<=6 also in this case.

**Lemma B-U1-NONSINGLETON.** Under the displayed remaining U1/unique-ab hypotheses, if one exclusive family has size one and the other has size at least two, then tau<=6. The fresh independent critic reconstructed and accepted the classification, the cover exchange including all two-removed-red cases, and the final four-packing; its one wording correction about newly uncovered triangles is incorporated above. The case where both exclusive families have size at least two has the simpler classification D contained in the pair inside each size-two family, giving tau<=5. The critic also accepted the latter branch. Thus the only remaining U1/unique-ab fixed-cover case has N_ac={x,y}, N_bc={x,z} with x,y,z distinct. The remaining singleton case is settled next.


### 9.2 Complete singleton proof

The fresh independent critic separately reconstructed and ACCEPTED the complete ordinary proof in this section at the final review. The reviewer checked the classification, all crossing-triangle replacements, doubled-type packings including coincident leaves, and the final four forbidden-anchor cases; its review did not rely on the finite local receipt. Track A supplied the final c-star closure and independently checked the a-star branch; Track B supplied the safe core-cover replacement mechanism, no-star case and nonsingleton reduction. The proof uses actual private triangles throughout.

**Lemma B-SINGLETON.** Let C be globally minimum and k(G,C)<=3. Suppose R=abc is all-red, with exact private-apex families

    N_ab={x}, N_ac={x,y}, N_bc={x,z},

where x,y,z are distinct. Then tau(G)<=6.

Write H=G[{a,b,c,x,y,z}] and W=V(G) minus V(H). The red root edges are ab,ac,bc. The seven compulsory blue edges are ax,bx,cx,ay,cy,bz,cz. The fixed eligible three-packing is

    F={abx,acy,bcz}.

Every private triangle of a red edge outside E(R) must intersect F, or it augments F to four. It has exactly one R vertex: two would give another red root edge; zero would use no edge of F. The available blue anchors at its single R vertex are ax or ay at a, bx or bz at b, and cy or cz at c. In particular cx does not block F.

### Complete outside-red classification

No apex-pair edge xy,xz,yz is blue, because each has the common blue neighbor c. The opposite core edges az and by are absent: if, for example, az were red, its private apex at a would have to be x or y, but zx and zy are not blue; a private triangle with another R vertex has another root red, and a private triangle outside the allowed anchors misses F. The argument for by is symmetric.

For edges involving W:

* There is no red edge joining two W vertices. A private witness would need one R vertex and two W vertices, so would use no anchor of F.
* There is no red edge xu with u in W. Its private witnesses can only be axu or bxu; cxu misses F. If just one exists it is unique and shares ax or bx with the unique private triangle abx, contrary to A1. If both exist, u is a second private apex of ab, contrary to N_ab={x}.
* A red yu has exactly one actual private witness, at a or c. Having both would make u a third private apex of ac. A red zu similarly has exactly one private witness, at b or c.
* A red au has private apices among x,y; x alone is forbidden by A1 and abx. Thus it is either uniquely witnessed through y or doubly witnessed through x,y. A red bu is either uniquely witnessed through z or doubly witnessed through x,z. A red cu has private apices among y,z and is either unique or doubly witnessed through both.

Thus every red edge outside H either has exactly one actual private witness or is a doubled spoke of one of three types:

    A+: au with private apices x,y;
    B+: bu with private apices x,z;
    C+: cu with private apices y,z.

Let q be the number of outside-H red edges with a unique actual private witness. A1 says all their witnesses, together with the unique abx, form an eligible packing. Hence q<=2. Every such witness has exactly one H edge, its blue anchor, among ay,bz,cy,cz. Anchors ax and bx are excluded by A1 against abx, and cx misses F.

At most one doubled-spoke type occurs. If au is A+ and bv is B+, the four triangles aux,bvz,acy,bcx are edge-disjoint and eligible. If au is A+ and cw is C+, use aux,cwz,acy,bcx. If bv is B+ and cw is C+, use bvx,cwy,bcz,acx. The leaves may coincide without introducing a common edge; all displayed blue-apex labels are distinct where needed.

### Core-red private-witness confinement and replacement

Every actual private witness of a CORE RED edge lies within H. This holds for root edges by their exact stated apex families. For an optional red apex pair xy,xz or yz, a witness with its third vertex in W has no R vertex, misses F, and would give a fourth eligible triangle. Opposite edges az,by are absent, so there are no other core reds.

Consequently replacing C intersect E(H) by ANY triangle cover of H, while retaining all red edges outside H, is a globally valid cover replacement. An actual triangle not contained in H has at most one H edge. If it has a retained outside red it stays covered; otherwise its old unique red would have been a core red with an actual private witness outside H, which was excluded. No minimum-cardinality assumption on the local restriction is being made.

If no doubled spoke occurs, all outside reds are the q<=2 unique labels. The local set

    L0={ac,cz,bx,xy} intersect E(H)

covers H. Indeed H is a subgraph of K6 minus the two disjoint edges az,by, and L0 is the within-part edge set for the bipartition {a,c,z}|{b,x,y}. Its size is at most four. Replacing core reds by L0 and retaining the q outside reds gives tau<=6.

### The A+ branch and its symmetric B+ branch

Suppose au is A+. Then bu and cu are absent. They cannot be blue because ux is blue and bx,cx are blue. If bu were red, bux would be private; its x-only family is forbidden, so it would also have apex z and be B+, contradicting the incompatibility above. If cu were red, cux would be a private triangle missing F, giving four. Thus u has no blue R neighbor, and no other red edge incident to u can have an allowed private witness. Its only incident red edge is au.

Also xy is absent: it is not blue; if red, uxy would be a private triangle with no R vertex and would augment F. These assertions hold for every A+ leaf.

If q=2, let Q1,Q2 be the outside unique witnesses. Neither can contain u: a private triangle through a and u has the red label au, which is double, while bu and cu are absent; a private witness with no R vertex is forbidden. Their H anchors lie among ay,bz,cy,cz, so both avoid the H triangle bcx. Therefore

    aux, bcx, Q1, Q2

are four edge-disjoint eligible triangles, a contradiction. Hence q<=1.

Because xy,az,by are absent, the local set

    LA={ax,ay,bc,cz,bx}

covers H. Replace ALL core reds and ALL A+ spokes by LA, retaining the at most one outside unique label. Private A+ triangles are hit by ax or ay. Any new uncovered triangle involving a removed A+ spoke au and a core red would require bu or cu, which are absent; any other such triangle was already excluded by the complete private family, or has a retained outside red. Two A+ leaves share the blue neighbor y, so their joining edge cannot be blue; if it were red and retained it would cover the triangle, while it cannot be another removed spoke or core edge. Thus the replacement is globally valid and has size at most six. The B+ case is symmetric under a↔b and y↔z.

### The C+ branch

Suppose cu is C+. Then au and bu cannot be blue, since uy,uz and ay,bz are blue. The edge ux is absent: it cannot be red by the outside classification, and if blue cux would be private and miss F. The apex edge yz is absent: it cannot be blue; if red, uyz would be private outside R and augment F.

More generally, replacing all core reds AND all C+ spokes by any local cover of H containing cy and cz is globally valid while retaining outside unique reds. The private C+ witnesses are repaired by cy,cz. A triangle containing a removed C+ spoke cu and a removed core red ac or bc could become uncovered only if au or bu were blue, which was excluded; if either is red, it is an outside unique label and is retained. No other removed core red can join cu in a triangle. A triangle using two removed C+ spokes has a third edge between leaves sharing the blue neighbor y, so that edge is not blue; any retained red covers it. Core-red private confinement handles the remaining cases.

If xy is absent, the local cover

    LC1={cy,cz,ac,bx}

has size four and contains cy,cz. If xz is absent, use LC2={cy,cz,bc,ax}. Retaining q<=2 outside uniques therefore proves tau<=6 in either case.

It remains that both xy and xz are red. Suppose q=2, with unique witnesses Q1,Q2. The three triangles abx,Q1,Q2 are edge-disjoint by A1. Each C+ witness cuy and cuz is disjoint from abx and so must intersect Q1 or Q2. No single private triangle Q can intersect both cuy and cuz: sharing their common red cu would make its label cu rather than unique; selecting one other edge from each requires four vertices except the pairs cy,cz or uy,uz, which would require the absent edge yz. Thus one Q, call it QY, intersects cuy, and the other QZ intersects cuz. The H anchor of QY lies in {ay,cy}; the anchor of QZ lies in {bz,cz}. An intersection at uy forces QY=auy with anchor ay (the other allowed R vertex c would give label cu), and similarly an intersection at uz gives anchor bz; intersections at cy or cz give those anchors directly.

For each possible pair of H anchors there is an eligible H two-packing avoiding both:

    anchors cy,cz: axy and bcx;
    anchors cy,bz: axy and bcx;
    anchors ay,cz: bxz and acx;
    anchors ay,bz: abx and cxy.

Each displayed pair is edge-disjoint; xy and xz are red and the listed spokes are blue, so all its members are eligible. The crossing private triangles QY,QZ each have exactly their one anchor in H, so adjoining them gives four eligible edge-disjoint triangles. This contradiction proves q<=1.

Finally

    LC3={cy,cz,ax,bx,ab}

is a local cover of H containing cy,cz, of size five. Apply the proved core-plus-C+-spoke replacement and retain q<=1 outside unique reds to obtain a cover of size at most six. This finishes the singleton lemma. QED.


### 9.3 Consequences, dependencies and remaining gap

**S for every specified minimum cover with k<=3.** If C has an all-red triangle and k<=2, A10 gives k=2 and tau=3 or4. If it has an all-red triangle and k=3, the theorem above gives tau<=6. Both meet the threshold. If no all-red triangle exists, k=nu<=3, and the accepted ordinary Tuza result for nu<=3 supplies tau<=2k. This last branch is the only external input for this statement.

**S for tau<=8.** If k<=3 use the preceding result. If k>=4 then k>=ceil(tau/2) directly. Thus this cover-number theorem requires only the accepted ordinary nu<=3 input.

**S for nu<=4.** The accepted ordinary bounded-packing ladder gives tau<=8; apply the preceding theorem. Here the additional nu=4 step is the audited Liu input, with its documented printed class-9 correction378→389. E follows from S in all stated ranges. The accepted source identities and scopes remain unchanged.

**Full preservation at the exact near-tight pairs (tau,nu)=(7,4),(8,4) is self-contained.** If a specified minimum C had k<=3, it would contain an all-red triangle (otherwise k=nu=4), and the structural theorem would give tau<=6, contradiction. Thus every minimum C has k=4 at both exact pairs. No ordinary Tuza assumption is needed when those exact values are hypotheses. This does not extend full preservation to every nu=4 graph: the preserved (6,4,3) control shows the boundary.

A general S failure must therefore have k>=4 and tau>=9; the accepted ordinary nu<=4 input and the new theorem force nu>=5. The next narrow near-tight question is nu=5 with tau=9 or10. No Tuza upper bound is presumed for arbitrary nu=5 graphs. The present outside-private classification and four-packing contradictions do not provide the required five-packing or cover bound in that next case.

Status: RESTRICTED_LEMMA_PROVED_ORDINARY; general S/E remain unresolved. The local singleton tables were checked separately in evidence/track_b_singleton_local.json (20 cover rows and four packing rows) and evidence/critic_singleton_local.json (independent expanded local checks). These finite checks support the explicit tables; they do not replace the global classification, cover optimality, or crossing-triangle proofs above.
