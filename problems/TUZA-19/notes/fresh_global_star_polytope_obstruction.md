# Exact bounded vertex-star polytopes do not synchronize global triangle packings

Status: complete ordinary obstruction to a specified global packing-certificate mechanism. Exact rational checks of the retained K11 and K23 controls support the local convex combinations. Independent reconstruction is requested. No Tuza counterexample, global packing theorem, Sherali–Adams lower bound, joint-distribution consistency, novelty, or Lean claim is made.

## 1. The proposed global bridge and its precise failure

Let T(G) be the set of all actual triangles of a finite simple graph. For S contained in V(G), let

    T_S = {T in T(G): V(T) intersects S}.

Define P_S to be the convex hull of incidence vectors of all edge-disjoint triangle families contained in T_S. These are exact local PACKING polytopes, not merely edge-capacity inequalities. For a fixed integer k>=1 define

    L_k(G) = {x>=0: x restricted to T_S belongs to P_S
                    for every S with 1<=|S|<=k},
    rho_k(G) = max_{x in L_k(G)} sum_T x_T.

Every global triangle packing gives a feasible vector, so rho_k>=nu. For k=1 the local triangle family is exactly an ordinary matching problem in the full induced neighborhood graph: bases of the triangles through a vertex must be vertex-disjoint. Thus L_1 retains the entire link matching polytope, including every blossom-type inequality, by its convex-hull definition; no matching-polytope theorem is required here.

A proposed global certificate strategy would combine a cover inequality tau<=2 rho_k with an integral synchronization statement floor(rho_k)<=nu. These are distinct needed steps. The cover inequality is not proved here for any fixed k; the second step is decisively false even under TF and two-edge packing resilience. Therefore exact local packing certificates cannot be substituted for a global packing certificate in this way.

**Theorem.** For every fixed k>=1, there exists n of the form 6*2^j-1 such that G=K_n is TF and two-edge packing resilient and

    rho_k(K_n)=binom(n,2)/3=nu(K_n)+4/3.

In particular floor(rho_k)=nu+1. The witnessing vector is x_T=1/(n-2) for EVERY actual triangle. For every individual S, its local convex combination can be chosen to consist of restrictions of actual GLOBAL MAXIMUM packings. The combinations for different S need not extend to one joint probability distribution; indeed their common first marginals cannot do so, by the displayed global objective gap.

**Amplified corollary.** For every fixed k>=1 and every real C>=0, there are actual finite simple graphs G that are TF and two-edge packing resilient with

    rho_k(G)>nu(G)+C|V(G)|.

Thus even a universal additive linear-error synchronization bound is unavailable for this specified local-polytope mechanism. Both statements concern packing integrality, not the factor-two cover conjecture. All witnesses here have explicit covers satisfying Tuza.

## 2. Retained complete-graph family, reconstructed

The ordinary construction from `packing_new_link_debt.md` is included to make the dependence exact. Put n_j=6*2^j-1. There is a packing P_j of K_(n_j) leaving exactly a four-cycle.

Start with the two K5 triangles 012,034, whose leave is the cycle 1-3-2-4-1. From an odd n, retain the old packing; add n+1 new vertices labelled infinity and Z_n. For each old vertex j, take the perfect matching

    {(infinity,j)} union {(j+t,j-t):1<=t<=(n-1)/2}

on the new vertices, with residue arithmetic modulo n, and append the triangles obtained by adjoining old vertex j to those matching edges. The n matchings partition the edges of the new K_(n+1): each finite edge determines its unique midpoint modulo odd n, and each infinity edge occurs once. Every old-new edge also occurs exactly once. Thus the only uncovered edges are the old four-cycle.

For n in this sequence, n=5 modulo 6. Write m=binom(n,2), so m=1 modulo 3. The constructed packing has

    p=(m-4)/3=(n(n-1)-8)/6

triangles. A larger packing could only leave one edge. But K_n has even degrees, and subtracting edge-disjoint triangles preserves every degree modulo two. A one-edge leave is impossible. Hence p=nu(K_n).

Any two distinct edges lie in a four-cycle: for adjacent edges, extend their three-vertex path by a fourth vertex; for disjoint edges, use them as opposite sides. Relabel the displayed leave to that cycle. The resulting maximum packing avoids those two edges. Single and empty deletions follow, proving two-edge resilience.

A triangle-free n-vertex graph has at most floor(n^2/4) edges, attained by a balanced complete bipartite graph. For completeness, if it has e>0 edges, triangle-freeness gives d(u)+d(v)<=n for every edge uv. Summing yields sum_v d(v)^2<=ne, while Cauchy gives sum_v d(v)^2>=4e^2/n, so e<=n^2/4. Therefore

    tau(K_n)=m-floor(n^2/4)=(n-1)^2/4.

