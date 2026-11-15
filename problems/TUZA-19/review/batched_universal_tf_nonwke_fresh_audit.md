# Fresh audit: batched simultaneous normalization and subexponential corollary

**Verdict: PASS, at the ordinary mathematical proof and independent AI-review level, for the exact equivalences stated below. No material flaw found.** This is not a proof of unrestricted Tuza, human review, a Lean certificate, or an originality finding.

Frozen at 2026-11-15T08:56:11Z. Reviewer: `batched_fresh`, assigned a fresh reconstruction of the frozen arguments. Requested configuration: Astra/Ultra. Exact serving model and reasoning effort are not exposed; the developer identifies the agent only as Codex based on GPT-6. No stronger serving-metadata claim is made.

Original mission clock: start 2026-11-15T01:53:58Z; research cutoff 2026-11-15T09:23:58Z; hard deadline 2026-11-15T09:53:58Z. Before computation, `uname -s` returned `Darwin`; the canonical `LOCAL_ENVIRONMENT` directory was confirmed present. AGENTS.md, MISSION.txt, and operations/clock.json were read. All inspection and file creation were local. No census, solver, Lean process, cloud execution, publication, or producer-file mutation was used.

## 1. Frozen objects and scope of reconstruction

Primary producer: `notes/root_batched_universal_tf_nonwke.md`, SHA256 `d4ff2e5f0539b43fedc54fab7eef87a01717b43103577e5862b7739a63101913`.

Additional corollary: `notes/root_subexponential_normalization_corollary.md`, SHA256 `77da1f5cce4720e4a34b7e1d72c27d2ef4304a5f089129ed87bb611de9887c64`.

The companion manifest records hashes for these objects, the exact dependencies read, and this audit. The audit reconstructed the mathematics from the definitions and displayed construction. Previous review conclusions were not substituted for any proof step. The existing primary-source audit was read for attribution and retained-source provenance; this reviewer did not independently repeat its literature search or PDF inspection.

The main accepted statement is: for every fixed real beta in (0,1), unrestricted Tuza is equivalent to Tuza on the finite simple n-vertex graphs satisfying simultaneously:

- at least n^beta universal vertices;
- TF: each actual triangle has all three edges in some minimum triangle edge cover;
- every connected component of every vertex link is non-WKE;
- each graph edge lies in at least n^beta actual triangles.

Here WKE means that a graph has a matching M and a vertex cover Q of the graph with M deleted, with |Q| <= |M|. The equivalence is proved by transporting a hypothetical violation. The finite local construction works for every integer q >= 1 and every listed batch size. The incidence and exponent conclusions require only an unbounded sequence of sufficiently large parameters; they do not claim a constructed example at every graph order.

## 2. Minimal seed and exact incidence amplification

Assume a violation exists and choose one G with no proper edge-deleted violating subgraph; remove isolated vertices. Put k = nu(G). For each triangle T, deletion of E(T) permits any packing of the remainder to be extended by T, so

    tau(G) <= tau(G-E(T)) + 3
           <= 2nu(G-E(T)) + 3 <= 2k + 1.

Since tau(G) > 2k and the parameters are integers, every inequality is tight and tau(G) = 2k+1. A minimum cover of the remainder together with all three edges of T is consequently a minimum G-cover containing T. Thus G is TF. An edge outside every triangle could be deleted without changing either parameter, so every G-edge lies in a triangle and therefore in some minimum cover.

