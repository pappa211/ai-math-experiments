# Track A — eligible-packing exchanges

Scope: TUZA-14, ordinary mathematics; targets S and E remain unproved. Read canonical AGENTS.md, migration handoff/report, mission clock, and TUZA-13 REPORT.md, NEAREST_MISSES.md and STRUCTURAL_ATTACK.md. Source TUZA-13 is read-only. Requested agent model/effort is gpt-6-astra/ultra; serving attestation unavailable.

## A1. Private-witness conflict excludes the same red pair from T2

**Literal statement fixed in session before testing, PROVED_ORDINARY.** Let C be any triangle cover of an actual finite simple graph G (minimum cardinality is not required here). If one-red triangles Q_e and Q_f, with distinct unique red edges e and f, share a blue graph edge, no actual triangle has red set exactly {e,f}.

Proof. Such a triangle would require e and f to share an endpoint, say e=uv and f=uw. Since Q_e and Q_f have distinct red edges and share a blue edge, their common blue edge must be ua for some a outside {u,v,w}; their other blue edges are va and wa. (A shared edge not incident with u would force the triangles to have the same three vertices.) A two-red triangle on e,f would require blue edge vw. Then vwa is an all-blue actual triangle, contradicting that C covers every triangle. If e and f are disjoint, they cannot be in a single triangle in the first place. QED.

## A2. Unique actual private witnesses pack together

**Literal statement fixed in session before testing, PROVED_ORDINARY.** Let C be a globally minimum triangle cover. Let U consist of the red edges having exactly one ACTUAL one-red triangle witness. The unique witnesses of all edges in U are pairwise graph-edge-disjoint. Consequently k(G,C)>=|U|; if 2|U|>=|C| then S holds for this pair. In particular if every red edge has exactly one private witness, k(G,C)=|C|.

Proof. Distinct witnesses cannot share a red edge. If the witnesses for e,f share blue edge b, replace e,f in C by b. Every T1 triangle affected by deleting e or f is one of those two unique witnesses and contains b. By A1 no T2 triangle has its entire red set deleted. No T3 triangle can have all three red edges deleted by removing only e,f. Thus the replacement is a triangle cover of size |C|-1, a contradiction. The witnesses therefore form an eligible packing. Any eligible packing uses at least one distinct edge of C per member, so its size is at most |C|. QED.

Scope warning: 'unique witness' means uniqueness in the complete actual triangle family, not uniqueness after selecting an arbitrary representative or deleting packing-blocked triangles. Coordinator reports independent structural critic acceptance of A1 and A2; no separate per-lemma clock assertion is made.

## A3. Candidate nonlocal extension, frozen before tests

**Literal candidate fixed in session before testing; subsequently REFUTED as recorded below.** For every globally minimum C, there exists a maximum eligible packing containing all unique private witnesses from A2 simultaneously.

This would strengthen their pairwise disjointness into a safe prepacking rule. It is not used in A1 or A2 and requires either proof or exact refutation. It may fail because additional eligible triangles can occupy different blue resources of a unique witness and interact nonlocally.

## Packing charge formulation

For an eligible packing P with p1 one-red members and p2 two-red members, the used red set has size p1+2p2 and k=p1+p2. With U_P the unused red edges, the desired |C|<=2k is exactly |U_P|<=p1. Any proposed injection/alternating mechanism must therefore route unused red demands to one-red packed triangles, while handling blue resource conflicts at two-red packed triangles. This is an identity, not a proof of the required injection.

## A4. Multiplicity-two candidate, frozen before tests

**Literal candidate fixed in session before testing; subsequently REFUTED as recorded below.** If every red edge of a globally minimum C has at most two ACTUAL one-red witnesses, then the maximum one-red-only packing has size at least ceil(|C|/2).

This is stronger than S in its restricted domain. A red edge uv with two private witnesses uvx,uvy induces the blue C4 u-x-v-y-u. Its private blue pairs are the two opposite wedges; if xy is red, the other two wedges are its private witnesses. Arbitrary proper edge-colorings do not preserve this realizability constraint.

## A3 outcome: even one unique witness need not be safe to prepack

**REFUTED_EXACT_AUXILIARY_ONLY.** The fixed-control test examined all 264 globally minimum covers of eight controls in 0.024 seconds; its complete finite scope is in `evidence/track_a_controls.json`. There were A3 failures, with no timeout. This is not a graph census and not a test of a universal proof.

Take the second normalized TUZA-13 near miss, with K5 on {1,2,3,4,7}, K4 on {0,5,7,8}, and precisely the outside triangles 246,468,478. Let

    C={05,13,24,27,46,47,78}.

The K5, K4, and triangle468 are edge-disjoint, so every cover needs at least4+2+1=7 edges; displayed C attains7. Red46 has exactly one private witness468 (triangle246 has two red edges). The eligible packing {478,246,134,237,058} has size5. At most2 triangles can be packed inside K5, at most1 inside K4, and at most2 outside, so eligible k=5. Any packing containing468 loses both other outside triangles and has size at most2+1+1=4, attained by {468,237,147,578}. Thus the unique actual private witness belongs to NO maximum eligible packing.

