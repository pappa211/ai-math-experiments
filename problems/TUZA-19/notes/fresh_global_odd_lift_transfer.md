# Optimal odd-cover double lifts: an exact transfer obstruction

TUZA-19 ordinary research, requested Astra/Ultra; actual precise serving identity not independently exposed. Original start `2026-11-15T01:53:58Z`, cutoff `09:23:58Z`, hard deadline `09:53:58Z` retained. MISSION.txt and the original clock were reread for this lane. All computation was local on Darwin and all outputs stayed in the private workspace. No human review or Lean verification is claimed.

## Proposed global mechanism and the decisive gate

For an odd triangle cover C, write x_e=1_{e in C} and y=1-x over F2. Then every actual triangle has y-sum zero. The two-lift associated with y has vertices (v,0),(v,1) and edges

    (u,i)--(v,i+y_uv).

Every base triangle lifts to two actual triangles. Conversely every actual triangle in the lift projects to an actual base triangle: a projected closed three-walk with a repeated vertex would immediately backtrack, which local injectivity of a graph cover forbids for an actual triangle. Thus there is no uncounted lifted triangle family.

The possible route was to choose a minimum odd cover, exploit the lifted local cut structure, and transfer a packing or cover result back with factor two. Two particularly natural numerical bridges would be

    nu(lift)<=2nu(G),
    pi(G)<=tau(lift)/2   (or pi(G)<=pi(lift)/2).

If a useful cover theorem for the lift supplied tau(lift)<=2nu(lift), those bridges would yield pi(G)<=2nu(G). Such a theorem is not automatic: the lift is larger, still contains triangles, and need not preserve criticality or resilience. More fundamentally, BOTH displayed numerical bridges are false even when EVERY choice of minimum odd cover gives the same nontrivial connected lift. The family below is a decisive ordinary counterexample to that unrestricted transfer mechanism.

This is not a counterexample to H-O2. It satisfies edge-cover-criticality and resilience to every SINGLE edge deletion, but fails the required two-edge resilience. Therefore an H-O2-specific transfer theorem remains logically possible and would need to use that extra hypothesis in an essential way.

## The arbitrary family

Let n=4r+1 with r>=2, and let G_n be the square of the n-cycle, with vertices modulo n and edges

    a_i={i,i+1}   (rim edges),
    b_i={i,i+2}   (chords).

Write k=(n-1)/2=2r. Then

    nu(G_n)=k,
    tau(G_n)=pi(G_n)=k+1.

G_n is edge-cover-critical and nu(G_n-e)=k for every graph edge e. Every minimum odd cover C induces the connected lift C_(2n)^2, for which

    nu(lift)=tau(lift)=pi(lift)=n.

Consequently

    nu(lift)=2nu(G_n)+1,
    tau(lift)=pi(lift)=2pi(G_n)-1.

The missing two-edge hypothesis is exact: deleting a_0 and a_2 lowers the base packing number to k-1.

## All actual triangles and exact base parameters

For n>=7 the actual triangles are exactly

    T_i={i,i+1,i+2}.

To check this exhaustively in the ordinary argument, the neighbors of vertex 0 are -2,-1,1,2. Among them the only adjacent pairs are {-2,-1}, {-1,1}, {1,2}; n>=7 excludes the short-cycle wraparound exceptions. Translating gives precisely the listed family.

Each rim edge a_i is in T_(i-1) and T_i. Each chord b_i is in T_i alone. Distinct triangles share an edge exactly when their indices are consecutive modulo n. Hence their edge-conflict graph is C_n and nu(G_n)=floor(n/2)=k.

Every edge covers at most two triangles, so tau(G_n)>=ceil(n/2)=k+1. Select the k rim edges

    a_0,a_2,...,a_(2k-2)

and the chord b_(n-2). The rim edges meet all triangles except T_(n-2), each exactly once; the selected chord meets that remaining triangle. This is an odd cover of size k+1, proving both ordinary and odd cover optima.

Rotations of this cover include every rim edge and every chord. Every edge therefore belongs to some minimum ordinary cover. For any graph, that condition is equivalent to tau(G-e)=tau(G)-1: remove e from such a minimum cover for the upper bound, and add e to a cover of G-e for the reverse inequality. Thus G_n is edge-cover-critical.

