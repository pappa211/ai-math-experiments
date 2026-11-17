> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every connected unicyclic link remainder is excluded

Frozen assembly, 2026-11-16. Status: PROOF_USING_FINITE_CERTIFICATES, pending fresh review of this assembly. The ordinary reductions are separately reviewed; the new fixed374-state interface has an independent complete-domain and literal-certificate validation. No all-size Lean claim is made.

## Theorem and exact minimality scope

Let G be a failure of combined CS with the fewest edges, either globally or within an edge-subgraph-hereditary class. Discard isolated vertices. Let L be a nonempty closed connected component of the actual link at a vertex h. Then there is NO vertex w of L such that F=L-w is connected unicyclic.

Only proper edge subgraphs satisfy CS. Authenticated class-local minimality supplies tau(G)=2k, k=nu(G), actual-edge codegree at least two, and closed-link robustness. All triangles and all outside attachments are retained. This theorem does not assert that arbitrary WKE links are reducible, or that disconnected pseudoforest remainders satisfy the same conclusion.

## 1. Ordinary reduction to a fixed finite interface

If F is triangle-free, the accepted ordinary `apex_unicyclic_triangle_free_remainder_ordinary_v2.md` excludes it. That proof uses simultaneous prescribed residual covers, the elementary unicyclic matching-complement and exposed-original-leaf lemmas, and the complete ordinary apex-cycle argument. It has no GE or Kotzig premise.

If F has a perfect matching, the accepted ordinary `apex_unicyclic_perfect_full_exclusion_v1.md` excludes it. This includes triangular cycles with every possible attached tree morphology. Bare cycles are already excluded by `apex_cycle_link_exclusion_full_v2.md`, whose corrected parity proof explicitly uses the pinned ordinary TUZA-15 five-wheel closed-component argument for its one small exception.

Thus F has a triangular unique cycle abc, attached trees, and no perfect matching. Write r=nu_match(F). The elementary leaf-exposure lemma supplies a maximum matching M exposing an ORIGINAL F leaf z. Minimum link degree two forces wz. The pseudoforest complement lemma gives a cover Q0 of F-M with |Q0|<=r. Therefore

    P=M union {wz}, Q=Q0 union {w}, |P|=r+1>=|Q|

is an actual WKE tuple. For S={w,a}, L-S is triangle-free and the outside-S mates Z of S in P have |Z|<=2. The general simultaneous-cover theorem forces |P|<=|S|+|Z|<=4. Hence r<=3.

Every original F leaf is adjacent to w. If one F vertex had two original leaf neighbors, the two resulting length-two paths to w would be nondirect parallel threads, excluded by the accepted ordinary parallel-thread theorem. Therefore F has no vertex with two original leaf neighbors.

The independently reviewed rooted-tree classification in `triangular_unicyclic_small_remainder_classification_v1.md` now gives EXACTLY twelve possible F shapes: two of order5, eight of order7, and two of order8. Its formula r=sum p_i+g(h), with g(0),g(1),g(2),g(3)=1,2,2,3, and its complete p_i<=2 attachment classification prove this domain ordinarily. The two order8 shapes also have separate ordinary exclusions, but are deliberately INCLUDED in the finite interface.

For each shape, enumerate EVERY possible N_L(w) containing all original F leaves and of size at least two. There is no further filter or apex symmetry quotient. This is exactly374 labelled shape/neighborhood records. The root's independently authored AHU rooted-tree generator reconstructed all qualifying shapes through order9 and obtained a graph-isomorphism bijection to the twelve ordinary shapes; it independently regenerated every one of the374 neighborhoods. The all-size bound comes from the ordinary classification, not merely the AHU count.

## 2. Balanced deletion and actual outside-triangle accounting

For an actual matching P in L and a vertex cover Q of R=L-P with |Q|<=|P|=s, delete all h-spokes to vertices of L and the rim edges P, obtaining K. The s hub triangles on P show nu(K)<=k-s. Every lost non-hub triangle contains an edge of P and is covered by P. Every lost hub triangle has its rim in P or meets Q. Thus any K cover extends by

    P union {hq:q in Q}.

No hub triangle crosses different link components. This audits every actual lost triangle, including all pages on P with outside apices. Proper-subgraph CS and tau(G)=2k force |Q|=s, nu(K)=k-s, tau(K)=2nu(K), and B(K), unless the tuple is already strict. Hence each nonempty actual triangle component of K has literal K4/K5 support.

