# Fresh-context adversarial review of TUZA-18 global gates

Initial review completed 14 November 2026, 17:50 UTC. All work was local on the Mac, except read-only inspection of the public primary reference through the web tool. Mathematical work must stop at 21:00:10 UTC on this date. This is an independent ordinary mathematical review, not Lean verification or external human peer review.

## Context and exact inputs

The reviewer started without the discovery conversation. The initial task supplied only the two frozen proof paths, expected hashes, the campaign stopping rule, and a provenance correction. Before reading other campaign mathematics, I read the canonical `AGENTS.md`, migration handoff, migration report, and these two proofs. The requested reviewer model/effort is `gpt-6-astra / ultra`; I record the request without asserting an independently inspected runtime model identity. The proof titles and status labels were not treated as evidence of correctness.

Both exact input hashes were checked at initial inspection and again by the independent audit at 17:47:52 UTC:

| Input | SHA-256 |
|---|---|
| `notes/global_finite_incidence_gate.md` | `7ec106efb669f729e89d312b174be339474db93b1292945f56e01fec55ab8ac6` |
| `notes/global_cut_gate.md` | `83893dd6658e738ef91fb60ac2b5ed733160ec1a74b13732df40e72734b7486c` |

Byte-for-byte input snapshots were saved as `SCRATCH_OUTPUT/tuza18_critic_input_global_finite_incidence_gate.md` and `SCRATCH_OUTPUT/tuza18_critic_input_global_cut_gate.md`. The canonical-directory write attempt timed out in automatic permission review, without an unsafe-action rejection; this report and its script/receipt are therefore initially staged in local temporary storage for the parent to transfer into the authorized private workspace.

## Verdict on the two frozen proofs

**No mathematical error found. Both asserted obstruction theorems survive independent reconstruction and the finite attacks below.** Their conclusions have the stated restricted scope. Neither proves unrestricted Tuza, refutes Tuza, establishes historical originality, nor identifies a genuine minimal Tuza counterexample. The publication/download provenance label should be clarified as described below; it is not a mathematical dependency.

## Independent reconstruction: finite incidence restrictions

Fix an integer q >= 1 and 0 < epsilon < 1. It is enough to construct a finite simple 3-uniform hypergraph with arbitrarily small independence fraction, while eliminating all Berge cycles of length at most q. These are compatible requirements because the expected number of bounded cycles is sublinear at the chosen edge density, whereas the absence of a fixed positive-density independent set has exponentially small failure probability.

### Why a Berge forest is a full triangle system

Replace each incidence-tree component by a recursively built graph. A root hypervertex is one graph edge. At a hyperedge reached through its parent hypervertex, the remaining two hypervertices are new because the bipartite incidence graph is a tree. If the parent edge is ab, add a new vertex w and the two new edges aw and bw.

The invariant needs two statements, not merely the existence of the intended triangles. First, represented graph edges are in bijection with processed hypervertices: the two new edges have a fresh endpoint and cannot coincide with previous edges or each other. Second, actual graph triangles are in bijection with processed hyperedges. No triangle on old vertices can appear, since no edge between old vertices is added. Any triangle newly appearing at this step must contain w, and w currently has exactly the two old neighbors a,b. Therefore its only possible triangle is abw, which exists. Subsequent steps obey the same argument, so no previously unaccounted triangle can arise later. Equivalently, any final triangle can be assigned to its last-created vertex, and that vertex's two older neighbors force its intended parent triangle.

Separate components use disjoint graph vertex sets; isolated hypervertices become isolated edges. The empty hypergraph has an edgeless realization. Thus this is a realization as the **full** triangle hypergraph, including all graph edges as hypervertices, rather than a selected-triangle subsystem. It does not require a consistent realization shared by different induced restrictions.

### Random construction, with quantifiers and strict inequalities checked

Set g=max(q,2), a=1/(2g), rho=epsilon/12, and p=N^(-2+a). For each fixed length l in [2,g], an ordered description of a Berge cycle chooses l distinct cyclic hypervertices and a third vertex for each triple. There are at most N^(2l) descriptions. Invalid descriptions may be discarded. For every retained description the l hyperedges are distinct, so its occurrence probability is exactly p^l. Consequently the number X of short cycles satisfies E[X] <= sum N^(a*l) <= g*sqrt(N). Counting the same cycle repeatedly only enlarges this upper bound. Length two is included and removes pairs of triples sharing two vertices.

With k=floor(rho*N), the union bound over k-sets gives P(alpha(J)>=k) <= exp(N*log(2)-p*binom(k,3)). The floor is harmless once N is sufficiently large. For an explicit sufficient estimate, take rho*N>=6. Then k-2>=rho*N/2 and binom(k,3)>=(rho*N)^3/48. If N^a >= 96*log(2)/rho^3, the last probability is at most 2^(-N). Independently, N>=64*g^2 makes P(X>N/2)<=1/4. Choosing an integer N satisfying these finite bounds and N>=2 makes the two bad-event probabilities sum to less than one. Thus the existential assertion is justified for every fixed q and epsilon; it does not rely on independence of the two bad events.

Select one vertex from each original short cycle and remove their union. At most X<=N/2 vertices are removed, and every remaining short cycle would have been one of the original cycles, a contradiction. Crucially, the remainder is an **induced** hypergraph. Therefore every independent set in the remainder was independent in J, so its independence number cannot increase. Writing its order as n gives n>=N/2 and alpha(H)<rho*N<=2*rho*n.

