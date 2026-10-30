> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# TUZA-04 literature and cover-interface route

## Sources inspected

Frozen reference revision: 97e913008e466de14f61437d8dae774946d92e8f. Read the manuscript definitions/equality extraction, Sections 7–11, scope/verification/open questions, PROOF_COVERAGE, priority inventory, LEAN_VERIFICATION, FINAL_ASSESSMENT, and reproduction README. Ordinary proofs, conditional Lean inputs, and unverified archived drafts are distinct. No Lean build was run by this route.

1. Cui–Haxell–Ma, *Packing and Covering Triangles in Planar Graphs*, https://www.columbia.edu/~wm2428/papers/packing_covering_triangles.pdf . Theorem 1.2 classifies planar equality using edge-disjoint K4 supports exhausting all triangles. This does not classify nonplanar equality or stable slack-one tripartite remainders. Their minimum-cover flexibility is available in equality K4 blocks, not automatically in slack-one graphs.
2. Haxell–Kostochka–Thomasse, *A Stability Theorem on Fractional Covering of Triangles by Edges*, author manuscript https://perso.ens-lyon.fr/stephan.thomasse/liste/fractuza.pdf . Theorem 1 assumes a lower bound on fractional tau*, yielding many K4s. Integer tau=2nu−1 supplies no such lower bound. Their K4-free cone examples expressly separate near-extremal integer behavior from the fractional hypothesis.
3. Haxell–Narins, *A Stability Theorem for Matchings in Tripartite 3-Graphs*, https://arxiv.org/abs/1701.06451 and https://arxiv.org/pdf/1701.06451 . Theorems 1.4–1.5 impose regularity, or min-degree in one part versus max-degree in the other parts. They are not a stability theorem from the sole assumption tau=2nu−1. No reduction establishing their degree conditions here has been found.
4. Gupta, *Tuza’s conjecture for graphs of maximum degree at most seven*, https://arxiv.org/abs/2608.06538 and https://arxiv.org/html/2608.06538v1 . Question 12.3 is restricted to maximum degree seven and explicitly leaves 7-regular equality open. Its catalogue is a reported finite verification; not reproduced here. It does not establish prior publication of exact global S. No Barbados attribution is made.

Targeted searches used combinations of Tuza/equality/critical and Ryser/stability/linear/3-partite. No exact predecessor for the cover-interface statement below was located. This is not a novelty certificate. The DOI 10.1016/j.ejc.2015.03.006 could not be fetched through the web tool. No downloaded material retained yet.

## Complete short deduction: cover switching in the exact two-apex critical case

Assume exactly the hypotheses of frozen Corollary 11.3: D(H) is tripartite, nu(H)=h, tau(H)=2h−1, H is packing-edge-stable; U={a,b,c} is independent; P={p,q} are distinct nonadjacent universal page apices; the entire new family F upon restoring abc is precisely abc and its six p/q pages; J=H+abc has nu(J)=h+1 and tau(J)=2h+2.

Then:

(A) None of the six spokes belongs to any minimum H-cover. If such a cover C contains up, adding the opposite base vw and uq covers all F, giving a J-cover of size tau(H)+2, contradiction. The case uq is symmetric.

(B) Delete a whole terminal row A_u={up,uq} and write H_u=H−A_u. The three edges up,uq,vw cover F and every old triangle destroyed by A_u. Thus tau(J)<=tau(H_u)+3; monotonicity forces tau(H_u)=tau(H). Aharoni and monotonicity then force nu(H_u)=h.

(C) All four remaining spokes belong to some minimum H_u-cover. For any distinct remaining terminals v,w, frozen Corollary 11.3 applied to compatible pages uvp,uwq gives
nu(H_u−{vp,wq})=h−1 and tau(H_u−{vp,wq})=2h−3.
Deleting one graph edge changes tau by at most one. As tau(H_u)=2h−1, both single deletions vp and wq must lower tau by one. Appending the deleted edge to a minimum cover of that deletion proves it belongs to a minimum H_u-cover. Exchange p,q to cover the other two spokes.

This is a necessary exact deletion profile, not a contradiction or a theorem settling the two-apex case. (C) uses accepted Corollary 11.3; no stability of H_u is assumed. All deleted graphs retain full tripartite triangle hypergraphs.

## Failed simplification

