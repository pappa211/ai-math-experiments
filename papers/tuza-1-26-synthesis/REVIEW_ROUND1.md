# Independent synthesis criticism, round 1 — 17 November 2026

This is an independent internal AI mathematical and attribution review. It is not external human peer review, a fresh Lean run, a finite-certificate replay, or a blanket re-proof of every archived result. TUZA-27 was not consulted. Source and candidate files were not edited. The material reviewed is an editorial intermediate; the final assembled manuscript and PDF require a separate frozen review.

## Disposition

**Not yet ready for a proof-complete publication claim.** The central distinctions in the supplied late exposition are substantially better than the historical ambiguity: actual-parent residuals are separated from the independently minimized Q; R12 is separated from R-F; all-size forest theorems are separated from finite interfaces. I found no contradiction in the elementary proofs and quantitative transformations specifically checked below. There are concrete notation, hypothesis and reference defects to fix, and the large late proof appendix was not yet present when this review was performed. Thus I cannot certify dependency closure for the final Q and actual-parent chains from these drafts alone.

## Required corrections

1. **Unify the sign convention before combining text.** Early §§1–10 and its ledger define `s=2ν−τ`, `d=τ−2ν`; late exposition defines `d=2ν−τ`, including (D), (Q1), (Q2), the separator formulas and every “defect one” statement. This is not a harmless common symbol if merged. Recommended convention: main paper uses slack `s=2ν−τ`, violation defect `d=τ−2ν`; rewrite late formulas and named positive-slack classes accordingly. In particular the early reduction `d(G)≤d(R)` becomes `s(G)≥s(R)` under a slack convention. Globally replacing the letter without auditing inequalities is unsafe. Local quantities such as matching deficiency or packing loss need separately declared names.

2. **State the missing closed-boundary ambient hypothesis.** Early §3 begins with independent U,P and a common-neighbor condition, then calls K=H−A “tight” and selects K4-block packings. Tightness alone does not supply K4 blocks. The intended theorem is in the tripartite edge-triangle setting; explicitly assume D(H) tripartite in the main statement (as Appendix B.R.11 does), or state the stronger literal K4-support premise actually needed. This is especially important after thematically moving the lemma away from its restoration context.

3. **Repair eight broken equation links in the curated early appendix.** There are 64 explicit anchors and 29 internal Markdown links; eight links have no matching explicit anchor. The unresolved targets are `eq-saving` twice, `eq-restore` twice, and `eq-large`, `eq-delta`, `eq-small-partition`, `eq-key` once each. Their existing targets have the `b-r-` prefix. No duplicate explicit anchor was found in that file. Repeat this audit on the final entire paper rather than assuming this local count remains current.

4. **Restore external source numbering.** Appendix B.R.14 says “These are Liu–Zeng’s equations (B.R.7)–(B.R.13)”. Those are external source equations and should remain `(7)–(13)`, with the exact Liu–Zeng version citation. This is an actual renumbering error, not a stylistic preference. Other attributed equation/theorem references need protection from a global numbering replacement.

5. **Complete global cross-references, not only module names.** Early main §§2–10 refer to “module R/D/C/S/P/W/Q/B”, while the curated appendix labels are B.R, B.D, etc. Some legacy references such as “Lemma 2A” remain inside B.D despite its global label B.D.2A. The source-local convention in the appendix preface makes some such references decipherable, but does not satisfy the requested integrated paper. Replace them with exact final theorem/section labels. Early §6 also uses t, r and n0 in the switching bound before defining them in the main text; either supply their definitions there or state the theorem directly with its appendix reference and a complete interface.

6. **Fix the pointed forest lemma’s typesetting.** The displayed (P) in the late exposition contains `|Q|≤|M|,qquad` rather than `|Q|≤|M|,\qquad`. This will visibly corrupt the mathematical display.

7. **Do not infer full late dependency closure from the thematic sketches.** The R3 five-shape proof, six-edge restoration, named-support strict restoration, core blocker/triangle residual reconstructions, degree-four cases and actual-parent resilience/extension contain explicit references to a forthcoming appendix. The thematic summaries are not their complete proofs. The selected 87-source plan identifies these obligations well; acceptance requires checking the assembled mathematical appendix, its finite-domain predicates and its actual references. Retain the strengthened R3 numerical premise `ν=m+1, τ≥2m+2`; an equality-only shape argument does not prove the inequality branch.

