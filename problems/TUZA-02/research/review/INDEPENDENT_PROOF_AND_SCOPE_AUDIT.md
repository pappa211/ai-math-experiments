> Curated source from TUZA-02/review/INDEPENDENT_PROOF_AND_SCOPE_AUDIT.md. Original SHA-256: `8d62b88abeedd8897cda2206a5a0b41a797af40f14de268ed4c48132a696801a`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Independent proof and scope audit

28 October 2026. Fresh synthesis critic. The mathematical arguments below were reconstructed from the proof files before reading the earlier audit summaries. This audit records reasons and dependencies; agreement among agents is not a proof certificate. No Lean verification, external specialist review, or publication-priority claim is made.

## Assessment

The packing-essential-edge theorem and the flat-remainder theorem have complete ordinary candidate proofs. I found no substantive gap after independently checking their local constructions, the inherited hypotheses, and the accounting for mixed triangles. The earlier equality-case restoration argument also checks. Its audit is recorded explicitly below because the full flat theorem needs its elementary covering lemma.

The shared-edge K4 defect proof is valid after correcting one unnecessary false explanatory sentence, described below. Neither these results nor their combination establishes unrestricted two-triangle restoration or the OCT-five consequence.

## The prior equality argument

The result audited here is pre-existing follow-up work, not a TUZA-02 discovery. Let T1,T2 be edge-disjoint, let H be obtained by deleting their edges, and suppose tau(H)=2nu(H)=2h together with a family of h edge-disjoint K4 witnesses in H. The witnesses are the only structural input needed in this argument.

A cover of H plus all six restored edges gives tau(G)<=2h+6. Thus only nu(G)=h+2 requires work. Each intermediate Gi=H+E(Ti) then has packing number h+1: a maximum H packing plus Ti gives the lower bound, and appending Tj to any Gi packing gives the upper bound. The vertices Ui of Ti are independent in H. A face outside Ui in each K4 gives h old triangles compatible with every member of Fi, where Fi consists of triangles created by restoring Ti alone. Therefore nu(Fi)=1.

For completeness, an intersecting graph-triangle family without a common edge is contained in the four faces of one K4. Choose abc and abd; a member avoiding ab must be acd or bcd. Any further member containing ab must be abc or abd to meet the third triangle, and any member avoiding ab is one of the other two faces. This proves the needed classification and the two-edge-cover bound.

If T1,T2 are vertex-disjoint, a graph triangle cannot use one edge from each. Hence the two Fi covers give a four-edge cover of all new triangles.

For a bowtie, write T1=vab and T2=vcd. The mixed triangles are precisely vac,vad,vbc,vbd for the available cross edges ac,ad,bc,bd. There are no other possibilities: two restored edges from different triangles must meet at v. The three covering cases are valid:

* If both Fi have one-edge covers, those two edges together with va,vb cover all new triangles.
* If F1 needs two edges, its K4 has a fourth vertex outside the bowtie. A page abc or abd would be outside that K4, so neither c nor d has two neighbors in {a,b}. Thus there are at most two mixed triangles. Any prescribed edge of T1 can be included in a two-edge cover of its K4, by taking its opposite edge. Choose a spoke hitting one mixed triangle; after the one-edge F2 cover, at most one additional mixed triangle remains.
* If both Fi need two edges, the cross edges form a matching of size at most two. One chosen endpoint on each side can meet all its edges. The corresponding two spokes can each be included in a two-edge cover of their Fi, covering the mixed triangles within four edges total.

Adding the four-edge new-family cover to the old 2h-edge cover proves the equality result. This includes h=0. No common maximum H packing avoiding U1 union U2 is assumed or needed.

For a general tripartite equality remainder, TUZA-01 supplies the K4 witnesses through HNS. For a flat equality remainder, HKT and elementary K4 isolation supply them directly, so HNS is unnecessary for the flat theorem.

## The packing-essential-edge theorem

The claim has the precise extra hypothesis that some graph edge e satisfies nu(H-e)=nu(H)-1. It is not a statement about an edge belonging to minimum covers.

