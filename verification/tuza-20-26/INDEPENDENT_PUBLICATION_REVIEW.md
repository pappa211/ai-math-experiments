# Independent publication and reproduction review — TUZA-20–26

**Internal AI review.** This review covers archive completeness, preservation, privacy, licensing exclusions, portable reproduction and evidence scope. Mathematical soundness is separately reviewed in `MATHEMATICAL_REVIEW.md`. No human specialist review, historical-priority claim or unrestricted Tuza solution is asserted.

**Verdict: ACCEPTED for Phase A source preparation, reproduction scope and publication integrity.** The owner-requested additional clean Git-checkout replay is a remaining execution gate before merging, not a mathematical gap; its exact commit and fresh receipt must be recorded separately.

## Source completeness and preservation

The reviewer independently compared the source-to-public manifest against `git ls-files` in each of the seven canonical mission repositories. All **2,656 tracked source files** are accounted for exactly once: 114/81/694/667/590/215/295 files for TUZA-20/21/22/23/24/25/26 respectively. Each canonical original SHA-256 was recalculated. Every nonexcluded public target exists and matches its mapped public hash. All **701** deduplicated inherited copies resolve by relative in-repository symlinks to the declared canonical file. No deduplication target escapes the public tree. See `INDEPENDENT_SOURCE_AUDIT.json`.

The source dispositions explicitly distinguish retained bytes, sanitization, deduplication and exclusions. Ignored source files were reviewed separately: generated compiler/bytecode caches and four reproducible native binaries, not missing scientific documents. The release is based on public main `4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4`; no private Git history is imported. Prior paper directories, unrelated A113010 content, selected older archives and the historical 15 November research guide were compared against that baseline and remain unchanged. TUZA-27 mathematics is excluded and its working materials are untouched.

## Fresh reproduction

The public TUZA-23 source closure rebuilt successfully in a new isolated source directory: **31 modules**, **505 actual constants / 446 theorems**, **27 named target closures**. The missing-B fixture failed with the expected application-type error against those fresh objects. TUZA-24 likewise rebuilt **79 modules**, **1,042 actual constants / 938 theorems**, **19 named target closures**. Accepted semantic controls are included. All canonical `.lean` source hashes and pinned dependency files agree with the public candidate. The complete actual-environment audit includes generated/private constants; only `propext`, `Classical.choice`, and `Quot.sound` occur as collected axioms.

One-thread execution, 240-second per-command timeout and 2,200 MiB sampled process-tree RSS limits were enforced. The compiler and all nine dependency Git revisions were checked, and tracked dependency source trees were clean. This is clean-source reproduction with existing pinned native dependency objects, not a cold dependency/compiler rebuild, a separate kernel implementation or a separate object replay. Exact theorem scope still comes from the printed types, definitions and independent mathematical review. In particular, R2 assumes old B and M0 has explicit conditional inputs.

The final privacy-curated archive passed all **21** selected finite commands in about **12.54 seconds**, with peak sampled process-tree RSS **176,357,376 bytes**. The checked domains include the 2018/2422/8220 TUZA-22 interfaces, C12/210 nonedge insertions, adjacent-restoration witnesses and 6672 TUZA-26 triangle-interface presentations, plus explicit counterexamples and semantic controls. All copied source hashes were stable during the run. Exact JSON outcomes and transformations are published under `finite/`; no solver UNKNOWN, partial search or reported-unverified census was promoted.

Two infrastructure failures and two public-path/hash adaptation failures were resolved and retained privately before the accepted runs. No failed attempt is called PASS. The public adapters now verify sanitized dependencies through explicit original/public manifest pairs rather than ignoring historical hash assertions. Three TUZA-26 certificate pins are rebound by the same method. All mathematical domain and witness assertions remain active. TUZA-22 validators use separate fresh copies so a newly timestamped receipt cannot overwrite a frozen dependency unnoticed.

Three post-replay explanatory files clarify R12 versus R-F. Their before/after hashes are recorded in `finite/POST_REPLAY_EDITORIAL_CHANGES.json`; none is read by the executed validators. No formal source, checker, finite domain or certificate changed in that clarification.

## Privacy, licenses and navigation

The independent scan covered **1,964** new scientific, verification and navigation files at the recorded snapshot. No private user/home/server patterns, known secret formats, generated binaries/build caches or missing inline local Markdown targets were found. Public reproduction receipts replace execution paths with symbolic locations and omit identifying metadata while retaining types, hashes, counts and outcomes. Raw private transcripts, host access material and unlicensed full-text articles are excluded. See `INDEPENDENT_TREE_AUDIT.json`.

The reviewer inspected the original external verification package's rights notice. It explicitly requires permission to redistribute its programs, certificates and data. The nine affected files are excluded with the official DOI and original hashes retained in provenance; project-authored mathematical analysis remains. The final ordinary four-branch replacement does not depend on redistributing or freshly replaying that package. Existing licenses and authorship/AI disclosure conventions remain unchanged.

Current per-mission reproduction guides point to the tested public adapters; original guides remain explicitly historical. Historical failed and superseded claims carry the publication-status pointer. The R12/R-F correction is conspicuous at the top of the historical TUZA-26 proof chain and in both relevant publication-status documents: only R12 plus strict C12 restoration is claimed as a sufficient route, not broader R-F alone. Neither route is proved, and no converse is asserted. The current guide states that the programme is paused and unrestricted Tuza remains unresolved.

## Acceptance boundary

No material archive-completeness, reproduction or privacy issue remains within the reviewed scope. Publication may proceed after the independent mathematical findings are resolved, the exact final content snapshot is bound below, and the normal PR checks pass. This approval covers Phase A archive publication only; the comprehensive synthesis paper requires its separate source/semantic/typesetting review. Public availability and the actual remote commit remain post-publication checks.


## Frozen content binding

This independent review binds **5,758** file records in `CANDIDATE_MANIFEST.json` to content digest:

`4014983386064362dfa4bff181701e3ee704ca784f9f0769590e7bb29c3399fd`

The reviewer independently recomputed every listed file SHA-256 and size, every recorded symlink target, and the aggregate digest from UTF-8 `json.dumps(files, sort_keys=True, separators=(",", ":"))` with no trailing newline. All matched. The six explicit self-exclusions are root `FILES.sha256`, `RELEASE_FILES.sha256`, `RELEASE_MANIFEST.json`, this review, `CANDIDATE_MANIFEST.json` and `RELEASE_VERIFICATION.json` in this verification directory. They avoid self-referential hashes; they are not exclusions of mathematical source. The source-to-public manifest itself has SHA-256 `a0ef27d1f5f5a02dc448b19e58df26b2c539cda821b903f6b071098afe15a280`, agreeing with the independent source audit.

The frozen candidate includes the explicit R12/R-F correction and resolved mathematical-review findings. Any further mathematical-source, certificate, checker or claim change requires a targeted renewed review. A separately recorded successful clean Git-checkout replay of these identical sources and metadata-only publication records do not by themselves change the mathematical acceptance scope.


Final precision correction: the two publication-status R12 definitions now explicitly require the nonempty triangle support to be connected through shared graph edges and state a support-isomorphism conclusion with background edges allowed. This supersedes the immediately preceding editorial snapshot, not the underlying accepted theorem or any executed finite input. The final per-file hashes are those in the bound candidate manifest above; no parent-residual/Q minimality transfer is introduced. The earlier announced candidate digest is superseded.
