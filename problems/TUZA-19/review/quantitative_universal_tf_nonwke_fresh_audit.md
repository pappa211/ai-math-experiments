# Fresh audit: quantitative amplification and simultaneous universal-clique/TF/non-WKE normalization

Verdict: PASS. The two frozen ordinary proofs establish their stated equivalences, with no unresolved mathematical gap found. In particular, for every fixed 0<β<1/3, unrestricted Tuza is equivalent to Tuza on graphs simultaneously having TF, every link component non-WKE, and at least n^β universal vertices. No proof of the inequality on this class is supplied. Neither packing resilience nor edge-minimality is asserted for the output.

This is independent ordinary AI reconstruction from the frozen statements and proofs and an explicitly declared seed dependency. No producer checker, graph census, SAT computation, Lean process, or prior favorable review of these two proofs was used. Local Darwin work; original start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z. Requested Astra/Ultra; actual serving model/effort are not exposed.

## Frozen inputs and scope

1. `notes/global_routes_quantitative_amplification.md`, SHA256 `4ddc162df0ceb5072b948d64cf7d09df1e2e7641d66dceb038aecce6cbb48d53`.
2. `notes/root_universal_clique_tf_nonwke.md`, SHA256 `709ffc9c57f3a657a7e4fda984354d7c020ab838a8db09d1d28cb6e31155bd5a`.
3. Declared seed/WKE dependency, read and reconstructed: `notes/global_routes_universal_tf_nonwke_addendum.md`, SHA256 `58dbcfc87ef9683801a666f8e159fd367e01376aa7c7bb79d1bf2296c3b020b4`.

The primary-source audit is separately frozen at `review/efr_power_saving_source_audit.md`, SHA256 `33a3bfc8a6fe049f15d424a5f97e1f8084be40b705385975c994db6ecdfc874e`. The present review checks the full new mathematical deductions, not merely source applicability. No originality claim is made.

## 1. Equal-norm incidence construction

For fixed seed size r≥3 and d tending to infinity, D=2^d, B=2rD, M=B^d are internally consistent. There are D^d digit vectors and at most d(D−1)^2+1 squared norms, giving a nonempty norm level A of the stated size. Zero may belong to A and causes no problem.

If u,v>0 and u+v≤r, each digit of ua+vb and (u+v)c is at most r(D−1)<B. Thus equality of encoded integers gives equality digit by digit. For equal-norm vectors x,y,z with ux+vy=(u+v)z,

    u||x−z||²+v||y−z||²
      =u||x||²+v||y||²−(u+v)||z||²=0.

Both positive terms vanish. This forbids every nonconstant weighted three-term relation needed by the later incidence argument.

The loss estimate is valid: log M=d² log2+d log(2r), while the negative log of |A|/M is at most d log(2r)+log(d(D−1)^2+1)=O_r(d). Hence |A|≥M exp(−O_r(sqrt(log M))).

Each AP block has coordinates x+ia in [1,rM]: its maximum is M+(r−1)(M−1)<rM. There are exactly M|A| blocks because parts 0 and 1 identify x,a. Two different blocks cannot share two points, and a Berge triangle would have three distinct intersection-part indices. Eliminating the three starts gives the displayed nonzero three-coefficient equation; its positive coefficient sum is at most r−1. The equal-norm property forces equal slopes, and an intersection then forces equal starts, contradicting distinct blocks.

Thus the construction is linear and has no Berge triangle. With N=r²M, the fixed factor r^4 in converting M² to N² is absorbed in C_r sqrt(log N). Only an unbounded sequence N is required, and the proof correctly claims no construction at every integer N with these exact parameters.

## 2. Actual triangles and exact amplification

Deleting seed isolates is harmless. Each nonisolated role lies in an edge, so all rM distinct vertices reached by the M starts for any one fixed slope remain in H. Consequently N/r≤h≤N and h tends to infinity.

Linearity makes copied graph-edge sets disjoint and every copy induced: an added edge between two vertices of one block would otherwise force a second block sharing both vertices. For any actual triangle, either two edges have the same owner, forcing all three edges into that owner, or the three distinct owners form a Berge triangle. This proves ownership for all actual triangles, including interfaces. Therefore τ,ν and their defect add exactly over b copies.

This also proves the required link inheritance. Copies containing a vertex v have otherwise disjoint vertex sets. A link edge between two different neighbor sets would be a cross-copy triangle through v. Therefore each H-link is a disjoint union of the corresponding seed links; every component inherits non-WKE when the seed has it.

