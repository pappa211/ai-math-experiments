# Cut-free private-K4 support candidate

## Exact claim, global bridge, first test

For any finite simple G and maximum triangle packing P, let B=E(P). A private triangle of a packed member T is an actual triangle Q≠T with E(Q)∩B equal to one edge of T. A private K4 completion of T is an actual K4 on V(T)∪{x}, x outside T, whose three other faces are private in this sense. Let A(P) consist of B together with every edge of every such private K4.

PK-all asserts that, for every maximum P, there exists a triangle cover C⊆A(P) with |C|≤2|P|. PK-exists requires this for some maximum P. Either statement implies unrestricted Tuza immediately. The proposed restriction is on which outside-support edges may be used, not on a global vertex cut or independent budgets for each packed triangle. It is strictly more specific than the unrestricted all-cover formula because an arbitrary outside-B edge is unavailable unless it belongs to the displayed local K4 configuration.

First decisive test: enumerate all maximum packings of each installed atlas graph, compute all actual private faces and K4 completions, and exactly minimize triangle cover over A(P). A PK-all counterexample forces strategic choice of P; a graph failing every P refutes the full mechanism. A 0.5-second graph timeout is UNKNOWN. Finite survival will not justify extending the range; the next obligation would be an augmenting-packing theorem for a failed local-support cover, not a new parameter bound.

## Elementary local structure and K3/K5 state warning

For a packed triangle T=abc, private pages on different edges must have the same outside tip. Indeed pages abx and acy with x≠y (both outside{a,b,c}) are edge-disjoint and avoid every other packed member, so replacing T by both would increase P. Thus if private pages occur on two different T edges, both tip sets are the same singleton{x}; the three spokes ax,bx,cx are present and outside B, forcing all three private faces of the K4. Otherwise all private pages lie on one packed edge, or there are no private pages. This fully uses actual graph closure.

Selecting exactly two local edges per packed triangle is already false as a universal template. In K5, P={123,145} has private books on edges23 and45; four-edge covers can need a3/1 split of packed-edge selections, such as{12,13,23,45}. PK deliberately allows this budget transfer. For a triangle-free cone, all matched spokes lie in B and give the standard2|P| cover. For a literal K4 block, the private completion makes all six edges available, so a two-edge opposite pair works without forcing any vertex cut.

These controls do not prove PK. In particular interactions among private K4s, ordinary book states, and triangles meeting two or three packed supports remain globally constrained.

## Structural result: PK-all survives the entire one-apex K4-block class

**Ordinary proof candidate, fresh review pending.** Let H be any finite simple graph whose actual triangle-edge components are literal K4 blocks; arbitrary triangle-free background edges and block vertex sharing are allowed. Let G add a vertex a adjacent to any subset X of V(H). Then PK-all holds: for EVERY maximum G packing P, there is a cover C⊆A(P) of size at most2|P|.

Every actual G triangle is either an old block face or a new apex triangle axy with xy∈H[X]. Let b be the number of old blocks. The apex triangles of P have rim edges forming an ordinary matching M. A block contains at most two edges of M; if there are two, they are opposite. An unused block contains exactly one old packed face, since otherwise a face could append. A block with one M edge likewise contains exactly one old packed face: it has a face avoiding that edge which could append if none were present. A block with two opposite M edges has no old face, since every K4 face uses one of those edges.

Normalize each two-rim-edge block by retaining one of its apex triangles, removing the other, and inserting an old face avoiding the retained rim edge. This preserves packing size and remains edge-disjoint from every other packed triangle. It removes apex spokes, creates no new apex spokes, and leaves the same set of used blocks. After all such operations the resulting maximum packing P' has one old face per block and an apex matching M' using at most one edge per block. Triangle-free background rim edges are unrestricted except for matching. Write m=|M'|. Then |P|=|P'|=b+m.

The matching M' is inclusion-maximal among link matchings using at most one edge per block. Otherwise an additional rim edge xy with unmatched endpoints could be added. If it lies in an unused block, change that block's old face to avoid xy; if it lies in the triangle-free background, no old face uses it. Appending axy then gives b+m+1 packed triangles, a contradiction.

Choose an opposite-pair old cover in every block, containing its M' edge when used. Add the2m spokes at the endpoints of M'. This gives a cover C of size2b+2m=2|P|: the old triangles are covered; an apex triangle with a matched endpoint uses a selected spoke; if both endpoints are unmatched, maximality excludes an unused block or background rim edge, while in a used K4 the rim edge is opposite its selected M' edge and hence belongs to the old cover.

Crucially, all edges of C belong to the ORIGINAL A(P), not merely A(P'). The selected spokes already belonged to P. In an originally unused block, P contained one old face and no packed apex rim, so its complete K4 was a private completion and all six block edges lie in A(P). In an originally one-rim block, the old packed face avoiding that rim contains its opposite edge, so both edges of the chosen opposite pair lie in B. In an originally two-rim block, its opposite pair was already the two packed rim edges in B; normalization retained one, and the selected pair is still that same pair. These cases exhaust all blocks. QED.

This proof uses no vertex coloring and applies directly to the robust connected-PC obstruction, so that obstruction does not transfer to PK-all. The positive Tuza theorem for this class is already in the frozen published baseline; the additional statement here is the cover's confinement to A(P) for every originally specified maximum packing. Originality is unestablished. This scoped result does not establish closure under a second arbitrary vertex addition or prove universal PK.

## Atlas discriminator status

All1253 installed atlas graphs were checked over all maximum packings, with no PK-all failure and no timeout; runtime0.453seconds. `evidence/apex_private_k4.json` retains every graph row and its first successful permitted-edge cover. This is finite supporting evidence only. No graph-order extension is planned merely because it passes.

## Primary-source relation, without an imported rounding claim

The local private-page0/1/3 taxonomy is already used in Chalermsook–Khuller–Sukprasert–Uniyal, *Multi-transversals for Triangles and the Tuza's Conjecture*, arXiv2001.00257v2, https://arxiv.org/abs/2001.00257. The primary PDF's setup and parts of Sections4.1–4.3 were inspected. Their half-integral construction includes type1 lending chains and rotations; it is not an integral-cover theorem and does not automatically prove the present permitted-edge claim. No novelty is claimed for the local taxonomy, and the entire69-page argument was not audited here. The frozen TUZA09 `notes/MULTICOVER.md` records distinct failures of universal splitting and half-cost rounding; those failures must not be silently bypassed. New scoped PK proofs above were reconstructed elementarily and import no fractional theorem. Source identities are recorded in `evidence/apex_primary_cksu.json` and `evidence/apex_public_sources.json`.
