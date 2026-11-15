# Exact failure of minimum-cover apex bookkeeping

**Status:** elementary counterexample to an auxiliary identity, independently checked by a separate exact enumeration script. It is not a counterexample to AC, UAC, or Tuza. UAC remains unresolved. No Lean or externally independent verification is claimed.

## Witness and ordinary proof

Take V(G)={0,1,2,3,4,5,6}, apex z=1, and

E(G)={01,04,06,12,15,16,23,25,35,36,45,46,56}.

Every actual triangle of G is one of

016, 046, 125, 156, 235, 356, 456.

Thus H=G−1 has exactly the four triangles046,235,356,456. Its unique minimum triangle-edge cover is C={35,46}. To see uniqueness, a two-edge cover must meet the edge-disjoint triangles046 and235 using one edge from each. To meet356 it must select35 from235 or36 from outside both, and36 is impossible under that restriction. Hence35 is forced. To meet456 as well as046, the other edge must be46. Conversely this pair covers all four old triangles. The edge-disjoint old triangles046 and235 prove τ(H)=ν(H)=2.

The induced link on X={0,2,5,6} has edges06,56,25: it is the path0−6−5−2. Its edges are disjoint from C, so λmin=vc(L)=2. Therefore restricting apex bookkeeping to minimum H covers produces value4.

The three edges{06,25,56} cover every displayed G triangle. The three triangles016,125,356 are edge-disjoint. Consequently τ(G)=ν(G)=3. In particular

    min_{C minimum for H} (|C|+vc(L−C))=4>3=τ(G).

This failure already occurs with a proper three-vertex-colouring of H: colour classes{0,5},{2,6},{3,4}. The associated triangle-edge three-colouring is rainbow on every triangle, and L is induced and bipartite. Thus even all literal AC eligibility hypotheses do not make the minimum-cover restriction exact. The actual AC inequality here is4≤6 and is satisfied with room to spare.

## Unbounded additive loss

For any positive integer k, take k vertex-disjoint copies of this graph and identify their apex vertices1, making no other identifications or added edges. Every triangle stays inside one copy: a triangle through the shared apex requires two nonapex vertices adjacent, hence from the same copy, and a triangle avoiding it cannot cross components. Edge sets of the copies are disjoint. Cover and packing optima add, giving τ(G_k)=ν(G_k)=3k. Removing the shared apex leaves k disjoint copies of H, with unique minimum cover consisting of all corresponding35 and46 edges. The induced link is k disjoint P4s, so λmin=2k and the restricted apex value is4k. The loss is exactly k and the ratio is4/3. No claim of maximal ratio is made.

## Correct exact replacement

For any finite H,X, put L=H[X]. For each S⊆X, set F_S=E(L[X\S]) and define the forced-cover penalty

    δ(F)=|F|+τ(H−F)−τ(H)≥0.

A cover of H containing F has minimum size |F|+τ(H−F): removing F leaves an H−F cover, and adjoining F to an H−F cover hits all H triangles. Therefore the full apex identity can also be written

    τ(G)−τ(H)=min_{S⊆X} (|S|+δ(F_S)).

The original minimum-cover invariant is only

    λmin=min {|S|:δ(F_S)=0}.

The witness has a nonzero-penalty choice S=∅ with δ(E(L))=1, improving the zero-penalty minimum2. Any proof requiring only the zero set may pay an arbitrarily large additive loss. The profile formula itself is exact bookkeeping, not a new compatibility bound or global proof.

For a hypothetical edge-minimal Tuza violation with p=ν(G), τ(G)=2p+1 and b=2p−τ(H), the exact equation is

    min_S (|S|+δ(F_S))=b+1.

This expresses the remaining obstruction without a minimum-cover restriction. It does not prove that the minimum is≤b, nor supply global apex availability.

## Computation and limitations

`checks/apex_probe.py` exactly evaluated the installed NetworkX atlas list:1,253 graphs,8,475 vertex-deletion apex instances, no UAC failures and five restricted/full-cover gaps. Its smallest gaps have seven vertices; calling this a mathematically certified smallest-order obstruction would additionally rely on atlas completeness. The displayed witness does not require that reliance.

`checks/apex_witness_verify.py` imports neither the discovery checker nor NetworkX. It directly enumerates every possible three-vertex triangle, every edge subset in order of size for cover optima, every triangle subset for packing optima, and every vertex subset for link-cover optima. It confirms the explicit witness. Shared-context authorship means this is an independent implementation, not independent AI/human review.

`checks/apex_random.py` ran the predeclared bounded falsification extension for175.287seconds with seed1814112026, graph orders7–12, three structured/random generators, and0.3-second per-instance deadlines.6,144 graphs completed;397 timed-out cases are UNKNOWN. No UAC failure appeared. This does not justify a general claim. As specified in the gate, the sample extension stopped without raising the prior budget boundary or expanding into a broad census.

Exact evidence: `evidence/apex_atlas.json`, `evidence/apex_witness_verified.json`, and `evidence/apex_random.json`. Python3.12.12, NetworkX3.7, native Mac environment; no solver installed. No literature theorem or unrestricted equality characterization is used. The elementary apex identities were read from frozen TUZA-17 `notes/B_FROZEN_v1.md`; they were rederived here without using its restricted Aharoni/HNS branches.

### Incomplete random-search evidence explicitly retained

The random-search receipt retains aggregate completed/UNKNOWN counts, fixed seed, generator code and total attempted count6541. It does NOT retain the identities of the397 timed-out graphs or a per-instance completion ledger. These UNKNOWN identities are therefore incomplete evidence. The deterministic generated sequence can be regenerated, but completion/timeout classifications depend on timing and are not certified per graph by the saved aggregate. No rerun was performed merely to fill this gap, and no exhaustive-domain completion claim is made.
