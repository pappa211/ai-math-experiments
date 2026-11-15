# Reconstruction audit: universal cliques, TF, and non-WKE link components

**Result: PASS at the exact stated scope.** No mathematical objection was found. This is ordinary independent AI reconstruction by global_routes, not a fresh-context review, human review, or Lean verification. The reviewer participated in the earlier one-apex and quantitative-incidence work and saw the root's new construction sketch before reading the frozen full proof. That provenance limits any claim of reviewer independence; all calculations below were reconstructed rather than assumed from the sketch.

Frozen target: notes/root_universal_clique_tf_nonwke.md, SHA256709ffc9c57f3a657a7e4fda984354d7c020ab838a8db09d1d28cb6e31155bd5a.

Quantitative dependency: notes/global_routes_quantitative_amplification.md, SHA2564ddc162df0ceb5072b948d64cf7d09df1e2e7641d66dceb038aecce6cbb48d53. The classical source was separately audited in review/efr_power_saving_source_audit.md, SHA25633a3bfc8a6fe049f15d424a5f97e1f8084be40b705385975c994db6ecdfc874e.

## Statement reconstructed

For every fixed q>=1, unrestricted Tuza is equivalent to its restriction to graphs with at least q universal vertices, TF, and every connected component of every vertex link non-WKE. For each fixed 0<beta<1/3, the same holds with at least n^beta universal vertices in an n-vertex graph. The construction also has every edge in at least as many triangles as the number of designated universal vertices. Neither resilience nor minimality of the output is asserted.

## Dependency checks

The minimal-seed reduction was reread in notes/global_routes_universal_tf_nonwke_addendum.md. If a global edge-minimal violation has packing number k, deleting any actual triangle gives tau<=2(k-1)+3 and forces tau=2k+1, with all inequalities tight. This proves TF. An edge outside every triangle could be removed, so every edge is in some minimum cover. For a WKE link component, delete its spokes and its matching M: the removed M-triangles extend every residual packing, while M together with the Q-spokes covers every removed triangle at cost at most2|M|. The residual graph has fewer edges, contradicting minimality. This proves the non-WKE premise for every component, not just for a whole link.

Linearity and absence of Berge triangles in the incidence system imply that every actual triangle is copy-local and that copies are induced. The neighbor sets of copies meeting at an old vertex are disjoint. An edge between them would be a cross-copy triangle. Therefore each amplified link is a disjoint union of the inherited seed links. Cover/packing additivity, TF, edge-cover-criticality and componentwise non-WKE all follow at their stated scopes.

The quantitative incidence dependency was separately reconstructed with explicit digit and progression parameters in the cited addendum. It gives an unbounded sequence with h<=N and b>=N^2 exp(-C sqrt(log N)) for a constant depending on the fixed seed. In particular it absorbs N^gamma for each fixed gamma<2; no unspecified o(N^2) absorption is assumed.

## All triangle types and exact cover count

For q>=1, s=q+5 and L=2q+6, the local clique at old v has vertices A union {v} union B_v. A fresh vertex has no neighbor outside that clique. All other triangles are old H-triangles or have one apex and an old H-edge. Triangles containing at least two apex vertices lie in a local clique; pure-apex triangles may be assigned to any local clique. Thus the triangle classification is exhaustive.

Put a=binom(q,2) and t=(q+3)(q+2). The H edge set is disjoint from all local-clique edge sets, and the only overlaps between the latter are E(A). For any global cover C,

    |C| = |C intersect E(H)|
          + sum_v |C intersect E(K_L(v))|
          - (h-1)|C intersect E(A)|
         >= tau(H)+ht-(h-1)a.

The equality displayed before the inequality is valid because these sets exhaust all graph edges. In each local clique, putting A and its old root v on the same side of a balanced (q+3,q+3) cut selects every A-edge and every root spoke. These choices attain the bound and cover all mixed apex/old-edge triangles. Hence the exact tau formula is valid; no unproved packing equality is hidden in it.

## TF compatibility across the shared clique