8. **Resolve the four-branch replacement deliberately.** Early §8 says the current synthesis “should use TUZA22’s later nonenumerative proof if it is indeed the accepted final replacement”, which is editorial uncertainty, not publishable theorem text. The late appendix plan confirms this ordinary replacement is separate from the selected forest/core chain. If the paper states the four-branch theorem, include that final ordinary proof and its prerequisites or explicitly retain the historical finite-certificate proof with its exact status. The historical appendix B.W does supply a coherent all-size reduction to 5375 finite witnesses, but those finite witnesses alone are not the unbounded theorem.

## Targeted mathematical checks performed

### Early restoration, criticality and boundary descent

I checked the main elementary interfaces: graphical loose-cycle-to-K4 conversion; equality exhaustion by augmentation; one-triangle restoration with a single compatible packing avoiding the independent terminal triple; the intersecting triangle lemma; inequality-critical deletion and packing resilience; and combined-minimal balanced accounting. The distinction between checking a footprint triangle-by-triangle and checking the union of all appended footprints is preserved. No global maximum-packing extension for prescribed triples follows from the inequality-critical two-triangle result.

I traced the TUZA04 all-six-active argument in B.R4.2 against B.R.11.3. The contradiction uses the unconditional *numerical* four-spoke conclusion, not the activity-qualified descendant stability conclusion. If ap is inactive, first delete the cover-preserving row bp,bq, then ap (no triangle loss), then cq (cover loss at most one), contradicting the exact two-unit loss for A={ap,bp,bq,cq}. This removes the old five-active premise inside the exact seven-new-triangle, actual-cover-gain-three interface. The subsequent all-descendants stability uses disjoint lost-family rows. It still proves no iterative preservation of the expensive restored family.

### Density and normalization

I checked the arithmetic and quantifiers in B.R.14, particularly the changed intermediate estimate and the small-packing endpoint. The constant part of (B.R.26) is below one, the bound comparing (B.R.32) with `e(G')≥n²/4−cn−k+k'` gives (B.R.33), and `s≥5` is excluded only using positive `5/2−c`. The statement correctly has a threshold depending on fixed c and includes no claim at c=5/2. The quoted numerical threshold also depends on an unspecified deep fractional-approximation threshold; it is not wholly effective from the displayed constants alone. The large-packing step imports Liu–Zeng’s threshold argument and Lemma 2.4 explicitly; it should continue to be labelled an adaptation rather than their theorem at c<5/2.

I checked the digit-sphere incidence construction in B.Q: no carries, weighted-average rigidity, linearity, absence of Berge triangles, exact ownership of every graph triangle, and the order bounds N/r≤|V(H)|≤N. These give exact integral additivity. The power-saving and exp(−log^a n), a>1/2, consequences use the seed fixed before the ambient parameter tends to infinity. Arbitrary o(n²) cannot replace the stated error rates. The join loss and batched loss are O(Nq), so the stated power and almost-linear scales have the correct asymptotic comparison. The exact local/global covers and the three link types in B.B retain their required hypotheses. I found no lost sign in these early defect calculations under the early convention.

### Forest and graph-model proofs

I read the complete late main forest-anchor construction, including the pointed matching-cover lemma and the induction that covers outside rim pages. Its packing is existential, need not be maximum, and is not a prescribed maximum packing; the stated quantifiers preserve that distinction. I also read the two forest-link equality branches. They explicitly use the class-local codegree and robustness inputs; those inputs are proved in the early B.D material and must be linked in the final paper. This check does not substitute for review of every corresponding Lean declaration.

I checked the three supplementary proofs in `late_graph_and_dual_proofs.md`: the twelve literal model parameter/resilience calculations; the connected-subtree rerooting argument for independent-star avoidance in fresh **edge** sums; and the exact-codegree-two dual argument. The cubic matching estimate follows from `3q+r≤3s`, `n≥s+q+5r`, hence `n−8(q+r−s)≥0`. The small even orders are separately handled. The conclusion is that a slack-one Q has some edge of codegree at least three, not that it has a codegree-two edge. Fresh-edge star avoidance is correctly not claimed for arbitrary broader clique overlaps.

### Residual quantifiers and rigidity

