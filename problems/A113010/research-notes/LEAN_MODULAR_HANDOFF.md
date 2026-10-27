> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Quantitative residue and digit-sum construction — Session 01

Verification completed before actual clock check 2026-10-27 10:11:26 UTC.
Owned source: `proof/A113010/ModularBarrier.lean`. Other proof files unchanged.

## Exact main theorem

`OeisA113010.exists_length_digitSum_residue` proves the requested statement,
without weakening its constants:

```
{M k s r : ℕ}
(hMpos : 0 < M)
(hs : 1 + 90 * digitCount M ≤ s)
(hk : s + 1 ≤ k)
(hr : r % Nat.gcd M 9 = s % Nat.gcd M 9) :
∃ N : ℕ, digitCount N = k ∧ digitSum N = s ∧ N % M = r % M
```

The necessary direction is `residue_digitSum_compatible`, which requires only
N mod M=r mod M and digitSum N=s. Consequently
`length_digitSum_residue_iff` proves, under the same quantitative bounds,

```
(∃ N, digitCount N=k ∧ digitSum N=s ∧ N%M=r%M)
  ↔ r % gcd(M,9) = s % gcd(M,9).
```

Interpretation: in this range, compatibility modulo gcd(M,9) is the exact
obstruction to combining decimal length, digit sum, and a residue modulo M.
For a fixed finite set of moduli one may combine them into M, but the theorem's
explicit size condition still matters. It does not rule out arguments using
moduli whose sizes grow sufficiently quickly with the candidate length.

CRITICAL LIMITATION: the constructed N is not asserted to equal k^s, nor to
be a perfect power or fixed point. This is a structural barrier to a specified
class of residue-only exclusions, not a solution of either frozen target.
No novelty claim is made without an external literature review.

## Construction and checked inequalities

Let d=digitCount M, w=digitSum M, q=10^(k−1), and
`R=(M−q%M+r)%M`. Then R<M and `(q+R)%M=r%M`.
Set `D=s−1−digitSum R`. The gcd compatibility implies gcd(w,9) divides D;
`Nat.ModEq.gcd_eq` connects gcd(w,9) with gcd(M,9).

A tiny finite certificate `mod_nine_adjustment_table`, proved using ordinary
Lean decide on the81 pairs of residues in Fin9×Fin9, gives a<9 with aw≡D mod9.
Set `h=(D−aw)/9`. The proof establishes D≥81d, aw≤72d, hence h≥d, and
`1+9h+aw+digitSum R=s`.

`exists_repeated_multiple_block` constructs C from a copies of M in d-position
slots; C<10^(ad), C≡0 modM, and digitSum C=aw. Let B=M(10^h−1), which has digit
sum9h by BlockWeights. Concatenate B, C, and R into a low block L of width
`W=h+(a+2)d`. The proved inequalities give W≤k−1. Finally N=10^(k−1)+L.
The explicit witness uses a leading1; the exported main statement records its
length, digit sum, and residue, rather than a separate leading-prefix equation.
No generalized-prefix theorem was attempted in this subtask.

Supporting exported lemmas include `decimal_block_lt`,
`exists_repeated_multiple_block`, `exists_decimal_residue_witness`, and
`exists_mod_nine_adjustment`.

## Verification

- `scripts/lean.sh --wfail build A113010.ModularBarrier`: PASS (module2.4s).
- `scripts/lean.sh env leanchecker -v A113010.ModularBarrier`: PASS.
- Printed audits of exists_mod_nine_adjustment, exists_length_digitSum_residue,
  length_digitSum_residue_iff, and exists_decimal_residue_witness all report
  exactly `[propext, Classical.choice, Quot.sound]`.
- No native_decide, custom axiom, sorry, frozen-file edit, dependency change,
  fresh Mathlib replay, or unbounded computation.
- No outstanding proof goals or owned running processes. Exclusive serial Lean
  build slot relinquished to the principal researcher.

## Mission-relevant fixed-modulus corollary — verified by10:14:14 UTC

Added `survivorS_ge_index_succ` and `survivorK_ge_exponent_succ`, proving
`j+1≤survivorS j` and `survivorS j+1≤survivorK j`.

`OeisA113010.fixed_modulus_survivors_unbounded` now proves exactly:

```
{M : ℕ} (hMpos : 0 < M) (B : ℕ) :
∃ k s N : ℕ, B < k ∧ 0 < s ∧ digitCount (k^s)=k ∧
  digitCount N=k ∧ digitSum N=s ∧ N%M=(k^s)%M
```

Choose family index `j=B+1+90*digitCount M`. The elementary family growth
ensures the quantitative digit-sum threshold. Its mod-nine compatibility
implies the necessary gcd(M,9) compatibility, and the previously proved
construction supplies N. The source imports FilterSurvivors for this result.

The theorem deliberately asserts neither N=k^s nor N≠k^s. It does not claim
that the power itself has digit sum s. Its conclusion is that every fixed
positive modulus admits arbitrarily large candidates for which a number of
the required length and digit sum shares the candidate power's residue.

Updated warning-free module build PASS (2.6s), updated module-only leanchecker
replay PASS, and the corollary audit exactly
`[propext, Classical.choice, Quot.sound]`. No outstanding goals or active
subprocesses. Lean slot relinquished again.
