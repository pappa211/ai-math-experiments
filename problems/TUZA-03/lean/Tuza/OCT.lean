import Tuza.Lifting
import Tuza.Coloring
import Mathlib.Combinatorics.SimpleGraph.Coloring.Vertex

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Exact finite odd-cycle-transversal-at-most-four hypothesis, expressed by a
two-coloring of the induced graph on the complement of at most four vertices. -/
def OCTAtMostFour (G : SimpleGraph V) : Prop :=
  ∃ S : Finset V, S.card ≤ 4 ∧ (G.induce (S : Set V)ᶜ).Colorable 2

def mergeColors (S : Finset V) (inside outside : V → Fin 2) (v : V) : Fin 4 :=
  if v ∈ S then ⟨(inside v).val, by omega⟩ else ⟨2 + (outside v).val, by omega⟩

theorem merge_colors_proper {G : SimpleGraph V} {S : Finset V} {inside outside : V → Fin 2}
    (hi : ProperOn G S inside)
    (ho : ∀ a ∉ S, ∀ b ∉ S, G.Adj a b → outside a ≠ outside b) :
    ProperColor G (mergeColors S inside outside) := by
  intro a b hab heq
  have hv := congrArg Fin.val heq
  by_cases ha : a ∈ S <;> by_cases hb : b ∈ S
  · have hn := hi a ha b hb hab
    apply hn
    apply Fin.ext
    simpa [mergeColors, ha, hb] using hv
  · simp [mergeColors, ha, hb] at hv
    omega
  · simp [mergeColors, ha, hb] at hv
    omega
  · have hn := ho a ha b hb hab
    apply hn
    apply Fin.ext
    simp [mergeColors, ha, hb] at hv
    omega

theorem deleted_small_set_bipartite {G : SimpleGraph V} {S U : Finset V}
    (hS : S.card ≤ 4) (hU : G.IsNClique 3 U) (hUS : U ⊆ S) :
    ∃ color : V → Fin 2, ProperOn (deleteTriangle G U) S color := by
  classical
  have hsmall : (S \ U).card ≤ 1 := by
    rw [card_sdiff_of_subset hUS, hU.card_eq]
    omega
  let color : V → Fin 2 := fun v => if v ∈ U then 0 else 1
  refine ⟨color, ?_⟩
  intro a ha b hb hab heq
  by_cases hau : a ∈ U <;> by_cases hbu : b ∈ U
  · exact hab.2 ⟨hau, hbu⟩
  · simp [color, hau, hbu] at heq
  · simp [color, hau, hbu] at heq
  · have he := card_le_one.mp hsmall a (mem_sdiff.mpr ⟨ha, hau⟩)
      b (mem_sdiff.mpr ⟨hb, hbu⟩)
    exact hab.1.ne he

/-- Conditional OCT-four corollary; its only deep inputs are those of triangle_deletion. -/
theorem oct_four
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    (G : SimpleGraph V) (hOCT : OCTAtMostFour G) :
    tau (triangles G) ≤ 2 * nu (triangles G) := by
  classical
  obtain ⟨S, hS, ⟨c⟩⟩ := hOCT
  let outside : V → Fin 2 := fun v => if h : v ∈ S then 0 else c ⟨v, h⟩
  have ho : ∀ a ∉ S, ∀ b ∉ S, G.Adj a b → outside a ≠ outside b := by
    intro a ha b hb hab
    have hc := c.valid (v := ⟨a, ha⟩) (w := ⟨b, hb⟩) hab
    simpa [outside, ha, hb] using hc
  by_cases ht : ∀ a ∈ S, ∀ b ∈ S, ∀ d ∈ S, ¬ (G.Adj a b ∧ G.Adj a d ∧ G.Adj b d)
  · obtain ⟨inside, hi⟩ := small_trianglefree_bipartite hS ht
    exact aharoni G (four_color_tripartite (merge_colors_proper hi ho))
  · push Not at ht
    obtain ⟨a, ha, b, hb, d, hd, hab, had, hbd⟩ := ht
    let U : Finset V := {a, b, d}
    have hU : G.IsNClique 3 U := SimpleGraph.is3Clique_triple_iff.mpr ⟨hab, had, hbd⟩
    have hUS : U ⊆ S := by
      intro v hv
      simp only [U, mem_insert, mem_singleton] at hv
      rcases hv with rfl | rfl | rfl
      · exact ha
      · exact hb
      · exact hd
    obtain ⟨inside, hi⟩ := deleted_small_set_bipartite hS hU hUS
    have hoH : ∀ x ∉ S, ∀ y ∉ S, (deleteTriangle G U).Adj x y → outside x ≠ outside y :=
      fun x hx y hy hxy => ho x hx y hy hxy.1
    exact triangle_deletion aharoni hns G U hU
      (four_color_tripartite (merge_colors_proper hi hoH))

#print axioms oct_four

end Tuza
