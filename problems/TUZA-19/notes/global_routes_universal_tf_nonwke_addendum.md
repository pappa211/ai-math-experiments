# Universal vertex, TF, and no WKE link component simultaneously

Status: complete ordinary strengthening of the frozen universal-clique reduction. The construction was proposed by root and reconstructed here. Fresh independent review is requested. No novelty, Lean verification, or unrestricted Tuza resolution is claimed.

## Exact global statement

Unrestricted Tuza is equivalent to Tuza restricted to finite simple graphs that satisfy ALL THREE properties:

1. there is a universal vertex;
2. TF: every actual triangle is contained in some minimum triangle edge cover;
3. every connected component of every vertex link is non-WKE.

For a graph L, a WKE witness is a matching M and a vertex set Q covering L-M with |Q|<=|M|. A link at v is the induced graph on N(v). Non-WKE means that for EVERY matching M and EVERY vertex cover Q of L-M, |Q|>|M|.

The forward implication is immediate. The converse is proved by transforming a hypothetical edge-minimal counterexample. The construction does NOT claim to retain two-edge packing resilience or edge-minimality. The link conclusion is not asserted for arbitrary input graphs: it depends on the original minimal counterexample's non-WKE link components.

## 1. Properties of an edge-minimal counterexample

Suppose a counterexample exists, and choose one G with the minimum number of edges, removing isolated vertices. Write k=nu(G), delta=tau(G)-2nu(G)>0. Every proper edge-deleted subgraph satisfies Tuza.

For any actual triangle T,

    tau(G)<=tau(G-E(T))+3<=2nu(G-E(T))+3<=2(k-1)+3.

Thus tau(G)=2k+1 and all these inequalities are tight. A minimum cover of G-E(T), together with E(T), is a minimum cover of G containing T. Hence G has TF. Every edge of G belongs to a triangle, since otherwise it could be deleted without changing either parameter; therefore every edge belongs to some minimum cover. In particular G is edge-cover-critical.

Every connected component of every G-link is non-WKE. Here is the standard WKE reduction in full for this purpose. Suppose L is one component of the link at v and has a witness M,Q. Let

    P={vxy:xy in M},
    C=M union {vq:q in Q},
    D={vu:u in V(L)},
    G'=G-(D union M).

