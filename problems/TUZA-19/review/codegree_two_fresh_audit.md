# Independent audit: TF plus two-edge resilience with codegree-two edges

**Verdict: ACCEPTED at the stated scope.** The general lifting lemma and the fixed 72-vertex counterexample survive independent ordinary reconstruction and complete independent certificate checks. No material mathematical correction is requested. The proposed implication “TF plus two-edge packing resilience forces minimum triangle codegree three” is false. This is not a Tuza counterexample or a failure of either parity-cover gate.

## Frozen input, independence, controls and clock

- Frozen mathematical note: `notes/codegree_two_tf_resilience_counterexample.md`.
- Required and observed SHA-256: `ae0bd41560dae51e58f5197a46eb5cd62e7859f10fb7aeb2f488178c052da1a4`.
- Initial review inputs were ONLY that note and `evidence/codegree_two/input_manifest.json`. The initial ordinary reconstruction assessment was sent to root before reading the producer certificate objects.
- No producer checker source was inspected or imported. Their file bytes were hashed to verify the supplied manifest, but all validation algorithms below were independently written using only the Python standard library.
- Independence qualification: this reviewer had earlier mission context, including related K5 edge-decoration lemmas. The new Petersen-base and TF construction were reconstructed from this frozen input; neither producer checker nor prior favorable review was used to establish the first assessment.
- Requested model controls: Astra/Ultra. Precise actual serving model and effort are not independently exposed in this context and are not attested.
- Original clock preserved: start `2026-11-15T01:53:58Z`, research cutoff `09:23:58Z`, hard deadline `09:53:58Z`. Review clock observation: `2026-11-15 04:14:46 UTC`. No reset occurred.
- Host independently observed as Darwin; all computation ran locally in the authorized private mission workspace. No Lean, remote execution, publication or external literature dependency was used.

Input snapshots are preserved in `review/codegree_two_fresh_inputs/`: the frozen note, input manifest, Petersen-base JSON and enlarged-graph JSON. The snapshot manifest hash is `464e21f552705dd2d45622247f16d127f4e85f9374e5c2e0070066e431ca3aaf`. All five entries in the producer manifest matched their exact file hashes before checking; the frozen note hash matched again at checker completion.

## Reconstruction of the all-size lifting argument

Let B be finite and simple and remain at packing number nu(B) after every deletion set of at most two graph edges. Let H=B[U] be induced, satisfy TF, and have every edge contained in an H-triangle. Attach a fresh K5 on each edge of B outside H, with three distinct new vertices per attachment and no other new edges.

A triangle with a fresh vertex is contained in that vertex's own K5, because its neighbors are confined there. Each block has only two old vertices, so none of its local triangles is an old B-triangle. All remaining triangles are exactly those of B. The edge sets of H and the complete attached K5s partition W. Inducedness is used correctly: an old triangle outside H cannot have two H-edges, since two such edges put all three vertices in U and then inducedness puts the third edge in H. Thus every outside old triangle has at least two decorated roots.

The local K5 packing number is two and a two-packing can avoid the root. Counting old and local triangles gives the upper bound nu(B)+2d; a maximum B-packing together with root-avoiding local pairs attains it.

For a deleted set S of at most two W-edges, replace each affected block by its root in B, and retain each deleted H-edge. Because H and the blocks partition graph edges, this gives at most |S| base edges R. Choose a maximum B-packing avoiding R. Every affected K5 retains two disjoint triangles after its at most two local deletions; these may use the root because the chosen B-packing avoids it. Unaffected blocks use root-avoiding pairs. Every possible shared edge has therefore been accounted for. This proves full two-edge resilience, including two deletions in one block, in different blocks, involving original roots, or involving undecorated H-edges.

Every cover restricts to a cover of each edge-disjoint local clique and of H, so tau(W)>=tau(H)+4d. Choose a minimum H-cover and minimum root-containing covers in every K5. The at-least-two-root property covers all outside old triangles, proving equality.

TF is equivalent to each actual triangle lying wholly in a minimum cover: removing its three selected edges gives the upper bound after triangle deletion, while adding those three edges to any cover of the deletion graph gives the reverse bound. The three cases in the frozen proof all work:

1. For an H-triangle, use TF in H and root-containing covers elsewhere.
2. For an old triangle outside H, any one H-edge it contains belongs to an H-triangle and therefore to a minimum H-cover. Its remaining edges are decorated roots, all selected.
3. For a local K5 triangle, use the unique balanced-partition four-cover containing that triangle. Its root value is fixed. If that root is omitted, every old triangle containing it still has another decorated root selected in a different block.

