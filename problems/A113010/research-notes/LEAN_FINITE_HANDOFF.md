> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Finite Lean certificate handoff — Session 01

Completed 2026-10-27 09:03 UTC by Lean engineering subagent.
Owned files: `proof/A113010/Finite.lean`, `experiments/generate_finite_lean.py`.
`Basic.lean` and the frozen files were not changed in this subtask.

## Result and limitation

Formally proved:

```
OeisA113010.fixed_of_digitCount_le_1000
  {n : ℕ} (hn : a n = n) (hk : digitCount n ≤ 1000) : n = 1 ∨ n = 32

OeisA113010.fixed_below_ten_pow_1000
  {n : ℕ} (hn : a n = n) (hbound : n < 10 ^ 1000) : n = 1 ∨ n = 32

OeisA113010.additional_fixedPoint_ge_ten_pow_1000
  {n : ℕ} (hn : a n = n) (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 1000 ≤ n
```

This formalizes the finite range previously reported numerically on OEIS. It does not establish a bound on all possible digit counts, does not resolve either frozen target, and is not presented as a new mathematical all-length advance.

## Certificate construction

For each k from 3 through 1000, Python proposes integers lo,hi such that:

- `k^(lo-1) < 10^(k-1)`;
- `10^k ≤ k^(hi+1)`;
- every exponent e in [lo,hi] fails either the mod9 condition or exact digit-sum equality.

The generic theorem `no_fixed_of_certificate` proves that these three facts exclude a fixed point with digit count k. Monotonicity of powers forces any fixed-point exponent into the finite interval. Every instantiated certificate is proved by ordinary Lean `decide`; Python output is untrusted witness data whose correctness Lean checks. Empty intervals handle digit counts with no power of the correct length. The one- and two-digit cases import the theorem from Basic.

No native_decide, Lean.ofReduceBool, custom axiom, admitted proof, frozen-definition modification, or imported upstream sorry is used. Explicit `exponentiation.threshold 2000` permits bounded literal arithmetic without warnings; this does not disable kernel checks.

## Reproduction and checks

1. `python3 experiments/generate_finite_lean.py --max-digits 1000`
2. `scripts/lean.sh --wfail build A113010.Finite`
3. `scripts/lean.sh env leanchecker -v A113010.Finite`

All pass. The first 100-digit trial compiled in about two seconds. The final 1000-digit compilation reported module time 9.5 seconds, total measured wall time 12.52 seconds, peak resident memory 2,045,648 KiB. Module-only checker replay completed in 7.64 seconds with peak resident memory 1,556,344 KiB. No swap or full Mathlib fresh replay was used. A prior --wfail run rejected exponentiation-threshold warnings; correcting the threshold yielded a warning-free build.

Transitive audits printed:

- `fixed_of_digitCount_le_1000`: `[propext, Classical.choice, Quot.sound]`.
- `fixed_below_ten_pow_1000`: `[propext, Classical.choice, Quot.sound]`.

No outstanding Lean goals or owned running subprocesses remain. The exclusive Lean build slot is relinquished to the principal researcher.
