# Independent proof audit: exact frozen TUZA-15

**Public mathematical extract; VERIFIED_AS_FROZEN for exact T0.** This edition
retains the complete symbolic reconstruction in sections A-G. Operational
freeze logs, later critique comparisons and coordinator reconciliation prose
are omitted. Original source-file identity and this curation are recorded in
the [source manifest](../../TUZA-11-15-SOURCE_MANIFEST.json).

The finite dependency and scope diagnostics are separate shipped evidence:
[public reproduction receipt](../../../verification/tuza-11-15/REPRODUCTION.json),
[complete six-link result](../../../verification/tuza-11-15/finite/TUZA-15/portable_six_links.json),
[TWIN/Fano diagnostic](../../../verification/tuza-11-15/finite/TUZA-15/scope_diagnostics.json).
These do not replace the ordinary arguments below or imply a new Lean result,
external human peer review or historical-priority certification.

Source line references describe the original frozen edition. Its `source/`
prefix corresponds to this archive's [main proof](../PROOFS_AND_OBSTRUCTIONS.md)
and `source/notes/` to the shipped donor supplements. The target is every finite
simple G with mad(G) < 7, full actual triangles and literal shared-edge K4/K5
support, including empty/triangle-free cases and excluding mad = 7.

The acyclic dependency chain is: public clique/minimality/accounting -> codegree/robustness/degree-five package -> R6,BIP,THREE-SUN plus fresh SIX finite classification -> degree-six links -> TWIN/B2 and LOW/HIGH -> degree7/8 donor exclusions plus THIN/DOM -> conserved weighted discharging -> T0. The donor7/8 proof depends only on the earlier degree-five package, so no circular six-link premise is needed. SEP and the optional Section14 high-degree lift are not in this chain. The inequality in the final class is attributed to Puleo even though combined induction also reconstructs it.

## A. Exact hereditary induction, without five-degeneracy

Let P be Tuza's inequality plus the forward equality classification; the reverse B implies equality is universal. In any subgraph-closed class with a failure, choose one with the fewest edges, and discard isolates. A triangle-free graph cannot fail, so the chosen graph has a nonempty triangle family.

The public manuscript Sections 1–2, Lemmas 2/2A/3/3A (lines 45–97) reconstruct as follows.

* Triangle components partition actual triangle-edge support. The support subgraph of a component cannot acquire an uncounted triangle: any such actual triangle shares a support edge with a component member. Thus packing and cover parameters add over component supports, and a minimal failure has one nonempty component and no triangle-free edges.
* If deleting an edge e lowered packing h by one, induction and reinserting e would give tau(G) <= 2h-1, contrary to failure. Thus nu(G-e)=h.
* If tau(G-e)=2h, induction makes its triangle components literal K4/K5 blocks. A triangle xye through e=xy has two surviving spokes xw,yw that cannot occur in the same residual block because xy is absent. A maximum residual packing can therefore avoid the entire selected footprint and append xye, contradicting nu=h. Hence tau(G-e)<=2h-1. Edge deletion lowers tau by at most one, and a failure has tau>=2h. Therefore tau(G)=2h and tau(G-e)=2h-1.
* For an actual reduction with compatible r-packing P and lost-triangle cover X of size <=2r, the chain 2h <= tau(K)+|X| <= 2nu(K)+2r <=2h forces equality throughout, B(K), nu(K)=h-r, and |X|=2r. A strict tuple is impossible. All uses in the new proof delete every initial packing edge, a stronger condition than merely avoiding residual triangle support.

The Lean snapshot `MinimalObstruction.lean` defines minimality by Good on every smaller edge-subgraph and has `minimal_tight_critical` with no degeneracy argument. `FiveDegenerate.lean` introduces `Degenerate G 5` at the final global impossibility/peeling application, not this local interface. I did not run or claim a new Lean check.

The block interface is exact: a K4 maximum triangle avoids any star; a K5 maximum two-packing avoids any two edges. An arbitrary K5 star is not sufficient. For each selected local packing Q one must bound the UNION of all its surviving edges in each residual block. Unsupported residual edges are harmless because a maximum residual packing uses none of them.

