import Tuza24.PerfectForestExclusionBase
import Tuza24.ApexLinkGeometry
import Tuza24.MatchingChoice

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Every full-link triangle consists entirely of hub neighbors. -/
theorem full_link_triangle_neighbors {G : SimpleGraph V} {v : V} {t : Finset V}
    (ht : t ∈ triangles (linkGraph G v)) : t ⊆ peelNeighbors G univ v := by
  classical
  intro a ha
  obtain ⟨b,hb,hba⟩ := exists_mem_ne
    (by rw [(mem_triangles.mp ht).card_eq]; decide : 1 < t.card) a
  exact mem_filter.mpr ⟨mem_univ _,((mem_triangles.mp ht).isClique ha hb hba.symm).2.1⟩

/-- Every triangle of an apex forest is an apex triangle on an actual forest edge. -/
theorem apexForest_triangle_base {L : SimpleGraph V} {w : V}
    (hF : (isolate L {w}).IsAcyclic) {t : Finset V} (ht : t ∈ triangles L) :
    ∃ a b, (isolate L {w}).Adj a b ∧ L.Adj w a ∧ L.Adj w b := by
  classical
  have hw : w ∈ t := by
    by_contra hw
    have hcl : (isolate L {w}).IsClique (t : Set V) := by
      intro a ha b hb hab
      exact ⟨(mem_triangles.mp ht).isClique ha hb hab,
        by simpa using (ne_of_mem_of_not_mem ha hw),
        by simpa using (ne_of_mem_of_not_mem hb hw)⟩
    have hb := forest_clique_card_le_two hF hcl
    have hc := (mem_triangles.mp ht).card_eq
    omega
  have hcard : (t.erase w).card = 2 := by
    rw [card_erase_of_mem hw,(mem_triangles.mp ht).card_eq]
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp hcard
  have ha : a ∈ t.erase w := by rw [heq]; simp
  have hb : b ∈ t.erase w := by rw [heq]; simp
  have habL := (mem_triangles.mp ht).isClique (mem_of_mem_erase ha) (mem_of_mem_erase hb) hab
  exact ⟨a,b,⟨habL,by simpa using (mem_erase.mp ha).1,by simpa using (mem_erase.mp hb).1⟩,
    (mem_triangles.mp ht).isClique hw (mem_of_mem_erase ha) (mem_erase.mp ha).1.symm,
    (mem_triangles.mp ht).isClique hw (mem_of_mem_erase hb) (mem_erase.mp hb).1.symm⟩

/-- If no original matching edge forms an apex triangle, one may choose exactly
one endpoint per original matching edge while covering every surviving apex spoke. -/
theorem perfect_switch_residual_cover {L : SimpleGraph V} {w t : V}
    {M : Finset (Finset V)} (hM : EdgeMatching (isolate L {w}) M)
    (hactive : ∀ x, L.Adj w x → x ∈ matchingVertices M)
    (hno : ¬ ∃ a b, ({a,b} : Finset V) ∈ M ∧ L.Adj w a ∧ L.Adj w b) :
    ∃ Q, ResidualVertexCover L (insert ({w,t} : Finset V) (matchingResidualEdges (isolate L {w}) M)) Q ∧
      Q.card = M.card := by
  classical
  let B := univ.filter (fun x => L.Adj w x ∧ x ≠ t)
  have hB : B ⊆ matchingVertices M := fun x hx => hactive x (mem_filter.mp hx).2.1
  have hmark : ∀ e ∈ M, (e ∩ B).card ≤ 1 := by
    intro e he
    apply card_le_one.mpr
    intro a ha b hb
    by_contra hab
    have hae := (mem_inter.mp ha).1
    have hbe := (mem_inter.mp hb).1
    have hp : ({a,b} : Finset V) = e := eq_of_subset_of_card_le
      (by intro x hx; rcases mem_insert.mp hx with rfl|hx; exact hae; exact (mem_singleton.mp hx).symm ▸ hbe)
      (by rw [(hM.1 e he).card_eq]; simp [hab])
    exact hno ⟨a,b,hp.symm ▸ he,(mem_filter.mp (mem_inter.mp ha).2).2.1,
      (mem_filter.mp (mem_inter.mp hb).2).2.1⟩
  obtain ⟨Q,hQ,hcard,hBQ⟩ := constrained_matching_vertexCover hM hB hmark
  refine ⟨Q,?_,hcard⟩
  intro e he heP
  by_cases hw : w ∈ e
  · obtain ⟨x,hx,hxw⟩ := exists_mem_ne (by rw [he.card_eq]; decide : 1 < e.card) w
    have hxt : x ≠ t := by
      intro hxt
      have hwt : w ≠ t := fun h => hxw (hxt.trans h.symm)
      have hp : ({w,t} : Finset V) = e := eq_of_subset_of_card_le
        (by intro y hy; rcases mem_insert.mp hy with rfl|hy; exact hw; exact (mem_singleton.mp hy).symm ▸ (hxt ▸ hx))
        (by simp [he.card_eq,hwt])
      exact heP (mem_insert.mpr (Or.inl hp.symm))
    have hxB : x ∈ B := mem_filter.mpr ⟨mem_univ _,he.isClique hw hx hxw.symm,hxt⟩
    exact fun hd => disjoint_left.mp hd hx (hBQ hxB)
  · have heF := isolate_singleton_edge he hw
    have heM : e ∈ M := by
      by_contra hn
      exact heP (mem_insert_of_mem (mem_sdiff.mpr ⟨mem_graphEdges.mpr heF,hn⟩))
    exact hQ e heM

end Tuza24
