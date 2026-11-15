# Many universal vertices, TF and non-WKE links simultaneously

Status: complete ordinary conditional normalization proof by root; independent reconstruction requested. This extends the earlier one-universal-vertex addendum. No resilience, minimality preservation, novelty, Lean verification, or general Tuza solution is claimed.

Write delta(G)=tau(G)-2nu(G). TF means every actual triangle is contained in some minimum triangle edge cover. A graph L is WKE if some matching M and some vertex cover Q of L-M satisfy |Q|<=|M|.

## Exact statements

For every fixed integer q>=1, unrestricted Tuza is equivalent to its restriction to graphs satisfying all of:

- at least q universal vertices;
- TF;
- every connected component of every vertex link is non-WKE.

More quantitatively, for every fixed real beta with 0<beta<1/3, unrestricted Tuza is equivalent to its restriction to n-vertex graphs with TF, no WKE link component, and at least n^beta universal vertices. Every edge in the constructed graphs also has triangle codegree at least the number of designated universal vertices.

The proof transports a hypothetical edge-minimal violation; it does not assert that arbitrary input graphs acquire the link property. The sublinear exponent bound is a sufficient consequence of the construction, not an optimality claim.

## 1. Seed and incidence input

Assume a counterexample exists, choose an edge-minimal one G, and remove isolates. As reconstructed in notes/global_routes_universal_tf_nonwke_addendum.md, G has delta>0, TF, every edge in a triangle and in some minimum cover, and every component of every vertex link is non-WKE. The standard WKE edge reduction proves the last claim.

Place b copies of G in a linear, Berge-triangle-free incidence system, obtaining H on h vertices. Copied edge sets are disjoint, all actual triangles are copy-local, and every copy is induced. Hence

    tau(H)=b tau(G), nu(H)=b nu(G), delta(H)=b delta(G).

TF and edge-cover-criticality pass copywise. Every H-link is a disjoint union of seed link components, so all its components are non-WKE.

For fixed-q normalization, the original incidence lemma supplies b/h arbitrarily large. For the quantitative claim use notes/global_routes_quantitative_amplification.md: with seed size fixed, an unbounded explicit sequence of ambient sizes N has h<=N and

    b>=N^2 exp(-O_G(sqrt(log N))).

This is the classical Behrend/Erdos-Frankl-Rodl incidence construction, independently reconstructed in that note. No positive quadratic-density claim is used.

## 2. Construction and all actual triangles

Fix q>=1. Let A be a new q-vertex clique. Put

    s=q+5, L=q+s+1=2q+6, a=binom(q,2),
    t=tau(K_L)=(q+3)(q+2), p=floor(binom(L,2)/3).

For each old vertex v of H, add a private set B_v of s fresh vertices and make A union {v} union B_v a complete K_L. Keep all H edges, and add no other edges. Call the result W. Its order is

    |V(W)|=(q+6)h+q.

Every member of A is universal. Every actual triangle is either in H, is of the form a_iuv with uv in E(H), or lies wholly inside one of the designated K_Ls. Indeed a fresh vertex has neighbors only in its designated clique. A triangle with two or three A vertices is local to a designated clique (pure A triangles can be assigned to any one clique). These cases include every triangle across the interfaces.

## 3. Exact cover value

The H edges and the local clique edge sets cover E(W). The only repeated edges are the a edges inside A, each belonging to all h local cliques. If C is any triangle cover, its restrictions to H and each local clique are covers. Thus

    |C|>=tau(H)+ht-(h-1)|C intersect E(A)|
        >=tau(H)+ht-(h-1)a.                         (1)

For equality, choose a minimum H-cover. In each K_L choose the complement of a balanced cut with A union {v} on one side. That side has capacity L/2=q+3, so this is possible. Every A edge and every root spoke a_iv is selected. The local covers cover their cliques; the selected spokes cover every triangle a_iuv. The union has the lower-bound size. Therefore

    tau(W)=tau(H)+h(t-a)+a.                          (2)

The elementary Mantel degree-sum proof gives tau(K_L)=binom(L,2)-L^2/4=t; no clique packing formula is imported.

## 4. TF

For a triangle inside H, choose a minimum H-cover containing it and use the root-containing local covers from Section3. For a triangle a_iuv, choose a minimum H-cover containing uv, possible by inherited edge-cover-criticality, and the same local covers. Both its spokes are selected.

