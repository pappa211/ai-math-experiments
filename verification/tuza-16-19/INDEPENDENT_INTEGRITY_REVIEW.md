# TUZA-16–19 frozen-candidate integrity review

Date: 2026-11-15. **Current final outcome: PASS for candidate 02**, content identity **`d683bf904d32db17fb51da9dd2c001324bcb0309b50c4ee0decc4e80fa2e6c2e`**. No outstanding integrity/portability blocker remains. The complete affected re-review and approval limits appear in the superseding review at the end. Final release checks and Git/remote actions remain unperformed and are not approved here.

The initial candidate-01 review below is retained as historical evidence. Its **CHANGES REQUIRED** outcome concerned one portability blocker, now resolved and superseded by candidate 02.

This is a fresh-context internal AI publication review, not external human peer review, independent historical-priority certification, or approval of a push/merge. The owner-configured model was inherited without override; the serving identity is not independently exposed. The reviewer operated locally on Darwin, read the canonical AGENTS.md and migration handoff/report, and used the pinned native Python environment. No installation, remote computation, network mutation, Lean compilation, candidate edit, or frozen-source edit was performed. New review scripts and finite outputs were written only to a fresh temporary area.

## Initial candidate-01 identity

- Candidate: `review-candidate-01`.
- Content manifest identity: **`3cbb6122daa9f4fd28c33f337dcd09a57461f7a8af76ca2353b857113f1d2f3e`**.
- Identity definition: SHA-256 of sorted lines `SHA256`, two spaces, repository-relative path, LF, using `verification/tuza-16-19/CANDIDATE_MANIFEST.json`.
- All **3,133** included regular-file hashes match. The identity was recomputed independently. No unexpected file or symlink was found. The same included-file hashes were checked again at review close, with zero changes.
- Final release inventories, independent-review receipts and release-verification records are explicitly excluded pending receipt-only additions. Their present absence/staleness is not treated as scientific-content approval or a failure of this defined freeze.

## Initial blocker, now resolved: hard-link elan proxy bypasses the no-install guard

`tools/replay_tuza_16_19_formal.py`, lines 412–420, resolves the located executable and recognizes an elan proxy only when the resolved filename is `elan`. The installed `elan/bin/lean` is a **hard link**, not a symlink, to the adjacent elan executable. Both have the same inode, but `Path.resolve().name` remains `lean`, so the resolver takes the native-binary branch and invokes the proxy for `--version`.

The candidate environment receipt's `lean_executable_sha256` is `d52c4516a6c6f0cc14cab0ecf36e5058a764f39b109d8609be7dd1279ca41e9f`, matching that proxy. The actual installed native Lean executable hash is `1b370cfcbf44e80d1b004ab1b1ab9a4c73951f9f7c242140bcff9bc577576554`.

This does **not** establish a wrong compiler or invalidate the completed local finite proofs: the exact toolchain was installed, the reported version/commit agrees, and the source/command/log/axiom evidence checks pass. It does violate the documented no-install guarantee for a reader whose pinned toolchain is absent: invoking an elan proxy can trigger toolchain acquisition before the driver establishes that the native binary exists.

Required correction: recognize both symbolic-link and hard-link proxies without invoking them; require the installed native toolchain before any version invocation; execute that native binary directly; distinguish requested/proxy identity from native compiler identity in the environment receipt. The driver and its new receipts must receive affected re-review under a new manifest identity. The coordinator acknowledged this issue and plans the correction and fresh serial run. No corrected code or new run has been approved by this report.

## Source provenance and preservation checks performed

Independently checked all **1,821** source-manifest rows: **1,199 retained** and **622 excluded**. Every source hash and every retained destination hash matches the actual frozen/source-publication bytes. The four source Git HEAD/tree identities agree with every applicable mapping row, tracked sets are complete, and read-only Git status is clean:

| Alias | Commit | Tracked files mapped |
|---|---|---:|
| TUZA-16 | `405e41c1eb24739405f4b06d8cdcd5715bb9fd13` | 95 |
| TUZA-17 | `aa0de600d7fb0cfe4134e82ad056f02e4c465eb6` | 212 |
| TUZA-18 | `57708a8413929012d9ca8d15b0f925b3ef6b51e8` | 304 |
| TUZA-19 | `7563fdeeb5afb81ebe6ef005b5c5f9f7261ca670` | 1,190 |

All **20** files in the separately identified common-vertex replay are accounted for; it has no independently asserted Git commit and is not a chain replay. All **35** entries in `SOURCE_MATHEMATICAL_INPUTS.json` match their frozen files.

Compared all **1,861** files at public baseline `d4029fbafc3dffc250b50ed237ad81c3206cd1a0` against the candidate using the local accepted repository's Git objects. No older file is missing. Only the six documented reader-facing/index/notice files changed: DECLARATION_INDEX, ORDINARY_PROOF_INDEX, README, REPRODUCTION, STATUS_AND_PROVENANCE and THIRD_PARTY_NOTICES. Older mathematics and papers are byte-preserved. This checks the baseline tree, not future commit history, staging or remote state.

