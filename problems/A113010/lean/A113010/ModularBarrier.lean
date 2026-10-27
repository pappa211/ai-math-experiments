import A113010.BlockWeights
import A113010.FilterSurvivors

/-!
Quantitative construction of numbers of a prescribed length, digit sum, and
compatible residue. These numbers are not asserted to be powers or fixed points.
-/
namespace OeisA113010

theorem decimal_block_lt {x y p q : ℕ} (hx : x < 10 ^ p) (hy : y < 10 ^ q) :
    x * 10 ^ q + y < 10 ^ (p + q) := by
  calc
    x * 10 ^ q + y < x * 10 ^ q + 10 ^ q := Nat.add_lt_add_left hy _
    _ = (x + 1) * 10 ^ q := by ring
    _ ≤ 10 ^ p * 10 ^ q := Nat.mul_le_mul_right _ (by omega)
    _ = 10 ^ (p + q) := (pow_add 10 p q).symm

/-- A block consisting of a copies of M in d-position slots. -/
theorem exists_repeated_multiple_block {M d : ℕ} (hM : M < 10 ^ d) (a : ℕ) :
    ∃ C : ℕ, C < 10 ^ (a * d) ∧ C % M = 0 ∧ digitSum C = a * digitSum M := by
  induction a with
  | zero => exact ⟨0, by simp, by simp, by simp [digitSum]⟩
  | succ a ih =>
    obtain ⟨C, hC, hmod, hsum⟩ := ih
    refine ⟨C * 10 ^ d + M, ?_, ?_, ?_⟩
    · have hb := decimal_block_lt hC hM
      convert hb using 1
      congr 1
      ring
    · simp [Nat.mul_mod, hmod]
    · rw [digitSum_decimal_block hM, hsum]
      ring

/-- Explicit witness construction before solving its small congruence and width
conditions. h is the all-nine multiplier width, a counts M-blocks, and R is the
low residue block. -/
theorem exists_decimal_residue_witness {M d a h k R r s : ℕ}
    (hMpos : 0 < M) (hM : M < 10 ^ d) (hRh : R < 10 ^ d)
    (hMh : M ≤ 10 ^ h) (hkpos : 0 < k)
    (hwidth : h + (a + 2) * d ≤ k - 1)
    (hweight : 1 + 9 * h + a * digitSum M + digitSum R = s)
    (hres : (10 ^ (k - 1) + R) % M = r % M) :
    ∃ N : ℕ, digitCount N = k ∧ digitSum N = s ∧ N % M = r % M := by
  obtain ⟨C, hC, hCmod, hCsum⟩ := exists_repeated_multiple_block hM a
  let B := M * (10 ^ h - 1)
  have hB : B < 10 ^ (h + d) := by
    calc
      B ≤ M * 10 ^ h := Nat.mul_le_mul_left M (Nat.sub_le _ _)
      _ < 10 ^ d * 10 ^ h := Nat.mul_lt_mul_of_pos_right hM (Nat.pow_pos (by decide))
      _ = 10 ^ (h + d) := by rw [pow_add]; ring
  have hBsum : digitSum B = 9 * h := digitSum_mul_ten_pow_sub_one hMpos hMh
  have hBmod : B % M = 0 := by simp [B]
  let T := B * 10 ^ (a * d) + C
  have hT : T < 10 ^ ((h + d) + a * d) := decimal_block_lt hB hC
  have hTsum : digitSum T = 9 * h + a * digitSum M := by
    dsimp [T]
    rw [digitSum_decimal_block hC, hBsum, hCsum]
  have hTmod : T % M = 0 := by simp [T, Nat.add_mod, Nat.mul_mod, hBmod, hCmod]
  let L := T * 10 ^ d + R
  have hL : L < 10 ^ (h + (a + 2) * d) := by
    have hb := decimal_block_lt hT hRh
    convert hb using 1
    congr 1
    ring
  have hLsum : digitSum L = 9 * h + a * digitSum M + digitSum R := by
    dsimp [L]
    rw [digitSum_decimal_block hRh, hTsum]
  have hLmod : L % M = R % M := by simp [L, Nat.add_mod, Nat.mul_mod, hTmod]
  have hLwidth : L < 10 ^ (k - 1) :=
    lt_of_lt_of_le hL (Nat.pow_le_pow_right (by decide) hwidth)
  refine ⟨1 * 10 ^ (k - 1) + L, ?_, ?_, ?_⟩
  · rw [digitCount_decimal_block (by decide : 0 < 1) hLwidth]
    have hone : digitCount 1 = 1 := by decide
    rw [hone]
    omega
  · rw [digitSum_decimal_block hLwidth, hLsum]
    have hone : digitSum 1 = 1 := by decide
    rw [hone]
    omega
  · simpa only [one_mul, Nat.add_mod, Nat.mod_mod, hLmod] using hres

set_option maxRecDepth 10000 in
private theorem mod_nine_adjustment_table :
    ∀ v z : Fin 9, z.val % Nat.gcd v.val 9 = 0 →
      ∃ a : Fin 9, (a.val * v.val) % 9 = z.val := by decide

