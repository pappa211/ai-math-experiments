> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exact global minimum-cover condition for an independent apex side

Status: ORDINARY_IDENTITY_CANDIDATE; fresh review required. TUZA-22 challenger, 2026-11-16 local date. This identifies a proof obligation, rather than claiming that the obligation yields a packing theorem.

Let G have a vertex partition A union B with B independent. Write L=G[A], m=|E(L)|, and C=E(L), which is always a triangle cover. For any edge subset S of L, write L[S] for its edge-subgraph on the full A-vertex set, and define

    h(S) = sum over b in B of tau_vertex(L[S][N_G(b)]).

This is exactly the minimum number of cross spokes needed to hit every mixed triangle whose A-base is in S. The mixed triangles at a fixed b correspond to edges of L[S] induced by its A-neighbors, so chosen spokes correspond to a vertex cover of that graph. Cross spokes belonging to different B-apices are distinct, so the separate optima add exactly.

## Exact ordinary-cover formula

    tau_triangle(G)
      = min over S⊆E(L) with L[S] triangle-free of [m−|S|+h(S)].

To prove the lower bound, partition any actual triangle cover into its A-edge set R and its cross-spoke set F. Set S=E(L) minus R. An internal triangle of L[S] would avoid the cover, so L[S] is triangle-free. For every b, its F-spokes must cover the edges of L[S][N_G(b)], and therefore |F|>=h(S). The cover size is at least m−|S|+h(S).

Conversely, for a triangle-free L[S], select every A-edge outside S and, independently at each b, spokes corresponding to a minimum vertex cover of L[S][N_G(b)]. An internal triangle meets the selected A-edges, and a mixed triangle either does too or has its base in S and is hit by the selected spokes. There are no triangles with two B-vertices. The displayed cost is attained.

Consequently C is a minimum ordinary triangle cover if and only if

    h(S)>=|S| for every triangle-free edge subset S of L.

This is equivalently the all-subset condition

    h(S)+tau_triangle(L[S])>=|S| for every S⊆E(L).

For one direction restrict to triangle-free S. For the other, remove a minimum triangle cover D from L[S], leaving S'=S minus D triangle-free. Monotonicity gives h(S)>=h(S')>=|S'|=|S|−tau_triangle(L[S]).

## Relation to local Hall and the private-family relaxation

For S contained in one star of L, each nonempty induced graph L[S][N_G(b)] is a star and has vertex-cover number1. Thus h(S) counts exactly the apex colors appearing on some base of S. The global condition specializes to local star-Hall, but also applies to every other triangle-free edge subset.

The K5,5 construction in notes/challenger_local_hall_boundary_v1.md passes every star inequality but fails at S=E(L): every apex induces a nonempty star, so h(S)=10<25. This is its precise failure of minimum-cover optimality.

If one only seeks to cover the PRIVATE mixed-triangle family, the same formula holds with the triangle-free restriction on S removed. The distinction is substantive: a private-family cover may leave an internal L-triangle uncovered. Therefore no equality between the private-family cover number and tau(G), and no packing bound, is inferred from the displayed identities.
