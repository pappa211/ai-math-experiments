> Historical mission record, 14–15 November 2026. Original proof/status boundaries remain; publication review and fresh execution are recorded separately in [publication evidence](../../verification/tuza-16-19/README.md). Operational publication restrictions in this record describe the earlier mission.

# TUZA-18 private execution receipt

**Research and closeout complete in the tagged private checkpoint.** The annotated local Git tag `tuza18-final-checkpoint` records the final commit and actual checkpoint completion time (`checkpoint_verified_utc`). Both are also returned to the owner. A commit cannot contain its own hash; the tag provides that non-self-referential record.

| Item | Recorded value |
|---|---|
| Original start | 2026-11-14 15:30:10 UTC |
| Research cutoff | 2026-11-14 21:00:10 UTC |
| Hard deadline | 2026-11-14 21:30:10 UTC |
| Workspace | `https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-18` |
| Private branch | `codex/tuza-18` |
| Interim checkpoint | `3450648`; this is not the final checkpoint |
| Final checkpoint identity | Annotated tag `tuza18-final-checkpoint`; exact commit and finish in its annotation |
| Final mathematical review package frozen | 2026-11-14 20:27:31 UTC |
| Final review transferred to canonical workspace | 2026-11-14 20:28:45 UTC |
| Cutoff observation, stopped agents/jobs | 2026-11-14T21:00:35Z; no running mission subagent or native research job |
| Actual finish | Exact `checkpoint_verified_utc` in the annotated tag, after clean commit verification |

The clock was preserved through the owner's explicit access approval and resumption. The last mathematical branch closed with the compression review. Subsequent work has concerned documentation, source and file integrity, and the private checkpoint; it is not additional candidate verification. The final thirty-minute window is reserved for closeout.

## Mathematical outcome and verification scope

Unrestricted Tuza remains **UNRESOLVED**, with no full proof or graph counterexample candidate. The strongest ordinary positive result is the cover theorem for every specified maximum packing whose triangles share a vertex, with the cover confined to the ORIGINAL packing support plus its private K4 completions. Its separate fresh-context reconstruction passed at20:04:33 UTC. Bounded verifier results support that audit but do not establish the all-size theorem by enumeration.

Meaningful negative results include the connected all-N obstruction to every bounded strict Hall-deficiency descent, exact failures of the specified cut/pruning, minimum-old-cover, identification and compression mechanisms, and the bounded-incidence obstruction strengthened by generic criticality. The [report](REPORT.md) and [statement ledger](STATUS_MATRIX.md) distinguish ordinary proofs, finite certificates, refuted hypotheses and unresolved applicability claims. None of the actual graph controls is offered as a Tuza violation. Originality is unestablished; all review was AI review, with no human review or publication.

The only new Lean result is the finite six-vertex role obstruction, final pass19:23:26 UTC. Lean4.33.1 and the pinned Mathlib/dependencies were used. All nine transitive axiom reports list only `propext`, `Classical.choice`, and `Quot.sound`. There is no `sorry`, custom axiom or `native_decide`. Installed compiled dependencies were reused; no cold build or independent kernel replay occurred. See [the Lean verification note](notes/lean_role_verification.md) and [reproduction guide](REPRODUCTION.md).

## Integrity evidence

The source audit passed at20:36:39 UTC:22 frozen snapshots,60 additional source-object records, two retained primary PDFs,14 native dependency checks, and three historical Git worktree identities. TUZA-16, TUZA-17 and the public checkout remained clean at the original commits. Exact results: [source integrity](evidence/source_integrity_final.json).

The frozen-artifact audit passed at20:36:14 UTC: all138 manifest entries matched. The lossless directed-search ledger decompressed to118,975,324 bytes and its recorded SHA256. Exact results: [frozen artifact integrity](evidence/frozen_artifact_integrity_final.json). These are byte-integrity checks, not new mathematical testing.

The [documentation integrity receipt](evidence/document_integrity_final.json) and [full-file SHA256 manifest — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) accompany the private checkpoint. The manifest excludes itself, Git internals and ignored caches. The final Git tag attests the commit, clean worktree, zero remotes and actual completion time; nothing was pushed. Stopped-work observations are in [the agent receipt](evidence/stopped_agents.json) and [the native-process receipt](evidence/stopped_native_jobs.json).

## Incomplete evidence and operational qualifications

- The early random apex probe retained its generator, seed and aggregate, but not the individual identities of397 UNKNOWN timeouts. They remain unknown. The later directed experiment retains all393,643 literal attempts, including its single UNKNOWN.
- This was not a complete independent audit of TUZA-17, its Ramsey catalogue dependency, earlier historical Lean developments or every published theorem. Primary-literature read scopes are explicit. The threshold theorem was imported only for a proposed reduction's terminal implication; its full proof was not audited.
- The first clock tool followed an initial source read in the same tool invocation, contrary to the mission's strict clock-before-reading order. This is disclosed in [the original clock record](evidence/clock.json); the time was never reset.
- Two initial automatic sandbox approval reviews timed out. The owner explicitly approved access. Some independent outputs required temporary staging and were subsequently transferred into the canonical workspace with matching SHA256 hashes; all material final packages are present.
- Astra/Ultra was requested, and delegates were configured accordingly where exposed. Actual serving model/effort metadata was not independently available. No stronger runtime attestation is claimed.
- No toolchain installation, server computation, historical-worktree change, external message or publication was performed. No further research run or publication is authorized by this receipt.

To inspect the final commit and execution timestamp without modifying this private repository:

```sh
git rev-parse 'tuza18-final-checkpoint^{}'
git for-each-ref --format='%(contents)' refs/tags/tuza18-final-checkpoint
git status --porcelain=v1
git remote
```