For a fixed positive seed defect δ and fixed ε>0,

    bδ/N^(2−ε) ≥ δ exp(ε log N−C_r sqrt(log N)) → ∞.

The assumed additive bound has uniform constants over all graphs, so applying it to the sequence H contradicts δ>0. The frozen Theorem A uses 0<ε<2, ensuring h^(2−ε)≤N^(2−ε). The uniform inequality itself forces C≥0 by applying it to empty graphs. There is no hidden graph-dependent constant in the contradiction.

For the quantitative join J=K_q∨H, q=ceil((2N)^(1−ε))≤N eventually, so q≥|V(J)|^(1−ε). Every nonold triangle consumes at least two of the qh+binom(q,2) new edges. This yields δ(J)≥bδ−O(N^(2−ε))>0. The codegree check includes all types: old edges have q apex neighbors; cross edges have q−1 apices and at least one old neighbor; apex edges have h+q−2≥q neighbors. These deductions do not claim TF or resilience for J.

## 3. Minimal seed hypotheses

Let G be a counterexample with the fewest edges, after removing isolates. It has a triangle, since a triangle-free graph has τ=ν=0. Deleting a triangle and extending any residual packing by that triangle gives ν(G−T)≤ν(G)−1. Minimality gives

    2ν(G)<τ(G)≤τ(G−T)+3≤2ν(G−T)+3≤2ν(G)+1.

All inequalities are equalities. In particular τ=2ν+1 and every triangle is contained in some minimum cover. An edge outside every triangle could be deleted without changing either parameter, so every edge lies in a triangle and hence in some minimum cover. This supplies precisely the old-edge choice needed in the mixed-triangle TF case.

The WKE component reduction was independently checked. For a link component L at v with witness M,Q, delete all spokes vV(L) and the matching edges M. A packing in the residual graph extends by the triangles vxy for xy∈M. The set M∪{vq:q∈Q} covers all lost triangles: those using a deleted spoke are accounted for by the link-component condition, and every other lost triangle uses M. Its size is at most 2|M|. The deletion is proper even for a singleton link component, so minimality contradicts the WKE witness. Thus every seed link component is non-WKE.

The amplification passes TF and the property that each old edge belongs to a minimum cover by independent choices on the disjoint edge sets. These hypotheses are not claimed for arbitrary input graphs.

## 4. Shared-clique edge ownership and exact cover value

In the new construction, q≥1, s=q+5, L=2q+6 and h=|V(H)|≥1. Put A=K_q and B_v private of size s. The clique K_L(v) has vertices A∪{v}∪B_v. Every actual triangle belongs to exactly one of the following categories: an old H triangle; a triangle a_iuv with uv∈E(H); or a triangle contained in some K_L(v). Pure A triangles can belong to several local cliques, and are handled explicitly below. Fresh vertices have no neighbors outside their own clique, so no further category exists.

The only overlap between distinct local clique edge sets is E(A); no H edge belongs to a local clique. Thus for every edge subset C the counting identity is exact:

    |C|=|C∩E(H)|+Σ_v |C∩E(K_L(v))|−(h−1)|C∩E(A)|.

For a cover, its restrictions are covers. Mantel's degree-sum bound gives

    t=τ(K_L)=binom(L,2)−L²/4=(q+3)(q+2).

Writing a=binom(q,2), this yields |C|≥τ(H)+ht−(h−1)a. Each local balanced cut can put A∪{v} on one side, which has capacity q+3 and currently uses q+1 vertices. Its complementary cover selects every A edge and all q root spokes at v. These choices and a minimum H-cover cover all mixed triangles. Therefore

    τ(W)=τ(H)+h(t−a)+a

exactly. There is no uncharged clique-edge overlap: the construction attains the largest allowed overlap, namely all a edges of A.

## 5. TF, including a special clique omitting its roots

For an old triangle use an H-minimum cover containing it. For a mixed triangle a_iuv use an H-minimum cover containing uv and select all roots in every local clique. Both attain the exact cover value and contain the required triangle.

For T⊆K_L(v), put A∪V(T) in one side of a balanced local partition. This uses at most q+3 vertices, exactly the side capacity, even when T consists of three fresh vertices. The local cover contains T and all A edges. Use root-containing local covers at every other old vertex and any minimum H-cover.