## B. Public codegree, robustness, and degree-five package

The public manuscript Sections 3–7, Lemmas 4–7 and Proposition 8, contain no degeneracy hypothesis. I reconstructed their use independently rather than importing an inequality-only irreducibility condition.

For codegree (lines 99–109), if uv belongs only to uvw, delete uw,vw. The surviving uv is triangle-free, so uvw gives a balanced 1/2 tuple. Every residual block meets {u,v,w} in at most one vertex. Lost triangles all contain w and u or v. If two are edge-disjoint, their whole block footprint is a star of at most two edges and gives an extra packing triangle. If they are pairwise intersecting and have no common edge, the elementary graph-triangle intersection lemma forces wux and wvx, which in turn force a second uv-triangle uvx. Thus the lost family has a one-edge cover, also strict. Every graph edge consequently lies in at least two triangles, and every link has minimum degree two.

For robustness (lines 111–143), the only connected links of order <=4 and minimum degree two are K3, C4, diamond, K4. The displayed balanced reductions exclude K3/K4 by external-page augmentation or isolate a whole forbidden clique component; diamond uses the two possible matchings and a smaller final cover. The C4 reduction retains a rim edge bc; codegree gives a surviving triangle on bc, so a minimum residual block cover can be chosen to contain bc and save one edge. Partial spoke deletion, rather than deleting all of a hub, handles other closed link components. Therefore every link component has at least five vertices; normalized minimum degree is at least five.

For degree-five links (lines 145–230), robustness makes the link connected. There are eleven possible complement graphs with maximum degree <=2. Their three complements that are not3-colorable are K5,K5-e, and K4 with an additional degree-two vertex. The eight 3-colorable possibilities are excluded by the four displayed dense witnesses, bowtie strictness, bipartite/C5 page arguments, and the K2,2,1 page-family argument. The latter uses all external pages and a good-pair classification; its claim that absence of a good disjoint pair gives a two-edge cover follows from graph closure, including common-apex and distinct-apex cases. The extra K4-plus-degree-two link has its explicit three-triangle restoration. Remaining links are exactly K5 and K5-e.

The public low-neighbor proof (lines 232–293) explicitly treats domination, adjacent 5/5, and nondominating 5/6. Balanced singleton reductions leave K5 with one or two independent edges removed, whose edge-sharing triangles cannot have literal clique support. The adjacent 5/5 five-triangle restoration has whole footprint {pw1,pw2,qw1,qw3}; independent W forces at most two spokes sharing its unique W endpoint per block.

Proposition 8 (lines 295–353) concerns arbitrary nonadjacent degree-five vertices, not a degenerate class. Five common neighbors give strict 6/10 or 5/9 tuples. Four common neighbors give either strictness or a W-page appended to a core four-packing. With three common neighbors, each near-clique possibility is excluded by the displayed seven-packing footprint arguments. Hence any pair has <=3 common neighbors, and equality three forces both links complete. For the final discharging only the <=3 conclusion is needed. This local result is applicable to nonadjacent low vertices because low independence has already been proved.

## C. New reductions and arbitrary outside incidence

References in this section are to `PROOFS_AND_OBSTRUCTIONS.md` unless stated otherwise. Each balanced reduction uses a proper edge-subgraph in the hereditary class; no residual B is assumed until accounting forces it.

### R6 (Section 1, lines 15–56)

For a CLOSED six-neighbor link K6-{12,34}, the initial five triangles use only deleted edges; R has nine rim edges and X=R+v6 has ten. Closedness accounts for every lost-spoke triangle; all other lost triangles directly use R. Residual core edges are exactly 61,62,63,64, and W={1,...,5} is independent.

The five-packings avoiding 13,15,56 cover the three edge orbits of K7-2M and are valid. For an arbitrary page on an R edge, append that page to a core five-packing avoiding its base. If the base lies in W, any block has only one W vertex, so its local surviving edge and possible page spoke share that vertex. If the base is 56, a block containing 5 cannot contain 6; a block containing 6 has footprint within {6x,6t}. The entire footprint is a two-edge star, not the unbounded four-edge core star. This yields gain six against cover ten. If R has no outside page, all lost triangles lie in the fixed core, covered by the stated seven within-part edges, giving an even stronger saving. Other hub components and arbitrarily many pages do not enter the selected footprint.