For a triangle T in a designated local K_L, choose a balanced local partition with A union V(T) on one side. This uses at most q+3=L/2 vertices, so it is possible. Its minimum local cover contains T and every A edge. In all other local cliques choose covers containing their roots, and use any minimum H-cover. If the special local cover omits roots at its old vertex v, every old mixed triangle a_iuv still has its other root a_iu selected. Triangles with two A vertices are covered by an A edge. Thus the union is still a cover of the size in (2), and contains T.

This also handles pure A triangles. Therefore W has TF.

## 5. All link components are non-WKE

For any complete graph K_d and matching M, every cover of K_d-M has at least d-2 vertices: three vertices cannot be independent after deleting only a matching.

A fresh vertex has link K_(L-1), so every residual cover has size at least L-3, whereas every matching has size at most floor((L-1)/2). Since L>=8, the former is strictly larger.

For an old vertex v, its link consists of K_(q+s) on A union B_v and the old link L_v=H[N_H(v)]. Only the vertices of A connect the complete part to L_v. Let L_1,...,L_d be the old link components. Given any matching M, let M_i be its restriction to L_i, M_0 its restriction to the complete part, and c the number of cross matching edges. Then c<=q and

    |M_0|+c<=floor((q+s+c)/2)<=floor((s+2q)/2).

Any cover Q of the link minus M has at least q+s-2 vertices in the complete part and at least |M_i|+1 in each L_i. Therefore

    |Q|-|M| >= q+s-2-floor((s+2q)/2)+d
                =ceil(s/2)-2+d >0.

This link is connected, and is non-WKE.

For a designated universal vertex a_i, its link contains q-1 other universal vertices, together with h disjoint complete vertex groups {v} union B_v, each K_(s+1); the only edges between these groups are old H edges. Every residual cover contains at least s-1 vertices per group. If q>=2 the link is connected and every matching has size at most floor((h(s+1)+q-1)/2). Strict inequality follows from

    2h(s-1)-[h(s+1)+q-1]=h(s-3)-(q-1)
                                =h(q+2)-(q-1)>0.

If q=1, a link component is a union of whole groups associated to a component of H. The same estimate with that component's positive group count and no extra universal vertices applies. Thus every apex-link component is non-WKE.

These are all vertex types. The inherited non-WKE premise is used for old links and is not omitted.

## 6. Packing upper bound and positive defect

Any W-packing has at most nu(H) old triangles. Assign each triangle contained in a local clique to one such clique; each assigned family has size at most p by its edge count. The remaining triangles are a_iuv with uv in E(H), each using two distinct root spokes. There are qh such spokes, so at most qh/2 remaining triangles. Consequently

    nu(W)<=nu(H)+hp+qh/2.

No compatible local packing or exact clique packing number is needed for this upper bound. Combining with (2) gives

    delta(W)>=b delta(G)-h C(q)+a,
    C(q)=2p+q-t+a <= (5q^2+17q+24)/6.                (3)

For fixed q, choose b/h>C(q)/delta(G). Then W is a counterexample in the simultaneous class, proving its equivalence with unrestricted Tuza by contraposition.

Every W-edge has codegree at least q. An old H edge has all q A vertices as common neighbors; each edge outside H lies in a K_L and hence has at least L-2>=q common neighbors. Thus the codegree assertion includes spokes and edges inside A.

## 7. Growing universal clique

Fix 0<beta<1/3. Choose a real alpha with

    beta/(1-beta)<alpha<1/2,

and on the near-quadratic incidence sequence put q=ceil(N^alpha). Formula (3) loses at most O(N q^2)=O(N^(1+2alpha)), which is o(b), since 1+2alpha<2 and b=N^(2-o(1)). Hence delta(W)>0 for sufficiently large N.

Also |V(W)|<=(q+6)N+q=O(N^(1+alpha)), whereas q>=N^alpha. Since alpha>beta(1+alpha), eventually

    q>=|V(W)|^beta.

All TF and link arguments above are uniform in q and h, so they remain valid as q grows. This proves the quantitative equivalence.

## Scope and decision

The result forces a stronger simultaneous class for a hypothetical violation. It does not prove the inequality on that class. Two-edge packing resilience and minimality are not retained, and extracting a minimal subgraph can destroy the designated universal clique. No all-purpose gadget repair is implied.

The finite classical incidence input and the elementary clique estimates are ordinary mathematics. No new computation or Lean process was used. The original start01:53:58Z, research cutoff09:23:58Z and hard deadline09:53:58Z on2026-11-15 remain unchanged.