The special local partition can place v opposite A and omit all q root spokes at v; assuming its root is always selected would be wrong. The proof does not assume this. Each mixed triangle using one omitted root has a different old endpoint u, whose root at a_i is selected by its own unchanged local cover. Triangles with two A vertices have their A edge selected. Pure A triangles are already contained in every constructed cover. The resulting cover has the exact optimum size and contains T. Hence all actual triangle types satisfy TF.

## 6. Non-WKE bounds for every vertex type and component

For a clique K_d and any matching M, an independent triple in K_d−M would require all three of its edges to lie in a matching, impossible. Therefore every residual vertex cover has at least d−2 vertices. The statement remains valid when M is the restriction of a larger matching containing cross edges.

A fresh vertex has link K_(L−1). Every residual cover has at least L−3 vertices, while a matching has at most floor((L−1)/2). Since L≥8, the inequality is strict.

At an old vertex v, the link consists of a complete part K_(q+s) on A∪B_v and old components L_i, with cross edges only from A. For any matching, write M_0 for complete-part edges, M_i for old-component edges, and c for cross edges. Their edge counts partition the matching. Since c≤q and 2|M_0|+c≤q+s,

    |M_0|+c≤floor((q+s+c)/2)≤floor((s+2q)/2).

Every residual cover takes at least q+s−2 vertices from the complete part and at least |M_i|+1 from each non-WKE old component. Therefore its size minus the matching size is at least

    q+s−2−floor((s+2q)/2)+d = ceil(s/2)−2+d>0.

This is uniform in q; it does not accidentally bound only internal matching edges. The full link is connected through A.

At an apex a_i, the disjoint groups {v}∪B_v have size s+1 and each induces a clique. Any residual cover takes at least s−1 vertices per group. For q≥2 the remaining q−1 apices make the link connected. The maximum matching is bounded by half its total vertex count. Strictness follows from

    2h(s−1)−[h(s+1)+q−1]
      =h(q+2)−(q−1)>0.

For q=1 each link component corresponds to an entire positive collection of groups from one H-component. Apply the same calculation using that component's group count and no extra apices. Thus disconnected H causes no missing apex-link component case. All vertex types have now been covered.

## 7. Packing budget and growing-q quantifiers

Assign each packing triangle contained in at least one local clique to one such clique, choosing any owner for a pure A triangle. Each assigned family is itself an edge-disjoint triangle family in K_L, hence has at most p=floor(binom(L,2)/3) members. No exact clique packing formula or compatible collection of local optimum packings is used. The remaining nonold triangles a_iuv each consume two distinct root spokes, so there are at most qh/2 of them. Therefore

    ν(W)≤ν(H)+hp+qh/2.

Possible repeated use of E(A) in the sum hp only weakens this upper bound; it does not invalidate it. Combining with the exact cover formula gives

    δ(W)≥bδ−hC(q)+a,
    C(q)=2p+q−t+a≤(5q²+17q+24)/6.

The polynomial coefficient was independently expanded from binom(2q+6,2)=2q²+11q+15. For fixed q, unbounded b/h suffices.

For 0<β<1/3 the interval β/(1−β)<α<1/2 is nonempty. Set q=ceil(N^α). The loss is at most O(Nq²)=O(N^(1+2α))=o(b), with constants uniform along the sequence. Meanwhile n_W=(q+6)h+q≤(q+6)N+q=O(N^(1+α)), and α>β(1+α) gives q/n_W^β→∞. Every earlier cover, TF and link estimate held for all integers q≥1 and h≥1, so using growing q introduces no fixed-parameter assumption.

All W edges have codegree at least q: old edges have the q apex neighbors and every other edge lies in a local K_L. This includes A edges and every root spoke. The constructed graph is connected because A is nonempty.

## Preserved limits and decision

No obstruction was found that requires a correction of either frozen input. The delicate cases above were reconstructed rather than assumed: shared A edges, pure-A triangle ownership, omitted roots in the special TF cover, cross-link matching edges, disconnected H at q=1, and all growing-parameter constants.

The proof does not establish the endpoint β=1/3, a linear number of universal vertices, two-edge packing resilience, preservation of edge-minimality, or a bound τ≤2ν on the normalized class. Extracting a minimal subgraph afterward can destroy the normalization. The classical incidence method absorbs fixed power savings but does not automatically absorb arbitrary o(n²) error. These are limits of the proved arguments, not proofs of impossibility beyond them.

Decision: retain both normalization theorems as ordinary results with this fresh AI review; the remaining global task is an inequality or counterexample on an equivalent class. No unrestricted Tuza resolution or originality claim is warranted.
