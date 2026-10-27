> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# A113010 — Session 01 checkpoint report

**Session 01 closed. Further research requires explicit user authorization.**

**Outcome:** Neither frozen target is proved. No additional fixed point or complete solution candidate was found.

**Assessment: MODERATE PROGRESS. Recommendation: REDIRECT.**

The session established useful exact reductions and formal restrictions, including a verified finite exclusion and a bound of two fixed points per prescribed digit sum. It did not establish a uniform way to control decimal digit sums of the remaining powers. The obstacle is mathematical, not a few unfinished Lean goals.

## Authorization, time, and preserved statement

- Actual UTC start: **2026-10-27 08:45:56 UTC**.
- Six-hour checkpoint: **2026-10-27 14:45:56 UTC**.
- Actual research stop: **2026-10-27 14:46:45 UTC**.
- Actual elapsed duration: **6 hours 0 minutes 49 seconds**.
- Process/agent status at handoff: **No research subprocesses remain active; both subagents are complete. Final remote process inspection found no workspace process other than the closure observer and its ancestors.**.
- Canonical workspace: `the original research workspace`.
- Trusted initial infrastructure: `7f7e4c8e7298b811b1d8e68bf83df45ecf673445`.
- Verified final proof-source revision: `9fae4ce09c9a254cb679b1ebd6611b4c2bd13f70`. Later checkpoint commits preserve notes and evidence; the verified proof sources are unchanged unless explicitly recorded.

The frozen definition remains exactly:

```lean
def a (n : ℕ) : ℕ :=
  ((10).digits n).length ^ (List.sum ((10).digits n))
```

No changes were made to the definition, target propositions, pinned Lean version, or dependency lock. The upstream admitted reference was not imported into the working proofs. There was no GitHub push, runtime reconfiguration, or modification of unrelated services.

## A. Mathematical progress

Write `d(n)` for decimal digit count and `S(n)` for decimal digit sum, with the exact `Nat.digits` conventions of the frozen definition. Every fixed point is positive. Setting `k=d(n)` and `s=S(n)` gives

    n = k^s,    10^(k-1) <= k^s < 10^k,    S(k^s)=s.

For k>=10 there is at most one exponent meeting the length interval. The following statements have completed Lean proofs, warning-free builds, transitive axiom audits, and module-only kernel replay.

| Formal result | Exact scope | Main source |
|---|---|---|
| Finite classification | The only fixed points with d(n)<=10004, equivalently n<10^10004, are 1 and 32 | StrongSparsity.lean |
| Digit-sum classification | At any size, S(n)<=2500 leaves only 1 and 32 | SuffixDigitSum10000.lean |
| Necessary bounds | An additional point has d(n)>=10005, S(n)>=2501, and at least 278 nonzero digits | SuffixDigitSum10000.lean |
| Zero majority | Strictly more than three quarters of its digits are zero:3*d(n)<4*zeroDigitCount(n) | StrongSparsity.lean |
| General sparsity | r*S(n)<d(n) whenever10^r<=d(n), for every fixed point satisfying that hypothesis | Sparsity.lean |
| Sharper length restriction | A compatible base k>=s excludes all bases at least k+2 | InverseLengthSharpening.lean |
| Inverse multiplicity | Each prescribed digit sum occurs at at most two fixed points | InverseLength.lean |
| Residue refinement | At most one fixed point for each sum not congruent to4 modulo18 | AdjacentResidues.lean |

The finite proof does not enumerate all integers below its bound. It reduces to possible powers and checks exact exponent intervals and short suffix certificates. Generated certificates cover digit counts through 10000. A separate certificate proves

    S(10001^2500 mod 10^660) = 3030 > 2500.

The exact seed10002^2500<10^10001, a uniform propagation inequality, and the scale inequality then yield the stronger consequences through 10004 digits. No native_decide or compiler-trusted arithmetic was used as proof evidence.

The structural results are useful beyond that finite bound:

