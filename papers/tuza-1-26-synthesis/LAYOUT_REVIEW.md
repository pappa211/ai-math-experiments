# Independent sampled layout review

**Final disposition: accepted within the sampled layout scope for build 13**, PDF SHA-256 `f162a763fc654d2e53efae9d0ddca6322e35d839eb45460f152cd5bfb9c14b88`, canonical manuscript SHA-256 `1906b62908224ef97e6b5ac9773f2ea4d0dda09121fd4729c222ab5fea4fb562`. The display-glyph, comma-spacing, TOC gutter and figure presentation findings are closed by visual reinspection. Earlier build findings below are retained as correction history and superseded by the final build-13 acceptance at the end. This acceptance is not a whole-document visual or mathematical reread.

## Frozen build and limits

Reviewed `outputs/paper-build-09/main.pdf`, 390 A4 pages, SHA-256 `fb3a9f95d51c930b8f64f6130aaf5bdd5845d1d3df91afbcbb4d26b2ff64599f`. Its canonical assembled manuscript hash is `a14ba8eb586ef4ccf3fdcfdf463928e7d62f00dcba2bdaa43a0ef0cbd76da4cb`; the generated Markdown and LaTeX hashes are respectively `71d054d98d52238818f8edcfd14d888d125aea384167684967a00d981b18b763` and `74e3ef9a14c35aaa9ffc942ae8dff23de8bb441227783712e405813d6def85b8`. These values were independently read from the artifacts and agree with BUILD.json.

This is a sampled layout and readability review by an independent AI reviewer, not a whole-text reread, external peer review, or fresh mathematical verification. The root's all-page geometry/contact-sheet check is separate. The PDF skill was read and followed. Rendering and text/geometry inspection used the existing pinned Mac Python environment, PyMuPDF and PIL; no package installation or heavy computation was required.

## Exact sampled pages

Rendered pages **1, 2, 7, 11, 17, 19, 28, 35, 50, 106, 137, 252, 333, 355, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390** at 1.4 pixels per PDF point. All 28 samples were visually inspected in seven four-page sheets. Pages 381, 383 and 386 were additionally inspected individually; the Appendix F heading was rendered at 3 pixels per point to verify its entire text. Images and the machine-readable sample record are under `outputs/layout-independent-09/`.

The sample includes the title/abstract, main definitions, early criticality and forest displays, amplification, explicit C12 graphs, mission entries, early restoration case proofs, canonical-domain lists, long late proof units, BP121, B-compose, B-dual, B-heavy, all of Appendices C–G, and all three reference pages. No graphical figure occurs in these samples; this review therefore makes no figure-specific fidelity claim.

## Findings

**L1 — Mathematical display fallback needs correction before acceptance.** On page 381 the B-dual proof renders `3q+rle3s, nges+q+5r.`, `n-8d_S ge 9s-7q-3r ge 2q ge 0.`, and `2alpha-n+mu ge 2n/3-n+7n/16 = 5n/48.` These are visible literal tokens, not merely extraction artifacts. Page 355 similarly renders the BP108 bound as `mu(F)le3`. This compromises the intended mathematical notation even though no text is clipped. The problem is systematic in indented mathematical material: Greek names and relation macros are flattened inside code-style displays. Plain `nu(H)` in an explicitly ASCII formula is readable, but joined relation words such as `le3` and `nges` are unacceptable.

At the root's request, the five B-dual expressions in the review source were converted to genuine display mathematics. The Tutte–Berge maximum now explicitly ranges over vertex subsets; this states the already intended domain. Every operator direction and numeric coefficient was compared to the original. The corrected late appendix SHA-256 is `00279027078c73b8762c13dd9358a5ee1bc072847666f24627c5948c1cef8f8a`; exact expressions and before/after hashes are in `reviews/b_dual_display_correction.json`. No candidate file was edited by this layout reviewer. Root is correcting the generic renderer fallback; a rebuilt PDF must be inspected before L1 is closed.

**L2 — Punctuation spacing reduces readability.** Many prose commas are followed immediately by the next word, visibly including the title's `Results,Reductions,and` and Appendix F's `Notation,dependencies,provenance`. This affects headings and body prose, not only mathematical lists. Spaces should be retained at the rendering/assembly boundary where they occur in the editorial source. This is a typography issue, not a mathematical scope objection.