For each old block B, its vertex intersection C with L is a clique in R: every pair of those vertices is an actual surviving edge. Conversely the selected triangles wholly on L and h contribute to B exactly their surviving rim edges in C. A maximum K4/K5 packing can avoid any single edge or any two incident edges; a minimum block cover can contain any prescribed single edge. These elementary block properties are used on the WHOLE selected footprint, not independently on individual triangles.

## 3. Six certificate types and their all-attachment proofs

Every finite certificate except BRANCH_AT_MOST_3 supplies literal P,Q as above. The validator reconstructs all actual edges and triangles; no optimizer output or producer status is a proof premise.

1. **STRICT:** |Q|<|P|. Section2 gives tau(G)<=2k-1.
2. **S_COLLAPSE:** a supplied S with L-S triangle-free, and the exact outside-S mates Z of S in P, satisfy |P|>|S|+|Z|. The accepted general simultaneous-cover theorem applies: all surviving (L-S) edges off Z are supported in K; every old block contains at most one such edge, allowing them all to be selected in one minimum K cover. The rest of R is covered by S union Z, producing a strict total cover.
3. **B_INCOMPATIBLE:** an actual shared-edge-connected triangle component of R has support other than a complete K_t, 3<=t<=5. All its triangles lie in one old block B. Since B intersection L is a complete clique C, every C triangle lies in the same R component, so that component must be exactly K_C. The literal certificate contradicts this.
4. **RIM:** an actual L triangle T meets P, and an actual L-E(T) matching Z has size at least s. Let A=(Z union E(T)) intersect E(R). For EVERY clique C of R of sizes2 through5, require A intersect E(C) to have at most two edges and, if two, to share an endpoint. The selected hub triangles on Z and rim T are pairwise edge-disjoint. Every old-block footprint is exactly the tested A restriction, so a maximum packing in every old block avoids the entire footprint. Appending at least s+1 triangles contradicts nu(K)=k-s. This proof permits K4-containing links and arbitrary outside attachments.
5. **EXTERNAL_CLIQUE_STAR:** f=ab in P lies in no actual L triangle; Z is an actual L matching, |Z|>=s, avoiding f. For EVERY clique C of R, sizes2 through5, at most one Z edge lies inside C; if C contains a or b, that edge is incident with the contained endpoint. Codegree supplies a page abx other than hab. Its apex is outside N(h): an apex in another link component would be joined to L, and an apex in L would form a forbidden L triangle on f. The page contributes at most one spoke to each old block because ab was deleted. The clique condition makes that spoke plus all selected hub-triangle rims a star of size at most two in every block. Avoid all these whole footprints and append |Z|+1 triangles. This is the separately frozen ordinary v3 clique-footprint rule.
6. **ORDINARY_BRANCH_AT_MOST_3:** the actual L degrees have at most three vertices of degree at least three. Invoke the accepted ordinary `three_branch_cs_link_exclusion_v1.md`. This is a theorem reference with a checked literal premise. It imports neither the four-branch363-state bridge nor a WKE-only census.

Thus each accepted certificate excludes its exact literal L with arbitrarily many outside vertices and pages. No outside graph is enumerated.

## 4. Complete finite evidence and independent checks

The v2 producer certified all374 records, with zero UNKNOWN:

| type | count |
|---|---:|
|ORDINARY_BRANCH_AT_MOST_3|66|
|S_COLLAPSE|145|
|B_INCOMPATIBLE|15|
|STRICT|121|
|EXTERNAL_CLIQUE_STAR|23|
|RIM|4|

The bounded producer finished in0.241884 monitored seconds, peak sampled process-tree RSS19.375MiB, below the60-second/2200MiB limits. A separately authored coordinator validator imported no producer and independently checked the exact AHU-domain bijection, all literal matching and cover premises, all actual triangle/transversal premises, complete bad triangle components, and EVERY residual clique needed by both augmentation rules. Its status is INDEPENDENTLY_VALIDATED,374 records,0UNKNOWN. Five negative controls were rejected: duplicate matching edge, false empty cover, false rim triangle, omitted domain record, and false external base. The monitored validator finished in0.244 seconds at40.27MiB.

The original v1 run is retained unchanged: its restricted vocabulary stopped after four records at UNKNOWN on the three-sun, an already accepted ordinary three-branch link. The revised vocabulary was authorized on the SAME374 domain, adding that ordinary theorem reference and the separately proved external-page clique rule. The v1 UNKNOWN is not relabeled as a passing result or a mathematical counterexample.

The ordinary reductions and all six certificate semantics, together with this independently validated fixed finite completion, prove the stated all-size theorem. The label remains PROOF_USING_FINITE_CERTIFICATES; this is not unrestricted CS, an all-size Lean proof, or an ordinary proof without finite premises.

