import Tuza06.SmallLinksK4
import Tuza06.SmallLinksFour

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Every vertex of a nonempty closed link set has two distinct link neighbors,
using two distinct FULL graph triangles on its hub spoke. -/
theorem minimal_link_two_neighbors {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v a : V} {C : Finset V} (hC : LinkClosed G v C) (ha : a ∈ C) :
    ∃ b ∈ C, ∃ c ∈ C, b ≠ c ∧ G.Adj a b ∧ G.Adj a c := by
  classical
  have hva := hC.1 a ha
  have hvaNe : v ≠ a := G.ne_of_adj hva
  have hA : G.IsNClique 2 ({v,a} : Finset V) := by
    refine ⟨?_,by simp [hvaNe]⟩
    simpa only [Finset.coe_pair] using
      (SimpleGraph.isClique_pair (G := G) (a := v) (b := a)).mpr (fun _ => hva)
  obtain ⟨T,hT,S,hS,hAT,hAS,hTS⟩ := minimal_edge_two_triangles hG hA
  obtain ⟨b,hbA,hTb⟩ := third_vertex (mem_triangles.mp hT).card_eq hAT
  obtain ⟨c,hcA,hSc⟩ := third_vertex (mem_triangles.mp hS).card_eq hAS
  have hbT : b ∈ T := by rw [hTb]; simp
  have hcS : c ∈ S := by rw [hSc]; simp
  have hbv : b ≠ v := by intro h; exact hbA (by simp [h])
  have hcv : c ≠ v := by intro h; exact hcA (by simp [h])
  have hba : b ≠ a := by intro h; exact hbA (by simp [h])
  have hca : c ≠ a := by intro h; exact hcA (by simp [h])
  have hbC : b ∈ C := (mem_insert.mp (linkClosed_spoke_triangle hC ha hT hAT hbT)).resolve_left hbv
  have hcC : c ∈ C := (mem_insert.mp (linkClosed_spoke_triangle hC ha hS hAS hcS)).resolve_left hcv
  have hbc : b ≠ c := by
    intro h
    apply hTS
    rw [hTb,hSc,h]
  have haT : a ∈ T := (mem_edges.mp hAT).1 (by simp)
  have haS : a ∈ S := (mem_edges.mp hAS).1 (by simp)
  exact ⟨b,hbC,c,hcC,hbc,(mem_triangles.mp hT).isClique haT hbT hba.symm,
    (mem_triangles.mp hS).isClique haS hcS hca.symm⟩

/-- Two link neighbors force a closed three-vertex link to be a clique. -/
theorem two_neighbors_clique_three {G : SimpleGraph V} {C : Finset V} (hC3 : C.card = 3)
    (hmin : ∀ a ∈ C, ∃ b ∈ C, ∃ c ∈ C, b ≠ c ∧ G.Adj a b ∧ G.Adj a c) :
    G.IsClique (C : Set V) := by
  intro a ha b hb hab
  change a ∈ C at ha
  change b ∈ C at hb
  obtain ⟨x,hx,y,hy,hxy,hax,hay⟩ := hmin a ha
  have hxa : x ≠ a := (G.ne_of_adj hax).symm
  have hya : y ≠ a := (G.ne_of_adj hay).symm
  have hsub : ({x,y} : Finset V) ⊆ C.erase a := by
    simp only [insert_subset_iff,singleton_subset_iff]
    exact ⟨mem_erase.mpr ⟨hxa,hx⟩,mem_erase.mpr ⟨hya,hy⟩⟩
  have heq : ({x,y} : Finset V) = C.erase a := eq_of_subset_of_card_le hsub (by
    rw [card_pair hxy,card_erase_of_mem ha,hC3])
  have hbxy : b ∈ ({x,y} : Finset V) := heq.symm ▸ mem_erase.mpr ⟨hab.symm,hb⟩
  rcases mem_insert.mp hbxy with hbx|hby
  · exact hbx ▸ hax
  · exact (mem_singleton.mp hby) ▸ hay

/-- On four link vertices, a missing ab edge forces every other vertex to be a
neighbor of a, because a already has two distinct neighbors. -/
theorem two_neighbors_force_cross {G : SimpleGraph V} {C : Finset V} (hC4 : C.card = 4)
    (hmin : ∀ a ∈ C, ∃ b ∈ C, ∃ c ∈ C, b ≠ c ∧ G.Adj a b ∧ G.Adj a c)
    {a b c : V} (ha : a ∈ C) (hb : b ∈ C) (hab : a ≠ b) (hnab : ¬ G.Adj a b)
    (hc : c ∈ C \ ({a,b} : Finset V)) : G.Adj a c := by
  obtain ⟨x,hx,y,hy,hxy,hax,hay⟩ := hmin a ha
  have hxa : x ≠ a := (G.ne_of_adj hax).symm
  have hya : y ≠ a := (G.ne_of_adj hay).symm
  have hxb : x ≠ b := fun h => hnab (h ▸ hax)
  have hyb : y ≠ b := fun h => hnab (h ▸ hay)
  have hsub : ({x,y} : Finset V) ⊆ C \ {a,b} := by
    simp only [insert_subset_iff,singleton_subset_iff,mem_sdiff,mem_insert,mem_singleton,not_or]
    exact ⟨⟨hx,hxa,hxb⟩,hy,hya,hyb⟩
  have habC : ({a,b} : Finset V) ⊆ C := by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro ha hb
  have heq : ({x,y} : Finset V) = C \ {a,b} := eq_of_subset_of_card_le hsub (by
    rw [card_pair hxy,card_sdiff_of_subset habC,hC4,card_pair hab])
  have hcxy : c ∈ ({x,y} : Finset V) := heq.symm ▸ hc
  rcases mem_insert.mp hcxy with hcx|hcy
  · exact hcx ▸ hax
  · exact (mem_singleton.mp hcy) ▸ hay

