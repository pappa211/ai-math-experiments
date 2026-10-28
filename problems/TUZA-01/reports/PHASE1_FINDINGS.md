# Phase 1 findings (sanitized mathematical extract)

Historical research snapshot, 27 October 2026 UTC. This retains sections 1–4 of the original report, with navigation adjusted and operational/governance material omitted. The original is preserved privately; its hash and selection are in the source provenance manifest. Phase 1 predates the conditional Lean proof. Validation corrected the small-packing boundary below to **nu ≤ n^(2/3)**, including equality; the manuscript uses the corrected exhaustive split. Version observations are historical. No external specialist review or novelty certification is implied.

## 1. Verified mathematical frontier

Throughout, graphs are finite, simple and undirected. A packing consists of **edge-disjoint** triangles; a cover consists of graph **edges**. The odd-cycle transversal deletes **vertices**.

| Source and verified version | Relevant statement | Role and limits |
|---|---|---|
| Liu–Zeng, *Tuza's Conjecture under an Edge-Count Condition*, [2610.15539v1](https://arxiv.org/html/2610.15539v1), 11 October 2026 | Lemma 2.7 proves OCT at most three; Theorem 1.3 proves the density result for fixed \(c<2\). | The exact statements and the proof's dependence on \(c\) were checked. It is a preprint. |
| Wang, *A Bound Below 2.8 for Tuza's Conjecture*, [2609.13831v1](https://arxiv.org/html/2609.13831v1), 12 September 2026 | Theorem 1 gives \(\tau\leq(165/59)\nu\). | Current universal improvement located. The paper reports Lean formalization; that build was not audited here. |
| Huang et al., *Épi*, [2610.24944v1](https://arxiv.org/html/2610.24944v1), 18 October 2026 | Theorem 1 covers split graphs with an eight-vertex clique and at most three triangle-active neighborhood types, with arbitrary multiplicities. | Already claimed prior work. It was not pursued as novel. Its certificate computation was not rerun. |
| Szestopalow, *Matchings and Covers in Hypergraphs*, [2016 thesis](https://dspacemainprd01.lib.uwaterloo.ca/server/api/core/bitstreams/4f61131c-d4e7-4730-a70f-8e33ebfdc74d/content) | Theorem 4.1.5, printed p. 73: \(\tau\leq(28/15)\nu\) for **every** tripartite graph. | No density hypothesis. The later dense-graph improvement must not be confused with this unrestricted theorem. |
| Aharoni, *Ryser's conjecture for tripartite 3-graphs*, Combinatorica 21 (2001), 1–4, [DOI](https://doi.org/10.1007/s004930170001) | A 3-partite, 3-uniform hypergraph satisfies \(\tau\leq2\nu\). | Published input; also stated and referenced in the HNS source below. |
| Haxell–Narins–Szabó, *Extremal hypergraphs for Ryser's conjecture*, JCTA 158 (2018), 492–547, [author manuscript](https://page.mi.fu-berlin.de/szabo/PDF/ryser.pdf), [DOI](https://doi.org/10.1016/j.jcta.2018.04.004) | Theorem 1.1 characterizes equality \(\tau=2\nu\) as the home-base hypergraphs. | The decisive published structural input. Earlier structural preprint: [1401.0171v3](https://arxiv.org/html/1401.0171v3), 20 June 2016. |

The three requested 2026 arXiv records all displayed **v1 as their latest version** during this investigation. The general Tuza conjecture remains open according to the sources checked. Four-colorable graphs are a known class, attributed by Liu–Zeng to Aparna Lakshmanan–Bujtás–Tuza; they also follow from Aharoni through the coloring construction below.

Other relevant boundaries include Puleo's published result for maximum average degree strictly below seven ([2015 article](https://doi.org/10.1016/j.ejc.2015.03.006)), results for treewidth at most six, and Amrit Kandasamy's recent maximum-degree-ten preprint ([2610.15269v1](https://arxiv.org/abs/2610.15269)). The last uses computational reductions, which were not independently rerun. These degree restrictions do not imply the OCT theorem, whose graphs can have arbitrarily large degree. Literature on fractional packing, random graphs, and dense decompositions provides useful context but is not required for the new proof.

Searches for the four-vertex statement, triangle deletion followed by four-colorability, and the graphical consequences of home-base structure found no matching prior result. This is a qualified novelty finding, not an exhaustive bibliographic certification. In particular, no unverified assertion that all graphs with \(\nu\leq4\), or all \(K_4\)-free graphs, satisfy Tuza was used.

## 2. Complete proof of the main finding

### 2.1 Translating to a hypergraph

For a graph \(J\), define \(\mathcal D(J)\) to have vertex set \(E(J)\) and one hyperedge consisting of the three edges of each triangle. Then

\[
\nu(\mathcal D(J))=\nu(J),\qquad
\tau(\mathcal D(J))=\tau(J).
\]

The hypergraph is linear: two distinct hyperedges intersect in at most one vertex. It is 3-partite precisely when the graph edges can receive three labels such that every triangle has all three labels. This is not a proper graph edge-coloring requirement at other pairs of incident edges.

Every four-colorable graph has such a labeling. Identify its vertex colors with \(\mathbb F_2^2\), and label an edge by the nonzero sum of its endpoint colors. The three sums around a triangle are distinct. Thus Aharoni's theorem gives \(\tau(J)\leq2\nu(J)\) for every four-colorable \(J\).

### 2.2 The equality consequence actually needed

**Lemma A.** If \(\mathcal D(J)\) is 3-partite and \(\tau(J)=2\nu(J)=2h\), then \(J\) contains \(h\) pairwise edge-disjoint copies of \(K_4\).

**Published input.** HNS's home-base description supplies \(h\) vertex-disjoint loose 3-cycles in an equality hypergraph. A loose 3-cycle consists of three hyperedges whose pairwise intersections are three distinct singleton vertices. This consequence follows directly from the construction accompanying Theorem 1.1; in the formal definition, the three auxiliary matchings select disjoint cycles, and each truncated-Fano piece contains one such cycle.

**Graphical deduction.** Three graph triangles with three distinct pairwise common edges use exactly the six edges of a \(K_4\). Indeed, write the first two as \(uvx\) and \(uvy\). The third shares with each an edge other than \(uv\). Its two shared edges must meet, so it is \(uxy\) or \(vxy\). All six edges on \(u,v,x,y\) are present. Hypergraph vertex-disjointness is graph edge-disjointness. Applying this to the \(h\) loose cycles proves Lemma A. The case \(h=0\) is immediate. \(\square\)

Notice a useful interpretation: **in such an equality graph, a maximum triangle packing can avoid any prescribed independent set of graph vertices.** Each of the \(h\) copies of \(K_4\) contains at most one vertex of that independent set, so choose its opposite face.

The stronger statement that all triangles of \(J\) split into \(K_4\) components also follows, but is unnecessary. For completeness, HNS's remaining possible pieces have three central hypervertices \(r_1,r_2,r_3\), with a hyperedge through every pair completed by a vertex of the leftover set \(W\). Viewed as graph edges, the \(r_i\) must form a triangle or a three-edge star. The triangle alternative has its unique completion inside the central triple, not in \(W\), and is impossible. In the star alternative, the three completion edges in \(W\) form the leaf triangle. A hyperedge entirely in \(W\) is prohibited by the home-base definition. Thus only truncated-Fano pieces remain, which are exactly the four faces of edge-disjoint \(K_4\)'s. These copies may share graph vertices.

### 2.3 A small triangle-family lemma

**Lemma B.** Any nonempty family \(\mathcal F\) of pairwise edge-intersecting graph triangles has a cover of at most two graph edges. The family need not contain all triangles of its ambient graph.

**Proof.** One member needs only one edge. Otherwise choose two distinct members \(abc\) and \(abd\). Any member avoiding \(ab\) must share an edge with both. Its only possibilities are \(acd\) and \(bcd\): the other choices of shared edges have four endpoints. If no member avoids \(ab\), use \(ab\). If one does, the edge \(cd\) exists and \(\{ab,cd\}\) covers the whole family. \(\square\)

### 2.4 Triangle-deletion theorem

**Theorem.** Suppose \(T=abc\) is a triangle of \(G\) and \(\mathcal D(H)\) is 3-partite for \(H=G-E(T)\). Then \(\tau(G)\leq2\nu(G)\).

**Proof.** Set \(h=\nu(H)\). A maximum packing in \(H\), together with \(T\), shows \(\nu(G)\geq h+1\). Aharoni gives \(\tau(H)\leq2h\).

If \(\tau(H)<2h\), integrality gives

\[
\tau(G)\leq\tau(H)+3\leq2h+2\leq2\nu(G).
\]

It remains to treat \(\tau(H)=2h\). Lemma A supplies \(h\) edge-disjoint copies of \(K_4\) in \(H\). The set \(U=\{a,b,c\}\) is independent in \(H\), so select from each copy a face avoiding \(U\). These faces form a packing \(\mathcal P\) of size \(h\), all of whose edges have both endpoints outside \(U\).

Let \(\mathcal F\) be the triangles of \(G\) absent from \(H\), and let \(r=\nu(\mathcal F)\). Every member of \(\mathcal F\) contains an edge of \(T\), hence has at least two vertices in \(U\). Consequently **every edge of every member of \(\mathcal F\) touches \(U\)**. The fixed packing \(\mathcal P\) is therefore disjoint from every member of \(\mathcal F\), simultaneously, and

\[
\nu(G)\geq h+r.
\]

The family contains \(T\), so \(r\geq1\). Its cover number is at most three, using \(E(T)\). If \(r\geq2\), this is at most \(2r\). If \(r=1\), Lemma B gives the same bound. Finally, a cover of \(H\) and a cover of \(\mathcal F\) together cover all triangles of \(G\), so

\[
\tau(G)\leq\tau(H)+\tau(\mathcal F)
\leq2h+2r\leq2\nu(G).
\]

This includes \(h=0\), when \(\mathcal P\) is empty. \(\square\)

### 2.5 Four-vertex bipartite deletion

Take \(S\subseteq V(G)\), \(|S|\leq4\), with \(G-S\) bipartite. If \(G[S]\) is bipartite, color \(S\) with two colors and \(G-S\) with two other colors; the known four-colorable inequality settles the claim.

Otherwise \(G[S]\) has an odd cycle. On at most four vertices this must be a triangle \(T\). After deleting \(E(T)\), the only possible remaining edges inside \(S\) join its possible fourth vertex to \(V(T)\). They form a subgraph of a star. Thus both \((G-E(T))[S]\) and \((G-E(T))-S\) are bipartite, and \(G-E(T)\) is four-colorable. The triangle-deletion theorem applies. \(\square\)

This treats the triangle with an isolated fourth vertex, paw, diamond, \(K_4\), every bipartite four-vertex configuration, and smaller transversals in one argument.

## 3. Other approaches explored and preliminary deductions checked

### Tripartite slack and finite obstructions

Put \(H_0=G-E(G[S])\), \(m=e(G[S])\), \(h_0=\nu(H_0)\), and \(k=\nu(G)\). The parts \(S,X,Y\) make \(H_0\) tripartite. If \(G[S]\) contains a triangle, then

\[
\tau(G)\leq m+\left\lfloor\frac{28h_0}{15}\right\rfloor,
\qquad k\geq h_0+1.
\]

The positive tripartite slack genuinely yields finite packing thresholds. If \(k=h_0+1\), the only unresolved ranges from this inequality are:

| Core configuration | \(m\) | Remaining \(h_0\) range |
|---|---:|---:|
| Triangle plus isolated vertex | 3 | Only \(h_0=0\), handled by Lemma B |
| Paw | 4 | \(h_0\leq7\) |
| Diamond | 5 | \(h_0\leq15\) |
| \(K_4\) | 6 | \(h_0\leq22\) |

If \(k\geq h_0+3\), the inequality already suffices for every \(m\leq6\). If \(k=h_0+2\), only the diamond with \(h_0=0\), or \(K_4\) with \(h_0\leq7\), remains. Thus this route alone bounds the packing number of a hypothetical target counterexample by **23**, rather than the cruder 44 obtained by forgetting the internal triangle's packing contribution.

For a counterexample minimal under edge and vertex deletion in a class closed under both operations, every edge lies in a triangle, every vertex is nonisolated, deleting an edge leaves \(\nu\) unchanged, and \(\tau=2\nu+1\). The OCT-at-most-four class has this closure property. Every edge then has at most \(2\nu\) common neighbors: otherwise a maximum packing avoiding that edge leaves an unused page of its triangle book, increasing the packing. If \(k=\nu\), the vertices of a maximum packing number at most \(3k\). Every other vertex completes a packed edge to a triangle. Each of the \(3k\) packed edges has at most \(2k-1\) such outside completions, since its own packed triangle already supplies an inside completion. Hence

\[
|V(G)|\leq3k+3k(2k-1)=6k^2.
\]

Combined with \(k\leq23\), this gives the rigorous but impractical bound \(n\leq3174\). Bounded packing does not by itself justify small enumeration. These preliminary deductions are valid; the symbolic proof makes this search unnecessary.

### Exact masks and colored matchings

An independent approach produced an exact finite-domain cover formulation. Let \(D\subseteq E(G[S])\) cover all core triangles, let \(J=G[S]-D\), and for each outside vertex choose an independent mask \(I_v\subseteq N_S(v)\) in \(J\). Then

\[
\tau(G)=\min\left[
|D|+\sum_{v\notin S}(|N_S(v)|-|I_v|)
+\sum_{xy\in E(X,Y)}\mathbf1[I_x\cap I_y\ne\varnothing]
\right].
\]

The masks record surviving spokes; the final term deletes exactly the surviving outside edges that still complete a triangle. This proves both directions of the equivalence by considering triangles with three, two, or one vertices in \(S\). There are at most sixteen possible masks per outside vertex, but the interaction graph \(G[X,Y]\) is unbounded. Therefore this is **not** a finite kernel or an integrality theorem.

The corresponding packing formulation selects compatible triangles using core edges first. Remaining triangles correspond to a maximum-size partial proper edge-coloring of the bipartite graph \(G[X,Y]\) with colors in \(S\), where color \(s\) at \(xy\) consumes the available spokes \(sx,sy\). This is a useful exact alternative formulation, retained in the retained limitations note; it was superseded by the equality proof.

### Obstructions to tempting shortcuts

Three-partiteness of a triangle hypergraph does not imply integral matching/cover duality. In \(K_4\), \(\nu=1\), \(\tau=2\), and the fractional packing number is 2. Thus replacing the required integral packing by a fractional optimum does not close the argument.

Nor can an arbitrary maximum packing of the old graph simply be joined to new triangles. For example, take an old \(K_4\) on \(a,d,e,f\), add the old edge \(bd\), and then add \(T=abc\). The old maximum packing \(\{ade\}\) intersects the new triangle \(abd\); the face \(def\) avoids all new triangles. The equality theorem supplies the **choice** required by the proof.

Finally, the strong equality classification needs the full triangle hypergraph. The family consisting of only three faces of a \(K_4\) is a loose 3-cycle with \(\tau=2\nu\); it is not the full four-face component. Lemma B was deliberately proved for arbitrary subfamilies, while Lemma A is applied to the full triangle hypergraph.

## 4. Density consequence: verified adaptation

**Deduction from the new OCT theorem and Liu–Zeng's proof:** for every fixed real \(c<5/2\), all sufficiently large \(n\)-vertex graphs satisfying \(e(G)\geq n^2/4-cn\) obey Tuza's inequality. Values \(c<0\) follow by monotonicity from \(c=0\); assume \(0\leq c<5/2\).

The adaptation checks every place where Liu–Zeng use the bound on \(c\):

1. Their large-packing case, \(\nu\geq10^{-5}n^2\), does not use \(c\); it is unchanged.
2. In the intermediate case \(n^{2/3}<\nu<10^{-5}n^2\), replace \(cn\leq2n\) by \(cn\leq3n\). Their displayed estimate becomes

   \[
   \frac{\tau-\nu}{\nu}
   \leq120\sqrt3\,n^{-1/6}
   +120\sqrt{3\cdot10^{-5}}
   +7200n^{-2/3}+7200\cdot10^{-5}<1
   \]

   for sufficiently large \(n\). The two constant terms sum to approximately 0.729267. Their initial density requirement also still holds because \(3n+3\cdot10^{-5}n^2\leq10^{-4}n^2\) eventually.
3. In the small-packing case, \(cn+3\nu\leq5n\) still holds eventually, so their constants \(5n,10n,100,10200\) remain valid. Their reduced graph \(G'\) has a set \(S_1\cup S_2\) whose deletion leaves a bipartite graph, and the final estimate is

   \[
   \left(\frac{|S_1|+|S_2|}{2}-c\right)n\leq O(n^{2/3}).
   \]

   Since \(5/2-c>0\) is fixed, this excludes \(|S_1|+|S_2|\geq5\) for sufficiently large \(n\). Apply the new four-vertex theorem to \(G'\). The paper's reduction then gives \(\tau(G)\leq\nu(G)-\nu(G')+\tau(G')\leq2\nu(G)\).

This is an audited modification of an external proof, not a new proof of all its analytic and decomposition lemmas. It gives the strict range \(c<5/2\), **not** the endpoint \(c=5/2\).