**L3 — Sparse final pages are cosmetic.** Page 384 contains the continuation of a reproduction command and one paragraph; page 387 contains the end of Appendix F; page 390 contains only the last reference. These are legible and complete, but more compact page-break management could improve presentation. No mathematical or bibliographic text is lost. The command continuation has multiple backslashes in build 09; root already identified that source correction separately.

**Passes within the sample.** Main displayed inequalities and the forest anchor/pointed formulas are legible and do not collide with prose. The explicit C12 definitions and implication display fit. Dense ordinary proof pages and the BP121 assembly are neither clipped nor overlapped. B-heavy fits on its page and clearly distinguishes its minimum-CS proof route. The Appendix C–F tables have readable column separation, adequate line wrapping, and no row text overlapping adjacent columns. The Appendix F heading is fully present. Appendix G's long identifiers and command wrap within the text area. Reference names, titles, DOIs and URLs remain readable with valid line breaks. No black replacement boxes or missing-glyph squares were observed in the rendered sample.

The sample geometry scan found **zero text spans outside the conservative page rectangle** with 35-point left/right, 25-point top and 20-point bottom margins. This numeric result supplements the visual inspection; it does not establish semantic integrity of uninspected pages or detect the literal-token defect in L1.

## Disposition

Build 09 is **not yet accepted for final publication layout** because of L1. Its sampled page geometry, tables and major main-text displays pass. Closure requires a new PDF hash and visual recheck of B-dual, BP108 and representative other indented mathematical blocks after the renderer correction. L2 should also be corrected if its cause is systematic; L3 is optional cosmetic refinement.

## Final build-11 recheck and closure

The final inspected PDF has **391 pages**. Its SHA-256 is `2c758133367636d8cb952fff62828057a1fa258029b19fc9c2562693d9ca651f`; the canonical manuscript SHA-256 is `b8146acbc5bcb19c5159e49ddfa427e13817331c3b0d39f99d8bfe703f32e578`. Both agree with the build record. The generated Markdown hash is `c3a85275f50e4bda0c3e220cd1d374905be29392074d4dd2e9214d42f03bdef9` and generated LaTeX hash is `9ca2a687e1e33acaaabe5d26467e7544585640c932fc8dec887072381ec4ad39`.

Independently rendered and visually inspected PDF pages **1, 7, 11, 17, 19, 35, 50, 106, 137, 252, 333, 356, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391** in seven four-page sheets. Pages **356 and 381** were also inspected as individual full-page renders. The images and exact sampling record are in `outputs/layout-independent-11/`.

- **L1 closed.** All five B-dual expressions on page 381 render as genuine mathematical displays. The Tutte–Berge maximum, the two dual identities, both inequality chains and the final fraction retain their intended operators and constants. The former BP108 `mu(F)le3` defect now renders visibly as **μ(F)≤3** on page 356; its further matching expressions also retain Greek glyphs. Other sampled code-style mathematical expressions are legible. The mixed use of standard display math and explicit monospace formulas is a presentational choice; no joined `le`/`ge` artifact remains in the inspected correction sites.
- **L2 closed.** Title, headings and body prose now visibly retain spaces after commas, including the title and Appendix F heading.
- **L3 nonblocking.** Some chapter-ending pages remain sparse, including pages 385, 388 and 391. Their content is complete and readable. The reproduction command now has no redundant backslash continuation sequence.
- **Geometry and readability pass within the sample.** No clipping, text overlap, broken table columns, black replacement boxes or missing-glyph squares were observed. BP121, B-heavy, the dense case/domain material, all Appendix C–G table pages and the bibliography remain readable. The sampled geometry scan again found zero spans outside its conservative rectangle.

**Acceptance:** no outstanding blocking layout finding remains for this frozen build within the stated sample. This conclusion neither substitutes for the root's all-page geometry check nor certifies that every character on all 391 pages was visually reread. No candidate files were changed during this review; the authorized B-dual source-display correction was integrated by the root.

## Build-12 table of contents and shifted-body review

Reviewed `outputs/paper-build-12/main.pdf`, **397 pages**, SHA-256 `41c2fb8b7055790f3a7361d8373cf99a0d67763c129d0971799752be3d37177b`. The mathematical manuscript remains `b8146acbc5bcb19c5159e49ddfa427e13817331c3b0d39f99d8bfe703f32e578`. The six printed contents pages are PDF pages 2–7. All **242 link annotations** on those pages resolve to valid pages in the PDF. Independently compared every body page's extracted text with build 11 after the six-page shift, ignoring only the footer page number: **zero differences**.

