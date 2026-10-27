> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Exact decimal suffix certificates — Session 01

Completed 2026-10-27 11:22 UTC. Owned source:
`proof/A113010/SuffixCertificate.lean`. No existing modules or verifier changed.

## Checked reusable results

All names below are in namespace OeisA113010.

```lean
digitSum_div_mod_ten_pow (n m : ℕ) :
  digitSum n = digitSum (n / 10 ^ m) + digitSum (n % 10 ^ m)

digitSum_mod_ten_pow_le (n m : ℕ) :
  digitSum (n % 10 ^ m) ≤ digitSum n

digitSum_ne_of_suffix_excess {k s m : ℕ}
  (hs : s < digitSum (k ^ s % 10 ^ m)) : digitSum (k ^ s) ≠ s

not_fixed_of_suffix_excess {k s m : ℕ} (hk : 2 ≤ k)
  (hcount : digitCount (k ^ s) = k)
  (hs : s < digitSum (k ^ s % 10 ^ m)) : a (k ^ s) ≠ k ^ s
```

The first theorem follows from BlockWeights carry-free concatenation and
Euclidean division, including m=0 and n=0. The exclusion theorem uses exponent
injectivity for k≥2: a fixed point with that length would require digitSum=s.

Two public modular-power step lemmas support transparent exact certificates:

```lean
pow_mod_double {k e m r : ℕ} (h : k ^ e % m = r) :
  k ^ (2 * e) % m = (r * r) % m

pow_mod_double_add_one {k e m r : ℕ} (h : k ^ e % m = r) :
  k ^ (2 * e + 1) % m = ((r * r) % m * k) % m
```

## Representative kernel-checked exclusion

```lean
representative_suffix_digitSum :
  digitSum ((10001 : ℕ) ^ 2500 % 10 ^ 660) = 3030

representative_power_digitCount :
  digitCount ((10001 : ℕ) ^ 2500) = 10001

representative_power_not_fixed :
  a ((10001 : ℕ) ^ 2500) ≠ 10001 ^ 2500
```

The length proof reuses FilterSurvivors.survivor_length at index zero. Thus this
is a concrete member of the necessary-condition survivor family excluded by
its suffix. It is only one exact exclusion, not an all-size classification and
not a proof of either frozen A113010 target.

An independent Python computation initially found that the first suffix width
whose sum exceeds 2500 is 554, with sum 2502. This minimal-width observation is
computational only. The final formal certificate uses width 660 and proves the
larger margin 3030−2500=530.

## Computation/proof mechanism and feasibility

Pinned Mathlib contains a proof-producing modular-exponent evaluator in
Mathlib.Tactic.NormNum.PowMod, but its integration into general Nat.mod norm_num
is explicitly marked TODO. Instead, the source records eleven binary exponent
steps with residues of at most 660 decimal positions. Each step is justified by
the generic lemmas above and ordinary decide for the bounded numeral arithmetic.
Ordinary decide then checks the suffix's digit sum. There is no native_decide,
external computation oracle, new axiom, or assertion of an unverified residue.
The generated decimal numerals are inputs to kernel-checked equalities.

To avoid eager full-power normalization by the elaborator, each step explicitly
rewrites 2*e (or 2*e+1) to the next exponent before composing equalities. Earlier
proof drafts triggered exponent-threshold warnings during elaboration; the
final source eliminates them without raising the threshold to 2500. The final
threshold is 1000, recursion depth 20000, heartbeat budget 1000000.

This demonstrates a practical bounded kernel certificate. No larger certificate
was attempted. Scaling to the principal's 140-million-digit suffix experiment
is not implied by these measurements; that computation remains separate evidence.

## Verification and measured resource use

Final source compilation, including Lake overhead:

- `scripts/lean.sh --wfail build A113010.SuffixCertificate`: PASS.
- Elapsed 2.69 seconds; module build 1.6 seconds.
- Maximum resident set 1,766,520 KiB (about 1.68 GiB).

Final module-only kernel replay:

- `scripts/lean.sh env leanchecker -v A113010.SuffixCertificate`: PASS, exit 0.
- Elapsed 4.92 seconds; maximum resident set 1,508,436 KiB (about 1.44 GiB).
- No fresh full-Mathlib replay.

Printed axiom audits for digitSum_mod_ten_pow_le, not_fixed_of_suffix_excess,
representative_suffix_digitSum, and representative_power_not_fixed all report
exactly `[propext, Classical.choice, Quot.sound]`.

There are no outstanding proof goals or active owned subprocesses. The exclusive
serial Lean build slot is released to the principal.
