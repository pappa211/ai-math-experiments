# Structural constraints on parity-gate gadget repairs

Ordinary TUZA-19 research, local Darwin only. Original start `2026-11-15T01:53:58Z`, research cutoff `09:23:58Z`, hard deadline `09:53:58Z` retained. Requested controls Astra/Ultra; precise actual serving identity is not independently exposed. No Lean or human verification is claimed. This note proves obstruction lemmas for proposed constructions, not the global parity gate.

The global gate asks whether pi(G)<=2nu(G), where pi(G) is the least number of selected edges meeting EVERY actual triangle oddly (in one or three edges), under both hypotheses:

1. Every edge e is cover-critical: tau(G-e)=tau(G)-1.
2. Every edge set S of size at most two is packing-resilient: nu(G-S)=nu(G).

Global_routes supplied the edge-critical cone obstruction to the first hypothesis alone. The present task is to test repairs of its small packing blockers without destroying the parity obstruction. No actual counterexample meeting both hypotheses was found in this lane.

## 1. Elementary criticality facts

**Lemma 1.** An edge e is cover-critical if and only if some minimum triangle cover contains e.

If a minimum cover C contains e, then C minus e covers G-e, giving tau(G-e)<=tau(G)-1. Conversely every cover of G-e can be extended by e, so tau(G-e)>=tau(G)-1. If e is critical, extend a minimum cover of G-e by e to obtain a minimum cover of G containing e.

**Lemma 2.** Suppose G is edge-cover-critical, f is a missing edge, and tau(G+f)=tau(G)+1. Then G+f is edge-cover-critical.

Write tau(G)=c. Deleting f leaves cover number c. For an old edge e, take a (c-1)-cover of G-e and add f; this covers (G+f)-e with c edges. Deleting one edge can lower cover number by at most one, so equality follows. Also pi(G+f)>=pi(G), because restricting any odd cover of G+f to old edges gives an odd cover of G. Finally nu(G+f)<=nu(G)+1, since any new triangle contains f and an edge-disjoint packing uses at most one such triangle.

This suggests a precise constructive test: additions that increase tau but not nu preserve criticality and a pre-existing parity gap. No sequence reaching two-edge resilience was constructed here. For dense cone bases, new rim triangles often increase nu while leaving the old matching/spoke blocker mechanism intact.

## 2. Fresh K4/K5 edge decorations: exact formula and complete failure as a repair

Let G be any finite simple graph and R a set of its edges. For each e=uv in R choose q_e in {4,5}, add q_e-2 fresh vertices, and form a K_(q_e) on those vertices together with u,v. Fresh vertex sets are pairwise disjoint. Let W be the union. Put

    p_e=1 for q_e=4, and p_e=2 for q_e=5,
    a_e=2p_e.

**Triangle ownership.** Every triangle containing a fresh vertex lies entirely in its own clique: all neighbors of that vertex belong to that clique, whose only original vertices are u,v. Triangles containing only original vertices are exactly the triangles of G. Thus the complete actual triangle family is the union of core triangles and local clique triangles, with no omitted crossing family. No local clique triangle is a core triangle because each clique has only two original vertices.

**Local facts.** K4 has packing number one and ordinary/odd cover number two. K5 has packing number two and ordinary/odd cover number four. The cover bounds follow from the maximum triangle-free subgraphs K2,2 and K2,3; their optimality is the elementary Mantel inequality. Odd covers in a complete graph are complements of cuts: writing y=1-x, the triangle equations y_ij+y_jk+y_ki=0 force y_ij=z_i+z_j over F2 after fixing one vertex. Hence balanced cuts attain the same local cover costs.

For either q, both prescribed values x_uv=0 and x_uv=1 occur in a minimum odd cover, using a balanced bipartition with u,v respectively separated or together. Every graph edge occurs in some minimum ordinary cover by symmetry of these balanced partitions.