Deleting a chord removes one triangle, leaving the triangle-conflict path on n-1=2k vertices, with packing number k. Deleting a rim edge removes two consecutive triangles, leaving a path on n-2=2k-1 vertices, also with packing number k. This proves resilience to EVERY single edge deletion.

Deleting a_0 and a_2 removes the four consecutive triangle indices n-1,0,1,2. The remaining conflict graph is a path on n-4=2k-3 vertices, whose independence number is k-1. Thus those two graph edges form a packing blocker.

## Every minimum odd cover has nontrivial monodromy

Let C be ANY odd cover of minimum size k+1. Write u for its number of selected rim edges and v for its number of selected chords. Then u+v=k+1, and the sum of its triangle loads is 2u+v=u+k+1<=2k+2=n+1.

Every triangle load is a positive odd integer. If any triangle had load three, the total would be at least n+2, contradicting the bound. Thus every triangle has load one and

    2u+v=n,    u+v=k+1,
    u=k,      v=1.

For its complementary voltage y=1-C, the sum around the rim cycle is

    sum_i y_(a_i) = n-u = k+1 = 1 mod2,

since k is even. Thus y is not a global cut, and this conclusion holds for every minimizing odd cover, not merely one unfavorable choice.

The triangle equations determine all chord voltages:

    y_(b_i)=y_(a_i)+y_(a_(i+1))  over F2.

Switching a voltage at a vertex swaps the two vertices in its lift fibre and gives an isomorphic covering graph. Normalize successively so that all rim voltages except the final wraparound edge are zero. The last rim voltage is their total, namely one. The chord equations then give voltage one exactly on the two wraparound chords and zero elsewhere. This is precisely the quotient map

    C_(2n)^2 -> C_n^2,    j maps to j mod n.

Equivalently, following the lifted rim visits all 2n vertices before closing, and each lifted chord joins vertices two steps apart along that lifted rim. Hence every optimal odd-cover lift is the same connected square of an even cycle, up to relabeling.

Its actual triangle-conflict graph is C_(2n), giving packing number n. The n alternating rim edges form an odd cover meeting each triangle exactly once. Packing-cover weak duality now gives tau=pi=n. This proves the transfer failures.

## Further exact limits of the lift operation

The optimal lift need not retain the base's criticality. Every cover of C_(2n)^2 of minimum size n must use only rim edges: n selected edges must cover 2n triangles, and chords cover only one triangle. Hence no chord lies in any minimum cover, so the lift is not edge-cover-critical. It also loses single-edge packing resilience: deleting one rim edge leaves a conflict path on 2n-2 vertices and lowers the packing number from n to n-1.

The voltage choice must not be confused with its complement. Using x=C rather than y=1-C makes every triangle have odd voltage, so the x-lift is triangle-free. It need not be bipartite. In the present family, the x-voltage around the odd rim cycle is u=k=0 mod2, so that rim lifts to two odd n-cycles. Thus the alternative triangle-killing lift does not automatically put the problem into a bipartite matching setting either.

The additive obstruction can be arbitrarily large while the graph remains connected. Identify one vertex from each of q copies of G_n and otherwise keep them disjoint. Actual triangles remain within the copies, so tau, pi and nu add. Every optimal odd cover is optimal on every copy and has nontrivial monodromy there. Its two-lift consists of the connected lifted copies sharing the two lifts of the identified vertex; they share no edges and create no new triangles. Thus

    nu(lift)-2nu(base)=q,
    2pi(base)-pi(lift)=q.

The base remains edge-cover-critical and single-edge packing-resilient. Its two-edge blockers remain inside individual copies. This is an arbitrary-family consequence, not a larger finite search.

## Independent literal certificate for the first case

`checks/fresh_global_odd_lift.py` is a standard-library-only checker for n=9. It enumerates all actual base and lift triangles, exhausts all 2^9 rim assignments and derives the chord values from the triangle parity equations, finds all nine minimum odd covers, checks their common nontrivial monodromy, and verifies the lifted cycle-square isomorphism. It also exhaustively computes the small packing instances for all single-edge deletions and the specified two-edge blocker. No producer SAT or packing solver is imported.