The complement identity tau(H)=n-alpha(H), together with nu(H)<=n/3, yields tau(H)>(1-2*rho)*n >= (3-epsilon/2)*nu(H). Since alpha(H)<n, H has an edge and nu(H)>0. The last expression is strictly greater than (3-epsilon)*nu(H). All coefficients used to multiply inequalities are positive.

For |U|<=q, a Berge cycle in H[U] would use at most |U| distinct hypervertices and hence have prohibited length at most g. Thus H[U] is an incidence forest and the graph construction applies. This independently recovers the exact theorem, including q=1 and q=2.

### Exact no-go implication and its boundary

For a finite forbidden family F of induced 3-uniform hypergraph patterns, take q at least the largest pattern order (and at least one). If a constructed H contained a forbidden induced pattern on U, its full graph realization on U would contradict the premise that the pattern is absent from every full triangle hypergraph. Choosing any epsilon<1 gives tau(H)>2*nu(H), so the proposed enlarged-class inequality is false. The finite-list route would imply Tuza if its inequality were true; the obstruction attacks that sufficient inequality, not Tuza.

The same local realization also excludes any fixed finite family forbidden under ordinary subhypergraph containment: a putative copy is contained in the full realization of H[U], even if that realization has additional hyperedges. Therefore the elementary proof is sufficient for either explicitly stated containment convention.

This argument concerns finite fixed hypergraph incidence patterns, invariant under hypervertex relabeling. It does not cover an infinite list, globally consistent pair labels, graph-vertex geometry, a formula quantifying unbounded information, criticality assumptions, or operations that retain graph realizability. In particular, the phrase “local proof impossible” would overstate the result. The frozen note avoids that overclaim.

## Independent reconstruction: the packing-controlled cut mechanism

The proposed GC statement is: for every finite simple G, some **maximum** triangle packing P and some two-coloring of vertices produce the specified edge set C(P,s) with |C|<=2|P|. A maximum packing is maximal, so every graph triangle intersects B=E(P). This proves the construction is a cover: a monochromatic triangle meets a selected noncrossing B edge; a nonmonochromatic triangle has exactly one noncrossing edge, selected by the appropriate rule according to whether it is in B. These are all possibilities for an actual graph triangle.

Take a triangle-free rim H with even order n, a perfect matching, and alpha(H)<n/6, and add a universal apex z. A triangle avoiding z would be a rim triangle, which is impossible. A triangle containing z is exactly zxy for one rim edge xy. Two such triangles are edge-disjoint exactly when their rim edges have no common endpoint. Thus triangle packings correspond bijectively to rim matchings, the packing number is n/2, and **every** maximum packing corresponds to a perfect matching M. Consequently B contains all n spokes and precisely the matching rim edges.

Complementing the cut does not change selected edges, so fix the apex side and let S be the opposite-side rim vertices. Spokes to S cross and are excluded; the n-|S| other spokes are selected. A rim edge inside S is selected, either because it is a noncrossing matching edge or because its apex triangle has two crossing spokes. A rim edge inside the apex-side complement is selected exactly when it is a matching edge: its apex triangle is monochromatic and there are no rim triangles that could trigger the second rule. Crossing rim edges are never selected. These cases exhaust all graph edges and all actual triangle triggers.

Hence |C|=n-|S|+e_H(S)+e_M(V(H)\\S). If c is the number of matching edges crossing the rim cut, perfect matching identities give |S|=2e_M(S)+c and n/2=e_M(S)+e_M(V(H)\\S)+c. Subtracting yields e_M(V(H)\\S)=n/2-|S|+e_M(S), establishing the alternative formula |C|=3n/2-2|S|+e_H(S)+e_M(S).

For any graph J, alpha(J)>=(2|V(J)|-|E(J)|)/3. Here is the induction reconstructed with its direction checked. If a vertex has degree d>=2, deleting it changes the numerator to 2|V|-|E|+d-2, and an independent set of the deletion is still independent in J. If all degrees are at most one, each edge component contributes alpha=1 and numerator/3=1, and each isolated vertex contributes 1>=2/3. The empty graph satisfies the base case.

Apply the bound to H[S]: 2|S|-e_H(S)<=3alpha(H[S])<=3alpha(H). Since e_M(S)>=0, the formula implies |C|>=3n/2-3alpha(H)>n=2nu(G), simultaneously for all S and all perfect matchings M. There is no interchange of existential and universal quantifiers: every maximum packing has the required perfect-matching form, and the lower bound does not depend on which matching was chosen. Meanwhile all n spokes form an immediate within-budget cover. This is a counterexample to the specified cover mechanism, with a graph satisfying Tuza, not a graph counterexample to Tuza.

### Existence of the rim and linear margin

For N divisible by 20 and p=N^(-2/3), a random graph has expected triangle count binom(N,3)*p^3<N/6. Markov bounds the probability of more than N/4 triangles by 2/3. For k=N/10 the probability of an independent k-set is at most exp(N*log(2)-p*binom(k,2)), tending to zero because the negative term has order N^(4/3). For large N the sum of failure probabilities is less than one. No assumption of independence between the two events is needed.