This does not refute A2: the unique witnesses pack with each other, but maximizing the total packing can require omitting one of them. Full literal: `witnesses/track_a_unique_prepacking.json`. Separate agent validation requested; no central S/E failure occurs (the threshold is4).

## A4 outcome: multiplicity two still needs two-red triangles

**REFUTED_EXACT_AUXILIARY_ONLY.** Coordinator proposed the following directed construction. Let I have6 vertices. Add15 pair-vertices indexed by the2-subsets of I, each adjacent to its two I endpoints. Among the pair-vertices choose a triangle-free spanning subgraph Q of KG(6,2), by deleting one edge from each of its15 edge-disjoint triangles. The base H is triangle-free. For every Q-independent collection A of pair-vertices, the corresponding independent set in H has maximum size |A|+6-|union A|. Thus alpha(H)=6 precisely when |A|<=|union A| for every Q-independent A.

Track A tested seeded deletion patterns (Python random seed140602), each by complete recursion over its Q-independent subsets. The first satisfying pattern was attempt36,426, found in2.7213 seconds under a25-second cap. This is a directed auxiliary-pattern search, not a broad census. Discovery record: `evidence/track_a_multiplicity_two.json`; reproducible script: `checks/track_a_multiplicity_two.py`.

Cone G over this21-vertex H has globally minimum cover C consisting of the15 pair-vertex spokes. The cone triangle-cover number equals the base vertex-cover number: any triangle cover converts to a base vertex cover of no greater size by taking vertices of selected spokes and one endpoint of each selected base edge. Since alpha(H)=6, tau(G)=21-6=15. Every red spoke has exactly two private triangles. Every private triangle uses one of the six I spokes, so private nu<=6; an explicit six-packing attains6. The required half-cover threshold is8. In contrast, explicit eligible packing10 exists and is optimal from the21 spoke resources. Therefore S/E survive this example.

A second actual-base-graph include/exclude recursion verified alpha(H)=6 in470 cached states. It shares the Track A author/runtime and is not separate-agent validation. Full original22-vertex cone: `witnesses/track_a_private_multiplicity_two.json`; eligible10 and private6 packings are literal.

Coordinator then observed a deterministic reduction: delete the first two pair-vertices6,7 from H. The induced19-vertex H' retains I, so alpha(H')=6 by monotonicity and the six-vertex lower witness. Its cone has20 vertices and an optimum13-spoke cover, each red still having exactly2 private witnesses. Private nu=6 is below threshold7; eligible nu=9. Both packings and the deletion/relabel map are in `witnesses/track_a_private_multiplicity_two_reduced.json`. No global smallest-order claim is made. This reduction requires no new discovery search.

The obstruction rules out a natural private-only extension of A2 even at the next possible witness multiplicity. It reinforces the requirement that a general exchange proof incorporate two-red triangles rather than relying only on private-witness abundance or scarcity.

## Cross-review of Track B

B4 is valid with its exact quantifiers. One-for-one exchange C-e+b covers G exactly when the complete private family of e consists of one triangle containing b. For an old eligible packing, loss occurs only at a two-red member containing b and avoiding e; edge disjointness gives at most one such loss. An old all-red triangle containing e and disjoint from the packing becomes eligible, but exchanging it for the lost member only preserves cardinality. No monotone progress or absence of closed migration cycles follows.

B5 is valid. With choices outside a vertex star fixed, uncovered opposite edges form H_v, and permissible incident selections are exactly its vertex covers. Global minimality implies star minimality, but the K5 red5-cycle cover is star-minimal of size5, with eligible packing2, while global tau=4. For a literal nonstar improvement, label red cycle01,12,23,34,40: delete red01 and23 and add blue03. The unique private triangles013 and023 share03; remaining red choices cover all other triangles.

B2/B3 retain the necessary existential cover quantifier after red-set deletion. B6's cone identity and absence of all-red triangles agree with the cone reasoning above. No gap found in these scoped statements; none supplies the missing global augmentation.


## A3-threshold: weaker nonlocal prepacking candidate

**Literal statement, UNPROVED:** For every finite simple graph G and globally minimum triangle cover C, let U be the red edges having exactly one actual one-red witness. There exists an eligible packing containing all those unique witnesses and having at least ceil(|C|/2) triangles.

This strengthens S by prescribing those witnesses; A3's maximum-size claim was stronger and is false. This weaker statement is not implied by A2, which only proves that the prescribed witnesses are mutually compatible.

Provenance: before this statement was named and recorded, Track A made an exploratory query of the already stored264-cover controls comparing forced_unique_k with ceil(tau/2); no violation occurred. The candidate is therefore NOT claimed to have been frozen before that exploratory query. The literal statement is now fixed before a separately recorded repeat audit of exactly those existing records. No new graph enumeration or discovery search is authorized by this candidate, and a surviving control audit is not a proof.
