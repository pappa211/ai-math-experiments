# Nested apex neighborhoods and a failed saturation certificate

Status: exact ordinary translation plus an exact obstruction to one proposed certificate. The restricted Tuza target is not proved. Coordinator idea after seed exposure; no claim of independent blindness or historical novelty.

## Exact graph class and dictionary

Let H be a finite triangle-free simple graph. Fix k>=1 and integer thresholds b(v) in {0,...,k}. Add independent apices a_1,...,a_k with a_i adjacent to v exactly when i<=b(v). Thus apex neighborhoods are nested. Every triangle is a_iuv, with uv an H-edge and i<=min(b(u),b(v)). All triangles are included.

Define nu_b(H) as the maximum number of edges in a subgraph F of H admitting a proper edge coloring c with

    1 <= c(uv) <= min(b(u),b(v)).

A triangle packing is precisely such a colored edge set: repeated base edges are forbidden, and two triangles with the same apex cannot share a base endpoint. Therefore nu(G)=nu_b(H).

For D subset E(H), put H_i=(H-D)[{v:b(v)>=i}]. Once D is selected as base cover edges, the remaining triangles at a_i require exactly a vertex cover of H_i as their selected spokes. Conversely those choices cover all triangles. Hence

    tau(G) = min_D [ |D| + sum_{i=1}^k vc(H_i) ].

This is an exact bridge to the actual cover objective; it does not discard the cost of covering triangles. Rewriting it alone is not progress.

The concrete restricted question is whether the displayed minimum is <=2nu_b(H) for every triangle-free H and threshold b. It is a sufficient Tuza statement on this class only. No transformation from arbitrary G to this class is established. Complete graphs K4 and K5 do not lie in it; this is not a new approach to their equality cases.

## Prior art and the actual prospective tool

When b(v)=k uniformly, this is exactly I_k join H. Puleo proves that whole class, not merely cones or two apices: *Maximal k-Edge-Colorable Subgraphs, Vizing's Theorem, and Tuza's Conjecture*, arXiv:1510.07017v4 (6 March 2017), Theorem1.9/Corollary4.7 and Theorem4.5. His maximal-edge-coloring degree inequality is an actual tool. The uniform result is not a new theorem here. See literature/SOURCE_AUDIT.md for the version-specific primary check and the misleading older author-page link.

A prospective extension must replace uniform colors by the initial-interval allowed color sets above, while paying for selected spokes and shared base edges. Merely citing the ordinary Vizing fan or a rainbow matching theorem would omit the variable eligibility constraints.

## Exact failure of a direct uniform-style saturation rule

Let H be the star with center0, high leaf1, and low leaves2,3,4,5. Set b(0)=b(1)=3 and b(2)=...=b(5)=1. The resulting G has nine vertices, fifteen edges and seven triangles. Every spoke belongs to a triangle, so this obstruction is not caused by irrelevant triangle-free apex edges.

Every maximum allowed-color subgraph M has two edges: one low-leaf edge colored1 and edge01 colored2 or3. Three edges are impossible because all four low edges require color1 and there is only one high edge. Thus nu_b(H)=2, with eight maximum colorings.

The direct saturation certificate defines S={v:d_M(v)=b(v)}, selects every apex spoke at S, and selects every H-edge with both endpoints outside S. S is exactly the chosen low leaf. The cover costs one spoke plus four base edges =5, which exceeds 2nu_b(H)=4. Equivalently the hoped-for inequality

    e(H[V minus S]) <= sum_{v outside S} d_M(v)

fails as 4>3 for every maximum M. Nevertheless tau(G)=2: select base edge01 and spoke a_1 0. The two-triangle packing proves the matching lower bound.

Therefore **NO_GO for direct full-threshold saturation charging**. This does not refute nested-apex Tuza. Any useful extension must allow partial spoke levels and shared base-edge repairs. The example explains exactly what a list-compatible exchange must improve.

## First useful future tasks

1. Fix a maximum allowed-color subgraph M and investigate whether there exists a cover C contained in E(M) together with all graph spokes incident with vertices of M, with |C|<=2|M|. This is a stronger, independently falsifiable certificate assertion. It is not proved and its support restriction may be false. Test all M, then the existential choice of M separately, on two/three threshold levels over triangle-free bases, including nonbipartite bases. Preserve failures even if ordinary Tuza holds.
2. Seek a precise list-fan exchange inequality that bounds a partial-level spoke selection plus base repairs. It must handle the star above, where selecting just a_1 0 is essential to the cheap construction. A proof restricted to uniform lists is already Puleo's setting.

The resource advantage is concrete: the graph has an integral edge-coloring dictionary, a layered actual-cover formula, and nested eligibility sets. The missing ingredient remains substantial. Prior-art status of the strict heterogeneous extension is unresolved by the bounded search; no historical novelty or open-problem attestation follows.

Exact computation: scripts/nested_apex_probe.py enumerates the 64 possible color/omission assignments of this five-edge star (four choices on the high edge, two on each low edge), all eight maximum assignments, and the full graph's exact cover/packing optima. evidence/NESTED_SATURATION_OBSTRUCTION.json retains the witnesses. No floating-point optimization is used.
