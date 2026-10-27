# Publication manifest

The public repository is a fresh Git history built from the final preserved research checkpoint `aeded602f282ec31689c0b35af0617d9289b442f`. Before copying, all **252 tracked source files** were compared byte-for-byte with that checkpoint. The source environment was inspected for additional mathematical files: only six compiled Python cache files were found outside the tracked notes/experiments/scripts/reference inventory. They are regenerable runtime artifacts and are not included.

The complete [JSON manifest](PUBLICATION_MANIFEST.json) lists every tracked source file, its original SHA-256 and size, its disposition, and the publication path/hash/size where retained. Original hashes are historical provenance; a sanitized note or adapted wrapper has a different publication hash. This avoids presenting an old script hash as the hash of an edited public wrapper.

## Directory mapping

| Original source location | Public problem-relative location |
|---|---|
| `proof/` | `lean/`; all 116 working Lean files and all three project configuration files are byte-identical |
| `experiments/` | `experiments/`; all 12 experiment Python programs and the C source are unchanged; the guide replaces an obsolete setup placeholder |
| Final session reports in `notes/` | `reports/` |
| Mathematical notes and critical reviews in `notes/` | `research-notes/` |
| Verification fingerprints and dependency audit JSON | `reproduction/evidence/` |
| Mathematical verification wrappers in `scripts/` | `reproduction/scripts/`; directory plumbing adapted, proof sources unchanged |
| Frozen original challenge, license, configuration, and hashes in `reference/` | `reference/`; retained source bytes and attribution preserved |

Source-relative filenames in historical prose and old fingerprint keys are retained for traceability. Use the mapping above and the per-file JSON mapping; the current executable commands are in [README.md](README.md). Publication notices and GitHub-compatible display formatting are editorial additions, not changed mathematical arguments.

## Excluded operational files

| Original file | Reason and retained replacement |
|---|---|
| `.gitignore` | Replaced with publication exclusions for caches, secrets, and generated binaries. |
| `AGENTS.md` | Private operational instructions; mathematical safeguards restated in CONTRIBUTING.md. |
| `README.md` | Operational setup and login instructions; replaced with public problem and reproduction documentation. |
| `notes/SESSION_01_CLOSURE.json` | Operational session/process metadata; research times and outcomes remain in reports. |
| `notes/SESSION_02_CLOSURE.json` | Operational session/process metadata; research times and model qualification remain in reports. |
| `notes/SESSION_02_MISSION.md` | Operational user instruction, including private infrastructure; method and results are preserved in the report. |
| `notes/SESSION_02_PRESERVATION_CHECK.json` | Operational preservation metadata; replaced by the public source-to-publication manifest. |
| `notes/SESSION_02_STATE.md` | Duplicate operational closure record; final mathematical state retained in STATE.md and the report. |
| `notes/SETUP_REPORT.md` | Private infrastructure inventory. Relevant toolchain versions, resource requirements, and smoke results are preserved in reproduction documentation. |
| `reference/elan-init.sh` | Downloaded installation script; use the official installer instead of redistributing it. |
| `scripts/codex-entrypoint.sh` | Runtime authentication/launch wrapper, not mathematical source. |
| `scripts/start-astra.sh` | Runtime launcher, not mathematical source. |

These exclusions remove no mathematical proof, experiment source, critical argument, or finite result. Relevant environment versions, research durations, model qualifications, mathematical safeguards, and verification limitations appear in the public reports and reproduction guides. Private application-session identifiers, connection details, and authentication instructions are not retained.

## Raw output converted to readable evidence

Thirteen raw `.log` files are not published as terminal transcripts. Each has a structured `.summary.json` extract with available build-pass modules, declaration/axiom records, final result markers, and numeric records. The final historical verification extract retains all 110 build passes and 52 named axiom audits. An intentional negative-control error is identified as such, not relabelled a successful proof. Original log hashes and sizes remain in the manifest and historical snapshot records.

Thirteen `.resources.txt` files are converted to structured `.resources.json` records, preserving command descriptions, elapsed time, peak memory, exit status, and other recorded resource fields. These are historical observations, not newly measured performance. The public archive contains no raw identifying terminal output.

## Large and binary artifact classes

**No available substantive mathematical artifact was excluded for size.** The full text-based archive is only a few megabytes, including generated Lean certificates. Large binaries and installations are unnecessary to preserve the results:

- Installed Lean/compiler binaries, nine dependency checkouts and build caches, and download caches are excluded. The historical complete installation occupied approximately 11.21 GiB. Reconstruct it using the exact toolchain/lockfile and the commands in the reproduction guide; installed files are not represented as independently rebuilt artifacts.
- Private Git history, `.bundle` and `.tar.gz` backups are excluded wholesale. Their relevant constituent mathematical sources and evidence are published individually after sanitization. No old Git directory or old commit objects were copied.
- Compiled Python caches and the temporary C executable are excluded; their Python/C sources and build commands are included.
- The normalized-core experiment computed a residue modulo `10^140000000`; its unpadded decimal string had **139999999 digits** (about 140 MB of ASCII) and SHA-256 `6168554f40cc72b3f78cac850120386300d074721903f270684641b7d7caf88c`. That string was not retained as a source artifact in the completed archive. The algorithm, parameters, digit sum, source hashes, second arithmetic-path result, and checksum are preserved in `experiments/gmp_suffix_u6_t9*.jsonl`. The generation commands are in the experiment guide. This omission is not an omitted proof certificate: the large calculation was never a Lean theorem.
- The enormous unresolved normalized case was never expanded; there is no missing computed result to publish.

## Integrity, licensing, and publication checks

The original definition/targets, upstream challenge blob, eight frozen hashes, nine dependency revisions, and 116 working Lean source hashes are retained. The publication audit regenerated 97 certificate files in scratch space and compared them byte-for-byte, without changing the archived proofs. Exact test outcomes and limitations are in [PUBLICATION_TEST_RESULTS.json](PUBLICATION_TEST_RESULTS.json).

The official Gitleaks scanner and targeted checks inspect the public tree and first-commit content for credentials, private infrastructure identifiers, personal paths, application-session identifiers, forbidden binary/cache files, and unrelated content. The final record identifies the completed scan, not merely a plan to run one. Raw scanner reports and private matching rules are kept outside the public tree. JSON/JSONL parsing, script syntax, local Markdown links, and staged-file inventory are checked as well.

The root Apache-2.0 license matches the retained upstream license text; original copyright notices remain in the exact source files. The upstream revision has no root NOTICE file. See the repository's THIRD_PARTY_NOTICES.md. No third-party dependency sources, paper PDFs, installed tools, or scanner binaries are bundled.
