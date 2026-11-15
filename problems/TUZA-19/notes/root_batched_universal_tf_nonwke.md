# Batched independent-set decorations: almost linear universal clique with TF and non-WKE links

Status at freeze: complete ordinary root proof candidate; partner and fresh-context reconstruction requested. This strengthens the earlier beta<1/3 construction, whose frozen proof remains unchanged. It does not prove unrestricted Tuza, preserve packing resilience or minimality, or establish originality. All work uses the original TUZA-19 clock; research cutoff 2026-11-15T09:23:58Z.

## Exact theorem and role

For every fixed real beta with 0<beta<1, unrestricted Tuza is equivalent to its restriction to finite simple n-vertex graphs having all of:

1. at least n^beta universal vertices;
2. TF: every actual triangle is contained in some minimum triangle edge cover;
3. every connected component of every vertex link non-WKE;
4. every graph edge contained in at least n^beta actual triangles.

The constructed graphs in the growing-parameter case also have connected vertex links. A graph L is WKE if there exist a matching M and a vertex cover Q of L-M with |Q|<=|M|. The theorem is a conditional counterexample transport, not a counterexample or a proof on the normalized class. There is no assertion at beta=1 or of a positive fixed fraction of universal vertices.

The new operation groups independent old vertices before decorating them. This changes both the order and the defect cost: O(h) total vertices and O(hq) defect loss, in place of O(hq) vertices and O(hq^2) loss for one private clique per old vertex.

## 1. Frozen dependencies and amplified seed

Assume a Tuza violation exists. Choose an edge-minimal violation G and discard isolates. Standard minimality and the WKE edge reduction give TF, every edge in a triangle and in some minimum cover, and every component of every vertex link non-WKE. These implications are proved in notes/global_routes_universal_tf_nonwke_addendum.md and used, with fresh review, in notes/root_universal_clique_tf_nonwke.md.

Write r=|V(G)| and delta(X)=tau(X)-2nu(X). Place b role-labelled copies of G in the classical r-partite, linear, Berge-triangle-free incidence system of notes/global_routes_quantitative_amplification.md. The resulting graph H has h nonisolated vertices and is r-partite: each fixed role part is independent. Every actual triangle is copy-local and all copied edge sets are disjoint. Thus

    tau(H)=b tau(G), nu(H)=b nu(G), delta(H)=b delta(G)>0.

TF passes copywise, and each H-link is a disjoint union of seed link components, so all its components remain non-WKE. Along the explicit incidence sequence, for a fixed constant C_G,

    N/r <= h <= N,
    b >= N^2 exp(-C_G sqrt(log N)).

The near-quadratic incidence input is classical Behrend/Erdos-Frankl-Rodl, not a new construction. Its proof, source identity and freshness audit are in the frozen quantitative note and review/efr_power_saving_source_audit.md.

## 2. Batched decoration and all triangles

Fix an integer q>=1 and let A be a new q-clique. Partition each of the r independent role parts of H into nonempty batches I_1,...,I_k of size at most q. Put g_i=|I_i|. Then

    1<=g_i<=q, sum_i g_i=h, k<=h/q+r.

For each batch I_i add a private clique B_i with

    s_i=q+g_i+6

vertices. Join B_i completely to A and I_i. Join A completely to H, keep H unchanged, and add no edges between different B_i or between B_i and old vertices outside I_i. Let W be the resulting graph. Every A vertex is universal. The local graph J_i on A union B_i union I_i is

    J_i = K_(q+s_i) join independent_set_(g_i),
    L_i=|V(J_i)|=2(q+g_i+3).

Thus J_i is K_(L_i) with precisely the binomial(g_i,2) edges inside I_i absent. Its order gives

    n_W=q+h+sum_i s_i=q+2h+k(q+6).                 (1)

Every actual triangle is of exactly one of these forms, apart from pure A triangles which may have several local owners:

- an old H triangle;
- a_iuv with a_i in A and uv an H edge;
- a triangle inside some J_i.

A triangle containing a B_i vertex has all its vertices in J_i. The independence of each I_i prevents an old H edge from lying inside J_i, and excludes unwanted B_iuv triangles. A triangle with two A vertices is local to the batch of its old or fresh third vertex; a pure A triangle may be assigned to any batch. This exhausts every interface triangle.

## 3. Exact local and global covers

Put a=binomial(q,2) and

    e_i=binomial(L_i,2)-binomial(g_i,2),
    t_i=e_i-L_i^2/4
       =(q+g_i+3)(q+g_i+2)-binomial(g_i,2).

Mantel's bound implies tau(J_i)>=t_i. Equality is attained by taking the complement, within E(J_i), of a balanced cut whose one side contains A union I_i. Such a side has q+g_i prescribed vertices and capacity q+g_i+3. All missing I_i edges are within that side, so the full balanced complete bipartite graph is present across the cut; exactly L_i^2/4 edges are retained. This local minimum cover selects every A edge and every A-I_i spoke.

The edge sets E(H), E(J_1),...,E(J_k) cover E(W). The H set is disjoint from the local sets, and distinct local sets share exactly E(A). Restrict any cover C to these graphs. Counting the repeated A edges gives

    |C| >= tau(H)+sum_i t_i-(k-1)|C intersect E(A)|
         >= tau(H)+sum_i(t_i-a)+a.                (2)

Conversely choose a minimum H-cover and the root-spoke-containing local covers just described. Their union covers every local and old triangle, and every a_iuv triangle through its selected spokes. It has the size in (2). Therefore

    tau(W)=tau(H)+sum_i(t_i-a)+a.                 (3)

## 4. TF

For an old triangle, choose a minimum H-cover containing it and the same local covers. For a mixed triangle a_iuv, choose a minimum H-cover containing uv; inherited TF supplies one because every H edge belongs to a triangle. All A-old spokes are selected.

For a local triangle T in J_i, choose the balanced partition defining its local cover with A union I_i union V(T) on one side. There are at most q+g_i+3 prescribed vertices, exactly the side capacity. This selects every edge of T, every A edge, and all A-I_i spokes. Use the standard local covers elsewhere and any minimum H-cover. Again every mixed triangle is covered, and the union has the exact minimum size (3). This includes pure A triangles. Hence W has TF.

## 5. Every link component is non-WKE

For a clique K_d and any matching M, every cover of K_d-M has at least d-2 vertices, since three vertices cannot be independent after deleting a matching.

### Old vertex v in I_i

The link consists of a clique K_(q+s_i) on A union B_i, the old link H[N_H(v)], and all edges from A to the old link. There are no B_i-to-old-link edges because I_i is independent. Write L_1,...,L_d for the old link components. For a matching M, let M_0 be its clique restriction, M_j its restriction to L_j, and c its number of cross edges. Then c<=q and

    |M_0|+c <= floor((s_i+2q)/2).

Any residual cover Q has at least q+s_i-2 vertices in the clique and at least |M_j|+1 vertices in each old component. Consequently

    |Q|-|M| >= ceil(s_i/2)-2+d >0.

This link is connected because A is nonempty. Thus it is non-WKE.

### Fresh vertex z in B_i

Its link is K_(q+s_i-1) join I_i. After deleting any matching, every independent set of size at least three must lie entirely in I_i: three clique vertices cannot be made independent, one clique vertex cannot lose two incident cross edges to the matching, and a deleted clique-pair edge prevents either endpoint from also losing a cross edge. Thus its independence number is at most max(g_i,2).

The link order is L_i-1=2q+2g_i+5 and every matching has size at most q+g_i+2. If g_i>=2 a residual cover has size at least 2q+g_i+5, strictly larger by at least q+3. If g_i=1 the link is a clique and a residual cover has size at least 2q+5, larger than the matching bound q+3. The link is connected and non-WKE.