Reviewed all **19** changed Python source mappings: their differences are targeted path/output/docstring adaptations, with mathematical code retained. The new finite driver's execution-copy adaptations are separately disclosed. This reviewer did not independently rehash every private Git metadata/cache file covered by the coordinator's broader before/after integrity receipt.

## Finite reproduction performed

Executed the documented default `tools/check_tuza_16_19.py --output NEW_EXTERNAL_DIRECTORY`, with assertions enabled, Python 3.12.12 and the native environment, against only public candidate input copies. All **23 targets passed**, serially, within the 240-second per-target limit; summed target runtime was about **6.98 seconds**. The output directory was new and outside the candidate.

All 23 adapted checker hashes match those of the candidate's recorded publication run. Reviewed the transformation machinery and the 95 adaptation records, including the public-byte hash mapping. Provenance-only omissions are the two TUZA-16 articles, TUZA-17 mission/HNS article/catalogue HTML bookkeeping, and the CKSU inspected-edition PDF read. Their historical hashes remain recorded. Mathematical inputs and result assertions remain present. The star output is redirected into the new copy; only the two expired clock guards are renewed, retaining finite deadlines and finish assertions. The host-only restriction is removed from those standard-library finite checks.

The finite scope includes the documented K10/K11, TUZA-17, common-vertex, chain, identification, role/compression/cover, WKE, CP5, odd-base, nine-/72-vertex, private-pair and K5/CKSU controls. This is an independent execution of retained implementations, not a claim that every implementation was independently rewritten or that an all-size theorem follows from a finite run. The cone checker reads the retained rook certificate as data and rechecks the relevant literal construction; the rook producer was not represented as a fresh default target. No large historical census, solver-only rainbow kernel, or catalogue-completeness computation was run.

## Formal receipts and scope checked

No Lean compilation was performed by this reviewer. Instead, independently audited the complete fresh candidate evidence:

- **269** command records and **269** corresponding complete log pairs, including empty streams; every sanitized stream digest and original-stream digest reference agrees.
- All command outcomes, UTC serial order, deadline inequalities, one-thread settings, 240-second limits, observed-process 2,200 MiB limits, sample counts and `/usr/bin/time -l` peak values agree. The maximum sampled RSS is **1,756,659,712 bytes** and maximum time-reported RSS is **1,777,467,392 bytes**.
- **266** object hash entries agree with their successful command records. Compiled objects are not distributed and were not independently rehashed by this reviewer.
- All **139** selected public source hashes agree with both before/after receipts and the current candidate. All generated audit-source hashes were independently reconstructed.
- **444** explicit declaration types are present literally in their assigned audit output. Every transitive axiom list agrees with that output: 414 empty lists, 22 lists of `propext`, `Classical.choice`, `Quot.sound`, and eight lists of `propext`, `Quot.sound`. There are **150** explicitly named theorems. No unlisted axiom appears.
- All three false controls return 1 with the intended `decide` false-proposition diagnostic for missing row, empty cover and repeated matching. They are not import failures.
- Independently reserialized all **128** chunk source files from the canonical rows and compared entire bytes; regenerated `generation.json` bytes, Coverage headers/counts and all **5,375** nonoverlapping row assignments agree. The canonical table hash is `e69818bb2599b6b934dd945f3b6cd0305f6718c3d2fe165ea9f7f6d1bfe17cc1`. The fresh default finite verifier independently validates the retained finite WKE domain and witnesses.
- Inspected Core, Domain, Coverage, NegativeChecks and RoleWitness definitions and the fresh driver. The positive source selection excludes aggregates, historical attempts, old logs and old objects. All nine public manifest dependency pins match the actual installed Git revisions and tracked-clean status; both direct Mathlib import source/object hashes match.

The evidence supports **133 accepted source modules**, including 128 separate chunks and a six-vertex RoleWitness. It does not formalize the common-vertex theorem, chain theorem, all-size WKE theorem, core localization or unrestricted Tuza. Cross-file membership correspondence is explicit Python bookkeeping around separately compiled Lean theorems. Reused pinned compiled dependencies and the standard Lean kernel remain trust boundaries; no cold dependency rebuild or independent kernel implementation is claimed. The hard-link proxy defect above concerns acquisition control and executable identity, not an undisclosed mathematical axiom.

## Privacy, licensing, paper parity and navigation

Scanned all **1,282 new or modified files** as UTF-8 text where possible, including decompressed gzip content, for private home paths, local-file URLs, operator identifiers, private host/address markers, UUIDs, private-key headers and common credential patterns. No pattern hit was found. The only newly introduced non-UTF-8 artifact is the report PDF; no candidate symlink, private Git directory, compiled object/cache or redistributed third-party article was identified. This is a finite explicit audit, not a guarantee against arbitrary encoded secrets.

Read the privacy and third-party notices and source exclusions. Mathematical citations remain attributed, the small graph6 datum keeps its source identity, the existing Apache-2.0 boundary is retained, and the numeric CSL asset is byte-identical to the prior public report asset. No legal determination of ownership or novelty is made.

