# EFR near-quadratic incidence amplification: primary-source and implication audit

Status: PASS for primary-source applicability and the fixed power-saving implication; attribution of the Tuza corollary remains unresolved. This is ordinary mathematical reconstruction and AI review, not human or formal verification. No producer checker was consulted and no graph census was run.

Original mission clock: start 2026-11-15T01:53:58Z; research cutoff 09:23:58Z; hard deadline 09:53:58Z. All PDF retention and inspection occurred locally on Darwin. Requested Astra/Ultra; actual serving model/effort are not exposed. This audit began from root's stated construction and public primary source, before a frozen new producer proof was supplied.

## Primary source and retained identity

P. Erdős, P. Frankl and V. Rödl, *The asymptotic number of graphs not containing a fixed subgraph and a problem for hypergraphs having no exponent*, Graphs and Combinatorics **2** (1986), 113–121, [DOI 10.1007/BF01788085](https://doi.org/10.1007/BF01788085). Theorem 1.7 is on printed pp.114–115; Section 5, Lemma 5.1 and its arithmetic-progression construction are on pp.117–118. [Primary PDF](https://users.renyi.hu/~p_erdos/1986-17.pdf).

Retained PDF: `sources/efr_power_saving/erdos_frankl_rodl_1986.pdf`, SHA256 `81e2c6b4b8fd3378bc7139f90ce64b2aa0bf8d3dac5bcef470dcfcf4ff6f5ba9`, 1,331,159 bytes. Receipt: `evidence/efr_power_saving/pdf_receipt.json`. Physical pages 1,2,3,5,6 were rendered and visually inspected; their PNGs and a text extraction are retained alongside the PDF. The scan's first running header literally says 1968, but its copyright, submission/revision dates and publisher metadata establish 1986. The top of printed p.115 is degraded; the publisher abstract corroborates the super-polynomial-exponent statement.

The paper defines g_N(v,e,r) by forbidding e blocks whose union has at most v vertices. Theorem 1.7 gives g_N(3r−3,3,r)=o(N²), yet growth faster than N^c for every fixed c<2. Section 5 supplies the stronger quantitative lower bound used here. Its construction is explicitly linear. The r=3 antecedent is credited to Ruzsa–Szemerédi (1978); the slope-set lemma is based on Behrend's method (1946). Accordingly, the incidence construction is classical, not a new TUZA-19 theorem.

## Independent applicability reconstruction

Fix r≥3. Use a slope set A⊆[L] with |A|≥L exp(−O_r(sqrt(log L))) and no three distinct elements in the prohibited short arithmetic progression. Such a set can be obtained from equal-norm digit vectors in a sufficiently large base: a positive weighted average of two different equal-norm vectors has smaller squared norm, and the base prevents carrying. The same argument directly forbids the weighted three-term equations needed below.

Take r parts indexed 0,…,r−1, each containing the integers 1,…,m. Set L=floor(m/(2(r−1))). For every a∈A and 1≤x≤floor(m/2), include the block

    P(x,a) = {(i,x+ia): 0≤i<r}.

All coordinates lie in their respective parts. The number b of blocks satisfies

    b = floor(m/2)|A| ≥ N² exp(−C_r sqrt(log N))

for sufficiently large N, after taking m=floor(N/r), absorbing fixed factors into C_r, and retaining isolated vertices to make the ambient order exactly N.

Two blocks meeting in different parts i and j satisfy x+ia=y+ib and x+ja=y+jb, so a=b and x=y. Thus distinct blocks meet in at most one point. This linearity must be taken from the construction: the bare forbidden-three-union condition in Theorem 1.7 does not itself assert it.

Suppose three distinct blocks formed a Berge triangle. Their three intersection points belong to distinct parts i,j,k: a single block has only one point in each part. Writing the pairwise intersection equations and eliminating starts gives

    (i−j)a + (k−i)b = (k−j)c.

The slopes are pairwise distinct, since intersecting equal-slope blocks coincide. After ordering i,j,k, the equation expresses one slope as a positive weighted average of the other two, with positive integral coefficients whose sum is at most r−1. This contradicts the slope-set property. Equivalently, linearity makes a Berge triangle have union size 3r−3, forbidden by the source construction. Three blocks sharing only one common point have union size 3r−2 and are allowed; they are not a Berge triangle.

Now label the r vertices of an arbitrary fixed graph F by the r parts and place F on every block. Every graph edge belongs to one block by linearity. Every graph triangle also belongs to one block: if two of its edges have the same owner, all three vertices lie in that block, and an edge owned elsewhere would give two shared points. If its three edges have distinct owners, those owners form a Berge triangle. Therefore the triangle hypergraph is an edge-disjoint union of b copies of the triangle hypergraph of F, even though graph vertices can be shared. Consequently

    τ(H_N)=bτ(F),       ν(H_N)=bν(F).

Isolates of F or the ambient incidence system cause no problem. Connectivity is unnecessary for this implication. The construction does not promise arbitrary additional properties beyond ones separately proved to pass through triangle ownership.

## Exact quantifiers for the Tuza corollary

For each fixed ε>0, the assertion that there are constants C<∞ and N₀ such that every graph G of order n≥N₀ satisfies

    τ(G) ≤ 2ν(G)+C n^(2−ε)

is equivalent to unrestricted Tuza. One may assume C≥0. The forward implication is immediate with C=0. Conversely, if a fixed graph F has defect δ=τ(F)−2ν(F)>0, its incidence amplifications have defect bδ. For sufficiently large N,

    bδ / N^(2−ε) ≥ δ exp(ε log N−C_r sqrt(log N)) → ∞,

contradicting the alleged uniform constant C. The constants in the construction may depend on the fixed F; ε,C,N₀ in the assumed bound may not depend on the tested graph. Keeping exactly N ambient vertices also avoids any exponent-sign issue when ε≥2. In particular, existence of even one positive fixed power saving would suffice.

Preserved qualification: this argument does **not** prove a logical non-implication from the currently known unspecified o(n²) bound. It shows why this amplification does not absorb an arbitrary such error: for example N²/log N is much larger than N² exp(−C_r sqrt(log N)). The source's o(N²) upper bound also prevents constant-density linear/no-Berge-triangle block systems. A claim that o(n²) cannot logically imply exact Tuza would be stronger and is not established here.

## Bounded prior-art search

No exact published statement of this power-saving equivalence was located in the recorded search. This is not an originality finding or an exhaustive literature review. Search variants and reviewed scopes are preserved in `evidence/efr_power_saving/search_receipt.json`; nearby primary PDFs and their receipts are retained.

Relevant primary comparisons:

- Raphael Yuster, [*Dense graphs with a large triangle cover have a large triangle packing*](https://arxiv.org/abs/1009.0353), Theorem 1.3, states τ≤2ν+o(n²), combining Krivelevich with Haxell–Rödl. Its introduction and concluding discussion were inspected; no fixed-power-saving equivalence was found there. The author-host revised PDF and retained arXiv v1 differ in a density-improvement constant, irrelevant to the common Theorem 1.3 used here.
- Jacob D. Baron and Jeff Kahn, [arXiv:1408.4870v2](https://arxiv.org/abs/1408.4870v2), introduction pp.1–3, repeats the asymptotic bound and studies sharpness of coefficient 2 in positive-density graphs. That is a different statement. Local full-text keyword inspection did not locate the new equivalence.
- Zhen Liu and Qinghou Zeng, [arXiv:2610.15539v1](https://arxiv.org/abs/2610.15539v1), Proposition 1.2, gives a different exact equivalence using the disjoint union of an arbitrary fixed graph and a large complete bipartite graph. It concerns the edge-count hypothesis e(G)≥n²/4−cn, not a power-saving additive error. Only this introductory comparison was checked; no review of its main theorem is claimed.

The safe attribution is: a Tuza corollary of the classical Erdős–Frankl–Rödl/Behrend incidence construction, independently reconstructed in TUZA-19; prior publication of the exact corollary remains unverified. No proof of Tuza, improved universal error estimate, or novelty claim follows from this audit.
