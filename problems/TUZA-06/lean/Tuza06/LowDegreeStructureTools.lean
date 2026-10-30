import Tuza06.FiveLinkClassification
import Tuza06.NearClique
import Tuza06.DominatingFive
import Tuza06.DominatingNearSix
import Tuza06.DominatingCliqueSix
import Tuza06.AdjacentLow

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem minimal_degree_five_near {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} (hdeg : degreeWithin G univ v = 5) : NearClique G (peelNeighbors G univ v) := by
  obtain ⟨i,hi,hcfg⟩ := minimal_degree_five_configuration hG hdeg
  have hc : FiveLinkConfiguration G i (edges univ \ {{1,2}}) ∨ FiveLinkConfiguration G i (edges univ) := by
    simpa only [fiveNearCore,fiveCliqueCore] using hcfg
  have hn := canonical_configuration_near hc
  simpa only [hi] using hn

/-- A displayed finite triangle family maps to actual graph triangles whenever
all its edge certificates are genuine graph edges. No full ambient edge bound is imposed. -/
theorem mapped_triangles_of_edges {I : Type*} [DecidableEq I] {G : SimpleGraph V}
    (i : I ↪ V) {P E : Finset (Finset I)}
    (hE : ∀ e ∈ E, G.IsNClique 2 (e.map i))
    (hP : ∀ p ∈ P, p.card = 3 ∧ edges p ⊆ E) : liftFamily i P ⊆ triangles G := by
  intro t ht
  obtain ⟨p,hp,rfl⟩ := mem_liftFamily.mp ht
  refine mem_triangles.mpr ⟨?_,by simpa using (hP p hp).1⟩
  intro a ha b hb hab
  obtain ⟨x,hx,rfl⟩ := mem_map.mp ha
  obtain ⟨y,hy,rfl⟩ := mem_map.mp hb
  have hxy : x ≠ y := fun h => hab (congrArg i h)
  have hpair : ({x,y} : Finset I) ∈ E := (hP p hp).2 (mem_edges.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hx hy,by simp [hxy]⟩)
  exact (hE _ hpair).isClique (by simp) (by simp) hab

theorem configuration_subpattern_triangles {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E)
    (r : Fin 6 ↪ Fin 6) {P : Finset (Finset (Fin 6))}
    (hP : liftFamily r P ⊆ coreFamily E) : liftFamily (r.trans i) P ⊆ triangles G := by
  rw [← liftFamily_comp]
  intro t ht
  obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp ht
  exact (core_triangle_iff hr s).mpr (hP hs)

theorem finite_embedding_range_eq {I : Type*} [Fintype I] [DecidableEq I]
    (r : I ↪ I) : (univ : Finset I).map r = univ := by
  apply eq_of_subset_of_card_le (subset_univ _)
  simp

theorem core_neighbor_range {G : SimpleGraph V} {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))}
    (hr : FiveLinkConfiguration G i E) {k : Fin 6}
    (hdeg : degreeWithin G univ (i k) = 5)
    (hstar : ∀ a : Fin 6, a ≠ k → ({k,a} : Finset (Fin 6)) ∈ E) :
    ∀ z, G.Adj (i k) z → z ∈ (univ : Finset (Fin 6)).map i := by
  classical
  let N := (univ.erase k).map i
  have hSub : N ⊆ peelNeighbors G univ (i k) := by
    intro z hz
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hz
    exact mem_filter.mpr ⟨mem_univ _,(hr.core_edges k a).mpr (hstar a (mem_erase.mp ha).1)⟩
  have hNcard : N.card = 5 := by simp [N]
  have hNeighbors : (peelNeighbors G univ (i k)).card = 5 := hdeg
  have heq : N = peelNeighbors G univ (i k) := eq_of_subset_of_card_le hSub (by omega)
  intro z hz
  have hzN : z ∈ N := heq.symm ▸ mem_filter.mpr ⟨mem_univ _,hz⟩
  obtain ⟨a,ha,rfl⟩ := mem_map.mp hzN
  exact mem_map.mpr ⟨a,mem_univ _,rfl⟩

end Tuza06
