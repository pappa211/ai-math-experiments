"""Generate bounded kernel-checked A113010 suffix exclusion modules.

Python supplies only witnesses and numerals; generic Lean theorems and ordinary
decide check the inequalities and arithmetic. No native_decide. Run at repo root.
"""
import argparse
import math
from pathlib import Path

CORE = '''import A113010.Finite
import A113010.SuffixCertificate

/-! Reuse the original interval exclusion with suffix digit-sum evidence. -/
namespace OeisA113010

theorem exponentCertificate_of_suffix {k s m : ℕ}
    (hlo : k ^ (s - 1) < 10 ^ (k - 1))
    (hhi : 10 ^ k ≤ k ^ (s + 1))
    (hs : s < digitSum (k ^ s % 10 ^ m)) : ExponentCertificate k s s := by
  refine ⟨hlo, hhi, ?_⟩
  intro j
  have hj : j.val = 0 := by have := j.isLt; omega
  simp only [hj, Nat.add_zero]
  exact Or.inr (digitSum_ne_of_suffix_excess hs)

#print axioms exponentCertificate_of_suffix
end OeisA113010
'''


NORMALIZED_CORE = """import A113010.SuffixFiniteCore

/-! Removing trailing zeroes before checking an excessive power suffix. -/
namespace OeisA113010

theorem exponentCertificate_of_normalized_suffix {k s t u m : ℕ}
    (hk : k = 10 ^ t * u)
    (hlo : k ^ (s - 1) < 10 ^ (k - 1))
    (hhi : 10 ^ k ≤ k ^ (s + 1))
    (hs : s < digitSum (u ^ s % 10 ^ m)) : ExponentCertificate k s s := by
  refine ⟨hlo, hhi, ?_⟩
  intro j
  have hj : j.val = 0 := by have := j.isLt; omega
  simp only [hj, Nat.add_zero]
  right
  rw [hk, digitSum_power_ten_factor]
  exact digitSum_ne_of_suffix_excess hs

#print axioms exponentCertificate_of_normalized_suffix
end OeisA113010
"""

def interval(k):
    lo=max(1,int((k-1)/math.log10(k)))
    low=10**(k-1)
    while k**lo<low: lo+=1
    while lo>0 and k**(lo-1)>=low: lo-=1
    hi=lo
    while k**hi<low*10: hi+=1
    hi-=1
    assert hi in (lo-1,lo)
    assert k**(lo-1)<low and low*10<=k**(hi+1)
    return lo,hi

def modular_certificate(k,s,m):
    mod=10**m; r=pow(k,s,mod)
    out=[f'  have hmod : ({k} : ℕ) ^ {s} % 10 ^ {m} = {r} := by\n']
    e=1; v=k%mod
    out.append(f'    have h1 : ({k} : ℕ) ^ 1 % 10 ^ {m} = {v} := by decide\n')
    for bit in bin(s)[3:]:
        old=e; e=2*e+int(bit); v=pow(k,e,mod)
        odd=bit=='1'; lemma='pow_mod_double_add_one' if odd else 'pow_mod_double'
        expr=f'2 * {old}'+(' + 1' if odd else '')
        out.append(f'    have h{e} : ({k} : ℕ) ^ {e} % 10 ^ {m} = {v} := by\n'
          f'      have step := {lemma} (k := {k}) (e := {old}) (m := 10 ^ {m}) h{old}\n'
          f'      have he : {expr} = {e} := by decide\n'
          f'      rw [he] at step\n      exact step.trans (by decide)\n')
    out.append(f'    exact h{s}\n  rw [hmod]\n  decide\n')
    return ''.join(out)

