> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Suffix finite-range pilot — Session 01

Completed 2026-10-27 11:31 UTC. This pilot extends the checked decimal digit-count
range from 1000 to 2000 and improves the all-size necessary digit-sum bound.
It does not resolve either frozen A113010 target. No claim of a uniform
fixed-point exclusion or a new general mathematical theorem is made.

## Owned outputs and regeneration

- `experiments/generate_suffix_finite_lean.py`
- `proof/A113010/SuffixFiniteCore.lean`
- Ten modules `SuffixFinite1001_1100.lean` through `SuffixFinite1901_2000.lean`
- `proof/A113010/SuffixFinite2000.lean`
- `proof/A113010/SuffixDigitSum2000.lean`
- This handoff. Existing modules, frozen sources, and verifier scripts unchanged.

At the repository root, regenerate with:

```sh
python3 experiments/generate_suffix_finite_lean.py --first 1001 --last 2000 --chunk-size 100
```

The first index is deliberately fixed at 1001 because the aggregate reuses the
existing Finite theorem through 1000. The generator supports a last-index option,
but no range beyond 2000 was built or approved as part of this pilot.

## Exact formal results

Names are in namespace OeisA113010.

```lean
fixed_of_digitCount_le_2000 {n : ℕ} (hn : a n = n)
  (hk : digitCount n ≤ 2000) : n = 1 ∨ n = 32

fixed_below_ten_pow_2000 {n : ℕ} (hn : a n = n)
  (hbound : n < 10 ^ 2000) : n = 1 ∨ n = 32

additional_fixedPoint_ge_ten_pow_2000 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 2000 ≤ n
```

The all-size consequences, without any bound on n, are:

```lean
pow_605_below_digit_lower {k : ℕ} (hk : 2001 ≤ k) :
  k ^ 605 < 10 ^ (k - 1)

fixed_of_digitSum_le_605 {n : ℕ} (hn : a n = n)
  (hs : digitSum n ≤ 605) : n = 1 ∨ n = 32

additional_fixedPoint_digitSum_ge_606 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 606 ≤ digitSum n

additional_fixedPoint_nonzeroDigits_ge_68 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 68 ≤ nonzeroDigitCount n
```

The uniform power bound uses the previously proved power_exclusion_above and
the ordinary decide certificate `2001^605 < 10^2000`, with `2*605 ≤ 2001`.
Thus fixed points of digit sum at most 605 must lie in the verified finite range.
The nonzero-digit bound follows from digitSum≤9*nonzeroDigitCount.

## Certificate structure

The generic bridge exponentCertificate_of_suffix turns the two exact exponent
interval endpoints plus an excessive suffix into the original ExponentCertificate.
All chunk exclusions then reuse Finite.no_fixed_of_certificate unchanged.

Among k=1001..2000:

- 678 have no exponent in the required decimal-length interval.
- 282 have one such exponent but fail mod nine.
- 40 need an excessive-suffix certificate.

For those 40, the largest suffix width is 149 except k=1790, whose trailing zeroes
require width 682. No normalization was needed to keep this pilot practical.
A future extension can first remove powers of ten using TrailingZeros and apply
the suffix bound to the remaining base.

Each suffix is computed by explicit binary modular-power steps and checked with
ordinary decide. The interval endpoint inequalities and mod-nine mismatches are
also checked by ordinary decide. Python's floating logarithm merely supplies an
initial exponent guess; exact integer inequalities correct it, and Lean checks
both endpoints independently. No floating value is trusted by a theorem.

## Verification and exact resource measurements

All builds use `scripts/lean.sh --wfail build MODULE`, serially. All 13 newly
created modules were individually replayed with `scripts/lean.sh env leanchecker
-v MODULE`. Every command returned exit 0. No fresh replay was used.

| Module / range | Build seconds | Build peak KiB | Replay seconds | Replay peak KiB |
|---|---:|---:|---:|---:|
| Core | included below | included below | 4.91 | 1504672 |
| 1001–1100, including Core build | 6.73 | 1783480 | 4.36 | 1507072 |
| 1101–1200 | 3.05 | 1776028 | 4.49 | 1506896 |
| 1201–1300 | 4.01 | 1776224 | 4.46 | 1507032 |
| 1301–1400 | 3.20 | 1781124 | 4.50 | 1507252 |
| 1401–1500 | 3.68 | 1791368 | 4.65 | 1507224 |
| 1501–1600 | 3.34 | 1793208 | 4.49 | 1507124 |
| 1601–1700 | 3.13 | 1779700 | 4.38 | 1507296 |
| 1701–1800 | 3.89 | 1789888 | 4.93 | 1514624 |
| 1801–1900 | 3.29 | 1785696 | 4.46 | 1507352 |
| 1901–2000 | 3.09 | 1785708 | 4.34 | 1507276 |
| Finite2000 aggregate | 2.59 | 1763692 | 4.43 | 1511980 |
| DigitSum2000 consequences | 2.46 | 1759520 | 4.54 | 1512224 |

Total measured build command time: 42.46 seconds, including Lake overhead.
Peak build resident set: 1,793,208 KiB, about 1.71 GiB; below the 2.5 GiB pilot cap.
Total measured module replay time: 58.94 seconds.
Peak replay resident set: 1,514,624 KiB, about 1.44 GiB.
These totals exclude connection latency and the initial Python witness generation.

Every printed core, chunk, aggregate, and all-size theorem audit reports exactly
`[propext, Classical.choice, Quot.sound]`. No sorry, native_decide, custom axiom,
dependency change, or frozen-source edit was used.

## Assessment and handoff

The pilot is practical with modest per-chunk times and substantial memory margin.
The 2000-digit formal classification and all-size digit-sum bound are complete.
Before extending farther, the principal should choose a useful final range and
consider normalizing trailing zeroes. This handoff reports resources before any
such extension; no larger range is currently underway.

No proof goals or owned active processes remain. The exclusive Lean build slot
is released to the principal.