An old triangle uses TF of H. A mixed triangle a_iuv uses an H minimum cover containing uv, which is justified by inherited edge-cover-criticality. Both mixed spokes are then selected by the default local covers.

For a triangle T in one special local clique, the set A union V(T) has at most q+3 vertices, so it fits in one side of a balanced cut. This local minimum cover contains T and all A-edges. The only roots it might omit are those at that one old vertex v. Every other local clique selects all its root spokes, so each mixed triangle involving v still has its spoke to the other old endpoint selected. Thus the changed local cover causes no uncovered interface triangle. All covers have the exact optimum size because their A-edge selections agree. This also includes pure-apex triangles.

## Non-WKE inequalities, including disconnected apex links

A cover of K_d after deleting a matching has size at least d-2, since an independent triple would require three deleted edges. This applies to the restriction of an arbitrary global matching and cover, even when matching edges leave a local clique.

A fresh link is K_(L-1); L-3>floor((L-1)/2) for L>=8.

For an old link, write M_i for restrictions to inherited components, M_0 for the complete part, and c for cross edges. Every cross edge uses a distinct A vertex, so c<=q and 2|M_0|+c<=q+s. Thus

    |M_0|+c <= floor((s+2q)/2).

Residual covers need at least q+s-2 vertices in the complete part and |M_i|+1 in each old component. The resulting margin is

    q+s-2-floor((s+2q)/2)+d = ceil(s/2)-2+d >0.

The old link is connected through A, so this proves the required component property there.

For an apex link and q>=2, the q-1 other apices connect the h local groups. Each group is K_(s+1), so every residual cover has at least h(s-1) vertices, while any matching has at most half of h(s+1)+q-1 vertices. The strict doubled margin is h(s-3)-(q-1)=h(q+2)-(q-1)>0 for every h>=1.

For q=1 this last whole-link conclusion alone would not suffice, but the frozen proof correctly treats components separately: each component consists of t>=1 entire local groups over one H-component. Its residual cover has size at least t(s-1), its matching at most t(s+1)/2, and s=6 gives strict inequality. All link-component quantifiers are therefore met.

## Packing budget and asymptotic exponent

Assign packed local triangles to local cliques. Each assigned family is edge-disjoint within a K_L and has at most p=floor(binom(L,2)/3) members. This remains an upper bound when cliques share A-edges. All remaining non-old triangles are mixed and each uses two root spokes, giving at most qh/2 of them. Therefore

    nu(W)<=nu(H)+hp+qh/2.

Together with the exact cover value this yields

    delta(W)>=b delta(G)-h C(q)+a,
    C(q)=2p+q-t+a.

Expanding the edge-count upper bound for p independently gives

    C(q)<= (5q^2+17q+24)/6.

Thus fixed q is absorbed by arbitrarily large b/h. For growing q=ceil(N^alpha) with alpha<1/2, the loss is O(N^(1+2alpha))=o(b). Meanwhile |V(W)|=(q+6)h+q=O(N^(1+alpha)). The strict choice alpha>beta/(1-beta) makes q>=|V(W)|^beta eventually. Such an alpha exists precisely for the stated sufficient range beta<1/3. Endpoint beta=1/3 and optimality are not claimed.

For triangle codegree, each old edge sees all q apices, and every edge outside H lies in a full K_L and sees at least L-2>=q local common neighbors. This includes shared apex edges and every spoke.

## Scope conclusion

All needed inequalities are upper/lower bounds in the correct directions. The proof needs no exact packing formula for complete graphs, no simultaneous local maximum-packing choice, and no resilience transfer. Its input is a hypothetical minimal violation; the output need not be minimal, and re-minimizing may destroy the universal vertices. The theorem is an availability normalization, not a proof on the normalized class and not a solution of Tuza.

No extra graph test, solver, or Lean process was run for this audit. The producer artifact and its dependencies were left unchanged. Original mission clock: start01:53:58Z, research cutoff09:23:58Z, hard deadline09:53:58Z on2026-11-15.
