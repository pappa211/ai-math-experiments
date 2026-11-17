> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Combined CS for graphs admitting a forest triangle-edge cover

Status: ordinary all-size proof candidate, assembled from the independently reconstructed self-contained apex-forest link branches. Fresh review of this assembled hereditary-class argument is required. No historical-priority claim is made.

## Theorem

Let G be any finite simple graph that admits a triangle-edge cover C whose selected-edge graph is a forest. The cover need not be minimum. Then

    tau(G)<=2nu(G).

Equality holds exactly when every nonempty shared-edge triangle component has literal K4 edge support. Triangle-free background edges and vertex sharing between those components are permitted, subject to ALL actual triangles.

Equivalently, combined CS holds throughout the forest-cover class, and the K5 equality components are absent from that class.

## 1. The class is hereditary

Let F be the class of graphs admitting such a forest cover. If H is an edge-subgraph of G in F, then C intersect E(H) remains a forest and meets every actual H triangle. Thus H is also in F. Vertex deletion and removal of isolates preserve the same property.

Suppose combined CS fails somewhere in F, and choose a failure G with the fewest edges, discarding isolated vertices. Every proper edge-subgraph of G is still in F and satisfies CS. The established combined-minimal framework therefore applies WITHIN THIS CLASS: G has tau=2nu, every edge has triangle codegree at least two, each closed link component has minimum degree at least two and at least five vertices, and every genuine balanced reduction has a residual satisfying B. No global CS induction hypothesis is assumed.

The exact existing local inputs are the clique avoidance facts, minimality and balanced accounting, codegree lemma, and robustness lemma in `sources/public/papers/tuza-five-degenerate/main.md`, Sections1–4, Lemmas2/2A/3/3A/4/5. Their statements and proofs are class-local and do not use five-degeneracy. The frozen TUZA-15 input boundary and the current M0 reconstruction separately authenticate that scope.

## 2. A leaf of any forest cover gives an apex-forest link

Choose any forest triangle cover C of this minimum failure. It is nonempty because G has a triangle. Let v be a leaf of the selected-edge forest, with unique selected neighbor w; thus vw is its only incident edge in C.

For any link edge xy with x,y different from w, the actual triangle vxy is not covered by either spoke vx or vy, so its rim edge xy belongs to C. Consequently

    G[N_G(v)]-w is a subgraph of the forest C,

and is a forest.

The vertex w belongs to the link since vw is an actual G edge. Any other link component not containing w would itself be a forest. But every link component has minimum degree at least two, whereas a nonempty finite forest has a vertex of degree at most one. Hence the ENTIRE link at v is one closed connected component L containing w, and L-w is a forest. Robustness also gives |V(L)|>=5.

This conclusion used only leaf degree in the selected cover and actual triangle coverage. It imposes no restriction on G's density, order, other neighborhoods, or outside pages.

## 3. Both apex-forest branches are impossible

If L-w has a perfect matching, apply `apex_forest_perfect_link_exclusion_v2.md`. If it has no perfect matching, apply `apex_forest_nonperfect_branch_v2.md`. Each branch is an ordinary proof valid in an arbitrary class-minimum CS failure and audits the complete selected footprint in every residual K4/K5 block. Both branches contradict minimality.

For clarity, the v2 proofs use elementary forest matching arguments and direct internal/external page augmentations. The nonperfect proof supplies its needed alternating-reach decomposition and forest matching-cover equality explicitly. Neither branch imports a general WKE-to-CS claim, Gallai–Edmonds, Konig, Kotzig, a finite link census, or an unstated outside-attachment hypothesis. Their remaining common inputs are exactly the class-local minimality/codegree/robustness and clique facts listed in Section1.

Therefore no minimum failure exists in F, proving combined CS for the entire forest-cover class.

## 4. Equality has only K4 components

A K5 cannot have a forest triangle-edge cover. Indeed, the restriction of any such cover to its five vertices is bipartite. One color class contains at least three vertices, whose three clique edges are all absent from the selected cover. They form an uncovered triangle. The same restriction argument excludes a literal K5 subgraph in any graph of F, in particular a K5 triangle component.

The just-proved combined CS theorem gives B(G) under equality. The K5 possibility is excluded, leaving only literal K4 triangle components. Conversely such components each contribute nu1,tau2, with exact additivity over their disjoint triangle edge supports. Hence tau=2nu. For a triangle-free graph the empty component condition is vacuous and equality0=0 is included.

## Exact scope and missing global bridge

This is a theorem for graphs admitting at least one acyclic triangle-edge cover, not merely for graphs whose minimum cover happens to be a forest. The class has no imposed order, maximum-degree, or density bound. It does not show that an arbitrary graph, or an arbitrary minimum CS failure, admits such a cover. Indeed K5 has no forest triangle cover. Availability of a useful cover structure outside this class remains a separate global obligation.

Frozen proof dependencies:

- `apex_forest_perfect_link_exclusion_v2.md`;
- `apex_forest_nonperfect_branch_v2.md`, SHA-256 `c587035bea6883c1a5f80d0fc261be3e02144c84dae1678a50a6dc82d67fec47`;
- the pinned public Sections1–4 specified above, with their authenticated class-local scope.

No computation is a new premise of this theorem.
