# A113010: decimal digit-count fixed points

**Status: UNSOLVED. The original conjecture remains unresolved.** This archive contains intermediate results and failed approaches, not a proof that only 1 and 32 exist.

## Original question

For a nonnegative integer `n`, let `d(n)` be its decimal digit count and `S(n)` its decimal digit sum. Are there fixed points of

$$
n=d(n)^{S(n)}
$$

other than **1 and 32**? For 32, the count is two and the sum is five, so `2^5=32`.

Sources: [OEIS A113010](https://oeis.org/A113010) and the [frozen Formal Conjectures challenge](https://github.com/google-deepmind/formal-conjectures/blob/f153efa8fdc078131e214547781d631e2d257daf/FormalConjectures/OEIS/113010.lean). The [retained original file](reference/113010.lean) contains an admitted question and is not imported into the working proof package. The [historical prior-attempt check](research-notes/PREFLIGHT_REPORT.md) found no occurrence in the inspected public Nexus attempted/results sets; this is a limited source check, not a worldwide novelty claim or a new literature search during publication.

The unchanged [definition](lean/A113010/Definition.lean) is:

```lean
def a (n : ℕ) : ℕ :=
  ((10).digits n).length ^ (List.sum ((10).digits n))
```

Under the frozen `Nat.digits` convention, zero has an empty digit list and `a 0 = 0^0 = 1`, so zero is not fixed. [Targets.lean](lean/A113010/Targets.lean) preserves both the existence of another point and its negation as proposition definitions. Neither is an assumed theorem.

## Research timeline and model record

| Session | Actual duration, 2026-10-27 UTC | Method and outcome |
|---|---|---|
| [Session 01](reports/SESSION_01_REPORT.md) | 08:45:56–14:46:45; 6 h 0 m 49 s | Mathematical reductions, Lean, bounded computation, and critical review. MODERATE PROGRESS; redirect. |
| [Session 02](reports/SESSION_02_ULTRA_REPORT.md) | 15:27:41–15:55:09; 27 m 28 s within a 30-minute maximum | Three independent researchers followed by a fresh critic. PARTIAL_INSIGHT; zero credible global routes. |

Session 02's four subagents were explicitly configured through accepted tool calls as `gpt-6-astra` with `ultra` reasoning and fresh context. The principal runtime model/mode was not independently exposed. Session 01 was framed as an Astra-led investigation, but its actual research-turn model/mode is not independently established by the public artifacts; an earlier setup model check is not evidence of the later research configuration. No private application-session records are published.

Provenance identifiers: trusted infrastructure `7f7e4c8e7298b811b1d8e68bf83df45ecf673445`; Session 01 checkpoint `4efdf388099e1fea5542c2f1383c945c78a1e6e6`; verified proof-source snapshot `9fae4ce09c9a254cb679b1ebd6611b4c2bd13f70`; Session 02 checkpoint `aeded602f282ec31689c0b35af0617d9289b442f`. These identify the private source snapshots; their Git history is not published. The [publication manifest](reproduction/PUBLICATION_MANIFEST.md) maps original files to sanitized copies.

## Session 01: formally checked intermediate results

The final in-session run passed 110 research-module builds, 52 named transitive axiom audits, and 110 module-only `leanchecker` replays. There are 116 working Lean source files in total, including definitions, targets, smoke tests, and audit modules. Their bytes are preserved.

| Result | Scope and source |
|---|---|
| Finite classification | Only 1 and 32 when `d(n)<=10004`, equivalently `n<10^10004`: [StrongSparsity.lean](lean/A113010/StrongSparsity.lean). |
| Digit-sum classification | Only 1 and 32 when `S(n)<=2500`, at any size: [SuffixDigitSum10000.lean](lean/A113010/SuffixDigitSum10000.lean). |
| Multiplicity | At most two fixed points for each prescribed digit sum: [InverseLength.lean](lean/A113010/InverseLength.lean); at most one outside residue four modulo eighteen: [AdjacentResidues.lean](lean/A113010/AdjacentResidues.lean). |
| Further restrictions | An additional point has at least 10005 digits, sum at least 2501, at least 278 nonzero digits, and more than three quarters zero digits. Normalization, modular barriers, and length restrictions are also preserved. |

Only `propext`, `Classical.choice`, and `Quot.sound` are allowed by the audit scripts. Successful in-session Lean checks are **not independent external proof verification**. Module-only replay uses the imported environment; it does not independently reconstruct the provenance of every cached dependency artifact. See the [historical verification manifest](reproduction/evidence/SESSION_01_FINAL_VERIFIED_SNAPSHOT.json) and [Lean status](research-notes/LEAN_STATUS.md).

## Finite computational evidence

Searches found no additional fixed point among candidates with at most **5,000,000 decimal digits**. The combined 802,794 candidates were exact or conservatively enclosed exponent candidates, including 89,832 modulo-nine survivors. This is not the formal Lean bound. The larger scans used outward-rounded MPFR intervals and exact GMP suffix arithmetic.

Selected CPython integer checks independently checked eleven large cases and matched six suffix strings. This was sampled reproduction, not a second exhaustive search or an independent proof kernel. Two large arithmetic paths for a normalized case both used GMP and are not independent libraries. Detailed outputs and commands are in [experiments](experiments/README.md).

## Session 02: informal observations

Both statements have self-contained mathematical arguments and a separate agent's [critical review](research-notes/SESSION_02_CRITIC.md), but **were not formalized in Lean**:

1. For `T,s>=1` and `k=10^T+1`, the least positive multiple of `k^s` with decimal digit sum two is `10^(T*k^(s-1))+1`. The proof determines `ord_(k^s)(10)=2*T*k^(s-1)`. Its enormous length shows why unrestricted minimum-weight arguments omit an essential constraint.
2. For a polynomial `P` with nonnegative integer coefficients, `P(1)<=10` and `(10^T+1)|P(10)` imply `(X^T+1)|P(X)` in `Z[X]`. Weight eleven supplies a sharp counterexample. Numerical divisibility to higher powers still does not force symbolic multiplicity.

These are observations retained during this investigation, **not externally established novel discoveries**. The [full argument](research-notes/SESSION_02_B_CONNECTIONS.md), [counterexamples](research-notes/SESSION_02_C_ALTERNATIVES.md), and [small exact diagnostic script](experiments/SESSION_02_DIAGNOSTICS.py) are included.

## What remains unproved

There is no uniform exclusion of `S(k^s)=s` on the required digit-length curve, and no additional fixed point has been constructed. Length and modular conditions have unbounded survivors. Fixed-support, naive block-support, normalization-only, and monotonicity proposals do not close the problem. Session 02's small-weight lemmas do not reach the unresolved growing digit budget.

Future work suggestions are speculative: identify a new estimate controlling the exact power together with its digit span and growing weight, or a descent/construction that preserves both equations. Merely renaming this estimate or extending finite enumeration is not a demonstrated solution route. The [approach archive](research-notes/APPROACHES.md), [redirect memo](research-notes/REDIRECT_RESEARCH_MEMO.md), and [late conceptual review](research-notes/LATE_CONCEPTUAL_REVIEW.md) record the obstacles.

## Reproduction and verification limits

The publication audit successfully repeated all 110 research builds, 52 named audits, and 110 module-only replays in a fresh project using the existing pinned compiler and official dependency caches. It also regenerated 97 certificate files byte-for-byte. These checks are not independent external proof verification.

Start with [reproduction/README.md](reproduction/README.md), which gives pinned setup commands, source checks, formal verification, publication-test results, and limitations. Numerical reproduction is described separately in [experiments/README.md](experiments/README.md). No access to the original environment is needed to follow these instructions.

The public copy retains every mathematical Lean source, both original targets, the nine dependency pins, certificate generators, research arguments, finite outputs, and critical reviews. Raw operational logs are represented by structured evidence extracts. Private runtime launchers, installation state, binary backups, caches, and application-session metadata are excluded. The manifest lists each source file's disposition and hashes.