The assumption that every H-edge lies in an H-triangle is material in case2. Inducedness is material in cases2–3. The proof does not silently assert arbitrary root flexibility after fixing a whole local triangle.

An undecorated H-edge gains no new common neighbor: a new vertex is adjacent to only the two old endpoints of its own decorated root. Therefore its triangle codegree is preserved from B to W. Comparing instead with H would be wrong in general; the frozen statement correctly uses B.

The general lemma proves the asserted packing, ordinary cover, TF and resilience statements. It does not claim a universal odd-cover extension formula for arbitrary H. The fixed witness's equality pi=tau is separately established by an explicit global coloring and was independently checked below.

## The induced core: direct reconstruction of the only compressed argument

For H=K2 join C5, the six-cover consisting of ab and all five rim edges is immediate. The lower bound for covers containing ab can be proved without importing the unnamed multicone formula in the frozen note.

Let F be the selected rim edges. The selected spokes at each apex must form a vertex cover of C5-F, so their total number is at least 2vc(C5-F). Take a minimum such vertex cover S. Every rim edge with both endpoints outside S lies in F; hence

    |F|+2vc(C5-F) >= e(C5-S)+2|S|
                         = 5+e(C5[S]) >=5.

Together with ab, the cover has at least six edges. A cover omitting ab needs at least one spoke over every rim vertex. A putative five-cover would select exactly one spoke per vertex and no rim edge, forcing the choices to alternate around C5, which is impossible. Thus tau(H)=6.

For abv, selecting ab,av,bv and the three rim edges not incident with v gives a six-cover containing the triangle. For auv over a rim edge uv, select uv plus one spoke at each rim vertex, alternating the apex along the four-edge path C5-uv; its endpoints both choose a. This contains the triangle and covers every H-triangle. The b case is symmetric. Hence H has TF. Every H-edge is in an H-triangle.

The independent checker additionally exhausted the 4,368 five-edge sets and 8,008 six-edge sets of H, confirming no five-cover and exactly31 six-covers, with a containing cover for every H-triangle.

## Independently rebuilt Petersen base

The checker rebuilt the fifteen rim edges directly from the outer C5, inner step-two C5, and five matching spokes. It then added adjacent apices10,11 and their twenty rim spokes. Complete actual-triangle enumeration confirms12 vertices,36 edges and40 triangles, with no rim triangle.

All 2^15 rim-edge subsets were independently examined for being matchings, yielding332. All ordered edge-disjoint matching pairs were then considered, with each possible abv triangle exactly when both matchings avoid v. This is complete because a packing has at most one abv member and every remaining triangle is an apex plus a rim edge. The resulting independent counts match:

- 157,258 distinct used-edge packing masks;
- maximum size9;
- 960 distinct maximum used-edge masks;
- a literal nine-packing avoiding each of the630 pairs of base edges.

The short upper-bound certificate was also independently checked: all six perfect matchings were enumerated, and every complement has two components, each a five-cycle. Thus two edge-disjoint perfect matchings do not exist. An abv packing has at most1+4+4=9 members, and a packing without abv cannot have ten. This supplies an independently reconstructed upper bound in addition to the full enumeration.

The ancillary failed-base statements were checked too. All two-apex spoke-set choices with ab selected were exhausted; with ab omitted, all choices covering every abv triangle were exhausted. The minima are12 and13 respectively. There are exactly five minimum twelve-covers; their union contains all36 edges, and only the ten abv triangles occur wholly in a minimum cover. Direct vertex-color enumeration gives pi(B)=12. Thus B is cover-critical and two-edge resilient but fails TF exactly as the frozen historical control states.

## Full enlarged graph and every required certificate

Using the lexicographic order of the twenty roots in B outside H, the reviewer independently generated the fresh labels12+3j,13+3j,14+3j and all clique edges. No producer edge list was used for construction. Literal enumeration over all72-vertex triples gives exactly216 edges and240 actual triangles. The independently generated lists match the retained producer graph exactly.

The optimality arguments and matching certificates give

    nu(W)=9+40=49,
    tau(W)=6+80=86,
    pi(W)=86.

For the odd-cover upper bound, the reviewer independently colored the two apices oppositely, alternated the outer cycle with one monochromatic edge, extended colors to the inner rim, and chose balanced local K5 cuts with each prescribed root value. The resulting86-edge set meets all240 actual triangles oddly. The ordinary lower bound already gives pi>=86.

