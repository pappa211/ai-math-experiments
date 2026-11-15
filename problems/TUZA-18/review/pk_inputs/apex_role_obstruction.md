# The actual occurrence obstruction for private-tip PK controls

Status: ordinary proof and independent literal finite certificate. This refutes an auxiliary universal packing-selection assertion, not PK or Tuza. Parent and apex scout independently identified the same six-vertex control.

## 1. The positive private-tip control and its exact role

The shared type1 argument is frozen separately in `notes/criticality_private_tip_pk.md`: if every member of a maximum packing has a packed vertex occurring in no other packed triangle, its opposite edge supports a private page, and its two incident spokes support no private page, then the packed support itself contains a cover of size at most twice the packing size. The proof handles arbitrary actual private-page intersections, including reciprocal internal apices, via a four-for-three augmentation. This is an all-order scoped PK theorem. I independently reconstructed the frozen proof with original SHA-256837a3d44d8b4b917796b1cfe6509f4e72b0bca960cf782865fe3bd3f521e216d; no gap was found. Later scope-only amendments are the author's responsibility.

The hypotheses supply a global anchor/tip partition. Such a partition is NOT automatic for an arbitrary maximum packing; the witness below shows it cannot always be obtained by choosing a different maximum packing even when every packed triangle is type1.

## 2. Simple support-maximization lemma

Choose P among maximum-cardinality packings to maximize the number of graph vertices used. Suppose T=abx has a private page aby with y outside V(P). If x occurred in another member of P, replacing T by aby would remain a packing, retain every used vertex, and add y. This contradicts the secondary objective. Thus x is globally private among packed triangles.

Consequently, if every member of such a packing is type1 and has an external private witness, the preceding private-tip theorem applies directly. A previously considered three-for-three argument for shared tips under these external-witness hypotheses was valid but unnecessary: this one-for-one swap already proves the required private-tip condition. No separate advance is claimed for that redundant longer argument.

The missing point is the existence of those external witnesses. Vertex-support maximization alone cannot manufacture them.

## 3. Six-vertex counterexample to all maximum-packing tie-break repairs

Let G consist of K4 on{0,1,4,5} and two additional triangles245 and345, with no other edges. Thus

    E(G)={01,04,05,14,15,24,25,34,35,45},
    triangles(G)={014,015,045,145,245,345}.

Every packing has at most one K4 face and at most one of the two added pages (which share45), so ν(G)≤2. Exactly four two-packings exist:

    {014,245}, {014,345}, {015,245}, {015,345}.

Each attains the bound and uses exactly five vertices. Hence every maximum packing is also maximum under the secondary objective |V(P)|.

For P={014,245}, the first packed triangle has private base01, with its sole private page015; its tip4 belongs to the second packed triangle's private base45. The second packed triangle has private base45, with its sole private page345. The other K4 faces045 and145 meet two packed edges and are not private. Thus both packed triangles are type1, but their anchor/tip roles conflict at4. The same calculation applies to all four maximum packings by swapping4↔5 and/or2↔3.

Therefore NO maximum packing of this graph has the global anchor/tip separation required by the private-tip theorem. No further tie-break among maximum packings can fix that occurrence statement. In each case the problematic K4-face private witness has its apex already in the other triangle's base; the external-witness lemma does not apply.

This graph satisfies PK strongly: the two packed base edges{01,45} cover all six actual triangles, giving τ(G)=2=ν(G), well within2ν(G)=4. The obstruction is only to a proposed universal structure theorem. It also shows that eliminating every mixed role is an unnecessarily strong mechanism: these mixed roles can coexist with substantial cover savings.

## 4. Exact finite scope

A targeted atlas discriminator tested3578 maximum-vertex-support maximum packings in the installed1253-graph list.39 graph rows had a role-mixed lexicographic maximum packing;16 had no role-consistent lexicographic maximum packing at all. This was a falsification test of the new occurrence assertion, not a PK graph-order extension. The smallest displayed witness is the six-vertex graph above. Atlas completeness is not needed for its counterexample status.

`checks/apex_role_witness_verify.py` independently enumerates every three-vertex set and every subset of the six actual triangles, verifies all four maximum packings and their private-page types, and checks the explicit two-edge cover. It imports neither NetworkX nor the discovery code. Evidence: `evidence/apex_role_witness_verified.json`. The larger discriminator is `checks/apex_role_probe.py`, with evidence `evidence/apex_role_probe.json`.

The credible remaining global question is whether mixed-role configurations can be paid for by actual support-cover savings while combining with type0 and private-K4 states. The isolated private-tip theorem does not supply that amortization, and merely asking for universal role separation is now refuted.