The tempting claim that every active edge of a stable slack-one tripartite graph belongs to a minimum cover is false. Glue K4s on {a,b,c,d} and {a,b,e,f} along ab. The graph is four-colorable and has (nu,tau)=(2,3), with unique minimum cover {ab,cd,ef}; other spokes are active but never in a minimum cover. A maximum packing avoids any specified edge by choosing suitable faces, so it is edge-stable. Its cover-excluded edges form K2,4, but the two high-degree vertices a,b are adjacent in the original graph. Thus cover-excluded bipartite structure alone does not contradict stability; the nonadjacent-apex condition is material.

## Open mechanism

Can the simultaneous change in (A)–(C), together with graphical tripartiteness and edge stability, be ruled out? This is a narrower obstruction formulation than an unsupported iteration of four-spoke descent. A general matching or cover submodularity argument has not been supplied; neither parameter is being assumed submodular.

Computations: none by this route; no solver or Lean run. Web literature inspection and remote text reads/writes only.

## Independent agent review of the equality route

Reviewed EQUALITY_ROUTE.md SHA-256 4c8daf2905ef9798f57b3a5c7326cac49e0b06c59b3b084ac54c45e70197afac. This is independent agent reconstruction, not external expert endorsement. No numerical or Lean check was used.

The tight-critical reduction is valid: for a minimum-edge failure of global S, every proper edge-subgraph has both Tuza and the equality classification. Essential edges would contradict tau(G)>=2nu(G). An equality predecessor G-e has K4/K5 blocks, and its missing edge endpoints cannot lie in the same clique block; hence each block can avoid its at-most-one edge of a chosen restoring wedge. This excludes both tau(G)=2nu(G)+1 and a cover-preserving edge deletion at equality. The conclusion tau(G)=2nu(G), nu(G-e)=nu(G), tau(G-e)=tau(G)-1 uses exactly this stronger S-minimality.

The no-codegree-one proof is valid. If uv is unique to uvw, deleting uw,vw makes uv triangle-free; residual equality blocks meet {u,v,w} at most once. If the lost family has packing one, a no-common-edge intersecting family forces a fourth vertex x and all three w-faces, hence uvx, contradiction. Otherwise two lost triangles can be appended to suitable full block packings; K5 needs only avoidance of their at-most-two old edges, not avoidance of an independent vertex set.

The K3, K4, diamond, and C4 link arguments are valid as written. I separately checked each forbidden-edge set. In the diamond case {ad,bc,ax,cx}, the absent edge ac rules out every pair except the adjacent pairs {ad,ax} and {bc,cx}; each block therefore sees at most two adjacent edges. The final cover {vc,vd,cd} handles every v-triangle and both local rim triangles. For the K4 link, {ac,bd,ax,bx} has the same property because ab is absent. The C4 residual keeps bc in a triangle because no edge has codegree one, so a prescribed-edge minimum cover gives the claimed saving.

Strengthening: these proofs also exclude a COMPONENT of a vertex link with order at most four. Delete only the spokes from v to that component in place of deleting v. No triangle using those spokes can reach another link component. The same packing, cover, and forbidden-rim sets work; residual blocks containing v cannot contain any of the deleted-spoke endpoints. Once the local K4 or K5 has no external rim triangle, its spokes also have no outside triangles, so it is an isolated triangle component. Thus a minimum S failure is robust in Puleo’s sense: every component of every vertex link has at least five vertices.

Primary comparison: Puleo, arXiv:1308.2211v3, Lemma 2.6 and its proof after Corollary 4.9, establishes robustness for minimum counterexamples to the Tuza inequality. It does not address an equality graph failing K4/K5 classification. The present statement is therefore an equality-aware strengthening of that obstruction reduction, adapting Cui–Haxell–Ma’s equality induction. No claim of historical priority is justified by this limited check.

Limits: no deduction transfers this S-minimality reduction to arbitrary tight-critical graphs or to a minimal restoration counterexample; those classes do not supply the proper-subgraph equality classification. The broad WKE-link extension is still a question because the residual forbidden-edge footprint may exceed the two-edge avoidance capacity of a K5 packing.

## Additional negative literature guardrail

Clow–Haxell–Mohar, https://arxiv.org/abs/2505.05339, refute the general tripartite matching-reduction claim that two hypervertices always reduce nu. Abiad–Garbe–Povill–Spiegel, https://arxiv.org/abs/2506.21286, give further families. These do not refute the graphical slack-one hypotheses here, but an unrestricted two-edge deletion principle cannot be borrowed from general tripartite hypergraphs. No examples from these papers were reproduced.