### TWIN (Section 2, lines 58–76)

The two closed-link conditions exclude every triangle through a deleted hub edge from leaving the core. The 5/10 tuple is valid. The restored six-packing's whole footprint is {wc,wd,ac,bd}. Deleted cycle edges forbid every pair except {wc,ac} and {wd,bd}; therefore each block sees a star of size at most two. Optional wa,wb edges do not break this test. The reduction applies to the degree-six twin forms after the six-link theorem is established.

### THIN and DOM (Sections 3–4, lines 78–107)

THIN explicitly requires the degree-six link to be K6 minus exactly a perfect matching. Its four-packing/eight-cover tuple is balanced. The five-packing leaves only qb,qc,qd; W is independent in the residual, so a block sees at most one. All named private neighbors are distinct from W and from the opposite hub's neighbors by their definitions. Bare Puleo thinness would not suffice; the proof does not substitute it for the exact link.

DOM requires actual subsumption. Complete six-link gives K7 with its seven-triangle edge decomposition and cover <=13 for donor degree <=8. Near-complete six-link gives K7-e with a six-packing and cover <=11 for donor degree <=7. The selected uZ spokes cover every hub triangle involving a private neighbor. These are strict tuples under residual inequality alone, so there is no hidden restoration premise.

### BIP (Section 8, lines 133–147)

A bipartite closed link H has minimum degree two. A maximum matching M has a different maximum matching M': an unmatched vertex permits a one-edge swap; a perfect matching permits an alternating directed cycle because each vertex has an outgoing edge. Choose f in M-M'. Konig gives a vertex cover Q of size r=|M|. The hub triangles on M and cover M+vQ are a balanced r/2r tuple, even at unbounded hub degree or link order.

Codegree gives a second triangle on f. Its apex is outside H because H is bipartite. The r hub triangles on M' plus this page are edge-disjoint. A residual clique intersects H in at most two vertices; hence it sees at most one M' edge and one page spoke, and if both occur they share an H endpoint. The whole footprint is a two-edge star. This proves the unbounded local exclusion; no finite six-vertex census stands in for it.

### THREE-SUN (Section 10, lines 154–162)

M0={az,bx,cy}, central spokes va,vb,vc give a balanced 3/6 tuple. After deleting M0, H is central triangle abc with three pendants ax,by,cz. A page on az plus the M1={ax,by,cz} hub triangles has footprint {ax,by,cz,at,zt}. The only possible two-edge block footprints are {ax,at} and {cz,zt}; thus arbitrary external pages on M0 are excluded. Without them, every lost triangle lies in the cone. The six-edge cover Z includes all three edges of the retained triangle abc. Every residual cover must therefore overlap Z, giving increment at most five against the forced six. Other outside triangles are retained and already covered.

### Adjacent degree-six vertices (Section 12 and Scout B B2)

The six-link classification leaves common-neighbor counts four or five. Count five gives twins; a dominating endpoint rules out the matching-complement link. Count four gives a common K4 or C4 (a common K4-e would produce the excluded K6-2M link), and both private neighbors join all common vertices. B2's five-packing and nine-edge cover in the cycle order 1,2,4,3, and the added rim triangle giving 6/11 in K4, are strict tuples. Every selected noncentral edge belongs to X; X meets all triangles through either hub, including those with private neighbors. I checked both rows independently. Together with the public 5/5 and 5/6 exclusions this establishes low independence.

## D. Six-link finite theorem: exact sufficient interface, finite truth left separate

Section 11 (lines 164–181) applies robustness and codegree to make a six-vertex link connected and minimum-degree two. If its complement has maximum degree >=2, the supplied certificate is either:

1. Matching M and cover Q of H-M, |Q|<|M|, immediately strict; or a balanced version followed by an explicitly edge-sharing family of residual triangles whose vertex union cannot be a clique of order four or five.
2. A balanced version followed by r+1 cone triangles. Let D be ALL surviving rim edges of those triangles. The tests require D restricted to every clique of H-M of order <=4 to be a star, and to every clique of order <=5 to have at most two edges.

