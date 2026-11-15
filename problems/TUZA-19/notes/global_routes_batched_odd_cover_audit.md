# Partner audit: batched near-linear-universal odd-cover obstruction

**Verdict: PASS at the stated scope.** The construction gives arbitrarily large graphs with the claimed TF, connected non-WKE links, universal-vertex/codegree threshold, and strict tau<2nu<pi. This is a partner reconstruction, not a fresh-context review: the reviewer produced the older K5-cut and amplification notes and participated in the batching discussion. The full frozen proof was read, all new counts and implications below were reconstructed, and no producer checker or its output was used as proof.

Frozen target: notes/root_batched_odd_cover_obstruction.md, SHA256240f03702de1bc3f2deadb1be99307c27de26849607b2bd50e8ecd2cffcca4f7. The artifact remains unchanged. No human or Lean verification is claimed.

## Exact theorem and seed dependence

For each fixed gamma in(1/2,1), the output orders n tend to infinity and have at least n exp(-(log n)^gamma) universal vertices and that minimum triangle codegree, TF, connected non-WKE links, and tau<2nu<pi. Packing resilience and minimality are not claimed. In particular this is not an H-O2 counterexample or a Tuza counterexample.

The finite K5-incidence seed comes from the already frozen ordinary probabilistic existence proof. Taking its parameter L=1 gives beta(S)>2nu(S), while tau(S)=2nu(S). A specified triangle in a K5 plus the edge on its complementary pair is a minimum four-cover, so TF passes to the seed by edge-disjoint triangle ownership. Its links are disjoint K4s. For every matching M in K4, a cover of K4-M has at least2 vertices, hence at least |M|; strict non-WKE is not assumed for the seed.

The role-labelled incidence amplifier gives exact integral packing and cover additivity. It also gives exact beta(H)=b beta(S): every coloring costs at least beta(S) in each edge-disjoint seed copy, and an optimal seed coloring applied to all vertices of each fixed role attains that lower bound in every copy simultaneously. No contradictory local color choices are being combined.

## Batched cover and link arguments

The batched graph is the same independent-role batching construction already partner-audited in notes/global_routes_batched_universal_audit.md. Every local graph is K_(q+s_i) joined to I_i, where I_i is independent, s_i=q+g_i+6 and L_i=2(q+g_i+3). Its minimum cover is t_i=e_i-L_i^2/4. The old H edges are disjoint from local edge sets, whose only overlap is E(A). Therefore the exact global cover is

    tau(W)=b tau(S)+B,
    B=sum_i(t_i-a)+a, a=binom(q,2).

The TF proof still works: its only seed requirements are TF and every seed edge lying in a triangle, ensuring that an old edge can belong to a minimum old cover. The balanced local cover can contain A union I_i union V(T) on one side for every local triangle T, so all root spokes remain selected even for that special cover.

For old links, replacing the inherited bounds |Q_j|>=|M_j|+1 by |Q_j|>=|M_j| removes only the component-count bonus. The private clique still contributes the strict margin ceil(s_i/2)-2>0. Fresh links and apex links use no old non-WKE assumption. The prior exact inequalities therefore apply unchanged. Since the chosen even q eventually exceeds2, every full vertex link is connected as well as non-WKE. Triangle codegree remains at least q by the same three edge-type counts.

## Universal vertex and the exact cut formula

For any graph with a universal vertex a_0, an odd-cover indicator x on its graph edges determines colors z_(a_0)=0 and z_v=1+x_(a_0v). The actual triangle a_0uv forces x_uv=1+z_u+z_v. This includes every non-spoke edge; spokes satisfy the same identity by definition. Thus every odd cover is exactly the monochromatic-edge set of a vertex coloring, and conversely every such set is odd on each triangle. Hence pi(W)=beta(W), with no assumption about the other old triangles.

Fix the colors on H and A. In I_i let u_i vertices have color1. If the whole local graph has x vertices of color1, its cut is exactly

    x(L_i-x)-u_i(g_i-u_i).

The first term is at most L_i^2/4. Each side's already fixed A union I_i vertices number at most q+g_i, below the target side capacity q+g_i+3. Coloring the private B_i therefore attains a balanced local split for ANY fixed A and I_i colors. The exact optimum over B_i is consequently L_i^2/4-u_i(g_i-u_i).

Summing local cuts counts the A cut k times, whereas it belongs once globally. Subtracting (k-1)c_A is the correct correction. For any fixed old coloring the sum of local optima does not otherwise depend on the apex colors. Since k>=1, choosing A monochromatic makes the correction zero and attains the maximum. Therefore the frozen maxcut and pi identities are exact, including all shared-A terms:

    pi(W)=B+min_z[uncut_H(z)+sum_i u_i(g_i-u_i)].

The claimed lower bound pi(W)>=B+b beta(S) follows immediately.

