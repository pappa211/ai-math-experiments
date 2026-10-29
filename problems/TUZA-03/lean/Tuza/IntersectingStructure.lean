import Tuza.Intersecting
import Tuza.Graph

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Nontrivial intersecting graph-triangle families lie in one actual K4. -/
theorem intersecting_k4_structure {G : SimpleGraph V} {F : Finset (Finset V)}
    (hFG : F ⊆ triangles G) (hnu : nu F = 1) (htau : 1 < tau F) :
    ∃ k, G.IsNClique 4 k ∧ ∀ t ∈ F, t ⊆ k := by
  classical
  have hf : Triangles F := triangles_mono hFG (triangles_valid G)
  have hi := nu_one_intersecting hf hnu
  have hne : F.Nonempty := by
    by_contra hn
    have he := not_nonempty_iff_eq_empty.mp hn
    simp [he] at hnu
  obtain ⟨s,hs⟩ := hne
  have ht : ∃ t ∈ F, t ≠ s := by
    by_contra hn
    have hall : ∀ t ∈ F, t = s := by intro t ht; by_contra h; exact hn ⟨t,ht,h⟩
    obtain ⟨e,he⟩ := edges_nonempty (s := s) (by rw [hf s hs]; decide)
    have hc : Covers F {e} := by
      intro t ht
      exact ⟨e,mem_singleton_self _,(hall t ht).symm ▸ he⟩
    have hle := tau_le_card hc
    simp only [card_singleton] at hle
    omega
  obtain ⟨t,ht,hts⟩ := ht
  obtain ⟨e,hes,het⟩ := not_disjoint_iff.mp (hi s hs t ht)
  obtain ⟨x,hxe,hsx⟩ := third_vertex (hf s hs) hes
  obtain ⟨y,hye,hty⟩ := third_vertex (hf t ht) het
  have hxy : x ≠ y := by intro he; apply hts; rw [hty,← he,← hsx]
  have hq : ∃ q ∈ F, e ∉ edges q := by
    by_contra hn
    have hc : Covers F {e} := by
      intro q hq
      refine ⟨e,mem_singleton_self _,?_⟩
      by_contra he
      exact hn ⟨q,hq,he⟩
    have hle := tau_le_card hc
    simp only [card_singleton] at hle
    omega
  obtain ⟨q,hq,heq⟩ := hq
  let k := insert x (insert y e)
  have hsk : s ⊆ k := by rw [hsx]; intro a ha; dsimp [k]; simp only [mem_insert] at ha ⊢; tauto
  have htk : t ⊆ k := by rw [hty]; intro a ha; dsimp [k]; simp only [mem_insert] at ha ⊢; tauto
  have hecard : e.card = 2 := (mem_edges.mp hes).2
  have hyS : y ∉ s := by rw [hsx]; simp [hxy.symm,hye]
  have hxyS : ({x,y} : Finset V) ∉ edges s := by
    intro he
    exact hyS ((mem_edges.mp he).1 (by simp))
  have hnonbase : ∀ r ∈ F, e ∉ edges r → r ⊆ k := by
    intro r hr her
    have hxr := outside_common_edge hsx hecard (hi s hs r hr) her
    have hyr := outside_common_edge hty hecard (hi t ht r hr) her
    have hp : ({x,y} : Finset V) ∈ edges r := mem_edges.mpr ⟨by
      intro a ha
      rcases mem_insert.mp ha with rfl | ha
      · exact hxr
      · exact (mem_singleton.mp ha) ▸ hyr,by simp [hxy]⟩
    obtain ⟨z,hzp,hrz⟩ := third_vertex (hf r hr) hp
    have hzs := outside_common_edge hrz (by simp [hxy]) (hi r hr s hs) hxyS
    rw [hrz]
    intro a ha
    rcases mem_insert.mp ha with rfl | ha
    · exact hsk hzs
    · rcases mem_insert.mp ha with rfl | ha
      · simp [k]
      · have hay := mem_singleton.mp ha
        subst a
        simp [k]
  have hqk : q ⊆ k := hnonbase q hq heq
  have hall : ∀ r ∈ F, r ⊆ k := by
    intro r hr
    by_cases her : e ∈ edges r
    · obtain ⟨z,hze,hrz⟩ := third_vertex (hf r hr) her
      have hzq := outside_common_edge hrz hecard (hi r hr q hq) heq
      rw [hrz]
      intro a ha
      rcases mem_insert.mp ha with rfl | ha
      · exact hqk hzq
      · simp [k,ha]
    · exact hnonbase r hr her
  have hxq := outside_common_edge hsx hecard (hi s hs q hq) heq
  have hyq := outside_common_edge hty hecard (hi t ht q hq) heq
  have hsG := mem_triangles.mp (hFG hs)
  have htG := mem_triangles.mp (hFG ht)
  have hqG := mem_triangles.mp (hFG hq)
  refine ⟨k,⟨?_,?_⟩,hall⟩
  · intro a ha b hb hab
    change a ∈ k at ha
    change b ∈ k at hb
    dsimp [k] at ha hb
    simp only [mem_insert] at ha hb
    rcases ha with rfl | rfl | ha <;> rcases hb with rfl | rfl | hb
    · exact (hab rfl).elim
    · exact hqG.isClique hxq hyq hab
    · exact hsG.isClique (by rw [hsx]; simp) (by rw [hsx]; simp [hb]) hab
    · exact hqG.isClique hyq hxq hab
    · exact (hab rfl).elim
    · exact htG.isClique (by rw [hty]; simp) (by rw [hty]; simp [hb]) hab
    · exact hsG.isClique (by rw [hsx]; simp [ha]) (by rw [hsx]; simp) hab
    · exact htG.isClique (by rw [hty]; simp [ha]) (by rw [hty]; simp) hab
    · exact hsG.isClique (by rw [hsx]; simp [ha]) (by rw [hsx]; simp [hb]) hab
  · simp [k,hxy,hxe,hye,hecard]

