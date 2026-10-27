> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Exact decimal-block identities — Session 01

Verification completed before the clock check 2026-10-27 10:00:09 UTC.
Owned source: `proof/A113010/BlockWeights.lean`. Other proof files unchanged.

## Main result

`OeisA113010.digitSum_mul_ten_pow_sub_one` proves, for natural M,h,

```
0 < M → M ≤ 10^h → digitSum (M*(10^h−1)) = 9*h.
```

This strengthens the requested strict bound to include M=10^h. The h=0,M=1
boundary is valid as well. The proof splits the number into the complementary
h-position blocks M−1 and10^h−M; leading zeroes do not affect digit sums.

## Supporting theorems

- `decimal_block_digits`: for x>0 and y<10^h, the canonical digits of
  x*10^h+y are the digits of y, followed by h−digitCount(y) zeroes, followed by
  the digits of x (Lean's digits are little-endian).
- `digitSum_decimal_block`: for y<10^h and any x,
  `digitSum(x*10^h+y)=digitSum x+digitSum y`.
- `digitCount_decimal_block`: for x>0 and y<10^h,
  `digitCount(x*10^h+y)=digitCount x+h`.
- `decimal_complement_sum`: complementing every digit d to9−d gives total
  weight9 times the list length, provided all entries are≤9.
- `decimal_complement_value`: the two complementary digit lists represent
  numbers whose sum plus one is10 raised to their common length.
- `digitSum_decimal_complement`: for a<10^h,
  `digitSum a+digitSum(10^h−1−a)=9*h`.

Mathlib ingredients inspected: `Nat.digits_append_zeroes_append_digits`,
`Nat.digitsAppend`, its length and coefficient bounds, and
`Nat.sum_digits_ofDigits_eq_sum`. The complementary-block argument itself is
proved by list induction and exact natural-number arithmetic.

## Verification and scope

- `scripts/lean.sh --wfail build A113010.BlockWeights`: PASS (module2.9s).
- `scripts/lean.sh env leanchecker -v A113010.BlockWeights`: PASS.
- Four printed audits (carry-free sum/count, complement sum, main product sum)
  all report exactly `[propext, Classical.choice, Quot.sound]`.
- No sorry, custom axiom, native_decide, frozen changes, dependency changes,
  or fresh Mathlib replay.
- No full finite-modulus obstruction theorem was attempted, as instructed.
- No remaining goals or owned active subprocesses. Lean slot relinquished.

These block identities are supporting mathematics only. Neither frozen target
has been resolved.
