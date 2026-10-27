import Mathlib.Algebra.Polynomial.FieldDivision
import Mathlib.Algebra.Polynomial.Inductions
import Mathlib.Algebra.Polynomial.Monomial
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Lean.Elab.Tactic.Omega

/-!
Sparse support and multiplicity at nonzero roots.

This is an independent Lean formalization of a known characteristic-zero
lemma, not a claim of a new mathematical discovery. Primary-source attribution:
Sandro Mattarei, "Root multiplicities and number of nonzero coefficients of a
polynomial", arXiv:math/0512239v2 (2006), https://arxiv.org/pdf/math/0512239 .
The abstract explicitly identifies the characteristic-zero multiplicity bound
by the number of nonzero coefficients as already known.

This supporting polynomial mathematics does not itself prove a statement about
decimal digit sums or resolve either A113010 target.
-/
namespace OeisA113010

open Polynomial

universe u
variable {K : Type u} [Field K] [CharZero K]

omit [CharZero K] in
private theorem support_divX_image (p : K[X]) :
    p.divX.support.image Nat.succ = p.support.erase 0 := by
  classical
  ext n
  cases n with
  | zero => simp
  | succ n =>
    simp [Finset.mem_image, Polynomial.mem_support_iff, Polynomial.coeff_divX]

omit [CharZero K] in
private theorem card_support_divX (p : K[X]) :
    p.divX.support.card = (p.support.erase 0).card := by
  classical
  calc
    p.divX.support.card = (p.divX.support.image Nat.succ).card :=
      (Finset.card_image_of_injective _ Nat.succ_injective).symm
    _ = (p.support.erase 0).card := congrArg Finset.card (support_divX_image p)

private theorem card_support_derivative (p : K[X]) :
    p.derivative.support.card = (p.support.erase 0).card := by
  have hs : p.derivative.support = p.divX.support := by
    ext n
    rw [Polynomial.mem_support_derivative, Polynomial.mem_support_iff,
      Polynomial.mem_support_iff, Polynomial.coeff_divX]
  rw [hs, card_support_divX]

/-- At a nonzero point, root multiplicity is strictly smaller than the number
of nonzero coefficients of a nonzero characteristic-zero polynomial. -/
theorem rootMultiplicity_lt_support_card {p : K[X]} (hp : p ≠ 0) {α : K} (hα : α ≠ 0) :
    p.rootMultiplicity α < p.support.card := by
  classical
  suffices H : ∀ n : ℕ, ∀ p : K[X], p.natDegree = n → p ≠ 0 →
      p.rootMultiplicity α < p.support.card from H _ p rfl hp
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro p hdeg hp
    by_cases hroot : p.IsRoot α
    · have hdegree : 0 < p.natDegree := by
        by_contra hd
        have hd0 : p.natDegree = 0 := by omega
        have hc := Polynomial.eq_C_of_natDegree_eq_zero hd0
        have hrootC : (C (p.coeff 0) : K[X]).IsRoot α := by rwa [hc] at hroot
        have heval : p.coeff 0 = 0 := by simpa only [Polynomial.IsRoot, Polynomial.eval_C] using hrootC
        apply hp
        rw [hc, heval, Polynomial.C_0]
      by_cases hc : p.coeff 0 = 0
      · have hmul : p.divX * X = p := by simpa [hc] using p.divX_mul_X_add
        have hdiv : p.divX ≠ 0 := by
          intro hz
          apply hp
          simpa [hz] using hmul.symm
        have hlt : p.divX.natDegree < n := by
          rw [Polynomial.natDegree_divX_eq_natDegree_tsub_one]
          omega
        have hi := ih _ hlt p.divX rfl hdiv
        have hX : (X : K[X]).rootMultiplicity α = 0 :=
          Polynomial.rootMultiplicity_eq_zero (by simpa [Polynomial.IsRoot] using hα)
        have hm := Polynomial.rootMultiplicity_mul (x := α) (show p.divX * X ≠ 0 by rwa [hmul])
        rw [hmul, hX, add_zero] at hm
        have hnot : 0 ∉ p.support := by simpa [Polynomial.mem_support_iff] using hc
        have hs : p.divX.support.card = p.support.card := by
          rw [card_support_divX, Finset.erase_eq_of_notMem hnot]
        rw [hm]
        simpa only [hs] using hi
      · have hd : p.derivative ≠ 0 := Polynomial.derivative_ne_zero.mpr (by omega)
        have hlt : p.derivative.natDegree < n := by
          rw [Polynomial.natDegree_derivative]
          omega
        have hi := ih _ hlt p.derivative rfl hd
        have hm := Polynomial.derivative_rootMultiplicity_of_root hroot
        have hmem : 0 ∈ p.support := Polynomial.mem_support_iff.mpr hc
        have hs := Finset.card_erase_add_one hmem
        have hcard := card_support_derivative p
        have hmpos : 0 < p.rootMultiplicity α := (Polynomial.rootMultiplicity_pos hp).mpr hroot
        omega
    · rw [Polynomial.rootMultiplicity_eq_zero hroot]
      exact Finset.card_pos.mpr (Polynomial.support_nonempty.mpr hp)