The reviewer generated fresh86-edge containing covers for ALL240 actual triangles and checked every one against the complete240-triangle list. This proves every TF upper-bound certificate at once; the reverse inequality follows by adding the three removed edges, as above.

The reviewer also generated a fresh49-triangle packing for ALL23,220 unordered pairs of W-edges, using independently generated base and local K5 tables. Each packing was checked for49 distinct actual triangles,147 distinct used graph edges, and avoidance of both deleted edges. This independently covers zero and single deletions as well. The deterministic independent sequence digest is

    e5f4b304a47e22f48134f521629933bfd5bff8b6d5b24c7d0bee5ad9ae94e9ac.

It differs from the producer digest because the independently generated local/base choices need not coincide; it is not presented as a reproduction of the producer's sequence.

The exact codegree histogram is

| Triangle codegree | Number of edges |
|---:|---:|
|2|5|
|3|180|
|4|10|
|5|10|
|7|10|
|10|1|

The five codegree-two edges are01,04,12,23,34. As a check on the B-versus-H distinction, the ten H-spokes have codegree3 in H but4 in B and W; ab has codegree5 in H but10 in B and W. The low-codegree cycle edges have codegree2 throughout.

Only after constructing these independent certificates did the checker validate the producer certificate objects: all630 base packing certificates, all240 W containing-cover certificates, the W odd cover and maximum packing, all56 local K5 deletion certificates, and the entire codegree map. All passed.

## Objections tested and resolved

- **Hidden interface triangles:** excluded by fresh-vertex neighbor confinement and confirmed by full literal enumeration.
- **Two H-edges in an outside triangle:** impossible only because H is induced; this hypothesis is present and used.
- **Wrong root state in a local TF cover:** the root is not freely chosen once the triangle is fixed. The proof correctly repairs the potentially omitted root using the second decorated root in every outside old triangle.
- **Failure after two deletions within one block:** independently checked among all56 local K5 cases, and the base avoids the affected root even if the local replacement uses it.
- **Codegrees silently compared with H:** the proof explicitly preserves B-codegrees; the independent histogram confirms the distinction matters for other H-edges.
- **Unnamed H-cover formula:** resolved above by a complete direct argument. This is an expositional compression, not a gap in the claimed theorem after reconstruction.
- **Petersen facts assumed from memory:** both the complete matching family and the six perfect-matching complements were rebuilt from the literal edge list.
- **Restricted packing search mistaken for completeness:** the two matching plus optional abv classification exhausts every actual base triangle type, so the finite upper bound is complete.
- **Odd-cover conclusion overgeneralized:** only the fixed witness's pi=86 is asserted and checked; the general lifting lemma's ordinary-cover result is kept distinct.

No unresolved mathematical objection remains to the frozen claims.

## Evidence and reproduction

Independent checker: `review/codegree_two_fresh_checker.py`.

Independent evidence directory: `evidence/codegree_two_fresh/`.

| Artifact | SHA-256 |
|---|---|
| checker | `d45b90afe11d3dede0d39a1e284b16b5037d0aec0b980ad1d5af5c3461171374` |
| `results.json` | `9b3fb9b018e945a48c4e7239fc33a5de8ab79d60c90857a4521b74ba87ef951f` |
| `base_pair_certificates.json` | `6f7b11e707b601b7a588d738abd50456c41556d9873c1cf269b39ae4447da594` |
| `TF_certificates.json` | `3eb2d735be40563ce9c86841dabe87ef0579ae9e099fc2f9c3d8d946eb990b22` |
| `literal_witnesses.json` | `ab848fcba0ad10eb9b77802fc52722ba3bb73ba5b90803d7453672bb361565bb` |

Reproduce from the mission workspace:

```sh
source LOCAL_ENVIRONMENT
python3 review/codegree_two_fresh_checker.py
```

The results JSON includes elapsed time, so its file hash can change on a repeat. Mathematical certificate lists and the deterministic deletion-sequence digest have fixed intended content.

Verification level: independent ordinary AI reconstruction plus complete finite validation of the fixed base and enlarged witness. No human review, Lean/kernel proof, unrestricted Tuza result, parity-gate counterexample or historical originality claim is implied. The strongest accepted conclusion is precisely that TF and two-edge packing resilience do not force triangle codegree at least three.