Observed result:

    base: 9 vertices, 18 edges, 9 triangles, nu=4, tau=pi=5;
    lift: 18 vertices, 36 edges, 18 triangles, nu=tau=pi=9;
    all nine minimum odd covers have four selected rims and one chord.

Complete edge lists, covers, packings and deletion witnesses are in `evidence/fresh_global/odd_lift_c9.json`.

Hashes:

- Checker: `7aa163c391138c5ee853c7cfe8c8b564a594b3d887226dbbb0e6b145918a20c0`.
- Result: `dbc77d1e9817a6e0ff370ee1f2c8f607d0bb37185bbdd81fb7e423d37a0423a4`.

Reproduce from the mission workspace:

```sh
source LOCAL_ENVIRONMENT
python3 checks/fresh_global_odd_lift.py
```

The arbitrary-n and connected-amplification statements rest on the ordinary proof above, not on enumeration.

## One targeted surface test, retained as a failed H-O2 attempt

A separate explicitly defined triangular-lattice Klein-bottle quotient was tested to see whether the lift-transfer failure could survive BOTH H-O2 hypotheses. This was one fixed graph, not a census or parameter sweep.

The lattice uses coordinates (p,q) of the same parity, edge increments (1,1),(1,-1),(2,0), q modulo6, and the glide identification

    (p,q) ~ (p+7,-q-1).

A fundamental domain p=0,...,6 has 21 vertices. Literal enumeration gives 63 edges and 42 actual triangles; every edge is in exactly two triangles. The 21 diagonal edges meet each triangle exactly once, so tau=pi=21 by the matching triangle-count lower bound. Eight explicitly checked 21-edge covers collectively contain every graph edge, certifying edge-cover-criticality.

An independently written exact include/exclude recursion on the actual triangle-conflict graph gives nu=18 (7,398 memoized states). The complementary voltage of the displayed minimum odd cover gives a lift with 126 edges and an explicit packing of 42 triangles using every edge, so its packing number is exactly42, well above twice18.

However, deleting graph edges (0,3) and (0,5) lowers nu to17. A CaDiCaL test first found this failure; a separate exact recursion on the surviving literal triangle family confirmed17 with2,281 memoized states. Therefore this graph is NOT an H-O2 counterexample. The run stopped at that decisive failure; no nearby quotient search followed.

Artifacts:

- `checks/fresh_global_lift_explore.py`, SHA-256 `a25ef232550fda5ccfee5a02d9410f7a14b02853914f02b936d29d076026e264`.
- `evidence/fresh_global/klein_lift_explore.json`, SHA-256 `fb92179ac3260c4294d45aa34f0c8f3acf94cc2766d339e160382946b5088cd0`.
- Borrowed SAT interface `checks/global_routes_sat.py`, observed SHA-256 `8e0d5d2c15b0bb2c87a7c6e032ba86de619f2b94eb6a730d2809cf3e3e9aa2cb`.

The SAT interface rechecks positive models against literal graph constraints. Its UNSAT result is not claimed as kernel-verified; the decisive packing values were also checked by the independent recursion. The retained JSON includes the actual graph, the critical-cover family, packing certificates, lift packing, and the independently checked blocker. This finite surface result is separate from the ordinary cycle-square family theorem.

## Decision and exact remaining gap

The minimum odd-cover and double-lift perspective is mathematically distinct from the earlier apex and clique-decoration attempts, but the straightforward factor-two transfer is false. Optimality of the coset leader does not make the lift two disjoint layers, does not bound its packing number by twice the base packing number, does not guarantee cover descent at half the lifted cost, and does not preserve the base's criticality or resilience properties.

An H-O2-specific argument could still succeed, but it must extract a consequence of resilience to TWO edge deletions that excludes or controls these monodromy-induced packing gains. Neither edge criticality nor resilience to one edge is enough. No theorem supplying that control, and no actual counterexample satisfying both H-O2 hypotheses, emerged here. The unrestricted transfer lane is closed after preserving this exact obstruction; enlarging the surface or cycle examples would not supply the missing implication.