## Transfer to a minimal restoration-equality obstruction

This transfer was independently reconstructed after the equality agent proposed it. Minimize |E(H)| among equality graphs J=H+E(T) failing R, where D(H) is tripartite and T is restored on U. A proper deletion of old edges stays in the one-triangle restoration class, so satisfies Tuza by the accepted theorem; equality gives K4/K5 components by minimality. Remove triangle-free J edges and every triangle component except the one containing T: all other components are old, tripartite, and at equality must be K4s. Thus the minimal obstruction has connected triangle support containing T.

Let v be outside U with at most one neighbor in U. Every v-triangle uses only old edges. Every deletion in the no-own-edge argument for an edge incident with v is therefore old. The local small-link proofs likewise delete only old spokes and old rim edges. They transfer verbatim. Consequently every incident edge has triangle codegree at least two and every component of J[N(v)] has order at least five. The edge labels of H on vw properly 3-color this entire link. This is a theorem about such a minimal obstruction, not about arbitrary equality graphs or arbitrary tight-critical graphs.

## Three five-vertex old-link exclusions

These are complete ordinary proof candidates derived in this route, using only the just-reviewed minimal-obstruction framework and explicit residual clique avoidance. No computation or Lean run.

Let v be as above, or use a vertex in a global minimum S failure. Let L be a five-vertex component of its link. For a rim matching M, let K be obtained by deleting all v-spokes into L and the edges of M. A packing of K appends the v-triangles on M. A cover of K appends M together with v-spokes indexed by a vertex cover Q of L−M. Equality forces residual equality whenever |Q|=|M|; then K has K4/K5 triangle components. If |Q|<|M| it gives immediate strictness. Componentwise use is valid because no affected v-triangle leaves L.

1. Bowtie link: L consists of triangles abc and ade sharing a. Take M={bc,de}, Q={a}. The two triangles vbc,vde append to a K-packing; the three edges bc,de,va complete a K-cover. Thus tau(J)<=2nu(J)−1, contradiction.

2. K2,3 link: sides {a,b} and {c,d,e}. Take M={ac,bd}, Q={a,b}. Residual equality has nu(K)=nu(J)−2. The edge ac lies in a triangle acx other than vac because codegree one was excluded. Since the link is bipartite, x lies outside {v,a,b,c,d,e}. The triangles acx,vad,vbe are edge-disjoint. Their old edges present in K are ad,be,ax,cx. A residual clique block cannot contain both a,c (ac was deleted), both a,b, both c,d, or both c,e (the last three are link nonedges in J). These exclusions rule out every forbidden-edge pair except {ad,ax}, which is adjacent. Every block therefore has a maximum packing avoiding all four forbidden edges on its support: use the opposite face for K4, and the explicit two-edge-avoidance pair for K5. Append the three displayed triangles to obtain nu(J)+1, contradiction.

3. Five-cycle link: cyclic order abcde. Take M={ab,cd}, Q={c,e}; the latter covers bc,de,ea=L−M. Residual equality again has packing nu(J)−2. By absence of codegree-one edges, there is abx other than vab; C5 has no local triangle, so x is outside the local vertices. Append abx,vbc,vde. Their old forbidden edges are bc,de,ax,bx. Missing ab in K and nonedges ad,bd in J rule out every pair except {bc,bx}, which is adjacent. Therefore residual maximum block packings avoid them and give an augmentation by three, contradiction.

The eight possible five-vertex links with minimum degree at least two and chromatic number at most three can be described by their complements: 2K2+I, P3+K2, P4+I, P5, C3+K2, C3+2I, C4+I, C5. This follows because the complement has maximum degree two and is a disjoint union of paths/cycles; 3-colorability requires either two disjoint complement edges or a complement triangle. The three cases above are complements C4+I, C3+K2, C5. The equality agent handles the other five; no conclusion about them is asserted in this note yet.

## Completion of the fifth-degree obstruction: K2,2,1 link

This proof was developed concurrently with the equality route and then cross-checked. It is a complete ordinary proof candidate; its individual deductions are stated explicitly below. The parent is independently checking the finite local packing witnesses. No computation was run by this route.