Deleting one chosen vertex from each original triangle removes at most N/4 vertices and creates no new triangle. The induced remainder B has at least 3N/4 vertices and alpha(B)<N/10. Hence alpha(B)/|B|<2/15. In B Cartesian-product K2, each layer is triangle-free and cross-layer edges form a matching. A triangle cannot have exactly one cross-layer edge, while two such edges would have to share a vertex, impossible for a matching. Thus the product is triangle-free, and its vertical edges give a perfect matching. Any independent set meets each layer in at most alpha(B), so alpha(H)<=2alpha(B), n=2|B|, and alpha(H)/n<2/15<1/6.

Substitution gives |C|>3n/2-3*(2n/15)=11n/10 for every packing/cut pair. Disjoint copies preserve the strict independence ratio and perfect matching, giving an unbounded family. No explicit huge rim edge list is needed for this finite existence proof, and the note does not pretend to supply one.

## Strongest attacks considered

1. **Extra actual triangles in forest realizations:** blocked by the fresh-vertex invariant; full triangle sets were also enumerated independently.
2. **Repeated-edge cycle descriptions invalidating p^l:** the proof expressly restricts to distinct hyperedges, including length-two cycles.
3. **Deleting cycles increasing independence number:** vertex deletion is induced, so the crucial inequality has the correct direction.
4. **Floor effects or missing positive matching:** explicit large-N bounds handle the floor, and alpha(H)<n supplies an edge.
5. **Changing maximum packing to defeat the cone calculation:** every maximum is a perfect matching and covers all spokes; the estimate is uniform in the matching.
6. **Unlisted triangles triggering selected rim edges:** triangle-freeness eliminates rim triangles and the apex enumeration is complete.
7. **Opposite sign in the graph independence lemma:** deletion changes the numerator by d-2>=0, so the induction is valid.
8. **Using a selected-triangle subsystem as a full graph system:** this issue is real in the pair-shadow example but is not used by the elementary proof.
9. **Confusing a route obstruction with Tuza or criticality:** the example has an immediate within-budget cover; the frozen claims preserve this distinction.

## Finite evidence and limits

The independent script `critic_exact_gate_checks.py` has SHA-256 `34fafa1a06d41d1a1f1935eb74aeb66c9a136ef348302b9a3d05bbb899ca0d83`. It ran under the pinned native Python 3.12.12 and completed at 17:47:54 UTC with **PASS**. Initial staged paths are `SCRATCH_OUTPUT/tuza18_critic_exact_gate_checks.py` and `SCRATCH_OUTPUT/tuza18_critic_exact_gate_checks.json`.

- Exhausted every labeled incidence forest on at most seven hypervertices: 1,313 forests among 7,453 candidate triple families. Full graph triangles exactly matched intended hyperedges. Also checked an 81-hypervertex fan and an 81-hypervertex chain.
- Checked alpha(J)>=(2|V|-|E|)/3 on all 33,868 labeled simple graphs of order at most six using exact independent-set enumeration.
- Checked all maximum-packing/cut choices on every labeled simple graph of order at most five: 23,150 cover cases after quotienting cut complementation.
- Checked every perfect matching and every apex-fixed cut for all triangle-free even-order rims of order at most six with a perfect matching: 2,760 rims, 4,268 perfect matchings, 272,021 formula/cover cases. Actual cone triangles were enumerated from vertex triples, independently of the cone formula.
- Checked the three-face K4 example: six pair vertices, three selected faces, four actual shadow triangles.

The finite checks catch formula, edge-case, and actual-triangle mistakes. They do not establish either asymptotic existence theorem or produce a finite rim with independence ratio below 1/6. The ordinary arguments above carry those unbounded claims.

## Primary reference and provenance

