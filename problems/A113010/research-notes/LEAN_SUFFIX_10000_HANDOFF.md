> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Verified suffix extension through 10000 — Session 01

All verification completed 2026-10-27 11:49:12 UTC, less than 16 minutes after
the authorized 11:33 UTC start and within the 30-minute cap. The heavy Lean slot
has been released. There are no outstanding proof goals or owned processes.

This extends finite rigor and necessary all-size bounds. Neither frozen A113010
target is solved. The strongest value/count bounds below are consequences of
the existing sparsity theorem, not an enumeration of further decimal lengths.

## Outputs and preservation

Owned generator: `experiments/generate_suffix_finite_lean.py`.
New proof modules (83 total):

- `SuffixFiniteNormalizedCore.lean`.
- 80 chunks `SuffixFinite2001_2100.lean` through `SuffixFinite9901_10000.lean`.
- `SuffixFinite10000.lean` (aggregate).
- `SuffixDigitSum10000.lean` (10001-digit case and all-size consequences).

All are under `proof/A113010/`. Existing frozen files, Finite.lean, root verifier
and audit files were unchanged. The 13 theorem sources from the 2000 pilot were
verified byte-for-byte unchanged immediately after extension generation; all
later source edits targeted only the generator and new 10000 aggregate/final
module. The prior pilot handoff is preserved separately.

Regeneration, from the repository root:

```sh
python3 experiments/generate_suffix_finite_lean.py --first 2001 --last 10000 --chunk-size 100
```

This requires the existing 2000-pilot sources. The 2001-start mode writes the new
normalized bridge and new chunks, preserving the earlier theorem files. Compile
new chunks one at a time before compiling the aggregate; all verification here
was serial. Do not infer that a fresh aggregate dependency build is serial merely
from LEAN_NUM_THREADS=1.

## Formal classification results

All names are in namespace OeisA113010.

In SuffixFinite10000:

```lean
fixed_of_digitCount_le_10000 {n : ℕ} (hn : a n = n)
  (hk : digitCount n ≤ 10000) : n = 1 ∨ n = 32

fixed_below_ten_pow_10000 {n : ℕ} (hn : a n = n)
  (hbound : n < 10 ^ 10000) : n = 1 ∨ n = 32

additional_fixedPoint_ge_ten_pow_10000 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 10000 ≤ n
```

In SuffixDigitSum10000, exponent uniqueness and the already proved suffix
exclusion of 10001^2500 handle the next decimal length without another search:

```lean
no_fixed_digitCount_10001 {n : ℕ} (hn : a n = n)
  (hk : digitCount n = 10001) : False

fixed_of_digitCount_le_10001 {n : ℕ} (hn : a n = n)
  (hk : digitCount n ≤ 10001) : n = 1 ∨ n = 32

additional_fixedPoint_ge_ten_pow_10001 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 10001 ≤ n
```

## All-size necessary bounds

The following statements have no upper bound on n:

```lean
pow_2500_below_digit_lower {k : ℕ} (hk : 10002 ≤ k) :
  k ^ 2500 < 10 ^ (k - 1)

fixed_of_digitSum_le_2500 {n : ℕ} (hn : a n = n)
  (hs : digitSum n ≤ 2500) : n = 1 ∨ n = 32

additional_fixedPoint_digitSum_ge_2501 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 2501 ≤ digitSum n

additional_fixedPoint_nonzeroDigits_ge_278 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 278 ≤ nonzeroDigitCount n

additional_fixedPoint_digitCount_ge_10005 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 10005 ≤ digitCount n

additional_fixedPoint_ge_ten_pow_10004 {n : ℕ} (hn : a n = n)
  (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 10004 ≤ n
```

The uniform power lemma uses power_exclusion_above, `2*2500≤10002`, and the
ordinary decide certificate `10002^2500 < 10^10001`. Fixed points with digit sum
at most 2500 therefore lie in the classified range. The nonzero count follows
from digitSum≤9*nonzeroDigitCount. Since an additional fixed point already has
length at least 10002, the existing r=4 sparsity theorem applies: 4*digitSum <
digitCount. Combining this with digitSum≥2501 yields digitCount≥10005 and the
value bound n≥10^10004. These last bounds are deductions, not separately enumerated
ranges.

