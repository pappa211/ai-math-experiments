import Mathlib.Data.Fin.VecNotation
import Tuza06.SparseLinksTools
import Tuza06.SetPeeling
namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [DecidableEq V]

/-- Exact labels for two three-vertex arms exhausting a five-vertex set.
No graph, graph-order, or outside-attachment hypothesis is involved. -/
theorem two_arm_labeling {A X Y : Finset V}
    (hA : A.card = 5) (hX : X ⊆ A) (hY : Y ⊆ A)
    (hcX : X.card = 3) (hcY : Y.card = 3) (hXY : (X ∩ Y).card = 1) :
    ∃ i : Fin 5 ↪ V, (univ : Finset (Fin 5)).map i = A ∧
      ({0,1,2} : Finset (Fin 5)).map i = X ∧ ({0,3,4} : Finset (Fin 5)).map i = Y := by
  classical
  have hcover : X ∪ Y = A := (two_arm_saturation hA.le hX hY hcX.ge hcY.ge hXY.le).2.2.2.2
  obtain ⟨a,ha⟩ := card_eq_one.mp hXY
  have haX : a ∈ X := (mem_inter.mp (show a ∈ X ∩ Y by rw [ha];simp)).1
  have haY : a ∈ Y := (mem_inter.mp (show a ∈ X ∩ Y by rw [ha];simp)).2
  have hx2 : (X.erase a).card = 2 := by rw [card_erase_of_mem haX,hcX]
  have hy2 : (Y.erase a).card = 2 := by rw [card_erase_of_mem haY,hcY]
  obtain ⟨b,c,hbc,hbcX⟩ := card_eq_two.mp hx2
  obtain ⟨d,e,hde,hdeY⟩ := card_eq_two.mp hy2
  have hb : b ∈ X.erase a := by rw [hbcX];simp
  have hc : c ∈ X.erase a := by rw [hbcX];simp
  have hd : d ∈ Y.erase a := by rw [hdeY];simp
  have he : e ∈ Y.erase a := by rw [hdeY];simp
  have hab : a ≠ b := (mem_erase.mp hb).1.symm
  have hac : a ≠ c := (mem_erase.mp hc).1.symm
  have had : a ≠ d := (mem_erase.mp hd).1.symm
  have hae : a ≠ e := (mem_erase.mp he).1.symm
  have hdX : d ∉ X := by
    intro hx
    have hh : d = a := mem_singleton.mp (ha ▸ mem_inter.mpr ⟨hx,(mem_erase.mp hd).2⟩)
    exact had hh.symm
  have heX : e ∉ X := by
    intro hx
    have hh : e = a := mem_singleton.mp (ha ▸ mem_inter.mpr ⟨hx,(mem_erase.mp he).2⟩)
    exact hae hh.symm
  have hbd : b ≠ d := fun h => hdX (h ▸ (mem_erase.mp hb).2)
  have hbe : b ≠ e := fun h => heX (h ▸ (mem_erase.mp hb).2)
  have hcd : c ≠ d := fun h => hdX (h ▸ (mem_erase.mp hc).2)
  have hce : c ≠ e := fun h => heX (h ▸ (mem_erase.mp hc).2)
  have hXeq : X = {a,b,c} := by rw [← insert_erase haX,hbcX]
  have hYeq : Y = {a,d,e} := by rw [← insert_erase haY,hdeY]
  let f : Fin 5 → V := ![a,b,c,d,e]
  have hf : Function.Injective f := by
    intro j k hjk
    fin_cases j <;> fin_cases k <;> simp_all [f]
  let i : Fin 5 ↪ V := ⟨f,hf⟩
  refine ⟨i,?_,?_,?_⟩
  · rw [← hcover,hXeq,hYeq]
    have hu : (univ : Finset (Fin 5)) = {0,1,2,3,4} := by decide
    rw [hu]
    simp [i,f]
    ext z
    simp only [mem_insert,mem_singleton,mem_union]
    tauto
  · rw [hXeq]
    simp [i,f]
  · rw [hYeq]
    simp [i,f]

private def armsOldFirst : Fin 8 ↪ Fin 8 := ⟨![5,6,7,0,1,2,3,4],by decide⟩

/-- Adjoin three distinct outside points in the exact final-core label order. -/
theorem extend_two_arm_labels (i : Fin 5 ↪ V) (u v w : V)
    (hu : ∀ a, i a ≠ u) (hv : ∀ a, i a ≠ v) (hw : ∀ a, i a ≠ w)
    (huv : u ≠ v) (huw : u ≠ w) (hvw : v ≠ w) :
    ∃ j : Fin 8 ↪ V, j 0 = u ∧ j 1 = v ∧ j 2 = w ∧
      j 3 = i 0 ∧ j 4 = i 1 ∧ j 5 = i 2 ∧ j 6 = i 3 ∧ j 7 = i 4 := by
  let i6 := extendFiniteEmbedding i u hu
  have hv6 : ∀ a : Fin 6, i6 a ≠ v := by
    intro a
    by_cases ha : a.val < 5
    · change (if h : a.val < 5 then i ⟨a.val,h⟩ else u) ≠ v
      rw [dif_pos ha];exact hv _
    · change (if h : a.val < 5 then i ⟨a.val,h⟩ else u) ≠ v
      rw [dif_neg ha];exact huv
  let i7 := extendFiniteEmbedding i6 v hv6
  have hw7 : ∀ a : Fin 7, i7 a ≠ w := by
    intro a
    by_cases ha : a.val < 6
    · change (if h : a.val < 6 then i6 ⟨a.val,h⟩ else v) ≠ w
      rw [dif_pos ha]
      by_cases hb : a.val < 5
      · change (if h : a.val < 5 then i ⟨a.val,h⟩ else u) ≠ w
        rw [dif_pos hb];exact hw _
      · change (if h : a.val < 5 then i ⟨a.val,h⟩ else u) ≠ w
        rw [dif_neg hb];exact huw
    · change (if h : a.val < 6 then i6 ⟨a.val,h⟩ else v) ≠ w
      rw [dif_neg ha];exact hvw
  let j := armsOldFirst.trans (extendFiniteEmbedding i7 w hw7)
  exact ⟨j,rfl,rfl,rfl,rfl,rfl,rfl,rfl,rfl⟩
end Tuza06