A maximum local packing can avoid uv. For K4, take the triangle on u and the two fresh vertices. For K5, with fresh vertices a,b,c, use triangles uab and vac. These two share only vertex a. The K5 packing upper bound two can be seen without enumeration: three edge-disjoint triangles would use nine of its ten edges, whose union has even degree at every vertex, whereas K5 minus one edge has two vertices of odd degree.

**Theorem 3 (weighted parity identity).**

    pi(W)=sum_(e in R) a_e
          + min { sum_(e in E(G) minus R) x_e : x is an odd triangle cover of G }.

Indeed, fix the core vector x. In each attached clique, its minimum parity cost with the prescribed root value is a_e, including x_e itself. The added edges therefore contribute a_e-x_e. Summing this with the core cost cancels exactly the objective weight of every decorated root edge. The local minimizing states extend independently because fresh edges are disjoint, and the exhaustive triangle classification proves feasibility. Conversely every odd cover has at least that local cost for its given root values, proving the lower bound.

**Theorem 4 (packing identity, including deletion of original edges).** For every S contained in E(G),

    nu(W-S)=sum_(e in R) p_e + nu(G-S).

Any packing uses at most p_e local triangles in attachment e, and its core triangles form a packing of G-S. For equality, take a maximum packing of G-S and, in every clique, a maximum local packing avoiding its root edge. These local packings remain intact even when S deletes the root. They avoid all original graph edges, hence are edge-disjoint from the core packing and from one another.

In particular every original packing blocker persists with exactly the same loss. Attaching these cliques cannot repair a one- or two-edge blocker consisting of original edges.

**Corollary 5 (decorate EVERY edge).** If R=E(G), then

    tau(W)=pi(W)=2 sum_e p_e,
    nu(W)=sum_e p_e+nu(G),

and W is edge-cover-critical.

For tau, the attachment clique edge sets partition E(W), so their local lower bounds add. Selecting a minimum local cover containing the root in each clique attains the bound and covers all original triangles. The parity identity gives the same value, since the remaining weighted objective is empty and an odd core assignment exists (the all-one vector).

For criticality, Lemma 1 suffices. Every root belongs to the displayed minimum cover. To include any specified fresh edge f, choose a minimum local clique cover containing f. If that local choice omits its root e, keep every other original root selected in every other attachment. Every core triangle containing e retains its other two selected original edges; every other core triangle also remains covered. Thus this is a global minimum cover containing f. Every edge belongs to some minimum cover, so W is edge-cover-critical.

This operation accomplishes criticality but does so by erasing the original parity objective. It always satisfies the parity gate, with

    2nu(W)-pi(W)=2nu(G)>=0,

and it retains every original two-edge packing failure. This is a complete, arbitrary-core obstruction to this gadget repair, not merely a test on the Kalbfleisch cone. No historical originality is claimed; the local attachment packing ideas overlap the frozen TUZA-14B attachment results, while the explicit parity cancellation and deletion identity are recorded here for the current gate.

## 3. Adding a fixed apex graph: a two-spoke obstruction whenever the resource bound is attained

Let F and R be vertex-disjoint graphs, with R triangle-free on n>=2 vertices, and let G=F join R: retain both graphs and insert every cross edge. Let s=|V(F)|. Call cross edges spokes.

Any packing splits into:

- A: triangles entirely inside F;
- B-type triangles: two vertices in F and one in R;
- C-type triangles: one vertex in F and two in R.

There are no triangles entirely in R. A is a packing of F. Each B-type triangle uses one F-edge, and different B-type triangles use different F-edges; write B for their edge set. It avoids all edges of A. At a vertex v of F, write b_v=deg_B(v) and c_v for the number of C-type packed triangles using v. Spoke disjointness gives

    b_v+2c_v<=n.

Consequently define the purely F-dependent resource upper bound

    U(F,n)=max_(A,B) [ |A|+|B|+sum_(v in F) floor((n-b_v)/2) ],