1. **Trailing-zero normalization.** If k=10^t*u with u>0, the exact fixed-point equations become S(u^s)=s and t*s+d(u^s)=10^t*u. Pure powers10^t with t>0 cannot be digit-count bases of fixed points; the base1=10^0 is retained for the known point1. For fixed u>=2 and s, at most one t satisfies the length equation.
2. **Inverse length equation.** Every natural s>=4 has some k>=2 satisfying d(k^s)=k. In the region k>=s, all compatible bases lie in two consecutive integers (the original module established the narrower region k>=2s). The range hypothesis matters: s=6 has several smaller compatible bases. Every hypothetical additional fixed point lies in the required region because k>4s.
3. **Exceptional adjacent residues.** For positive s, both adjacent bases pass k^s=s(mod9) exactly when s=4(mod18) and the smaller base is4(mod9). This yields the multiplicity refinement, but not existence or finiteness. For example, s=58 and bases 121 and 122 satisfy exact length and modulo9; their actual digit sums are 472 and 526, so neither is fixed.
4. **Unbounded necessary-condition survivors.** A constructive family passes exact length and modulo9, even with S(k)=2 and gcd(k,10)=1. Thus those filters cannot finish the problem. A separate theorem constructs integers with prescribed compatible length, sum, and residue modulo any fixed modulus; it does not claim those integers equal the required power.
5. **Polynomial support.** A known characteristic-zero sparse-root multiplicity bound, and support(P^s)>=s+1 for nonmonomial P over an algebraically closed characteristic-zero field, were independently formalized. The underlying support result is recorded in Mattarei; no novelty is claimed. It does not control the decimal carries after evaluation.

For the inverse existence result, g(k)=d(k^s) is nondecreasing, starts at g(2)>=2, and eventually lies below k. The first integer crossing therefore has g(k)=k. For the length-pair bound, two successor steps from a compatible k>=s increase the power by a factor less than9, while the next required decimal lower bound increases by10. A propagation inequality excludes every further base. These elementary arguments explain both the continuing existence of length candidates and the restriction to two consecutive bases.

The two-element containment witnesses may be non-fixed, and the sets may be empty. None of these results supplies an additional point. See the individual `LEAN_*_HANDOFF.md` files, `INVERSE_PARAMETERIZATION.md`, and `INVERSE_AND_ADJACENT_FINAL_REVIEW.md` for exact scopes.

### Rigorous informal deductions, separate from Lean results

For a fixed nonmonomial integer polynomial P with positive leading coefficient, put W=sum of absolute coefficients. The reviewed signed-coefficient argument shows that

    M >= s*d(W) + floor(s/9) + 1

implies S(P(10^M)^s)>s. This is an effective separation condition, not a proof for the actual moving parameters. On the length curve for fixed P, s grows exponentially in M divided by M; the condition eventually fails. Details: `QUANTITATIVE_POLYNOMIAL_REVIEW.md`.

The late review gives exact endpoint gaps in the unbounded survivor family and shows why the proportional-gap hypotheses in the inspected sparse-power theorems do not hold there. Its exponential approximation gives only an absolute mantissa error of order1/(T*10^T), not a guaranteed shared decimal prefix because a decimal boundary can intervene. Fixed-order corrections do not recover enough information for the proposed digit-sum exclusion. Details: `LATE_CONCEPTUAL_REVIEW.md`.

A late, independently reviewed elementary sharpening shows that for every s>=7 there are exactly one or two consecutive nontrivial length-compatible bases k>=2. The estimate (1+1/x)^s<3 for x>=s gives a factor less than9 over two successor steps, sufficient to cross below the next required decimal interval. Small exponents have complete base lists: s0..3:none; s4:{2}; s5:{2,3,4}; s6:{2,3,4,5}; s7:{5,6}; s8:{7,8}; s9:{9,10}. Modulo9 removes the excess candidates at s5 and s6, giving an alternative proof of the per-s fixed-point multiplicity bound without the large finite certificate. The factor-three successor estimate, propagation, and gap-two exclusion are now formalized in InverseLengthSharpening.lean. The complete small-exponent lists and the global s>=7 wrapper remain **rigorous informal deductions**, not new Lean declarations. See `INVERSE_LENGTH_SHARPENING_REVIEW.md`.

The final critic review also derives the shape of a hypothetical same-sum pair: consecutive-base powers that are coprime squares, straddling10^k, with ratio<4/3. A modulo9 table and the multiplicity theorem give at most twelve fixed points for each block of eighteen positive digit-sum values. These are informal corollaries, not a global finiteness result or new Lean declarations.

### Numerical evidence, separate from formal proof

The combined completed search covers potential fixed points with at most **5,000,000 decimal digits**, with no additional fixed point. The formal Lean bound remains **10004 digits**.

| Digit-count interval | Exact or conservatively enclosed exponent candidates | Modulo9 survivors | Outcome |
|---|---:|---:|---|
| 2..100000 | 22184 | 2483 | Only 32; 1 handled separately |
| 100001..1000000 | 158877 | 17616 | Every survivor excluded by suffix sum |
| 1000001..5000000 | 621733 | 69733 | Every survivor excluded by suffix sum |
| Combined | 802794 | 89832 | No additional fixed point |