/-- The support of a power is large whenever its base has a nonzero root. -/
theorem support_card_power_of_nonzero_root {p : K[X]} (hp : p ≠ 0)
    {α : K} (hα : α ≠ 0) (hroot : p.IsRoot α) (s : ℕ) :
    s + 1 ≤ (p ^ s).support.card := by
  have hpow : p ^ s ≠ 0 := pow_ne_zero _ hp
  have hdvd : (X - C α) ^ s ∣ p ^ s :=
    pow_dvd_pow_of_dvd (Polynomial.dvd_iff_isRoot.mpr hroot) s
  have hm : s ≤ (p ^ s).rootMultiplicity α :=
    (Polynomial.le_rootMultiplicity_iff hpow).mpr hdvd
  have hb := rootMultiplicity_lt_support_card hpow hα
  omega

/- The following wrappers use root existence directly in an algebraically
closed field; no generic field-to-closure transport is needed. -/
omit [CharZero K] in
private theorem natDegree_pos_of_two_le_support_card {p : K[X]}
    (hcard : 2 ≤ p.support.card) : 0 < p.natDegree := by
  classical
  by_contra hd
  have hd0 : p.natDegree = 0 := by omega
  have hc := Polynomial.eq_C_of_natDegree_eq_zero hd0
  have hconst : (C (p.coeff 0) : K[X]).support.card ≤ 1 := by
    calc
      (C (p.coeff 0) : K[X]).support.card ≤ ({0} : Finset ℕ).card :=
        Finset.card_le_card (Polynomial.support_C_subset _)
      _ = 1 := by simp
  have hp : p.support.card ≤ 1 := by rw [hc]; exact hconst
  omega

omit [CharZero K] in
/-- Over an algebraically closed field, a polynomial with at least two terms
has a nonzero root. Powers of X are stripped before invoking root existence. -/
theorem exists_nonzero_root_of_two_le_support_card [IsAlgClosed K] {p : K[X]}
    (hcard : 2 ≤ p.support.card) : ∃ α : K, α ≠ 0 ∧ p.IsRoot α := by
  classical
  suffices H : ∀ n : ℕ, ∀ p : K[X], p.natDegree = n → 2 ≤ p.support.card →
      ∃ α : K, α ≠ 0 ∧ p.IsRoot α from H _ p rfl hcard
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro p hdeg hcard
    have hdegree := natDegree_pos_of_two_le_support_card hcard
    by_cases hc : p.coeff 0 = 0
    · have hmul : p.divX * X = p := by simpa [hc] using p.divX_mul_X_add
      have hnot : 0 ∉ p.support := by simpa [Polynomial.mem_support_iff] using hc
      have hdivcard : 2 ≤ p.divX.support.card := by
        rwa [card_support_divX, Finset.erase_eq_of_notMem hnot]
      have hlt : p.divX.natDegree < n := by
        rw [Polynomial.natDegree_divX_eq_natDegree_tsub_one]
        omega
      obtain ⟨α, hα, hroot⟩ := ih _ hlt p.divX rfl hdivcard
      refine ⟨α, hα, ?_⟩
      rw [← hmul]
      change (p.divX * X).eval α = 0
      rw [Polynomial.eval_mul, hroot.eq_zero, zero_mul]
    · obtain ⟨α, hroot⟩ := IsAlgClosed.exists_root p
        (ne_of_gt (Polynomial.natDegree_pos_iff_degree_pos.mp hdegree))
      refine ⟨α, ?_, hroot⟩
      intro hz
      subst α
      exact hc (by rw [Polynomial.coeff_zero_eq_eval_zero]; exact hroot.eq_zero)

/-- Every power of a genuinely nonmonomial polynomial over an algebraically
closed characteristic-zero field has at least one more term than its exponent. -/
theorem support_card_power_of_two_le_support_card [IsAlgClosed K] {p : K[X]}
    (hcard : 2 ≤ p.support.card) (s : ℕ) : s + 1 ≤ (p ^ s).support.card := by
  have hp : p ≠ 0 := by intro hz; simp [hz] at hcard
  obtain ⟨α, hα, hroot⟩ := exists_nonzero_root_of_two_le_support_card hcard
  exact support_card_power_of_nonzero_root hp hα hroot s

#print axioms rootMultiplicity_lt_support_card
#print axioms support_card_power_of_nonzero_root
#print axioms exists_nonzero_root_of_two_le_support_card
#print axioms support_card_power_of_two_le_support_card
end OeisA113010
