# Triangle Restoration and Packing–Covering Stability in Tuza’s Conjecture

AI Math Experiments · 29 October 2026

[PDF](main.pdf) · [Canonical LaTeX](main.tex) · [BibTeX](references.bib) · [Scope and provenance](README.md)

## Abstract

For a finite simple graph $`G`$, let $`\nu(G)`$ be the maximum number of edge-disjoint triangles and $`\tau(G)`$ the minimum size of a triangle edge cover. We integrate triangle-restoration criteria and packing–covering stability results. Restoring one triangle to a remainder with tripartite full triangle hypergraph preserves Tuza’s inequality; consequently the inequality holds for odd-cycle transversal at most four and, by an adaptation of Liu–Zeng, for sufficiently large graphs with $`e(G)\ge n^2/4-cn`$ for every fixed $`c\lt 5/2`$. For two restored triangles we give complete proofs for exact-equality and essential-edge tripartite remainders, flat remainders, three specified nonflat star cores, and exact two-apex bowties with shared apices or mixed triangles. We prove closed-boundary deletion and stability criteria and a compression preserving four exact optimization values. Selected deductions are conditionally checked in Lean with their external mathematical inputs explicit; the remaining results have audited ordinary proofs. Unrestricted two-triangle restoration, OCT-five, and the fixed-$`c\lt 3`$ density extension remain unproved.

## 1. Introduction and contribution

