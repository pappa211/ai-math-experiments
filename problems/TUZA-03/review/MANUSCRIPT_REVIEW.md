# Independent consolidated manuscript review

Reviewer role: fresh adversarial mathematical reviewer, separate from the main author and Lean implementers.

## Decision

**Accepted mathematically for the stated scoped results**, subject to the separately recorded published-input/source checks, exact formal-verification boundary, and final reproduction record. No defect was found in the ordinary proofs after the explicit C9 scope correction. This is independent internal reconstruction, not external peer review or a specialist novelty certification.

The exact-equality, essential-edge, flat, closed-boundary, mixed/shared-apex, and compression statements retain their stated hypotheses. Unrestricted two-triangle restoration, OCT-five, and the fixed-c<3 density proposal remain unproved. The manuscript does not imply otherwise.

## Corrections checked

The following requested corrections have been incorporated and checked in the manuscript:

- The C9-page lemma now explicitly assumes nu(L)<=4 and states the integrality/pure-nine-wheel dichotomy, including the exceptional parameters (4,5).
- Gi=H+E(Ti) is defined before use.
- Independence of P and actual-edge uniqueness are described as retained hypotheses, without an unsupported claim that each is logically necessary in every formulation.
- Compression's significance statement now says it preserves the nonisolated part of the old full triangle hypergraph.

The earlier detailed findings and mathematical checks are retained in `audit/MANUSCRIPT_ADVERSARIAL_REVIEW.md`.

## Proof checks and boundaries

The C9 proof has complete hole and antihole exclusions, explicit pure-wheel analysis, and the common-edge property needed to turn an SPGT clique partition into a graph-edge cover. The bowtie application proves the small-packing hypothesis and excludes the wheel using exact individual-apex hypotheses. It includes the repaired open-wedge equality-block case and every stated cross-apex pattern.

The boundary theorem uses independence on both sides and uniqueness only at actual P-to-outside H-edges. Face choices are simultaneous. Lost-family integrality is obtained from concrete bipartite matching, and the stability argument retains lost triangles using the subsequently deleted edge. No order, packing-number, or deletion-size bound is silently introduced.

The essential-edge proof uses the strong free-page lemma, its three-base Hall classification, apex-edge forcing, and explicit compatible final packings. The flat proof includes the five-wheel augmentation and does not assume vertex-disjoint triangle components or planarity. Its HKT input/equality scope must remain tied to the separate source audit. The compression proof preserves exactly four integer optima and old edge stability, with no unrestricted finite-search conclusion or improved kernel-size claim.

The full exact-equality Lean theorem has independently passed statement review. The closed-boundary D1, loss bound, and D2 declarations have also passed, under their exact visible published inputs. Other formalization status must be taken from the final declaration table: ordinary proof acceptance is not a claim that those complete theorems were checked by Lean. The different equality-bowtie and slack-one mixed-bowtie results must not be conflated.

## Remaining editorial/finalization items at this review

The final formal-boundary table was deliberately pending. It must be filled from final reproduced declarations and their visible assumptions. Two nonmathematical audit artifacts were still present when this snapshot was checked: Section 5.2 says “D1” instead of “Section 5.1,” and contains “A theorem implementation should preserve those features.” The author has stated that these will be removed. They do not affect proof validity but should not remain in publication prose.

Primary-source metadata, historical novelty, license selection, redaction, repository integration, and owner publication approval are outside this mathematical acceptance. No commit, push, release, or external correspondence is authorized by this review.

## Reviewed snapshot

UTC: 2026-10-29T09:38:51.276202+00:00

Manuscript SHA256: `75f18e42ee56caef9cd4610c2332ccb6a6378f4e8257112b6b75088bfc656dfe`

## Final report reconciliation

UTC: 2026-10-29T10:01:19.743760+00:00. Manuscript SHA256: `e7191ab1cedee8bc5a089a1a7a8c80b9892c79d779f1bf9accc89fd6df380e59`.

The final formal-boundary table is now filled and independently agrees with the reproduced declaration types. It records the full A and B theorems and the general D1/D2 results, with HNS, Aharoni and König inputs distinguished exactly. C, E and F remain explicitly ordinary-only. The formerly pending “D1” reference and implementation-audit sentence have both been removed. The C9 hypothesis and exceptional-wheel dichotomy remain explicit.

The tables in `LEAN_VERIFICATION.md`, `FINAL_ASSESSMENT.md` and Section 8.2 of the manuscript have the same mathematical verification boundary. The abstract also makes this distinction. The theorem inventory preserves unselected claims and does not silently promote the broader stable-four-spoke assertion. Its source-register wording for some E dependencies is conservative: these arguments were reconstructed within E but are not promoted as independent standalone novelty claims.

No mathematical or formal-statement blocker remains identified in the selected manuscript claims. This reviewer recommends **publish after owner review**, subject to completion of the publication-tree checks by the root author. The recommendation concerns the scoped results and disclosed inputs, not unrestricted restoration or historical priority. Separate owner authorization remains necessary for any commit, push or publication.
