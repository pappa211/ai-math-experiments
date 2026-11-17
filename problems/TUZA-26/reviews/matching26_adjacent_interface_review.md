> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: complete adjacent named-support interface

Frozen 2026-11-16T22:11:44.993038+00:00. **PASS — the ordinary domain reduction is accepted at its explicit hypotheses, and the complete finite exclusion is independently replayed.** These are separate acceptances. No author optimizer was imported or reused. No author artifact was edited. The minimum-degree-four assumption remains explicit; its derivation for the conditional minimum Q is a separate composition dependency, not proved by this review.

Reviewed source hashes:

- notes/apex_adjacent_vertex_domain_v1.md: `e0e18239c5fc978e1e68fd4d44efad79f7cffa6dc9cca6ee2884923a292b72a4`.
- notes/apex_adjacent_interface_domain_v1.md: `63981c5c4a74ecf5b51dd9b8bf2c08f374be93490461a092f13138a8a725bad6`.
- notes/apex_adjacent_interface_result_v1.md: `3a02e3129a0c81a05be053cb9d07abcbe5da08d93dabb2958aa6f4e53890ab40`.
- evidence/apex_adjacent_interface_domain.json: `dddbb2bb0e42b91f9c2025356cc1120d1d80e44b427587989d18837fcd6872a4`.
- evidence/apex_adjacent_interface_exact.json: `76192d39f8c27bd665ebd7f9db481d8b3f0faa2029b4cc0ab73b7ad7e4134c4e`.
- evidence/apex_adjacent_internal_controls.json: `1f2c6d0862420b6f647618b4adc0b89e2f79c6031b65fdda28f1bf0198e37965`.

## A. Ordinary all-size confinement — PROVED_ORDINARY at the displayed scope

The hypotheses are triangle-supported and triangle-connected Q, single-edge resilience, defect one, minimum degree at least four, an adjacent blocker pair ab,ac, and a residual whose ENTIRE old triangle support is one exact C12 graph C. Arbitrary old background is retained. The finite reconstruction later additionally uses three-connectivity and cover eligibility. No classification of arbitrary resilient defect-one supports is presumed.

A vertex outside C and the three restored terminals occurs in no old triangle. It can occur in a new triangle only as the apex of an ordinary page, so every incident edge joins it to a,b,c. Triangle support then makes its degree at most three. This correctly excludes all such vertices using the stated minimum-degree assumption. Universality of C forbids hidden old edges among its vertices; each outside terminal's old C-neighbor set is independent. These statements concern actual graph triangles and preserve all permitted background.

Each restored base has an ordinary page: deleting the other base preserves nu(Q), whereas the residual loses one packing unit; the only available new triangles after that deletion are ordinary pages. If no restored terminal belongs to C, no new triangle shares a C edge, contradicting triangle connectivity.

When exactly one terminal belongs to C and it is a leaf, say b, all ordinary page apices lie in C. An ab-page has one C footprint; an ac-page is bare. Distinct apices give disjoint pages, which append over a maximum C packing avoiding the one footprint. Therefore both entire families have the same singleton apex. Every old edge at the outside center a must be in one of these pages; the two-new-edge triangle abc adds no old a-edge. Its old degree is one and its Q degree is three. This case is correctly excluded, including the possible old edge bc.

When exactly the common center a belongs to C, the two outside old neighbor sets B,T are independent subsets of N_C(a), each of size at least two. If bc is old, they are disjoint; if bc is absent, both have size at least three. For the ten fresh-edge models, any distinct nonadjacent cross-pair permits a maximum packing avoiding the independent two-spoke star, so its two pages append and contradict the gain-one profile. Thus all distinct cross-pairs are adjacent. An intersection would contradict independence and the size-two lower bound, so B,T are disjoint and complete to each other. Two vertices from each then induce C4, which none of these exact models contains. This invocation of independent-star avoidance uses independent endpoints in the actual old graph, as required.

The remaining named cases are handled correctly. In K5-e, a peripheral center has a clique neighborhood, while a universal center has only the one independent pair. In W5 with a rim center, there is likewise only one independent pair. The latter possibilities force B=T, and degree four forces bc, producing an old triangle outside C. For W5 with its hub as center, B,T are disjoint independent rim pairs and bc is old. Every actual triangle has the common hub; the seven-vertex link is exactly the rim C5 plus b,c and their described edges. Choosing b and two nonadjacent rim vertices outside B gives an independent set of size three in that link, so its four-vertex complement supplies FOUR actual hub spokes covering every Q triangle. Required nu(Q)=3 and defect one would demand tau(Q)=5. This is a valid explicit cover argument using common-apex semantics, with no matching-only claim about arbitrary cones.

Thus at least two restored terminals lie in C and there is at most one support vertex outside C. No ordinary case is omitted.

## B. Zero outside and one outside leaf — independently accepted domain arguments

With all restored terminals inside C, universality makes the entire graph C plus its two restored internal nonedges. Saturation/eligibility and resilience make each individual internal insertion defect two. The existing independently verified 210 table covers ALL internal nonedges of ALL twelve exact supports; it was not first filtered by K4-completion. Its only four defect-two insertions occur in the double-K4 seed, at24,25,34,35. There are exactly four unordered adjacent pairs among these four edges.

