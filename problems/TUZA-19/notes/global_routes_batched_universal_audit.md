# Partner reconstruction audit: batched universal TF/non-WKE normalization

**Verdict: PASS at the stated beta<1 scope.** No mathematical objection found. This is a partner reconstruction, not a fresh-context review: global_routes developed the incidence dependency, participated in earlier unbatched proofs, and received the root's batching sketch before reading this frozen artifact. All local counts, interfaces, link inequalities and asymptotic comparisons below were independently reconstructed. No human or Lean verification is claimed.

Frozen target: notes/root_batched_universal_tf_nonwke.md, SHA256d4ff2e5f0539b43fedc54fab7eef87a01717b43103577e5862b7739a63101913. It was read in full and remains unchanged.

## Exact outcome checked

For each fixed beta in(0,1), unrestricted Tuza is equivalent to its restriction to n-vertex graphs simultaneously having at least n^beta universal vertices, TF, non-WKE components in every vertex link, and minimum triangle codegree at least n^beta. The actual growing-parameter outputs have connected links because their designated universal clique eventually has at least two vertices.

This is conditional counterexample transport, not a proof on the equivalent class. There is no preservation claim for two-edge packing resilience, edge-minimality, or exact minimal-counterexample arithmetic. There is no beta=1 or positive universal-vertex fraction claim.

## Seed, independent batches, and size

The frozen minimal-counterexample argument gives TF, every edge in a triangle and in some minimum cover, and non-WKE link components. Linear Berge-triangle-free copy placement preserves triangle ownership, exact integral tau/nu additivity, TF, and those link components. The quantitative construction is explicitly r-partite with r fixed by the seed, so every role part is independent. This last feature is essential to batching and is actually available, rather than assumed for arbitrary H.

For batches I_i of sizes1<=g_i<=q, the elementary count k=sum_j ceil(|role_part_j|/q)<=h/q+r is valid, with empty role parts contributing no batch. Each local private clique has s_i=q+g_i+6 vertices. Hence

    n_W=q+h+sum_i s_i=q+2h+k(q+6).

No old vertex is counted twice in the sum of batch sizes. The only vertices shared between local graphs are the q designated apices.

## All triangles and exact local covers

The local graph J_i is K_(q+s_i) joined to an independent g_i-set. Its order L_i=2(q+g_i+3) is even; the only missing clique edges are inside I_i. Thus

    e_i=binom(L_i,2)-binom(g_i,2),
    t_i=e_i-L_i^2/4
       =(q+g_i+3)(q+g_i+2)-binom(g_i,2).

Mantel gives the lower cover bound. A balanced cut with A union I_i on one side exists: that side needs exactly three extra B_i vertices. The missing I_i edges remain within one side, so every possible cross edge is present. The cut has exactly L_i^2/4 edges, attaining the cover bound.

Every fresh-vertex triangle is local because that vertex has neighbors only in A union B_i union I_i. Independence of I_i prevents either an old H edge or a triangle with two old vertices and a B_i vertex from lying inside J_i. The only remaining new triangles have one apex and an old H edge, or lie in the apex clique and hence are local. Thus all actual triangles are classified.

The H edge set is disjoint from every local set. The only repeated local edges are E(A), counted k times. Restricting a global cover and subtracting this overcount gives the lower bound

    tau(W)>=tau(H)+sum_i t_i-(k-1)binom(q,2).

The displayed local cut complements all select every A edge and every A-old spoke. Their union with any minimum H-cover covers the mixed triangles and attains that bound. The claimed exact tau formula follows.

## TF interfaces checked

An old triangle uses a containing H minimum cover. A triangle a-uv uses an H minimum cover containing uv; that edge lies in an old triangle, so inherited TF justifies this choice. Both roots are selected locally.

For a triangle T inside J_i, the set A union I_i union V(T) has at most q+g_i+3 vertices, the capacity of one balanced side. This is enough even when all three triangle vertices are fresh. Placing that whole set on one side simultaneously selects every T edge, every A edge and ALL local root spokes. Thus there is no omitted-root repair issue at the interfaces in this batched construction. All chosen local minima agree on E(A), and the global union has the same exact optimum size.

## Link calculations for every matching