Every specified triangle fits in one side of a balanced partition when n>=5. The complement of that cut is a minimum cover containing all three triangle edges, proving TF. Every edge is likewise contained in a minimum cover, so these controls are also edge-cover-critical. The cover is odd on every triangle. In particular tau=pi<=2nu throughout this family; no parity-gate counterexample is asserted.

## 3. Local symmetrization lemma

Fix one such n>=11 and one maximum packing P with four-cycle leave. Let A be the four leave vertices and B=V minus A, so |B|=n-4. Every edge incident with B is used by P.

There is at least one packed triangle wholly in B. Each leave vertex has covered degree n-3 and belongs to (n-3)/2 packed triangles, so at most 2(n-3) packed triangles meet A. Consequently

    |{T in P:T subset B}| >= p-2(n-3)
                           = (n^2-13n+28)/6 >0

for every n>=11 in the sequence.

Choose n sufficiently large that

    k<=n-4, and binom(k,3)<n-6.                         (1)

For k=1 or2 interpret binom(k,3)=0. The sequence n_j is unbounded, so such a choice exists for every fixed k.

Fix 3<=s<=k. A uniformly chosen s-subset U of B has expected number of internal packed triangles

    r_B * binom(s,3)/binom(n-4,3)
       <= binom(s,3)/(n-6) <1,                          (2)

where r_B is the number of packed triangles wholly in B. The inequality uses r_B<=binom(n-4,2)/3, since the triangles are edge-disjoint. Since the count is an integer, some U_0 has ZERO internal packed triangles. Also choose an s-subset U_1 of B containing a packed triangle; this is possible by the preceding positivity and s<=|B|. Let r_1>=1 be its number of internal packed triangles.

Now let S be ANY prescribed s-subset of V. Relabel P by a bijection carrying U_i to S, giving maximum packings P_i. Their four-cycle leaves lie outside S, so both cover EVERY graph edge incident with S. Mix P_1 with probability

    lambda = binom(s,3)/((n-2) r_1),

and P_0 with probability 1-lambda. By (1), 0<lambda<1. Finally apply a uniformly random permutation within S and, independently, within V minus S. This is a finite convex combination of actual maximum packings. It always covers every edge incident with S, and the expected number of selected triangles wholly in S is binom(s,3)/(n-2).

Let p_i be the marginal probability of any particular triangle with exactly i vertices in S. Symmetrization makes this probability constant on each existing type. The internal-triangle count gives

    p_3=1/(n-2).

Every fixed edge inside S is always covered, and all triangles containing it meet S. Therefore

    (s-2)p_3+(n-s)p_2=1.

This gives p_2=1/(n-2). Every fixed edge with one endpoint in S is also always covered, so

    (s-1)p_2+(n-s-1)p_1=1,

giving p_1=1/(n-2). The denominators are positive by (1). Thus restricting each sampled packing to T_S gives exactly the uniform target marginal on every triangle in T_S. This proves membership in P_S, with no requirement on the unused type p_0.

For s=2, take ANY two vertices of B, relabel them to S, and symmetrize. The single internal edge is always covered, so (n-2)p_2=1; the cross-edge equation then gives p_1=1/(n-2). No p_3 type exists and no mixture is needed. For s=1, use any vertex of B. Each incident edge is always covered, so (n-2)p_1=1. The empty set gives no condition. This handles every |S|<=k without introducing nonexistent triangle types.

The construction is separate for each S. It proves membership in the intersection of projected convex hulls. It does not prove consistency of higher-order moments on overlaps, a common distribution on the local packings, or membership in the full global packing polytope.

## 4. Exact value of the relaxation

The lemma proves x_T=1/(n-2) belongs to L_k. Its total mass is

    binom(n,3)/(n-2)=binom(n,2)/3=m/3.

Conversely, the singleton-star constraints imply every graph-edge capacity inequality: for edge uv, all triangles containing uv belong to T_{ {u} }, and any packing contains at most one of them. Summing these inequalities over the m graph edges gives 3 sum_T x_T<=m. Thus rho_k=m/3 exactly.

Since nu=(m-4)/3 and m=1 modulo 3, the gap is 4/3 and floor(rho_k)=nu+1. Ordinary floor rounding is already insufficient. For the fixed K11 control, the argument applies to every set of at most four vertices because binom(4,3)=4<11-6=5. Its values are rho_4=55/3, nu=17, tau=25. K23 supplies the fixed five-vertex-star control rho_5=253/3, nu=83.

The warm-up at k=1 is especially transparent: in K11 every link is K10. A uniformly random perfect matching of K10 uses each edge with probability 1/9. All eleven link distributions therefore have the common triangle coordinates 1/9, satisfying full local matching convex hulls and saturating every original graph edge, yet their common total 55/3 exceeds the global maximum17.