Let L=K2,2,1 with independent pairs {a,b},{c,d} and singleton e. Add its center v to obtain B=K6−{ab,cd}. Its eight rim edges are ac,ad,bc,bd,ae,be,ce,de. Delete all thirteen B edges from J, obtaining K. In a componentwise formulation only the v-spokes into L are deleted; there are no other B edges.

The four triangles vac,vbd,ade,bce are edge-disjoint. Every K-packing therefore appends them. All lost triangles are covered by the eight rim edges: v-triangles contain a rim edge, and any other lost triangle must use a rim edge since no v-triangle leaves this link component. Thus equality and minimality force nu(K)=nu(J)−4 and tau(K)=2nu(K), with K4/K5 residual triangle components.

All six B vertices form an independent set in K, so any residual clique block meets them at most once. This is used only to bound forbidden EDGE footprints, not to claim K5 packing avoidance of independent vertex sets.

Let F consist of all triangles with one rim edge and third vertex outside B. Every lost triangle is a B-triangle or belongs to F. The four edges ae,be,vc,vd cover all B-triangles.

### Good and exceptional rim pairs

Except for the four pairs
{ac,bd}, {ad,bc}, {ae,be}, {ce,de},
deleting two distinct rim edges leaves a three-triangle packing in B. The following four representatives cover all other pairs under swapping a,b, swapping c,d, and exchanging the two pairs:

- Delete ac,ad: use vae,vbd,bce.
- Delete ac,ae: use bde,vad,vbc.
- Delete ac,be: use ade,vbd,vce.
- Delete ae,ce: use bde,vad,vbc.

The orbit sizes are respectively 4,8,8,4, totaling 24 of the 28 rim pairs. Only the displayed existence of these packings is needed; no assertion about the exact optimum for an exceptional pair is needed for the proof.

If F has two edge-disjoint pages whose rim pair is good, take their two triangles plus the corresponding three B-triangles. Each residual clique block sees at most two old page spokes, all incident to its at-most-one B vertex. K4 avoids this star; K5 avoids any two edges. These five triangles append to a maximum K-packing, giving nu(J)+1, contradiction.

### External-family lemma

Assume no such good pair exists. Then tau(F)<=2.

If F is pairwise edge-intersecting, apply the standard two-edge intersecting-family lemma. Otherwise choose two edge-disjoint pages P,Q. Their bases f,g must be one of the exceptional pairs. Each base has exactly one exceptional partner.

Any page R on a base different from f,g must intersect both P,Q, since otherwise its disjoint pair with P or Q would be good. For different bases, two external pages share an edge precisely when their apices coincide and the bases share an endpoint. Thus, if P,Q have distinct apices, no third base is possible and {f,g} is a two-edge cover of F.

If P,Q have the same apex x, their bases must be disjoint (otherwise they share a spoke). Up to symmetry f=ac,g=bd. A third base meeting both is ad or bc: the other cross possibilities ab,cd are absent. Such a third page must have apex x. Its presence also forces every page on f and g to have apex x, since a page on either base at another apex would be disjoint from the third page on a good pair of bases. Every possible additional page is therefore among acx,adx,bcx,bdx. The two spokes ax,bx cover all of them. If no third base occurs, again {f,g} covers F.

Hence tau(F)<=2 in every case. A K-cover, the four-edge B-cover, and a two-edge F-cover have total size 2nu(K)+6=2nu(J)−2, contradiction.

This excludes a K2,2,1 link component in the global S-minimal setting and in the old-edge-minimal R setting for a vertex outside U with at most one U-neighbor. Combined with the seven earlier five-vertex link cases (four proved by the equality route, three above), it raises the lower bound on every such link component to six vertices. In particular every vertex outside U and its page-apex set has degree at least six.

### Independent check of the other four five-vertex certificates

I manually checked the four certificates supplied by the equality route: K2,3+bc (extra edge on the size-three side), complement P4+I, complement P5, and K2,3+pq (extra edge on the size-two side). Each stated matching is valid, each Q covers L−M, and the displayed three triangles are pairwise edge-disjoint. In the forbidden old-edge sets, all pairs are prohibited by an explicit missing residual or link edge except a single adjacent pair (or no pair), so K4/K5 maximum packing avoidance is applicable. These checks are independent proof reconstruction, not a computer enumeration or Lean certification.

## Independent audit: four-degenerate equality theorem (10:35 UTC)