## Certificate method

The new generic theorem exponentCertificate_of_normalized_suffix takes
k=10^t*u, the two exact exponent interval bounds, and
`s < digitSum (u^s % 10^m)`, and produces the original ExponentCertificate k s s.
Its proof uses TrailingZeros.digitSum_power_ten_factor and the suffix bound.
All finite exclusions reuse Finite.no_fixed_of_certificate unchanged.

For k=2001..10000, exact witness generation found:

- 5875 empty length intervals.
- 1901 candidate exponents failing mod nine.
- 224 remaining suffix certificates.

Removing trailing zeroes keeps every suffix width at most 624. Each residue is
proved using explicit binary modular-power steps and ordinary decide. Lean also
checks both exponent endpoints independently. Floating logarithms merely seed
Python's exponent search; exact integer comparisons correct the seed, and no
floating quantity occurs in proof evidence.

## Verification, axioms, and limits

Every one of the 83 new modules passed:

- `scripts/lean.sh --wfail build MODULE`.
- `scripts/lean.sh env leanchecker -v MODULE` (individual module replay, no fresh).

Every printed bridge, chunk, aggregate, and final theorem audit reports exactly
`[propext, Classical.choice, Quot.sound]`. The serial runner checked the expected
own-module audit lines and halted on any unexpected list, failed command,
120-second command timeout, peak over 2.5 GiB, or the 12:03 UTC pass cutoff.
No safeguard triggered. There is no sorry, native_decide, custom axiom, changed
dependency, or changed frozen definition.

Exact measured totals, including Lake overhead but excluding connection latency:

- Builds: 273.64 seconds total; peak 1,922,948 KiB (about 1.83 GiB).
- Replays: 377.38 seconds total; peak 1,559,816 KiB (about 1.49 GiB).
- Slowest individual build: aggregate, 6.28 seconds.
- Slowest individual replay: aggregate, 7.09 seconds.
- New source generation: 3.916 seconds.
- 166 successful command records across 83 modules.

The complete measurements follow. Exit status 0 denotes success. Comments after
rows record the automated own-module axiom audits; the initial normalized-core
and endpoint-chunk audits were inspected directly before the full pass.