The non-WKE conclusion also reconstructs directly. If a component L of the link at v had matching M and residual vertex cover Q with |Q| <= |M|, delete all spokes from v to V(L), and delete M. The |M| triangles formed by v and M are edge-disjoint and use only deleted edges. Meanwhile M together with the spokes vQ covers all removed triangles: a triangle using a deleted spoke has its other neighbor in the same link component, and its link edge is either in M or meets Q. Consequently

    nu(G) >= nu(G') + |M|,
    tau(G) <= tau(G') + 2|M|.

G' is a proper edge-deleted subgraph, contradicting minimality and Tuza for G'. This reasoning also covers an isolated singleton link component.

The quantitative amplifier was reconstructed, not merely imported by its conclusion. For fixed r = |V(G)| >= 3, take D=2^d, B=2rD, M=B^d. One squared-norm level in {0,...,D-1}^d has at least D^d/(d(D-1)^2+1) vectors. Their base-B encodings form a set S with

    |S| >= M exp(-C_r sqrt(log M)).

For positive u,v with u+v <= r, an equation u a + v b = (u+v)c between encodings has no carries in base B. It gives the same weighted equation between equal-norm digit vectors. Strict convexity of squared Euclidean norm, or the exact weighted sum of squared distances to c, forces a=b=c.

Use r disjoint role parts and blocks {(i,x+i a): 0 <= i < r}, for 1 <= x <= M and a in S, with each role coordinate in [1,rM]. Two shared vertices determine the same slope and start, proving linearity. In a Berge triangle, the three intersection roles are distinct. Eliminating the starts expresses one slope as a positive weighted average of the other two, with coefficient sum at most r-1. The preceding property then makes the three blocks identical, a contradiction. Hence the blocks are linear and Berge-triangle-free. With N=r^2 M their number b satisfies

    b >= N^2 exp(-C_G sqrt(log N))

after absorbing fixed factors into C_G.

Place a role-labelled G-copy on each block. Copy edge sets are disjoint. If two edges of an actual graph triangle have one copy owner, a different owner of the third edge would share two vertices with that copy, contradicting linearity. If all three edge owners differ, the three owners form a Berge triangle. Thus every actual triangle is copy-local, giving exact integral equalities

    tau(H)=b tau(G),  nu(H)=b nu(G),  delta(H)=b delta(G).

The graph H is r-partite, and each role part is independent. A fixed slope and all M starts supply M nonisolated vertices per role, since the seed has no isolates. Therefore N/r <= h=|V(H)| <= N. TF passes by independent optimal covers on the copied edge sets. At an H-vertex, the neighbor sets from different incident copies are disjoint, and a link edge between them would form a forbidden cross-copy triangle. Each H-link is therefore a disjoint union of seed links, so each of its components is non-WKE.

These are the classical Behrend/Erdos-Frankl-Rodl incidence ingredients. Their use here is not an original incidence-construction claim. The complete elementary parameter argument above suffices for the deduction; source attribution remains as recorded in the frozen dependency and source audit.

## 3. Batching, all actual triangles, and exact cover optimum

Partition each independent role part into nonempty sets I_i of size g_i <= q. Summing ceilings over the r parts gives

    sum_i g_i=h,  1 <= g_i <= q,  k <= h/q+r.

Add a universal q-clique A. For each batch add a disjoint clique B_i of size s_i=q+g_i+6, complete to A and I_i, and add no other edges involving B_i. The local graph J_i on A union B_i union I_i is a complete graph with only the I_i-internal edges absent. Set

    x_i=q+g_i+3,  L_i=2x_i,  a=binom(q,2),
    e_i=binom(L_i,2)-binom(g_i,2),
    t_i=e_i-x_i^2=x_i(x_i-1)-binom(g_i,2).

The graph order is exactly n_W=q+2h+k(q+6).

A triangle with a B_i vertex lies wholly in J_i. The independence of I_i excludes any B_i triangle using an old H-edge. A triangle without fresh vertices is either old in H, has exactly one A-vertex and an H-edge, has two A-vertices and an old vertex and is local to that vertex's batch, or lies wholly in A. These are all actual triangles. Pure A triangles may be assigned to any batch. No assumption about an abstract triangle hypergraph replaces this graph-level check.

Mantel's bound gives tau(J_i) >= e_i-L_i^2/4 = t_i. To recall its elementary justification, in a triangle-free L-vertex graph with m edges every edge uv has deg(u)+deg(v) <= L. Thus sum_v deg(v)^2 <= Lm, whereas Cauchy gives sum_v deg(v)^2 >= 4m^2/L, implying m <= L^2/4. Deleting a triangle edge cover leaves such a triangle-free graph.

For equality, place A union I_i together in one side of a balanced x_i-by-x_i partition, then fill the remaining three positions on that side with fresh vertices. All missing graph edges have both endpoints in I_i, so every cross edge of this balanced cut exists. Its complement within E(J_i) is a t_i-cover selecting all A-edges and all A-I_i spokes.

E(H) and the local edge sets cover E(W); E(H) is disjoint from all local sets, and two different local sets intersect exactly in E(A). For any W-cover C,

    |C|=|C intersect E(H)|+sum_i |C intersect E(J_i)|
         -(k-1)|C intersect E(A)|
       >= tau(H)+sum_i t_i-(k-1)a.

The union of a minimum H-cover and the local covers just constructed attains this bound and covers the one-apex H-edge triangles through their selected spokes. Hence, exactly,

    tau(W)=tau(H)+sum_i(t_i-a)+a.

The sign of the overlap term and the case k=1 were checked. No compatible local packing optimum is being assumed.

## 4. TF reconstruction

For an old triangle, choose its containing minimum H-cover. For a triangle consisting of one apex and an H-edge uv, choose a minimum H-cover containing uv; this exists because every H-edge belongs to a triangle and H is TF. In either case use the local minimum covers selecting all spokes.

For a triangle T inside J_i, prescribe A union I_i union V(T) to lie on one side of the balanced cut. This requires at most q+g_i+3=x_i vertices, since T adds at most three fresh vertices. Complete the side to size x_i. The resulting local cover contains every T-edge, all A-edges, and all A-I_i spokes. Use standard local covers elsewhere and any minimum H-cover. The union still has the exact global minimum size and covers every mixed triangle. Pure A triangles are included in this case. This proves precisely TF, rather than only the existence of a cover meeting the selected triangle.

## 5. Every link component: arbitrary matching and residual cover

For a clique K_d with any matching deleted, the independence number is at most two: a three-vertex independent set would require deleting three mutually incident clique edges. Consequently any residual vertex cover has size at least d-2.

**Old vertex v in I_i.** Its link consists of the clique on A union B_i, its old link components L_1,...,L_d, and all edges between A and these old vertices. There are no B_i-to-old-link edges, because I_i is independent. For an arbitrary matching, write M_0 for its clique restriction, M_j for its restriction to L_j, and c for its cross edges. Then c <= q and

    2|M_0|+c <= q+s_i,
    |M_0|+c <= floor((s_i+2q)/2).

Any residual vertex cover Q has at least q+s_i-2 vertices in the clique and at least |M_j|+1 in each old component. Cross matching edges do not invalidate these restrictions: the internal deleted edges remain exactly M_j. Therefore

    |Q|-|M| >= ceil(s_i/2)-2+d > 0.

The nonempty A connects the entire link. This case is non-WKE even if one formally allows an empty old link.

**Fresh vertex z in B_i.** Its link is K_(q+s_i-1) joined to the independent set I_i, of order 2q+2g_i+5. After deleting a matching, an independent set of size at least three must be wholly in I_i. One clique vertex cannot have two edges to I_i both deleted by a matching; two clique vertices whose mutual edge is deleted cannot also lose their edges to an I_i vertex; three clique vertices likewise cannot be independent. Thus the residual independence number is at most max(g_i,2), and |M| <= q+g_i+2. If g_i >= 2, every residual cover has size at least 2q+g_i+5, giving gap at least q+3. If g_i=1, the link is a clique, its residual cover size is at least 2q+5, and the matching bound is q+3, giving gap at least q+2. The link is connected and non-WKE.

**Universal vertex.** Its link has h old vertices, the disjoint private cliques B_i, and q-1 other apices. Any residual cover has at least sum_i(s_i-2) vertices, while a matching has at most half the link order. Twice the resulting cover-minus-matching lower bound is at least

    2sum_i(s_i-2)-(h+sum_i s_i+q-1)
      =k(q+2)-q+1=(k-1)q+2k+1 > 0.

For q>=2 another apex connects the whole link. For q=1 the link may be disconnected, so the total-link inequality alone would be insufficient. Each component, however, consists of whole connected groups I_i union B_i, joined only by H-edges between their old vertices. If a component has k' groups and h' old vertices, its doubled lower bound is

    sum_in_component s_i-4k'-h'=3k'>0.

Thus every component is non-WKE also when q=1. All vertex types and both connectedness cases are covered. In particular all links are connected once q>=2.

## 6. Packing upper bound, loss, codegree, and beta quantifiers

In any packing there are at most nu(H) old triangles. Assign every local triangle to one containing J_i, including an arbitrary assignment of pure A triangles. The family assigned to J_i consists of edge-disjoint triangles within its e_i edges, so has size at most p_i=floor(e_i/3). The remaining triangles each use exactly two A-old spokes. There are qh such spokes altogether, and disjointness gives

    nu(W) <= nu(H)+sum_i p_i+qh/2.

It is harmless that this generous bound does not subtract spokes already used by local triangles. It is an upper bound and does not assume attainability or compatibility of any local packing.

Combining this bound with the exact cover formula gives

    delta(W) >= b delta(G)-sum_i(2p_i-t_i+a)-qh+a.

With x_i=q+g_i+3, direct algebra gives

    2p_i-t_i+a <= x_i(x_i+1)/3+g_i(g_i-1)/6+q(q-1)/2
                 <= 2q^2+4q+4,

where the final expression is obtained by substituting g_i=q into increasing terms. Consequently the loss after dropping the nonnegative +a is at most

    h(3q+4+4/q)+r(2q^2+4q+4).

For fixed r and growing q=o(N), this is O_G(Nq), using h<=N. Every H-edge has q apex common neighbors. A clique-part edge within J_i has q+s_i+g_i-2 common neighbors there, and an edge between its clique part and I_i has q+s_i-1. Both quantities are at least q. These exhaust all edge types, proving minimum triangle codegree at least q.

For fixed beta in (0,1), take q=ceil((4N)^beta). Then q tends to infinity, q=o(N), and

    n_W <= 3N+6N/q+(r+1)q+6r <= 4N

eventually. Thus q >= n_W^beta. The loss is O_G(N^(1+beta)), whose ratio to b is bounded by a constant times

    exp(-(1-beta)log N+C_G sqrt(log N)) -> 0.

The hypothetical seed has fixed delta(G)>0, so delta(W)>0 for all sufficiently large parameters in the sequence. This proves the nontrivial implication by contraposition, with all four properties simultaneous. No uniformity in the seed-dependent constant is needed: the seed is fixed before N grows. The implication from unrestricted Tuza to the restricted statement is immediate.

## 7. Additional subexponential corollary

The second frozen note also passes. Fix a real exponent a in (1/2,1), now using this letter for the corollary's exponent, and define

    f_a(n)=n exp(-(log n)^a),
    E_a(n)=n^2 exp(-(log n)^a),  n>=2.

Their derivatives with respect to log n, after taking logarithms, are 1-a(log n)^(a-1) and 2-a(log n)^(a-1), respectively. Both are eventually positive. Since h>=N/r tends to infinity and h<=N, eventually E_a(h)<=E_a(N). Furthermore

    E_a(N)/b <= exp(C_G sqrt(log N)-(log N)^a) -> 0.

Thus a uniform estimate tau<=2nu+C E_a(n), for every sufficiently large n-vertex graph and fixed constants C,n_0, contradicts delta(H)=b delta(G)>0 for a hypothetical seed. The constants are uniform over the tested graphs. Exact Tuza gives the converse with C=0.

For the simultaneous normalized class take q=ceil(f_a(4N)). The condition a<1 ensures q tends to infinity, and a>0 ensures q=o(N). The same order bound gives n_W<=4N eventually, so monotonicity yields q>=f_a(n_W). Finally

    Nq/b <= 4 exp(C_G sqrt(log N)-(log(4N))^a)
              + exp(C_G sqrt(log N))/N -> 0.

This explicitly includes the rounding contribution. The batched loss is absorbed and yields a violating graph in the claimed class, proving the second equivalence. For every fixed beta<1, f_a(n)/n^beta tends to infinity, since (1-beta)log n dominates (log n)^a. The stated example a=2/3 is therefore correctly stronger than each fixed-power universal-vertex requirement.

There is no seed-independent coefficient claim at a=1/2: the unknown fixed C_G multiplies sqrt(log N). Nor does this argument reach n/(log n)^C universal vertices, a positive universal-vertex density, or an arbitrary unspecified o(n^2) error.

## 8. Final scope and preservation receipt

No material correction to either frozen producer note is required. The proof is an ordinary conditional counterexample transport based on classical incidence amplification, Mantel's extremal bound, and the reconstructed WKE reduction. Its strongest reviewed consequence is the subexponential simultaneous normalization for each fixed 1/2<a<1, together with the corresponding uniform-error equivalence.

This review does not establish Tuza on the normalized class, construct a counterexample, preserve edge-minimality or packing resilience, or prove novelty of either equivalence. Deleting edges to regain minimality can destroy universality, so the normalized graphs must not silently be treated as minimal counterexamples. No formal or computational certificate is claimed. Exact corollary attribution remains unresolved and is a later publication task.

Both producer files and all read dependencies were hash-checked before this audit was written and again when its manifest was created. Their bytes were left unchanged. Only this audit and its manifest were created by this reviewer.
