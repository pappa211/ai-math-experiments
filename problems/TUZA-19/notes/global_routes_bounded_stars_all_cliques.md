# Every fixed number of vertex stars plus all clique packing polytopes still fails

Status: complete ordinary strengthening proposed by root and independently reconstructed by global_routes. Fresh review of this frozen complete proof is requested. Its fixed ten-vertex base has literal certificates and separate fresh review. No new graph census, solver, or Lean job is used. No Tuza counterexample, cover inequality, joint-moment hierarchy result, or originality claim is asserted.

## 1. Precise combined relaxation

Let T(G) be all actual graph triangles. For a triangle family F, let P(F) be the convex hull of incidence vectors of edge-disjoint subfamilies of F. For S subset V(G), let T_S be all triangles with at least one vertex in S. For a clique Q, let T(Q) be its internal triangles. For each fixed integer k>=1 set

    L_(k,cl)(G)={x>=0 : x|T_S in P(T_S) for every1<=|S|<=k,
                        x|T(Q) in P(T(Q)) for EVERY clique Q},
    rho_(k,cl)(G)=max sum_T x_T over this set.

The star restrictions are exact packing polytopes for entire unions of at most k vertex stars, not just edge capacities or separate link constraints. The clique restrictions are exact packing polytopes for every clique, with no bound on clique size. They include all clique packing inequalities. The same triangle coordinates must satisfy all restrictions, but no common joint probability distribution or higher-order moment system is imposed.

**Theorem.** For every fixed k there are arbitrarily large complete multipartite graphs CP_r=K_(2,...,2), with r two-vertex parts, such that

    rho_(k,cl)(CP_r)=|E(CP_r)|/3=nu(CP_r)+4/3.

Each such graph is TF, two-edge packing resilient, and has every connected link non-WKE. In particular floor(rho_(k,cl))>nu. For every fixed epsilon in(0,2) and C>=0, incidence amplifications of a suitable fixed CP_r retain all those structural properties and satisfy

    rho_(k,cl)(H)>nu(H)+C |V(H)|^(2-epsilon).

Thus imposing the earlier two constraint systems simultaneously does not restore exact or fixed-power-saving additive synchronization. The theorem concerns integral packing certificates; no inequality relating tau to2rho_(k,cl) is established or refuted. The examples still satisfy Tuza with substantial slack.

## 2. Explicit all-size CP family with every four-cycle leave

Use the sequence r=5,11,23,47,..., namely r=3*2^j-1 for j>=1. Each r is odd and congruent2 modulo3. The graph CP_r has

    n=2r, m=2r(r-1), |T|=8 binom(r,3),

and every vertex has even degree2r-2. Since m=1 modulo3, a packing larger than (m-4)/3 would leave exactly one edge. Degree parity rules this out. Therefore

    nu(CP_r)<=(2r(r-1)-4)/3 =: p_r.

The three literal CP5 packings in notes/global_routes_clique_link_polytope_obstruction.md leave four-cycles of all possible twin-part patterns2+2,2+1+1,1+1+1+1. Their used edges were separately checked; the scope correction notes/global_routes_clique_link_erratum.md concerns only a K5 upper-bound sentence and does not affect these packings.

Here is an elementary recurrence preserving each of those leaves and its part pattern. From CP_r, add2r+2 new vertices. A complete graph on these new vertices has a one-factorization into2r+1 perfect matchings. Designate one factor as the r+1 new twin pairs, so the new induced graph is CP_(r+1). Assign each of the remaining2r factors to a different old vertex v. For each edge xy in its assigned factor, append triangle vxy to the old packing.

Every old-new edge is used once because its old vertex's factor is perfect. Every graph edge among new vertices is used once because the assigned factors partition all new edges except the designated twin matching. No old-old edge is added to the packing. Thus the resulting graph is CP_(2r+1), and its leave is precisely the old four-cycle. The old twin relation is unchanged, so its2/3/4-part pattern is unchanged. The new packing has the maximum size prescribed by the parity upper bound.

