# Fresh audit: bounded vertex-star packing polytopes

Verdict: PASS for the stated local-polytope obstruction and its incidence amplification. No material mathematical gap was found. The scope is an integrality/synchronization obstruction for the specified intersection of projected packing polytopes. It is not a Tuza counterexample, a parity-gate counterexample, a lower bound for a hierarchy with joint moment consistency, or a formal/human verification claim.

## Frozen input and independence

Main input: `notes/fresh_global_star_polytope_obstruction.md`.

SHA256: `40896772e0eba03072bdab40c9e8ba95b708c0c6cd17f1dc1c17970f0ec7886e`.

The hash was checked before reconstruction. I read the frozen statement and its included proof, not the producer checker, producer results, or a prior favorable audit. The accepted incidence theorem used in Section5 is `notes/global_routes_universal_clique_reduction.md`, SHA256 `83d9549aae898656b2d09871c5f87c481d6b36116f7ac37d23f534df92f527a1`, previously independently reconstructed in this lane. The complete-graph packing construction is fully included in the input; no omitted claim from `packing_new_link_debt.md` was needed.

A new independent standard-library script, `review/star_polytope_fresh_verify.py`, reconstructs the doubling packings and rational orbit mixtures on K11 and K23. It imports no producer code and performs no optimization or graph-family census. It checks nine local cases, s=1,...,4 for K11 and s=1,...,5 for K23. All pass. Literal packings, chosen subsets, mixture weights, orbit counts and exact rational marginals are retained in `evidence/star_polytope_fresh/local_certificates.json`.

Host: Darwin. Original start 2026-11-15T01:53:58Z, research cutoff 2026-11-15T09:23:58Z, hard deadline 2026-11-15T09:53:58Z. Requested Astra/Ultra; actual serving identity and effort are not exposed.

## 1. Definitions and exact quantifiers

For each S, P_S is the convex hull of ALL edge-disjoint triangle families contained in T_S, where T_S consists of triangles meeting S. It does not require those families to be maximum for T_S. Therefore restricting an actual global maximum packing gives an admissible point of P_S, even if the restriction is not a maximum local family.

L_k imposes membership in P_S separately for every vertex set S of size between one and k. It identifies the common triangle-coordinate vector x but imposes no consistency on joint events involving two or more triangles. Every global packing belongs to L_k. The singleton constraints bound every triangle coordinate, so the finite-dimensional maximization defining rho_k is bounded and attained.

For every fixed k one may choose a sequence member n>=max(11,k+4,binom(k,3)+7), with binom(k,3)=0 for k<3. The sequence 6*2^j-1 is unbounded. This single n works for EVERY S with |S|<=k; n is not chosen separately for different S. The probability distribution witnessing membership may, and does, depend on S.

In the amplified statement, k and its chosen complete-graph seed are fixed first. The incidence ratio is then chosen for the requested constant C>=0. There is no claim for k growing with the final graph order, or for a single finite graph dominating every constant C.

## 2. Complete-graph maximum packings, TF, and resilience

The doubling construction is valid. With odd old order n, the matching indexed by j on the n+1 new vertices pairs infinity with j and pairs j+t with j-t. These are perfect matchings. Each finite new-new edge has a unique midpoint modulo odd n, and each infinity edge occurs once, so the matchings partition the new complete graph. Adjoining the distinct old vertex j to each matching edge covers all new-new and old-new edges exactly once, without touching old edges. Thus the old four-cycle remains the exact leave. Starting from 012 and 034 in K5 gives n_j=6*2^j-1 and leave size four at every stage.

For these odd n, K_n has even degrees and m=binom(n,2)=1 modulo three. The constructed packing has p=(m-4)/3 triangles. The only possible larger packing by edge count would have (m-1)/3 triangles and leave one edge. Removing triangles preserves degree parity, so that leave is impossible. Hence p=nu(K_n).

Every pair of distinct edges can be placed in a C4, whether adjacent or disjoint. An automorphism carries the displayed leave to that C4, giving a maximum packing avoiding the pair. Thus all deletion sets of size at most two preserve nu; no computation over deletion pairs is necessary for the all-size conclusion.

The elementary Mantel argument in the input gives tau(K_n)=m-floor(n^2/4)=(n-1)^2/4. A prescribed triangle fits inside one part of a balanced partition for every n>=5; the within-part edges are a containing minimum cover. Hence TF holds. The same covers are odd, proving pi=tau. Direct subtraction gives

    2nu(K_n)-tau(K_n)=(n+7)(n-5)/12>=0.

Thus the examples have the claimed hypotheses while satisfying Tuza and the odd-cover inequality. The obstruction cannot be represented as an actual Tuza or H-O2 violation.

## 3. The averaging lemma produces both required subset types

Let A be the four leave vertices and B its complement. Every A vertex has covered degree n-3, so belongs to exactly (n-3)/2 packed triangles. Therefore at most 2(n-3) packed triangles meet A. The number r_B of packed triangles wholly in B satisfies

    r_B >= p-2(n-3)=(n^2-13n+28)/6>0

for n>=11. Counting triangles meeting two or more A vertices multiple times only strengthens this upper bound on the number meeting A; it is not an equality assumption.

For a uniformly chosen s-subset U of B, linearity of expectation gives

    E[number of packed triangles in U]
      =r_B binom(s,3)/binom(n-4,3).

The edge-disjointness bound r_B<=binom(n-4,2)/3 reduces this to at most binom(s,3)/(n-6)<1. An integer-valued nonnegative count with expectation below one must be zero for some U_0. Since r_B>0 and s>=3, some U_1 of size s contains a packed triangle; it can be extended within B because s<=|B|. Its actual internal count r_1 is at least one and may exceed one. The proposed mixture correctly uses that actual r_1.