The local equality reduction in EQUALITY_ROUTE.md proves a theorem within the hereditary class of four-degenerate graphs. Take a minimum-edge failure of the combined statement S within this class, with no isolated vertices. Every proper edge-subgraph and every vertex deletion remains four-degenerate, so S is available on every residual used in the argument. Triangle-component restriction also preserves four-degeneracy. The previously audited tight-critical, no-own-edge, and link-component arguments force every vertex to have at least five neighbors. This contradicts four-degeneracy. Thus the argument is not assuming global S in order to prove the restricted statement.

Candidate theorem: for every finite simple four-degenerate graph G, tau(G) <= 2 nu(G), with equality if and only if each nonempty triangle component is K4 or K5. The reverse implication follows by additivity over triangle components and the optima of K4 and K5. Components mean shared EDGES; triangle-free background edges are irrelevant to these optima.

Evidence: complete ordinary proof candidate, independently audited by a separate agent; not Lean-verified. The inequality is a consequence of the established low-degree reducibility approach (Puleo), so the prospective novelty is the equality characterization. Primary comparisons so far: Cui-Haxell-Ma classify planar equality using K4 blocks; Puleo proves the low-degree obstruction for inequality rather than this equality classification; Gupta's 2026 question concerns maximum degree seven. Targeted searches for four-degenerate / 4-degenerate / degeneracy with Tuza equality did not locate the exact theorem. This negative search is not a novelty certificate, and no claim of first publication is justified yet.

## Independent audit: exact two-apex active boundary and defect packing floor

Reviewed BOUNDARY_ROUTE.md with SHA256 d256e1f8af22063dd2898a332992b552bd347a7a6d7431f95cacbe9a5a1b2091. This audit covers the all-six-active and defect-packing-at-least-five arguments, not every private-draft claim discussed elsewhere in that file.

Under the exact two-nonadjacent-apex critical configuration of frozen Corollary 11.3, the all-six-active proof is sound: if ap is inactive, first delete the full row {bp,bq}, which preserves tau by whole-graph gain three. Then deleting ap costs zero and deleting cq costs at most one. The resulting four-spoke path footprint therefore loses at most one cover unit, contradicting the unconditional Corollary 11.3 loss of two. This step does not assume the later classification of descendants.

Each active spoke is excluded from every minimum old cover, so it cannot lie in an isolated K4 triangle support, whose minimum covers can include any prescribed edge. Thus all six spokes lie in the unique defect. Exactness separates the three old row families. If the b and c rows each have matching number one, their active two-edge apex-side bipartite graphs are stars with centers x_b and x_c outside the terminals/apices. Exactness forces x_b != x_c. Delete row a (zero tau cost) and bx_b, cx_c, qx_b, px_c (at most four further units) to obtain O with tau(O) >= 2h-5 and therefore nu(O) >= h-2 by Aharoni. The four triangles abp, acq, bqx_b, cpx_c are edge-disjoint. Their edges are either restored bases, deleted edges, or old spokes rendered triangle-free in O; hence every O packing is compatible. They yield h+2 triangles in J, a contradiction. At most one row therefore has matching number one; at least two have matching number two. Their row-disjoint packings yield five old triangles entirely inside the defect. Conclusion: nu(defect) >= 5.

This strengthens the previous lower bound and excludes defect packing four, but neither supplies a uniform bound nor proves stable-remainder strictness. The corrected cover bound after deleting all six spokes uses those six spokes AND one restored base edge; six spokes alone miss abc. No unrestricted iteration of descent has been established.

No computation, Lean build, or external catalogue reproduction was performed by this reviewer. All terminal operations were remote source reads, note writes, and hashes; literature was inspected through web tools.

## Additional primary novelty checks (10:42 UTC)

The two supplied thesis URLs
- https://dspacemainprd01.lib.uwaterloo.ca/server/api/core/bitstreams/4f61131c-d4e7-4730-a70f-8e33ebfdc74d/content
- https://www.collectionscanada.gc.ca/obj/thesescanada/vol2/OWTU/TC-OWTU-10497.pdf
currently expose the same 127-page primary thesis: Michael Szestopalow, *Matchings and Covers in Hypergraphs*, University of Waterloo, 2016. Search titles say *Packing and Covering Small Cliques*, but the PDF title page governs identification. Targeted inspection of Section 5.4 and Corollary 5.4.6 shows that its low-degeneracy results concern packing and covering copies of K4, not triangles: eight-degenerate graphs satisfy tau_K4 <= 5 nu_K4. The triangle-equality discussion in the introduction cites the planar Cui--Haxell--Ma theorem. No four-degenerate triangle equality classification was located there. The thesis also gives a different proof of the exact HNS tripartite equality theorem, and explicitly leaves near-equality generalization as future motivation; this is not a supplied slack-one theorem.