I independently inspected the [ECCC primary PDF](https://eccc.weizmann.ac.il/report/2020/167/download/) through the web tool. Its introductory Theorem 3 states the finite forbidden ordinary-subhypergraph result and includes the fractional gap. The [arXiv record](https://arxiv.org/abs/2008.07344) confirms title and authors. The frozen note's separation between ordinary and induced containment is appropriate. No local PDF download or PDF digest was established by this review. The parent reports that the earlier direct download failed with `ConnectionResetError`; the frozen note's download/provenance label should not imply a successful saved PDF. The elementary proof reviewed here is independent of that reference.

## Required disposition

Accept the two exact frozen mathematical arguments as surviving this ordinary adversarial review, with the stated scopes and limitations. Clarify provenance in a separately hashed revision or erratum; retain these original bytes and hashes. Do not label this as Lean verification, novelty clearance, unrestricted Tuza progress beyond a route obstruction, or evidence about genuine minimal counterexamples.

Additional apex-minimum and criticality notes were assigned only after this first review; any later appendix must identify them as separate inputs and must not retroactively claim they were part of the initial fresh-context audit.

## Follow-up review: separately received inputs

The following inputs were received after the original two-proof review was saved. This continuation has access to their discovery summaries, so only the **initial** two-proof review has the no-discovery-context qualification. I still reconstructed the follow-up arguments independently and used a separately written checker. No external theorem or the candidate author's checker implementation was used to establish the explicit certificates.

| Follow-up input | SHA-256 reviewed |
|---|---|
| `notes/apex_minimum_restriction.md` | `a4f3419d5acd52ae32751ff00a5c27869150ee6b8971be80dcba470ff4b0b2a5` |
| `evidence/apex_witness_verified.json` | `f01204b5c93d3535b94fca9dcc0011073c843ff01c74e42b52b69286cfd03c80` |
| `notes/criticality_control_proofs.md` | `faf8f2c8cbb79cd0064b40a7f69c3194856009520587bd6c55e01a4c97326bf3` |
| `notes/apex_pruned_critique.md` | `5b739fc1662ea1bf38ebf4f67de1e0315ed940b5fa0df36d2aab71fe025542fe` |
| `notes/criticality_global_gate.md` | `1ee462019061e6857a7cb63d1c8e90e453795478d5ae1cbc04d5afaccc0b6a44` |
| `notes/criticality_extension_gate.md` | `309482042c1fbc0f617ee13e535f7d76e5d5ea7c631752936705431dd9afb5ad` |

Snapshots of all six inputs are staged at `SCRATCH_OUTPUT/tuza18_critic_input_` followed by the corresponding basename. **No mathematical error found in these six inputs.** Two small wording improvements and the significant scope boundary for the pruned-cut obstruction are recorded below.

### Seven-vertex apex witness and the exact penalty replacement

Enumerating graph vertex triples from the thirteen listed edges produces exactly 016, 046, 125, 156, 235, 356, 456. Removing apex 1 leaves four triangles. The triangles 046 and 235 are edge-disjoint, so any two-edge old cover must choose one edge from each. Among the six edges in their union, only 35 lies in triangle 356. Thus 35 is forced. To cover both 046 and 456 with the remaining edge, that edge must be 46. This proves uniqueness of the old minimum cover directly, without relying on the recorded solver result.

The note's uniqueness sentence mentions 36 as an inadmissible alternative but omits 56, which is also outside the first two triangles. This does not invalidate the argument under the preceding two-edge restriction, but the intersection argument just given is a clearer exhaustive justification. Recommended wording: “The only edge of 356 in E(046) union E(235) is 35.”

The induced link on {0,2,5,6} is the path 0-6-5-2 and is untouched by {35,46}. Its vertex cover number is two, by a two-edge matching lower bound and an explicit two-vertex cover. The old optimum plus this link cost is four. Meanwhile {06,25,56} hits all seven actual triangles and 016,125,356 are pairwise edge-disjoint. Hence tau(G)=nu(G)=3 exactly. The proposed old coloring is proper: none of the nine old edges has both endpoints in {0,5}, {2,6}, or {3,4}. The induced link is bipartite. This is an exact counterexample to the claimed identity using only old minimum covers; it is not a failure of the separate UAC inequality, whose two sides here are 4 and 6.

For k copies identified only at their apices, every edge belongs to one copy and every triangle lies in one copy. For triangles through the common apex this follows because the other two vertices must be joined, and no cross-copy rim edges were added. Vertex sharing does not obstruct an **edge-disjoint** packing. Covers and packings therefore add, producing tau=nu=3k. The old graph is a disjoint union of k copies with unique old minimum cover, and its link is k disjoint P4s. The restricted quantity is 4k. The additive loss k and ratio 4/3 are exact.

For the corrected profile, fix a spoke set indexed by S subset X. Every remaining apex triangle forces its rim edge, so the mandatory old edge set is F_S=E(L[X minus S]). An old cover containing F has optimum |F|+tau(H-F): the old triangles not already met by F are exactly the actual triangles surviving graph-edge deletion of F. Thus delta(F)=|F|+tau(H-F)-tau(H) is nonnegative and tau(G)-tau(H)=min_S(|S|+delta(F_S)). Further, delta(F_S)=0 exactly when some old minimum cover contains every forced edge. This gives the stated zero-penalty characterization of lambda_min. The independent checker evaluated all sixteen S and obtained minimum total value one but minimum zero-penalty |S| two, including delta(E(L))=1. Nothing in this identity bounds the minimum in a hypothetical genuine critical graph; its final critical-graph equation remains bookkeeping.

### Deterministic obstruction to a single global pruned cut

Let A be linear and 4-uniform with no Berge triangle. In its K4 block graph, each graph edge has a unique block. An actual triangle with two edges in one block has all three vertices there, forcing its third edge into the same block. Otherwise its three distinct edge blocks and its three vertices give a Berge triangle. Therefore there are no additional graph triangles. Every packing takes at most one face per K4 and can take one from each, giving nu=b. Every cover needs two edges in every edge-disjoint block, and opposite pairs attain tau=2b. A maximum packing has exactly one face in each block.

The pruned selection must be analyzed for each packed face, not just one convenient packing. In a monochromatic K4 it selects exactly that packed face; its three edges are separately needed for the three triangles through the omitted vertex. In a 3+1 split it selects exactly the majority-side triangle; each edge is the unique selected edge of a triangle through the minority vertex. In a 2+2 split it selects exactly two opposite internal edges, both needed. This proves exact local retained costs 3,3,2 for every packed face. The independent script exhausted all 4*16=64 face/cut cases and every permitted subset of selected packed edges, obtaining 24 cost-two and 40 cost-three cases. Because block edge sets and actual triangle sets are disjoint, these costs add and give 2b plus the number of unbalanced blocks.

For the incidence lift, each base edge is a bijection between its two fibers. Therefore a simple lifted 4- or 6-cycle cannot project to an immediate base-edge reversal. A closed cyclically nonbacktracking walk of either length in a simple bipartite graph must be a simple cycle: any repeated vertex splits the short even length into closed even subwalks, one necessarily of length two, giving a reversal. The projected edges are consequently distinct. The signed voltage sum cannot vanish over the integers because its largest distinct power of two exceeds the sum of all smaller ones, and its magnitude is less than the modulus 2^20+1. It cannot vanish modulo that modulus either. Thus the lift has no 4- or 6-cycle, its right neighborhoods are distinct linear four-sets, and there is no Berge triangle.

There are b=5(2^20+1) vertices and blocks, with every vertex in four blocks. If every block were split 2+2, counting red incidences would give 4r=2b, impossible because b is odd. Hence every maximum packing and every **single global vertex cut** has pruned cost at least 2b+1. The checker enumerated all 30 simple base 4-cycles and all 130 simple base 6-cycles under lexicographic voltage assignment; all sums were nonzero modulo 1048577. The large lifted graph was not generated, and no such execution is claimed. The ordinary proof supplies its full triangle classification and exact parameters.

**Material scope boundary discovered by the parent:** every K4 block is a separate shared-edge triangle component. Blocks can share graph vertices, but their triangles never share graph edges across blocks. If the architecture allows an independent cut on each such component, each K4 can be split 2+2 independently, removing the obstruction. A candidate restricted to graphs with one nonempty shared-edge triangle component, followed by componentwise application, would still imply Tuza by additivity of edge covers and edge-disjoint packings. Vertex colors need not agree across components when assembling the resulting edge covers. Therefore this example refutes the exact global-cut PC and PC-all statements in the reviewed hash; it does **not** refute that repaired componentwise candidate. A final report must retain this boundary rather than presenting all pruned-cut methods as eliminated.

The compact q=31 supplement was subsequently reported by its author, but was not part of this frozen proof audit or the present voltage check. No independent compact-certificate claim is made here.

### Explicit criticality controls

For K5, three packed triangles would use nine edges and leave one. All K5 degrees and all degrees of a triangle union are even, so the residual cannot be a single edge. Two edge-disjoint triangles exist, giving nu=2. A balanced 2+3 partition supplies a four-edge cover, and the triangle-free five-vertex bound of six edges supplies the reverse inequality. That bound can itself be derived from the triangle-free inequality d(u)+d(v)<=5 on every edge and Cauchy-Schwarz, so no external structural classification is needed. The two deleted-edge types and displayed packings correctly prove all two-edge deletion stability. In the text, “two disjoint triangles” should read “two edge-disjoint triangles,” since the example shares vertex 0.

For two K5s sharing one edge, there are no cross-block actual triangles. The cover lower bound is 4+4-1=7, and compatible local covers containing the shared edge attain it. Packing upper bounds add to four. The detailed deletion argument correctly chooses the other block's packing to avoid the common edge whenever necessary; arbitrary local packings would not have sufficed. The supplied compatibility repair covers both-deletions-in-one-block, one-in-each, and deletion-of-the-common-edge cases. The independent checker confirms all 171 two-edge deletion cases and that every edge belongs to a minimum seven-cover, giving the stated edge-cover-criticality. This graph has tau=7<8=2nu and is not a genuine critical violation.

For K2 join C5, the fifteen actual triangles have exactly the two stated types. A cover containing the hub edge requires five more edges because each remaining edge meets at most two of the ten rim-plus-hub triangles. A cover avoiding the hub edge and using at most five edges would choose exactly one spoke at each rim vertex; covering both hub triangles on every rim edge then gives an impossible proper two-coloring of C5. Thus tau=6. Both displayed six-covers are valid and contain representatives of the two triangle orbits, proving Q. The four displayed packed triangles are edge-disjoint. A five-packing would leave one edge in an even-degree graph, impossible. Deleting rim edges 01 and 23 forces any hypothetical four-packing residual to be a matching on {0,1,2,3}, but the induced residual graph there has only edge 12. The supplied three-packing survives, so the reduced packing number is exactly three. Q alone consequently does not supply two-edge packing resilience or minimum triangle codegree three.

In Fano-minus-line, every two remaining triples intersect, every remaining triple is a transversal, and any pair of points misses at least two of the original seven lines and hence at least one retained line. Thus nu=1 and tau=3. The same counting proves resilience under any two-point deletion. The graph nonrealizability argument is sound: after graph triangles abc and abd share ab, a triangle meeting both without ab must be acd or bcd; once it exists, every pairwise edge-intersecting triangle is a K4 face. A family with no common edge therefore has at most four members. The six retained Fano triples have no common point, excluding graph-triangle realization. This remains an abstract hypergraph control, never a graph counterexample.

### Criticality does not repair finite incidence abstraction

The reviewed high-girth theorem with epsilon=1/2 supplies a violating finite hypergraph. Choose an induced violating subhypergraph K of minimum order. The local full-triangle realizations are inherited, because an induced restriction of K is the corresponding induced restriction of the original hypergraph. Hypervertex deletion removes whole incident triples rather than shortening them, matching edge deletion in an actual triangle hypergraph.

Let k=nu(K). Deleting one hypervertex can lose at most one from either tau or nu. If nu(K-x)<=k-1, minimality and adding x to a residual cover give tau(K)<=2k-1, a contradiction. Thus nu(K-x)=k and the integer inequalities force tau(K)=2k+1 and tau(K-x)=2k. For nonempty S, adding all S to a residual cover gives tau(K-S)>=2k+1-|S|, while minimality gives tau(K-S)<=2nu(K-S). Hence k-nu(K-S)<=floor((|S|-1)/2). All stated one- and two-deletion resilience conclusions follow, with the empty-S exception correctly excluded.

For a prescribed p-edge hypergraph matching with p=1 or 2, deleting its 3p hypervertices loses at least p from the packing number by the append-packing argument and at most floor((3p-1)/2)=p by the preceding inequality. Therefore it extends to a maximum. For p=1, the residual cover number is forced to 2k-2; for p=2 it lies in the two stated integer values, with negative values excluded. For T={x,y,z}, deleting all three lowers tau by exactly three; since each single deletion lowers it by at most one, every intermediate deletion in the chain lowers it by one. This proves the listed J, J-y, J-z, and J-{y,z} identities. Any maximum J-packing avoiding y,z could be augmented by T, so the blocking assertion is valid.

An isolated hypervertex or multiple incidence components would give a smaller violation or an additive contradiction. A degree-one hypervertex in T would become isolated after deleting the other two members of T; any packing then could be augmented by T, contradicting two-deletion resilience. Finally a residual optimum cover after deleting T, together with T itself, is a minimum transversal containing T, giving Q. Thus every member of the **listed generic incidence/arithmetic package** holds in these genuine hypergraph-minimal violations. No graph endpoint representation follows from that package.

The finite-forbidden-pattern contradiction therefore remains unavailable even after adjoining this exact package. This is a valid combination of the previously reviewed existence theorem with elementary minimality deductions. It does not refute graph-vertex link arguments, globally consistent endpoints, stronger graph-specific criticality, or any unspecified additional conditions. The historical package attribution and historical originality were not independently established by this review; the mathematical deductions needed here were rederived directly.

### Bounded prescribed-packing extension control

Write the rim as K_(n,n) minus a perfect matching and add q independent universal apices. Every actual triangle has exactly one apex and one rim edge, since the two bipartition classes and the apex set are individually independent. At each apex a triangle packing selects a rim matching; across apices those matchings must have disjoint rim edges. Each contributes at most n, and the q distinct nonzero cyclic shifts are disjoint perfect matchings when n>=q+1. Thus nu=qn. Spokes to one fixed rim side give a cover of size qn, proving tau=nu. Rim edge codegree is q and spoke codegree n-1. The rim is connected for n>=3; at one apex the triangle adjacency follows its connected line graph, and different apices connect through a common rim edge. Hence there is exactly one nonempty shared-edge triangle component.

Given at most b prescribed triangles, complete their q rim matchings in order. At stage i, removing the endpoints of its own prescriptions leaves equal side sizes r>=n-b>=2q. Forbidden edges are the omitted perfect matching, i-1 earlier completed matchings, and q-i later prescribed matchings, so forbidden maximum degree is at most q. Earlier completions avoided later prescriptions, maintaining compatibility. Residual minimum degree is at least r-q>=r/2. For any nonempty left set of size at most r/2, one vertex already has at least r/2 neighbors; for a larger set, every right vertex must meet it because it cannot fit r/2 neighbors in the smaller complement. These two cases establish Hall's condition. Completing each stage yields a maximum qn-packing containing all prescriptions.

A matching of size n-1 at a single apex can leave precisely one omitted rim pair unmatched; it cannot be completed at that apex. A maximum qn-packing would require n triangles at every apex, so this prescription does not extend. Its size exceeds b by the chosen n bound, consistent with the positive extension assertion. All maximum packings use every spoke, so deleting a single spoke lowers the packing number. Therefore these graphs do not satisfy actual minimal-violation criticality.

The final genuine-critical three-packing state is also correct: deleting its nine support edges can reduce nu by at most four. Nonextension rules out loss exactly three, while appending the prescribed three rules out smaller losses, so the loss is exactly four. Minimality and the cover deletion inequality then force residual tau=2nu and cover loss nine. This state itself contains the equation tau(G)=2nu(G)+1, so it cannot be treated as an independently available relaxed graph example. The construction refutes an upgrade from any fixed extension bound and fixed codegree threshold to all-size extension; it does not refute an upgrade retaining genuine criticality.

### Follow-up evidence and unresolved statements

The new independent checker is staged at `SCRATCH_OUTPUT/tuza18_critic_followup_checks.py`, SHA-256 `2e8cf75d17a069b0cde333109a539cb4003853572c5a0d04cbc6cdb5ffe365f5`. Its receipt `SCRATCH_OUTPUT/tuza18_critic_followup_checks.json` records **PASS**, completed at 17:59:11 UTC. It reconstructs the literal apex witness and all sixteen penalty choices; checks every K4 packed-face/cut/pruning choice; enumerates all 160 base cycles of lengths four and six; and verifies the explicit K5, glued-K5, K2-join-C5, and Fano-minus-line controls by exact subset calculations. The two unbounded criticality gates were reviewed by the ordinary proofs above, not established through finite testing.

The generic criticality identities are rederived source-level facts, not claimed new theorems of this campaign. The displayed controls and combined obstruction statements are validated current artifacts; this review supplies no historical novelty judgment. UAC, the componentwise/single-triangle-component pruned-cut repair, any all-size packing-extension conclusion retaining genuine criticality, and unrestricted Tuza remain unresolved by these inputs. The current proofs provide exact negative controls and delimit sufficient mechanisms; no observed finite survival was promoted to a general claim.

## Later compact-certificate supplement, completed 18:18 UTC

This later check adds the previously excluded q=31 certificate to the reviewed evidence. Its frozen input hashes are:

- `evidence/apex_pruned_voltage.json`: `5d98cda5a96c663ec7545e07ea175b3b6e08531dd2c7598d57cfa41da5624bee`.
- `evidence/apex_pruned_graph.json`: `1e0889243feb72248177184d1a4e7a129bad95f11a4e36482ea88266faba2039`.
- `evidence/apex_pruned_verified.json`: `9ab398f90407d910c8b25af8952df445e7a4e9fe00471c7c64d05684a39ee543`.

The independent script `SCRATCH_OUTPUT/tuza18_critic_compact_pruned_check.py`, SHA-256 `b2425592853598791f35f73f8e3c947e79d9827f5a795009c80524a7432f87c8`, reconstructed every lifted block directly from the literal twenty-voltage table. It checked distinct four-element blocks, regularity four, pairwise intersections of size at most one, and equality between the listed graph edges and all block edges. It then enumerated all possible graph vertex triples from the literal edge list: exactly 620 actual triangles occurred, exactly the K4 block faces. The explicit 155-triangle packing is edge-disjoint, and the 310-edge cover hits every actual triangle. Together with the proved block upper/lower bounds this certifies nu=155 and tau=310. The literal local table contains every one of the 64 packed-face/cut pairs exactly once and agrees with the independently checked costs.

The parity argument consequently gives PC cost at least 311 for every single global cut and every maximum packing. This is a proof using the checked finite graph plus the reviewed universal local-cost/parity argument; it does not enumerate all 2^155 vertex cuts. The independent component calculation finds exactly 155 shared-edge triangle components, each with six graph edges. Thus the compact witness has the same componentwise-cut limitation as the deterministic large witness. The receipt `SCRATCH_OUTPUT/tuza18_critic_compact_pruned_check.json` records PASS, completed at 18:18:13 UTC. Input snapshots use the same `SCRATCH_OUTPUT/tuza18_critic_input_` naming convention.

## Connected pruned-cut obstruction: later review completed 18:30 UTC

**The earlier unresolved status of the single-triangle-component PC repair is superseded by this additional proof.** The new exact input is `notes/criticality_connected_pc.md`, SHA-256 `aa6793e8674c1c01e447f966de04c34768e97d8d63659688eb17743608c1e63c`. Its snapshot is `SCRATCH_OUTPUT/tuza18_critic_input_criticality_connected_pc.md`. I independently reconstructed the entire argument and found **no mathematical error**. Unlike the first block witness, this construction does defeat the precisely stated connected repair. It still does not address an architecture restricted to actual minimal Tuza violations.

### Robust incidence existence, including all probability constants

For every fixed coloring of N vertices, exactly binom(r,2)binom(N-r,2) four-sets are balanced. The bound by N^2(N-2)^2/64 follows from r(N-r)<=N^2/4 and (r-1)(N-r-1)<= (N-2)^2/4; the r=0,N cases are separately zero. Dividing by binom(N,4) gives the stated ratio. The inequality at most one half is precisely N^2-10N+12>=0 and holds for every integer N>=9. Thus at least half the possible four-sets are bad for every coloring, uniformly over all class sizes.

With independently selected four-sets and mu=p*binom(N,4), each coloring's bad-edge count is binomial of mean mu_s>=mu/2. Exponential Markov applied to 2^(-X) gives Pr(X<=mu_s/2)<=exp(-(1-log(2))*mu_s/2)<=exp(-mu_s/8). The threshold mu/4 is no larger than mu_s/2, so each coloring has failure probability at most exp(-mu/16). The union bound over all 2^N colorings is valid without any independence between different colorings. Because p=N^(-11/4), mu grows as N^(5/4)/24 and that union bound tends to zero.

For a Berge cycle of length two or three, l cyclic vertices and two additional vertices per hyperedge give at most N^(3l) descriptions. The distinct-hyperedge restriction is essential and present. The expected number of short cycles is therefore at most N^(1/2)+N^(3/4), and exceeding N cycles has probability at most N^(-1/2)+N^(-1/4). The two desired events hold simultaneously with positive probability for large N. Deleting one edge per original short cycle removes at most N edges, eliminates all such cycles, and can lower the bad-edge count of any coloring by at most N. This edge deletion is appropriate here: the invariant is robust bad-edge count, unlike the independence-number argument in the earlier theorem. No independence-number monotonicity is invoked.

The uniform strict lower bound on every coloring survives deletion as chi(A')>mu/4-N. Taking mu>10N yields chi(A')>3N/2. The invariant is additive across incidence components, including isolated vertices, because their color choices are independent. Consequently some nonempty component has chi(A)>3|V(A)|/2. Selecting that component preserves linearity and absence of Berge triangles and guarantees that every retained vertex belongs to a block.

As an additional exact check of the asymptotic quantifiers, one may take N=2^40. Then p=2^(-110), and binom(N,4)>=N^4/48 gives mu/N>=64/3>10. Since log(2)<3/4, the all-color failure bound is less than exp(-7N/12)<1/4. The cycle failure bound is exactly bounded by 2^(-20)+2^(-10)=1025/1048576<1/4. Hence the simultaneous good event has probability greater than one half at this finite parameter. These are integer/rational inequalities, not a sampled huge hypergraph. The independent checker verified them exactly.

### All actual triangles and the connectedness repair

Linearity makes the K4 block edge sets disjoint, and the no-Berge-triangle argument again ensures every old graph triangle belongs to one block. Incidence-connectedness makes the old graph H vertex-connected. Adding one universal apex a creates exactly one new triangle axy per old edge xy; every graph triangle is either an old block face or one of these apex triangles. Thus old-edge triangle codegree is exactly three. A spoke ax has codegree deg_H(x)=3deg_A(x)>=3, using linearity to ensure distinct neighbors from different incident blocks.

The apex triangles corresponding to adjacent H edges share a spoke, so all apex triangles lie in one shared-edge triangle component because H is connected. Every old face shares an edge with an apex triangle. Hence the full graph has one nonempty shared-edge triangle component. This is the precise point missing from the original block witness; it is genuinely supplied here.

### Uniform packing and retained-cover bounds

Every packing contains at most one old face per block and at most floor(n/2) apex triangles, since the apex spokes force their bases to be a matching. Therefore 2nu(G)<=2b+n. Fix any maximum packing, and mark blocks containing bases of its packed apex triangles. At most n/2 blocks are marked. An unmarked block must contain exactly one old packed face: if it contained none, none of its rim edges would be used, so any old face could be appended. This uses maximality of the maximum packing and does not select a favorable optimum.

Every retained cover needs at least two old edges per K4 block. In an unmarked unbalanced block it needs at least three. For a 3+1 cut, each majority-side edge is the only noncrossing edge of a distinct old face and is forced. For a monochromatic block on the apex's side, only the packed face's three rim edges are selected, and each is needed by a face through the omitted vertex. For a monochromatic block opposite the apex, all six rim edges are selected by apex triangles, but the three outside the packed face are outside packing support and cannot be pruned. They already force the desired lower bound; in fact a fourth rim edge is needed to cover the packed face itself. Packed spokes elsewhere do not alter selection or support membership of these rim edges.

The checker independently enumerated all 128 packed-face/five-vertex-cut combinations in a K4 plus universal apex, permitting every allowed retained subset of the selected packed rim edges and requiring coverage of all four old faces. The exact local minima were two in 48 states, three in 72 states, and four in eight states. In particular every unbalanced state has the required cost at least three; adding the apex does not silently preserve an incorrect equality from the earlier lemma.

At least chi(A) blocks are unbalanced, and at most n/2 of them can be marked. Since old block edge sets are disjoint, every acceptable retained cover therefore has size at least 2b+chi(A)-n/2>2b+n>=2nu(G). Discarding all spoke costs only weakens this lower bound. The argument is uniform in the maximum packing, the cut, and the permitted pruning. It refutes both existential PC and PC-all on graphs with one triangle component and minimum triangle codegree at least three.

### Independent positive Tuza certificate and attribution

Choose an inclusion-maximal rim matching M using at most one edge per block, and let U be its endpoints. In every used block choose a face avoiding its M edge; elsewhere choose any face. These b faces avoid all m matching edges, and the m corresponding apex triangles use disjoint spokes, giving a packing of size b+m.

For a used block choose the opposite edge pair containing its M edge; for an unused block choose any opposite pair. These 2b edges cover every old face. Add the 2m spokes to U. An uncovered apex triangle would have a base disjoint from U. If its block were unused, its base could be appended to M, contradicting maximality. In a used block its base would have to be the edge opposite the selected M edge, already in the cover. Thus the 2b+2m chosen edges cover all actual triangles, proving tau(G)<=2b+2m<=2nu(G). This construction is separate from the refuted cut architecture and shows why no Tuza counterexample has been produced.

I read the attributed frozen source directly with read-only `git show` at commit `d4029fbafc3dffc250b50ed237ad81c3206cd1a0`, path `problems/TUZA-07/notes/CONSTRUCTIVE_AND_STAR_THEOREMS.md`. Its SHA-256 is exactly `124e50e3f564316b88e2cf5048fcd206f61d1c8230d8f0798891ed1bb7dafe41`. The source contains the one-apex theorem and this matching/cover argument; the new proof is its correct K4-only specialization. Its stated acceptance is historical internal AI review, not Lean or external human verification. A local source snapshot is `SCRATCH_OUTPUT/tuza18_critic_source_constructive_and_star.md`.

### Evidence and disposition

`SCRATCH_OUTPUT/tuza18_critic_connected_pc_checks.py` has SHA-256 `b58902435d8741fb4dfd5e8218b0fe9bab3a89158c3773961004cf89b94a6e49`. Its receipt `SCRATCH_OUTPUT/tuza18_critic_connected_pc_checks.json` records PASS at 18:30:33 UTC. Besides the 128 apex-local cases and exact N=2^40 probability bounds, it checks the finite four-set count inequality in all 8,340 class-size cases for 9<=N<=128. This finite count audit supplements, rather than replaces, the algebraic proof for every N>=9.

Accept the exact connected-obstruction draft as surviving this independent ordinary review. Its robust-incidence existence proof is probabilistic and no huge graph was sampled or stored. The theorem concerns the precise cut selection and packed-edge-only pruning rules. It does not exclude an architecture that can add unselected edges, change those pruning rules, or prove a further theorem using actual criticality and its global availability. UAC, such stronger criticality-based repairs, and unrestricted Tuza remain unresolved. The earlier componentwise escape remains a correct limitation of the original block witness, while this later construction separately defeats that escape.