## 4. Orbit mixture and marginal equations

Relabeling U_i onto a prescribed S places the entire leave outside S, because U_i lies in B. Hence both resulting global maximum packings cover EVERY graph edge incident with S. Choose the positive mixture weight

    lambda=binom(s,3)/((n-2)r_1).

The imposed n bound ensures lambda<1. The mixture's expected number of packed triangles inside S is exactly binom(s,3)/(n-2), because its two counts are zero and r_1.

Averaging independently over permutations of S and its complement is a finite group average, hence a genuine finite convex combination. The group is transitive on each triangle type i=|V(T) intersect S|. Thus the mixture yields a constant marginal p_i on each existing orbit. For s>=3, the internal-triangle expectation gives p_3=1/(n-2).

A fixed edge inside S is always covered, and its possible third vertices give

    (s-2)p_3+(n-s)p_2=1.

Since n-s>=4, this forces p_2=1/(n-2). A fixed cross edge is likewise always covered, so

    (s-1)p_2+(n-s-1)p_1=1,

forcing p_1=1/(n-2). The denominator n-s-1 is positive. No condition on p_0 is needed when restricting to T_S.

The s=1 and s=2 cases are correctly separated. For s=2, its one internal edge gives (n-2)p_2=1, then the cross-edge equation determines p_1. For s=1, the incident-edge equation gives (n-2)p_1=1 directly. No nonexistent p_3 or zero-size triangle orbit is used.

The mixture is essential. An unmixed U_0 distribution has p_3=0 for s>=3 and therefore cannot realize the target vector. The independent script records this rejected semantic control. It also checks the unused orbit explicitly: when s is fixed, the global packing size forces

    p_0=1/(n-2)-4/[3 binom(n-s,3)].

This is consistent with the constructed maximum packings and makes clear that each local witness is not a global distribution with uniform marginals on ALL triangles.

## 5. Local feasibility does not imply joint consistency

For each S, restricting its sampled maximum packing to T_S is an admissible local packing, and its marginals are the required uniform coordinates. This proves the precise membership x|T_S in P_S.

The distributions chosen for distinct S are separate witnesses. Their overlapping triangle coordinates agree, because each is the same x_T=1/(n-2). Agreement of these first moments does not identify joint probabilities such as the chance that two prescribed triangles are simultaneously selected. No coupling identifying the same triangle-selection variable across overlapping local families, or consistent family of such higher moments, is constructed. An arbitrary independent coupling of the separate local random objects is of course possible; it does not supply that identification.

Indeed there cannot be one probability distribution on global packings with the full uniform triangle vector: its expected size would be m/3, whereas every global packing has size at most (m-4)/3. This contradiction explains exactly the synchronization failure. It does not imply failure of any stronger relaxation that explicitly requires compatible joint moments or adds global leave/parity inequalities.

## 6. Exact objective value and amplification

The feasible uniform vector has mass binom(n,3)/(n-2)=m/3. Conversely, for every graph edge uv, all triangles containing uv lie in the singleton family T_{ {u} }. Every packing in that family uses at most one such triangle, so the local convex hull implies its edge-capacity inequality. Summing over all m edges gives 3 sum_T x_T<=m. Therefore rho_k=m/3 exactly, and

    rho_k-nu=4/3,    floor(rho_k)=nu+1.

The K11 and K23 values and the stated k bounds are correct: binom(4,3)=4<5 for n=11, and binom(5,3)=10<17 for n=23.

For the amplification, the accepted incidence construction produces b edge-disjoint induced K_n copies with no actual cross-copy triangle, on at most N vertices, where b>DN. Integral packing, cover, and odd-cover optima add across these triangle blocks. TF passes by choosing a containing local minimum cover, and two-edge resilience passes because at most two deletions occur in any one block and block packings have disjoint edge resources.

For a GLOBAL S of size at most k, put S_i=S intersect block_i. Each size is at most k, even though S may meet very many blocks through shared vertices. Choose the already proved local global-maximum-packing distribution in each block for S_i, or any maximum packing for an empty intersection. Independent finite choices across blocks form a genuine distribution on global maximum packings, since intersections of block vertex sets create no shared graph edge. Restricting to T_S has the required uniform marginals in every block. This proves local feasibility for all global S; it does not assert that the chosen distributions for different global S are jointly consistent.

Every graph edge still lies in n-2 triangles, all in its block, so the singleton capacity upper bound is again tight. Hence

    rho_k(G)=b m/3,    nu(G)=b(m-4)/3,
    rho_k(G)-nu(G)=4b/3.

Choosing D>3C/4 gives 4b/3>CN>=C|V(G)|. This is the claimed arbitrarily large additive gap per vertex, with all output graphs still TF, two-edge resilient, and satisfying pi=tau<=2nu.

## 7. Ancillary check and final scope

The earlier support-only cone bridge is also correctly rejected by R=K4: an empty rim packing cannot supply a rim cover, while a one-triangle rim packing has three different remaining K4 faces requiring its three distinct edges. Its proposed two-edge support budget therefore fails. The exact cone formulas displayed in the input follow by splitting a packing into rim triangles and matching-based apex triangles, or a cover into rim edges and a vertex cover of the remaining rim graph.

No material objection remains. The decisive conclusion is failure of exact or universally linear-additive synchronization for the specified bounded-star coordinate relaxation. The proof establishes no cover inequality tau<=2rho_k and no failure for a hierarchy with additional global or joint-moment constraints. All-size statements rest on the ordinary construction, averaging, and ownership proofs; the nine rational checks are supporting fixed controls only.