The general clique bound is valid for restriction of an arbitrary full-link matching: K_d minus a matching has independence number at most two, so its residual cover requires at least d-2 vertices.

For an old vertex v in I_i, independence of I_i ensures the only local neighbors are A union B_i, a clique. Its old link lies outside I_i, and only A joins that old link to the clique. If c cross matching edges are used, c<=q and

    2|M_0|+c<=q+s_i,
    |M_0|+c<=floor((s_i+2q)/2).

Each inherited old component contributes at least |M_j|+1 residual-cover vertices. The strict total margin ceil(s_i/2)-2+d is correct. A connects the whole link.

For a fresh vertex, the link is K_(q+s_i-1) join I_i, of order2q+2g_i+5. A mixed independent triple cannot be created by deleting a matching: one clique vertex cannot lose two cross edges, and a deleted clique-pair edge already uses both endpoints' matching incidences. Three clique vertices also cannot become independent. Hence any independent set of size at least three is wholly in I_i. The bound alpha<=max(g_i,2) is correct. For g_i>=2, the residual cover has size at least2q+g_i+5 versus matching at most q+g_i+2. For g_i=1, the link is K_(2q+7), requiring a residual cover of size at least2q+5 versus matching at most q+3. Both margins are strictly positive.

For an apex, the B_i cliques are disjoint vertex sets. Their cover restrictions alone contribute sum_i(s_i-2), while the entire matching has at most half of h+sum_i s_i+q-1 vertices. The doubled margin is exactly

    sum_i(s_i-4)-h-q+1=k(q+2)-q+1>0.

For q>=2 the other apices connect the link. For q=1, a link component consists of whole batch groups; the same componentwise calculation gives3k'>0. Thus the quantifier is indeed every component of every link. In the growing-q theorem, all links are connected eventually.

## Packing budget, algebra, and exponent

A packing has at most nu(H) old triangles. Assigning local triangles to one local owner gives at most p_i=floor(e_i/3) for each i; shared A edges can only reduce what is attainable, so this remains a valid upper bound. Every nonlocal new triangle uses two distinct A-old spokes, of which there are qh. Therefore

    nu(W)<=nu(H)+sum_i p_i+qh/2.

No exact clique packing optimum or compatible local packing is assumed.

Writing a=binom(q,2), the defect bound has the correct signs:

    delta(W)>=b delta(G)-sum_i(2p_i-t_i+a)-qh+a.

Put z=q+g_i+3. From p_i<=e_i/3,

    2p_i-t_i+a
      <=z(z+1)/3+g_i(g_i-1)/6+q(q-1)/2
      <=2q^2+4q+4,

where the last inequality uses1<=g_i<=q. Expanding at g_i=q gives precisely2q^2+4q+4, so no coefficient was lost. With k<=h/q+r, the total subtracted loss is at most

    h(3q+4+4/q)+r(2q^2+4q+4).

For fixed seed and q=o(N), this is O_G(Nq). All new edge types have codegree at least q: old edges see all apices; local clique-part edges have q+s_i-2+g_i common neighbors; local clique-to-I_i edges have q+s_i-1. These cover all edges.

For fixed epsilon=1-beta in(0,1), take q=ceil((4N)^(1-epsilon)). Then q tends to infinity, q=o(N), and

    n_W<=3N+6N/q+(r+1)q+6r<=4N

eventually. Thus q>=n_W^beta. The loss is O_G(N^(2-epsilon)); the fixed-seed incidence bound b>=N^2 exp(-C_G sqrt(log N)) dominates it. Consequently a fixed positive seed defect survives. Constants may depend on the fixed hypothetical seed; no uniformity in its order is assumed or needed.

This establishes the complete equivalence by contraposition. The reverse direction is restriction. The beta<1 limitation is correctly retained.

## Verification receipt

All claims above were checked as ordinary mathematics; no graph computation, solver or Lean process was run for this audit. The classical incidence input and the earlier minimal-seed/WKE argument had separate prior reviews. Root is arranging an additional fresh-context audit of this new batched theorem. This partner audit must not be represented as that fresh review.

Original mission clock remains start01:53:58Z, research cutoff09:23:58Z and hard deadline09:53:58Z on2026-11-15. Producer artifact unchanged.