where A ranges over triangle packings of F, B is a subset of E(F) minus E(A), and deg_B(v)<=n. Every actual packing of G has size at most U(F,n). The bound does not assert that the required rim edges or compatible matchings in R exist.

**Theorem 6.** If F has at least one vertex and nu(G)=U(F,n), then deleting any two distinct spokes at the same vertex of F lowers nu by at least one. Hence G is not two-edge packing-resilient.

After deleting those spokes at a fixed v, the inequality there becomes b_v+2c_v<=n-2. For every feasible resulting A,B the same objective upper bound decreases by exactly one, because floor((n-2-b_v)/2)=floor((n-b_v)/2)-1. The remaining vertices' inequalities are unchanged. Maximizing over the surviving A,B cannot exceed U(F,n)-1. This proves the claim without assuming any characterization of maximum packings.

Useful closed forms make this test concrete. Let o(B) count the odd-degree vertices of B. Since sum b_v=2|B|,

- for even n, the objective is |A|+sn/2-o(B)/2, and therefore U(F,n)=sn/2+nu(F), attained in the resource optimization by B empty;
- for odd n, it is |A|+s(n-1)/2+o(B)/2.

If n>=Delta(F), the degree cap on B is immaterial. For any fixed A, in each connected component of F-E(A), a subgraph can have any prescribed even set of odd-degree vertices (prove this by leaf elimination in a spanning tree). Therefore the largest possible o(B)/2 is the sum, over those components Q, of floor(|V(Q)|/2). Thus for odd n>=Delta(F),

    U(F,n)=s(n-1)/2
       + max_A [ |A|+sum_(Q component of F-E(A)) floor(|V(Q)|/2) ].

This includes independent multi-cones and clique-apex joins, but is not a claim that all such graphs attain the bound. A successful construction in this family must exploit a real incompatibility among rim-edge assignments and matchings, giving nu(G)<=U(F,n)-1, and must still establish criticality and resilience separately. A numerical deficit alone is not sufficient.

## 4. Other directions tested or deferred

The clique blowup cone R[K2] joined to one apex was considered as a way to preserve high parity cost while adding rim triangles. Every rim triangle uses a fibre-internal edge, creating a new fixed packing resource set. With dense R, natural packings saturate those internal edges and the spoke budget, so this does not immediately repair resilience; high-density cross edges also need not belong to any minimum cover. No claimed counterexample or general formula for its minimum cover is made.

A search for alpha-critical composition literature located the primary preprint [Valencia and Barrita, 1-join composition for alpha-critical graphs](https://arxiv.org/abs/0707.4085). Only search metadata and the abstract-level statement were inspected; no construction theorem from that paper is imported here. Dense vertex substitutions into snark-like skeletons face a separate criticality problem: if cross-interface edges can be deleted without changing the independence or cover optimum, criticalization removes the intended packing obstruction. This remains a speculative construction direction, not a result.

Global_routes independently developed a count obstruction for pure edge-gluings of K5 blocks when a full two-per-block packing survives. The present lane checked its algebra and warned that abstract port-parity CSPs must satisfy actual graphic-cycle identities. The primary cut-bound citation and that separate ordinary argument belong to the global_routes note; they are not used in Theorems 3–6 above.

## Decision and verification scope

Theorems 3–6 are ordinary reconstructed proofs for arbitrary specified graphs and attachments. They require no finite census, external matching theorem, or unverified primary literature input. All actual triangles across each attachment/interface were classified. They have not received a separate fresh AI review at the time of writing.

These results close the standard complete-graph edge decorations and every apex-join construction that attains its displayed resource upper bound. They do not prove or refute the parity gate under BOTH criticality and two-edge resilience. The remaining credible construction gap is to create unsaturated, rearrangeable packing capacity while keeping every edge present in some minimum ordinary cover and retaining a large odd-cover objective. No such construction emerged in this lane.
