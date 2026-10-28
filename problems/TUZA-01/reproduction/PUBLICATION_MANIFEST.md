# TUZA-01 publication manifest

## Content and status

This is a text-only archive of an AI-assisted, unrefereed mathematical manuscript, conditionally verified elementary Lean deductions, small exact checks, sanitized historical findings and critical reviews. Novelty is unconfirmed; no external specialist review occurred. The general Tuza conjecture remains open. Density is an ordinary derived corollary dependent on Liu–Zeng's preprint, not a Lean theorem.

The publication tree is derived from the existing public repository, not from private research Git history. The baseline public main was `7f313355dc8c9a942bb5af54682f8fc3bc3831a4`. Only `problems/TUZA-01/`, root `README.md`, root `THIRD_PARTY_NOTICES.md` and necessary generated-file ignore rules are changed. The A113010 subtree, contribution policy and root license are unchanged.

## Navigation and selection

- `manuscript/`: canonical TeX, BibTeX, and complete GitHub-readable rendering. The privately built PDF is not part of Git.
- `lean/`: eight original Lean files, exact toolchain/configuration/lockfile, and new portable verification wrappers. Mathematical source is byte-identical to Validation V1; the three wrapper files replace private paths and GNU-only timeout handling with local Lake resolution and Python timeouts. No private fallback path survives.
- `experiments/`: the original standard-library sanity script and a fresh result matching historical substantive evidence. Time fields necessarily differ. These corroborate definitions/examples, not the infinite theorem.
- `reports/`: mathematical excerpts from Phase 1 and Validation V1 plus a concise integrated validation finding. Operational/governance sections are omitted; the Phase 1 small-packing summary's omitted equality boundary is explicitly flagged and correctly handled in the manuscript.
- `research-notes/`: independent mathematical/density/novelty findings, limitations and failed routes, and the two publication-preparation reviews. Historical review is clearly separated from current reproduction.
- `reference/`: source metadata, exact input mapping, bibliographic limitations and the targeted fresh version/novelty check. No third-party full text is included.
- `reproduction/`: portable commands, exact declaration/type/axiom output, verified scope, source provenance and file hashes.

The original Phase 1 and Validation V1 private archives remain preserved. Git reconciliation established the clean final Validation V1 HEAD `7762e33585835183afd9a950c6edbbfed822283a`, following `6d5ee6e814668f2831f7f502f4cfb741bdb66b14` and the evidence commit `0fea78cf5701d90030b008c20710805b5bbc96f1`. These are identifiers for provenance only: no private Git objects/history or access information is distributed.

## Hashes and transformations

[SOURCE_PROVENANCE.json](SOURCE_PROVENANCE.json) records the exact hashes of controlling private research/validation inputs using archive-relative source names, the unchanged Lean/configuration mappings, and the specific report selections/portability edits. [FILES.sha256](FILES.sha256) hashes every retained TUZA-01 file except itself; run [verify_inventory.py](verify_inventory.py) to check both completeness and content. The [original publication's manuscript-review record](../research-notes/MANUSCRIPT_REVIEW.md) retains the hashes and scope of that review unchanged.

The [editorial revision record](EDITORIAL_REVISION.md) documents the later result-first presentation, relocation of manuscript disclosures, regenerated Markdown and private PDF, and checks that the abstract, mathematical sections, Lean package, bibliography and earlier research/verification records remain unchanged. It distinguishes the current manuscript bytes from the original publication's preserved review hashes; this editorial correction is not a new mathematical or novelty review.

## Intentionally excluded

Private handoff and infrastructure/access information; private Git history; credentials, local usernames/home paths and application/session metadata; raw agent conversations and extensive machine logs; third-party PDFs/HTML/images; generated manuscript PDF and rendered pages; `.olean`/`.ilean`/native outputs; caches and installed dependencies; executables; binary backups; irrelevant experiments. The source archive is navigable independently of private server access. No GitHub Release, journal/arXiv submission or external correspondence is included.

## Verification evidence

The [verified-results record](VERIFIED_RESULTS.md) gives actual commands, exit codes, pins, cache scope and limitations. The private PDF compiled and was visually checked; the clean publication Lean project compiled all applicable sources and checked exact declarations/axioms. Staged-file and history scans, link checks, source fidelity and A113010 preservation were part of the publication gate. The actual public main commit and live file presence are independently verified after merge and recorded in the private completion report, avoiding a self-referential commit-SHA field here.