For completeness, the required one-factorization is explicit. Label the new vertices infinity and the residues modulo the odd integer2r+1. For each residue j, use

    F_j={(infinity,j)} union {(j+t,j-t):1<=t<=r}.

Each F_j is perfect. A finite edge belongs to the unique factor given by its midpoint modulo2r+1, and an infinity edge belongs to its endpoint's factor. Thus these factors partition the complete graph.

Inductively there is a maximum p_r-packing leaving a four-cycle of each possible part pattern. Pair permutations and swaps within parts act transitively on cycles of each pattern, so EVERY actual four-cycle can be the leave of a maximum packing.

Every pair of graph edges lies in a four-cycle when r>=5. Adjacent edges extend using a vertex from a part different from the parts of their three endpoints. For disjoint edges uv,xy, one of the two cross pairings ux,vy or uy,vx must be present: failure of both would force the endpoints of uv or of xy into one part. Hence a maximum packing can avoid any prescribed pair of edges. This proves two-edge resilience for the whole sequence, with no new search.

## 3. Cover and link properties of the whole family

A triangle-free graph on2r vertices has at most r^2 edges. Equality is K_(r,r), by the equality case of the elementary Mantel degree-sum argument. If it lay inside CP_r, each missing twin edge would have to stay within a bipartition class; both class sizes would be even. Since r is odd, equality is impossible. Therefore at most r^2-1 graph edges can remain after a triangle cover is removed.

A cut putting (r-1)/2 whole parts on one side and (r+1)/2 on the other has side sizes r-1 and r+1 and contains r^2-1 graph edges. Its complement is a cover. Thus

    tau(CP_r)=m-(r^2-1)=(r-1)^2.

Every triangle uses three distinct parts. Since (r+1)/2>=3, these three parts fit on the larger side of such a cut. Its minimum cover contains the triangle, proving TF. The same cut complements are odd covers, so pi=tau; this is not a parity-cover counterexample.

Every vertex link is CP_(r-1), on2r-2 vertices. Deleting any matching cannot create an independent triple: a triple in three parts has three original edges, and a triple in two parts has two original edges sharing an endpoint. Neither set can be a matching. Hence every cover of a link minus a matching has size at least2r-4, while the matching has size at most r-1. Since r>=5, the former is strictly larger. Each link is connected and non-WKE.

## 4. Exact local states on every bounded union of vertex stars

Fix k. Choose r sufficiently large in the sequence so that

    r>=23, k<=r-4, p_r>8(r-1),
    p_r binom(k,3)/binom(r-4,3)<1,
    8 binom(k,3)/(2r-4)<1.                            (A)

For k<3 use binom(k,3)=0. Such r exist arbitrarily far along the sequence: p_r grows quadratically, whereas the first fraction with binom(k,3) is O_k(1/r), as is the second. The redundant-looking last inequality makes the mixture probability explicit.

Fix one maximum packing P with a four-cycle leave. Exclude every twin part meeting the leave; this excludes at most four parts and at most eight vertices. Let B be the remaining collection of parts. Every graph edge incident with a vertex in a B-part is covered by P. There is a packed triangle wholly inside these parts: at most8(r-1) packed triangles can meet the excluded vertices, since each vertex lies in at most r-1 packed triangles, while p_r>8(r-1).

Let S be any set of1,...,k vertices. Enlarge S to Z, the union of all its whole twin parts. Write t for the number of these parts; then t<=k. We will realize the uniform vector on ALL triangles meeting Z, which implies the required statement for S by restricting each packing further.

First suppose t>=3. A uniformly random t-subset U of the B-parts has expected number of packed triangles completely inside its vertices at most

    p_r binom(t,3)/binom(|B|,3)
      <=p_r binom(k,3)/binom(r-4,3)<1.

Every actual triangle uses three distinct parts, which justifies this probability exactly. The count is an integer, so some U_0 has zero internal packed triangles. There is also a t-subset U_1 of the B-parts containing at least one packed triangle, using the preceding existence and t<=|B|. Let R_1>=1 be its internal packed-triangle count.

