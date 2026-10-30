import Tuza06.SparseLinksTools
import Tuza06.LowVertexArms

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- At most one unordered missing edge on S. This is an actual graph property. -/
def NearClique (G : SimpleGraph V) (S : Finset V) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, a ≠ b → ¬ G.Adj a b →
    ∀ c ∈ S, ∀ d ∈ S, c ≠ d → ¬ G.Adj c d → ({a,b} : Finset V) = {c,d}

theorem nearClique_adj_of_missing {G : SimpleGraph V} {S : Finset V} (h : NearClique G S)
    {a b c d : V} (ha : a ∈ S) (hb : b ∈ S) (hab : a ≠ b) (hmiss : ¬ G.Adj a b)
    (hc : c ∈ S) (hd : d ∈ S) (hcd : c ≠ d) (hne : ({c,d} : Finset V) ≠ {a,b}) : G.Adj c d := by
  by_contra hn
  exact hne (h c hc d hd hcd hn a ha b hb hab hmiss)

/-- A canonical K6 or K6-minus12 core has at most one missing link edge. -/
theorem canonical_configuration_near {G : SimpleGraph V} {i : Fin 6 ↪ V}
    (hc : FiveLinkConfiguration G i (edges univ \ {{1,2}}) ∨ FiveLinkConfiguration G i (edges univ)) :
    NearClique G (peelNeighbors G univ (i 0)) := by
  classical
  rcases hc with hc | hc
  · intro a ha b hb hab hmiss c hcm d hdm hcd hmisscd
    rw [hc.neighborhood] at ha hb hcm hdm
    obtain ⟨x,hx,rfl⟩ := mem_map.mp ha
    obtain ⟨y,hy,rfl⟩ := mem_map.mp hb
    obtain ⟨z,hz,rfl⟩ := mem_map.mp hcm
    obtain ⟨t,ht,rfl⟩ := mem_map.mp hdm
    have hxy : x ≠ y := fun he => hab (congrArg i he)
    have hzt : z ≠ t := fun he => hcd (congrArg i he)
    have hpair1 : ({x,y} : Finset (Fin 6)) = {1,2} := by
      have hnot := fun he => hmiss ((hc.core_edges x y).mpr he)
      have he : ({x,y} : Finset (Fin 6)) ∈ edges univ := mem_edges.mpr ⟨subset_univ _,by simp [hxy]⟩
      by_contra hn
      exact hnot (mem_sdiff.mpr ⟨he,by simpa only [mem_singleton] using hn⟩)
    have hpair2 : ({z,t} : Finset (Fin 6)) = {1,2} := by
      have hnot := fun he => hmisscd ((hc.core_edges z t).mpr he)
      have he : ({z,t} : Finset (Fin 6)) ∈ edges univ := mem_edges.mpr ⟨subset_univ _,by simp [hzt]⟩
      by_contra hn
      exact hnot (mem_sdiff.mpr ⟨he,by simpa only [mem_singleton] using hn⟩)
    have hm := congrArg (Finset.map i) (hpair1.trans hpair2.symm)
    simpa only [map_insert,map_singleton] using hm
  · intro a ha b hb hab hmiss
    rw [hc.neighborhood] at ha hb
    obtain ⟨x,hx,rfl⟩ := mem_map.mp ha
    obtain ⟨y,hy,rfl⟩ := mem_map.mp hb
    have hxy : x ≠ y := fun he => hab (congrArg i he)
    exact (hmiss ((hc.core_edges x y).mpr (mem_edges.mpr ⟨subset_univ _,by simp [hxy]⟩))).elim

/-- The arm-bound interface follows from uniqueness of the missing link edge. -/
theorem lowLinkBound_of_near {G : SimpleGraph V} {S : Finset V}
    (hNear : ∀ v ∈ peelLow G S, NearClique G (peelNeighbors G S v)) : LowLinkBound G S := by
  classical
  intro v hv u hu
  apply card_le_one.mpr
  intro x hx y hy
  have hxN := (mem_erase.mp (mem_filter.mp hx).1).2
  have hyN := (mem_erase.mp (mem_filter.mp hy).1).2
  have hxu := (mem_erase.mp (mem_filter.mp hx).1).1
  have hyu := (mem_erase.mp (mem_filter.mp hy).1).1
  have hpair := hNear v hv u hu x hxN hxu.symm (mem_filter.mp hx).2
    u hu y hyN hyu.symm (mem_filter.mp hy).2
  have hxPair : x ∈ ({u,y} : Finset V) := by rw [← hpair]; simp
  exact mem_singleton.mp ((mem_insert.mp hxPair).resolve_left hxu)

end Tuza06
