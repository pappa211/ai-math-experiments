# Editorial revision: result-first presentation

Date: 28 October 2026. Baseline: public main `d817466f64b63520a89c29038478b381f0e6e25c`.

This editorial correction leads with the triangle-deletion criterion and its OCT-at-most-four and fixed-c density consequences. The repository index and TUZA-01 landing page explain the mathematical outcome before its verification scope. The canonical manuscript's abstract is followed directly by the mathematics; review, attribution and originality disclosures are consolidated in its final section. The explicit Lean hypotheses and technical reproduction scope are retained.

## Integrity and executed checks

- The abstract and complete mathematical sections 1–4, including all theorem/lemma statements, assumptions, proofs, corollary quantifiers, numerical thresholds and citations, are byte-identical to the baseline. Their mathematical-section SHA-256 is `6ba85ef567729d26d39b3d1f7f67365c921b081885735daa047f1b9d881c6f4c`.
- The manuscript's technical Lean-scope paragraphs are byte-identical. Every Lean file, dependency pin, bibliography, experiment, research note, earlier review, declaration output, source-provenance record, technical reproduction guide and `VERIFIED_RESULTS.md` is unchanged. A113010 and its historical root-README account are unchanged.
- Markdown was regenerated with the unchanged existing renderer; all 18 numbered displays are retained. Its opening and final section were inspected against canonical LaTeX. No new mathematical, bibliographic or peer-review campaign was undertaken.
- The revised private PDF was rebuilt with cached Tectonic 0.15.0 resources using `tectonic --only-cached --reruns 2 --keep-logs --keep-intermediates TuzaTriangleDeletion.tex` (exit 0). All eight rendered pages were visually inspected. The final engine log contains no overfull/underfull, missing-glyph or undefined-citation/reference warning. No generated binary is included here.
- The current file inventory, local links, changed-file scope and staged privacy checks accompany this correction. No Lean rebuild was needed because the entire Lean package remains byte-identical.

## Relationship to preserved verification records

Earlier research and verification records describe the original publication and retain their original bytes and hashes. In particular, [MANUSCRIPT_REVIEW.md](../research-notes/MANUSCRIPT_REVIEW.md) is the original mathematical review, and [VERIFIED_RESULTS.md](VERIFIED_RESULTS.md) records the original reproduction. This editorial record distinguishes the present source bytes without rewriting that evidence or implying a new proof review.

| Manuscript source | Original-publication SHA-256 | Editorial-revision SHA-256 |
|---|---|---|
| Canonical TeX | `c1ab985e04ad3efec315555d230ea92052500523c53bd25bdb139aef92421f17` | `8eae334bc6a90f21dbf8a340ca6c8b538db172d797b6172e9f912f9438c243b0` |
| Generated Markdown | `48f5962abcd7aa9d5a98064fd2094c891db24c101c44c636220b618c0b18800f` | `d18fedc8464fe5624eef0ed3ebb730ba7b8a1b9aec33e07ba69f23f0a1b0e93b` |

[FILES.sha256](FILES.sha256) gives the complete current TUZA-01 inventory. [PUBLICATION_MANIFEST.md](PUBLICATION_MANIFEST.md) links both the original provenance and this editorial revision.