1. Put J=H-e and k=nu(H)-1. Since tau(H)<=tau(J)+1 and Aharoni applies to J, the inequalities force tau(J)=2k. The triangle-hypergraph tripartition is inherited under graph-edge deletion.
2. The HNS witnesses exhaust all J triangles. A triangle outside their K4 faces meets each witness in at most one edge, so one avoiding face from each witness, together with that triangle, would enlarge the packing. Consequently the witnesses are isolated triangle components, even if they share graph vertices.
3. Write e=xy. A witness K4 can meet the old edges of at most one xy-page. It cannot contain both x and y. If it contains x and two page spokes xw1,xw2, then yw1w2 is a J triangle sharing its edge w1w2 but not contained in that K4, contradicting step 2. A two-edge opposite-pair cover of a K4 can include its unique touched page edge. If every xy-page touched a witness, choosing these covers would cover H in 2k edges. Since tau(H)=2k+1, a free old page Q exists whose edges avoid all witnesses.
4. The small-packing page-family lemma is correct. Page packings are matchings between the three restored bases and their apices. Tau(F)=3 excludes an empty base-neighbor set and two identical singleton sets. Hall's condition and nu(F)<=2 leave exactly two apices. A graph-realizable apex has incidence one or three among the bases, never two; both must therefore be universal.
5. In a critical individual restoration, choose k witness faces outside its independent triple U. This bounds nu(F)<=2. If its two apices p,q are nonadjacent, Q meets U and {p,q} in at most one vertex each, so Q contains at most one old page spoke. Two pages on distinct bases and at distinct apices can avoid that spoke. Together with Q and the k chosen faces they give an impermissible packing of k+3 triangles.
6. If pq is an H edge different from e, at least two of the three old triangles pqu, u in U, avoid e. They share pq and therefore lie in one J witness, forcing two independent U vertices into a K4. Thus the difficult family's apex edge is exactly e.
7. If both individual families were difficult, both would use the endpoints x,y of e. The four displayed pages in the proof are edge-disjoint, in both the vertex-disjoint and bowtie arrangements. Every J witness contains at most one of x,y; its opposite face avoids all four pages. This contradicts the critical packing bound.

Finally, an old minimum cover, a two-edge cover of one Fi, and the three edges of Tj cover all G triangles. Mixed triangles are counted correctly because every triangle absent from Gi contains an edge of Tj.

The argument proves the stronger proposed individual-family conclusion within the packing-essential-edge class, as well as Tuza's inequality. In the critical packing case, two distinct packing-essential edges force both Fi to have covers of size at most two: a difficult Fi would otherwise have its unique apex edge identified with both distinct edges.

## The flat-remainder theorem