/-- A tiny finite congruence certificate supplies a multiplier below nine. -/
theorem exists_mod_nine_adjustment {w D : ℕ} (hD : Nat.gcd w 9 ∣ D) :
    ∃ a : ℕ, a < 9 ∧ (a * w) % 9 = D % 9 := by
  have hgcd : Nat.gcd (w % 9) 9 = Nat.gcd w 9 := (Nat.mod_modEq w 9).gcd_eq
  have hz : (D % 9) % Nat.gcd (w % 9) 9 = 0 := by
    rw [hgcd, Nat.mod_mod_of_dvd D (Nat.gcd_dvd_right w 9)]
    exact Nat.mod_eq_zero_of_dvd hD
  obtain ⟨a, ha⟩ := mod_nine_adjustment_table
    ⟨w % 9, Nat.mod_lt _ (by decide)⟩ ⟨D % 9, Nat.mod_lt _ (by decide)⟩ hz
  refine ⟨a.val, a.isLt, ?_⟩
  simpa only [Nat.mul_mod, Nat.mod_mod] using ha

/-- Every compatible residue occurs with the prescribed length and digit sum
once the stated elementary size bounds hold. The constructed number has a
leading one, but is not asserted to equal any prescribed power. -/
theorem exists_length_digitSum_residue {M k s r : ℕ} (hMpos : 0 < M)
    (hs : 1 + 90 * digitCount M ≤ s) (hk : s + 1 ≤ k)
    (hr : r % Nat.gcd M 9 = s % Nat.gcd M 9) :
    ∃ N : ℕ, digitCount N = k ∧ digitSum N = s ∧ N % M = r % M := by
  let d := digitCount M
  let w := digitSum M
  let q := 10 ^ (k - 1)
  let R := (M - q % M + r) % M
  let D := s - 1 - digitSum R
  let g := Nat.gcd M 9
  have hdpos : 0 < d := digitCount_pos hMpos
  have hs' : 1 + 90 * d ≤ s := hs
  have hM : M < 10 ^ d := Nat.lt_base_pow_length_digits (by decide)
  have hR : R < M := Nat.mod_lt _ hMpos
  have hRwidth : R < 10 ^ d := lt_trans hR hM
  have hRcount : digitCount R ≤ d :=
    (Nat.digits_length_le_iff (by decide : 1 < 10) R).mpr hRwidth
  have hSR : digitSum R ≤ 9 * d :=
    le_trans (digitSum_le_nine_mul_digitCount R) (Nat.mul_le_mul_left 9 hRcount)
  have hw : w ≤ 9 * d := digitSum_le_nine_mul_digitCount M
  have hres : (q + R) % M = r % M := by
    have hqle : q % M ≤ M := Nat.le_of_lt (Nat.mod_lt q hMpos)
    calc
      (q + R) % M = (q % M + (M - q % M + r)) % M := by simp [R, Nat.add_mod]
      _ = (M + r) % M := congrArg (fun z : ℕ => z % M) (by omega)
      _ = r % M := by simp
  have hgM : g ∣ M := Nat.gcd_dvd_left M 9
  have hg9 : g ∣ 9 := Nat.gcd_dvd_right M 9
  have hq9 : Nat.ModEq 9 q 1 := by
    dsimp [q]
    simpa using (show Nat.ModEq 9 10 1 from by decide).pow (k - 1)
  have hqg : Nat.ModEq g q 1 := hq9.of_dvd hg9
  have hRsg : Nat.ModEq g R (digitSum R) :=
    (show Nat.ModEq 9 R (digitSum R) from digitSum_mod_nine R).of_dvd hg9
  have hcombined : Nat.ModEq g (1 + digitSum R) s :=
    ((hqg.add hRsg).symm.trans
      ((show Nat.ModEq M (q + R) r from hres).of_dvd hgM)).trans hr
  have hDdvd : g ∣ D := by
    simpa [D, Nat.sub_sub] using hcombined.dvd'
  have hgcd : Nat.gcd w 9 = g :=
    (show Nat.ModEq 9 M (digitSum M) from digitSum_mod_nine M).gcd_eq.symm
  obtain ⟨a, ha, hac⟩ := exists_mod_nine_adjustment (w := w) (D := D) (by rw [hgcd]; exact hDdvd)
  have haw : a * w ≤ 72 * d := by
    calc
      a * w ≤ 8 * (9 * d) := Nat.mul_le_mul (by omega) hw
      _ = 72 * d := by ring
  have hDlo : 81 * d ≤ D := by dsimp [D]; omega
  have hadiv : 9 ∣ D - a * w := (show Nat.ModEq 9 (a * w) D from hac).dvd'
  let h := (D - a * w) / 9
  have h9 : 9 * h = D - a * w := by dsimp [h]; exact Nat.mul_div_cancel' hadiv
  have hh : d ≤ h := by omega
  have hweight : 1 + 9 * h + a * w + digitSum R = s := by
    dsimp [D] at h9 hDlo
    omega
  have hwidth : h + (a + 2) * d ≤ k - 1 := by
    have had : (a + 2) * d ≤ 10 * d := Nat.mul_le_mul_right d (by omega)
    have hs90 : 90 * d ≤ s - 1 := by omega
    have hh9 : 9 * h ≤ s - 1 := by omega
    omega
  have hMh : M ≤ 10 ^ h :=
    le_trans (Nat.le_of_lt hM) (Nat.pow_le_pow_right (by decide) hh)
  exact exists_decimal_residue_witness hMpos hM hRwidth hMh (by omega) hwidth hweight hres

