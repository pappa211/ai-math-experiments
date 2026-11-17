> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Focused primary-source comparison — TUZA-20

Read on 15 November 2026. This is an internal AI source review, not an exhaustive literature search or verification of whole papers. No new priority claim is supported. Source identities and access limitations are in `receipts/prior_art_sources.json`.

## CKSU: exact relevant scope

Chalermsook–Khuller–Sukprasert–Uniyal, [arXiv:2001.00257v2](https://arxiv.org/abs/2001.00257v2), revised 3 February 2021. Inspected the theorem/setup, Proposition 8 and its proof, Proposition 13, Definition 17/Lemma 18, chain construction, and Lemma 20 discussion (printed pp.3,6–8,11,16–21). Preserved PDF SHA256: `1ec683cf6d609daf53ee967d9f53a93a87c17286ae20a46191070c7ca5688897`.

Theorem 2 concerns multisets of multiplicity/order at least two; it does not establish an integral transversal. Section 2 fixes a maximum edge-disjoint packing of the full triangle family. Proposition 8 gives owner types 0,1,3 and the unique private K4 for type3. Definition 17 restricts lending to singleton-page type1 owners. Lemma 18 makes their recipient unique. The Section 4 chains begin at type3 owners and move half credits, including credits on edges outside packing support. Lemma 20 concerns half-integral coverage when type0 is absent. Its explanatory discussion explicitly recognizes shared nonpacked edges as a difficulty.

Thus these inspected statements do not supply the mission’s integral all-type-one cover or a budget-paying cycle repair. In an all-type-one input the displayed type3-rooted chain initialization has no root. No unrestricted integral theorem follows by replacing half credits with edge selections. This review does not certify the 69-page half-integral proof or the separate proceedings edition.

## The project correction remains necessary

The pinned project’s corrected endpoint classification, `problems/TUZA-19/notes/root_cksu_order3_repair.md`, appends the reciprocal two-page K5 case to the printed v2 Proposition 13. The separate primary-source audit and later dependency audit identify the precise failure and its limited consequences. The singleton premise in lending excludes the K5 pair; Lemma 18 is not refuted. The corrected order-three assignment is fractional, and the project’s separate integral bound is `3k−2m+2p`, with its original availability limitation. None of this supplies singleton-cycle or three-support rounding.

The present source pass read the corrected classification’s endpoint proof and its K5 witness. It did not rerun the historical scripts or broaden the previous later-dependency audit. The accepted project all-size integral bound is inherited evidence, not a TUZA-20 result.

## Haxell and a current primary-source continuation

P. E. Haxell, [Packing and covering triangles in graphs](https://doi.org/10.1016/S0012-365X(98)00183-6), Discrete Mathematics 195 (1999), 251–254. The publisher’s indexed abstract gives an unrestricted `(3−epsilon)nu` cover, with `epsilon>3/23`. Article, PDF and pdfft access returned 403, so the original proof body and numbering were not inspected in this run. No uninspected theorem from it is an indispensable input.

Sichen Wang, [A Bound Below 2.8 for Tuza’s Conjecture, arXiv:2609.13831v1](https://arxiv.org/html/2609.13831v1), 12 September 2026. Read Theorem 1, all three lemmas in Section 2, and Section 3’s four-cover construction. The paper states the unrestricted ratio `165/59` and attributes its book framework to Haxell. Its claimed Lean formalization was not inspected or replayed here; record the general bound as a current preprint claim, not mission-verified formal evidence.

Lemma 2.2 requires edge-disjoint book supports and maximality of **every** selection of one page per book. Its cover uses all edges of one-page books, larger-book spines, and opposite edges of two-page books. Lemma 2.3 requires the complete family of triangles having exactly one red edge in a colored graph, not an arbitrary subfamily. Its two bounds are `(8p−2u)/3` and `9p/4+3q/2−u/4`, where the second packing and private-red-edge parameter have specified residual-family meanings. The general construction allows edges outside original packing support. Neither its statement nor the inspected proof gives PK-all or the required all-type-one integral result.

Avoid repeating CKSU’s historical “Haxell is best known” remark as a current assertion. The 2026 source cites an additional Yi preprint; its proof was not independently inspected in this focused pass.

## Concrete comparison for the active mechanism

The book argument provides a useful prior-art template: prove a globally compatible family of interchangeable local packings, then use maximality against every crossing triangle. The original-support consequence in `notes/prior_art_book_interface.md` reconstructs this template for independent private pages of type1 owners. It is a scoped observation, not a new global advance. A candidate which assumes all private pages can be made independent already excludes K5 and must justify that availability assumption or account for its failure. The book construction itself can realize K5’s 3/1 split by recognizing that its opposite edge was already selected; this basic saving is not a new mechanism. A new globally paid lending result must additionally resolve those conflicts and the complete three-owner residual constraints.

No all-type-one integral support-cover theorem was found in the inspected material. This is a scope-limited search result, not a claim that no such theorem exists anywhere. No authors were contacted, code submitted, installation performed, or external computation used.