These tests suffice for arbitrary residual blocks and all outside vertices: a residual block's intersection with H is one of precisely those cliques, and no selected surviving edge has an endpoint outside H. An outside vertex cannot repair an absent edge among fixed H vertices. This is the essential mathematical lift from finite certificates to unbounded graphs.

The stated four exceptional graphs are three bipartite links and the three-sun, already excluded symbolically. If complement maximum degree <=1, its edges form a matching; R6 removes matching size two. Thus the three possible degree-six links follow if and only if the supplied finite coverage/predicates are independently verified. At the initial freeze I had not independently checked every certificate/orbit. The separately assigned current fresh exhaustive verification has subsequently passed; its precise scope and receipts are linked in the public-evidence annotation above. This reviewer does not claim to have authored or personally rerun that second reviewer's checker.

## E. Degree-seven and degree-eight subsuming-five donors

Scout B B4 gives donor degree seven without the six-link classification. Set W of size four, Z of size two, core K6 or K6-e.

* If Z has an edge, the 5/9 tuple is strict in the near-clique case. The full case has 5/10; any W-page augments to six, with only its spokes surviving and W independent. With no page, a six-edge core cover plus the two uZ spokes and Z edge costs nine.
* If Z is independent, each Z vertex has at least two W-neighbors by codegree on uZ. When the W-neighborhood union is two, the displayed singleton tuple leaves an induced diamond in the residual five-vertex near-clique. With union at least three and W near-complete the displayed five-packing gives 5/9. With W complete choose z0w and a page zab with w outside {a,b}; the core four-packing avoids disjoint uw,ab. The two extra triangles remain edge-disjoint even when z=z0. Only the page spokes survive, at most one per block.

The donor-degree-eight note is exhaustive by G[Z] empty/nonempty and W complete/near-complete.

* H2 is valid: after any singleton matching removal the residual induced five-vertex core has a missing-edge graph with one to three edges and maximum degree two, hence contains an induced diamond. For three missing edges a degree-two vertex exists, and removing it leaves exactly one missing edge on four vertices. The untouched K5 alternative forces |Q|>=4 while v is unmatched in the eight-vertex link and |M|<=3. Thus no such tuple is possible.
* Independent Z: each z has >=2 W-neighbors. A size-three W–Z matching augments by vw to a size-four singleton tuple, excluded by H2. Size two permits a two-vertex cover; the union-two case has the displayed size-three singleton tuple. The additional union>=3 branches in the text also have valid strict/augmentation arguments. In fact Hall already makes the size-two/union>=3 branch impossible here (three Z vertices each of degree at least two), so it is redundant rather than a gap.
* Z with an edge: the initial 5/9 or 5/10 cover selects at least two uZ spokes and all active Z vertices. Therefore every uZZ triangle and uZW triangle is covered, regardless of other Z edges. In the full-W/two-active branch all W-pages are impossible and the cover saves one.
* Near-complete W, all-active: no cd-page survives the augmentation. Any two disjoint pages on the other four bases combine with the displayed three-packing and uz1z2. Their entire footprint is a two-edge star in each block. Thus pages are pairwise intersecting. Disjoint bases cannot meet; bases ac/ad (or bc/bd) meeting at a common apex force an excluded cd-page. All bases lie in one column {ac,bc} or {ad,bd}, and the corresponding five-edge core cover plus uZ and z1z2 saves one.
* Full W, all-active: for each w in N_W(z0), a balanced 6/12 tuple is available. A page base avoiding w augments to seven, including if its apex is z0, because it avoids w. Repeating the valid argument for a second neighbor w' restricts every page base to ww'. If z0 has only neighbor w and there are two distinct page bases wa,wb, their apices must differ (otherwise graph closure forces a page on ab), and neither apex is z0. The core three-packing avoids the three-edge star uw,wa,wb; appending both pages and the two other selected triangles gives seven. Thus only one base is possible. A six-edge core cover containing that base plus uZ and both extra deleted bases has size eleven against forced twelve.

