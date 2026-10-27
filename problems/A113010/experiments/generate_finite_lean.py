"""Generate Lean kernel certificates for a bounded A113010 exclusion.

Python supplies witness exponents; every inequality and digit computation is
subsequently checked in Lean with ordinary decide, never native_decide.
"""
import argparse, math
from pathlib import Path

HEADER = r'''import A113010.Basic
import Mathlib.Tactic.IntervalCases

/-! Bounded verification only; this does not resolve either frozen target. -/
namespace OeisA113010

/-- Checked interval bounds together with a digit-sum or mod-nine obstruction. -/
abbrev ExponentCertificate (k lo hi : ℕ) : Prop :=
  k ^ (lo - 1) < 10 ^ (k - 1) ∧
  10 ^ k ≤ k ^ (hi + 1) ∧
  ∀ j : Fin (hi + 1 - lo),
    let e := lo + j.val
    k ^ e % 9 ≠ e % 9 ∨ digitSum (k ^ e) ≠ e

theorem no_fixed_of_certificate {n k lo hi : ℕ} (hk : 0 < k)
    (hc : ExponentCertificate k lo hi) (hn : a n = n)
    (hcount : digitCount n = k) : False := by
  obtain ⟨hlo, hhi, hbad⟩ := hc
  have hp := fixed_eq_pow hn
  rw [hcount] at hp
  have hb := digit_bounds (fixed_pos hn)
  rw [hcount, hp] at hb
  have hslo : lo ≤ digitSum n := by
    by_contra hh
    have hle : digitSum n ≤ lo - 1 := by omega
    have hpow := Nat.pow_le_pow_right hk hle
    omega
  have hshi : digitSum n ≤ hi := by
    by_contra hh
    have hle : hi + 1 ≤ digitSum n := by omega
    have hpow := Nat.pow_le_pow_right hk hle
    omega
  have hj : digitSum n - lo < hi + 1 - lo := by omega
  have he : lo + (digitSum n - lo) = digitSum n := by omega
  have bad := hbad ⟨digitSum n - lo, hj⟩
  dsimp only at bad
  rw [he, ← hp] at bad
  rcases bad with hmod | hsum
  · exact hmod (digitSum_mod_nine n)
  · exact hsum rfl

set_option exponentiation.threshold 2000
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

'''

def interval(k):
    lo=max(1,int((k-1)/math.log10(k)))
    while k**lo < 10**(k-1): lo+=1
    while lo>0 and k**(lo-1)>=10**(k-1): lo-=1
    hi=lo
    while k**hi < 10**k: hi+=1
    hi-=1
    assert k**(lo-1)<10**(k-1)
    assert 10**k<=k**(hi+1)
    return lo,hi

def generate(limit):
    rows=[(k,*interval(k)) for k in range(3,limit+1)]
    chunks=[HEADER]
    for k,lo,hi in rows:
        chunks.append(f"private theorem cert_{k} : ExponentCertificate {k} {lo} {hi} := by decide\n")
    chunks.append(f"\nprivate theorem certificate_up_to_{limit} {{k : ℕ}} (hlo : 3 ≤ k) (hhi : k ≤ {limit}) :\n    ∃ lo hi, ExponentCertificate k lo hi := by\n  interval_cases k\n")
    for k,lo,hi in rows:
        chunks.append(f"  · exact ⟨{lo}, {hi}, cert_{k}⟩\n")
    chunks.append(f'''
/-- Formal reproduction of a bounded exclusion, not an all-length theorem. -/
theorem fixed_of_digitCount_le_{limit} {{n : ℕ}} (hn : a n = n)
    (hk : digitCount n ≤ {limit}) : n = 1 ∨ n = 32 := by
  by_cases hsmall : digitCount n ≤ 2
  · exact fixed_of_digitCount_le_two hn hsmall
  · obtain ⟨lo, hi, hc⟩ := certificate_up_to_{limit} (by omega : 3 ≤ digitCount n) hk
    exact (no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl).elim

theorem fixed_below_ten_pow_{limit} {{n : ℕ}} (hn : a n = n)
    (hbound : n < 10 ^ {limit}) : n = 1 ∨ n = 32 := by
  apply fixed_of_digitCount_le_{limit} hn
  exact (Nat.digits_length_le_iff (by decide : 1 < 10) n).mpr hbound

theorem additional_fixedPoint_ge_ten_pow_{limit} {{n : ℕ}} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ {limit} ≤ n := by
  by_contra hbound
  rcases fixed_below_ten_pow_{limit} hn (by omega) with hh | hh
  · exact h1 hh
  · exact h32 hh

#print axioms fixed_of_digitCount_le_{limit}
#print axioms fixed_below_ten_pow_{limit}
end OeisA113010
''')
    return ''.join(chunks)

if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--max-digits',type=int,default=100)
    p.add_argument('--output',type=Path,default=Path('proof/A113010/Finite.lean'))
    a=p.parse_args()
    a.output.write_text(generate(a.max_digits))
