> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Full apex-unicyclic exclusion: ordinary replacement proof

Frozen ordinary assembly v2, 2026-11-16. The earlier `apex_unicyclic_full_exclusion_v1.md` remains accepted as PROOF_USING_FINITE_CERTIFICATES and is preserved unchanged. This v2 uses a new paid-triangle cover theorem and a direct two-shape proof, so the374-record completion is NOT a premise. No GE, Kotzig, four-branch finite bridge or all-size Lean claim is imported.

## Theorem

Let G be a minimum failure of combined CS, globally or within an edge-subgraph-hereditary class, with isolates discarded. No closed link component L at h has a vertex w for which F=L-w is connected unicyclic.

## Ordinary proof

If F is triangle-free, apply the freshly accepted ordinary `apex_unicyclic_triangle_free_remainder_ordinary_v2.md`. It handles both perfect and nonperfect remainders by simultaneous prescribed residual covers and the elementary matching-complement/exposed-leaf lemmas. Its bare-even-cycle boundary uses the complete ordinary apex-cycle proof, including the authenticated pinned five-wheel local case.

If F has a perfect matching, apply the accepted ordinary `apex_unicyclic_perfect_full_exclusion_v1.md`. Thus the only remaining case has triangular unique cycle abc, no perfect matching and an attached tree; bare cycles were already excluded ordinarily.

Choose a maximum F matching M exposing an original leaf z, by the ordinary unicyclic leaf-exposure lemma. Minimum link degree two forces wz. The ordinary matching-complement cover lemma gives a vertex cover Q0 of F-M with |Q0|<=r=nu_match(F). Hence

    P=M union {wz}, Q=Q0 union {w}

is an actual WKE tuple of size r+1. The new general paid-triangle collapse states that for any S, with Z the outside-S mates of S in P,

    |P| <= |S|+|Z|+#actual triangles of L-S.

Set S={w}. There is exactly one triangle in F and exactly one outside mate of w. Consequently r+1<=3, so r<=2.

Two original F leaves cannot have the same parent: they would form two nondirect parallel length-two threads between that parent and w, excluded by the accepted ordinary parallel-thread theorem. The rooted-attachment formula, or its short matching-two specialization, then leaves exactly two F shapes:

- triangle abc with leaves x at a and y at b;
- triangle abc with path a-x-y.

The freshly reconstructed `triangular_unicyclic_matching_two_ordinary_v1.md` excludes both at EVERY permitted apex neighborhood. In the first shape, absence of wc gives at most three branch vertices; with wc present, a missing wa/wb gives a one-vertex triangle deletion and a size-three WKE collapse, while all three apex-cycle neighbors leave a residual diamond. In the second shape, at most one apex neighbor among b,c,x gives at most three branches; otherwise one of two explicit size-three tuples has an internally matched two-vertex triangle deletion set. These are symbolic exhaustive cases with their actual matching and cover lists written in the proof, not a computed passing table.

All cases are excluded, proving the theorem. The ordinary paid-triangle proof explicitly covers every actual lost triangle and every old clique block, including arbitrary outside vertices and pages.

## Consequence for selected cycle rank one

The exact consequence from the accepted finite predecessor remains unchanged. In a class-minimum CS failure admitting ANY triangle edge cover C of total selected cycle rank at most one, C cannot be a forest. If it had a selected leaf v with parent w, the accepted link-excess/leaf theorem would give the whole link at v connected with a connected unicyclic remainder after deleting w, contradicting the theorem above. Thus C has no leaves.

The isolate-corrected one-cycle structural theorem also gives positive selected degree at every nonisolated vertex. After isolates are discarded, a selected graph of cycle rank one with positive degree everywhere and no leaves is a single Hamiltonian cycle. Hence EVERY such C is a Hamiltonian cycle. This remains a necessary condition, not a proof of CS for the Hamiltonian-cycle-cover class. The already proved one-cycle-cover Tuza inequality and the unresolved unrestricted targets retain their scopes.

## Direct dependency pins and evidence distinction

- Paid-triangle theorem `notes/wke_residual_triangle_count_collapse_v1.md`, SHA8143c49ad20f0dc7ef5d9d585be5d759b346be2ff1cf9b31ffab3e6f1cc57865.
- Two-shape ordinary proof `notes/triangular_unicyclic_matching_two_ordinary_v1.md`, SHA084ca3822c32b8c9442090a9177b2a73a1cec85db54eda8af6dd965c3aaa3074.
- Ordinary TF remainder `notes/apex_unicyclic_triangle_free_remainder_ordinary_v2.md`, SHA3ea922cdab26e291196dd7537b46e7eb20dc872fca604532c11cf8372b93951d.
- Perfect remainder `notes/apex_unicyclic_perfect_full_exclusion_v1.md`, SHA780fde16ec90aefe4a6f22b5aaac942b011a93c19b756c27a7fab61fba699d73.
- Ordinary matching lemmas in `notes/apex_unicyclic_wke_v1.md`, SHAd0fb7564463def15f0f77f9713aabfcfcb0437764cf1b9e19bf2dc8f848d968e; the older Kotzig-dependent corollary is not used.
- Apex-cycle assembly `notes/apex_cycle_link_exclusion_full_v2.md`, SHA558a0d1f99c1672328aee8c1dd7a38d2c3dc9677233e561f0c90521a428815b7; its pinned historical five-wheel source is `sources/public/papers/tuza-five-degenerate/main.md` section5.3, SHA6f89ec20ce3d954a5912cd19e5e2156fbcab87460bdc6eeb4d09b9bcdc55d59f.
- Ordinary parallel-thread exclusion `notes/parallel_thread_link_exclusion_v1.md`, SHA6eec22bff2400c5a3c07a43d41649a7b8e0d6e08f31d23c8e6e020c6f82718c4.
- Ordinary at-most-three-branch exclusion `notes/three_branch_cs_link_exclusion_v1.md`, SHAdd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4.
- Ordinary S-collapse `notes/coordinator_triangle_deletion_set_WKE_collapse_v1.md`, SHA7c5e3ef8b7027f1d19e2de67a2edafe337c48fcb7883cf84539df27ff08a4f6c.
- Leaf interface `notes/link_excess_and_one_cycle_leaf_v1.md`, SHA46d361c2beabf6459cf97be797f65dfa90df419959173c844af24552c11b393b.
- Isolate-corrected support theorem `notes/one_cycle_cover_structural_restrictions_v2.md`, SHA7babfa30ce8a867763d4e28db8a5a1a0a3042dde7774629d8e5570169c1c5a20.

The finite predecessor's producer,374 literal records, complete independent validator and five rejection controls remain authentic separately validated evidence. They helped discover the small cases, but no certificate file, optimization result, finite-state completeness count or new computation is a premise of this ordinary v2 proof.