Rendered and visually inspected pages **1–8, 13, 17, 23, 25, 76, 362, 384, 387–390, 392, 393, 395–397**. TOC pages 4–5 and figure page 76 received additional individual-page inspection. Images and the sample record are in `outputs/layout-independent-12/`. The sampled geometry scan again found zero spans outside its conservative rectangle. Main and appendix content remain readable at the shifted locations; the B-dual correction and Greek/inequality code glyphs remain intact.

Three presentation findings were sent to the root before final acceptance:

- **L4 — TOC page-number separation.** Long entries visibly run into their destination numbers: BP018 on page 4 ends `at most five186`; BP045 on page 5 ends `completion242`; BP049 on page 5 ends `terminal251`. Reserve a larger right gutter or otherwise force wrapping before the page-number column. This is not detected by an outer-page-margin scan.
- **L5 — Duplicate figure caption prefix.** Page 76 prints `Figure 1: Figure 1. The final eight-vertex core B.` Remove the duplicate prefix from the figure's caption text or suppress the automatic prefix.
- **L6 — Figure dashing differs from its legend.** The embedded PDF figure's red hub lines appear solid, although the SVG source has `stroke-dasharray="6 4"` and the legend/prose calls them dashed. Preserve dashing in PDF conversion. All 23 graph edges and eight vertex labels are present, with no clipping or graph-content discrepancy observed.

L4–L6 concern presentation, not changed mathematics. Build-12 acceptance is pending their disposition; the earlier body-layout acceptance and mathematical statement scopes remain unchanged.

## Final build-13 acceptance

Inspected `outputs/paper-build-13/main.pdf`, **398 pages**, SHA-256 `f162a763fc654d2e53efae9d0ddca6322e35d839eb45460f152cd5bfb9c14b88`. Its canonical manuscript SHA-256 is `1906b62908224ef97e6b5ac9773f2ea4d0dda09121fd4729c222ab5fea4fb562`. The values were read from the artifacts and agree with BUILD.json. Generated Markdown and LaTeX SHA-256 values are respectively `1216c3bfde4a76bf6a837634b4d3b395a97f3f2e4d0e9447adcb29d84c3294a3` and `bff60876b78c365b90d60e7a98775d17b601b1cfd29ad57a1c0e6ec3f2183ca9`.

Rendered and visually inspected pages **1–9, 77, 309, 343, 363, 385, 388–391, 393, 394, 396–398**: 23 pages, including all seven printed TOC pages, the corrected figure, the recovered BP077/BP096 heading locations, code-style mathematics, the final ordinary proof, B-dual/B-heavy, Appendices C–G, and bibliography. Figure page 77 was additionally inspected individually. The exact sampling record and rendered sheets are under `outputs/layout-independent-13/`.

**L4 closed:** BP018, BP045 and BP049 now wrap before the reserved page-number gutter; titles and destination numbers are clearly separate. All seven TOC pages were inspected. Their **251 link annotations** target valid pages, and BP077/BP096 both appear as PDF outline entries with the expected destinations. The count is link annotations, not a claim of 251 distinct headings.

**L5 closed:** the automatic figure caption now reads `Figure 1: The final eight-vertex core B.` without a repeated prefix.

**L6 closed:** all seven red hub edges are visibly dashed in the embedded figure. Independent PDF drawing extraction finds exactly seven red paths, each with a nonempty `[2.75526 1.83684] 0` dash pattern, the scaled image of the source's 6:4 dashing. The 23 edges, eight vertex labels, legend and nearby table remain readable and unclipped.

Earlier corrections remain intact: the B-dual inequalities on pages 388–389 are genuine display mathematics, the BP108 bound on page 363 retains μ and ≤, and prose comma spacing is preserved. No sampled clipping, table collision, replacement-glyph box, or unresolved display conversion artifact was observed. The sample geometry check again reports zero spans outside its conservative rectangle. Sparse final pages remain a nonblocking style choice.

**Final acceptance is bound to the build-13 PDF and source hashes above. No blocking sampled-layout finding remains.** The root's separate all-page geometry/render audit is complementary. This review does not certify a visual reread of every character on all 398 pages and does not broaden any mathematical claim or proof-verification scope. No candidate file was edited by this reviewer during these layout checks.