**Additional audited observation, not needed for the theorem.** Equality holds in that lower bound for this particular role-batched amplifier. Apply an optimal seed coloring rolewise to H. It attains beta(H)=b beta(S), and each batch lies in a single role part, so every batch is monochromatic and all split penalties vanish. Thus one may also record

    pi(W)=B+b beta(S).

The frozen producer proof only needs the weaker inequality and has not been changed.

## Odd-cover separation and its parameter scale

The packing upper bound classifies every actual triangle into old, local, or one-apex/old-edge mixed types. A local assigned packing has at most floor(e_i/3) members, and every mixed triangle uses two root spokes. Thus

    nu(W)<=b nu(S)+sum_i p_i+qh/2.

Combining this with the exact cover/cut counts gives exactly

    pi(W)-2nu(W)
      >=b[beta(S)-2nu(S)]-k(2q^2+4q+4)-qh+a.

The previously reconstructed coefficient bound remains valid; no new clique packing formula is imported. For q=o(N), the loss is O_S(Nq).

With f_gamma(x)=x exp(-(log x)^gamma) and even q=2ceil(f_gamma(4N)/2), q tends to infinity and q=o(N). The total order satisfies n_W<=4N eventually. The derivative has the sign of 1-gamma(log x)^(gamma-1), so f_gamma is eventually increasing and q>=f_gamma(n_W). The EFR copy lower bound dominates the loss because

    Nq/b = O(exp(C_S sqrt(log N)-(log(4N))^gamma)) -->0.

The strict gamma>1/2 hypothesis is used here. The seed and C_S are fixed before N grows. Thus the positive odd-cover gap survives. No claim is made at gamma=1/2 with a universal coefficient.

## Independent ordinary Tuza certificate

The new lower packing is essential: it prevents confusing an odd-cover obstruction with an unrestricted counterexample.

For a full batch, choose q vertices in each of A, I_i, B_i^1 and B_i^2. The displayed K_(2,2,2,2) base triples were manually reconstructed: each of the six unordered pairs of parts has all four of its possible edges represented exactly once. For example the A-B edges occur in triples1,2,7,8, the A-C edges in1,2,5,6, the A-I edges in5,6,7,8, and the remaining three part pairs are likewise exhausted by3,4 and their indicated partners. Thus the24 cross edges are partitioned into the eight actual triangles. No claim of an optimum is needed.

The affine description is also consistent: assign a0=(1,0), a1=(2,0), b0=(0,1), b1=(0,2), c0=(2,2), c1=(1,1), i0=(2,1), i1=(1,2) over F3. Each displayed triple sums to zero and is one of the eight lines avoiding the origin.

For q=2t, the Latin blow-up uses t^2 triangles per base triangle. For each pair of labels in two fibers, addition modulo t determines exactly one label in the third. Every corresponding expanded edge is covered once. Different base triples have disjoint base edges, so the eight expansions are edge-disjoint and give2q^2 triangles.

Batch packings share only A vertices, not their graph edges, because they use no A-A edges and all their other vertices belong to one batch. They also use no old H edges. They therefore combine with any maximum H packing to prove

    nu(W)>=b nu(S)+2q^2 k_0.

For g_i<=q, the local cover contribution is maximized at g_i=q, giving t_i-a<=3q^2+11q+6=C_q. With k_1<=r and tau(S)=2nu(S),

    2nu(W)-tau(W)>=k_0(4q^2-C_q)-k_1 C_q-a.

For q>=24 the inequality q^2/2-11q-6>=0 holds and is increasing, proving both 4q^2-C_q>=q^2/2 and C_q<=7q^2/2. Also a<=q^2/2. Hence the explicit bound

    2nu(W)-tau(W)>=(q^2/2)(k_0-7r-1)

is correct. Since h>=N/r and q=o(N), k_0>=h/q-r tends to infinity. The required q>=24 and k_0>7r+1 therefore hold eventually. This proves strict ordinary Tuza independently of any unproved global conjecture.

## Scope receipt

The output is an ordinary existential family: a proved finite probabilistic seed, explicit arithmetic amplification and explicit finite decorations/packing templates. No literal huge edge list or exact value of nu(W) is claimed. Exact nu is unnecessary because the upper bound proves2nu<pi and the lower bound proves tau<2nu.

No two-edge resilience has been established or refuted for these W, and none is inferred from seed resilience. Thus H-O2 and its resilient TF strengthening remain untouched. The result closes the stated weaker odd-cover gate on a strongly normalized class, not the ordinary Tuza problem.

This partner audit uses no new graph search, solver, or Lean process. The root is arranging a separate fresh-context reconstruction. Original mission start01:53:58Z, research cutoff09:23:58Z, hard deadline09:53:58Z on2026-11-15 remain unchanged. Producer hash preserved.
