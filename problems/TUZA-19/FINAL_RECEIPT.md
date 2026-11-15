> Historical mission record, 14–15 November 2026. Original proof/status boundaries remain; publication review and fresh execution are recorded separately in [publication evidence](../../verification/tuza-16-19/README.md). Operational publication restrictions in this record describe the earlier mission.

# TUZA-19 final private receipt

**Outcome: no proof or counterexample for unrestricted Tuza was obtained.** The authorized research run is closed with the exact positive results, failed mechanisms and unresolved gates recorded in [REPORT.md](REPORT.md) and [STATUS_MATRIX.md](STATUS_MATRIX.md).

## Clock and checkpoint identity

- Original start: **2026-11-15T01:53:58Z**.
- Research and candidate-verification cutoff: **2026-11-15T09:23:58Z**.
- Hard deadline: **2026-11-15T09:53:58Z**.
- This tracked receipt was prepared: **2026-11-15T09:36:06.283122+00:00**, elapsed **7h 42m 8s**. Final commit verification time and elapsed seconds are recorded separately below.
- Workspace: `https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-19`.
- Private branch: `codex/tuza19`; annotated final tag: **`tuza19-final-checkpoint`**.

The final commit is the commit containing this receipt and targeted by that annotated tag. Resolve its full identity with `git rev-parse 'tuza19-final-checkpoint^{commit}'`. A file cannot contain the hash of its own containing commit without circularity; the observed full commit, tag object, clean status, zero remotes, final UTC and elapsed seconds are therefore written after committing to `.git/tuza19-final-receipt.json` and returned directly to the owner. That operational receipt does not modify the committed worktree.

The original [clock record — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) is intentionally immutable, including its initial `status: active`; this closeout supersedes that status without changing a dependency hashed by fresh reviews. No research time was restarted.

## Strongest findings and their limits

1. An ordinary quantitative equivalence reduces Tuza to graphs simultaneously having almost linearly many universal vertices, almost linear minimum triangle codegree, TF, and non-WKE link components. For every fixed `1/2<a<1`, the scale is `n exp(-(log n)^a)`. A corresponding uniform subexponential additive-error estimate implies exact Tuza. This transports a hypothetical violation; it does not prove Tuza on the restricted class.
2. An ordinary existence construction on that same strengthened class satisfies `tau<2nu<pi`, with `tau/(2nu)` tending to one from below. It defeats the odd-cover shortcut. Two-edge packing resilience is unestablished, so H-O2 remains open; no Tuza counterexample is asserted.
3. Every graph with at most four degree-at-least-three vertices is WKE. Ordinary reductions yield heavy-edge five-core localization. Its **5,375-record finite kernel**, in 128 separate Lean modules plus separate domain/schedule results, is formally checked. The all-size reductions and core theorem are not formalized, and no accepted monolithic aggregate exists.
4. Agreement of first marginals across every fixed-size star packing polytope and every graph-clique packing polytope still permits an additive packing gap. This is not a failure of a hierarchy requiring joint moments or a counterexample to a factor-two cover theorem.

The report also retains square-cell and line-graph theorems, chain plateau pivots, literal auxiliary counterexamples, solver-only rainbow kernels, and exact remaining gates. No complete unrestricted route emerged.

## Verification and material limitations

Strongest ordinary proofs received fresh AI reconstruction of frozen statements and dependencies. This is not independent human review, and exact originality is unresolved. Literal computations, solver-only UNSAT, ordinary arguments and Lean declarations are labeled separately throughout.

The accepted finite Lean checks use Lean 4.33.1, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`, installed Std/core and no Mathlib imports, `native_decide`, new axioms or admissions in accepted files. Certificate theorems have no axioms; separate domain/list lemmas use the recorded standard Lean axioms. The accepted peak RSS is **1,781,858,304 bytes**. Failed aggregate/normalization attempts reached **4,340,842,496 bytes**, despite Lean memory settings no greater than 2,200 MiB. Those settings were not an OS hard RSS cap. Failures are preserved and excluded; no cap increase was made. [Formal scope and receipts](formal/four_branch_wke/README.md).

The original host and root checks passed before mathematics/workspace creation. Mathematical execution remained local to the owner's Darwin host. Requested Astra/Ultra controls were recorded; actual serving metadata was not independently exposed. There was no public update, push, author contact, external execution or new execution environment.

## Sources and preservation

[Source preservation — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) reports **PASS for 664 file comparisons and four historical repositories**, with their HEAD/status/remotes unchanged from the initial observations:

| Source | Frozen commit |
|---|---|
| TUZA-18 | `57708a8413929012d9ca8d15b0f925b3ef6b51e8` |
| TUZA-17 | `aa0de600d7fb0cfe4134e82ad056f02e4c465eb6` |
| TUZA-16 | `405e41c1eb24739405f4b06d8cdcd5715bb9fd13` |
| Published baseline | `d4029fbafc3dffc250b50ed237ad81c3206cd1a0` |

The November 15 replay is the common-vertex replay, not a separately confirmed connected-chain reconstruction. As authorized by the owner, chain work used the frozen TUZA-18 proof and recorded N=3 evidence, plus the TUZA-19 continuation. This source gap was not silently filled.

[ARTIFACTS_SHA256.json — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) hashes every intended tracked file except itself, excluding Git metadata and ignored caches. Its own SHA256 is included in the annotated tag and postcommit receipt. [Closeout integrity — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) records file/link checks and the observed research-file modification boundary; these are archival checks, not new mathematical verification. The prior [process snapshot — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) found no process with W in its command line; a final snapshot is included in closeout integrity. This limited scan is combined with agent completion reports, not represented as a full-host process audit.

Research and candidate verification ended by the original cutoff. All research/review workers reported completion or were interrupted; completed documentation workers made no mathematical calls. No mathematical checker, SAT solver, Lean compilation or literature search was run during closeout. Only documentation, links, preservation hashes and the private checkpoint followed.

## Delivery and later work

- [Main report](REPORT.md)
- [Full status matrix](STATUS_MATRIX.md)
- [Reproduction commands and trust boundaries](REPRODUCTION.md)
- [Private publication evidence index — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json)
- [Research log](RESEARCH_LOG.md)

The reproduction guide documents overwritten outputs, absolute paths and expired clock guards. Future execution needs a new authorized private copy and its own recorded clock. Human specialist review, exact attribution checks, further formalization and any combined GitHub/paper work remain for a later mission.