/-- Full small-link exclusion: every nonempty closed link set has at least five
vertices. This includes each actual link component and allows arbitrary other
link components and outside attachments. -/
theorem minimal_closed_link_size {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} {C : Finset V} (hC : LinkClosed G v C) (hne : C.Nonempty) : 5 ≤ C.card := by
  classical
  have hmin : ∀ a ∈ C, ∃ b ∈ C, ∃ c ∈ C, b ≠ c ∧ G.Adj a b ∧ G.Adj a c :=
    fun a ha => minimal_link_two_neighbors hG hC ha
  obtain ⟨a,ha⟩ := hne
  obtain ⟨b,hb,c,hc,hbc,habG,hacG⟩ := hmin a ha
  have hab : a ≠ b := G.ne_of_adj habG
  have hac : a ≠ c := G.ne_of_adj hacG
  have hsub : ({a,b,c} : Finset V) ⊆ C := by
    simp only [insert_subset_iff,singleton_subset_iff]
    exact ⟨ha,hb,hc⟩
  have hCge3 : 3 ≤ C.card := by
    have hcard : ({a,b,c} : Finset V).card = 3 := card_eq_three.mpr ⟨a,b,c,hab,hac,hbc,rfl⟩
    simpa only [hcard] using card_le_card hsub
  by_contra hn
  have hcases : C.card = 3 ∨ C.card = 4 := by omega
  rcases hcases with hC3|hC4
  · exact minimal_no_k3_link hG hC hC3 (two_neighbors_clique_three hC3 hmin)
  · by_cases hclique : G.IsClique (C : Set V)
    · exact minimal_no_k4_link hG hC hC4 hclique
    · have hmissing : ∃ a ∈ C, ∃ b ∈ C, a ≠ b ∧ ¬ G.Adj a b := by
        by_contra hnone
        apply hclique
        intro x hx y hy hxy
        change x ∈ C at hx
        change y ∈ C at hy
        by_contra hnadj
        exact hnone ⟨x,hx,y,hy,hxy,hnadj⟩
      obtain ⟨a,ha,b,hb,hab,hnab⟩ := hmissing
      let A : Finset V := {a,b}
      have hAC : A ⊆ C := by simp [A,insert_subset_iff,ha,hb]
      have hA2 : A.card = 2 := by simp [A,hab]
      have hM2 : (C \ A).card = 2 := by rw [card_sdiff_of_subset hAC,hC4,hA2]
      obtain ⟨c,d,hcd,hMeq⟩ := card_eq_two.mp hM2
      have hcM : c ∈ C \ A := by rw [hMeq]; simp
      have hdM : d ∈ C \ A := by rw [hMeq]; simp
      have hcC := (mem_sdiff.mp hcM).1
      have hdC := (mem_sdiff.mp hdM).1
      have hca : c ≠ a := fun h => (mem_sdiff.mp hcM).2 (by simp [A,h])
      have hcb : c ≠ b := fun h => (mem_sdiff.mp hcM).2 (by simp [A,h])
      have hda : d ≠ a := fun h => (mem_sdiff.mp hdM).2 (by simp [A,h])
      have hdb : d ≠ b := fun h => (mem_sdiff.mp hdM).2 (by simp [A,h])
      have hCeq : C = {a,b,c,d} := by
        calc
          C = A ∪ (C \ A) := (union_sdiff_of_subset hAC).symm
          _ = {a,b,c,d} := by rw [hMeq]; ext z; simp only [A,mem_union,mem_insert,mem_singleton]; tauto
      have hClosed : LinkClosed G v {a,b,c,d} := hCeq ▸ hC
      have hacG := two_neighbors_force_cross hC4 hmin ha hb hab hnab hcM
      have hadG := two_neighbors_force_cross hC4 hmin ha hb hab hnab hdM
      have hnba : ¬ G.Adj b a := fun h => hnab h.symm
      have hcM' : c ∈ C \ ({b,a} : Finset V) := by simpa only [pair_comm b a] using hcM
      have hdM' : d ∈ C \ ({b,a} : Finset V) := by simpa only [pair_comm b a] using hdM
      have hbcG := two_neighbors_force_cross hC4 hmin hb ha hab.symm hnba hcM'
      have hbdG := two_neighbors_force_cross hC4 hmin hb ha hab.symm hnba hdM'
      exact minimal_no_cross_four_link hG hab hca.symm hda.symm hcb.symm hdb.symm hcd
        hClosed hnab hacG hadG hbcG hbdG

end Tuza06

#check @Tuza06.minimal_closed_link_size
#print axioms Tuza06.minimal_closed_link_size