Juan Gutierrez, *Transversals of graphs*, Sao Paulo thesis, 2019:
https://teses.usp.br/teses/disponiveis/45/45134/tde-10012020-200714/publico/Tese_JuanGabrielGutierrezAlva.pdf
Targeted inspection of the triangle introduction, Chapter 5 remarks, and Section 6.2 found a general request to characterize equality (Problem 6.40), but not the proposed exact K4/K5 global characterization or its four-degenerate restriction. Its Tuza inequality result for partial six-trees does not imply equality classification or apply to all four-degenerate graphs. These checks help delimit prior art; they do not certify novelty.

## Failure of a direct extension to a complete five-vertex link

Consider a minimum S failure with a vertex whose link is K5; its closed local graph is K6. A maximum local four-packing leaves a perfect matching: every local vertex has degree five, and the four triangles use twelve edges with even used degrees, forcing each used degree to be four. Two packing triangles contain the distinguished vertex and two lie in the rim, so the packing uses eight of the ten rim edges. The two unused rim edges are disjoint and each leaves an uncovered distinguished-vertex triangle. Therefore the naive singleton reduction needs ten cover edges versus an eight-edge packing budget. This is a concrete reason that the four-degenerate theorem cannot simply be relabeled five-degenerate.

Deleting all local K6 edges to K gives only nu(K) in {h-5,h-4} and tau(K) between 2h-10 and 2h-8. Residual equality is not forced. In the equality subcase nu(K)=h-4, tau(K)=2h-8, block compatibility would exclude every external rim page: K6 with one rim removed still has a four-packing, and one external page extends it while each residual block sees at most one old edge. With no external page, the six-edge local cover gives a strict global cover. The residual slack-one and slack-two subcases remain a genuine obstacle. No five-degenerate equality theorem is asserted by this route.

## Fresh review of consolidated equality proof (10:48 UTC)

Reviewed EQUALITY_THEOREMS.md at SHA256 b5d8e127a7a9277a050fc9a8fb5bffc47bb24c58340eb92d3fc9b6aba877eadd, including the strengthened Theorem B: five-degenerate graphs with no K6-minus-one-edge as an ordinary subgraph have Tuza and precisely K4/K5 equality components. The heredity condition is correct for ordinary subgraph exclusion, and would not be interchangeable with induced-subgraph exclusion.

The additional link K4 on a,b,c,d with x adjacent exactly to a,b has the valid matching M={cd,ax}, vertex set Q={a,b}, and three-packing acd,vax,vbd. Residual forbidden edges are ac,ad,bd; deleted cd excludes ac with either other edge, leaving only the adjacent pair ad,bd. This proves the needed extra exclusion. A non-3-colorable five-vertex link has a K4, because every K4-free graph on five vertices is 3-colorable. Its fifth vertex has degree at least two. Degree two is the just-checked case; degree three or four creates a forbidden K6-minus-edge subgraph with the center. The resulting class induction is sound.

All earlier proof steps in the consolidated note were checked against the independent derivations above: tight-critical reduction, no own-edge, four small-link types, eight three-colorable five-link types, K221 external-page pairing, and old-edge-only restoration transfer. No mathematical gap was identified in this review. This is independent agent review, not external human review, formal verification, or a novelty certificate. No solver or enumeration was run by this reviewer; the root's local finite checks are separately documented.

A further short consequence, not needed as a separate headline, is equality classification for maximum degree at most five. A class-minimal failure would be five-regular; its five-vertex links must be K5 or K5-minus-edge after the completed exclusions. A K5 link gives a saturated K6 component, which is strict. A K5-minus-edge link gives K6-minus-ab locally: its four other vertices are already saturated at degree five, so any outside edge at a or b cannot lie in a triangle. This contradicts the absence of triangle-free edges in a minimal failure. Thus no such failure exists. This consequence was sent to the equality route for review; it is not needed by Theorems A or B.
