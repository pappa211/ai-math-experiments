import Tuza06.PatternTools

namespace Tuza06.DenseExtra
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
-- Labels v,a,b,c,d,x = 0,...,5.
def N : Finset (Fin 6) := {1,2,3,4,5}
def M : Finset (Finset (Fin 6)) := {{3,4},{1,5}}
def Q : Finset (Fin 6) := {1,2}
def Bad : Finset (Finset (Fin 6)) := {{3,5},{4,5}}
def Aug : Finset (Finset (Fin 6)) := {{1,3,4},{0,1,5},{0,2,4}}
def D : Finset (Finset (Fin 6)) := {{1,3},{1,4},{2,4}}
def A : Finset (Fin 6) := {3,4}
private theorem aug_independent : Independent Aug := by
  intro s hs t ht hst
  exact (by decide : ∀ s t : ↥Aug, s.val ≠ t.val → Disjoint (edges s.val) (edges t.val)) ⟨s,hs⟩ ⟨t,ht⟩ hst
private theorem old : ∀ p : ↥Aug, ∀ e : ↥(edges p.val),
    (0 : Fin 6) ∉ e.val → e.val ∉ M → e.val ∈ D := by decide
private theorem term : ∀ e : ↥D, ∃ a : ↥A, a.val ∈ e.val := by decide
private theorem deg : ∀ a : ↥A, (D.filter (fun e => a.val ∈ e)).card ≤ 2 := by decide

variable {V : Type*} [Fintype V] [DecidableEq V]
/-- Only actual local graph facts are assumed; all outside attachments are unrestricted.
The usual K4-plus-fifth-degree-two link supplies these facts immediately. -/
structure Data (G : SimpleGraph V) (i : Fin 6 ↪ V) : Prop where
  neighborhood : peelNeighbors G univ (i 0) = N.map i
  matching_edges : ∀ e ∈ liftFamily i M, G.IsNClique 2 e
  forbidden : ∀ a b : Fin 6, ({a,b} : Finset (Fin 6)) ∈ Bad → ¬ G.Adj (i a) (i b)
  augmentation : liftFamily i Aug ⊆ triangles G

/-- Ordinary Section 5.4, with its maximum residual packing made compatible
symbolically and no bounded-outside-attachment assumption. -/
theorem minimal_no_dense_extra_link {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 6 ↪ V} (hd : Data G i) : False := by
  classical
  have hm : LinkMatching G (i 0) (liftFamily i M) (Q.map i) :=
    linkMatching_of_pattern i 0 N M Q Bad hd.neighborhood hd.matching_edges
      (fun e he => (by decide : ∀ e : ↥M, e.val ⊆ N) ⟨e,he⟩)
      (fun e he f hf hef => (by decide : ∀ e f : ↥M, e.val ≠ f.val → Disjoint e.val f.val) ⟨e,he⟩ ⟨f,hf⟩ hef)
      (by decide) hd.forbidden
  have hM : (liftFamily i M).Nonempty :=
    ⟨({3,4} : Finset (Fin 6)).map i, mem_liftFamily.mpr ⟨{3,4},by decide,rfl⟩⟩
  have hQ : (Q.map i).card ≤ (liftFamily i M).card := by rw [card_map,card_liftFamily]; decide
  have hbal := minimal_link_matching hG hm hM hQ
  let H := remove G {i 0} (liftFamily i M ∪ spokes (i 0) (Q.map i))
  have hblocks : ComponentCliques H := hbal.2.2
  obtain ⟨K, hK⟩ := componentCliques_decomposition hblocks
  have hA : IndependentVertices H (A.map i) := remove_lifted_independent i 0 (by decide : edges A ⊆ M)
  have hterm : ∀ e ∈ liftFamily i D, ∃ a ∈ A.map i, a ∈ e := by
    intro e he
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp he
    obtain ⟨a, ha⟩ := term ⟨s,hs⟩
    exact ⟨i a.val, mem_map.mpr ⟨a.val,a.property,rfl⟩,by simpa using ha⟩
  have hdeg : ∀ a ∈ A.map i, ((liftFamily i D).filter (fun e => a ∈ e)).card ≤ 2 := by
    intro a ha
    obtain ⟨x, hx, rfl⟩ := mem_map.mp ha
    rw [lifted_incidence_card]
    exact deg ⟨x,hx⟩
  obtain ⟨P, hp, hc, hav⟩ := blocks_avoid_terminal_edges hK hA hterm hdeg
  have hAug : Packing (triangles G) (liftFamily i Aug) :=
    ⟨hd.augmentation, (independent_liftFamily i Aug).mpr aug_independent⟩
  have hOld := old_edges_of_pattern (G := G) i 0 M Aug D Q
    (fun p hp e he => old ⟨p,hp⟩ ⟨e,he⟩)
  have hgain := packing_augmentation_avoiding (remove_le G {i 0} _) hp hc hav hAug hOld
  have hcAug : (liftFamily i Aug).card = 3 := by rw [card_liftFamily]; decide
  have hcM : (liftFamily i M).card = 2 := by rw [card_liftFamily]; decide
  have hnu : nu (triangles G) = nu (triangles H) + 2 := by simpa only [hcM] using hbal.1
  change (liftFamily i Aug).card + nu (triangles H) ≤ nu (triangles G) at hgain
  omega
end Tuza06.DenseExtra
