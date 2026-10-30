> Public derivative of a historical mathematical route audit. Operational details are omitted; original-input and public-file identities are separate in SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# TUZA-05 independent opening proof audit

Audit author: the separately delegated opening proof critic, an AI agent. This is independent reconstruction within the mission, not an external human review or historical novelty certificate. No numerical computation, solver, graph generator, or Lean check was run by this reviewer. The root agent is reproducing finite checks separately.

## Sources actually read

The full final `baseline-tuza04/EQUALITY_THEOREMS.md`, SHA-256 `b5d8e127a7a9277a050fc9a8fb5bffc47bb24c58340eb92d3fc9b6aba877eadd`, was independently reconstructed, including the hereditary-class induction, every local link case, the exceptional K2,2,1 interface, the theorem conclusions, and the restricted restoration transfer.

Also read in full: `DISCOVERY_REPORT.md` (`19d975e762b20ea6186e44d311ca8aa681807ab19d0f6321c3aa115bb9c02197`), `SOURCE_RECORD.md` (`a09ce25926362d7d15c249eba0fa43b5c15cd97d4224231c879bb20354c5306a`), `SHA256SUMS`, and `REVIEW_EQUALITY_FRESH.md` (`c5e4250d037b1d6f103b0d33ff66cec9718c64f791a2559982abed7769a3b5ba`). Read the first 120 lines of `LITERATURE_ROUTE.md` and first 70 lines of `BOUNDARY_ROUTE.md` for provenance, limitations, and the relation to the secondary route. An attempted combined full read of those two long notes was truncated, so this audit does not claim full new reconstruction of their later sections or of their private TUZA-03 inputs.

The public baseline revision recorded by the source record is `97e913008e466de14f61437d8dae774946d92e8f`. Root separately verified the frozen manifest and copied checkpoint. A file hash proves identity, not mathematical correctness. No unavailable draft is treated as inspected.

## Assessment

No material defect was found in Theorem A (4-degenerate S), Theorem B (5-degenerate and excluding K6 minus an edge as an ordinary subgraph), or the stated restricted local restoration consequence. Here S means both Tuza's inequality and the K4/K5 classification of triangle components at equality. The audit is an ordinary proof review. It supplies no Lean verification or unbounded computational certificate. The full 5-degenerate theorem remains outside these accepted hypotheses.

### 1. The minimum-counterexample induction is not circular

Take a minimum-edge failure of S within the stated hereditary class. Every proper edge-subgraph has both the inequality and the equality classification. Edge-degeneracy inheritance and ordinary-subgraph exclusion are preserved by the needed deletions. Triangle-free edges and all but one triangle component can be removed, using additivity of both optima on components joined under shared edges.

An essential edge would give a cover of size at most 2h-1, contradicting failure. If a proper edge deletion retained equality at packing h, its clique components permit avoiding a selected restoring wedge: no residual clique can contain both endpoints of the absent edge, so each sees at most one wedge edge. Appending the restoring triangle raises the packing. Therefore the minimum failure satisfies tau=2h and every edge deletion has nu=h and tau=2h-1. This reasoning does not assert the same conclusion for arbitrary tight-critical graphs or assume global S before proving the restricted theorem.

### 2. Clique compatibility is an edge statement

K4 has a face avoiding any prescribed star. K5 has a two-triangle packing avoiding any two prescribed edges: representatives for adjacent forbidden edges 12,13 are 145,234, and for disjoint forbidden edges 12,34 are 135,245. Minimum covers of either clique can be chosen to contain a prescribed edge.

No step needs the false assertion that K5 can preserve a maximum packing while avoiding every independent vertex set. In the whole-neighborhood deletion case, independence of local vertices merely bounds each residual clique's forbidden edge footprint.

### 3. No edge has triangle codegree one

For uv unique to uvw, delete uw,vw. The remaining uv is triangle-free and residual equality is forced by the two-edge cover budget and the appended triangle. Every residual clique meets {u,v,w} at most once. If the lost family is intersecting without a common edge, its K4-face form would produce a second triangle on uv, a contradiction. A common edge gives a cover saving. Otherwise two disjoint lost triangles can be appended after choosing residual block packings that avoid their old edges. K4 uses a star avoidance; K5 sees at most two edges. This proves link minimum degree at least two.

### 4. All small-link arguments include arbitrary outside attachments

The deletion removes spokes only to one chosen link component, not necessarily all spokes at the vertex. A lost triangle on one of those spokes cannot reach a different link component. Thus triangles outside the local vertex set are handled exactly by the rim-page cases; no unstated bounded-neighbor-degree condition enters.

For link K3, the residual forbidden set from abx and vbc is {bc,ax,bx}; a clique sees at most the adjacent pair {bc,bx}. For link K4, the set {ac,bd,ax,bx} has only the allowed adjacent pairs {ac,ax} or {bd,bx}. The absent ab rules out cross pairs. This rules out outside rim pages and isolates the corresponding K4 or K5 triangle component.

