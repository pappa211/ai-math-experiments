# Almost linear universal cliques do not rescue the TF/non-WKE odd-cover gate

Status at freeze: ordinary all-size counterconstruction; partner and fresh review requested. This refutes an auxiliary odd-cover inequality on the newly normalized class, while explicitly certifying ordinary Tuza with strict slack. No two-edge packing resilience or minimality is asserted. Original TUZA-19 research cutoff remains 2026-11-15T09:23:58Z.

Write pi(G) for the minimum number of graph edges meeting every actual triangle in an odd number of edges, and beta(G) for the minimum number of monochromatic edges in a vertex two-coloring (equivalently, edges minus maximum cut). Ordinary triangle packing and cover numbers are nu and tau.

## Exact statement and global role

Fix gamma with 1/2<gamma<1. There exist arbitrarily large finite simple n-vertex graphs W with all of:

- at least n exp(-(log n)^gamma) universal vertices;
- minimum triangle codegree at least that quantity;
- TF;
- every vertex link connected and non-WKE;
- tau(W)<2nu(W)<pi(W).

Consequently the gate asserting pi<=2nu on the simultaneous class of the batched normalization is false, even at this almost linear universal-vertex scale. This is relevant because that simultaneous class suffices for unrestricted Tuza by the separately proved normalization. It does not refute the stronger gate with two-edge packing resilience: that property is not established for W. We also do not claim a literal large graph was generated; the seed uses a proved finite probabilistic existence construction.

## 1. Fixed finite seed and role amplification

Use the ordinary K5-incidence existence theorem in notes/global_routes_critical_cut_obstruction.md, for example with its parameter L=1. It gives a connected finite graph S with c edge-disjoint K5 blocks, every actual triangle local to one block, and

    tau(S)=4c=2nu(S),
    beta(S)>4c+2|V(S)|>2nu(S).

Every block has TF: a specified triangle plus the edge on the other two K5 vertices is a minimum four-cover. These covers combine independently, so S has TF. Every S-link is a disjoint union of K4s, since a cross-block link edge would create a nonlocal actual triangle. Each component K4 satisfies the weaker matching-cover inequality

    |Q|>=|M| for every matching M and every cover Q of K4-M,

because |M|<=2 and |Q|>=2. It need not be non-WKE.

Fix this finite S once and for all, write r=|V(S)|, and role-amplify it by the classical EFR system of notes/global_routes_quantitative_amplification.md. The graph H has h vertices, b copies and r independent role parts, with

    N/r<=h<=N,
    b>=N^2 exp(-C_S sqrt(log N)),
    nu(H)=bnu(S), tau(H)=btau(S).

TF and the disjoint-K4 link description pass to H. There is also the exact cut identity

    beta(H)=b beta(S).                              (1)

The lower bound follows by restricting any coloring to each copy and adding its monochromatic edges, since copied edge sets are disjoint. For equality, fix an optimal two-coloring of S and color every H vertex by its role's color. Every copy then realizes the same optimal seed cut. This uses the role labels of this explicit amplifier.

## 2. Batched graph and inherited ordinary identities

Choose an even positive integer q. Partition each independent role part into full batches of size q and at most one nonempty smaller batch. Let I_1,...,I_k be the batches, g_i their sizes, k_0 the number of full batches, and k_1=k-k_0<=r. Then

    sum_i g_i=h, 1<=g_i<=q,
    k<=h/q+r, k_0>=h/q-r.

Build W exactly as in notes/root_batched_universal_tf_nonwke.md: a universal clique A of order q, and for each batch a private clique B_i of order s_i=q+g_i+6, joined completely to A and I_i. Retain H and no other edges. Put

    L_i=2(q+g_i+3), a=binomial(q,2),
    e_i=binomial(L_i,2)-binomial(g_i,2),
    t_i=e_i-L_i^2/4,
    p_i=floor(e_i/3),
    B=sum_i(t_i-a)+a.

The complete triangle classification, exact Mantel cover argument and TF proof in the batched note need only TF of H, not non-WKE seed links. Therefore they apply unchanged:

    n_W=q+2h+k(q+6),
    tau(W)=btau(S)+B,                               (2)
    nu(W)<=bnu(S)+sum_i p_i+qh/2.                   (3)

Every edge has triangle codegree at least q.

The link proof also extends. For an old vertex, write its old link as K4 components. Each contributes |Q_j|>=|M_j|, instead of the stronger +1 used in the normalization theorem. The private clique still gives the strict total margin

    |Q|-|M| >= ceil(s_i/2)-2 >0.

Fresh-vertex and apex-link arguments are identical to the frozen batched proof and do not use the seed's non-WKE property. Once q>=2 every link is connected. Thus W has TF and connected non-WKE links.

## 3. Exact odd-cover identity

A graph with a universal vertex has pi=beta. To see this, fix a universal vertex a_0 and let x_e be odd-cover indicators over F2. Each triangle a_0uv forces

    x_uv=1+x_(a_0u)+x_(a_0v).

Set vertex colors z_(a_0)=0 and z_v=1+x_(a_0v). Then every edge indicator is 1+z_u+z_v, precisely the monochromatic-edge indicator. Conversely every such indicator meets each triangle in one or three edges. This proves equality, including all edge types.

For an old-vertex coloring z, put u_i=|I_i intersect z^(-1)(1)|. A coloring of local J_i has cut size at most

    L_i^2/4-u_i(g_i-u_i),