Tuza’s conjecture asks whether $`\tau(G)\le2\nu(G)`$ for every finite simple graph $`G`$ \[[14](#reference-14)\]. The central mechanism here is a simultaneous compatibility argument: equality structure supplies a fixed old packing avoiding an entire family of newly restored triangles. Subsequent arguments study the rigidity left when this simple mechanism no longer applies.

This paper follows those dependencies rather than the order of the TUZA-01, TUZA-02 and TUZA-03 investigations. The one-triangle criterion and its OCT and density consequences are retained with their complete proofs. The subsequent restoration and boundary deductions are integrated with their exact accepted hypotheses; selected supporting star-core results are included explicitly. Published inputs are attributed at their point of use. The verification boundary and open questions are collected in Section [15](#sec-verification).

The ordinary arguments use published mathematical theorems. Conditional Lean verification certifies specified deductions while retaining explicit Aharoni, graphical HNS and, where applicable, classical bipartite König inputs. In particular the inherited graphical HNS conversion is not independently discharged in Lean. Neither external specialist peer review nor established historical originality is claimed.

## 2. Definitions and the one-triangle criterion

All graphs are finite, simple, and undirected. A triangle is a three-vertex clique, identified with its three edges when discussing packing and covering. For a triangle family $`\mathcal F`$, let $`\nu(\mathcal F)`$ be the maximum number of pairwise edge-disjoint members, and let $`\tau(\mathcal F)`$ be the minimum number of graph edges meeting every member. Both parameters are zero for the empty family. Write $`\nu(G),\tau(G)`$ for the full triangle family. The odd-cycle transversal number $`\mathrm{oct}(G)`$ is the minimum number of *vertices* whose deletion leaves a bipartite graph.

The triangle hypergraph $`\mathcal D(G)`$ has vertex set $`E(G)`$ and a hyperedge for the edge set of every triangle. Its matching and vertex-cover numbers are $`\nu(G)`$ and $`\tau(G)`$. It is linear: distinct triangles share at most one edge. It is 3-partite precisely when the graph edges can be labeled with three labels so that every triangle receives all three. Labels on other incident edges need not differ. This condition is often called triangle-3-colorability and is broader than ordinary four-colorability.

**Theorem 2.1 (Triangle-deletion criterion).**

<a name="thm-main"></a>

Let $`T`$ be a triangle of $`G`$ and put $`H=G-E(T)`$, retaining all vertices. If $`\mathcal D(H)`$ is 3-partite, then $`\tau(G)\le2\nu(G)`$.

Tuza’s inequality for triangle-3-colorable graphs, including four-colorable graphs, is known from Lakshmanan–Bujtás–Tuza \[[3](#reference-3)\] and follows from Aharoni’s theorem \[[1](#reference-1)\]. The new deduction considered here is the addition of the three edges of a triangle to such a remainder. Merely adding these three edges to a cover loses one unit in the critical case. Equality structure repairs that loss. We use only the specific consequence of Haxell–Narins–Szabó (HNS) \[[9](#reference-9)\] proved below, rather than a classification of all graphical equality cases.

There are antecedents for $`K_4`$ equality arguments in planar graphs \[[5](#reference-5)\] and for fractional triangle covers \[[8](#reference-8)\]. The latter concerns $`\tau^*`$, and integer equality $`\tau=2\nu`$ cannot simply be substituted for fractional equality. The elementary intersecting-family lemma below is also known \[[2](#reference-2)\]. No novelty is claimed for these inputs. Liu–Zeng’s preprint \[[12](#reference-12)\] proves the odd-cycle-transversal-three case and the fixed-deficit density range $`c\lt 2`$; our corollaries concern four vertices and $`c\lt 5/2`$, respectively.

## 3. Equality structure and compatible packings

<a name="sec-equality"></a>

**Aharoni’s bound.** Every finite 3-partite 3-uniform hypergraph $`\mathcal H`$ satisfies $`\tau(\mathcal H)\le2\nu(\mathcal H)`$ \[[1](#reference-1)\]. An accessible formulation and derivation also appear in HNS, Section 3, Proposition 3.2(iii) and the following paragraph (author-manuscript p. 9). Thus $`\mathcal D(J)`$ 3-partite implies $`\tau(J)\le2\nu(J)`$.

**HNS’s equality characterization.** HNS Theorem 1.1 characterizes 3-partite 3-uniform hypergraphs with $`\tau=2\nu`$ as home-base hypergraphs \[[9](#reference-9)\]. We use the 18 March 2018 author manuscript: Definitions 7.1–7.4, pp. 19–20, and Proposition 7.5, p. 21. The earlier arXiv version has different numbering. HNS permits parallel hyperedges; simple hypergraphs are included.

Here are exactly the features of a home-base partition needed for extraction. The partition is denoted $`(\mathcal A,\mathcal R,W)`$: the disjoint pieces in $`\mathcal A`$, the disjoint triples in $`\mathcal R`$, and $`W`$ partition the hypervertices, and $`|\mathcal A|+|\mathcal R|=\nu(\mathcal H)`$. Each $`\mathcal A`$-piece is a truncated multi-Fano configuration on six vertices, containing four distinct underlying triples, any three of which form a loose 3-cycle. For a triple $`R=\{r_1,r_2,r_3\}\in\mathcal R`$, with $`r_i`$ in part $`V_i`$, each auxiliary bipartite graph $`B_i`$ has a matching saturating $`\mathcal R`$. A neighbor $`w\in W\cap V_i`$ of $`R`$ means that $`(R\setminus\{r_i\})\cup\{w\}`$ is a hyperedge. These are consequences of the cited definitions, not additional hypotheses.

**Lemma 3.1 (Disjoint loose cycles).**

<a name="lem-cycles"></a>

If $`\mathcal H`$ is 3-partite and 3-uniform with $`\tau(\mathcal H)=2\nu(\mathcal H)=2h`$, then it contains $`h`$ loose 3-cycles with pairwise disjoint vertex supports. A loose 3-cycle here consists of three hyperedges on six vertices whose pairwise intersections are three distinct singletons.

*Proof.*

For $`h=0`$, take the empty collection. Otherwise use the HNS partition. Choose a saturating matching in each $`B_i`$, and write $`w_i(R)`$ for the vertex matched to $`R`$. For each $`R`$ the hyperedges

<a name="eq-cycles"></a>

``` math
\{r_2,r_3,w_1(R)\},\quad
\{r_1,r_3,w_2(R)\},\quad
\{r_1,r_2,w_3(R)\}
```

**(1)**

form the required loose cycle. Its six vertices are distinct since $`W`$ is disjoint from the central triples and the three $`w_i(R)`$ lie in different parts. Across different $`R`$’s, the same-part chosen vertices differ by the matching property; different-part vertices differ by the tripartition. None belongs to any central triple or $`\mathcal A`$-piece. Thus these supports are disjoint simultaneously; no compatibility between the three matchings is missing. Choose also three distinct underlying hyperedges in each $`\mathcal A`$-piece. These give disjoint cycles, for a total of $`|\mathcal A|+|\mathcal R|=h`$. This is the extraction also used in the proof of HNS Proposition 7.5. Isolated vertices may remain in $`W`$.

$`\square`$

**Lemma 3.2 (Graphical equality consequence).**

<a name="lem-k4"></a>

If $`\mathcal D(J)`$ is 3-partite and $`\tau(J)=2\nu(J)=2h`$, then $`J`$ contains $`h`$ pairwise edge-disjoint copies of $`K_4`$.

*Proof.*

Apply Lemma [3.1](#lem-cycles) to $`\mathcal D(J)`$. Consider one loose cycle. Name two graph triangles $`uvx`$ and $`uvy`$, where the four vertices are distinct. The third shares with each an edge other than $`uv`$. Its two shared edges lie in $`\{ux,vx\}`$ and $`\{uy,vy\}`$, respectively. They must meet, since they belong to one triangle. The cross choices $`ux,vy`$ and $`vx,uy`$ are disjoint, so the third triangle is $`uxy`$ or $`vxy`$. The union therefore contains exactly the six edges $`uv,ux,vx,uy,vy,xy`$ of a $`K_4`$. Disjoint hypervertex supports mean disjoint graph-edge sets. The resulting $`K_4`$ copies may share graph vertices.

$`\square`$

**Lemma 3.3 (Faces avoiding an independent set).**

<a name="lem-faces"></a>

Under the hypotheses of Lemma [3.2](#lem-k4), for every independent vertex set $`U`$ in $`J`$ there is a maximum triangle packing all of whose vertices lie outside $`U`$.

*Proof.*

Each $`K_4`$ meets $`U`$ in at most one vertex. Choose its opposite face if it meets $`U`$, and any face otherwise. The chosen faces are edge-disjoint, avoid $`U`$, and number $`h=\nu(J)`$. For $`h=0`$ use the empty packing.

$`\square`$

**Lemma 3.4 (Equality exhaustion).**

<a name="lem-exhaustion"></a>

Suppose $`J`$ contains $`h=\nu(J)`$ pairwise edge-disjoint copies of $`K_4`$. Then every triangle of $`J`$ is a face of one of these copies.

*Proof.*

An additional triangle $`Q`$ shares at most one edge with each block: two shared triangle edges would place all three vertices in that complete block. Choose in each block a face avoiding its possible shared edge. The $`h`$ chosen faces are mutually edge-disjoint and avoid $`Q`$, contradicting maximality. Extra graph edges belonging to no triangle are harmless.

$`\square`$

## 4. One-triangle restoration and odd-cycle transversals

**Lemma 4.1 (Two-edge cover).**

<a name="lem-intersecting"></a>

Every nonempty pairwise edge-intersecting family of graph triangles has a cover consisting of at most two graph edges. The family need not be the full triangle family of its ambient graph.

*Proof.*

A single triangle needs one edge. Otherwise choose distinct members $`abc,abd`$ sharing $`ab`$. Any member avoiding $`ab`$ must share an edge from $`\{ac,bc\}`$ and one from $`\{ad,bd\}`$. The disjoint cross pairs cannot be edges of one triangle; hence it must be $`acd`$ or $`bcd`$. If there is no such member, $`ab`$ covers the family. Otherwise $`cd`$ is an actual graph edge and $`\{ab,cd\}`$ covers the family. This also gives the $`k=3`$ case of the known intersecting-family result in Aharoni–Zerbib, Propositions 3.2 and 3.7 \[[2](#reference-2)\].

$`\square`$

*Proof of Theorem [2.1](#thm-main).*

Put $`h=\nu(H)`$ and $`U=V(T)`$. A maximum packing in $`H`$ together with $`T`$ gives $`\nu(G)\ge h+1`$. Aharoni gives $`\tau(H)\le2h`$. If the inequality is strict, integrality and a cover augmented by $`E(T)`$ give

<a name="eq-strict"></a>

``` math
\tau(G)\le\tau(H)+3\le2h+2\le2\nu(G).
```

**(2)**

Suppose instead $`\tau(H)=2h`$. The set $`U`$ is independent in $`H`$, since all three possible edges on it have been removed. Lemma [3.3](#lem-faces) gives a packing $`\mathcal P`$ of size $`h`$ avoiding $`U`$. Let $`\mathcal F`$ be the triangles of $`G`$ absent from $`H`$, and put $`r=\nu(\mathcal F)`$. Every member of $`\mathcal F`$ contains an edge of $`T`$, hence at least two vertices of $`U`$. Consequently every edge of every member touches $`U`$. Every edge of $`\mathcal P`$ has both endpoints outside $`U`$. The single fixed packing $`\mathcal P`$ is therefore edge-disjoint from *all* members of $`\mathcal F`$ simultaneously, and

<a name="eq-simultaneous"></a>

``` math
\nu(G)\ge h+r.
```

**(3)**

Since $`T\in\mathcal F`$, we have $`r\ge1`$. If $`r=1`$, any two members intersect in an edge, so Lemma [4.1](#lem-intersecting) gives $`\tau(\mathcal F)\le2=2r`$. If $`r\ge2`$, the three edges of $`T`$ give $`\tau(\mathcal F)\le3\le2r`$. Combining covers of $`H`$ and $`\mathcal F`$ yields

<a name="eq-equality"></a>

``` math
\tau(G)\le\tau(H)+\tau(\mathcal F)\le2h+2r\le2\nu(G).
```

**(4)**

This includes $`h=0`$, using an empty packing and no HNS invocation. A graph with no triangle cannot satisfy the stated premise on $`T`$.

$`\square`$

For clarity, the choice of packing matters: an arbitrary maximum packing of $`H`$ need not avoid the new triangles. For example, take a $`K_4`$ on $`a,d,e,f`$, add the edge $`bd`$, and then add $`T=abc`$. The old maximum packing $`\{ade\}`$ meets the new triangle $`abd`$, whereas the face $`def`$ avoids every new triangle. Lemma [3.3](#lem-faces) supplies the needed choice.

**Lemma 4.2 (Four colors give three edge labels).**

<a name="lem-colors"></a>

If $`J`$ is four-colorable, then $`\mathcal D(J)`$ is 3-partite.

*Proof.*

Identify vertex colors with $`\mathbb F_2^2`$ and label an edge by the sum of its endpoint colors. Properness makes this one of the three nonzero vectors. A triangle has three distinct vertex colors, so its three edge labels are distinct. Empty edge classes cause no difficulty.

$`\square`$

**Corollary 4.3.**

<a name="cor-oct"></a>

If $`\mathrm{oct}(G)\le4`$, then $`\tau(G)\le2\nu(G)`$.

*Proof.*

Choose $`S\subseteq V(G)`$ with $`|S|\le4`$ and $`G-S`$ bipartite. If $`G[S]`$ is bipartite, use two colors on $`S`$ and two different colors on its complement. Apply Lemma [4.2](#lem-colors) and Aharoni directly. Otherwise $`G[S]`$ contains an odd cycle, which on at most four vertices must be a triangle $`T`$. After deleting $`E(T)`$ the only remaining edges inside $`S`$ join the possible fourth vertex to $`V(T)`$, so they form a subgraph of a star. Both $`H[S]`$ and $`H-S`$ are bipartite. Thus $`H`$ is four-colorable, and Lemma [4.2](#lem-colors) and Theorem [2.1](#thm-main) apply. The argument includes all smaller transversals and all configurations on $`S`$.

$`\square`$

## 5. Two-triangle restoration: conventions and reductions

<a name="sec-two-conventions"></a>

For a triangle restored on an independent terminal set $`U=\{a,b,c\}`$, a *page* on the *base* $`ab`$ is a triangle $`abx`$ with apex $`x\in N_H(a)\cap N_H(b)`$. Its old edges $`ax,bx`$ are its *spokes*; write $`N_{ab}=N_H(a)\cap N_H(b)`$ for the page-apex set. Every new triangle is the restored triangle itself or a page. We write $`abc`$ for the triangle on three distinct vertices and $`ab`$ for an edge. A *triangle component* is a connected component of the graph of triangles joined when they share an edge. Packing and covering *slack* means $`2\nu-\tau`$.

Let $`T_1,T_2`$ be edge-disjoint triangles of $`G`$. Write $`H=G-(E(T_1)\cup E(T_2))`$, $`h=\nu(H)`$ and $`G_i=H+E(T_i)`$. The individual family $`F_i`$ consists of all triangles of $`G_i`$ absent from $`H`$. The full new family consists of all triangles of $`G`$ absent from $`H`$, including triangles using edges from both restored triangles. Edge-disjoint restored triangles are either vertex-disjoint or meet in exactly one vertex; the latter configuration is called a bowtie.

**Lemma 5.1 (Elementary bounds).**

<a name="lem-elementary"></a>

We have $`\nu(G)\ge h+2`$ and $`\tau(G)\le\tau(H)+6`$. Thus $`\tau(H)\le2h-2`$ suffices for $`\tau(G)\le2\nu(G)`$. If $`\tau(H)\le2h`$, a packing increase of at least three also suffices.

*Proof.*

Append $`T_1,T_2`$ to a maximum $`H`$-packing; augment an $`H`$-cover by their six edges. The asserted implications follow by substitution.

$`\square`$

## 6. Restoration from exact equality

<a name="sec-exact"></a>

**Theorem 6.1 (Exact-equality restoration).**

<a name="thm-exact"></a>

If $`\mathcal D(H)`$ is 3-partite, $`\tau(H)=2\nu(H)`$, and $`H`$ is obtained by deleting two edge-disjoint triangles of $`G`$, then $`\tau(G)\le 2\nu(G)`$.

*Proof.*

A maximum $`H`$-packing plus $`T_1,T_2`$ shows $`\nu(G)\ge h+2`$. A minimum $`H`$-cover plus the six restored edges shows $`\tau(G)\le 2h+6`$, settling $`\nu(G)\ge h+3`$. Assume $`\nu(G)=h+2`$. Then $`\nu(G_i)=h+1`$, since every $`G_i`$-packing can be appended by $`T_j`$, and $`T_i`$ can be appended to an $`H`$-packing.

$`U_i=V(T_i)`$ is independent in $`H`$. Each equality $`K_4`$ meets $`U_i`$ in at most one vertex, so choose its opposite face. The resulting fixed $`h`$-packing avoids all vertices of $`U_i`$. Every edge of a new triangle in $`F_i`$ meets $`U_i`$, so it is compatible simultaneously with every $`F_i`$-packing. Thus $`\nu(F_i)=1`$.

An edge-intersecting triangle family with no common edge is contained in the faces of one $`K_4`$. Indeed choose $`abc,abd`$ and a third triangle avoiding $`ab`$. The third is $`acd`$ or $`bcd`$. A further triangle containing $`ab`$ must then be $`abc`$ or $`abd`$ to meet the third; one avoiding $`ab`$ is among $`acd,bcd`$. Such a family can be covered by any chosen $`K_4`$ edge and its opposite edge. A family with a common edge has a one-edge cover.

If $`T_1,T_2`$ are vertex-disjoint, no triangle uses edges of both, and two two-edge covers suffice. In the bowtie case let $`T_1=vab`$ and $`T_2=vcd`$. The only mixed triangles are $`vxy`$, where $`x`$ in $`\{a,b\}`$, $`y`$ in $`\{c,d\}`$, and $`xy`$ is an $`H`$-edge. If both $`F_i`$ have one-edge covers, use these and $`va,vb`$. If $`F_1`$ needs two edges and $`F_2`$ one, the $`K_4`$ containing $`F_1`$ has its fourth vertex outside $`\{v,a,b,c,d\}`$: $`vc`$ and $`vd`$ are absent from $`G_1`$. Neither $`abc`$ nor $`abd`$ can be present in $`G_1`$, because it would belong to $`F_1`$ outside that $`K_4`$. Thus each of $`c,d`$ has at most one $`H`$-neighbor in $`\{a,b\}`$, so there are at most two mixed triangles. Include $`va`$ or $`vb`$ in a two-edge $`F_1`$-cover so as to hit one mixed triangle; the one-edge $`F_2`$-cover and one further edge cover the remainder. If both $`F_i`$ need two edges, the cross edges have maximum degree one on both sides. They are a matching of size at most two; choose one endpoint on each side covering the matching, and the corresponding spokes in the two two-edge covers. Again four edges cover all new triangles. Add an old cover to obtain $`\tau(G)\le 2h+4`$.

$`\square`$

The proof never needs one maximum $`H`$-packing avoiding $`U_1 \cup U_2`$. The two separate compatible packings establish separate bounds on $`\nu(F_i)`$; the final operation is a cover union. The mixed list is exhaustive because two restored edges from different triangles must meet at their unique common vertex. The argument includes $`h=0`$.

## 7. Restoration with a packing-essential edge

<a name="sec-essential"></a>

**Definition 7.1.**

An edge $`e\in E(H)`$ is packing-essential if $`\nu(H-e)=\nu(H)-1`$. The graph is packing-edge-stable if $`\nu(H-e)=\nu(H)`$ for every edge. Equivalently, an essential edge is used by every maximum triangle packing.

**Theorem 7.2 (Essential-edge restoration).**

<a name="thm-essential"></a>

If $`\mathcal D(H)`$ is tripartite and $`H`$ has a packing-essential edge, then $`\tau(G)\le2\nu(G)`$. If in addition $`\tau(H)=2h-1`$ and $`\nu(G)=h+2`$, at least one individual family $`F_i`$ has $`\tau(F_i)\le2`$.

*Proof.*

Aharoni’s bound on $`H-e`$ gives $`\tau(H)\le\tau(H-e)+1\le2h-1`$. Slack at least two is settled by Lemma [5.1](#lem-elementary), so assume $`\tau(H)=2h-1`$. **Free-page reconstruction.** Put $`e=xy`$, $`J=H-e`$, $`k=h-1`$. Cover deletion and Aharoni force $`2h-2\le \tau(J)\le 2\nu(J)=2h-2`$. Exhaustion gives $`k`$ $`K_4`$ blocks. A block contains at most one of $`x,y`$. If it contained $`x`$ and touched two different e-pages through $`xw_1,xw_2`$, then $`yw_1w_2`$ would be a $`J`$-triangle sharing the block edge $`w_1w_2`$ but not a block face; exhaustion rules this out. It cannot touch an x-spoke and y-spoke because then it would contain $`x,y`$ and the missing edge $`xy`$. Each block therefore touches at most one old e-page, in at most one edge. Cover that block by the touched edge and its opposite edge. If all e-pages touched blocks, these $`2k`$ edges would cover $`H`$, contradicting $`\tau(H)=2k+1`$. Hence some page $`Q=xyw`$ is edge-disjoint from every block.

**Hall classification.** Restore a triangle on independent $`U=\{a,b,c\}`$, with new family $`F`$. Let $`N_{ab},N_{bc},N_{ca}`$ be page-apex sets. Different-base, different-apex pages are disjoint, and all other page pairs meet. Thus page packings correspond exactly to matchings between bases and apices. If $`\tau(F)=3`$, every $`N`$ is nonempty (otherwise the other two bases cover F), and no two $`N`$ are the same singleton (their common spoke and the third base cover F). When $`\nu(F)\le 2`$, Hall’s three-set criterion therefore fails only on all three sets: their total union has exactly two elements $`p,q`$. A graph apex occurs in one or three base sets, never exactly two. All sets are nonempty and no two are the same singleton, so both $`p`$ and $`q`$ occur in all three. $`F`$ consists exactly of $`T`$ plus its six pages on $`p,q`$.

**Apex-edge forcing.** Suppose $`\nu(H+T)\le h+1=k+2`$ and $`\tau(F)=3`$. Faces of the $`k`$ blocks avoiding $`U`$ are compatible with all $`F`$, so $`\nu(F)\le 2`$ and the Hall classification applies. If $`pq`$ is not an $`H`$-edge, $`Q`$ meets $`U`$ and $`\{p,q\}`$ each in at most one vertex; thus $`Q`$ contains at most one of the six old spokes. Choose two pages on different bases and at different apices avoiding this possible spoke. If the forbidden spoke is $`up`$, take the p-page on the base opposite $`u`$ and any different q-base. The two pages, $`Q`$, and the $`k`$ faces form $`k+3`$ triangles, a contradiction. Hence $`pq`$ is an $`H`$-edge. If $`pq`$ differs from $`e`$, at least two of $`pqu`$ (u in U) avoid $`e`$; they are $`J`$-triangles sharing $`pq`$, hence faces of the same $`K_4`$. That $`K_4`$ would contain two independent $`U`$ vertices, impossible. Therefore $`pq=e`$.

**Compatibility and finish.** As in the exact-equality proof, only $`\nu(G)=h+2`$ requires work. If either $`F_i`$ has a two-edge cover, combine it with an old cover and all three edges of the other restored triangle, giving $`2h+4`$. This covers mixed triangles because every triangle absent from $`G_i`$ uses an edge of $`T_j`$. Otherwise both apex pairs are $`\{x,y\}`$. In the disjoint case $`abc,def`$ use $`abx,acy,dex,dfy`$. In the bowtie case $`vab,vcd`$ use $`abx,vay,cdy,vcx`$. These four triangles have disjoint edges. Each old block contains at most one of $`x,y`$, so its face avoiding those vertices avoids all four pages. This yields $`k+4=h+3`$ triangles, contradiction.

$`\square`$

Packing-essential means present in every maximum packing, equivalently $`\nu(H-e)=h-1`$. It is not a property of minimum covers. The theorem does not classify arbitrary stable slack-one remainders.

## 8. The unique defective triangle component

<a name="sec-component"></a>

Two triangles belong to the same triangle component if they can be joined by a chain of triangles in which consecutive members share a graph edge. Components have disjoint edge supports but may share vertices.

**Proposition 8.1 (Single defective component).**

<a name="prop-component"></a>

If $`\mathcal D(H)`$ is tripartite and $`\tau(H)=2\nu(H)-1`$, exactly one triangle component has slack one. Every other component consists precisely of the four faces of a $`K_4`$. Thus the triangle family is an edge-disjoint union of isolated $`K_4`$ face families and the full triangle family of a graph $`R`$ with connected triangle-intersection graph and $`\tau(R)=2\nu(R)-1`$.

*Proof.*

For each triangle component $`C_j`$, let $`E_j`$ be the union of its triangle edge sets and let $`H_j`$ have edge set $`E_j`$. The sets $`E_j`$ are disjoint. Every triangle using edges of $`E_j`$ is an $`H`$-triangle sharing an edge with a member of $`C_j`$, and hence belongs to $`C_j`$. Therefore

``` math
\nu(H)=\sum_j\nu(H_j),\qquad \tau(H)=\sum_j\tau(H_j).
```

**(5)**

The tripartition restricts to $`H_j`$. Aharoni gives nonnegative integer slacks $`\delta_j=2\nu(H_j)-\tau(H_j)`$. Their sum is one, so precisely one equals one and all others vanish. Equality extraction and Lemma [3.4](#lem-exhaustion) show that each equality component consists of edge-disjoint $`K_4`$ face families. Distinct such families are disconnected in the triangle-intersection graph; connectedness therefore leaves exactly one $`K_4`$.

$`\square`$

Edges belonging to no triangle do not affect this decomposition. Theorem [7.2](#thm-essential) implies that an unresolved slack-one remainder must be packing-edge-stable, in particular on its unique defective component. This does not bound that component’s order or classify it by a finite list. Restored triangles may interact with arbitrarily many equality components and with old triangle-free edges; the compatibility arguments below retain those interactions.

## 9. Restoration from flat remainders

<a name="sec-flat"></a>

**Theorem 9.1 (Flat-remainder restoration).**

<a name="thm-flat"></a>

If every edge of $`H`$ lies in at most two $`H`$-triangles, then restoring any two edge-disjoint triangles gives $`\tau(G)\le 2\nu(G)`$. No triangle-hypergraph tripartiteness is required.

*Proof.*

We use Haxell–Kostochka–Thomassé Theorem 2: a $`K_4`$-free flat graph satisfies $`\tau\le3\nu/2`$, and equality components containing triangles are five-wheels \[[7](#reference-7)\]. No planarity assumption is required.

**Structural reduction.** In a flat $`H`$ every $`K_4`$ is an isolated triangle component because each block edge already lies in two faces. Remove all such edge supports to get $`K_4`$-free flat $`R`$. Parameters add over triangle components. HKT gives $`\tau(H)\le 2\nu(H)`$. At slack one, $`1=2\nu(R)-\tau(R)\ge \nu(R)/2`$, so $`\nu(R)=1`$ or 2. For $`\nu(R)=1`$, $`\tau(R)=1`$ and all triangles share an edge, which supports at most two triangles. For $`\nu(R)=2`$, $`\tau(R)=3`$ is equality in HKT and precisely one five-wheel remains. At slack zero $`R`$ is triangle-free. No vertex-disjoint decomposition is asserted.

**Five-wheel augmentation, complete local check.** Let $`F`$ be a single restored family with $`\tau(F)=3`$ and independent terminals $`U`$. All page-apex sets are nonempty and each pair admits distinct representatives, by the cover argument in Section [7](#sec-essential). A five-wheel $`W`$ retains packing number two after any one edge deletion: in the triangle-cycle of length five, a deleted spoke forbids two consecutive triangles and a deleted rim edge forbids one, leaving two nonadjacent available triangles.

If $`U`$ meets $`W`$ at most once, choose two pages on different bases and with different apices, one base avoiding the possible W-terminal. They consume at most one W-edge; append two surviving wheel triangles. If $`U`$ meets $`W`$ twice, these are nonadjacent rim vertices $`a,c`$; write $`U=\{a,b,c\}`$, rim $`a,r,c,s,t`$, hub $`z`$, and $`b`$ outside $`W`$. $`N_H(b) \cap V(W)`$ is independent, since adjacent neighbors would create a nonwheel triangle sharing a W-edge. Consider the page sets $`B=N_{ab}`$ and $`C=N_{cb}`$. If either has an outside-W apex, choose distinct representatives with at least one outside $`W`$: if $`C`$ is the singleton containing the chosen B-apex, choose another B-apex and exchange the roles. This consumes at most one W-edge and the earlier argument applies.

Otherwise $`B,C`$ lie inside $`W`$ and are nonempty, not the same singleton. Their possible vertices are respectively $`\{z,r,t\}`$ and $`\{z,r,s\}`$. Independence and absence of neighbors $`a,c`$ force $`N_H(b) \cap W=\{r,s\}`$ or $`\{r,t\}`$; all other subsets make a set empty or make both the same singleton. By reflection take $`\{r,s\}`$. Then $`acz,abr,cbs,zst`$ are four edge-disjoint triangles: their edge sets are $`\{ac,az,cz\}`$, $`\{ab,ar,br\}`$, $`\{bc,cs,bs\}`$, $`\{zs,zt,st\}`$. This verifies the exceptional packing explicitly.

**Book core.** Suppose the residual component has $`\nu=\tau=1`$ and other components are $`K_4`$ copies. Choose block faces avoiding $`U`$. If $`\nu(F)\ge 3`$, append three $`F`$-triangles. Otherwise the essential-edge proof’s Hall classification gives apices $`p,q`$. Flatness forces $`pq`$ absent because otherwise $`pq`$ lies in the three old triangles $`pqu`$. Any old book triangle $`Q`$ therefore meets $`U`$ and $`\{p,q\}`$ each in at most one vertex, and has at most one page spoke. Two pages can avoid it as in the essential-edge proof, and append $`Q`$. In both cases packing increases by at least two over $`H`$.

**Restoration conclusion.** In slack one, if $`\nu(G)=h+2`$, each intermediate graph has packing $`h+1`$, so the augmentations force $`\tau(F_i)\le 2`$. Combine an old cover, one $`F_i`$-cover and the other restored triangle’s three edges. At slack at least two the old cover plus six edges suffices. At slack zero all triangles are isolated $`K_4`$ faces, and the exact-equality theorem’s elementary four-edge new-family cover argument applies. Hence the full theorem uses HKT and elementary arguments; neither Aharoni nor HNS is needed.

$`\square`$

The five-wheel augmentation is the substantive new local step; the book case under a tripartiteness hypothesis is already covered by the essential-edge theorem because a book spine is packing-essential. The flat result removes that tripartiteness requirement and covers the stable wheel core. Its slack-zero portion is the prior equality argument with $`K_4`$ witnesses supplied directly by flatness/HKT. That portion is an application of the equality mechanism.

## 10. Three nonflat star cores

<a name="sec-star"></a>

**Theorem 10.1 (Star-core restoration).**

<a name="thm-star"></a>

Suppose the nonempty triangle components of $`H`$ are isolated $`K_4`$ face families and one core consisting of a central $`K_4`$ with $`r\in\{1,2,3\}`$ leaf $`K_4`$s attached on distinct edges of a central star, using two fresh vertices per leaf. Then restoring two edge-disjoint triangles gives $`\tau(G)\le2\nu(G)`$.

*Proof.*

**The core and its parameters**

<a name="the-core-and-its-parameters"></a>

Take a central triangle $`abc`$. At each vertex $`t`$ in a nonempty subset A of $`\{a,b,c\}`$, optionally attach one triangle $`t`$ $`p_t`$ $`q_t`$, using two new vertices for each attachment. Let $`F_0`$ be this triangle cactus. Write $`r=|A|`$, so $`1\le r\le 3`$. Adjoin a hub $`v`$ adjacent to every vertex of $`F_0`$, obtaining the core $`R`$.

Equivalently, $`R`$ consists of a central $`K_4`$ on $`\{v,a,b,c\}`$ and $`r`$ leaf $`K_4`$ copies $`\{v,t,p_t,q_t\}`$, one on each selected central spoke $`vt`$. The leaf supports are pairwise edge-disjoint, and each shares just its selected spoke with the central $`K_4`$.

Put $`d=r+1`$. Every triangle of $`R`$ belongs to exactly one of these $`d`$ $`K_4`$ copies, so $`\nu(R)\le d`$. The $`d`$ triangles of $`F_0`$ are edge-disjoint, giving $`\nu(R)=d`$. Each leaf $`K_4`$ needs two cover edges, on disjoint supports. A cover of exactly $`2r`$ edges would therefore have all its edges in the leaf supports; its intersection with the central $`K_4`$ is contained in the hub star, which does not meet the central triangle $`abc`$. Thus $`\tau(R)\ge 2r+1`$. Conversely, take all $`r`$ attachment spokes $`vt`$, the $`r`$ leaf-opposite edges $`p_t q_t`$, and enough central edges to cover the central $`K_4`$. This last addition needs one edge if $`r=1`$, one if $`r=2`$, and one if $`r=3`$; when $`r=1`$ choose the central edge opposite the spoke $`vt`$. Hence $`\tau(R)=2r+1=2d-1`$.

The core is four-colorable: color $`v`$ with a fourth color, color $`abc`$ with three colors, and complete each attached triangle with the other two colors. Also $`\nu(R-e)=d`$ for every edge $`e`$. If $`e`$ is a hub spoke, the $`F_0`$ triangles avoid it. If $`e`$ is an $`F_0`$ edge, replace its $`F_0`$ triangle by a hub face of its $`K_4`$ avoiding $`e`$ and retain all other $`F_0`$ triangles. Thus none of the cores has a packing-essential edge.

**Two-edge avoidance**

<a name="two-edge-avoidance"></a>

Let $`f,g`$ be $`F_0`$ edges in different triangle blocks of $`F_0`$. There is a $`d`$-triangle packing of $`R`$ avoiding both, except possibly when one is a central edge and one is in a leaf block, and both edges are opposite that leaf’s attachment vertex.

To prove the assertion, retain every unaffected $`F_0`$ triangle. Replace the two affected triangles by hub faces avoiding their forbidden edges. For two different leaf blocks the possible hub spokes belong to disjoint sets of nonhub vertices, so any choices are compatible. For a central block and a leaf at $`t`$, the only possible shared spoke is $`vt`$. A hub face avoiding a forbidden edge can avoid $`vt`$ as well unless that edge is opposite $`t`$ in its block. Unless both forbidden edges are opposite $`t`$, make at least one of the two face choices avoid $`vt`$. This yields the desired packing.

**Single restoration**

<a name="single-restoration"></a>

Suppose $`H`$ has triangle components consisting of any $`k`$ isolated $`K_4`$ face components and one isolated copy of $`R`$. Additional edges belonging to no triangle are allowed. Let $`U`$ be independent in $`H`$, with $`|U|=3`$; restore $`T`$ on $`U`$ and let $`F`$ be the new triangle family. Then

``` math
\tau(F)=3\quad\Longrightarrow\quad
\nu(H+E(T))\ge\nu(H)+2.
```

**(6)**

It suffices to find $`d+2`$ compatible triangles from $`R`$ and $`F`$. Indeed, one face in each of the other $`k`$ $`K_4`$ copies can be chosen to avoid $`U`$, and these faces are compatible with every $`F`$-triangle and with $`R`$. The isolated copy of $`R`$ is induced on its vertices: any additional edge between two nonhub vertices would form a new hub triangle sharing an R-spoke, contrary to isolation. Its listed neighborhoods can therefore be used as $`H`$-neighborhoods restricted to $`R`$.

We repeatedly use the elementary fact that $`\tau(F)=3`$ forces each base edge of $`T`$ to have a nonempty page-apex set, and any two of these sets have distinct representatives. If two sets were the same singleton, the common spoke and the third base edge would cover $`F`$.

**At most one vertex of $`U`$ in $`R`$.**

<a name="at-most-one-vertex-of-u-in-r"></a>

Choose two pages with distinct apices, one whose base avoids the possible R-vertex and one on a different base. The first uses no $`R`$-edge and the second at most one. Since $`\nu(R-e)=d`$, these two pages are compatible with a $`d`$-packing of $`R`$.

**Exactly two vertices of $`U`$ in $`R`$.**

<a name="exactly-two-vertices-of-u-in-r"></a>

Write $`U=\{u,w,z\}`$, where $`u,w`$ are nonadjacent vertices of $`R`$ and $`z`$ lies outside $`R`$. Let $`B`$ and $`C`$ be the common-neighbor sets in $`H`$ for uz and wz. They are nonempty and admit distinct representatives.

If either contains an apex outside $`R`$, choose distinct representatives $`b`$ in $`B`$ and $`c`$ in $`C`$ with at most one in $`R`$. The two pages $`uzb,wzc`$ consume at most one $`R`$-edge between them, and a $`d`$-packing survives.

Otherwise both $`B`$ and $`C`$ lie in $`R`$. Since the $`R`$ triangle component is isolated, $`N_H(z) \cap V(R)`$ is independent in $`R`$: an adjacent pair there would give a new $`H`$-triangle on an $`R`$-edge. If this neighborhood contained the hub $`v`$, it would contain no other R-vertex, forcing $`B=C=\{v\}`$, which is excluded. Thus distinct $`b`$ in $`B,c`$ in $`C`$ lie in $`F_0`$. The pages $`uzb,wzc`$ use the $`F_0`$ edges $`ub,wc`$. These edges lie in different $`F_0`$ triangle blocks because $`u,w`$ are nonadjacent.

Apply the two-edge avoidance fact. If its exception does not occur, the two pages and a $`d`$-packing of $`R`$ suffice. In the exceptional case, relabel the central triangle as $`abc`$ and the exceptional leaf as $`b`$ $`p`$ $`q`$ so that $`u=a,w=p`$, and the two selected page apices are $`c,q`$. (Symmetry permits exchanging the two terminals and the two endpoints of either opposite edge.) Besides the two pages $`azc,pzq`$, the third page $`apb`$ exists, because $`ab`$ and $`pb`$ are $`R`$-edges. The three pages

``` math
azc,\quad pzq,\quad apb
```

**(7)**

are edge-disjoint. Omit the central $`F_0`$ triangle, replace the leaf $`bpq`$ by the hub face $`vbq`$, and retain every other leaf triangle. These $`d-1`$ old triangles are compatible with all three pages and with each other. Their total is $`d+2`$.

**All three vertices of $`U`$ in $`R`$.**

<a name="all-three-vertices-of-u-in-r"></a>

The hub $`v`$ is not in $`U`$. If there is any page with an apex outside $`R`$, combine it with a page on a different base having apex $`v`$. These two pages are edge-disjoint; their $`R`$-edges, if any, are hub spokes. They are therefore compatible with all $`d`$ triangles of $`F_0`$.

Assume all page apices lie in $`R`$. An independent triple of $`F_0`$ contains at most one central vertex and at most one private vertex from each leaf. If it contains no central vertex, its members lie in three distinct leaves and have no common neighbors in $`F_0`$; all their page apices are just $`v`$. This gives a two-edge cover of $`F`$, contrary to $`\tau(F)=3`$.

Thus, after relabeling, $`U=\{a,p_b,p_c\}`$, where $`p_b`$ and $`p_c`$ are private vertices of the leaves at $`b`$ and $`c`$. The three pages

``` math
a p_b b,\quad a p_c c,\quad p_b p_c v
```

**(8)**

are edge-disjoint. Omit the central triangle $`abc`$; replace the b-leaf by $`vbq_b`$ and the c-leaf by $`vcq_c`$; retain the a-leaf triangle if it exists. These $`d-1`$ old triangles are edge-disjoint and compatible with the three pages. Again the total is $`d+2`$. This completes the lemma.

**Completion of the proof**

<a name="completion-of-the-proof"></a>

Let $`T_1,T_2`$ be arbitrary edge-disjoint restored triangles whose deletion leaves $`H`$ as above. Write $`h=\nu(H)=k+d`$. Then $`\tau(H)=2h-1`$. If $`\nu(G)\ge h+3`$, the old cover plus the six restored edges suffices. Otherwise $`\nu(G)=h+2`$ and every individual intermediate graph has packing number at most $`h+1`$. The lemma forces $`\tau(F_i)\le 2`$ for both $`i`$. An old cover, one such two-edge cover, and the three edges of the other restored triangle cover $`G`$, mixed triangles included, with at most $`2h+4`$ edges.

Hence Tuza’s inequality holds for two-triangle restoration from any remainder whose triangle components are isolated $`K_4`$ copies plus one of these three $`K_4`$-star cores.

The $`r=1`$ case is the two-$`K_4`$ shared-edge core. The $`r=2`$ and $`r=3`$ cases are additional nonflat, packing-edge-stable examples. This is not a classification of every near-equality remainder.

$`\square`$

## 11. Closed-boundary deletion and stability

<a name="sec-boundary"></a>

**Theorem 11.1 (Closed-boundary equality deletion).**

<a name="thm-boundary"></a>

Suppose $`\mathcal D(H)`$ is 3-partite, $`\nu(H)=h`$, $`\tau(H)=2h-1`$. Let $`U,P`$ be disjoint independent graph-vertex sets, $`W=U \cup P`$. Assume that for every **actual $`H`$-edge** $`px`$ with $`p`$ in $`P`$ and $`x`$ outside $`W`$, at most one vertex of $`U`$ is adjacent in $`H`$ to both $`p`$ and $`x`$. Let A be any subset of $`E_H(U,P)`$, without any cardinality bound. If $`K=H-A`$ has $`\tau(K)=2\nu(K)`$, then $`H`$ has a packing-essential edge. Consequently, if $`H`$ is packing-edge-stable, every such A satisfies

``` math
\begin{gathered}
\nu(H-A) \ge  h-\lfloor |A|/2\rfloor
\end{gathered}
```

**(9)**

Independence of $`P`$ and the local uniqueness condition are both retained hypotheses; no theorem without them is asserted. The condition is not asserted automatically for the union of two restoration boundaries.

*Proof.*

Let $`L`$ be all $`H`$-triangles absent from $`K`$. A triangle containing $`up`$ in A cannot have its third vertex in $`U`$ or $`P`$ because both are independent. Thus every L-triangle is $`upx`$ with $`u`$ in $`U`$, $`p`$ in $`P`$, $`x`$ outside $`W`$, and it contains exactly one A-edge.

Write $`k=\nu(K)`$. In an equality $`K_4`$ there are at most two $`W`$ vertices, at most one from each independent side. If there are at most one, select a face avoiding $`W`$. Its edges have both endpoints outside $`W`$, whereas every edge in an L-triangle meets $`W`$. If there are two, call them $`u,p`$ and write the block $`upxy`$. The edge $`up`$ survives, hence is not in A. Select $`pxy`$. The edge $`xy`$ cannot lie in $`L`$. If $`px`$ lay in a lost triangle $`ptx`$, then $`t`$ is in $`U`$ and $`pt`$ is in A. The actual edge $`px`$ has both $`u`$ and $`t`$ as common U-neighbors, so $`t=u`$, contradicting that $`up`$ survives. The same handles $`py`$. All chosen faces are mutually edge-disjoint because block supports are disjoint. This gives one fixed $`k`$-packing compatible with **every** L-triangle, not merely with separately chosen witnesses.

Partition $`L`$ by its unique $`U`$ vertex: $`L=\bigsqcup_{u\in U}L_u`$. Distinct rows have disjoint edge supports. Edges meeting $`U`$ identify their row directly. A common $`px`$ edge in two rows would violate local uniqueness at $`px`$. For one row $`u`$, let $`B_u`$ be the bipartite graph with parts $`P`$ and outside vertices adjacent to $`u`$, and an edge $`px`$ precisely for the triangle $`upx`$ in $`L_u`$. Two $`L_u`$ triangles conflict exactly when their $`B_u`$ edges share an endpoint; hence $`\nu(L_u)`$ is the matching number of $`B_u`$. A vertex cover of $`B_u`$ gives the triangle cover consisting of its u-spokes. Conversely, every rim edge $`px`$ in a triangle cover can be replaced by $`up`$ (or ux): within the row it covers only that single triangle. This produces a $`B_u`$ vertex cover of no larger size. König gives $`\tau(L_u)=\nu(L_u)`$; disjoint supports give $`\tau(L)=\nu(L)`$.

The compatible $`k`$-packing and a maximum L-packing prove $`\nu(H)\ge k+\nu(L)`$. Conversely, splitting any $`H`$-packing into $`K`$ and $`L`$ portions proves the reverse inequality. Put $`d=h-k=\nu(L)`$. Monotonicity excludes $`d=0`$ because then $`\tau(K)=2h>\tau(H)`$. Separately covering $`K`$ and $`L`$ yields

``` math
\begin{gathered}
2h-1 \le  2k+d, \\
2d-1 \le  d
\end{gathered}
```

**(10)**

Thus $`d=1`$ and $`\tau(L)=1`$. Take an edge $`g`$ meeting all L-triangles. Every triangle of $`H-g`$ belongs to $`K`$, so $`\nu(H-g)\le k=h-1`$; deletion of one edge gives equality. This proves essentiality. For stable $`H`$ equality in $`K`$ is impossible, so Aharoni gives $`\tau(K)\le 2\nu(K)-1`$. Together with $`\tau(K)\ge 2h-1-|A|`$ this yields the floor bound.

$`\square`$

**Theorem 11.2 (Companion stability).**

<a name="thm-stability"></a>

Assume $`\mathcal D(H)`$ is 3-partite and $`\nu(H)=h`$. Let $`U,P,A`$ satisfy exactly the independence and local boundary conditions above. Put $`K=H-A`$, and suppose

``` math
\begin{gathered}
\nu(K)=h-d, \tau(K)=2(h-d)-1
\end{gathered}
```

**(11)**

Let $`L_A`$ be the **full** family of $`H`$-triangles using A, including triangles that might also use an edge $`g`$ considered later. If $`\nu(L_A)\ge d+2`$, then $`K`$ is packing-edge-stable.

*Proof.*

If $`g`$ were essential in $`K`$, then $`J=K-g`$ has $`\nu(J)=h-d-1`$. The one-edge cover-loss bound gives $`\tau(J)\ge 2(h-d)-2`$, and Aharoni gives the reverse inequality. Thus $`J`$ is equality. The face-selection proof in Section [11](#sec-boundary) applies to every $`J`$ block with respect to the original $`H,U,P,A`$: a retained $`up`$ is still outside A, and local uniqueness is a statement about $`H`$. It produces $`h-d-1`$ faces compatible with every $`L_A`$ triangle, even if some $`L_A`$ triangle uses $`g`$. Appending a $`(d+2)`$-packing from $`L_A`$ gives $`h+1`$ $`H`$-triangles, contradiction.

This proof needs no hypothesis $`\tau(H)=2h-1`$ and does not use the integrality of $`L_A`$. A sufficient row condition is that at least $`d+2`$ $`U`$ rows contain an A-edge lying in an $`H`$-triangle. Pick one triangle in each row; the row supports are disjoint by local uniqueness.

$`\square`$

### 11.1 A qualified four-spoke descent

<a name="sec-descent"></a>

**Corollary 11.3 (Four-spoke descent and a stable descendant).**

<a name="cor-descent"></a>

Let $`\mathcal D(H)`$ be tripartite, $`\nu(H)=h`$, $`\tau(H)=2h-1`$, and suppose $`H`$ is packing-edge-stable. Let $`U=\{a,b,c\}`$ be independent. Suppose the complete new triangle family obtained by restoring $`abc`$ consists exactly of $`abc`$ and its six pages at distinct apices $`p,q`$, with $`pq\notin E(H)`$, and suppose
``` math
\nu(H+abc)=h+1,\qquad \tau(H+abc)=2h+2.
```
For any pair of compatible pages on different bases and at different apices, let $`A`$ be their four old spokes. Then
``` math
\nu(H-A)=h-1,\qquad \tau(H-A)=2h-3.
```
A spoke is called active if it lies in an $`H`$-triangle. If at least five of the six spokes are active, such a pair can be chosen so that $`H-A`$ is packing-edge-stable.

*Proof.*

Exactness gives the boundary condition for $`U`$ and $`P=\{p,q\}`$: any outside vertex adjacent to two terminals would itself be an additional page apex. The two compatible pages append to any $`H-A`$ packing, giving $`\nu(H-A)\le h-1`$. The set $`A`$, together with the unused base edge, covers the entire individual new family and all old triangles destroyed by $`A`$. Hence $`\tau(H-A)\ge 2h-3`$. Aharoni now forces $`\nu(H-A)=h-1`$ and $`\tau(H-A)\in\{2h-3,2h-2\}`$. Theorem [11.1](#thm-boundary) excludes equality because $`H`$ is stable.

With six active spokes, any four-spoke path has an active deleted spoke in every terminal row. With exactly five, make the deficient row the middle of the path: if $`ap`$ is inactive, use pages $`abp`$ and $`acq`$, so $`A=\{ap,bp,aq,cq\}`$ and $`aq,bp,cq`$ are active. The three nonempty rows supply three pairwise edge-disjoint lost triangles, by local uniqueness. Theorem [11.2](#thm-stability), with $`d=1`$, proves stability.

$`\square`$

The five-active-spoke premise is explicit. No general reduction to that premise, and no iterative descent, is claimed: deleting $`A`$ damages the expensive family and supplies no replacement family.

## 12. Exact two-apex bowties

<a name="sec-bowtie"></a>

**Lemma 12.1 (Nine-cycle page dichotomy).**

<a name="lem-cycle-pages"></a>

Let $`L`$ have induced $`C_9`$ on $`W`$, independent outside part $`X`$, and arbitrary W-X spokes, and assume $`\nu(L)\le 4`$. Then either $`\tau(L)=\nu(L)`$, or its entire triangle family is a single full nine-wheel, with $`(\nu,\tau)=(4,5)`$.

*Proof.*

Represent the triangle family using its base edges and outside apices. Represent a triangle by ($`i,x`$), its cycle base and outside apex. Its intersection graph $`I`$ has clique columns $`i`$, and adjacent columns are joined only between equal apex labels. The neighborhood of any vertex is the disjoint union of its same-column clique and at most two singletons. Hence no neighborhood contains an induced $`P_3`$; this excludes odd antiholes of length at least seven, whose vertex neighborhoods contain $`P_3`$.

Any induced cycle of $`I`$ of length at least five must visit all nine columns. Otherwise the used columns form a proper connected interval. An endpoint column cannot contain one cycle vertex (it has at most one neighbor in the sole adjacent used column). If it contains two, they are consecutive, their other cycle neighbors lie in the next column and are distinct, and the edge between those neighbors is a chord unless the cycle has length four. A clique column cannot contain three vertices of an induced cycle of length at least four. Thus $`C_5`$ and $`C_7`$ are absent. An induced $`C_9`$ uses one vertex per column and preserves its apex around the cycle, so it is a full nine-wheel. An odd hole of length at least eleven gives five independent vertices of $`I`$, hence a five-packing, contrary to $`\nu(L)\le 4`$.

If a full wheel at $`x`$ exists together with a further page at $`y`$, remove that page’s base from $`C_9`$ and take a four-matching of the remaining eight-edge path. Its x-pages plus the y-page give a five-packing. Thus at $`\nu(L)\le 4`$ the full wheel must be the whole triangle family; it has $`(\nu,\tau)=(4,5)`$, since every edge meets at most two of its nine pages and a five-spoke cover exists.

Without a wheel, the Strong Perfect Graph Theorem \[[4](#reference-4)\] applies (equivalently to the complement), so $`I`$ partitions into $`\alpha(I)=\nu(L)`$ cliques. Each clique has a common graph edge: a clique within one column has its base; a clique meeting two columns has exactly two vertices of the same apex and shares their joining spoke. There are no cliques spanning three columns. These common edges provide $`\tau(L)\le \nu(L)`$. This proves the dichotomy.

$`\square`$

**Theorem 12.2 (Mixed or shared-apex restoration).**

<a name="thm-bowtie"></a>

Let $`G`$ be finite simple, $`T_1=vab`$ and $`T_2=vcd`$ edge-disjoint triangles sharing exactly $`v`$, and $`H=G-(E(T_1) \cup E(T_2))`$. Assume $`\mathcal D(H)`$ is 3-partite. For each $`i`$, the complete family of triangles in $`H+E(T_i)`$ but not in $`H`$ consists **exactly** of $`T_i`$ and its six pages at two distinct vertices $`P_i`$ adjacent to all three terminals. In particular there are no additional partial-apex pages. If $`P_1`$ intersects $`P_2`$, or if some $`G`$-triangle uses an edge of each $`T_i`$, then $`\tau(G)\le 2\nu(G)`$.

The second alternative is equivalent to an $`H`$-edge between $`\{a,b\}`$ and $`\{c,d\}`$. This theorem does not settle vertex-disjoint restored triangles, disjoint-apex unmixed bowties, or arbitrary families of packing three.

*Proof.*

**Critical reduction and necessary full-family bookkeeping**

<a name="critical-reduction-and-necessary-full-family-bookkeeping"></a>

Let $`h=\nu(H)`$. Appending $`T_1,T_2`$ gives $`\nu(G)\ge h+2`$; adding their six edges to an $`H`$-cover gives $`\tau(G)\le \tau(H)+6`$. Slack at least two settles immediately. The slack-zero branch is Section [6](#sec-exact). In a remaining counterexample,

``` math
\begin{gathered}
\tau(H)=2h-1, \nu(G)=h+2, \tau(G)=2h+5
\end{gathered}
```

**(12)**

Theorem [7.2](#thm-essential) excludes essential edges of $`H`$. Each individual restoration must have actual cover increase three, since adding the other restored triangle’s three edges completes a cover of $`G`$. This uses actual tau of intermediate graphs, not just the cover number of a chosen new-family subcollection.

The adjacent-apex lemma is independently proved as follows. For any terminal $`u`$, deleting its pair of spokes preserves $`\tau(H)`$, because those two spokes and the opposite base cover the individual new family at cost three. If $`pq`$ were present, delete triangle $`upq`$. Aharoni and cover loss force equality with $`h-1`$ $`K_4`$ blocks. The terminal set $`\{u,p,q\}`$ is independent in the remainder, so choose one face avoiding it from each block, compatible with every lost triangle. The lost family has packing one, and contains $`pqa,pqb,pqc`$. A triangle not containing $`pq`$ cannot meet all three in edges: it would need three edges of the bipartite graph between $`\{p,q\}`$ and $`\{a,b,c\}`$, impossible. Thus all lost triangles contain $`pq`$, so $`pq`$ is essential. This contradicts stable $`H`$. Therefore same-family apex pairs are nonadjacent.

All apices lie outside $`W_0=\{v,a,b,c,d\}`$; a terminal of the other restored triangle misses $`v`$ in $`H`$. Exactness forces cross edges between $`\{a,b\}`$ and $`\{c,d\}`$ to form a matching: two with a common endpoint would create an additional partial-apex page for the other base. Consequently the full new family is the two individual families plus $`m`$ mixed triangles, $`m=0,1,2`$. After relabeling their cross edges are $`ac`$ and possibly $`bd`$. In the disjoint-apex case, exactness also forbids every extra terminal-apex edge outside the twelve specified spokes.

**Equality-extraction rule**

<a name="equality-extraction-rule"></a>

If $`Q`$ is a q-packing of $`G`$, all of its old edges lie in A, and $`B`$ is a cover of **every** new triangle with A subset $`B`$ and $`|B|=2q+1`$, then $`J=H-A`$ satisfies

``` math
\begin{gathered}
\nu(J)\le h+2-q, \\
\tau(J)\ge \tau(G)-|B|=2(h+2-q)
\end{gathered}
```

**(13)**

Aharoni forces equality. If the right side for packing is negative, $`Q`$ itself already contradicts $`\nu(G)=h+2`$. The A subset $`B`$ requirement ensures that a $`J`$-cover plus $`B`$ also covers old triangles destroyed by A. Equality exhaustion, not just extraction, is needed subsequently.

**Shared apices: all cases**

<a name="shared-apices-all-cases"></a>

Write $`P_1=\{p,q\}`$, $`P_2=\{p,r\}`$, allowing $`r=q`$. If $`m=0`$, the two row-v covers have union $`\{vp,vq,vr,ab,cd\}`$ of size at most five. If $`r=q`$ and $`m\le 1`$, $`\{vp,vq,ab,cd\}`$ plus the mixed edge has size at most five. These save one cover edge and settle.

For $`m=2`$ use

``` math
\begin{gathered}
Q = \{vac,vbd,abq,cdr\}, \\
A = \{ac,bd,aq,bq,cr,dr,vp\}, \\
B = A\cup \{ab,cd\}
\end{gathered}
```

**(14)**

For $`m=1`$ and $`r`$ distinct from $`q`$ use

``` math
\begin{gathered}
Q = \{vac,abq,cdr,vbp\}, \\
A = \{ac,aq,bq,cr,dr,vp,bp\}, \\
B = A\cup \{vb,cd\}
\end{gathered}
```

**(15)**

In each case $`Q`$ is edge-disjoint, A contains all old edges of $`Q`$, and $`B`$ covers the full new family. Equality gives $`h-2`$ blocks in $`J`$. All $`H`$-edges inside $`W_0`$ were removed, so $`W_0`$ is independent in $`J`$; choose each block’s face avoiding $`W_0`$. If $`r`$ differs from $`q`$, the five-packing $`\{vac,abp,vbq,cdp,vdr\}`$ uses only edges touching $`W_0`$. If $`r=q`$ in the $`m=2`$ case, use $`\{vcp,vaq,vbd,abp,cdq\}`$. These are compatible with all selected faces and give $`h+3`$ triangles, contradiction. Optional edges between apices affect only old triangles and do not invalidate either the new-family covers or these packings.

**Disjoint apices, two mixed triangles, at least one cross-apex edge**

<a name="disjoint-apices-two-mixed-triangles-at-least-one-cross-apex-edge"></a>

Write $`P_1=\{p,q\}`$, $`P_2=\{r,s\}`$, and relabel a present cross edge as $`pr`$. Use

``` math
\begin{gathered}
Q = \{vpr,vac,vbd,abq,cds\}, \\
A = \{vp,vr,pr,ac,bd,aq,bq,cs,ds\}, \\
B = A\cup \{ab,cd\}
\end{gathered}
```

**(16)**

The first $`Q`$ triangle is old, which is allowed. Equality gives $`h-3`$ blocks, and $`W_0`$ is independent in $`J`$. Select faces avoiding $`W_0`$. The six-packing $`\{vpr,vac,abp,vbq,cdr,vds\}`$ is compatible: every edge touches $`W_0`$ except $`pr`$, and $`pr`$ was deleted. This contradicts critical packing.

**Common nine-cycle extraction and cross-apex matching**

<a name="common-nine-cycle-extraction-and-cross-apex-matching"></a>

For $`m=1`$ or 2 use

``` math
\begin{gathered}
Q = \{vac,abp,vbq,cdr,vds\}, \\
A = \{ac,ap,bp,bq,vq,cr,dr,ds,vs\}
\end{gathered}
```

**(17)**

The edge set A is the $`C_9`$ in order a-p-b-q-v-s-d-r-c-a. For $`m=1`$ let $`B=A \cup \{ab,cd\}`$; for $`m=2`$ let $`B=A \cup \{vb,cd\}`$. The second choice hits $`vbd`$ as well as the first restored base. Equality gives $`k=h-3`$ blocks in $`J`$.

If $`pr`$ is present, $`vpr`$ survives and forces a $`K_4`$ $`vprx`$ in $`J`$. Its fourth vertex is outside $`W=\{v,a,b,c,d,p,q,r,s\}`$: the terminals miss $`v`$, $`q`$ misses $`p`$, and $`s`$ misses $`r`$. Suppose $`ps`$ also exists. Swap $`r,s`$ in the extraction, obtaining a $`K_4`$ $`vpsy`$ in $`H`$ with $`y`$ outside $`W`$. Returning to the original $`J`$ removes exactly $`vs`$ from that $`K_4`$; $`vpy`$ and $`psy`$ survive and share $`py`$. Exhaustion forces them into one equality block, which would require missing edge $`vs`$. Contradiction. Exchanging families handles any shared endpoint, so the cross-apex graph is a matching of size at most two. This does not combine packings from distinct remainders; it combines two independently forced concrete subgraphs in $`H`$.

**Compatible faces and the remaining cases**

<a name="compatible-faces-and-the-remaining-cases"></a>

For the $`C_9`$ extraction let $`\mathcal F_{\mathrm{out}}`$ be lost $`H`$-triangles with a third vertex outside $`W`$. The graph consisting only of A and their W-to-outside spokes has **full** triangle family $`\mathcal F_{\mathrm{out}}`$: its base is $`C_9`$ and its outside part is independent. Outside-to-outside edges of $`H`$ are intentionally omitted and play no role in this family model.

The retained $`J`$ boundary contains $`vp,vr,aq,cs`$, all cross-apex edges, and possibly $`bd`$. The following compatibility checks are exhaustive except for the explicitly excluded $`qs`$ or $`bd`$ block:

- At most one $`W`$ vertex: choose the face avoiding $`W`$.

- A block $`vprx`$: exactness prevents $`x`$ adjoining $`a,b,c,d`$, because $`x`$ already adjoins $`v`$. Choose $`prx`$. No $`\mathcal F_{\mathrm{out}}`$ base is $`pr`$; possible conflicts on $`px`$ or $`rx`$ would require one of those forbidden terminal adjacencies.

- With $`pr`$ absent, a block $`vpxy`$ (or vrxy) has $`x,y`$ outside $`W`$. Exactness again forbids their adjacency to all four non-v terminals. Choose $`pxy`$ (or rxy). This covers the open-wedge case.

- A block $`aqxy`$ has $`x,y`$ outside $`W`$ and neither touches $`v`$ or $`b`$, by first-family exactness. Choose $`qxy`$. Its possible conflicts would require deleted bases $`qv`$ or $`qb`$ and hence a forbidden adjacency. The $`cs`$ case is symmetric.

For $`m=1`$ and zero or one cross edge, $`H[W]`$ has no lost internal triangle (the possible $`vpr`$ survives). Every block is compatible, so $`\nu(\mathcal F_{\mathrm{out}})\le 3`$. Lemma [12.1](#lem-cycle-pages) gives $`\tau(\mathcal F_{\mathrm{out}})\le 3`$ and hence $`\tau(H)\le 2k+3=2h-3`$, contradiction.

For $`m=1`$ and cross matching $`pr,qs`$, the only lost internal triangle is $`vqs`$. At most one equality block contains $`qs`$. If such a block exists, omit it to get $`\nu(\mathcal F_{\mathrm{out}})\le 4`$. The exceptional pure wheel is impossible, because its outside apex would be adjacent to $`v,a,b`$ and thus be an extra first-family apex. Therefore $`\tau(\mathcal F_{\mathrm{out}})\le 4`$. A minimum $`J`$-cover can contain $`qs`$: choose $`qs`$ and its opposite edge in that block and opposite pairs in all others. It also covers $`vqs`$. Total cover at most $`2k+4=2h-2`$ contradicts slack one. If $`qs`$ belongs to no block, all $`k`$ faces are compatible, $`\tau(\mathcal F_{\mathrm{out}})\le 3`$, and adding $`qs`$ gives the same contradiction.

For $`m=2`$ and no cross-apex edge, $`H[W]`$ is triangle-free. All lost triangles are $`\mathcal F_{\mathrm{out}}`$. Every equality block is compatible except possibly one containing $`bd`$. Omit it if present to obtain $`\nu(\mathcal F_{\mathrm{out}})\le 4`$; the wheel is again excluded by exactness. A $`J`$-cover plus at most four $`\mathcal F_{\mathrm{out}}`$ edges gives $`2h-2`$, contradiction. If there is no exceptional block, the stronger three-packing bound is available.

These branches exhaust the theorem: shared apices; disjoint apices with $`m=2`$ and a cross edge; disjoint apices with $`m=1`$ and cross matching of size 0,1,2; disjoint apices with $`m=2`$ and no cross edge.

$`\square`$

## 13. Exact parameterized compression

<a name="sec-compression"></a>

**Theorem 13.1 (Simultaneous compression).**

<a name="thm-compression"></a>

Let $`H`$ be finite simple, $`\nu(H)=h`$, and $`\nu(H-e)=h`$ for every $`e`$ in $`E(H)`$. Add six absent edges forming two edge-disjoint triangles to obtain $`G`$; let $`S`$ be their endpoints, $`|S|\le 6`$. There exists a **subgraph**, not necessarily an induced subgraph, $`G'`$ containing all added edges. With $`H'`$ equal to $`G'`$ minus those six edges,

``` math
\begin{gathered}
\nu(G')=\nu(G), \tau(G')=\tau(G), \\
\nu(H')=\nu(H), \tau(H')=\tau(H), \\
|V(G')| \le  6h^2+3h+454
\end{gathered}
```

**(18)**

$`H'`$ remains packing-edge-stable. If $`\mathcal D(H)`$ is 3-partite, so is $`\mathcal D(H')`$. More precisely, the nonisolated part of the old full triangle hypergraph is retained unchanged; deleted old graph edges are triangle-free hypergraph vertices. No claim of preserving the whole graph, induced structure, all covers, or all packings as literal subsets is made.

*Proof.*

For an edge $`ab`$, use an $`h`$-packing avoiding $`ab`$, available by stability. Every page $`abx`$ must meet this packing or could be appended. A packing triangle avoids $`ab`$ and therefore contains at most one of $`a,b`$; it can meet at most two distinct pages via its incident edges at that endpoint. Hence every $`H`$-edge lies in at most $`2h`$ triangles.

Fix any maximum $`h`$-packing $`P`$. Every $`H`$-triangle meets one of its $`3h`$ edges. Counting incidences bounds the number of triangles by $`6h^2`$. Every such triangle has at least two vertices in $`V(P)`$, so the set A of all old-triangle vertices has size at most $`3h+6h^2`$. This includes $`h=0`$, when A is empty.

Retain $`A \cup S`$. An outside vertex $`w`$ belongs to no old triangle. Any $`G`$-triangle through $`w`$ must use an added edge, which has both endpoints in $`S`$. Thus every edge incident to $`w`$ except an edge to $`S`$ lies in no $`G`$-triangle; remove all those edges. The remaining triangles through $`w`$ are exactly pages $`wxy`$ on added bases with $`x,y`$ in its exact S-neighborhood. Classify outside vertices by that neighborhood. There are at most $`2^6=64`$ types. Keep at most seven vertices per type, yielding

``` math
\begin{gathered}
|A|+|S|+7\cdot 64 \le  6h^2+3h+454
\end{gathered}
```

**(19)**

All old triangles survive, so both old optimization parameters remain equal. For any retained old edge $`e`$, its old triangle incidence is unchanged; an $`h`$-packing avoiding $`e`$ still lies wholly within A. Hence old packing-edge stability is preserved, including retained triangle-free edges. Tripartiteness restricts directly.

Any $`G`$-packing has at most six new triangles, since each consumes a distinct one of the six added edges. It therefore uses at most six distinct outside vertices. Within each truncated type injectively relabel the used outside vertices to retained representatives, fixing $`A \cup S`$. Neighborhood equality preserves triangles; injectivity preserves graph-edge disjointness. This sends every $`G`$-packing to a G’-packing of the same size; the reverse inequality follows from subgraph inclusion.

For covers, take a minimum G’-cover $`C`$ and any truncated type with seven retained vertices $`W_N`$. Let $`D_N`$ be the added bases whose endpoints lie in its common neighborhood, $`|D_N|\le 6`$. If some $`xy`$ in $`D_N`$ were absent from $`C`$, each of the seven pages $`wxy`$ would require a distinct incident spoke $`wx`$ or $`wy`$ in $`C`$. Thus $`C`$ has at least seven edges incident with $`W_N`$. Replace all $`C`$ edges incident with $`W_N`$ by $`D_N`$. No other triangle loses coverage, because every triangle using a $`W_N`$ edge is one of its added-base pages. This yields a smaller cover, contradiction. Hence $`C`$ contains every $`D_N`$, so the same $`C`$ also covers all deleted vertices’ pages. Therefore $`\tau(G)\le \tau(G')`$, and subgraph monotonicity gives equality.

$`\square`$

## 14. A fixed-deficit density consequence

<a name="sec-density"></a>

The following is a derived corollary using the proof of Liu–Zeng \[[12](#reference-12)\], not a theorem quoted from their preprint. We give the modified estimates and the small-packing argument in detail, identifying the unchanged inputs. This section has not been formalized in Lean.

**Corollary 14.1 (Adaptation of Liu–Zeng).**

<a name="cor-density"></a>

For every fixed real $`c\lt 5/2`$ there exists $`N(c)`$ such that, for every integer $`n\ge N(c)`$ and every $`n`$-vertex graph $`G`$, $`e(G)\ge n^2/4-cn`$ implies $`\tau(G)\le2\nu(G)`$.

**Imported approximation and elementary estimates.** Let $`\nu^*(G)`$ be the fractional triangle-packing optimum. We use $`\nu^*(G)-\nu(G)=o(n^2)`$, due to Haxell–Rödl \[[10](#reference-10)\]; alternatively Yuster’s Theorem 1.2 \[[15](#reference-15)\], with graph family $`\{K_3\}`$, suffices. Removing isolates leaves both optima unchanged. If the remaining order is large, its $`o(m^2)`$ error is bounded by the desired error in $`n^2`$; if bounded, its whole fractional optimum is a fixed constant. This handles Yuster’s convention excluding isolated vertices. Finite linear-programming duality identifies $`\nu^*`$ with the fractional edge-cover optimum.

We also use Liu–Zeng Lemma 2.4: if $`S\subseteq E(J)`$ has at most one edge per triangle, $`C=E(J)\setminus S`$, and $`|C|\ge\beta n^2`$ for $`0\lt \beta\lt 1/2`$, then

<a name="eq-saving"></a>

``` math
\tau(J)\le |C|-\beta^3n^2/36.
```

**(20)**

This lemma has no density-deficit parameter. Their proof deletes a suitable cut complement, starting from $`\tau(J)\le|C|-e_C(A,B)+e_S(A)+e_S(B)`$ for disjoint $`A,B`$. Its independent-neighborhood partition gives savings at least $`\beta^3n^2/6`$, $`\beta^3n^2/36`$, or $`\beta n^2/24`$ according to the location of a large class of $`C`$-edges. Thus the common constant in [(20)](#eq-saving) remains unchanged here.

*Proof of Corollary [14.1](#cor-density).*

It suffices to treat $`0\le c\lt 5/2`$, since a negative $`c`$ has a stronger hypothesis than $`c=0`$. Put $`k=\nu(G)`$, $`t=\tau(G)`$ and take $`n`$ sufficiently large, as specified below.

**Large packing: $`k\ge10^{-5}n^2`$.** This is Liu–Zeng’s Section 3, Case 1, unchanged: it uses no edge-count assumption or bound on $`c`$. Here is its quantitative core. If $`t>2k`$, choose the approximation error at most $`10^{-18}n^2`$ and write $`d=\nu^*(G)-t/2`$. The fractional-cover threshold argument in their equations (2)–(6), applied to weights in decreasing order, gives $`0\le d\lt 10^{-18}n^2`$. Partition the edges into $`L,M,F`$ according as their weights lie in $`[0,1/6)`$, $`[1/6,2/3)`$, $`[2/3,1]`$. The same argument gives

<a name="eq-large"></a>

``` math
|F|+|M|-t\le12d,\qquad |F|\le6d,\qquad |M|>10^{-5}n^2.
```

**(21)**

For precision, the threshold inequalities are $`2f_i+f_{2t+1-i}\ge1`$ for $`1\le i\le t`$; summing bounds the weight after the first $`t`$ edges by $`2d`$, and clipping weights at $`1/2`$ bounds their total excess by $`d`$. These yield [(21)](#eq-large) exactly as in the cited case. A triangle in $`G-F`$ cannot have two $`L`$-edges, since their weights together with the third weight would sum to less than one. Apply [(20)](#eq-saving) with $`\beta=10^{-5}`$ to obtain

<a name="eq-contradiction"></a>

``` math
t\le |F|+|M|-10^{-15}n^2/36 \lt t+(12\cdot10^{-18}-10^{-15}/36)n^2\lt t,
```

**(22)**

a contradiction. All inputs to this case are independent of $`c`$.

**A triangle-free decomposition.** For subsequent cases let $`H`$ be triangle-free and put $`\delta=n^2/4-e(H)`$, where $`0\le\delta\le10^{-4}n^2`$. Take a maximum-degree vertex of degree $`q`$, set $`V_1=N_H(v)`$ and $`V_2=V(H)\setminus V_1`$. Since $`V_1`$ is independent, $`e(H)+e_H(V_2)\le q(n-q)\le n^2/4`$. The number of missing cross pairs is at most $`2\delta`$, and each part differs from $`n/2`$ by at most $`\sqrt{2\delta}`$. Remove into $`A`$ every vertex missing more than $`n/5`$ neighbors in the other part; put $`B=V_1\setminus A`$, $`C=V_2\setminus A`$. Counting missing pairs twice gives

<a name="eq-decomposition"></a>

``` math
|A|\le20\delta/n\le n/500,\quad |B|,|C|>9n/20.
```

**(23)**

Every distinct pair in $`B`$ has more than $`n/20`$ common $`H`$-neighbors in $`C`$, and conversely. Hence $`B,C`$ are independent in $`H`$ and the missing $`B,C`$-pairs number at most $`2\delta`$. These are Liu–Zeng’s equations (7)–(13), with the deficit retained explicitly.

**Intermediate packing: $`n^{2/3}\lt k\lt 10^{-5}n^2`$.** Remove a maximum packing $`\mathcal P`$ to form $`H`$. Then

<a name="eq-delta"></a>

``` math
0\le\delta\le cn+3k\le3n+3k\le10^{-4}n^2
```

**(24)**

eventually. The replacement of $`2n`$ by $`3n`$ is the first change to the source. Use the preceding decomposition. For $`x\in A`$, augment its $`H`$-neighbors in $`B`$ by the two vertices of each packing triangle $`xbb'`$; call this set $`L_x`$. Define $`R_x`$ analogously on $`C`$. There is no $`H`$-edge from $`L_x`$ to $`R_x`$. To see the exchange when such an edge $`bc`$ exists, if both $`xb,xc`$ are $`H`$-edges there is a triangle in $`H`$. If $`xbb'`$ is packed and $`xc`$ is in $`H`$, replace $`xbb'`$ by $`xbc`$ and $`bb'z`$, choosing a common $`H`$-neighbor $`z\in C`$ of $`b,b'`$ with $`z\ne c`$. The symmetric case is identical. If $`xbb'`$ and $`xcc'`$ are both packed, replace them by $`xbc,bb'z,cc'w`$, where $`z\in C\setminus\{c,c'\}`$ and $`w\in B\setminus\{b,b'\}`$ are appropriate common $`H`$-neighbors. The $`n/20`$ lower bounds permit these choices. The inserted triangles are edge-disjoint, and their new edges lie in $`H`$, so none meets a retained packing triangle. A packed triangle entirely in $`B`$ or $`C`$ similarly has a one-to-two exchange using two distinct common neighbors.

Place each $`x\in A`$ on the side of the smaller of $`L_x,R_x`$. Their product counts missing $`B,C`$-pairs, so its smaller size is at most $`\sqrt{2\delta}`$. A packed triangle contributes one internal edge, plus two if all its vertices lie on one side. The extra contributions from triangles meeting $`A`$ once are already counted by the augmented sets. Let $`Q`$ be the wholly internal packed triangles meeting $`A`$ at least twice. They can be charged to distinct edges on $`A`$ outside $`H`$. Thus the internal $`H`$-edges on $`A`$ plus $`|Q|`$ number at most $`\binom{|A|}{2}`$, and these edges plus $`2|Q|`$ number at most $`|A|^2`$. Deleting all internal edges therefore gives $`t\le k+|A|\sqrt{2\delta}+|A|^2`$, hence

<a name="eq-middle"></a>

``` math
t\le k+\frac{20\sqrt2}{n}\delta^{3/2}+\frac{400}{n^2}\delta^2.
```

**(25)**

Using $`(a+b)^{3/2}\le\sqrt2(a^{3/2}+b^{3/2})`$, $`(a+b)^2\le2(a^2+b^2)`$, and [(24)](#eq-delta), we obtain

<a name="eq-margin"></a>

``` math
\begin{aligned}
\frac{t-k}{k}\le{}&120\sqrt3\,n^{-1/6}
 +120\sqrt{3\cdot10^{-5}}\\
 &+7200n^{-2/3}+7200\cdot10^{-5}\lt 1
\end{aligned}
```

**(26)**

eventually. The two constant terms sum to approximately $`0.729267069`$. For example $`n\ge10^{18}`$ suffices for this estimate and the elementary size conditions here. This proves $`t\le2k`$ in the intermediate case.

**Small packing: $`k\le n^{2/3}`$, including equality.** Choose a spanning subgraph $`G'`$ with the fewest edges subject to $`e(G)-e(G')=k-k'`$, where $`k'=\nu(G')`$. Such a graph exists since $`G`$ qualifies, and

<a name="eq-restore"></a>

``` math
\tau(G)\le k-k'+\tau(G').
```

**(27)**

Every edge of $`G'`$ has codegree at most $`2k'`$. Indeed, if $`uv`$ had more common neighbors, any packing in $`G'-uv`$ rules out at most two such neighbors per packed triangle. One further page $`uvw`$ extends it, forcing $`\nu(G'-uv)=k'-1`$. This would contradict the edge-minimal choice of $`G'`$ (Liu–Zeng Lemma 2.5). If $`k'=0`$, [(27)](#eq-restore) settles the claim. Otherwise remove a maximum packing from $`G'`$ to obtain a triangle-free $`H`$ with

<a name="eq-small-deficit"></a>

``` math
e(H)=e(G)-k-2k'\ge n^2/4-cn-3k\ge n^2/4-5n
```

**(28)**

eventually. Thus the source’s constant $`5n`$ is unchanged for $`c\lt 5/2`$. The decomposition gives $`|A|\le100`$. Since $`n/20>2k'`$ eventually, its common-neighbor property and the codegree bound make $`B,C`$ independent even in $`G'`$.

Place each $`x\in A`$ on the side with fewer $`H`$-neighbors. Their product is at most $`10n`$, since all pairs between these neighbor sets are missing cross pairs. The resulting parts $`X,Y`$ satisfy

<a name="eq-small-partition"></a>

``` math
\begin{aligned}
\bigl||X|-n/2\bigr|,\ \bigl||Y|-n/2\bigr|&\le\sqrt{10n}+100,\\
e_{G'}(X)+e_{G'}(Y)&\le4950+100\sqrt{10n}+3k'.
\end{aligned}
```

**(29)**

The first term $`4950`$ bounds edges inside $`A`$; at most $`100\sqrt{10n}`$ internal $`H`$-edges meet its complement, and all remaining edges removed in forming $`H`$ number $`3k'`$.

Let $`S_1,S_2`$ be minimum vertex covers of the internal graphs on $`X,Y`$, and write $`s=|S_1|+|S_2|\le100`$; the parts of $`A`$ themselves cover these graphs. The following finite-witness fact is Liu–Zeng Lemma 2.6. A graph with a vertex cover of size $`a`$ has an induced subgraph on at most $`a^2+2a`$ vertices with the same minimum vertex-cover number: retain the cover and up to $`a+1`$ outside neighbors of each cover vertex. A cover of the retained graph of size at most $`a`$ extends to the whole graph. Otherwise a missed cover vertex with an omitted neighbor would have $`a+1`$ retained neighbors, a contradiction. The assertion also holds for $`a=0`$. Apply this to get witnesses $`T_1\subseteq X,T_2\subseteq Y`$ with their respective vertex-cover numbers $`|S_1|,|S_2|`$ and $`|T_1|+|T_2|\le s^2+2s\le10200`$.

For $`y\in Y\setminus T_2`$, its nonneighbors in $`T_1`$, together with one endpoint of each edge among its neighbors in $`T_1`$, cover $`G'[T_1]`$. Summing and using the codegree bound gives at least

<a name="eq-missing"></a>

``` math
|S_1|(|Y|-|T_2|)-2k'e_{G'}(T_1)
```

**(30)**

missing pairs in $`T_1\times(Y\setminus T_2)`$. The symmetric count lies in $`(X\setminus T_1)\times T_2`$, a disjoint set of pairs. Use

<a name="eq-witness-numbers"></a>

``` math
\begin{aligned}
e_{G'}(T_1)+e_{G'}(T_2)&\le\binom{10200}{2}=52,014,900,\\
|S_1||T_2|+|S_2||T_1|&\le1,020,000.
\end{aligned}
```

**(31)**

Subtracting both missing-pair counts from $`|X||Y|\le n^2/4`$ and adding the internal edges from [(29)](#eq-small-partition) yields

<a name="eq-upper"></a>

``` math
e(G')\le\frac{n^2}{4}-\frac{s}{2}n
 +200\sqrt{10n}+1,034,950+104,029,803k'.
```

**(32)**

The constant terms are $`100s+1,020,000+4950\le1,034,950`$; the coefficient of $`k'`$ is $`2\cdot52,014,900+3`$. Compare with $`e(G')\ge n^2/4-cn-k+k'`$ and use $`k'\le k\le n^{2/3}`$ to obtain

<a name="eq-key"></a>

``` math
\left(\frac{s}{2}-c\right)n
\le104,029,803n^{2/3}+200\sqrt{10n}+1,034,950.
```

**(33)**

For $`n\ge1`$ the right side is less than $`106,000,000n^{2/3}`$. Put $`\varepsilon=5/2-c>0`$. If $`s\ge5`$, [(33)](#eq-key) is impossible for $`n>(106,000,000/\varepsilon)^3`$. Hence $`s\le4`$. Deleting $`S_1\cup S_2`$ makes $`G'`$ bipartite. Corollary [4.3](#cor-oct) gives $`\tau(G')\le2k'`$, and [(27)](#eq-restore) gives $`\tau(G)\le k+k'\le2k`$.

One sufficient $`N(c)`$ is the maximum of $`10^{18}`$, the threshold for the imported fractional approximation with error $`10^{-18}n^2`$, and an integer strictly exceeding $`(106,000,000/(5/2-c))^3`$. For $`c\lt 0`$ use $`N(0)`$. No numerical threshold for the deep approximation is asserted. The strict positivity of $`5/2-c`$ is essential to the last step: this proof establishes neither the endpoint $`c=5/2`$ nor a threshold uniform as $`c`$ approaches it. This completes the adaptation.

$`\square`$

## 15. Verification, evidence and open questions

<a name="sec-verification"></a>

### 15.1 Exact formal boundary

The archived projects use Lean 4.33.1 and pinned Mathlib dependencies. All graph triangles are actual three-cliques and all extremal values are actual finite packing maxima and cover minima. The following list maps the numbered statements to their completed declarations; identifiers are intentionally separated from prose to remain readable.

Theorem [2.1](#thm-main) and Corollary [4.3](#cor-oct).<br>
`Tuza.triangle_deletion`

`Tuza.oct_four`, with explicit AharoniInput and HNSInput.

Theorem [6.1](#thm-exact).<br>
`Tuza.two_triangle_exact_equality`, with HNSInput.

Theorem [7.2](#thm-essential).<br>
`Tuza.two_triangle_essential_edge_restoration`

`Tuza.two_triangle_essential_family_saving`, with AharoniInput and HNSInput.

Theorem [11.1](#thm-boundary).<br>
`Tuza.closed_boundary_equality_deletion`

`Tuza.closed_boundary_packing_loss`.

Inputs: AharoniInput, HNSInput and `BipartiteKonigInput (Finset V)`.

Theorem [11.2](#thm-stability).<br>
`Tuza.closed_boundary_stability`, with AharoniInput and HNSInput.

AharoniInput states the tripartite full-triangle bound. HNSInput supplies edge-disjoint graphical $`K_4`$s and packages both published home-base extraction and the graphical loose-cycle conversion in Lemma [3.2](#lem-k4). Those inputs, including that conversion, remain assumed in Lean. Classical bipartite König matching–cover equality \[[11](#reference-11)\] is an explicit input to the boundary integrality theorem; the triangle-to-pair conversion, injectivity, matching compatibility and cover conversion are proved. Hall’s matching theorem \[[6](#reference-6)\] is used through the pinned formal library in the essential-edge proof.

The transitive axiom reports contain only `propext`, `Classical.choice` and `Quot.sound`. They do not discharge explicit theorem parameters. The archived publication verification independently rebuilt the full public project from published sources: 18 modules, 17 serial kernel replays, and 152 declaration/axiom reports, using nine pinned compiled dependencies. This was not a cold Mathlib rebuild or an external independent prover check.

The flat, star-core, mixed/shared-apex bowtie and compression results, the separate four-spoke application, and the density consequence have audited ordinary proofs without corresponding full Lean formalization. The formal equality-bowtie case in Theorem [6.1](#thm-exact) is distinct from Theorem [12.2](#thm-bowtie).

### 15.2 Negative evidence and finite certificates

A wheel with five rim vertices and one hub has $`(\nu,\tau)=(2,3)`$ and a tripartite full triangle hypergraph. Deleting its hub leaves no triangles. It refutes the proposed inequality $`\tau(H)\le \nu(H)+\nu(H-U)`$ for independent $`U`$. It does not refute restoration.

A central $`K_4`$ with one, two, or three fresh $`K_4`$ leaves on distinct edges of a central star has parameters $`(r+1,2r+1)`$ and no packing-essential edge. These examples refute an overly small list of possible defective cores. The scoped restoration proofs for those three cores are retained as supporting TUZA-02 material.

The difference between individual and full incident families is substantive. Take $`K_5`$ on 0,1,2,3,4 and add edges 15 and 35, with restored triangles 012 and 034. The remainder and restored graph have parameters $`(1,1)`$ and $`(3,4)`$. The full incident families have cover number three, but the individual restoration families each have cover number one. An enlarged-family formulation is therefore false.

The archived verification replay regenerated all graph triangles and checked 35 recurrence certificates, the three star examples by a separate subset-enumeration implementation, their surviving packings after every single-edge deletion, and the family-definition example. An additional independent script checked 70 finite local packing/cover configurations used in the bowtie case proofs. These are named-certificate checks, not an exhaustive search over arbitrary graphs; the general theorems rest on their ordinary proofs.

### 15.3 Scope, originality and remaining questions

**Unrestricted two-triangle restoration, OCT-five and the fixed-$`c\lt 3`$ density extension remain unproved.** The density proof also establishes neither its endpoint $`c=5/2`$ nor a threshold uniform near that endpoint. General stable, nonflat, slack-one remainders remain outside the restoration theorems. Exact bowties with disjoint apices and no mixed triangle, and arbitrary individual families of packing three, are not settled here.

The compression theorem does not bound $`h`$ or reduce unrestricted restoration to one finite computation. Existing linear-size decision kernels for individual edge-triangle packing and covering \[[13](#reference-13)\] preclude an improved-kernel-size claim for this quadratic simultaneous-preservation argument. Fractional stability results \[[8](#reference-8)\] have a fractional-cover hypothesis and cannot be invoked from integer slack one.

This is AI-assisted research under the neutral attribution AI Math Experiments. Internal independent reconstruction and editorial review are not external specialist peer review. Targeted literature comparisons found no exact predecessor for selected statements, but historical originality and priority are not established. The exact-equality two-triangle extension originated in a follow-up preceding TUZA-02; the three campaigns retain separate provenance. The canonical paper integrates their accepted proofs without changing the archived statements or verification evidence.

## References

<a name="reference-1"></a>

**\[1\]** Ron Aharoni. Ryser’s conjecture for tripartite 3-graphs. *Combinatorica*, 21(1):1–4, 2001.

<a name="reference-2"></a>

**\[2\]** Ron Aharoni and Shira Zerbib. A generalization of Tuza’s conjecture. *Journal of Graph Theory*, 94(3):445–462, 2020. See also arXiv:1611.07497v7, Propositions 3.2 and 3.7.

<a name="reference-3"></a>

**\[3\]** S. Aparna Lakshmanan, Csilla Bujtás, and Zsolt Tuza. Small edge sets meeting all triangles of a graph. *Graphs and Combinatorics*, 28(3):381–392, 2012.

<a name="reference-4"></a>

**\[4\]** Maria Chudnovsky, Neil Robertson, Paul Seymour, and Robin Thomas. The strong perfect graph theorem. *Annals of Mathematics*, 164(1):51–229, 2006.

<a name="reference-5"></a>

**\[5\]** Qing Cui, Penny Haxell, and Will Ma. Packing and covering triangles in planar graphs. *Graphs and Combinatorics*, 25(6):817–824, 2009.

<a name="reference-6"></a>

**\[6\]** Philip Hall. On representatives of subsets. *Journal of the London Mathematical Society*, s1-10(1):26–30, 1935.

<a name="reference-7"></a>

**\[7\]** Penny Haxell, Alexandr Kostochka, and Stéphan Thomassé. Packing and covering triangles in $`K_4`$-free planar graphs. *Graphs and Combinatorics*, 28(5):653–662, 2012. Theorem 2 treats flat graphs without a planarity hypothesis.

<a name="reference-8"></a>

**\[8\]** Penny Haxell, Alexandr Kostochka, and Stéphan Thomassé. A stability theorem on fractional covering of triangles by edges. *European Journal of Combinatorics*, 33(5):799–806, 2012.

<a name="reference-9"></a>

**\[9\]** Penny Haxell, Lothar Narins, and Tibor Szabó. Extremal hypergraphs for Ryser’s conjecture. *Journal of Combinatorial Theory, Series A*, 158:492–547, 2018. Theorem numbering refers to the author manuscript dated 18 March 2018.

<a name="reference-10"></a>

**\[10\]** Penny E. Haxell and Vojtěch Rödl. Integer and fractional packings in dense graphs. *Combinatorica*, 21(1):13–38, 2001.

<a name="reference-11"></a>

**\[11\]** Dénes König. Graphok és mátrixok. *Matematikai és Fizikai Lapok*, 38:116–119, 1931. In Hungarian, with German summary.

<a name="reference-12"></a>

**\[12\]** Zhen Liu and Qinghou Zeng. Tuza’s conjecture under an edge-count condition, 2026. Preprint, arXiv:2610.15539v1, submitted 11 October 2026.

<a name="reference-13"></a>

**\[13\]** Zimo Sheng and Mingyu Xiao. A discharging method: Improved kernels for edge triangle packing and covering. In Weili Wu and Guangmo Tong, editors, *Computing and Combinatorics: COCOON 2023*, volume 14423 of *Lecture Notes in Computer Science*, pages 171–183, Cham, 2024. Springer. The source audit uses the preprint arXiv:2308.16515v1, submitted 31 August 2023.

<a name="reference-14"></a>

**\[14\]** Zsolt Tuza. A conjecture on triangles of graphs. *Graphs and Combinatorics*, 6(4):373–380, 1990.

<a name="reference-15"></a>

**\[15\]** Raphael Yuster. Integer and fractional packing of families of graphs. *Random Structures & Algorithms*, 26(1–2):110–118, 2005.