For the diamond, the set {ad,bc,ax,cx} has only pairs {ad,ax} or {bc,cx}, since ac is absent. Once external pages are excluded on the four relevant rim edges, the cover {vc,vd,cd} saves one edge. For C4, the retained rim bc has a surviving triangle by the codegree condition, permitting a minimum residual cover containing bc and saving one edge.

### 5. Five-vertex link list and footprints

A five-vertex link of minimum degree two has complement of maximum degree two. The three-colorable possibilities are exactly the eight listed complements. This can be checked as the finite path/cycle decomposition of the complement; the proof is not conditional on the finite classification script.

I independently checked the forbidden-edge footprints in the four dense table rows. In the K2,3-plus-rim-edge row no forbidden pair can lie in one clique. For K5 minus ab,bc,cd, the only possible pair is {ae,ad}; for K5 minus ab,bc,cd,de none; for K2,3 plus its two-vertex-side edge, only {pq,cq}. All permitted pairs are adjacent. The bowtie has a strict cover budget. In K2,3 and C5 the codegree condition produces an external rim page, with only the respective allowed pairs {ad,ax} and {bc,bx}. Thus each displayed augmentation survives arbitrary residual attachments.

For the non-three-colorable link consisting of K4 plus a degree-two fifth vertex, {ac,ad,bd} has only the allowed adjacent pair {ad,bd}. This is the final local case outside K5 and K5 minus an edge.

### 6. Exceptional K2,2,1 link

Deleting all 13 edges of B=K6 minus the disjoint edges ab,cd forces residual equality. The four explicit B triangles give the packing budget and the eight rim edges give the cover budget. All six local vertices are independent in the residual graph.

The four symmetry representatives in the proof give a three-packing after every good rim-pair deletion. Their orbit sizes total 24; the four excluded pairs are unique partners. The proof needs existence for these 24 pairs only, not an exact upper bound for the four exceptional pairs.

The external-family lemma is valid for unrestricted numbers and incidences of external pages. Choose two disjoint pages on an exceptional pair. Any third base has to meet both chosen pages, since otherwise it forms a good disjoint pair. Different apices make this impossible. With the same apex, the disjoint bases must be ac,bd up to symmetry; only ad,bc can support a third page. Such a page forces all pages at the same apex, and the two spokes ax,bx cover them. If there is no third base, the first two bases cover. Thus absence of a good disjoint pair implies a cover of at most two edges. The local four-edge cover then contradicts the forced global cover budget. A good pair gives two external pages and three local triangles; each residual clique sees at most two old spokes at its unique local vertex. This establishes the augmentation without constraining external vertex degrees or assuming pairwise disjoint outside apices.

### 7. The theorem deductions and restoration scope

Minimum degree at least five rules out a failure in a 4-degenerate class. In the K6-minus-edge-free 5-degenerate class, a degree-five vertex exists. Its link cannot be any excluded three-colorable link or K4 with fifth vertex of degree two. A fifth vertex with three or four K4 neighbors produces K6 minus an edge as an ordinary, possibly noninduced, subgraph. This is the claimed contradiction.

The restricted restoration transfer only permits deletions of old edges. At a vertex outside the restored triangle with at most one terminal neighbor, every local triangle and every local edge used by these reductions is old. The full triangle-hypergraph rainbow labeling colors that link with three colors. The final source explicitly discards isolated vertices; the earlier fresh review's isolate wording issue has therefore been fixed in the reviewed final hash. No unrestricted terminal deletion, OCT-five conclusion, or full equality restoration theorem follows.

## Provenance and novelty limits

The prior fresh review was read as a comparison, not used as a proof. Its agreement is not additional mathematical evidence beyond the deductions reconstructed above. The primary literature cited by the frozen notes distinguishes inequality reducibility from equality-aware induction and distinguishes bounded maximum degree from degeneracy. This audit does not independently certify priority or recheck every cited paper. No stronger theorem should be inferred from finite local enumeration or from conditional Lean deductions elsewhere in the archive.

## Specific next mechanism

Attack the two residual degree-five links K5 and K5 minus an edge by deleting the entire closed-neighborhood edge set. This cleanly separates local packing from external rim pages and leaves the six local vertices independent. The main obstruction is that the residual graph may have deficit one or two from equality, so K4/K5 block packings are unavailable. A justified first subproblem is to eliminate the equality residual and characterize an essential-edge descendant of a deficit-one residual, while explicitly controlling the possible three-edge forbidden footprint in a K5 block. The third forbidden edge cannot simply be ignored: deleting a three-edge star from K5 leaves packing number one. No claim that the resulting remainder has tripartite full triangle hypergraph is justified.