I checked the source statement directly in Haxell–Kostochka–Thomasse, [author manuscript, Theorem 2](https://www.kostochk.web.illinois.edu/docs/accepted/plan-ht.pdf), p. 2. It applies to all K4-free flat graphs, not only planar graphs. The equality formulation needed for the proof is also justified by its triangle-graph argument: equality gives disjoint C5 triangle components.

In any flat H, K4 faces are isolated triangle components, because their edges already belong to two triangles. Removing all such components gives a K4-free flat remainder R. Packing and covering add over these components. HKT gives tau(H)<=2nu(H); if the defect is one then nu(R)<=2, leaving precisely a one- or two-page book, or a single five-wheel. This is a short deduction from the published theorem, not a new deep classification.

The five-wheel augmentation was checked in all cases. An independent restored triple U meets a wheel W in zero, one, or two vertices; in the last case the two are nonadjacent rim vertices. If U meets W at most once, two distinct-apex pages can be chosen, one on a base missing that wheel vertex. Together they consume at most one W edge, and deleting any one W edge leaves a two-triangle packing. If U meets W twice, write the rim as a,r,c,s,t and U={a,b,c}, with hub z and b outside W. The neighborhood of b inside W must be independent, or an extra old triangle would share a wheel edge. Any external apex in one of the two books ab,cb again allows two pages consuming at most one W edge. Otherwise their nonempty, nonidentical-singleton neighbor sets force, up to reflection, N(b) intersect W={r,s}. The triangles acz,abr,cbs,zst then form the required four-packing. Their twelve edges are distinct.

The small-book augmentation also checks. If the new family has a three-packing, combine it with the K4 faces avoiding U. Otherwise it is the two-apex family. Its apices cannot be adjacent in a flat H, since their edge would belong to three old triangles. Any old residual triangle then meets the page spokes in at most one edge; select two new pages avoiding it and append the old triangle.

These augmentations prove that a critical single restoration cannot have a three-edge new-family cover. The cover argument for two restorations is the same as in the essential-edge proof and includes all mixed triangles.

For the full flat theorem, defects at least two are elementary. Defect one is the new argument. At defect zero, HKT forces all triangles into isolated K4 components, and the prior equality covering argument audited above applies. Therefore the full flat theorem has an ordinary proof using HKT plus elementary arguments, without assuming triangle-3-colorability and without invoking Aharoni or HNS.

## Shared-edge K4 defect and correction

The additional core R consisting of K4s xyab and xycd has nu(R)=2, tau(R)=3, and nu(R-f)=2 for every graph edge f. Its isolated-component restoration argument follows the same local pattern as the wheel proof. When U meets R twice, those vertices are nonadjacent leaves a,c. The core-only apex case forces external vertex z to be adjacent to b,d, and acx,azb,czd,xyb form four edge-disjoint triangles. This construction is valid.

One explanatory sentence in the initial draft claimed that the failure of distinct apices on two bases forces the entire new family into a K4. This is false: the third base can have extra apices. I reported it to the proof stream. The correct justification is shorter: the two base-neighbor sets would be the same singleton, so their common spoke and the third base edge form a two-edge cover. This local repair leaves the proof intact. The corrected file should be the version used by the final report.

## Scope, novelty, and the next mission

The substantive new mechanisms are the free-page and forced-apex argument for packing-essential edges, and the explicit augmentation for flat defect-one components. The earlier equality proof must remain attributed to the supplied follow-up baseline. The flat structural classification is a deduction from HKT. An unsuccessful literature search for the restoration statements is not proof of originality.

The exact new reduction is useful: an unresolved near-equality counterexample to the original restoration conjecture must be nonflat and have nu(H-e)=nu(H) for every H edge e. This does not mean that all such graphs have a single small core. Edge-glued K4 examples already demonstrate that the remaining class is richer than a lone five-wheel or K5 minus an edge.

A separately authorized longer mission should investigate compatible packing exchanges and joint covering in that remaining class. A finite core reduction would itself need a proof; finite experiments are not such a reduction. The proposed individual-family lemma remains a candidate in the general class and should continue to be challenged, rather than being made an indispensable premise.

## Addendum on the K4-star extension

The subsequent proof in `../proof/K4_STAR_DEFECTS.md` was independently checked after the main audit. It is valid for a central K4 with one, two, or three leaf K4s attached along distinct spokes of one central vertex, together with arbitrarily many isolated K4 components. It subsumes the two-K4 shared-edge result. No substantive gap was found.

Write R as the cone with hub v over a triangle cactus F0 consisting of central triangle abc and r leaf triangles, at most one at each central vertex. There are d=r+1 blocks. The parameter claims are correct: every R triangle belongs to one block, so a packing has size at most d, and the d triangles of F0 attain it. The r edge-disjoint leaf blocks each require two cover edges. A cover with only 2r edges would lie entirely in those supports and miss abc, proving tau(R)>=2r+1; the displayed spoke, leaf-edge, and central-edge cover attains equality. Replacing a forbidden F0 triangle by an avoiding hub face also verifies nu(R-e)=d for every e.

For two forbidden F0 edges in different blocks, their replacement hub faces can conflict only at the spoke vt when one block is central and the other is the leaf at t. Avoiding both vt and a forbidden edge fails exactly when that forbidden edge is opposite t in its base triangle. This proves the stated two-edge avoidance fact.

The restoration proof's terminal-position cases are exhaustive. At most one terminal in R is handled by single-edge resilience. With exactly two terminals in R and core-only apices, the two consumed edges lie in different F0 blocks, because otherwise the terminals would be adjacent. The sole exceptional pair of opposite edges is handled by the three pages azc,pzq,apb and the d-1 old triangles specified in the proof; their edges are disjoint. With all three terminals in R, an external apex gives two pages compatible with every F0 triangle. Without one, independence permits either three private vertices in distinct leaves, which has only the hub as page apex and hence a two-edge cover, or one central vertex a and private vertices in the b- and c-leaves. The displayed three pages and replacement leaf faces give d+2 edge-disjoint triangles in the latter case.

An implicit fact used by these neighborhood calculations is valid: R is induced on its own vertex set under the isolated triangle-component hypothesis. An extra edge between two nonhub vertices would create a triangle with v sharing existing R-spokes, contradicting isolation. The proof stream was asked to state this fact and clarify one phrase in the r=1 cover construction. These are explanatory improvements, not repairs to the core argument.

This remains a restricted restoration theorem. The existence of these three core types does not establish that every nonflat, edge-deletion-stable defect-one remainder reduces to them.

## Final report audit, 28 October 2026, 17:09 UTC

The final `../REPORT.md` was checked against the saved proofs and evidence. Its Theorem A correctly omits an explicit slack-one premise: if e is packing-essential, tripartiteness survives deletion and Aharoni gives tau(H-e)<=2(h-1), whence tau(H)<=2h-1. Slack at least two is handled by the six restored edges, and slack one by the audited essential-edge argument. This broadening introduces no missing equality case.

The full flat theorem's dependency statement is accurate. HKT handles the K4-free remainder; in slack zero it leaves only isolated K4 triangle components, where the already audited elementary equality-cover argument applies. HNS is unnecessary for this theorem. The nonflat star theorem is stated with its actual isolated-component hypotheses.

The recorded finite counts agree with the generators and JSON evidence: 32,768 completions of the fixed seven-vertex bowtie, and 2+54=56 qualifying pairs of independent terminal triples for the r=2 and r=3 star cores, all with packing increment three. The r=1 core has no independent terminal triple. These counts were cross-checked against saved output and generator scope in this final audit, rather than rerunning the searches. A minor wording clarification was sent to the root agent: the star pairs are independent triples on existing core vertices, not triangles already present in H.

The family-definition example is correctly confined to refuting the alternative full-G interpretation: the saved independent certificates give both full-G family cover numbers three and both intended individual-family cover numbers one. The star examples refute only an overly small structural classification. Neither is presented as a counterexample to the intended restoration conjecture or individual-family lemma.

The report expressly leaves the unrestricted conjecture, OCT-five, general rigidity hypothesis, and historical priority unresolved. No substantive mathematical overclaim or unreported proof gap was identified. No further research or computation was initiated during this final audit.