def generate_chunk(first,last,normalized=False):
    stats={'first':first,'last':last,'empty':0,'mod9':0,'suffix':0,'largest_suffix':0}
    core='SuffixFiniteNormalizedCore' if normalized else 'SuffixFiniteCore'
    out=[f'import A113010.{core}\n\n'
         '/-! Generated bounded exclusion certificates; no uniform conclusion. -/\n'
         'namespace OeisA113010\n'
         f'set_option exponentiation.threshold {max(2100,last+1)}\n'
         'set_option maxRecDepth 20000\nset_option maxHeartbeats 4000000\n\n']
    rows=[]
    for k in range(first,last+1):
        lo,hi=interval(k); rows.append((k,lo,hi))
        if lo>hi:
            stats['empty']+=1
            out.append(f'private theorem cert_{k} : ExponentCertificate {k} {lo} {hi} := by decide\n')
        elif pow(k,lo,9)!=lo%9:
            stats['mod9']+=1
            out.append(f'private theorem cert_{k} : ExponentCertificate {k} {lo} {hi} := by decide\n')
        else:
            stats['suffix']+=1; m=max(32,(lo+3)//4)
            t=0; u=k
            if normalized:
                while u%10==0: t+=1; u//=10
            while sum(map(int,str(pow(u,lo,10**m))))<=lo:
                m+=16
                if m>k+16: raise ValueError(f'No excessive suffix at k={k}')
            stats['largest_suffix']=max(stats['largest_suffix'],m)
            out.append(f'private theorem suffix_{k} : {lo} < digitSum (({u} : ℕ) ^ {lo} % 10 ^ {m}) := by\n')
            out.append(modular_certificate(u,lo,m))
            bridge=(f'exponentCertificate_of_normalized_suffix (t := {t}) (u := {u}) (by decide)'
                    if normalized else 'exponentCertificate_of_suffix')
            out.append(f'private theorem cert_{k} : ExponentCertificate {k} {lo} {hi} :=\n'
                       f'  {bridge} (by decide) (by decide) suffix_{k}\n')
    out.append(f'\nprivate theorem certificates_{first}_{last} {{k : ℕ}} (hlo : {first} ≤ k) (hhi : k ≤ {last}) :\n'
               '    ∃ lo hi, ExponentCertificate k lo hi := by\n  interval_cases k\n')
    for k,lo,hi in rows: out.append(f'  · exact ⟨{lo}, {hi}, cert_{k}⟩\n')
    out.append(f'\ntheorem no_fixed_digitCount_{first}_{last} {{n : ℕ}} (hn : a n = n)\n'
               f'    (hlo : {first} ≤ digitCount n) (hhi : digitCount n ≤ {last}) : False := by\n'
               f'  obtain ⟨lo, hi, hc⟩ := certificates_{first}_{last} hlo hhi\n'
               '  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl\n\n'
               f'#print axioms no_fixed_digitCount_{first}_{last}\nend OeisA113010\n')
    return ''.join(out),stats

def aggregate(first,last,chunks):
    assert first in (1001,2001)
    prior=first-1
    out=[f'import A113010.SuffixFinite{a}_{b}\n' for a,b in chunks]
    if prior>1000: out.insert(0,f'import A113010.SuffixFinite{prior}\n')
    out.append('\nnamespace OeisA113010\n')
    if last>2000: out.append('set_option maxHeartbeats 4000000\nset_option maxRecDepth 20000\n')
    out.append(f'theorem fixed_of_digitCount_le_{last} {{n : ℕ}} (hn : a n = n)\n'
               f'    (hk : digitCount n ≤ {last}) : n = 1 ∨ n = 32 := by\n'
               f'  by_cases hsmall : digitCount n ≤ {prior}\n'
               f'  · exact fixed_of_digitCount_le_{prior} hn hsmall\n')
    for a,b in chunks[:-1]:
        out.append(f'  by_cases h{b} : digitCount n ≤ {b}\n'
                   f'  · exact (no_fixed_digitCount_{a}_{b} hn (by omega) h{b}).elim\n')
    a,b=chunks[-1]
    out.append(f'  exact (no_fixed_digitCount_{a}_{b} hn (by omega) hk).elim\n')
    out.append(f'''
theorem fixed_below_ten_pow_{last} {{n : ℕ}} (hn : a n = n)
    (hbound : n < 10 ^ {last}) : n = 1 ∨ n = 32 := by
  apply fixed_of_digitCount_le_{last} hn
  exact (Nat.digits_length_le_iff (by decide : 1 < 10) n).mpr hbound

theorem additional_fixedPoint_ge_ten_pow_{last} {{n : ℕ}} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ {last} ≤ n := by
  by_contra hbound
  rcases fixed_below_ten_pow_{last} hn (by omega) with hh | hh
  · exact h1 hh
  · exact h32 hh

#print axioms fixed_of_digitCount_le_{last}
#print axioms additional_fixedPoint_ge_ten_pow_{last}
end OeisA113010
''')
    return ''.join(out)


def digit_sum_consequence(last):
    K=last+1; q=interval(K)[0]-1; nz=(q+9)//9
    assert K**q<10**last and 2*q<=K
    return f"""import A113010.SuffixFinite{last}
import A113010.DigitSumBound

/-! All-size necessary bounds obtained from the bounded suffix certificates. -/
namespace OeisA113010
set_option exponentiation.threshold {max(2100,last+1)}
set_option maxRecDepth 20000

theorem pow_{q}_below_digit_lower {{k : ℕ}} (hk : {K} ≤ k) :
    k ^ {q} < 10 ^ (k - 1) := by
  exact power_exclusion_above (K := {K}) (s := {q})
    (by decide) (by decide) (by decide) hk

theorem fixed_of_digitSum_le_{q} {{n : ℕ}} (hn : a n = n)
    (hs : digitSum n ≤ {q}) : n = 1 ∨ n = 32 := by
  by_cases hk : digitCount n ≤ {last}
  · exact fixed_of_digitCount_le_{last} hn hk
  · have hlarge := pow_{q}_below_digit_lower (show {K} ≤ digitCount n by omega)
    have hlow := (digit_bounds (fixed_pos hn)).1
    have hp : n ≤ digitCount n ^ {q} := by
      calc
        n = digitCount n ^ digitSum n := fixed_eq_pow hn
        _ ≤ digitCount n ^ {q} := Nat.pow_le_pow_right (digitCount_pos (fixed_pos hn)) hs
    omega

theorem additional_fixedPoint_digitSum_ge_{q+1} {{n : ℕ}} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : {q+1} ≤ digitSum n := by
  by_contra hs
  rcases fixed_of_digitSum_le_{q} hn (by omega) with h | h
  · exact h1 h
  · exact h32 h

theorem additional_fixedPoint_nonzeroDigits_ge_{nz} {{n : ℕ}} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : {nz} ≤ nonzeroDigitCount n := by
  have hs := additional_fixedPoint_digitSum_ge_{q+1} hn h1 h32
  have hc := digitSum_le_nine_mul_nonzeroDigitCount n
  omega

#print axioms pow_{q}_below_digit_lower
#print axioms fixed_of_digitSum_le_{q}
#print axioms additional_fixedPoint_digitSum_ge_{q+1}
#print axioms additional_fixedPoint_nonzeroDigits_ge_{nz}
end OeisA113010
"""


def consequence_10000():
    assert 10002**2500 < 10**10001
    return """import A113010.SuffixFinite10000
import A113010.Sparsity

/-! The separate 10001-digit suffix exclusion strengthens the all-size bound. -/
namespace OeisA113010
set_option exponentiation.threshold 10005
set_option maxRecDepth 20000

/-- Length uniqueness reduces the entire 10001-digit case to the already
suffix-excluded representative power. -/
theorem no_fixed_digitCount_10001 {n : ℕ} (hn : a n = n)
    (hk : digitCount n = 10001) : False := by
  have hp := fixed_eq_pow hn
  rw [hk] at hp
  have hb := digit_bounds (fixed_pos hn)
  rw [hk, hp] at hb
  have hc := (digitCount_eq_iff (n := (10001 : ℕ) ^ 2500) (k := 10001)
    (by decide)).mp representative_power_digitCount
  have hs := candidate_exponent_unique (by decide : 10 ≤ 10001) hb hc
  rw [hs] at hp
  exact representative_power_not_fixed (by simpa only [hp] using hn)

theorem fixed_of_digitCount_le_10001 {n : ℕ} (hn : a n = n)
    (hk : digitCount n ≤ 10001) : n = 1 ∨ n = 32 := by
  by_cases hsmall : digitCount n ≤ 10000
  · exact fixed_of_digitCount_le_10000 hn hsmall
  · exact (no_fixed_digitCount_10001 hn (by omega)).elim

theorem additional_fixedPoint_ge_ten_pow_10001 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 10001 ≤ n := by
  by_contra hbound
  have hk : digitCount n ≤ 10001 :=
    (Nat.digits_length_le_iff (by decide : 1 < 10) n).mpr (by omega)
  rcases fixed_of_digitCount_le_10001 hn hk with h | h
  · exact h1 h
  · exact h32 h

theorem pow_2500_below_digit_lower {k : ℕ} (hk : 10002 ≤ k) :
    k ^ 2500 < 10 ^ (k - 1) := by
  exact power_exclusion_above (K := 10002) (s := 2500)
    (by decide) (by decide) (by decide) hk

theorem fixed_of_digitSum_le_2500 {n : ℕ} (hn : a n = n)
    (hs : digitSum n ≤ 2500) : n = 1 ∨ n = 32 := by
  by_cases hk : digitCount n ≤ 10001
  · exact fixed_of_digitCount_le_10001 hn hk
  · have hlarge := pow_2500_below_digit_lower (show 10002 ≤ digitCount n by omega)
    have hlow := (digit_bounds (fixed_pos hn)).1
    have hp : n ≤ digitCount n ^ 2500 := by
      calc
        n = digitCount n ^ digitSum n := fixed_eq_pow hn
        _ ≤ digitCount n ^ 2500 := Nat.pow_le_pow_right (digitCount_pos (fixed_pos hn)) hs
    omega

theorem additional_fixedPoint_digitSum_ge_2501 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 2501 ≤ digitSum n := by
  by_contra hs
  rcases fixed_of_digitSum_le_2500 hn (by omega) with h | h
  · exact h1 h
  · exact h32 h

theorem additional_fixedPoint_nonzeroDigits_ge_278 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 278 ≤ nonzeroDigitCount n := by
  have hs := additional_fixedPoint_digitSum_ge_2501 hn h1 h32
  have hc := digitSum_le_nine_mul_nonzeroDigitCount n
  omega

/-- A consequence of the digit-sum bound and the existing r=4 sparsity
inequality; the extra lengths are not separately enumerated. -/
theorem additional_fixedPoint_digitCount_ge_10005 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10005 ≤ digitCount n := by
  have hs := additional_fixedPoint_digitSum_ge_2501 hn h1 h32
  have hk : 10002 ≤ digitCount n := by
    by_contra h
    rcases fixed_of_digitCount_le_10001 hn (by omega) with h | h
    · exact h1 h
    · exact h32 h
  have hscale := fixed_scaled_digitSum_lt_count (r := 4) hn (by norm_num; omega)
  omega

/-- The corresponding value bound is a consequence of sparsity, not a larger
enumeration of decimal lengths. -/
theorem additional_fixedPoint_ge_ten_pow_10004 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 10004 ≤ n := by
  have hk := additional_fixedPoint_digitCount_ge_10005 hn h1 h32
  have hb := (digit_bounds (fixed_pos hn)).1
  exact (Nat.pow_le_pow_right (by decide : 0 < 10)
    (show 10004 ≤ digitCount n - 1 by omega)).trans hb

#print axioms additional_fixedPoint_digitCount_ge_10005
#print axioms additional_fixedPoint_ge_ten_pow_10004
#print axioms no_fixed_digitCount_10001
#print axioms fixed_of_digitCount_le_10001
#print axioms additional_fixedPoint_ge_ten_pow_10001
#print axioms pow_2500_below_digit_lower
#print axioms fixed_of_digitSum_le_2500
#print axioms additional_fixedPoint_digitSum_ge_2501
#print axioms additional_fixedPoint_nonzeroDigits_ge_278
end OeisA113010
"""

if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--first',type=int,default=1001)
    p.add_argument('--last',type=int,default=2000)
    p.add_argument('--chunk-size',type=int,default=100)
    p.add_argument('--output-dir',type=Path,default=Path('proof/A113010'))
    args=p.parse_args()
    assert args.first in (1001,2001) and args.last>=args.first and args.chunk_size>0
    dest=args.output_dir; dest.mkdir(parents=True,exist_ok=True)
    if args.first==1001: (dest/'SuffixFiniteCore.lean').write_text(CORE)
    else: (dest/'SuffixFiniteNormalizedCore.lean').write_text(NORMALIZED_CORE)
    chunks=[]
    for a in range(args.first,args.last+1,args.chunk_size):
        b=min(args.last,a+args.chunk_size-1); chunks.append((a,b))
        content,stats=generate_chunk(a,b,normalized=args.first>1001)
        (dest/f'SuffixFinite{a}_{b}.lean').write_text(content)
        print(stats,flush=True)
    (dest/f'SuffixFinite{args.last}.lean').write_text(aggregate(args.first,args.last,chunks))
    (dest/f'SuffixDigitSum{args.last}.lean').write_text(
        consequence_10000() if args.last==10000 else digit_sum_consequence(args.last))
