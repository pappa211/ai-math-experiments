# Independent Validation V1 density audit (sanitized mathematical record)

Historical internal review, 27 October 2026 UTC. No external review or Lean verification is claimed.

## Verdict and exact quantifiers

**CONFIRMED as a mathematical implication from the named OCT-four input and the published fractional-packing approximation.** I found no missing implication in the density adaptation after independently checking the full argument. The justified conclusion is

\[
\forall c<\tfrac52\;\exists N(c)\;\forall n\ge N(c)\;\forall G:
\quad |V(G)|=n,\quad e(G)\ge n^2/4-cn
\ \Longrightarrow\ \tau(G)\le2\nu(G),
\]

for finite simple undirected graphs, with edge-disjoint triangle packing and edge triangle covering. The number \(c\) is fixed before \(n\) grows. The argument does **not** establish \(c=5/2\), a bound uniform as \(c\uparrow5/2\), or a varying \(c=c(n)\) without additional quantitative conditions.

There is one presentation correction to Phase 1: its small-packing case must read \(\nu(G)\le n^{2/3}\), including equality. Liu–Zeng's source already has the correct non-strict inequality. This is a repair to the summary's exhaustive case split, not a failure of the proof.

## Source and dependency record

The checked source is Zhen Liu and Qinghou Zeng, *Tuza's Conjecture under an Edge-Count Condition*, [arXiv:2610.15539v1](https://arxiv.org/html/2610.15539v1), submitted **11 October 2026, 11:29:15 UTC**. The [version history](https://arxiv.org/abs/2610.15539) still listed only v1 when checked during this audit. The archived HTML recorded in the existing source manifest has SHA-256 `c7975ab3b1845cb6f07d87a6699b74cb7995fd9f45e0cc06cdeb2a32ce6dc58d`.

