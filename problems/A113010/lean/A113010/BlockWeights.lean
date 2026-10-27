import A113010.TrailingZeros

/-! Exact decimal block identities. These do not assert a fixed point. -/
namespace OeisA113010

/-- Carry-free decimal concatenation, including the padding of the low block. -/
theorem decimal_block_digits {x y h : ℕ} (hx : 0 < x) (hy : y < 10 ^ h) :
    Nat.digits 10 (x * 10 ^ h + y) =
      Nat.digits 10 y ++ List.replicate (h - digitCount y) 0 ++ Nat.digits 10 x := by
  have hlen : digitCount y ≤ h := (Nat.digits_length_le_iff (by decide) y).mpr hy
  have he : (Nat.digits 10 y).length + (h - digitCount y) = h := by
    change digitCount y + (h - digitCount y) = h
    omega
  have hd := Nat.digits_append_zeroes_append_digits (b := 10) (k := h - digitCount y)
    (m := x) (n := y) (by decide) hx
  rw [he] at hd
  simpa [Nat.mul_comm, Nat.add_comm] using hd.symm

/-- The digit sum of carry-free concatenation is additive; the high block may be zero. -/
theorem digitSum_decimal_block {x y h : ℕ} (hy : y < 10 ^ h) :
    digitSum (x * 10 ^ h + y) = digitSum x + digitSum y := by
  by_cases hx : x = 0
  · simp [hx, digitSum]
  · have hd := decimal_block_digits (by omega : 0 < x) hy
    have hs := congrArg List.sum hd
    simpa [digitSum, Nat.add_comm] using hs

/-- The low block occupies h positions when the high block is positive. -/
theorem digitCount_decimal_block {x y h : ℕ} (hx : 0 < x) (hy : y < 10 ^ h) :
    digitCount (x * 10 ^ h + y) = digitCount x + h := by
  have hlen : digitCount y ≤ h := (Nat.digits_length_le_iff (by decide) y).mpr hy
  have hd := decimal_block_digits hx hy
  have hc := congrArg List.length hd
  simp only [List.length_append, List.length_replicate] at hc
  change digitCount (x * 10 ^ h + y) = digitCount y + (h - digitCount y) + digitCount x at hc
  omega

/-- Complementing each decimal coefficient to nine complements its total weight. -/
theorem decimal_complement_sum (L : List ℕ) (hL : ∀ d ∈ L, d ≤ 9) :
    (L.map (fun d => 9 - d)).sum + L.sum = 9 * L.length := by
  induction L with
  | nil => simp
  | cons d ds ih =>
    have hd : d ≤ 9 := hL d (by simp)
    have hds := ih (fun a ha => hL a (by simp [ha]))
    simp only [List.map_cons, List.sum_cons, List.length_cons]
    omega

/-- Complementary fixed-width decimal blocks add to an all-nine block. -/
theorem decimal_complement_value (L : List ℕ) (hL : ∀ d ∈ L, d ≤ 9) :
    Nat.ofDigits 10 (L.map (fun d => 9 - d)) + Nat.ofDigits 10 L + 1 = 10 ^ L.length := by
  induction L with
  | nil => simp
  | cons d ds ih =>
    have hd : d ≤ 9 := hL d (by simp)
    have hdcomp : (9 - d) + d = 9 := by omega
    have hds := ih (fun a ha => hL a (by simp [ha]))
    simp only [List.map_cons, Nat.ofDigits_cons, List.length_cons, pow_succ]
    nlinarith

/-- Decimal complementation in an h-position block, with leading zeroes allowed. -/
theorem digitSum_decimal_complement {a h : ℕ} (ha : a < 10 ^ h) :
    digitSum a + digitSum (10 ^ h - 1 - a) = 9 * h := by
  let L := Nat.digitsAppend 10 h a
  have hlen : L.length = h := Nat.length_digitsAppend (by decide) h ha
  have hL : ∀ d ∈ L, d ≤ 9 := by
    intro d hd
    have := Nat.lt_of_mem_digitsAppend (by decide : 1 < 10) h d hd
    omega
  have hvalue : Nat.ofDigits 10 L = a := by
    simp [L, Nat.digitsAppend, Nat.ofDigits_append_replicate_zero, Nat.ofDigits_digits]
  have hweight : L.sum = digitSum a := by simp [L, Nat.digitsAppend, digitSum]
  have hcomp := decimal_complement_value L hL
  rw [hlen, hvalue] at hcomp
  have hcompval : Nat.ofDigits 10 (L.map (fun d => 9 - d)) = 10 ^ h - 1 - a := by omega
  have hcsum : digitSum (Nat.ofDigits 10 (L.map (fun d => 9 - d))) =
      (L.map (fun d => 9 - d)).sum := by
    apply Nat.sum_digits_ofDigits_eq_sum (by decide : 1 < 10)
    refine ⟨rfl, ?_⟩
    intro d hd
    obtain ⟨e, _, rfl⟩ := List.mem_map.mp hd
    omega
  rw [hcompval] at hcsum
  have hs := decimal_complement_sum L hL
  rw [hlen, hweight, ← hcsum] at hs
  omega

/-- Multiplying an all-nine decimal block by any positive M≤10^h preserves
its digit sum 9h, even though the product may have nearly twice as many digits. -/
theorem digitSum_mul_ten_pow_sub_one {M h : ℕ} (hMpos : 0 < M) (hM : M ≤ 10 ^ h) :
    digitSum (M * (10 ^ h - 1)) = 9 * h := by
  have hpow : 0 < 10 ^ h := Nat.pow_pos (by decide)
  have hy : 10 ^ h - M < 10 ^ h := by omega
  have ha : M - 1 < 10 ^ h := by omega
  have hsplit : M * (10 ^ h - 1) = (M - 1) * 10 ^ h + (10 ^ h - M) := by
    have h1 : (M - 1) + 1 = M := by omega
    have h2 : (10 ^ h - 1) + 1 = 10 ^ h := by omega
    have h3 : (10 ^ h - M) + M = 10 ^ h := by omega
    nlinarith
  rw [hsplit, digitSum_decimal_block hy]
  have hc := digitSum_decimal_complement ha
  have he : 10 ^ h - 1 - (M - 1) = 10 ^ h - M := by omega
  simpa only [he] using hc

#print axioms digitSum_decimal_block
#print axioms digitCount_decimal_block
#print axioms digitSum_decimal_complement
#print axioms digitSum_mul_ten_pow_sub_one

end OeisA113010