## 5. Exact consequence for covers with at most one selected cycle

In a class-minimum CS failure admitting any triangle edge cover C of total selected cycle rank at most one, C cannot be a forest by the accepted forest-cover CS theorem. It therefore has exactly one selected cycle. If C has a selected leaf v with sole selected neighbor w, the accepted `link_excess_and_one_cycle_leaf_v1.md` shows the WHOLE link at v is connected and its deletion of w is connected unicyclic. The theorem contradicts this. Thus C has no selected leaves.

The accepted isolate-corrected `one_cycle_cover_structural_restrictions_v2.md` also shows that every nonisolated G vertex has positive selected degree. With isolates discarded, a graph of total cycle rank one having no leaves and positive selected degree everywhere is a single spanning cycle: any other nontrivial component would be a finite tree and have a leaf. Hence every such C is a HAMILTONIAN CYCLE of G.

This is a necessary structure for a remaining equality obstruction, not a proof of CS for the Hamiltonian-cycle-cover class. The separately proved Tuza inequality for every one-cycle cover remains valid. No global existence of such a cover is inferred.

## Frozen direct dependencies and evidence

- `notes/apex_unicyclic_triangle_free_remainder_ordinary_v2.md`: 3ea922cdab26e291196dd7537b46e7eb20dc872fca604532c11cf8372b93951d
- `notes/apex_unicyclic_perfect_full_exclusion_v1.md`: 780fde16ec90aefe4a6f22b5aaac942b011a93c19b756c27a7fab61fba699d73
- `notes/apex_unicyclic_wke_v1.md`: d0fb7564463def15f0f77f9713aabfcfcb0437764cf1b9e19bf2dc8f848d968e; only its ordinary matching lemmas are used.
- `notes/apex_cycle_link_exclusion_full_v2.md`: 558a0d1f99c1672328aee8c1dd7a38d2c3dc9677233e561f0c90521a428815b7
- `notes/coordinator_triangle_deletion_set_WKE_collapse_v1.md`: 7c5e3ef8b7027f1d19e2de67a2edafe337c48fcb7883cf84539df27ff08a4f6c
- `notes/parallel_thread_link_exclusion_v1.md`: 6eec22bff2400c5a3c07a43d41649a7b8e0d6e08f31d23c8e6e020c6f82718c4
- `notes/triangular_unicyclic_small_remainder_classification_v1.md`: c9b339a1ea4eb34e549a8a2786bad43685533afc85a8f7ec34fc3209e9871d53
- `notes/three_branch_cs_link_exclusion_v1.md`: dd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4
- `notes/external_page_clique_footprint_certificate_v3.md`: 556b9e18f700c80736f05f5cf62e9c5c044a3269df29b9af17cb1a19bbd80088
- `scripts/triangular_unicyclic_cs_interface_v2.py`: 5571aac51d187e1abf7c8ae70114e30184ac27d7935ab94dcf1f1f2c11fe995b
- `evidence/triangular_unicyclic_cs_interface_v2.json`: 12e188e2be5cdedfca7059fadfd95854620acc6abf3040e1cd3693ab4d82b758
- `operations/triangular_unicyclic_cs_interface_v2.json`: 59e2f68e6254ba0a3f3ae674b4b4933fc0f92a4a96e6f7c5041845429365319e
- `scripts/coordinator_triangular_unicyclic_validator.py`: 75ae104cae9a806f39a85dd651e32139c9dd274806fd93290281fbbd9535c270
- `evidence/coordinator_triangular_unicyclic_validation.json`: f577b5d5af791146d8a0807e67163b494f0564f6599e1350b687124ff43050a2
- `operations/coordinator_triangular_unicyclic_validation.json`: 0b5fb09443f6d9f81612fa2679782c18ee130fb91ac4091f32f6674f18fdbe09
- `notes/link_excess_and_one_cycle_leaf_v1.md`: 46d361c2beabf6459cf97be797f65dfa90df419959173c844af24552c11b393b
- `notes/one_cycle_cover_structural_restrictions_v2.md`: 7babfa30ce8a867763d4e28db8a5a1a0a3042dde7774629d8e5570169c1c5a20

Transitive ordinary arguments and their fresh-review paths are recorded in these frozen notes. The pinned historical five-wheel passage is `sources/public/papers/tuza-five-degenerate/main.md` section5.3, SHA6f89ec20ce3d954a5912cd19e5e2156fbcab87460bdc6eeb4d09b9bcdc55d59f. Gallai-Edmonds, Kotzig, and the four-branch363/historical5375 finite bridges are not premises of this assembly. The earlier accepted GE-dependent proof remains preserved under its original dependency label.