Independently regenerated Markdown and LaTeX from the canonical manuscript using installed Pandoc 3.13 and the documented editorial transformations; both derivatives are byte-identical. The builder uses a new external output, existing tools and Tectonic's cache-only mode. No paper recompilation was needed for this audit.

The delivered PDF hash agrees with REPORT_BUILD/PDF_REVIEW. Independently inspected its **13 pages' extracted text**, metadata, **21 bookmarks**, **67 links**, and zero embedded attachments. Author metadata is AI Math Experiments; no private path/identifier or replacement character was found. Every GitHub repository-file link maps to an existing candidate file. This reviewer did not repeat the coordinator's all-page visual inspection and makes no new all-page visual-quality claim.

Checked **2,172** relative Markdown links in new/modified content: no missing destination except the three explicitly pending candidate-review/release receipt links in the verification README. Six reader-facing fragment links also resolve. External web availability and future public URLs were not independently re-requested; future publication/merge status remains unverified.

## Initial candidate-01 decision and limits, superseded

The frozen candidate passes the enumerated content-integrity, finite-reproduction, receipt-consistency, privacy and source-preservation checks. It requires the stated **elan hard-link proxy fix and affected re-review** before this reviewer can approve its portability claims. No additional blocker was identified.

This report approves no unperformed final checksum generation, staged-tree/commit-history scan, remote push, PR, merge, remote artifact check, external peer review, or broader mathematical result. The later release must add and verify the explicitly pending receipts without silently changing frozen scientific/editorial content. Any included-file change requires a new identity and affected re-review.

## Superseding review — candidate 02

Date: 2026-11-15. **Final integrity/portability outcome: PASS for the frozen candidate identified below.** This supersedes the candidate-01 CHANGES REQUIRED decision while preserving its finding and correction trail above.

- Candidate: `review-candidate-02`.
- Final reviewed content identity: **`d683bf904d32db17fb51da9dd2c001324bcb0309b50c4ee0decc4e80fa2e6c2e`**.
- Independently recomputed the identity and checked all **3,134** included file hashes: zero mismatches, unexpected files or symlinks.
- Compared the two frozen manifests and actual candidate bytes. Exactly the **nine** declared added/changed paths differ: the formal driver; correction/readme text; the resolver-check receipt; and replacement formal environment, command, log and result records. No mathematical source, manuscript, finite checker, source mapping, declaration text, object-hash inventory, or older public mathematics changed.

The resolver fix addresses the original blocker. It recognizes both resolved symlink proxies and sibling hard-linked elan proxies without invoking them, requires the installed native toolchain layout and Mach-O header before the version invocation, and returns the explicit native executable. The new environment receipt separately records the proxy hash `d52c4516a6c6f0cc14cab0ecf36e5058a764f39b109d8609be7dd1279ca41e9f` and native compiler hash `1b370cfcbf44e80d1b004ab1b1ab9a4c73951f9f7c242140bcff9bc577576554`; both match the actual installed files. The driver hash matches the new environment receipt.

Independently exercised the **frozen revised resolver only**, with no Lean subprocess: the actual hard-linked proxy resolves to the correct native executable, an inert hard-link fixture with missing pinned toolchain is refused, and an inert shell wrapper with otherwise plausible installation layout is refused. The coordinator's six resolver checks are separately disclosed in `LEAN_RESOLUTION_CHECK.json`; this reviewer does not relabel all six as independently executed.

Repeated the complete formal receipt audit against candidate 02: **269** commands and log pairs, all original/public stream hash links, **266** object-hash references, **139** current source hashes, reconstructed audit-source hashes, **444** literal declaration/axiom records, **150** theorem entries, and all **three** intended false-proposition rejections pass. All 269 command arrays explicitly select `NATIVE_LEAN_EXECUTABLE`, with the recorded sources/objects and required resource arguments. Serial order, outcomes, deadlines and resource logs agree. Maximum sampled RSS is **1,756,774,400 bytes**; maximum time-reported RSS is **1,781,809,152 bytes**, both below the 2,200 MiB limit. The independently regenerated 128 chunk serializations, generation schedule and 5,375 assignments still match. No new Lean compilation was performed by this reviewer.

Scanned all nine changed files for the same private-path, identity, credential and UUID patterns: no hits. Updated Markdown links resolve, apart from the already declared pending receipt-only links. The correction/readme text accurately states the resolved issue and full rerun. Earlier finite, provenance, privacy, paper-parity and preservation findings carry forward because their included artifacts are unchanged; the 23-target finite suite was not unnecessarily repeated.

**No outstanding blocker remains within this internal integrity/portability review.** Approval is limited to this precise content identity and the checks reported here. It does not approve unperformed final release checksum/receipt additions, staged-tree or newly reachable commit-history checks, remote push/PR/merge, external publication verification, external peer review, or broader mathematical claims. Receipt-only additions must be checked at release; any other included-file change requires affected re-review. The internal-AI and serving-identity limitations stated above remain unchanged.
