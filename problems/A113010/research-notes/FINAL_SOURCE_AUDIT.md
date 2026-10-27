> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Final source audit — Session 01

Audit started 2026-10-27 12:18:26 UTC; completed approximately 12:29 UTC, within
the requested 20-minute limit. This was a source-only audit while the principal's
numerical search owned the heavy slot. No Lean build, Lean invocation, kernel
replay, numerical search, generator regeneration, or heavy computation was run.
Only this report was written. No owned subprocess remains after the report.

## Conclusion and actual outstanding issue

No mismatch was found between the published strongest necessary bounds and the
current theorem statements, no accidental extra hypothesis was found in those
statements, and no forbidden proof mechanism or import was found in the working
Lean project. The current research inventory and named axiom-audit manifest are
internally consistent.

This is not a new kernel-verification result or an unconditional endorsement of
every proof artifact. The expanded consolidated runtime verification remains
pending. The existing `notes/RESEARCH_VERIFICATION.log` contains a successful run
for only nine earlier modules, not the current 107-module manifest. Its trailing
PASS line must not be cited as evidence that the expanded verifier has run.
Current STATE and LEAN_STATUS already make this distinction correctly. The
appropriate remaining verification action is the planned consolidated run after
the numerical search releases the heavy slot, retaining its new output.

Neither frozen target has a proof. None of the audited necessary conditions,
finite certificates, residue witnesses, or polynomial lemmas changes that fact.

## Statement fidelity and hypotheses

Every strongest additional-fixed-point theorem has precisely the ordinary
hypotheses `n : ℕ`, `a n = n`, `n ≠ 1`, and `n ≠ 32`. There is no residual bound on
n, assumed suffix inequality, conjecture, existence target, or extra arithmetic
hypothesis in those public statements.

| Published claim | Exact theorem and source | Audit result |
|---|---|---|
| Digit sum at least 2501 | `additional_fixedPoint_digitSum_ge_2501`, SuffixDigitSum10000.lean:55, conclusion `2501 ≤ digitSum n` | Matches |
| At least 278 nonzero digits | `additional_fixedPoint_nonzeroDigits_ge_278`, same file:62 | Matches |
| At least 10005 digits | `additional_fixedPoint_digitCount_ge_10005`, same file:70 | Matches |
| Value at least 10^10004 | `additional_fixedPoint_ge_ten_pow_10004`, same file:83, conclusion `10 ^ 10004 ≤ n` | Matches |
| Strictly more than three quarters zero | `additional_fixedPoint_zero_three_quarters`, StrongSparsity.lean:7, conclusion `3 * digitCount n < 4 * zeroDigitCount n` | Matches, strict inequality |
| Only 1 or 32 through 10004 digits | `fixed_of_digitCount_le_10004`, StrongSparsity.lean:15 | Matches the hypothesis `digitCount n ≤ 10004` |
| Only 1 or 32 below 10^10004 | `fixed_below_ten_pow_10004`, StrongSparsity.lean:24 | Matches the strict input bound `n < 10 ^ 10004` |
| Only 1 or 32 when digit sum ≤2500, at any size | `fixed_of_digitSum_le_2500`, SuffixDigitSum10000.lean | Matches; no size restriction |

The counts use the canonical `Nat.digits 10 n` list, with no leading-zero
padding. `nonzeroDigitCount` and `zeroDigitCount` count the indicated entries;
`digitCount_partition` connects them to total length. The strict three-quarter
statement follows from nonzeroDigitCount≤digitSum, the r=4 scale inequality,
and the partition identity. The lower bound of 278 nonzero digits is compatible
with that zero majority and is not a contradiction.

The proof chain has the advertised scope:

1. Basic reductions preserve the frozen function and establish positivity,
   length bounds, digit sum, and the exact power equation.
2. Finite handles the range through 1000; suffix chunks extend the independently
   checked exponent intervals through 10000.
3. Exponent uniqueness and the separately proved suffix exclusion for
   10001^2500 exclude the entire 10001-digit case.
4. The exact seed `10002^2500 < 10^10001` and power_exclusion_above handle every
   larger length for digit sums at most 2500.