because J_i is K_(L_i) missing exactly the I_i internal edges. For ANY fixed colors on A and I_i, this bound is attained by coloring B_i to balance the whole local graph: each side initially contains at most q+g_i, smaller than its final capacity q+g_i+3.

Let c_A be the number of cut edges inside A. Counting shared A edges, the full cut size is

    cut_H(z)+sum_i cut_(J_i)-(k-1)c_A.

The last penalty is nonnegative, and a monochromatic A makes it zero while permitting all local balanced extensions. Hence

    maxcut(W)=sum_i L_i^2/4
                +max_z[cut_H(z)-sum_i u_i(g_i-u_i)].

Subtracting from |E(W)| gives the exact identity

    pi(W)=B+min_z[uncut_H(z)+sum_i u_i(g_i-u_i)]
          >=B+beta(H)=B+b beta(S).                 (4)

The additional batch term penalizes splitting a batch. It is not silently discarded in the exact formula; only its nonnegativity is used in the lower bound.

From (3), (4), and the frozen batched algebra,

    pi(W)-2nu(W)
      >=b[beta(S)-2nu(S)]
          -k(2q^2+4q+4)-qh+a.                    (5)

For q=o(N), the subtracted cost is O_S(Nq).

## 4. Explicit ordinary Tuza certificate

It is essential to distinguish the odd-cover obstruction from a Tuza counterexample. Here ordinary Tuza is certified with strict slack for all sufficiently large members.

Every full batch I_i of order q, together with A and two disjoint q-subsets B_i^1,B_i^2 of its private clique (which has 2q+6 vertices), contains a complete four-partite graph K_(q,q,q,q) on these four groups. Its cross edges avoid E(A), E(H) and all other batches' new edges. For even q, this graph has a decomposition into 2q^2 triangles, as follows.

First decompose K_(2,2,2,2). Let the four parts be {a0,a1}, {i0,i1}, {b0,b1}, {c0,c1}. The eight triples are

    a0 b0 c0,  a1 b1 c1,
    i0 b0 c1,  i1 b1 c0,
    i0 c0 a1,  i1 a0 c1,
    i0 a0 b1,  i1 b0 a1.

They use every cross-part edge once. Equivalently these are the eight affine lines not through the origin of AG(2,3), with the four opposite-point pairs as the parts. No design-theory result beyond the displayed triples is needed.

Write q=2t. Replace each of these eight vertices by t vertices. On each base triple X,Y,Z, use all t^2 triples

    (X_j, Y_l, Z_(j+l mod t)), 0<=j,l<t.

These cover every cross edge of that base complete tripartite graph exactly once, and different base triples have disjoint base edge pairs. The result has 8t^2=2q^2 edge-disjoint triangles and covers every edge of K_(q,q,q,q).

Take these decompositions in all k_0 full batches and any maximum H packing. Their edge sets are disjoint even though the batch packings share vertices of A. Thus

    nu(W)>=bnu(S)+2q^2 k_0.                        (6)

For g_i<=q,

    t_i-a <= 3q^2+11q+6=:C_q,
    B<=k C_q+a.

Using tau(S)=2nu(S), (2) and (6) yield

    2nu(W)-tau(W)
      >=k_0(4q^2-C_q)-k_1 C_q-a.

For even q>=24, 4q^2-C_q>=q^2/2, C_q<=7q^2/2, and a<=q^2/2. Therefore

    2nu(W)-tau(W)
      >=(q^2/2)(k_0-7r-1)>0                       (7)

whenever k_0>7r+1. This is an explicit ordinary packing-versus-cover certificate; no reliance on the truth of Tuza is present.

## 5. Almost linear universal scale and all quantifiers

Fix gamma in(1/2,1) and set

    f_gamma(x)=x exp(-(log x)^gamma),
    q=2 ceil(f_gamma(4N)/2).

Then q is even, tends to infinity, and satisfies q=o(N). It follows from the same order estimate as the batched normalization that n_W<=4N eventually. The function f_gamma is eventually increasing, so

    q>=f_gamma(n_W).

The loss O_S(Nq) in (5) is o(b), since

    exp(C_S sqrt(log N)-(log(4N))^gamma) -->0.

The fixed seed gap beta(S)-2nu(S)>0 therefore makes (5) strictly positive. Meanwhile

    k_0>=h/q-r>=N/(rq)-r -->infinity,

so eventually q>=24 and k_0>7r+1, giving strict ordinary Tuza by (7). All simultaneous TF, connected-link, universality and codegree properties have already been proved. The orders n_W tend to infinity, completing the exact theorem.

## Scope and remaining gate

This closes the proposed odd-cover route on the stronger normalized class, rather than merely at a single apex. It does not show that every W has a small packing blocker, and it does not establish two-edge packing resilience. No conclusion about H-O2 (criticality plus two-edge resilience), or its TF strengthening, is drawn. A later attempt to use those additional premises must verify them independently.

The large graph is specified by a finite probabilistic existence seed followed by an explicit arithmetic incidence sequence and explicit decorations. No full large edge list is claimed. Ordinary Tuza holds by the literal algebraic packing family in Section4. The only finite local design required is the eight displayed triangles. All claims are ordinary mathematics; no Lean, remote computation or publication was used. The incidence ingredient is classical, the initial K5-cut seed adapts TUZA-18, and originality of this combined obstruction remains unresolved.