The larger searches used 128-bit MPFR outward enclosures and exact GMP suffix arithmetic. Enclosed intervals may conservatively contain extra candidates; the combined count is not advertised as an exact count of length-compatible powers. The final interval completed in 4385.164 s with peak RSS 21,220 KiB. Records: `scan_modular_100000.json`, `tail_search_1000000.*`, `tail_search_5000000.*`.

An independently implemented CPython arithmetic check completed eleven selected large cases in 33.868 s. Exact Python power inequalities checked the sampled exponent endpoints. Six full suffix strings agreed byte-for-byte with GMP, and all six sums exceeded their exponents. This is a **sampled cross-check**, not a second exhaustive search or Lean verification. Records: `tail_search_independent_large.*`; reviewed source: `tail_search_independent_check.py`.

A separate exact small-core scan checked 2<=u<=9 and 1<=s<=1000000; S(u^s)=s occurred only for (u,s)=(2,5),(2,70). This is finite computational evidence, not an all-exponent theorem. See `core_equalities_1000000.jsonl` and `CORE_AND_SUFFIX_REVIEW.md`.

A rational-log screen of u=2..9 and t=0..100 left two large normalized necessary-condition survivors beyond 32. One, u=6, t=9, s=613612926, was numerically excluded by

    S(6^613612926 mod 10^140000000) = 630014399.

Modular powering and full-power-then-remainder gave identical sums and hashes. Both used GMP; they are different arithmetic paths, not independent kernels. The second, u=4, t=35, s=11235304926103517236760601181978660, remains unresolved. It passes recorded length/modulo9 conditions, but its digit sum is unknown; it is **not an established fixed point or a complete solution candidate**.

Even a best-case explicit digit-sum-excess certificate for this second case would need at least 1248367214011501915195622353553185 decimal positions, since m positions contribute at most 9m. Direct expansion is not a plausible resource upgrade. A compressed symbolic proof could evade that size barrier, but none was found. See `RESOURCE_AND_CERTIFICATE_LIMITS.md`.

## B. Research approaches and their limits

- **Exact reductions, normalization, and finite certificates succeeded** in narrowing the search and establishing strong necessary conditions. They do not provide a bound on s.
- **The reviewed fixed-modulus necessary-condition sieves do not close the argument.** The explicit unbounded length/modulo9 family and the compatible-residue construction show the missing role of the actual power's digits.
- **Sparse-polynomial support succeeded before carrying.** The fixed-polynomial digit argument is nonuniform in s; on the relevant curve its effective separation condition fails.
- **Naive nonzero-digit bounds fail.** For example, 12^11=743008370688 has only nine nonzero digits although the exponent is eleven. Digit weight and number of nonzero digits must not be conflated.
- **Known lower bounds and sparse-power theorems do not currently apply strongly enough.** Fixed-base logarithmic digit-sum bounds are too small. Fixed support or fixed exponent results are not uniform in the moving parameters. BBM Remark 2 is more uniform in term count than an initial reading suggested, but still needs gap/prime-exponent hypotheses absent from the constructed family.
- **Inverse parameterization succeeded structurally.** It permits at most two actual fixed points per prescribed sum, and at most one outside the residue4 modulo18, but still ranges over unboundedly many sums. The formal length-pair theorem requires k>=s; the independently reviewed global wrapper for s>=7 remains informal. It is an alternative exhaustive parameterization, not an infinite exclusion.