### Universal vertex a_j

Its link contains every private clique B_i, the old vertices, and q-1 other universal vertices. A residual cover therefore has size at least sum_i(s_i-2), while any matching has size at most floor((h+sum_i s_i+q-1)/2). The doubled difference is bounded below by

    2sum_i(s_i-2) - (h+sum_i s_i+q-1)
      = k(q+2)-q+1
      = (k-1)q+2k+1 >0.                           (4)

If q>=2, another universal vertex connects this entire link, so it is non-WKE. If q=1, each link component is a union of whole batch groups I_i union B_i, possibly joined by H edges. For a component containing k' groups the same computation without the other-apex term gives the strict difference 3k'>0. Thus every component is non-WKE in all cases.

All vertex types have now been checked. In particular all links are connected once q>=2.

## 6. Packing upper bound and exact sufficient defect estimate

Put p_i=floor(e_i/3). In any W-packing, at most nu(H) triangles are old. Assign each local triangle to one J_i containing it; this accounts also for pure A triangles, and each assigned family has size at most p_i by its distinct graph edges. Every remaining triangle has the form a_iuv and uses two distinct A-old spokes. There are qh such spokes. Therefore

    nu(W) <= nu(H)+sum_i p_i+qh/2.                (5)

No claim of attainable clique packing numbers or compatible local packings is used. Combining (3) and (5),

    delta(W) >= b delta(G)-sum_i(2p_i-t_i+a)-qh+a.

For 1<=g_i<=q, the elementary edge-count bound gives

    2p_i-t_i+a
      <= (q+g_i+3)(q+g_i+4)/3
           +g_i(g_i-1)/6+q(q-1)/2
      <= 2q^2+4q+4.

It follows that

    delta(W) >= b delta(G)-k(2q^2+4q+4)-qh+a,    (6)

and the total subtracted cost is at most

    h(3q+4+4/q)+r(2q^2+4q+4).

For fixed q this is O_G(h). For growing q=o(N), with h<=N, it is O_G(Nq).

Every W edge lies in at least q triangles. H edges have the q A vertices as common neighbors. For a local clique-part edge, the local common-neighbor count is q+s_i-2+g_i>=q; for a clique-part-to-I_i edge it is q+s_i-1>=q. These account for all other edges. Hence the minimum codegree is at least q.

## 7. Almost linear exponent

Fix epsilon=1-beta in (0,1). Along the classical incidence sequence choose

    q=ceil((4N)^(1-epsilon)).

Then q tends to infinity and q=o(N). From (1), k<=h/q+r and h<=N,

    n_W <= 3N+6N/q+(r+1)q+6r <=4N

for all sufficiently large N. Thus q>=n_W^(1-epsilon)=n_W^beta.

The loss in (6) is O_G(Nq)=O_G(N^(2-epsilon)), which is o(b) because b>=N^2 exp(-C_G sqrt(log N)). Since delta(G)>0 is fixed, delta(W)>0 for all sufficiently large N in the sequence. The resulting W has all four asserted properties, contradicting Tuza on the restricted class if that restriction were proved. The converse implication is immediate by restriction. This proves the theorem.

## Scope and verification boundary

This removes the earlier beta<1/3 limitation by batching vertices from the fixed independent role parts. It does not claim that arbitrary H admits a small independent batching, and does not need that assertion: the explicit incidence amplifier is r-partite with r fixed by the hypothetical seed.

No two-edge packing resilience, edge-minimality, triangle-deletion tightness, or positive-density universal clique is preserved or claimed. Extracting an edge-minimal subgraph can destroy universality. The result is therefore a stronger equivalent class, not an unrestricted solution. All estimates are ordinary proofs with classical Mantel and incidence input; no computation or Lean process was needed. Exact corollary novelty remains unresolved and must be checked before publication.