/-- Any chosen K4 edge and its opposite meet every face. -/
theorem k4_opposite_cover {k : Finset V} (hk : k.card = 4) {F : Finset (Finset V)}
    (hf : Triangles F) (hsub : ∀ t ∈ F, t ⊆ k) {e : Finset V} (he : e ∈ edges k) :
    Covers F {e,k \ e} := by
  intro t ht
  by_cases het : e ∈ edges t
  · exact ⟨e,by simp,het⟩
  · have hnsub : ¬ e ⊆ t := by intro hs; exact het (mem_edges.mpr ⟨hs,(mem_edges.mp he).2⟩)
    obtain ⟨x,hxe,hxt⟩ := not_subset.mp hnsub
    have htx : t ⊆ k.erase x := by
      intro a ha
      exact mem_erase.mpr ⟨by intro h; subst a; exact hxt ha,hsub t ht ha⟩
    have hxk := (mem_edges.mp he).1 hxe
    have heq : t = k.erase x := eq_of_subset_of_card_le htx (by simp [card_erase_of_mem hxk,hk,hf t ht])
    refine ⟨k \ e,by simp,mem_edges.mpr ⟨?_,?_⟩⟩
    · rw [heq]
      intro a ha
      exact mem_erase.mpr ⟨by intro h; subst a; exact (mem_sdiff.mp ha).2 hxe,(mem_sdiff.mp ha).1⟩
    · rw [card_sdiff_of_subset (mem_edges.mp he).1,hk,(mem_edges.mp he).2]

/-- An intersecting triangle family has a two-edge cover containing any prescribed base edge. -/
theorem intersecting_prescribed_cover {G : SimpleGraph V} {F : Finset (Finset V)}
    (hFG : F ⊆ triangles G) (hnu : nu F = 1) {U e : Finset V}
    (hU : U ∈ F) (he : e ∈ edges U) :
    ∃ C, Covers F C ∧ e ∈ C ∧ C.card ≤ 2 := by
  classical
  have hf := triangles_mono hFG (triangles_valid G)
  by_cases ht : tau F ≤ 1
  · obtain ⟨C,hc,hC⟩ := exists_min_cover hf
    refine ⟨insert e C,?_,mem_insert_self _ _,?_⟩
    · intro t ht
      obtain ⟨f,hf,hft⟩ := hc t ht
      exact ⟨f,mem_insert_of_mem hf,hft⟩
    · have hle := card_insert_le e C
      omega
  · obtain ⟨k,hk,hall⟩ := intersecting_k4_structure hFG hnu (by omega)
    have hek := edges_mono (hall U hU) he
    exact ⟨{e,k \ e},k4_opposite_cover hk.card_eq hf hall hek,by simp,
      (card_insert_le _ _).trans (by simp)⟩

#print axioms intersecting_k4_structure
#print axioms intersecting_prescribed_cover
end Tuza