The obstruction is global: the fractional vector saturates every edge, whereas an integral triangle packing must leave a nonempty even-degree graph of the required edge-count residue. This family needs a four-cycle leave. A global parity/leave inequality detects it immediately. Such an inequality is not among the bounded vertex-star constraints refuted here.

## 5. Arbitrarily large gap per vertex by the accepted incidence construction

Fix k and a corresponding K_n control as above. The frozen ordinary theorem `global_routes_universal_clique_reduction.md`, Sections1–2, supplies for every D>0 a linear n-uniform hypergraph on N vertices with b>DN blocks and no Berge triangle. Place a copy of K_n on each block. Linearity makes copied graph edge sets disjoint; no actual graph triangle crosses copies, because three distinct edge owners would form a Berge triangle, while two equal owners force the third equal by linearity. Let G be the resulting graph, with unused isolated vertices discarded, so |V(G)|<=N.

The exact integral parameters add over these triangle blocks:

    nu(G)=b nu(K_n), tau(G)=b tau(K_n).

TF passes by choosing a containing minimum cover in the prescribed triangle's block and arbitrary minimum covers elsewhere. Any deletion of at most two edges affects each block in at most two edges; choose resilient maximum packings independently in the affected blocks. Hence G remains two-edge packing resilient. Minimum odd covers also combine, so these witnesses still have pi=tau<=2nu.

Give every copied triangle weight 1/(n-2). For any GLOBAL set S with |S|<=k, let S_i be its intersection with block i. In each block use the local convex combination from Section3 for S_i; choose an arbitrary maximum block packing when S_i is empty. Take these finite random choices independently across blocks. Their union is a global maximum packing, since triangle blocks have disjoint edge resources. Its restriction to T_S has exactly the required uniform marginals in every block. Thus x belongs to L_k(G), even though S can meet arbitrarily many blocks through shared vertices.

The singleton edge-capacity upper bound is again tight, yielding

    rho_k(G)=b m/3, rho_k(G)-nu(G)=4b/3.

Choose D>3C/4. Then 4b/3>C N>=C|V(G)|, proving the corollary. This uses the already proved sparse incidence construction; it is not an enlarged graph census. If a method first adds global component or parity inequalities, it is a different relaxation and is not ruled out by this result.

## 6. Decision, evidence, and limits

The initial arbitrary-rim cone attempt produced the exact standard formulas

    nu(cone R)=max_Q (|Q|+mu(R-E(Q))),
    tau(cone R)=min_C (|C|+vc(R-C)),

where Q ranges over rim triangle packings and C over rim triangle covers. The attempted support-only bridge required an optimal pair (Q,M), with M a matching of R-E(Q), and a set C contained in E(Q), of size at most 2|Q|, covering all rim triangles and all rim edges whose endpoints are unmatched by M. The spokes at the endpoints of M plus C would then give the desired cone cover. It already fails on R=K4: if Q is empty, no rim triangle is covered; if Q contains its one possible triangle, each of its three edges is the unique Q-edge of a different remaining K4 face, so all three are needed and the two-edge budget fails. This returns to the frozen apex-compatibility problem and was stopped before new computation. The present local-polytope gate is a different global mechanism, and its synchronization step is now refuted at every fixed vertex-set size.

The checker `checks/fresh_global_star_polytope.py` uses only the standard library and no producer imports. It reconstructs the doubling packings for K11 and K23, validates their exact four-cycle leaves, and checks rational orbit-mixture certificates for s=1,...,4 in K11 and s=1,...,5 in K23. It also checks all 1485 two-edge deletion pairs and all 165 triangle-full cover certificates in K11. A zero-internal-triple orbit without the required mixture is retained as a rejected semantic control. No SAT solver, large optimization, graph-family census, or Lean job is used.

The receipt includes the literal edges, all actual triangles, full maximum packings used in each local certificate, mixture weights, orbit counts and exact rational marginals. Symmetrization and the all-size averaging/ownership arguments are ordinary proofs, rather than claims inferred from the two finite controls. The source construction was previously independently audited; this new polytope implication awaits its own reconstruction when frozen.

No theorem tau<=2rho_k is established. Even if it were, the failed exact or linear-error synchronization step would not supply a Tuza proof. Nor is a failure of Sherali–Adams, Lasserre, or another hierarchy with joint distribution/moment consistency claimed. There is no claim that the exact polytopes P_S can be optimized efficiently for every fixed k.

Decision: stop this local exact-polytope synchronization lane. A viable continuation would have to add a genuinely global constraint or an approximate rounding/cover argument that uses the large integral-cover slack of these controls. Merely enlarging a fixed number of vertex stars does not repair the mechanism.

All work is private on the local Darwin host, using pinned Python3.12.12. Requested model controls: Astra / Ultra; actual serving identity and applied effort are not independently exposed. Original research cutoff: 2026-11-15T09:23:58Z. Frozen source snapshots, reproduction command and exact hashes are in `review/fresh_global_star_polytope_manifest.json`.
