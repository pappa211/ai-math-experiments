import Tuza06.MinimalObstruction

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

abbrev B (G : SimpleGraph V) : Prop := ComponentCliques G

def CS (G : SimpleGraph V) : Prop :=
  tau (triangles G) ≤ 2 * nu (triangles G) ∧
  (tau (triangles G) = 2 * nu (triangles G) ↔ B G)

theorem cs_iff_good (G : SimpleGraph V) : CS G ↔ Good G :=
  (good_iff_combined_conclusion G).symm

noncomputable def graphEdges (G : SimpleGraph V) : Finset (Finset V) :=
by
  classical
  exact G.cliqueFinset 2

@[simp] theorem mem_graphEdges {G : SimpleGraph V} {e : Finset V} :
    e ∈ graphEdges G ↔ G.IsNClique 2 e := by
  classical
  exact SimpleGraph.mem_cliqueFinset_iff

def GraphCover (G : SimpleGraph V) (C : Finset (Finset V)) : Prop :=
  C ⊆ graphEdges G ∧ Covers (triangles G) C

theorem exists_graph_min_cover (G : SimpleGraph V) :
    ∃ C, GraphCover G C ∧ C.card = tau (triangles G) := by
  obtain ⟨C,hc,hcard,hactual⟩ := graph_min_cover G
  exact ⟨C,⟨fun e he => mem_graphEdges.mpr (hactual e he),hc⟩,hcard⟩

theorem tau_le_iff_graph_cover (G : SimpleGraph V) (n : ℕ) :
    tau (triangles G) ≤ n ↔ ∃ C, GraphCover G C ∧ C.card ≤ n := by
  constructor
  · intro h
    obtain ⟨C,hc,hcard⟩ := exists_graph_min_cover G
    exact ⟨C,hc,hcard ▸ h⟩
  · rintro ⟨C,hc,hcard⟩
    exact (tau_le_card hc.2).trans hcard

def Nonedges (H : SimpleGraph V) (F : Finset (Finset V)) : Prop :=
  ∀ e ∈ F, e.card = 2 ∧ ¬ H.IsNClique 2 e

def addEdges (H : SimpleGraph V) (F : Finset (Finset V)) : SimpleGraph V where
  Adj a b := H.Adj a b ∨ (a ≠ b ∧ ({a,b} : Finset V) ∈ F)
  symm := ⟨by
    intro a b h
    rcases h with h | ⟨hne,hf⟩
    · exact Or.inl h.symm
    · exact Or.inr ⟨hne.symm,by simpa [pair_comm] using hf⟩⟩
  loopless := ⟨by
    intro a h
    rcases h with h | h
    · exact H.irrefl h
    · exact h.1 rfl⟩

theorem le_addEdges (H : SimpleGraph V) (F : Finset (Finset V)) :
    H ≤ addEdges H F := fun _ _ h => Or.inl h

theorem addEdges_empty (H : SimpleGraph V) : addEdges H ∅ = H := by
  ext a b
  simp [addEdges]

theorem new_triangle_has_added_edge {H : SimpleGraph V} {F : Finset (Finset V)}
    {t : Finset V} (ht : t ∈ triangles (addEdges H F)) (hold : t ∉ triangles H) :
    ∃ e ∈ F, e ∈ edges t := by
  by_contra hn
  apply hold
  refine mem_triangles.mpr ⟨?_,(mem_triangles.mp ht).card_eq⟩
  intro a ha b hb hab
  rcases (mem_triangles.mp ht).isClique ha hb hab with h | h
  · exact h
  · exact (hn ⟨{a,b},h.2,mem_edges.mpr ⟨by simpa only [insert_subset_iff,singleton_subset_iff,mem_coe] using And.intro ha hb,by simp [hab]⟩⟩).elim

theorem insertion_cover_bound (H : SimpleGraph V) (F : Finset (Finset V)) :
    tau (triangles (addEdges H F)) ≤ tau (triangles H) + F.card := by
  apply cover_extension (triangles_valid H)
  intro t ht
  by_cases hold : t ∈ triangles H
  · exact Or.inl hold
  · exact Or.inr (new_triangle_has_added_edge ht hold)

theorem one_edge_insertion {H : SimpleGraph V} {e : Finset V}
    (hB : B H) (he : e.card = 2) (hne : ¬ H.IsNClique 2 e)
    (hnew : ∃ t ∈ triangles (addEdges H {e}), t ∉ triangles H) :
    tau (triangles (addEdges H {e})) + 1 ≤
      2 * nu (triangles (addEdges H {e})) := by
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp he
  have habH : ¬ H.Adj a b := by
    intro h
    apply hne
    rw [heq]
    exact ⟨by simpa [SimpleGraph.isClique_pair,hab] using h,by simp [hab]⟩
  have hi : IndependentVertices H e := by
    rw [heq]
    intro x hx y hy hxy
    simp only [mem_insert,mem_singleton] at hx hy
    rcases hx with rfl|rfl <;> rcases hy with rfl|rfl
    · exact H.irrefl hxy
    · exact habH hxy
    · exact habH hxy.symm
    · exact H.irrefl hxy
  obtain ⟨t,ht,hold⟩ := hnew
  obtain ⟨f,hf,hft⟩ := new_triangle_has_added_edge ht hold
  have hfe : f=e := mem_singleton.mp hf
  have hbase : HasBase e t := ⟨e,by rw [two_vertex_edges he]; simp,hfe ▸ hft⟩
  have hgain := one_triangle_augmentation (le_addEdges H {e}) hB hi ht hbase
  have hupper := insertion_cover_bound H {e}
  have heqH := componentCliques_equality hB
  simp only [card_singleton] at hupper
  omega

end Tuza23