In every branch pages mean ALL actual W-edge triangles with apex outside the core. No graph-order, multiplicity, apex-distinctness or outside-degree assumption is imposed. Coincident apices z=z0, apices z1/z2, and common-apex closure were explicitly checked. Selection of only one or two pages, together with independent W, keeps K5 footprints within two edges.

## F. Final degree bounds and exact discharging

Once low independence and six-link classification hold, a high vertex with at most three high neighbors cannot have a degree-six neighbor: such a neighbor requires at least four common neighbors, all high by independence. Every remaining low neighbor has degree five and requires at least three high common neighbors. Hence exactly three high neighbors exist and all low neighbors join all three. There are at least four low neighbors when the hub degree is at least seven, so two have the four common neighbors consisting of the hub plus those three, contrary to Proposition 8. Thus every high vertex has at least four high neighbors.

The final charges (Section 16, lines 220–230) are exact:

* Degree five receives 2/3 from each subsumer; K5/K5-e links give at least three subsumers, so it reaches seven.
* Thin degree six receives 1/6 from all six neighbors and reaches seven. Other degree-six links give at least four subsumers at 1/4, also reaching seven.
* Low independence means no low vertex pays anything. Degree-seven donors pay nothing: B4 excludes subsumed fives, DOM excludes subsumed non-thin sixes, THIN excludes thin-six adjacency.
* Degree eight has at most four low neighbors and no subsumed five, so pays at most four quarters and remains at least seven.
* Degree nine with <=3 low neighbors pays at most two. With >=4 it has at most five low neighbors and <=5 high neighbors. Two subsumed fives would have four-subsets of those high neighbors intersecting in at least three; with the hub that gives four common neighbors, impossible. Thus payment is at most 2/3+4/4=5/3 <2.
* For degree k>=10, two subsumed fives require at least six high neighbors: their four-sets intersect in at most two, so their union has at least six. At most k-6 low payments, each <=2/3, leave k/3+4>=7. With at most one subsumed five, at most k-4 low neighbors leave charge >= k-2/3-(k-5)/4 =3k/4+7/12 >7. The case of no low neighbors is harmless.

No Puleo degree-nine irreducibility conclusion is imported. The degree-five overlap premise is proved earlier without degeneracy and is applied only to nonadjacent low vertices. Every normalized obstruction vertex ends at charge >=7, so its own average degree is >=7. Since an obstruction in the subgraph-closed class mad<7 would still have mad<7, this is a contradiction. No assertion is made at mad=7 or for all six-degenerate / maximum-degree-seven graphs. Empty and triangle-free cases satisfy equality vacuously.

## G. Optional claims and diagnostics

SEP (Section 5) is valid at its stated interface: when both sides lose one packing triangle on deleting the shared edge, covers of the deleted sides plus that edge save one relative to a combined packing; otherwise one side can pack while avoiding the edge, and tight blocks admit minimum covers containing the shared edge. The incidence-articulation corollary uses all actual triangle nodes, so crossing triangles cannot have been omitted. It is not needed for T0.

The optional Section 14 high-degree subsumption lemma has a valid Hall argument in its stated low-independent/classified setting. In the |B|=5, |T|>3 branch, a two-set in B has w plus another A-neighbor, or T would be contained in its three-vertex complement; larger B subsets meet every A-neighborhood. The constructed matching can include w. Residual diamonds then contradict B(K). It is not a premise of final discharging and should retain that status.

The intermediate mad<25/4 proof uses the same low independence/four-high-neighbor facts and ordinary conserved quarter charge. Its arithmetic is valid, but it is not a substitute for the donor lemmas needed at seven.

Fano is a useful negative control for dropping actual graph geometry and/or combined tightness: its rank-three incidence hypergraph has packing one and cover three, so it fails the equality tau=2nu required here. Point-deletion criticality alone cannot prove this theorem. The new arguments require actual graph clique closure, actual missing endpoint edges, and proved K4/K5 avoidance. Neither excluding Fano nor passing a fixed-core test by itself certifies arbitrary attachments. The explicit symbolic footprint/page arguments above discharge that different quantifier. K6 is likewise not a combined obstruction because its deficit is two, despite satisfying several weaker critical-looking properties.