| Mode | Module | Seconds | Peak KiB | Status |
|---|---|---:|---:|---|
| BUILD | A113010.SuffixFiniteNormalizedCore | 2.44 | 1752348 | 0 |
| REPLAY | A113010.SuffixFiniteNormalizedCore | 4.38 | 1506680 | 0 |
| BUILD | A113010.SuffixFinite2001_2100 | 3.47 | 1793660 | 0 |
| REPLAY | A113010.SuffixFinite2001_2100 | 4.61 | 1507496 | 0 |
| BUILD | A113010.SuffixFinite9901_10000 | 3.30 | 1785044 | 0 |
| REPLAY | A113010.SuffixFinite9901_10000 | 4.65 | 1514488 | 0 |
| BUILD | A113010.SuffixFinite2101_2200 | 2.95 | 1782228 | 0 |
<!-- A113010.SuffixFinite2101_2200: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2101_2200 | 4.33 | 1507348 | 0 |
| BUILD | A113010.SuffixFinite2201_2300 | 3.57 | 1796192 | 0 |
<!-- A113010.SuffixFinite2201_2300: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2201_2300 | 4.52 | 1507660 | 0 |
| BUILD | A113010.SuffixFinite2301_2400 | 3.45 | 1785544 | 0 |
<!-- A113010.SuffixFinite2301_2400: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2301_2400 | 4.68 | 1507420 | 0 |
| BUILD | A113010.SuffixFinite2401_2500 | 3.19 | 1778964 | 0 |
<!-- A113010.SuffixFinite2401_2500: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2401_2500 | 4.41 | 1507456 | 0 |
| BUILD | A113010.SuffixFinite2501_2600 | 3.77 | 1809492 | 0 |
<!-- A113010.SuffixFinite2501_2600: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2501_2600 | 4.52 | 1507664 | 0 |
| BUILD | A113010.SuffixFinite2601_2700 | 2.87 | 1774712 | 0 |
<!-- A113010.SuffixFinite2601_2700: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2601_2700 | 4.32 | 1507540 | 0 |
| BUILD | A113010.SuffixFinite2701_2800 | 2.98 | 1776608 | 0 |
<!-- A113010.SuffixFinite2701_2800: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2701_2800 | 4.41 | 1507400 | 0 |
| BUILD | A113010.SuffixFinite2801_2900 | 3.09 | 1783184 | 0 |
<!-- A113010.SuffixFinite2801_2900: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2801_2900 | 4.53 | 1507548 | 0 |
| BUILD | A113010.SuffixFinite2901_3000 | 3.04 | 1781564 | 0 |
<!-- A113010.SuffixFinite2901_3000: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite2901_3000 | 4.29 | 1507608 | 0 |
| BUILD | A113010.SuffixFinite3001_3100 | 2.68 | 1772660 | 0 |
<!-- A113010.SuffixFinite3001_3100: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3001_3100 | 4.35 | 1507192 | 0 |
| BUILD | A113010.SuffixFinite3101_3200 | 2.80 | 1773848 | 0 |
<!-- A113010.SuffixFinite3101_3200: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3101_3200 | 4.48 | 1507136 | 0 |
| BUILD | A113010.SuffixFinite3201_3300 | 2.89 | 1773572 | 0 |
<!-- A113010.SuffixFinite3201_3300: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3201_3300 | 4.33 | 1507136 | 0 |
| BUILD | A113010.SuffixFinite3301_3400 | 2.73 | 1768544 | 0 |
<!-- A113010.SuffixFinite3301_3400: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3301_3400 | 4.39 | 1507192 | 0 |
| BUILD | A113010.SuffixFinite3401_3500 | 3.45 | 1789520 | 0 |
<!-- A113010.SuffixFinite3401_3500: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3401_3500 | 4.50 | 1507980 | 0 |
| BUILD | A113010.SuffixFinite3501_3600 | 3.11 | 1783276 | 0 |
<!-- A113010.SuffixFinite3501_3600: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3501_3600 | 4.34 | 1507908 | 0 |
| BUILD | A113010.SuffixFinite3601_3700 | 2.95 | 1781556 | 0 |
<!-- A113010.SuffixFinite3601_3700: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3601_3700 | 4.39 | 1507852 | 0 |
| BUILD | A113010.SuffixFinite3701_3800 | 3.37 | 1786192 | 0 |
<!-- A113010.SuffixFinite3701_3800: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3701_3800 | 4.40 | 1507928 | 0 |
| BUILD | A113010.SuffixFinite3801_3900 | 3.71 | 1801344 | 0 |
<!-- A113010.SuffixFinite3801_3900: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3801_3900 | 4.42 | 1508008 | 0 |
| BUILD | A113010.SuffixFinite3901_4000 | 3.08 | 1778456 | 0 |
<!-- A113010.SuffixFinite3901_4000: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite3901_4000 | 4.73 | 1507872 | 0 |
| BUILD | A113010.SuffixFinite4001_4100 | 3.01 | 1782632 | 0 |
<!-- A113010.SuffixFinite4001_4100: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4001_4100 | 4.46 | 1507884 | 0 |
| BUILD | A113010.SuffixFinite4101_4200 | 2.92 | 1780216 | 0 |
<!-- A113010.SuffixFinite4101_4200: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4101_4200 | 4.43 | 1507416 | 0 |
| BUILD | A113010.SuffixFinite4201_4300 | 3.48 | 1797956 | 0 |
<!-- A113010.SuffixFinite4201_4300: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4201_4300 | 4.45 | 1508092 | 0 |
| BUILD | A113010.SuffixFinite4301_4400 | 3.28 | 1785452 | 0 |
<!-- A113010.SuffixFinite4301_4400: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4301_4400 | 4.64 | 1508188 | 0 |
| BUILD | A113010.SuffixFinite4401_4500 | 2.96 | 1780340 | 0 |
<!-- A113010.SuffixFinite4401_4500: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4401_4500 | 4.59 | 1507888 | 0 |
| BUILD | A113010.SuffixFinite4501_4600 | 3.27 | 1802632 | 0 |
<!-- A113010.SuffixFinite4501_4600: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4501_4600 | 4.58 | 1508048 | 0 |
| BUILD | A113010.SuffixFinite4601_4700 | 3.02 | 1787000 | 0 |
<!-- A113010.SuffixFinite4601_4700: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4601_4700 | 4.40 | 1507572 | 0 |
| BUILD | A113010.SuffixFinite4701_4800 | 3.39 | 1796332 | 0 |
<!-- A113010.SuffixFinite4701_4800: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4701_4800 | 4.71 | 1508096 | 0 |
| BUILD | A113010.SuffixFinite4801_4900 | 2.86 | 1770328 | 0 |
<!-- A113010.SuffixFinite4801_4900: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4801_4900 | 4.25 | 1507280 | 0 |
| BUILD | A113010.SuffixFinite4901_5000 | 3.35 | 1796112 | 0 |
<!-- A113010.SuffixFinite4901_5000: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite4901_5000 | 4.32 | 1509820 | 0 |
| BUILD | A113010.SuffixFinite5001_5100 | 3.08 | 1781360 | 0 |
<!-- A113010.SuffixFinite5001_5100: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5001_5100 | 4.59 | 1510164 | 0 |
| BUILD | A113010.SuffixFinite5101_5200 | 3.24 | 1793312 | 0 |
<!-- A113010.SuffixFinite5101_5200: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5101_5200 | 4.55 | 1510320 | 0 |
| BUILD | A113010.SuffixFinite5201_5300 | 2.96 | 1782560 | 0 |
<!-- A113010.SuffixFinite5201_5300: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5201_5300 | 4.44 | 1509676 | 0 |
| BUILD | A113010.SuffixFinite5301_5400 | 3.53 | 1808392 | 0 |
<!-- A113010.SuffixFinite5301_5400: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5301_5400 | 4.67 | 1510400 | 0 |
| BUILD | A113010.SuffixFinite5401_5500 | 3.47 | 1793472 | 0 |
<!-- A113010.SuffixFinite5401_5500: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5401_5500 | 4.45 | 1510316 | 0 |
| BUILD | A113010.SuffixFinite5501_5600 | 3.35 | 1784224 | 0 |
<!-- A113010.SuffixFinite5501_5600: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5501_5600 | 4.72 | 1510544 | 0 |
| BUILD | A113010.SuffixFinite5601_5700 | 3.29 | 1781248 | 0 |
<!-- A113010.SuffixFinite5601_5700: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5601_5700 | 4.52 | 1510216 | 0 |
| BUILD | A113010.SuffixFinite5701_5800 | 2.86 | 1785460 | 0 |
<!-- A113010.SuffixFinite5701_5800: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5701_5800 | 4.39 | 1510136 | 0 |
| BUILD | A113010.SuffixFinite5801_5900 | 3.20 | 1783028 | 0 |
<!-- A113010.SuffixFinite5801_5900: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5801_5900 | 4.34 | 1510392 | 0 |
| BUILD | A113010.SuffixFinite5901_6000 | 3.06 | 1774980 | 0 |
<!-- A113010.SuffixFinite5901_6000: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite5901_6000 | 4.48 | 1509704 | 0 |
| BUILD | A113010.SuffixFinite6001_6100 | 3.46 | 1797372 | 0 |
<!-- A113010.SuffixFinite6001_6100: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6001_6100 | 4.62 | 1514448 | 0 |
| BUILD | A113010.SuffixFinite6101_6200 | 3.32 | 1790932 | 0 |
<!-- A113010.SuffixFinite6101_6200: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6101_6200 | 4.51 | 1514412 | 0 |
| BUILD | A113010.SuffixFinite6201_6300 | 3.19 | 1792920 | 0 |
<!-- A113010.SuffixFinite6201_6300: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6201_6300 | 4.45 | 1514432 | 0 |
| BUILD | A113010.SuffixFinite6301_6400 | 3.51 | 1793308 | 0 |
<!-- A113010.SuffixFinite6301_6400: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6301_6400 | 4.47 | 1514268 | 0 |
| BUILD | A113010.SuffixFinite6401_6500 | 2.92 | 1777072 | 0 |
<!-- A113010.SuffixFinite6401_6500: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6401_6500 | 4.32 | 1510200 | 0 |
| BUILD | A113010.SuffixFinite6501_6600 | 3.37 | 1789792 | 0 |
<!-- A113010.SuffixFinite6501_6600: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6501_6600 | 4.57 | 1514412 | 0 |
| BUILD | A113010.SuffixFinite6601_6700 | 3.54 | 1787552 | 0 |
<!-- A113010.SuffixFinite6601_6700: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6601_6700 | 4.43 | 1514576 | 0 |
| BUILD | A113010.SuffixFinite6701_6800 | 4.06 | 1811156 | 0 |
<!-- A113010.SuffixFinite6701_6800: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6701_6800 | 4.63 | 1514420 | 0 |
| BUILD | A113010.SuffixFinite6801_6900 | 3.56 | 1804816 | 0 |
<!-- A113010.SuffixFinite6801_6900: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6801_6900 | 4.47 | 1514016 | 0 |
| BUILD | A113010.SuffixFinite6901_7000 | 3.37 | 1804252 | 0 |
<!-- A113010.SuffixFinite6901_7000: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite6901_7000 | 4.61 | 1514576 | 0 |
| BUILD | A113010.SuffixFinite7001_7100 | 3.66 | 1794100 | 0 |
<!-- A113010.SuffixFinite7001_7100: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7001_7100 | 4.71 | 1514740 | 0 |
| BUILD | A113010.SuffixFinite7101_7200 | 3.53 | 1803340 | 0 |
<!-- A113010.SuffixFinite7101_7200: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7101_7200 | 4.55 | 1514768 | 0 |
| BUILD | A113010.SuffixFinite7201_7300 | 3.84 | 1809436 | 0 |
<!-- A113010.SuffixFinite7201_7300: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7201_7300 | 4.59 | 1514580 | 0 |
| BUILD | A113010.SuffixFinite7301_7400 | 3.04 | 1788652 | 0 |
<!-- A113010.SuffixFinite7301_7400: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7301_7400 | 4.42 | 1514456 | 0 |
| BUILD | A113010.SuffixFinite7401_7500 | 3.36 | 1790336 | 0 |
<!-- A113010.SuffixFinite7401_7500: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7401_7500 | 4.63 | 1514588 | 0 |
| BUILD | A113010.SuffixFinite7501_7600 | 2.98 | 1776352 | 0 |
<!-- A113010.SuffixFinite7501_7600: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7501_7600 | 4.40 | 1512580 | 0 |
| BUILD | A113010.SuffixFinite7601_7700 | 3.38 | 1797048 | 0 |
<!-- A113010.SuffixFinite7601_7700: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7601_7700 | 4.56 | 1514612 | 0 |
| BUILD | A113010.SuffixFinite7701_7800 | 3.39 | 1797376 | 0 |
<!-- A113010.SuffixFinite7701_7800: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7701_7800 | 4.56 | 1514612 | 0 |
| BUILD | A113010.SuffixFinite7801_7900 | 3.00 | 1776248 | 0 |
<!-- A113010.SuffixFinite7801_7900: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7801_7900 | 4.46 | 1512636 | 0 |
| BUILD | A113010.SuffixFinite7901_8000 | 3.32 | 1790924 | 0 |
<!-- A113010.SuffixFinite7901_8000: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite7901_8000 | 4.56 | 1514684 | 0 |
| BUILD | A113010.SuffixFinite8001_8100 | 3.30 | 1785908 | 0 |
<!-- A113010.SuffixFinite8001_8100: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8001_8100 | 4.62 | 1512572 | 0 |
| BUILD | A113010.SuffixFinite8101_8200 | 3.17 | 1795544 | 0 |
<!-- A113010.SuffixFinite8101_8200: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8101_8200 | 4.46 | 1512652 | 0 |
| BUILD | A113010.SuffixFinite8201_8300 | 2.91 | 1777868 | 0 |
<!-- A113010.SuffixFinite8201_8300: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8201_8300 | 4.43 | 1512112 | 0 |
| BUILD | A113010.SuffixFinite8301_8400 | 3.37 | 1794704 | 0 |
<!-- A113010.SuffixFinite8301_8400: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8301_8400 | 4.43 | 1512848 | 0 |
| BUILD | A113010.SuffixFinite8401_8500 | 3.33 | 1798528 | 0 |
<!-- A113010.SuffixFinite8401_8500: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8401_8500 | 4.69 | 1512784 | 0 |
| BUILD | A113010.SuffixFinite8501_8600 | 3.76 | 1799180 | 0 |
<!-- A113010.SuffixFinite8501_8600: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8501_8600 | 4.73 | 1512256 | 0 |
| BUILD | A113010.SuffixFinite8601_8700 | 3.55 | 1802364 | 0 |
<!-- A113010.SuffixFinite8601_8700: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8601_8700 | 4.59 | 1514820 | 0 |
| BUILD | A113010.SuffixFinite8701_8800 | 2.88 | 1785304 | 0 |
<!-- A113010.SuffixFinite8701_8800: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8701_8800 | 4.44 | 1512596 | 0 |
| BUILD | A113010.SuffixFinite8801_8900 | 3.56 | 1799400 | 0 |
<!-- A113010.SuffixFinite8801_8900: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8801_8900 | 4.60 | 1512800 | 0 |
| BUILD | A113010.SuffixFinite8901_9000 | 3.43 | 1789132 | 0 |
<!-- A113010.SuffixFinite8901_9000: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite8901_9000 | 4.57 | 1514840 | 0 |
| BUILD | A113010.SuffixFinite9001_9100 | 3.45 | 1807188 | 0 |
<!-- A113010.SuffixFinite9001_9100: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9001_9100 | 4.64 | 1514532 | 0 |
| BUILD | A113010.SuffixFinite9101_9200 | 3.46 | 1802320 | 0 |
<!-- A113010.SuffixFinite9101_9200: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9101_9200 | 4.64 | 1514756 | 0 |
| BUILD | A113010.SuffixFinite9201_9300 | 3.38 | 1796880 | 0 |
<!-- A113010.SuffixFinite9201_9300: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9201_9300 | 4.70 | 1513584 | 0 |
| BUILD | A113010.SuffixFinite9301_9400 | 3.26 | 1793644 | 0 |
<!-- A113010.SuffixFinite9301_9400: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9301_9400 | 4.69 | 1514792 | 0 |
| BUILD | A113010.SuffixFinite9401_9500 | 3.40 | 1806300 | 0 |
<!-- A113010.SuffixFinite9401_9500: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9401_9500 | 4.86 | 1514828 | 0 |
| BUILD | A113010.SuffixFinite9501_9600 | 3.40 | 1790116 | 0 |
<!-- A113010.SuffixFinite9501_9600: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9501_9600 | 4.57 | 1513424 | 0 |
| BUILD | A113010.SuffixFinite9601_9700 | 3.65 | 1803560 | 0 |
<!-- A113010.SuffixFinite9601_9700: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9601_9700 | 4.61 | 1514880 | 0 |
| BUILD | A113010.SuffixFinite9701_9800 | 3.61 | 1804804 | 0 |
<!-- A113010.SuffixFinite9701_9800: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9701_9800 | 4.64 | 1514916 | 0 |
| BUILD | A113010.SuffixFinite9801_9900 | 3.35 | 1803920 | 0 |
<!-- A113010.SuffixFinite9801_9900: 1 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite9801_9900 | 4.36 | 1514944 | 0 |
| BUILD | A113010.SuffixFinite10000 | 6.28 | 1922948 | 0 |
<!-- A113010.SuffixFinite10000: 2 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixFinite10000 | 7.09 | 1559816 | 0 |
| BUILD | A113010.SuffixDigitSum10000 | 2.87 | 1815008 | 0 |
<!-- A113010.SuffixDigitSum10000: 9 own printed audits: standard three axioms. -->
| REPLAY | A113010.SuffixDigitSum10000 | 4.54 | 1556728 | 0 |