5. The r=4 sparsity inequality converts S≥2501 into length≥10005 and then
   n≥10^10004. StrongSparsity derives the equivalent finite classifications and
   the strict zero majority.

Thus lengths beyond 10000 in the final advertised bound are analytic
consequences plus the separately certified 10001 case, not an extra enumeration.
The public classification results are implications from being fixed; the
baseline Smoke.lean also contains direct `by decide` proofs that 1 and 32 are
indeed fixed points. Their baseline verification is documented separately.

Supporting statements also retain their necessary scope: the modular barrier
constructs an integer with the desired sum/length/residue, without claiming it
is the power; the polynomial power-support theorem assumes an algebraically
closed characteristic-zero field and at least two support entries. These do not
supply a hidden solution of either target.

## Frozen definitions, imports, and forbidden mechanisms

Observed checks during this audit:

- All eight entries in `reference/frozen-sha256.json` matched current file bytes,
  including Definition.lean, Targets.lean, toolchain, and lock/configuration files.
- All nine installed dependency Git HEAD revisions matched the locked revisions.
- The only working-project declaration of `a` is the frozen definition in
  Definition.lean. Targets.lean contains Prop-valued definitions of the two
  alternatives, not assumed or admitted proofs.
- A comment-stripped scan of the working Lean module sources found no `sorry`,
  `sorryAx`, `admit`, `native_decide`, `ofReduceBool`, `ofReduceNat`, custom axiom,
  unsafe declaration, external implementation hook, local elaborator execution,
  or kernel-trust override. Manual inspection of the main chain agreed.
- No working module imports the admitted reference challenge, FormalConjectures,
  or reference/113010.lean. The original admitted reference is intentionally
  preserved outside the working import graph; this report does not claim that
  the entire reference/dependency tree contains no admissions.
- Ordinary decide, norm_num, and omega are used as proof-producing/kernel-checked
  mechanisms. The source does not replace their proof obligations by native_decide.

These are lexical/source and metadata checks, not a full adversarial inspection
of all imported Mathlib sources, compiled artifacts, or the Lean implementation.

## Inventory and verifier review

`verify-research.sh` currently contains 107 distinct existing research modules.
For every import edge whose endpoints are in that list, the dependency appears
before its importer. All 107 modules belong to ResearchAudit's transitive project
import closure. There are no missing, duplicate, or out-of-order listed modules.

The only working module files outside the explicit research build list are:
Definition, Targets, Smoke, AxiomAudit, and ResearchAudit. This is consistent with
the current scope: Definition is an imported frozen dependency; ResearchAudit is
executed directly for its print commands; Targets/Smoke/AxiomAudit are baseline
infrastructure. The root A113010.lean imports Targets and Smoke, not a purported
solution.

All 35 named theorem entries in the shell verifier match the 35 `#print axioms`
commands in ResearchAudit.lean, in the same order. Every strongest published
bound above is covered. The axiom checker rejects missing reports, any sorryAx,
and any axiom outside propext, Classical.choice, and Quot.sound. Shell pipefail
preserves a failing Lean audit exit status rather than merely accepting the
Python filter's exit status.

The verifier builds the listed project modules in dependency order with --wfail,
then checks transitive axioms and replays every listed module without --fresh.
It retains diagnostics on build failure and preserves a 20 GiB free-space check.
Given the present topological list and the installed dependency cache, project
builds are serialized as intended. LEAN_NUM_THREADS=1 alone would not guarantee
serial building of arbitrary missing dependency graphs; the explicit list and
existing cache matter.

All 107 listed project .olean files exist and none has an older modification
time than its source. This is only a stale-source sanity check, not proof that
the artifacts have the correct contents or a substitute for replay.

## Generator reproducibility assumptions

The documented reproduction is two staged runs with chunk size 100:

```sh
python3 experiments/generate_suffix_finite_lean.py --first 1001 --last 2000 --chunk-size 100
python3 experiments/generate_suffix_finite_lean.py --first 2001 --last 10000 --chunk-size 100
```

