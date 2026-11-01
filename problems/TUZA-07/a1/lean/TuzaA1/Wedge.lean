import TuzaA1.Extension

namespace TuzaA1
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem packing_avoiding_survives {G : SimpleGraph V} {P S : Finset (Finset V)}
    (hp : Packing (triangles G) P) (hd : Disjoint (support P) S) :
    Packing (triangles (removeEdgeFamily G S)) P := by
  refine ⟨?_,hp.2⟩
  intro t ht
  exact mem_triangles_remove.mpr ⟨hp.1 ht,disjoint_left.mpr (fun e he heS =>
    disjoint_left.mp hd (mem_biUnion.mpr ⟨t,ht,he⟩) heS)⟩

theorem wedge {G : SimpleGraph V} (hG : EdgeMinimalTuzaCounterexample G)
    {T e : Finset V} (ht : T ∈ triangles G) (he : e ∈ edges T) :
    let H := removeEdgeFamily G {e}
    let F := (edges T).erase e
    F.card = 2 ∧ (∀ f ∈ F, H.IsNClique 2 f) ∧
    removeEdgeFamily H F = removeEdgeFamily G (edges T) ∧
    nu (triangles H) = nu (triangles G) ∧ tau (triangles H) = 2 * nu (triangles G) ∧
    nu (triangles (removeEdgeFamily H F)) + 1 = nu (triangles G) ∧
    tau (triangles (removeEdgeFamily H F)) + 2 = 2 * nu (triangles G) ∧
    (∀ f ∈ F, nu (triangles (removeEdgeFamily H {f})) = nu (triangles G) ∧
      tau (triangles (removeEdgeFamily H {f})) + 1 = 2 * nu (triangles G)) ∧
    (∀ P, Packing (triangles H) P → P.card = nu (triangles H) →
      ¬ Disjoint (support P) F) := by
  classical
  let H := removeEdgeFamily G {e}
  let F := (edges T).erase e
  have hcard : F.card = 2 := by
    dsimp [F]
    rw [card_erase_of_mem he,edges_triangle_card (triangles_valid G T ht)]
  have hactual : ∀ f ∈ F, H.IsNClique 2 f := by
    intro f hf
    exact actual_edge_remove (actual_edge_of_triangle ht (mem_of_mem_erase hf))
      (by simpa using (ne_of_mem_erase hf))
  have hid : removeEdgeFamily H F = removeEdgeFamily G (edges T) := by
    dsimp [H,F]
    rw [remove_union]
    simp [singleton_union,insert_erase he]
  have hc := edge_criticality hG (actual_edge_of_triangle ht he)
  have hr := one_triangle_residual hG ht
  rw [← hid] at hr
  refine ⟨hcard,hactual,hid,hc.1,hc.2.1,hr.1,hr.2,?_,?_⟩
  · intro f hf
    have hfc : ({e,f} : Finset (Finset V)).card ≤ 2 := by
      have h := card_insert_le e ({f} : Finset (Finset V))
      simpa using h
    have hfa : ∀ a ∈ ({e,f} : Finset (Finset V)), G.IsNClique 2 a := by
      intro a ha
      rcases mem_insert.mp ha with rfl|ha
      · exact actual_edge_of_triangle ht he
      · exact mem_singleton.mp ha ▸ actual_edge_of_triangle ht (mem_of_mem_erase hf)
    have hn := small_deletion_nu hG hfc hfa
    have hpair : removeEdgeFamily H {f} = removeEdgeFamily G {e,f} := by
      dsimp [H]
      rw [remove_union]
      simp
    have hlast : removeEdgeFamily (removeEdgeFamily H {f}) (F.erase f) =
        removeEdgeFamily H F := by
      rw [remove_union]
      rw [singleton_union,insert_erase (show f ∈ F from hf)]
    have hcLast := tau_le_remove_add (removeEdgeFamily H {f}) (F.erase f)
    rw [hlast,card_erase_of_mem hf,hcard] at hcLast
    have hcFirst := tau_le_remove_add H {f}
    simp only [card_singleton] at hcFirst
    have htH : tau (triangles H) = 2 * nu (triangles G) := hc.2.1
    refine ⟨by rw [hpair]; exact hn, ?_⟩
    dsimp only [H,F] at *
    omega
  · intro P hp hpc hd
    have hsurv := packing_avoiding_survives hp hd
    have hb := packing_card_le hsurv
    have hnH : nu (triangles H) = nu (triangles G) := hc.1
    dsimp only [H,F] at *
    omega

/-- The chosen base really is absent in the old graph. -/
theorem removed_pair_not_adj (G : SimpleGraph V) (u v : V) :
    ¬ (removeEdgeFamily G {{u,v}}).Adj u v := by
  intro h
  exact h.2 (mem_singleton_self _)

/-- Literal labelled identity, independent of G and its outside vertices. -/
theorem labelled_spokes {u v w : V} (huv : u ≠ v) (huw : u ≠ w) (hvw : v ≠ w) :
    (edges ({u,v,w} : Finset V)).erase {u,v} = {{u,w},{v,w}} := by
  ext f
  constructor
  · intro hf
    have hfT := mem_edges.mp (mem_of_mem_erase hf)
    have hne := ne_of_mem_erase hf
    obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp hfT.2
    have ha := hfT.1 (show a ∈ ({a,b} : Finset V) by simp)
    have hb := hfT.1 (show b ∈ ({a,b} : Finset V) by simp)
    simp only [mem_insert,mem_singleton] at ha hb
    rcases ha with rfl|rfl|rfl <;> rcases hb with rfl|rfl|rfl <;>
      simp_all [pair_comm]
  · intro hf
    simp only [mem_insert,mem_singleton] at hf
    rcases hf with rfl|rfl
    · apply mem_erase.mpr
      refine ⟨?_,mem_edges.mpr ⟨by simp,by simp [huw]⟩⟩
      intro heq
      have : w ∈ ({u,v} : Finset V) := heq ▸ (by simp : w ∈ ({u,w} : Finset V))
      simp only [mem_insert,mem_singleton] at this
      exact this.elim (fun h => huw h.symm) (fun h => hvw h.symm)
    · apply mem_erase.mpr
      refine ⟨?_,mem_edges.mpr ⟨by simp,by simp [hvw]⟩⟩
      intro heq
      have : w ∈ ({u,v} : Finset V) := heq ▸ (by simp : w ∈ ({v,w} : Finset V))
      simp only [mem_insert,mem_singleton] at this
      exact this.elim (fun h => huw h.symm) (fun h => hvw h.symm)
end TuzaA1