Relabel the parts and the twins of P to carry U_i onto the t parts comprising Z, obtaining maximum packings P_i. Both leaves avoid Z, so both packings cover every graph edge incident with Z. Mix P_1 with probability

    lambda=8 binom(t,3)/((2r-4) R_1),

and P_0 with probability1-lambda. By(A), 0<lambda<1. The expected internal-triangle count is then8 binom(t,3)/(2r-4).

Finally symmetrize by all permutations of the t Z-parts, all permutations of the outside parts, and independent swaps of the twins. These are graph automorphisms. The resulting finite mixture still consists of global maximum packings and covers every edge incident with Z. Every triangle with exactly i vertices in Z has one common marginal p_i, for i=1,2,3, because these are precisely the three relevant orbits under this group.

There are8 binom(t,3) triangles internal to Z, so the chosen expected count gives

    p_3=1/(2r-4).

For any graph edge inside Z, exactly2t-4 possible third vertices are in Z and2r-2t are outside. That edge is always covered, hence

    (2t-4)p_3+(2r-2t)p_2=1.

This gives p_2=1/(2r-4). For an edge crossing Z and its complement, there are2t-2 possible third vertices in Z and2r-2t-2 outside, so

    (2t-2)p_2+(2r-2t-2)p_1=1,

and p_1=1/(2r-4). The denominators are positive because t<=r-4.

If t=2, no type3 triangle exists. Choose any two B-parts, relabel them onto Z, and symmetrize the resulting maximum packing. An internal Z-edge gives (2r-4)p_2=1; the crossing-edge equation then gives p_1=1/(2r-4). No mixture or nonexistent p_3 is needed.

If t=1, all triangles meeting Z have exactly one vertex in Z. Choose any B-part, relabel and symmetrize. A crossing edge gives (2r-4)p_1=1. There is no internal graph edge in that one twin part, so no other equation is assumed.

In every case, restriction of each sampled packing to T_Z gives a convex combination realizing the uniform target on T_Z. Restrict further to T_S. This proves membership in P(T_S) for every |S|<=k. The local distributions can be restrictions of actual global maximum packings, although the distributions for different S are not required to be jointly consistent.

## 5. All clique packing polytopes, with no bound on clique size

Every clique Q in CP_r has size s<=r, with at most one vertex from each part. The empty-triangle cases s<=2 are automatic. For s>=3, partition its s vertices into parts of sizes

    a=floor(s/3), b=floor((s+1)/3), c=ceil(s/3).

There is a valid ab-packing in this K_s. Label the three parts by integers0,...,a-1,0,...,b-1,0,...,c-1; use the triangle (i,j,i+j modulo c) for every pair(i,j). Every edge between the first two parts is used once. Since a,b<=c, edges from either of these parts to the third are also used at most once. Thus the triangles are edge-disjoint. Maximality or an exact complete-graph packing formula is unnecessary.

For every s>=3,

    ab>=s(s-1)/12.

Writing s=3d,3d+1,3d+2, the differences are respectively d(d+1)/4, d(d-1)/4, and d(d+1)/4-1/6, all nonnegative for the relevant d>=1. Also, since s<=r,

    binom(s,3)/(2r-4)
       =[s(s-1)/12] [(s-2)/(r-2)] <=ab.

Uniformly permute the displayed ab-packing over the s vertices, and give this distribution probability

    lambda_s=binom(s,3)/((2r-4)ab)<=1;

give the empty packing the remaining probability. Each clique triangle then has marginal1/(2r-4). This is an explicit convex combination inside the FULL clique packing polytope. It works for every clique size up to r simultaneously at the common coordinate vector.

## 6. Exact objective and gap

Sections4 and5 prove that x_T=1/(2r-4) belongs to L_(k,cl)(CP_r). Its objective is

    8 binom(r,3)/(2r-4)=2r(r-1)/3=m/3.

The singleton-star constraints imply every graph-edge capacity inequality, because all triangles containing an edge belong to the star of either endpoint. Summing those inequalities gives3sum_T x_T<=m. Therefore

    rho_(k,cl)(CP_r)=m/3=p_r+4/3=nu(CP_r)+4/3.

