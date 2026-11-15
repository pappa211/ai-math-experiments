# Addendum: the two-resource blocker induction fails inside the mixed-cover class

This supplements, without changing, `notes/rainbow_mixed_cover_literature_screen.md` SHA256 `938e5a038d055018449d460a56060e748cffa709a2f79f57649394af225b4b57`.

The lead was communicated by fresh_critic after the initial source screen froze. The precise source statements and the translation below were then independently inspected. This is a primary-source-based obstruction to a stronger induction, not a counterexample to τ_mix≤2ν_r.

Alexander Clow, Penny Haxell and Bojan Mohar, [*A Counterexample to a Conjecture of Lovász*, arXiv:2505.05339v2](https://arxiv.org/abs/2505.05339v2), Theorem2.1 and Lemma2.2, supply a cubic graph B on102 vertices with α(B)=43, a Hamilton cycle, and this property: for any two graph edges, some maximum independent set avoids all their endpoints. Theorem1.3 states the resulting hypergraph obstruction. The paper explains that the Hamilton cycle makes B 3-edge-colorable. These source statements were checked; the full independence-number proof and all symmetry cases in Lemma2.2 were not independently replayed here.

Let M1,M2,M3 be the three perfect matching color classes of B, obtained by alternating colors on the even Hamilton cycle and giving its complementary perfect matching the third color. Build a bipartite colored graph F as follows:

- Its two vertex classes are the51 edges in M1 and the51 edges in M2.
- For each vertex v of B, put an F-edge between the unique M1-edge and M2-edge incident to v.
- Color this F-edge by the unique M3-edge incident to v.

F is simple: two distinct B-vertices yielding the same two endpoints would make their M1-edge and M2-edge parallel in B. Every F-vertex has degree two, because its corresponding B-edge has two endpoints. Each color appears twice. The two F-edges of that color are disjoint: otherwise an M1- or M2-edge and an M3-edge would join the same two B-vertices. Thus F is triangle-free and properly colored, with exactly the color multiplicity allowed in the target lemma.

A rainbow matching in F is a set of B-vertices sharing no incident edge of any of M1,M2,M3, hence an independent set in B. Therefore ν_r(F)=43. Choosing a resource of F (a vertex or a color) corresponds to choosing an edge of B. Covering all F-edges by resources is exactly covering all B-vertices by B-edges. At least51 B-edges are needed because each covers only two vertices, and any Mi supplies51. Hence

    τ_mix(F)=51 ≤86=2ν_r(F).

Deleting any two resources of F forbids the B-vertices incident to two corresponding B-edges. By the imported Lemma2.2, an independent set of size43 still survives. The same holds for one or zero resources by monotonicity. Thus

    ν_r(F−Z)=43 for every resource set Z with |Z|≤2.

This disproves the proposed universal induction step that every nonempty graph in the target class has two resources whose deletion lowers ν_r. It leaves the factor-two mixed-cover inequality intact, with substantial slack in this example. A proof of that inequality cannot simply iterate such a blocker for every instance.

Primary PDF and receipt: `sources/rainbow_mixed_cover/clow_haxell_mohar_2505.05339v2.pdf`, `evidence/rainbow_mixed_cover/source_receipts.json`. Ordinary source-based structural deduction only; no independent finite graph certificate or formal verification is claimed. Original research cutoff09:23:58Z and hard deadline09:53:58Z unchanged.
