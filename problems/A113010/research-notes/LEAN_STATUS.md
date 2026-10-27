> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Lean and verification status

Setup date: 2026-10-27 (Europe/Oslo).

- Lean: 4.33.1, compiler commit 819816b2e0a3bf405af45ae5c7af2491d8f5bee6.
- Lake: 5.0.0-src+819816b, bundled with Lean 4.33.1.
- Mathlib: v4.33.1 at 0df444a360eaa60ab8c11dca51a86af692955474.
- All nine lockfile dependencies checked against their actual Git revisions.
- `lake exe cache get`: all 8,690 available artifacts downloaded and decompressed.
- No full Mathlib source rebuild; the cache downloader and working modules were built.
- Python exploration runtime: system Python 3.12.3, no extra packages installed.

## Requested checks

`scripts/verify.sh` passes. See `SETUP_VERIFICATION.log` for the captured result.

- `OeisA113010.a_0 : a 0 = 1`: proved with `by decide`.
- `OeisA113010.a_1 : a 1 = 1`: proved with `by decide`.
- `OeisA113010.a_32 : a 32 = 32`: proved with `by decide`.
- Each reports exactly `[propext, Classical.choice, Quot.sound]`.
- No `sorryAx` or additional axiom appears in these theorem dependencies.
- An intentionally false smoke equality returned a clear compiler error.
- Rewriting that temporary file to the correct equality and retesting succeeded.
- Original challenge, working definition and alternative targets remain frozen.
- Neither research alternative is proved. See the final Session 01 status and checkpoint report below.

## Available final verification

For a future parameter-free theorem, run:

    scripts/verify-final.sh A113010.Solution OeisA113010.result existence

Use `nonexistence` for the other frozen target. The verifier first checks the
frozen files and dependency pins, builds the working project, builds the solution
module, then compiles a fresh `example : FROZEN_TARGET := THEOREM` and audits the
theorem's transitive axiom set. It rejects `sorryAx`, custom unproved axioms and
any theorem that does not supply a proof of the exact frozen proposition without
extra hypotheses. This uses the installed Lean kernel and trusted Mathlib cache.
It is not an external independent-kernel or adversarial sandbox verification.

## Comparator assessment

The installed Lake 4.33.1 environment has no integrated `lake comparator` or
`lake check` command. Those commands were added in Lean 4.35.0:
https://lean-lang.org/doc/reference/latest/releases/v4.35.0/

Standalone Comparator has a `v4.33.0` tag at
`3927ad383f208ae977c340a91c48ac9b497d2097`; that tag's own toolchain is 4.33.0.
Compatibility with this pinned 4.33.1 environment has not been established.
Comparator, lean4export, landrun, Go and Rust are not installed. Comparator's
documented method additionally needs a compatible lean4export and working
landrun sandbox; nanoda is optional. No Comparator verification is claimed.
Source: https://github.com/leanprover/comparator/tree/3927ad383f208ae977c340a91c48ac9b497d2097

Do not upgrade this project's dependencies merely to obtain integrated checking.
Before accepting a future claimed resolution, consider a separate clean verifier
with a tested compatible external kernel/exporter and inspect the exact statement.

## Final Session 01 mathematical and verification status

Neither frozen target is proved. All110 completed research modules passed warning-free builds and module-only leanchecker replay;52 named public transitive axiom audits passed, allowing onlypropext,Classical.choice,Quot.sound. No unfinished helper goals or incomplete drafts remain.

Strongest formal bounds: only1 or32 when d(n)<=10004, or equivalently n<10^10004; at any size only1 or32 if S(n)<=2500. An additional point requires S>=2501,at least278 nonzero digits,d>=10005,and3*d<4*zeroDigitCount. The general scale inequality is r*S<d whenever10^r<=d.

Structural modules prove exact normalization, unique exponent per length for k>=10, unique normalized scale for fixed core/exponent, unbounded length/mod9 survivors, compatible fixed-modulus witnesses, known polynomial support bounds, and at most two fixed points per digit sum (at most one outside s=4mod18). InverseLengthSharpening adds the successor factor3 and gap-two exclusion already at s<=k. Its six public statements are in LEAN_INVERSE_LENGTH_SHARPENING_HANDOFF.md. The complete small-s table and global one-or-two length-base wrapper for s>=7 remain reviewed informal deductions.

The final integrated run from proof-source revision9fae4ce09c9a254cb679b1ebd6611b4c2bd13f70 passed in11:10.39,peakRSS2,295,148KiB,no swaps,exit0,finishing2026-10-27T14:35:44.762989UTC. Logs:SESSION_01_RESEARCH_VERIFICATION_FINAL.*. Exact inventory,source/log hashes,frozen bytes,and nine pinned clean tracked dependency trees:SESSION_01_FINAL_VERIFIED_SNAPSHOT.json. Earlier109-module and nine-module logs remain historical. Baseline infrastructure passed separately in6.63s; its sources are unchanged.

The proof chain is finite certificates through10000,a separate10001 suffix exclusion,and analytic consequences through10004. Numerical coverage through5000000digits is separate and not part of this Lean proof. The final checker replays selected modules against imported environments; it is not an external kernel, full imported-source replay, or clean-checkout final-target verification.

Exact outstanding propositions,without extra hypotheses:

    ∃ n : ℕ, a n = n ∧ n ≠ 1 ∧ n ≠ 32
    ¬ ∃ n : ℕ, a n = n ∧ n ≠ 1 ∧ n ≠ 32

Recorded session stop:2026-10-27 14:46:45 UTC. Elapsed:6 hours 0 minutes 49 seconds. See SESSION_01_REPORT.md for assessment,scope,and the requirement for explicit further authorization.

## Checker scope and operational history

At session start the frozen-file/pin check and bundled leanchecker A113010.Smoke replay passed. Default leanchecker replays the selected module against its imported environment; it is not an external independent verifier.

While probing flags at08:48UTC, the principal inadvertently launched --fresh A113010.Smoke, which replays imports too. It was promptly terminated by SIGTERM, exit143, and process inspection confirmed it stopped. No fresh/full replay result is claimed. Use only explicit module replay without --fresh during ordinary research. No dependencies or source artifacts were changed by this correction.



## Session 02 mathematical exploration — 2026-10-27

Outcome: PARTIAL_INSIGHT; no credible new global proof route, no new fixed point or solution candidate. Three independent researchers and a fresh critic used explicitly requested gpt-6-astra/ultra configuration; principal runtime identity was not independently exposed. See SESSION_02_ULTRA_REPORT.md and SESSION_02_CRITIC.md.

Retained informal results: for k=10^T+1, exact order modulo k^s and shortest decimal weight-two multiple; numerical-to-polynomial divisibility for weight<=10, with a sharp weight-eleven counterexample and a weight-two obstruction to multiplicity lifting. Neither reaches the growing weight s>=2501. Tiny exact tests reject broad block-support and filtered inverse-curve monotonicity proposals. No eventual-monotonicity or narrow-survivor-family refutation is claimed.

No new Lean theorem or compilation was produced. Session 01's formal bounds and verification evidence remain unchanged. Recommendation: STOP; further research requires explicit authorization and a concrete new mechanism.
