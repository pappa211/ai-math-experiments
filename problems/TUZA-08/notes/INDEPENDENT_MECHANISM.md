> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Independent mathematical exploration: TUZA-08

Internal AI analysis; ordinary proofs only. Existing A1 statements and the prior padding obstruction were read directly. No Lean build, remote computation, or external contact was used.

## Exact edge-restoration identities

Let H be any finite simple graph, uv a nonedge, W=N_H(u)∩N_H(v), and G=H+uv. For w∈W put F_w={uw,vw}. Assume W is nonempty. Then

ν(G)=max(ν(H), 1+max_{w∈W}ν(H−F_w)).

A packing containing a new triangle contains exactly one such triangle uvw, since all new triangles share uv. Its other triangles form a packing of H−F_w. Conversely every such residual packing can be augmented by uvw, while every H packing survives in G. These two constructions prove equality.

Let τ_hit be the minimum cardinality of an actual-edge triangle cover C of H satisfying C∩F_w≠∅ for every w∈W. This minimum exists because E(H) is eligible. Then

τ(G)=min(τ(H)+1, τ_hit).

A G cover containing uv must cover H with its other edges, so its minimum cost is τ(H)+1. A G cover omitting uv is exactly an H cover that meets every F_w. The cases are exhaustive and prove the identity.

For W={a,b}, write A=F_a,B=F_b. If ν(H)=k, each wedge deletion has packing number k−1, and no minimum H cover meets both pairs, then

ν(G)=k and τ(G)=τ(H)+1.

In particular, adding τ(H)=2k to this conjunction immediately makes G a Tuza counterexample. Thus the entire tight, packing-blocking, cover-incompatible profile already certifies a counterexample, even without the remaining edge-minimality hypotheses. One must not demand positive real examples of that whole conjunction or present its universal exclusion as a small independent lemma. The non-tight seven-vertex example in the proof file exercises the same wedge losses and incompatible cover choice without violating Tuza.

These restoration identities are ordinary deductions and were not separately Lean formalized in this mission.

## A diagnostic that does not add information beyond A1

When uv lies in exactly uva and uvb, let R=G−(A∪B∪{uv}). Deleting A∪B already leaves uv in no triangle, so R has the same triangle family as G−(A∪B). A1 four-edge resilience gives ν(R)≥k−1; appending uva to any R packing gives the reverse bound. Thus ν(R)=k−1. Cover extension and hereditary Tuza give 2k−3≤τ(R)≤2k−2.

This useful exact residual profile is only A1 accounting. It should not be promoted to a new structural theorem.

## Surviving ordinary structural lemma

See [COVER_SWITCH_PROOF.md](COVER_SWITCH_PROOF.md) for the fully quantified arbitrary-r cover-exchange theorem, its proof, a sharp seven-vertex example, and finite corroboration.

It proves that two incompatible pair-containing minimum covers must each change at least three outside edges, with both endpoint orientations on each side and at least two outside edges with no appropriate private spoke triangle. More generally it gives explicit mixed covers whose cost is at most τ(H)+floor(n_0/2), where n_0 counts those neutral outside edges for the chosen two covers.

This is an actual structural restriction, not a restatement of Tuza. Its broad hypotheses admit concrete graphs, and no optimum or counterexample assumption occurs in its general cover-cost form. The sharp example shows why the restriction alone cannot solve the diagnostic. There is currently no ancestry-derived bound n_0≤1 or a proved packing incompatibility of n_0≥2. The correct campaign-level interpretation is a useful narrow lemma plus a remaining gap, not a contradiction or a justified large proof campaign.

## Review handoff

The coordinating AI should have a fresh internal critic reconstruct the residual definitions, unique endpoint orientations, four-case cover proof, neutral-edge count, and sharp graph certificates. In particular the critic should verify that the triangle families stay full after deleting the common cover edges, that neutral edges need not be triangle-free, and that the radius-three graph is explicitly non-tight. No external specialist review or historical priority is claimed.