The second run assumes the existing first-stage aggregate and helpers. Run from
the repository root with the existing pinned proof environment. The generator
does not update ResearchAudit or the explicit verifier module list; alternate
ranges or chunk sizes require corresponding manifest maintenance. The script
can write directly to the output directory, so reproduction should preserve the
current checked snapshot before changing parameters. The time/RSS limits used
for the completed extension were in the orchestration pass, not enforced by the
generator itself.

No whole-range regeneration was executed during this source-only audit. The
following static checks were performed instead:

- The CORE and NORMALIZED_CORE literal templates exactly match their source files.
- The complete literal returned by consequence_10000 exactly matches the current
  SuffixDigitSum10000.lean; its 10001-digit theorem header occurs once.
- The 90 chunk modules cover exactly k=1001..10000, with no gaps or overlaps.
- Their 9000 private certificate indices cover precisely that same range, and
  every label agrees with its ExponentCertificate base argument.
- Finite.lean has exactly the private indices 3..1000, with the lower digit-count
  cases handled by Basic.
- There are 264 declared suffix certificates across both stages, with maximum
  width 682. Every suffix inequality uses the same exponent as its threshold.

Float log10 only seeds the exponent guess. The generator's exact integer loops
correct both endpoints, and the generated Lean certificates independently prove
the endpoint inequalities. Suffix residues are explicit repeated-squaring
witnesses checked in Lean; they are not accepted on Python's authority. A wrong
witness or incomplete interval split should fail proof checking, not weaken the
public theorem. The source uses assertions for input/sanity conditions; the
observed Python optimize flag was 0. The recorded finite ranges are the supported
reproduction cases, not a guarantee for arbitrary large CLI inputs or all Python
resource settings.

## Remaining verification boundaries

1. The expanded 107-module consolidated run is pending; the existing nine-module
   PASS log is historical. This is the actual remaining verification issue.
2. `verify_freeze.py` compares dependency Git HEADs but does not itself establish
   dependency working-tree cleanliness or provenance of every cached .olean.
   No altered dependency was found or alleged here; those aspects were not audited.
3. Individual module replay uses the installed Lean kernel and imported
   environment. It is not an independent external-kernel or clean-room proof
   certification. Current documentation correctly avoids that stronger claim.
4. This audit reviewed sources and existing evidence, not a new runtime axiom
   dump. It found no extra axiom mechanism, but actual current axiom allowlists
   should still be established by the planned consolidated invocation.

No mathematical source correction is recommended from the checks performed.
No broader numerical or formal range was attempted during this audit.

## Audited snapshot

SHA-256 values captured during the audit:

| File | SHA-256 |
|---|---|
| scripts/verify-research.sh | 17c6893629ae426628bcc9718514a17536028beb5356ffe25532c1e66a195c60 |
| scripts/check_axioms.py | 75557dfeab86cc4f4760a1ae6b721c5ca3cd11a8455e97ef9a39c899406d7aa8 |
| scripts/verify_freeze.py | dc6d4399a5a58d2f2f8e543bb143b9b16cea69ef563d133fe6762c2c541e589a |
| proof/A113010/ResearchAudit.lean | c3d5f4385d722ac15cf44a1e818fa46f14d40a988d202abd67041eb1583468f2 |
| proof/A113010/StrongSparsity.lean | fd9924c736c048c975c431adf82623acc3b7959454d7ef9421f4c16a151a3a64 |
| proof/A113010/SuffixDigitSum10000.lean | 628a3c9c615c7ca32f8cfeb4c35a1d0e746d573c303885eb6f1a7cd469faaea0 |
| experiments/generate_suffix_finite_lean.py | a59b4864bac8a29bc972055aaa8bd8d3f25c4b3d41f8e965ea183382eb94b86d |

Ordered 107-source snapshot fingerprint:
`fc8be683aa731510177a00ae72d517473e1fa7c1d51f83bb07a941976fce8403`.
This is SHA-256 of, for each verifier module in order, UTF-8 module name, a NUL
byte, and the binary SHA-256 digest of that module's source bytes.