The triangles in P are edge-disjoint and use only deleted edges, so every G'-packing extends by P. The set C covers every triangle using a spoke in D: its link edge is either in M or has an endpoint in Q, and no link edge crosses between components. Any other triangle removed from G' uses an edge of M and is also covered by C. Thus

    nu(G)>=nu(G')+|M|,
    tau(G)<=tau(G')+|C|<=tau(G')+2|M|.

The graph G' is a proper edge-deleted subgraph because L contains at least one vertex. Tuza for G' would now imply Tuza for G, a contradiction. This also covers a singleton isolated link vertex, with M=Q=empty. This reduction is the established WKE framework; no new attribution is claimed.

## 2. Exact incidence amplification preserves the link components

Apply the elementary incidence-amplification construction of

    notes/global_routes_universal_clique_reduction.md
    SHA256 83d9549aae898656b2d09871c5f87c481d6b36116f7ac37d23f534df92f527a1.

It places b copies of G into a linear |V(G)|-uniform hypergraph with no Berge triangle, on at most n vertices after removing unused isolates, with b/n arbitrarily large. (Equivalently retain the earlier N ambient vertices and n<=N.) The resulting graph H has

    tau(H)=b tau(G),       nu(H)=b nu(G),
    delta(H)=b delta,

and every actual H-triangle lies in exactly one copy. TF and edge-cover-criticality pass by taking optimal covers independently in the edge-disjoint copies.

Fix a vertex v of H. Distinct copies containing v have otherwise disjoint vertex sets, so their neighbor sets at v are disjoint. There is no link edge between two such neighbor sets: it would form a cross-copy triangle with v, forbidden by the triangle-ownership argument. Within one neighbor set the link is exactly the corresponding G-link, because each copy is induced. Consequently the link H[N_H(v)] is a disjoint union of links inherited from G. EVERY one of its connected components is therefore non-WKE.

This precise link inheritance is why arbitrary H cannot replace the amplified minimal counterexample in the statement.

## 3. The K11 spoke decoration and its local facts

Add one new universal apex a to H, obtaining B=cone(H). For each v in V(H), attach a fresh K11 along the spoke av: its vertex set is {a,v} together with nine vertices private to that attachment. Let W be the resulting graph. No other edges are added.

The elementary local parameters are

    tau(K11)=25,       nu(K11)=17.

A balanced5-by6 cut has30 edges, and its25-edge complement meets every triangle. Any triangle-free graph on11 vertices has at most30 edges: for each edge xy its endpoint degrees sum to at most11; summing and applying Cauchy gives4m^2/11<=11m, hence m<=30. This proves the cover optimum. Any prescribed triangle can lie inside one part of a balanced cut, and any prescribed edge can likewise be inside a part. Thus a minimum25-cover can contain any chosen triangle or any chosen edge.

For packing, the explicit17-packing and literal checker are frozen in notes/global_routes_k11_control.md and checks/global_routes_k11_control.py. Its unused edges form a C4. Eighteen triangles would leave just one edge of K11, impossible because deleting triangles preserves even vertex degrees. Thus17 is optimal. By relabeling its unused C4, a maximum17-packing can avoid ANY prescribed root edge. No solver optimum is imported here.

Every actual triangle of W is either an old B-triangle or wholly within one attached K11. A fresh vertex has no neighbors outside its attachment. The edge sets of H and the complete attached K11s partition E(W). Therefore

    tau(W)=tau(H)+25n,
    nu(W)=nu(B)+17n.                                    (1)

For the cover lower bound, restrict to H and to each K11. For equality, take a minimum H-cover and a root-containing minimum25-cover in each K11; the selected roots hit every old apex triangle. For packing, every packing has at most nu(B) old triangles and17 triangles per attachment, while a maximum B-packing extends by17 in each attachment avoiding its root.

The apex a remains universal, including to all nine fresh vertices in each attachment.

## 4. TF persists

Every actual triangle of W belongs to one of three types.

* For a triangle in H, choose a minimum H-cover containing it and root-containing minimum covers in all attachments.
* For an old apex triangle auv, choose a minimum H-cover containing uv (possible by edge-cover-criticality) and include all roots in the attachment covers.
* For a triangle in one attached K11, choose a minimum25-cover there containing it; use root-containing minimum covers in all OTHER attachments, and any minimum H-cover. If the special attachment omits its root av, every old apex triangle through av still has its other root selected.

Each construction has the size in (1), so it is a minimum cover. This proves TF for W, without assuming that a chosen local triangle cover also contains its root.

## 5. Every link component is non-WKE

A fact used repeatedly: for ANY matching M in K10, every vertex cover of K10-M has size at least8. Indeed, among any three vertices at most one of their three mutual edges can belong to a matching, so K10-M has no independent set of size three. Its independence number is at most two.

### Fresh vertex

Its link is K10, on the other vertices of its own attachment. Any matching has size at most5, while the preceding fact gives cover size at least8 after removal of that matching. Thus this connected link is non-WKE.

### The universal apex a

Its link consists of H together with, for each old vertex v, a K10 on v and that attachment's nine private vertices. These K10 vertex sets partition the link. The only edges between them are H edges between their old vertices.

Every link component therefore consists of t entire K10 blocks for some t>=1. For ANY matching M in that component, its size is at most5t by vertex count, including matching edges between blocks. The restriction of M to each K10 is a matching, so a vertex cover of the component minus M contains at least8 vertices from each block. It has size at least8t>5t>=|M|. Thus every component of the apex link is non-WKE. No connectedness assumption on H is needed.

### An old vertex v

Its link consists of K10 on a and its own nine private vertices, together with the old link L=H[N_H(v)]. The vertex a is joined to every vertex of L; there are no other edges between K10 and L. In particular this link is connected.

Let L1,...,Ls be the connected components of L. Each Li is non-WKE by Section2. Given ANY matching M of the full link, let Mi be its restriction to Li, let M0 be its restriction to K10, and let epsilon be the number of matching edges between a and L. Then epsilon is0 or1, and

    |M0|+epsilon<=5,
    |M|<=5+sum_i |Mi|.

The first inequality holds because when epsilon=1, only nine vertices of K10 remain available for internal matching edges, giving |M0|<=4.

For ANY vertex cover Q of the full link minus M, its restriction to K10 has size at least8. Its restriction to Li covers Li-Mi, so non-WKE gives at least |Mi|+1 vertices. Consequently

    |Q|>=8+sum_i(|Mi|+1)
       >=8+sum_i |Mi|
        >5+sum_i |Mi|>=|M|.

This proves the old vertex link is non-WKE. The inequality also covers an empty old link, although that case is unnecessary for the minimal-counterexample seed.

These are all vertex types, so property3 holds everywhere.

## 6. Positive defect survives at sufficient incidence ratio

Every new apex triangle of B uses two distinct spokes. Thus

    nu(B)<=nu(H)+n/2.

Using (1),

    delta(W)=tau(H)+25n-2nu(B)-34n
            >=tau(H)-2nu(H)-10n
             =b delta-10n.

Choose the incidence ratio b/n>10/delta. The original lemma permits this for every fixed positive delta (in fact the minimal seed has delta=1). Then delta(W)>0.

We have constructed a Tuza counterexample with a universal vertex, TF, and no WKE link component simultaneously. This proves the stated equivalence by contraposition. The argument supplies an availability result for a strengthened class, not an inequality resolving that class.

## Scope receipt

No two-edge packing resilience or retained edge-minimality is asserted for W. No arbitrary-input non-WKE claim is asserted: the link inheritance in Section2 is essential. No fixed universal clique larger than one, all-size high-codegree padding extension, or further gadget repair is claimed here.

This addendum uses the previously frozen elementary incidence existence proof, the explicit ordinary K11 local facts, and the standard WKE reduction reconstructed in Section1. It does not require a new computation, census, or Lean process. The original frozen universal-clique proof remains unchanged.