The source record is `SOURCES.md`. Primary references include [OEIS A113010](https://oeis.org/A113010), [Radcliffe](https://radcliffe.dev/pdf/digital_sums.pdf), [Bennett–Bugeaud–Mignotte](https://www.numdam.org/item/ASNSP_2013_5_12_4_941_0.pdf), and [Mattarei](https://arxiv.org/abs/math/0512239). Session deductions are distinguished from cited results. No independent novelty review of the partial lemmas has been performed, and no new-discovery priority claim is made.

## C. Principal obstacle

One must exclude S(k^s)=s uniformly on the length curve, including digit-count bases divisible by ten, or construct a genuine equality. The problem is **conceptual**. Completed Lean modules have no remaining proof goals; the exact original targets are still untouched.

The stronger hypothesis H, asserting S(k^s)>s for k>=2,1<=s<=k and10 not dividing k, is unproved. It would imply substantial lower bounds along certain power-of-two exponent subsequences, and would still leave normalized cores u<s. Neither statistical digit models nor further finite enumeration supplies the missing proof. The exact divisor restrictions in the power-of-two implication, the complementary normalized domain, and sufficient statements L0, L, and C are recorded in `REDIRECT_RESEARCH_MEMO.md`. They are hypotheses or conditional deductions, not completed target proofs.

## D. Assessment — MODERATE PROGRESS

The assessment rests on the exact normalization, verified finite and digit-sum bounds, inverse two-point theorem, exceptional residue restriction, and explicit obstructions to several plausible strategies. These are useful intermediate mathematics and reusable checked artifacts. However, no argument controls the unbounded digit-sum parameter, no additional fixed point has been found, and no credible nearly complete proof remains to formalize. The number of files, search size, and compiler activity are not evidence of a route to a solution.

## E. Recommended next action — REDIRECT

Continue only after reconsidering the mathematical approach. A future session should first identify and critically test a length-sensitive carry or power-structure statement that covers the normalized u<s region. As a first diagnostic question, test whether one can prove S((10^T+1)^(10^T/T))>10^T/T uniformly for T=4*10^j, j>=1. Every member already passes length and modulo9. This family lies in the normalized u>=s domain and does not itself cover the complementary u<s gap. A proof would cover only this subfamily; equality would give a fixed point, whereas a strict-inequality counterexample with smaller sum would only refute that proposed route. The existing stronger hypothesis is not an established lemma, and enlarging the finite search alone would not resolve the question. The unresolved huge normalized case is a useful stress test for a proposed symbolic argument, not a direct computation to launch.

No further research window is authorized by this report. After delivery, await explicit user authorization.

## Verification, reproducibility, and continuation

Pinned environment: Lean 4.33.1, compiler 819816b2e0a3bf405af45ae5c7af2491d8f5bee6; Mathlib v4.33.1 at 0df444a360eaa60ab8c11dca51a86af692955474. All nine dependency revisions and all frozen-file hashes passed; a separate audit found the tracked dependency working trees clean. Cached artifact provenance was not independently reconstructed.

At the previous snapshot, a complete109-module/46-audit consolidated run passed in637.53s, peak RSS 2,112,472KiB, no swaps, finishing13:26:17.815136UTC. The new sharpening module separately passed its warning-free build in29.93s (peak2,183,316KiB), six allowed-axiom audits, and module-only replay in19.48s (peak2,043,496KiB). The completed source inventory is now 110 modules and 52 named audits. The final integrated run passed all **110 module builds, 52 named transitive axiom audits, and 110 module-only replays**, with exit 0, elapsed 11:10.39, peak RSS 2,295,148 KiB, finishing 2026-10-27T14:35:44.762989+00:00. Infrastructure verification of the unchanged frozen baseline passed in6.63s. Only propext, Classical.choice, Quot.sound are allowed. Final source/log hashes and the exact inventory are recorded in `SESSION_01_FINAL_VERIFIED_SNAPSHOT.json`; earlier109-module evidence is preserved separately.

The optional global classification wrapper was not implemented; no unfinished proof goals or draft proof files were left by the bounded final attempt.

Reproduce from the repository root with the pinned environment, serially:

```sh
scripts/verify.sh
scripts/verify-research.sh
```

The source archive excludes installed toolchain/dependency caches and the ignored original reference Git checkout; `REPRODUCTION_NOTES.md` lists the exact reconstruction requirements. The certificate generators and numerical commands are preserved in `experiments/README.md`, source files, resource logs, and the individual handoffs. The supported suffix-generator stages are 1001..2000 and 2001..10000 with chunk size 100; alternate ranges require manifest maintenance. No whole-range regeneration is claimed during the final source audit.

The bundled leanchecker replays each selected module against its imported environment. This is not an external independent kernel or a clean-checkout final-solution verification. A brief accidental --fresh invocation at session start was safely terminated and is not claimed as a verification result. No complete candidate exists, so the required separate final-candidate verification and novelty review were not triggered.

Exact outstanding Lean propositions, with no additional assumptions:

```lean
∃ n : ℕ, a n = n ∧ n ≠ 1 ∧ n ≠ 32
¬ ∃ n : ℕ, a n = n ∧ n ≠ 1 ∧ n ≠ 32
```

A fresh authorized session should read this report, STATE.md, LEAN_STATUS.md, APPROACHES.md, REDIRECT_RESEARCH_MEMO.md, and the final verification manifest before changing sources. Preserve the frozen statement and the distinction between formal results, informal deductions, computational evidence, and unproved hypotheses. Do not automatically resume the stopped experiments or start a new six-hour clock.

Administrative Git preservation and local artifact transfer follow the recorded research stop. No new mathematical activity was initiated after the checkpoint. Exact closure metadata is in SESSION_01_CLOSURE.json; the delivery manifest identifies the final report-containing Git commit.
