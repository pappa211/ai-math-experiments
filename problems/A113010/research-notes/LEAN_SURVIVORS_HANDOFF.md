> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Infinite filter-survivor formalization — Session 01

Completed 2026-10-27 09:18 UTC. Owned source: `proof/A113010/FilterSurvivors.lean`.
Frozen sources and prior modules remained unchanged in this subtask.

## Main theorem and interpretation

`OeisA113010.sparse_coprime_filter_survivors_unbounded (B : ℕ)` proves

```
∃ k s : ℕ, B < k ∧ 0 < s ∧ digitCount (k^s) = k ∧
  k^s % 9 = s % 9 ∧ digitSum k = 2 ∧ Nat.gcd k 10 = 1
```

The weaker `length_mod_nine_survivors_unbounded` omits the last two properties.
These show that exact decimal-length consistency and the mod-nine condition
have simultaneous survivors at arbitrarily large digit counts, even among
bases coprime to ten having digit sum two. These filters therefore cannot by
themselves imply any finite bound on possible k.

CRITICAL LIMITATION: no equality `digitSum(k^s)=s` is claimed. These are
necessary-condition survivors, not fixed points or counterexamples to the
nonexistence target. Neither frozen target is resolved.

## Explicit family

For any natural j:

- `survivorT j = 4 * 10^j`;
- `survivorX j = 10^(survivorT j)`;
- `survivorK j = survivorX j + 1`;
- `survivorS j = 25 * 10^(survivorT j - j - 2)`.

Proved `j+4≤survivorT j`, so the exponent subtraction is well-defined as intended.
Proved `survivorT j * survivorS j = survivorX j`. The first family member has
`t=4`, `k=10001`, `s=2500`.

`survivor_length` proves exact decimal length k. `survivorS_mod_six` proves s≡4
mod6; `survivorS_mod_nine` proves s≡7 mod9; `survivorK_mod_nine` proves k≡2
mod9; `survivor_mod_nine` combines these to obtain k^s≡s mod9.
`survivorK_gt_index` proves j<k, sufficient for unboundedness.
`survivorK_digitSum`, `survivorK_mod_ten`, and `survivorK_gcd_ten` establish the
optional sparse-base and coprimality properties.

## Integer-only proof of the length bound

The helper `reciprocal_bernoulli_nat` proves by induction
`(x+1)^s*(x+1-s) ≤ (x+1)*x^s` for all natural x,s.
From x>0 and 2s≤x, `succ_pow_lt_two_mul_pow` obtains `(x+1)^s<2*x^s`.
The parameterized theorem `digitCount_succ_power_eq` assumes only t≥2,
x=10^t, and t*s=x. Then x^s=10^x and
`10^x ≤ (x+1)^s < 2*10^x < 10^(x+1)`, proving the exact length x+1.
The entire development uses natural-number arithmetic; no logarithmic,
real-analytic, asymptotic, heuristic, or computational oracle is assumed.

## Verification

- `scripts/lean.sh --wfail build A113010.FilterSurvivors`: PASS (module2.2s).
- `scripts/lean.sh env leanchecker -v A113010.FilterSurvivors`: PASS.
- `survivor_mod_nine` audit: `[propext, Quot.sound]`.
- `digitCount_succ_power_eq`, `survivor_length`,
  `length_mod_nine_survivors_unbounded`, and
  `sparse_coprime_filter_survivors_unbounded` audits:
  `[propext, Classical.choice, Quot.sound]`.
- No sorry, custom axiom, native_decide, fresh replay, frozen-source edit, or
  dependency change.
- No outstanding goals or owned active subprocesses. Exclusive Lean build slot
  relinquished to the principal researcher.