Since m=1 modulo3, even flooring the relaxation gives nu+1. All local conditions proved above hold together with TF, two-edge resilience and non-WKE links from Sections2–3.

## 7. Incidence amplification of the entire combined system

Fix k and one sufficiently large CP_r from the preceding theorem. Place b copies in a linear, Berge-triangle-free incidence system. The accepted ownership argument gives edge-disjoint copies and no nonlocal actual triangles. For the union H,

    nu(H)=b p_r, tau(H)=b(r-1)^2, |E(H)|=bm.

TF and two-edge resilience pass independently in each copy. Every link is a disjoint union of inherited CP_(r-1) links, so every component is non-WKE.

For any global set S with |S|<=k, let S_i be its intersection with copy i. Use the Section4 local distribution in each copy for S_i, choosing an arbitrary maximum copy-packing when S_i is empty. Independent products and union give actual global maximum packings because copy edge sets are disjoint. Restricting to T_S has every target marginal1/(2r-4). Hence every bounded-star constraint holds, even when a shared vertex of S belongs to many copies.

Every clique with at least three vertices lies in one copy: a triangle has one owner, and a further clique vertex forms a triangle sharing one of its edges, forcing the same owner. Thus all clique packing polytopes pass too. No cross-copy clique with nonempty triangle coordinates is missed.

The common vector saturates every graph edge. The capacity upper bound is sharp, so

    rho_(k,cl)(H)=bm/3, rho_(k,cl)(H)-nu(H)=4b/3.

The fixed-ratio incidence lemma already makes this gap larger than C|V(H)| for arbitrary C. The classical quantitative construction gives an unbounded sequence with ambient N and b>=N^2 exp(-C_r sqrt(log N)). For any fixed epsilon in(0,2), b/N^(2-epsilon) tends to infinity, while |V(H)|<=N. This proves the stated power-saving additive obstruction. Its source and exact quantifiers are preserved in notes/global_routes_quantitative_amplification.md and review/efr_power_saving_source_audit.md.

## 8. Dependencies, verification, and limits

The CP5 literal packings and the three possible leave patterns are frozen in notes/global_routes_clique_link_polytope_obstruction.md, supported by checks/global_routes_clique_link_control.py and evidence/global_routes/clique_link_control.json. The original fixed note's K5 upper-bound wording is corrected separately in notes/global_routes_clique_link_erratum.md. This new proof never needs the optimum packing number of a clique for its local mixtures; the explicit Latin-rectangle packing suffices.

The doubling is an elementary one-factorization construction; the all-size local-state lemma is an averaging and symmetry argument. No larger control graph was generated or optimized. Complete-equipartite maximum-packing existence has classical prior literature, including a primary abstract located by packing_critic for Billington–Lindner(1996), *Maximum packings of uniform group divisible triple systems*, Journal of Combinatorial Designs4(6),397–404. Its detailed exceptions and leave classification were not imported here. No novelty is claimed for the packing family or the combined-polytope implication without a separate attribution audit.

This proof unifies the earlier separate bounded-star obstruction and full clique-plus-link obstruction. Its constraint scope is precise: coordinate restrictions to exact local polytopes. It does not refute systems imposing a common joint distribution, higher moments, global parity/leave inequalities, or other global constraints. It does not prove or refute tau<=2rho_(k,cl), and it does not rule out rounding or cover arguments exploiting the substantial cover slack of these examples.

No unrestricted Tuza solution follows. No two-edge-resilience preservation under a new universal-clique construction is claimed. The only amplification used here preserves exact triangle ownership.

Ordinary proof provenance: root proposed the all-size strengthening and the direct recurrence; global_routes reconstructed every bound, missing-type case, mixture and clique inequality before freezing this note. This is collaborative mathematical reconstruction, not a fresh-context audit. A separate fresh review is requested. Original mission start01:53:58Z, research cutoff09:23:58Z and hard deadline09:53:58Z on2026-11-15 remain unchanged.