| Input or source location | Exact role in the audited deduction |
|---|---|
| Liu–Zeng Theorem 1.3 | Their stated density threshold is fixed \(c<2\). The stronger threshold is a deduction from their proof, not a quotation of their theorem. |
| Liu–Zeng Lemma 2.1; Haxell–Rödl, *Integer and Fractional Packings in Dense Graphs*, Combinatorica 21 (2001), 13–38, [DOI](https://doi.org/10.1007/s004930170003) | For every \(\eta>0\), all sufficiently large graphs satisfy \(0\le\nu^*(G)-\nu(G)\le\eta n^2\). Only \(\eta=10^{-18}\) is needed. This deep published theorem is imported, not re-proved. The original paper's theorem number was not verified through the publisher's subscription-only full text. |
| Raphael Yuster, *Integer and fractional packing of families of graphs*, Random Structures & Algorithms 26 (2005), 110–118, [author manuscript](https://math.haifa.ac.il/raphy/papers/fracpack.pdf), Theorem 1.2, printed p. 2 | An independently proved, accessible alternative input: for every fixed graph family \(\mathcal F\), \(\nu^*_{\mathcal F}(G)-\nu_{\mathcal F}(G)=o(n^2)\). Take \(\mathcal F=\{K_3\}\). Its Theorem 1.1 on the same page restates Haxell–Rödl; that is **not** an assertion about numbering in Haxell–Rödl's original paper. |
| Finite linear-programming strong duality | The fractional triangle-packing optimum equals the fractional edge-cover optimum. Both problems are feasible, and the relevant optimum is finite. Cover weights can be capped at 1. |
| Liu–Zeng Lemmas 2.4, 2.5, 2.6; Section 3, equations (2)–(23) | Their elementary proofs and their uses were reconstructed below. These are not left as unaudited black boxes. |
| Named input **OCT4** | Every finite simple graph that becomes bipartite after deletion of at most four vertices satisfies \(\tau\le2\nu\). This replaces Lemma 2.7 only at the end of the small-packing case. |

Yuster's manuscript uses a convention excluding isolated vertices. This does not restrict the needed application. Delete the isolates, leaving \(m\) vertices without changing either packing optimum. For \(m\ge N_\eta\), the error is at most \(\eta m^2\le\eta n^2\). For \(m<N_\eta\), the fractional optimum is at most \(\binom{N_\eta}{2}/3\), a fixed constant absorbed by \(\eta n^2\) for sufficiently large \(n\). Thus the accessible Theorem 1.2 supports the exact needed statement for arbitrary finite simple graphs.

The modified density proof does not need Liu–Zeng's imported Haxell–Kohayakawa Theorem 2.3 or their original OCT-three Lemma 2.7. The four-colorable result and Krivelevich's mixed fractional bound are likewise not additional inputs to the density argument as reconstructed here; any dependencies in the separate proof of **OCT4** remain visible there.

## 1. Elementary preparatory checks

**Lemma 2.4, triangle-independent edges.** Let \(S\subseteq E(G)\) have at most one edge in every triangle and let \(C=E(G)\setminus S\). For disjoint vertex sets \(A,B\), retaining the \(S\)-edges outside the two internal edge sets and the \(C\)-edges across \(A,B\) leaves a triangle-free graph. Consequently

\[
\tau(G)\le |C|-e_C(A,B)+e_S(A)+e_S(B).
\]

The greedy construction of disjoint neighborhoods in the graph with edge set \(S\) yields independent sets \(A_i\) of size at least \(\beta n/2\), at most \(2/\beta\) of them, and a remainder \(W\) with \(e_S(W)\le\beta n^2/4\). Split the \(C\)-edges into edges between distinct \(A_i\), between the \(A_i\) and \(W\), and within \(W\). One category has at least \(\beta n^2/3\) edges. The respective savings are at least \(\beta^3n^2/6\), \(\beta^3n^2/36\), and \(\beta n^2/24\). The latter two follow by sampling a subset of \(W\) with probability \(\beta/3\), or a random bipartition of \(W\), respectively. Hence the stated common saving \(\beta^3n^2/36\) is valid for \(0<\beta<1/2\). Empty categories and an empty remainder cause no exception.

**Lemma 2.5, deleting an edge of large codegree.** A packing in \(G-uv\) uses at most two edges incident with \(u\) or \(v\) per triangle: no such triangle contains both endpoints. If their common-neighbor set has more than \(2\nu(G)\) elements, some page \(uvw\) avoids this packing. Adding it proves \(\nu(G-uv)=\nu(G)-1\); adding the edge \(uv\) to a cover of \(G-uv\) covers \(G\). The argument counts forbidden common neighbors, not incident vertices with multiplicity incorrectly.

**Lemma 2.6, finite witness for vertex-cover number.** From a vertex cover \(V_1\), retain up to \(|V_1|+1\) outside neighbors of each of its vertices. In the resulting induced graph on \(V_2\), \(|V_2|\le|V_1|^2+2|V_1|\). A cover of size at most \(|V_1|\) missing a vertex \(x\in V_1\) must contain all retained neighbors of \(x\); if it failed to cover an edge outside \(V_2\), there would be \(|V_1|+1\) such retained neighbors, a contradiction. Overlaps among the retained sets are harmless. The case \(V_1=\varnothing\) also works.

## 2. Large packing: no dependence on \(c\)

Write \(k=\nu(G)\), \(t=\tau(G)\), and assume \(k\ge10^{-5}n^2\) but \(t>2k\). Let \(f_1\ge\cdots\ge f_m\) be optimal fractional-cover weights. For \(0\le s\le1/3\), let \(Z_s\) contain weights below \(s\) and \(S_s\) weights at least \((1-s)/2\). A triangle containing a \(Z_s\)-edge must contain an \(S_s\)-edge. A cut through the remaining edges, together with \(Z_s\), is triangle-free, giving

\[
t\le(m+|S_s|-|Z_s|)/2.
\]

The ordinary cut bound ensures \(2t\le m\); the fractional-cover condition ensures \(f_t\ge1/3\). A threshold between \(f_{2t+1-i}\) and \(1-2f_i\) would contradict the displayed cover bound, so

\[
2f_i+f_{2t+1-i}\ge1\quad(1\le i\le t).
\]

Set \(d=\nu^*(G)-t/2\). Summation gives \(\sum_{i>t}f_i\le2d\), and clipping all weights at \(1/2\) gives \(\sum_e(f(e)-1/2)_+\le d\). In particular \(0\le d<10^{-18}n^2\). Partition the edges by weights into \(L:[0,1/6)\), \(M:[1/6,2/3)\), and \(F:[2/3,1]\). Then

\[
|F|+|M|-t\le12d,\qquad |F|\le6d,
\qquad |M|>10^{-5}n^2.
\]

Two \(L\)-edges cannot lie in a triangle of \(G-F\), since its total weight would be below 1. The checked Lemma 2.4 applied to \(G-F\) therefore gives

\[
t\le |F|+|M|-10^{-15}n^2/36
<t+(12\cdot10^{-18}-10^{-15}/36)n^2<t.
\]

All threshold endpoints, indexing, and strict inequalities above are valid. No density assumption or restriction on \(c\) occurs in this case.

## 3. Dense triangle-free decomposition

For a triangle-free spanning graph \(H\), write \(\delta=n^2/4-e(H)\) and suppose \(0\le\delta\le10^{-4}n^2\). Take a maximum-degree vertex of degree \(d\), let \(V_1\) be its neighborhood, and let \(V_2\) be the complement. Since \(V_1\) is independent,

\[
e(H)+e_H(V_2)\le d(n-d)\le n^2/4.
\]

Thus the number \(M\) of missing pairs across \(V_1,V_2\) is at most \(2\delta\), and both part sizes differ from \(n/2\) by at most \(\sqrt{2\delta}\). Let \(A\) be the vertices missing more than \(n/5\) neighbors across that partition, with \(B=V_1\setminus A\) and \(C=V_2\setminus A\). Counting missing pairs twice gives

\[
|A|\le10M/n\le20\delta/n\le n/500.
\]

Both \(B,C\) have more than \(9n/20\) vertices. Each distinct pair within one has more than \(n/20\) common neighbors in the other. Consequently \(B,C\) are independent in \(H\), and the missing pairs across them number at most \(2\delta\). These reproduce precisely the properties used from equations (7)–(13), with no regularity or stability theorem left implicit.

## 4. Intermediate packing

Assume \(n^{2/3}<k<10^{-5}n^2\). Delete the edges of a maximum packing \(\mathcal P\) to obtain \(H\). For \(0\le c<5/2\),

\[
0\le\delta\le cn+3k\le3n+3k\le10^{-4}n^2
\]

once \(n\) is sufficiently large. Use the preceding decomposition.

For \(x\in A\), augment its \(H\)-neighbors in \(B\) by the two \(B\)-vertices of every packing triangle \(xbb'\), obtaining \(L_x\); define \(R_x\) on \(C\) analogously. There is no \(H\)-edge between \(L_x\) and \(R_x\). I checked all three possibilities for \(xb,xc\): if both are in \(H\) they form a forbidden triangle; if exactly one is, replace one packed triangle by two; if neither is, replace two by three. The common-neighbor bounds allow the auxiliary vertices to avoid one or two forbidden choices, and the newly inserted triangles are pairwise edge-disjoint and disjoint from every retained packed triangle. A packed triangle entirely in \(B\) or entirely in \(C\) similarly permits a one-to-two exchange and is impossible.

Put each \(x\in A\) on the side of the smaller of \(L_x,R_x\). Its contribution is bounded by \(\sqrt{|L_x||R_x|}\), and \(|L_x||R_x|\) is at most the number of missing \(B,C\)-pairs. Every packed triangle contributes one internal edge, with two extra edges only if it lies wholly on one side. The extra contributions of triangles meeting \(A\) once are exactly counted by the augmented neighbor sets. A triangle meeting \(A\) at least twice can be charged to a distinct edge inside \(A\) absent from \(H\). This proves, without double-counting,

\[
\tau(G)\le k+\frac{20\sqrt2}{n}\delta^{3/2}
                 +\frac{400}{n^2}\delta^2.
\]

Using \(\delta\le3n+3k\), convexity yields

\[
\frac{\tau(G)-k}{k}
\le120\sqrt3\,n^{-1/6}
 +120\sqrt{3\cdot10^{-5}}
 +7200n^{-2/3}+7200\cdot10^{-5}<1
\]

for all sufficiently large \(n\). The constant terms total approximately **0.7292670690**, leaving a positive margin. For example \(n\ge10^{18}\) is more than sufficient for this numerical step and every elementary size requirement in this and the next case. This is only a convenient crude bound; the fractional-approximation threshold remains an additional requirement.

## 5. Small packing, including the boundary

Assume \(k\le n^{2/3}\). Choose a spanning subgraph \(G'\) with the fewest edges such that

\[
e(G)-e(G')=k-k',\qquad k'=\nu(G').
\]

Existence is immediate because \(G\) qualifies. Lemma 2.5 forces every edge of \(G'\) to have codegree at most \(2k'\). Also

\[
\tau(G)\le k-k'+\tau(G'). \tag{A}
\]

If \(k'=0\), (A) settles the theorem. Otherwise remove a maximum packing from \(G'\), producing a triangle-free graph \(H\) with

\[
e(H)=e(G)-k-2k'\ge n^2/4-cn-3k\ge n^2/4-5n
\]

for sufficiently large \(n\), uniformly for \(0\le c<5/2\). The decomposition above has \(|A|\le100\). The common-neighbor lower bound \(n/20\) exceeds \(2k'\) for sufficiently large \(n\), so \(B,C\) are independent in **\(G'\)**, not merely in \(H\).

Place each \(x\in A\) on the side where it has fewer \(H\)-neighbors. Triangle-freeness bounds the product of its two neighbor counts by \(10n\). The resulting partition \(X,Y\) satisfies

\[
\bigl||X|-n/2\bigr|,\ \bigl||Y|-n/2\bigr|
 \le\sqrt{10n}+100,
\]
\[
e_{G'}(X)+e_{G'}(Y)\le4950+100\sqrt{10n}+3k'. \tag{B}
\]

Choose minimum vertex covers \(S_1,S_2\) of the two internal graphs and put \(s=|S_1|+|S_2|\le100\). By Lemma 2.6 there are induced witness sets \(T_1\subseteq X,T_2\subseteq Y\), with \(|T_1|+|T_2|\le10200\), whose vertex-cover numbers are respectively \(|S_1|,|S_2|\).

For each \(y\in Y\setminus T_2\), its nonneighbors in \(T_1\), supplemented by one endpoint of each edge among its neighbors in \(T_1\), cover \(G'[T_1]\). Summing, the codegree bound gives at least

\[
|S_1|(|Y|-|T_2|)-2k'e_{G'}(T_1)
\]

missing pairs in \(T_1\times(Y\setminus T_2)\). The symmetric count is in \((X\setminus T_1)\times T_2\), so the two counts are disjoint. In particular no factor of two is lost or gained by overlapping counted pairs.

Here is an explicit replacement for the source's final \(O\)-term. We have

\[
e_{G'}(T_1)+e_{G'}(T_2)\le\binom{10200}{2}=52,014,900,
\]
\[
|S_1||T_2|+|S_2||T_1|\le1,020,000.
\]

Using these inequalities, the balance bound, and (B),

\[
e(G')\le\frac{n^2}{4}-\frac{s}{2}n
 +200\sqrt{10n}+1,034,950+104,029,803k'.
\]

On the other hand,

\[
e(G')\ge n^2/4-cn-k+k'.
\]

Comparison, followed by \(k'\le k\le n^{2/3}\), gives

\[
\boxed{\left(\frac{s}{2}-c\right)n
\le104,029,803n^{2/3}+200\sqrt{10n}+1,034,950.} \tag{C}
\]

For \(n\ge1\), the right side is less than \(106,000,000n^{2/3}\). Let \(\varepsilon=5/2-c>0\). If \(s\ge5\), (C) is impossible once \(n>(106,000,000/\varepsilon)^3\). Hence \(s\le4\). Deleting \(S_1\cup S_2\) from \(G'\) leaves the bipartite graph with parts \(X\setminus S_1,Y\setminus S_2\). The named input **OCT4** therefore gives \(\tau(G')\le2k'\), and (A) yields

\[
\tau(G)\le k+k'\le2k.
\]

For negative \(c\), the hypothesis implies the hypothesis with \(c=0\), so the latter result suffices. For \(0\le c<5/2\), one valid sufficient order threshold is the maximum of the fractional-approximation threshold for \(10^{-18}\), \(10^{18}\), and any integer strictly exceeding \((106,000,000/(5/2-c))^3\). No numerical value for the deep fractional-approximation threshold is claimed.

## Limits of this audit

This is an independent mathematical check of the deduction, not external specialist certification, a novelty determination, or formal verification. The published fractional-packing approximation remains an imported theorem; **OCT4** is conditional within this note and must be supported by the separate primary-theorem audit. No counterexample or fundamental gap was found. The small-case estimate explains exactly why the strict threshold increases from 2 to 5/2 and exactly why its endpoint is not covered.