The supplied late exposition correctly defines its second minimum Q inside proper subgraphs of one fixed minimum-CS parent. Proper CS classifies only zero-slack supports; naming a smaller slack-one support uses that second minimum. The actual double residual R=G−T−U is not silently given Q’s connectivity, degree or minimality profile. The selected-support lemma is a direct finite maximization argument, and its second application uses only the selected pair’s full-cover response in the slack-two branch. Neither a failed triple nor a successful final operation is asserted to exist.

The R12⇒CS⇒Tuza implication is conditional on the named strict-restoration and actual-single-residual extraction proofs. The distinct broad R-F is not asserted sufficient. No Tuza⇔CS or Tuza⇔rigidity converse is introduced. This is the right logical scope, but the large restoration dependencies still need the final appendix review noted above.

## Independent primary-source attribution checks

These web checks confirm source identity and relevant scopes, not full independent reproving of the external papers.

- Puleo’s v3 header is 13 April 2015; its maximum-average-degree-below-seven inequality is already published predecessor work. The synthesis correctly treats equality restoration as an additional project obligation. Do not use the HTML body’s generated 2026 date as the version date. [Puleo v3](https://arxiv.org/html/1308.2211v3).
- Liu–Zeng v1 proves the fixed c<2 density result and states the equivalence using **every** fixed c≥0. Its source cannot be cited as itself establishing c<5/2. [Liu–Zeng v1](https://arxiv.org/html/2610.15539v1).
- Haxell–Kostochka–Thomassé’s 21 April 2011 manuscript Theorem 2 is K4-free and flat, without planarity. Its preceding Theorem 1 is planar. The manuscript also supplies a triangle-dual antecedent; the new B-dual reconstruction should not imply that this dual viewpoint originated here. [HKT manuscript](https://www.kostochk.web.illinois.edu/docs/accepted/plan-ht.pdf).
- Tsujimura v2 is dated 10 November 2026 and explicitly uses a survivor subgraph R⊆G[K] with signed-defect monotonicity. Its restricted overlap/core result must not be credited as the unrestricted four-branch theorem or the unrestricted heavy five-core localization. [Tsujimura v2](https://arxiv.org/html/2611.11128v2).

The supplied early attribution review separately records other primary checks (HNS, EFR, Yuster, BFG, Parker, Füredi). I read those records but did not repeat every external source retrieval. In particular I did not freshly access or replay the Liu packing-number-four package; its version-specific inherited dependency and auditor’s correction must remain labelled accordingly. No historical novelty certification is made.

## Reviewed snapshot

SHA-256 values at this review:

| File in reviews/ | SHA-256 |
|---|---|
| early_proof_exposition.md | c25a5423c470237e605246eebb3c231fd72a01e0d0070865690227962527024e |
| early_proof_appendices.md | d3d8e1b45c07ff61d91ade5299a2d68d395ae1b8f632388826400c5235a4e02e |
| early_claim_ledger.json | 071e131a2c71d24762157f3c276758a5c5e7ff5b9b7795f28f78ffa3413c1c12 |
| early_attribution_review.md | b2a10351a8c58575a2ef5689eb5485a03ba272dc62a22217485de983d8a2e977 |
| late_proof_exposition.md | fb90b0912907d4a9c968281e402709ae0d739500b0ed619c7c5b71989707e50f |
| late_graph_and_dual_proofs.md | eb750d1caea537beefcab5456109f87a4aa7ba02209958cdca7551b0ea834756 |

The final pass should bind the assembled source/PDF and ledger, verify all paper references/citations after renumbering, and inspect the long case and finite-interface integration. This review deliberately makes no acceptance claim about an unreviewed future assembly.

## Authorized draft corrections after the review

The coordinator subsequently authorized the critic to apply small corrections directly to reviewer drafts. I applied the following; canonical archive source and candidate files remain untouched:

- Added `D(H) is tripartite` to the early §3 closed-boundary interface (item 2).
- Repaired all eight early appendix equation links and independently rechecked that no Markdown link is missing its explicit anchor in that file (item 3).
- Restored Liu–Zeng's external equation numbers `(7)–(13)` and changed the local compatibility reference to `Lemma B.D.2A` (item 4 and one instance of item 5).
- Corrected the pointed forest `\qquad` command (item 6).
- Converted the late exposition and graph supplement's positive defect terminology to slack, and every graph slack formula to `s`. Added the explicit translation `d(G)=τ(G)−2ν(G)=−s(G)` for the early normalization convention. The unrelated forest matching deficiency is now `δ_F=n−2r`, so it is not confused with either graph quantity. No inequality direction changed. A search confirms the only `d(...)` graph call left in the late exposition is that explicit translation. The late appendix author was notified to use the same convention.

The remaining item-5 global integration work, item-7 full dependency review and item-8 four-branch resolution are still outstanding. These edits do not constitute acceptance of the future assembled paper.

Post-correction SHA-256:

| File in reviews/ | SHA-256 |
|---|---|
| early_proof_exposition.md | 8208bbf1615f835236b9f9e42983f38f92511b20d5a43a733096ad000c05b9ee |
| early_proof_appendices.md | dd247447bea7b580c597137cfd883dcb1dd8859b4d6caaf3d0864bc4d62abb56 |
| late_proof_exposition.md | 9ea103771bacf5e57e9c10ffca531c8230bde52a8eae1f5482c3d65bd0917aa1 |
| late_graph_and_dual_proofs.md | f8355add968b021a6fb1642b1923d5fe26d5fad2d7e0801fa4bec9679e796e2e |

## Second authorized early editorial pass

At the coordinator's request I made the following additional edits to the early reviewer drafts only:

- Main §6 now defines the switching covers' size t, common remainder D, disjoint remainders X,Y of size r, all four oriented classes in J=H−D, and the neutral count n0 exactly as B.S.4 does. The contradictory B.S introductory sentence saying it uses q for that count was corrected to n0.
- Main proof-module references now name Appendix B.R/B.D/B.C/B.S/B.X/B.P/B.W/B.Q/B.B, with the degree-seven/eight references explicitly including B.M7 and B.M8. Main §9 also explicitly declares h=|V(H)| before using it in the join bound.
- Main §8 identifies TUZA22's accepted ordinary four-branch replacement, keeping the historical 5375-witness route separate. The late appendix author has confirmed inclusion of the ordinary closure; its exact final section label remains for assembly.
- Removed editorial §11 from the intended early main. The delimiter `# Complete source-backed mathematical case modules` remains, so the main text now consists of §§1–10 before that delimiter.
- Prefixed the unambiguous B.C.B1 references and its four elementary facts B.C.F1–F4; B.X.X1/X2; and the donor parts B.M7.B2/B4. The phrase “(2) says” in B.C's equality proof referred to its second listed input, not an equation, and now says that explicitly.
- The inherited B.M.U1/U2/U3 labels were reused for multiple distinct statements. They now include their containing section, e.g. B.M.1.U1, B.M.8.U1, B.M.11.U1, B.M.13.U1, B.M.12.U2 and B.M.17.U2. These were declarations without other cross-references to the old ambiguous labels. The complete set is B.M.1.U1, B.M.2.U2, B.M.3.U3, B.M.5.U4, B.M.8.U5, B.M.8.U1, B.M.11.U1, B.M.12.U2, B.M.13.U1, B.M.14.U3, B.M.17.U2.
- Local numbered equations in B.B and B.OD now have prefixes `(B.B.1)`–`(B.B.6)` and `(B.OD.1)`–`(B.OD.7)` throughout their own definitions and uses. The external Liu–Zeng, HNS, HKT, Yuster, Puleo, BFG and CKSU numerical references were not renumbered.

Remaining reference-integration items: the future late four-branch theorem needs its final B.L section number in early §8; B.M8's named cases I/II/IIa/IIb/III are readable locally but should be globally qualified if referenced from another appendix; source-note abbreviations R6/TWIN/THIN/DOM/BIP/THREE-SUN/SEP are defined in their B.M headings and should not be treated as theorem numbers; cross-file provenance/ledger mappings must reflect the newly unique B.M declarations. The scan found no other unqualified numerical Lemma/Theorem/Section reference that was clearly internal: the remaining ones are explicitly attributed external source numbering. No unresolved explicit Markdown anchor target remains in the early appendix.

New hashes after this pass:

- `early_proof_exposition.md`: `599886fa070fa2dbe83d5f6fe347a0f1ee8c2d460fee2cb7215ac5b0ebcd3427`.
- `early_proof_appendices.md`: `39985182768b7525c415278de0a5db93fb7e049356484a49cf3a2fc217fa8d2b`.
