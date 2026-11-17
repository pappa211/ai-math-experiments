> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A triangle and an additional edge restored to B

Status: ordinary proof candidate, frozen for independent reconstruction. All graphs are finite and simple; all triangles are actual graph triangles. B means that every nonempty shared-edge triangle component has literal K4 or K5 edge support.

## Theorem

Let B(H), m=nu(H), let T=abc be a missing triangle (all three edges absent in H), and let e be another absent edge, distinct from the three edges of T. Assume H+e contains a triangle using e. Set G=H+E(T)+e. Then G satisfies combined CS:

    tau(G)<=2nu(G), with equality only when B(G).

The assumption on H+e is explicit. No claim about the complementary case, where e first becomes triangle-bearing only after T is restored, is needed here.

## Initial accounting

Choose a triangle using e in H+e. By Lemma A, its two old spokes can be avoided by a maximum H packing: no literal old clique can contain both endpoints of the absent e, so each block sees at most one spoke. Append this page and T, whose edges are all absent from H+e. Hence nu(G)>=m+2. A minimum H cover plus the four restored edges gives tau(G)<=2m+4. This proves Tuza; equality requires

    nu(G)=m+2,    tau(G)=2m+4.

Let K=H+E(T). Since adjoining e costs at most one cover edge,

    tau(K)>=2m+3.

## The intermediate is a disjoint K5-e family

Use the exact one-triangle interface proved in Section1 of `two_triangle_restoration_v1.md`. The complete family N of new triangles of K consists of T and pages on its three bases. Let q be its packing number, counting T. Then

    nu(K)=m+q.

Since K is a subgraph of G, q<=2. That interface says N has a cover of size at most two unless it is exactly the seven-triangle K5-e family on a,b,c and two full apices x,y. A two-edge cover would give tau(K)<=2m+2, impossible. Therefore this exceptional family is forced and q=2.

The exceptional family has a three-edge cover, so tau(K)=2m+3. Every old spoke belongs to a three-edge cover of N: for ax choose {bc,ax,ay}, and relabel. If such a spoke belonged to an old H clique component, choose a minimum H cover containing it and overlap the two covers on that edge. This would give tau(K)<=2m+2. Thus all six spokes are triangle-free background in H.

In particular xy is absent in H (otherwise axy would be an old triangle supporting ax); it is also absent in K. Let C be the literal K5-xy graph on a,b,c,x,y. Its nine-edge support is disjoint from every old H triangle component. All actual K triangles have already been accounted for: they are the old H triangles and the seven triangles of C. Hence these supports are triangle components of K, with arbitrary background edges still permitted.

The graph C has packing number two and a maximum packing avoiding any prescribed single edge. Its two edge orbits have explicit witnesses:

    avoid ab: acx, bcy;
    avoid ax: bcx, aby.

Permuting a,b,c and interchanging x,y covers every edge.

## Restoring e

Consider any actual e-page uvz of G, where e=uv. In each old H clique component its old spokes meet at most one edge, since e is absent in H. If its two old spokes both belonged to C, then u,v,z would lie in its five-vertex set, and its absent pair uv would necessarily be xy, the unique missing edge of C.

Consequently, unless e=xy and z is one of a,b,c, the page meets C in at most one edge. Choose a maximum C packing avoiding that edge, and maximum old H clique packings avoiding their respective at-most-one spoke. These packings are mutually edge-disjoint because their supports are disjoint. Appending uvz gives m+3 triangles in G, contradicting tightness.

By hypothesis at least one e-page exists. Therefore e=xy and all its pages have their apex in {a,b,c}. Restoring e completes C to one literal K5 and introduces no outside triangle. All other old clique components remain separate, and all actual triangles have been accounted for. Thus B(G).

This proves the theorem for arbitrary attachments and any possible endpoint overlap of e with T consistent with the hypotheses.

## Corollary: every minimum-CS triangle residual is packing-edge-resilient

Let G be a minimum-edge failure of combined CS, and k=nu(G). The established triangle-residual identities give, for every actual triangle T and J=G-E(T),

    nu(J)=k-1,    tau(J)=2k-3.

Suppose some edge e of J lowers its packing number. Removing one edge lowers nu by at most one, so H=J-e has nu(H)=k-2. Proper-subgraph CS and cover extension give

    2k-4=tau(J)-1 <= tau(H) <= 2nu(H)=2k-4.

Thus H is tight and B(H). The edge e creates a triangle in H+e=J, since its insertion raises the packing number. The theorem applies to H, the missing triangle T, and e, and proves CS(G), contradiction.

Therefore

    nu(G-E(T)-e)=nu(G-E(T))=k-1

for every triangle T and every surviving edge e. Background edges satisfy this automatically. The connected defect-one triangle residual from `active_kernel_peeling_v1.md` thus has no packing-critical edge. This does not classify that residual or produce the unresolved global two-edge blocker.

Dependencies: accepted Lemma A / clique avoidance, exact one-triangle interface from the accepted two-triangle theorem, minimum covers through a specified clique edge, and the established M0/R1 triangle-residual identities. No external theorem or enumeration is used.
