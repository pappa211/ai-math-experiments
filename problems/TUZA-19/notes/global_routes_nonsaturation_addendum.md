# Elementary nonsaturation under two-edge packing resilience

Status: complete ordinary proof; root reconstruction requested. This simplifies the frozen TUZA-17 result, eliminating its imported Tutte–Berge dependency. It is a necessary-condition theorem, not a proof of Tuza or an availability theorem for a reduction.

## Statement

Let G be any finite simple graph such that

    ν(G−S)=ν(G) for every graph-edge set S with |S|≤2.

Let v lie in at least one triangle, H=G−v, and L=G[N_G(v)] be the FULL induced neighborhood graph. Write μ for ordinary matching number. Then

    ν(G)≤ν(H)+μ(L)−1.                                      (NS)

For EVERY maximum ordinary matching M of L,

    ν(H−M)≤ν(H)−1.                                        (NS-state)

H−M deletes the matching EDGES, not its vertices. No assumption on triangle-cover criticality, the value of τ, or minimal counterexample status is needed.

## Elementary blocker

For ANY ordinary graph L and ANY edge xy∈E(L), every matching in L−{x,y} is edge- and vertex-disjoint from xy. Adjoining xy proves

    μ(L−{x,y})+1≤μ(L).

Thus the endpoints of any ordinary edge are a two-vertex matching blocker. This argument is immediate and does not require Tutte–Berge, Gallai–Edmonds, factor-criticality, or a minimization over barriers.

## Proof of NS

Since v lies in a triangle, choose any xy∈E(L). Delete the two spokes vx,vy, obtaining G'. A triangle packing in G' consists of old triangles in H and triangles through v. The latter have bases forming an ordinary matching in L−{x,y}. Hence

    ν(G')≤ν(H)+μ(L−{x,y})≤ν(H)+μ(L)−1.

The two-edge resilience assumption gives ν(G')=ν(G), proving NS. Possible conflicts between old and apex triangles only lower the packing total; no simultaneous-attainment assumption is used.

## Proof of NS-state

Let M be any maximum matching of L. Its μ(L) apex triangles vxy are pairwise edge-disjoint and use old edges exactly M. They are therefore compatible with every triangle packing of H−M. Consequently

    μ(L)+ν(H−M)≤ν(G)≤ν(H)+μ(L)−1.

Cancel μ(L). This proves the universal maximum-matching quantifier and the stated edge-deletion bound.

## Sharpness and scope controls

K5 has ν=2 and retains this value after deleting any two graph edges. Up to symmetry, removed01,02 admit triangles034,123; removed01,23 admit024,134. At any vertex, H=K4 hasν1 and its full linkK4 hasμ2, so NS is sharp:2=1+2−1. A maximum link matching is a perfect matching ofK4; removing it leavesC4, making NS-state sharp as well:0=1−1.

One-edge packing resilience is insufficient. For the cone overC5, ν=2 and H at the apex is triangle-free, while μ(L)=2. Deleting any single spoke leaves aP4 rim for apex triangles, still packing2; deleting any single rim edge leavesP5, also matching2. Thus it is one-edge resilient but violates the strict NS bound2≤0+2−1. Deleting the two spokes over adjacent rim vertices leavesP3 and lowersν to1, exactly as the elementary blocker predicts.

## Relation to frozen work and review provenance

Frozen source: TUZA-17 commit aa0de600d7fb0cfe4134e82ad056f02e4c465eb6, notes/A_CRITICAL_NONSATURATION.md. Its NS and NS-state deductions are valid at their stated actual-minimal-counterexample scope. The prior proof of the matching blocker used the classical Tutte–Berge formula unnecessarily. The present proof removes that dependency and states the exact weaker premise already sufficient for the deduction: two-edge packing resilience alone, plus a triangle through the selected vertex.

This addendum does not rewrite the old frozen source or retroactively alter its recorded verification status. Root independently agreed with the elementary blocker and requested this self-contained addendum; full short-proof reconstruction is pending when this file is written. No Lean or human review is claimed. Historical originality of the elementary fact and nonsaturation implication is unestablished.