The replay regenerates that four-pair domain from the accepted210 rows, checks each actual graph and complete actual triangle list, validates its cover and packing witnesses, and independently verifies its minimum degree is three. Each cover/packing pair proves defect at least two. These facts already reject every zero-outside case; this review does not require independent proof of the author's stronger exact optimum metadata for those four controls.

If the lone outside terminal is a leaf c, deleting ac leaves exactly the triangle family C+ab. The old neighbor set of c is independent and excludes a, so insertion ab cannot make a triangle through c. Eligibility and resilience again yield defect two in that internal insertion, forcing C to be the double-K4 seed. The checker exhaustively confirms this seed has no independent triple. Thus c has at most two old neighbors and its one restored edge, contradicting degree four. This fully treats both symmetric outside-leaf positions. The application of the 210 table is licensed by this new explicit confinement, not by silently importing predecessor K4-completion.

## C. Independent complete outside-center domain — VERIFIED_FINITE

The fresh script scripts/matching26_adjacent_replay.py generates the domain in the opposite order from the author: it enumerates every independent old neighbor set I of size two or three, then every restored endpoint pair outside I, and records A=I union{b,c}. It uses the exact frozen C12 definitions directly. Exhaustively ruling out independent four-sets in each model proves alpha(C)<=3, so no larger old neighbor set is omitted. Degree four forces |I|>=2. Therefore this is the complete all-size-confined center domain.

Merging pair choices with the same A is sound: the actual Q graph is precisely C plus one new vertex adjacent to A, independent of which valid pair is regarded as restored. Every valid pair leaves an independent old remainder and exactly the same old C triangle support.

Independent counts agree exactly:

- 5613 size-four/five neighborhoods considered combinatorially;
- 4289 neighborhoods have an independent remainder, with 12605 restored-pair presentations;
- 2310 rejected for an explicitly checked degree below four;
- 1048 rejected for an explicitly checked unsupported new edge;
- 588 rejected by an explicitly checked separator of at most two vertices;
- 343 structurally retained.

Every recorded domain key is generated independently and no independent key is absent. Every restored-pair witness and pair-presentation count is checked. For low-degree certificates the actual graph degree is recomputed. A new apex edge av is triangular exactly when v is nonisolated in C[A], so the support rejection is exact. For separator certificates the checker verifies a nonempty partition of the remaining vertices, no crossing edge, and the recorded component; retained graphs are independently tested under EVERY deletion of zero, one or two vertices. All retained actual triangles are rebuilt and all edges are confirmed supported. Their triangle family is connected because each new apex triangle shares its old base edge with C.

## D. Independent finite witness replay — COMPLETE EXCLUSION

The 343 exact-result rows match the independently retained domain bijectively. No UNKNOWN or omitted result remains. The checker independently re-establishes each base packing number r from a valid old packing and a literal upper bound: the fresh models' triangles partition into their listed K4/K5 pieces; W5 has only five hub spokes, with two used per triangle; K5-e cannot pack three triangles because that would use all nine edges despite odd vertex degrees. No general optimizer is needed for these bounds.

All 1092 old matching-table packing witnesses are checked as actual edge-disjoint triangles avoiding the designated matching. Their matching-pair domain is also regenerated completely. For the 306 packing rejections, the selected matching lies in C[A], its verified old packing has exactly r triangles and avoids it, and the two corresponding new apex triangles append disjointly. The resulting explicit r+2 packing contradicts the required blocker value r+1.

For each of the 37 cover rejections, the checker reconstructs EVERY actual Q triangle, verifies that the recorded cover consists of actual graph edges and hits all those triangles, and validates the separate edge-disjoint packing. Writing U for the cover size and L for that packing size, every row satisfies U<=2L-2. Therefore tau(Q)<=U and nu(Q)>=L imply delta(Q)>=2. These bounds resolve all 37 cases independently; no cover optimality assertion is used. There is no unresolved exact-cover survivor.

The r-1 old matching rows and the author's exact cover optima were not independently re-optimized, because they are unnecessary for any exclusion. The accepted conclusion is the COMPLETE rejection of the required interface, not a new attestation of every stronger optimum field in the author output.

## Evidence, preservation and final scope

Independent checker: scripts/matching26_adjacent_replay.py, SHA-256 `04af96abb1cb0bf0125db53dcaad19faebd40e7fe2e41b382af010c3f99b20d5`.
Independent receipt: evidence/matching26_adjacent_replay.json, SHA-256 `8d641c4c0e0eeeadbad7d533bdef13736e651b0dd306a0c6155eb04c5f5d2f13`.
The final serial run took 0.2700956249900628 seconds locally under the pinned Mac Python environment. No optimizer import, installation, remote computation, timeout or lingering process occurred. All reviewed source hashes were unchanged during replay. The ordinary all-size proof review is distinct from this finite receipt.

Combined with its explicit premises, the adjacent named-support reconstruction interface is excluded. Applying it to minimum Q still requires the separately justified residual resilience, elimination of old tight pieces, minimum degree four, three-connectivity and saturation. This review does not derive those premises or use the resulting blocker exclusion to prove them. The no-blocker core and unrestricted Tuza remain separate OPEN obligations. No new substantial hypothesis was started during this review.