/-- The gcd compatibility condition is necessary for every number, independently
of the quantitative size hypotheses used to construct a witness. -/
theorem residue_digitSum_compatible {M N r s : ℕ}
    (hres : N % M = r % M) (hsum : digitSum N = s) :
    r % Nat.gcd M 9 = s % Nat.gcd M 9 := by
  have hrN : Nat.ModEq (Nat.gcd M 9) r N :=
    ((show Nat.ModEq M N r from hres).of_dvd (Nat.gcd_dvd_left M 9)).symm
  have hNs : Nat.ModEq (Nat.gcd M 9) N s := by
    simpa only [hsum] using
      (show Nat.ModEq 9 N (digitSum N) from digitSum_mod_nine N).of_dvd
        (Nat.gcd_dvd_right M 9)
  exact hrN.trans hNs

/-- In the stated range, gcd compatibility is the exact residue obstruction
for numbers of a given decimal length and digit sum. -/
theorem length_digitSum_residue_iff {M k s r : ℕ} (hMpos : 0 < M)
    (hs : 1 + 90 * digitCount M ≤ s) (hk : s + 1 ≤ k) :
    (∃ N : ℕ, digitCount N = k ∧ digitSum N = s ∧ N % M = r % M) ↔
      r % Nat.gcd M 9 = s % Nat.gcd M 9 := by
  constructor
  · rintro ⟨N, _, hsum, hres⟩
    exact residue_digitSum_compatible hres hsum
  · exact exists_length_digitSum_residue hMpos hs hk

theorem survivorS_ge_index_succ (j : ℕ) : j + 1 ≤ survivorS j := by
  have hp : j + 1 ≤ 10 ^ j := Nat.succ_le_of_lt (Nat.lt_pow_self (by decide))
  have he : j ≤ survivorT j - j - 2 := by dsimp [survivorT]; omega
  have hp' : 10 ^ j ≤ 10 ^ (survivorT j - j - 2) := Nat.pow_le_pow_right (by decide) he
  dsimp [survivorS]
  omega

theorem survivorK_ge_exponent_succ (j : ℕ) : survivorS j + 1 ≤ survivorK j := by
  have ht : 1 ≤ survivorT j := by have := survivorT_lower j; omega
  have hp : survivorS j ≤ survivorX j := by
    calc
      survivorS j = 1 * survivorS j := by simp
      _ ≤ survivorT j * survivorS j := Nat.mul_le_mul_right _ ht
      _ = survivorX j := survivor_exponent_identity j
  change survivorS j + 1 ≤ survivorX j + 1
  omega

/-- For every fixed positive modulus, arbitrarily large exact-length power
candidates have the same residue as some number with the desired digit sum.
No equality or inequality between that number and the power is asserted. -/
theorem fixed_modulus_survivors_unbounded {M : ℕ} (hMpos : 0 < M) (B : ℕ) :
    ∃ k s N : ℕ, B < k ∧ 0 < s ∧ digitCount (k ^ s) = k ∧
      digitCount N = k ∧ digitSum N = s ∧ N % M = (k ^ s) % M := by
  let j := B + 1 + 90 * digitCount M
  have hBj : B ≤ j := by dsimp [j]; omega
  have hs : 1 + 90 * digitCount M ≤ survivorS j := by
    have hj := survivorS_ge_index_succ j
    dsimp [j] at hj ⊢
    omega
  have hr : (survivorK j ^ survivorS j) % Nat.gcd M 9 =
      survivorS j % Nat.gcd M 9 :=
    (show Nat.ModEq 9 (survivorK j ^ survivorS j) (survivorS j)
      from survivor_mod_nine j).of_dvd (Nat.gcd_dvd_right M 9)
  obtain ⟨N, hNcount, hNsum, hNmod⟩ := exists_length_digitSum_residue hMpos hs
    (survivorK_ge_exponent_succ j) hr
  exact ⟨survivorK j, survivorS j, N, lt_of_le_of_lt hBj (survivorK_gt_index j),
    survivorS_pos j, survivor_length j, hNcount, hNsum, hNmod⟩

#print axioms exists_mod_nine_adjustment
#print axioms exists_length_digitSum_residue
#print axioms length_digitSum_residue_iff
#print axioms fixed_modulus_survivors_unbounded

#print axioms exists_decimal_residue_witness
end OeisA113010
