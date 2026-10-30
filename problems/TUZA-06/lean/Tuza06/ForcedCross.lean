import Tuza06.MatchingReduction
import Tuza06.SmallLinksBase
import Tuza06.Transport
namespace Tuza06.CrossPattern
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1600000
-- Labels u,v,w,a,b,c,d,e,p = 0,...,8.
def N : Finset (Fin 9) := {1,2,3,4,5,6,7}
def M : Finset (Finset (Fin 9)) := {{1,5},{2,7},{3,4}}
def Q : Finset (Fin 9) := {3,4,6}
def F : Finset (Finset (Fin 9)) := {{1,2},{1,7},{2,5},{5,7}}
def K : Finset (Fin 9) := {1,8,3,4,5}
def T1 : Finset (Fin 9) := {1,8,3}
def T2 : Finset (Fin 9) := {5,8,3}
private theorem pair_choice : ∀ a b : Fin 9,
    a ∈ N → b ∈ N → a ∉ Q → b ∉ Q → a ≠ b →
    ({a,b} : Finset (Fin 9)) ∈ M ∨ ({a,b} : Finset (Fin 9)) ∈ F := by decide
variable {V : Type*} [Fintype V] [DecidableEq V]
/-- Exact local graph hypotheses; all other outside attachments are arbitrary. -/
structure Data (G : SimpleGraph V) (i : Fin 9 ↪ V) : Prop where
  neighborhood : peelNeighbors G univ (i 0) = N.map i
  matching_edges : ∀ e ∈ liftFamily i M, G.IsNClique 2 e
  forbidden : ∀ a b : Fin 9, ({a,b} : Finset (Fin 9)) ∈ F → ¬ G.Adj (i a) (i b)
  clique : G.IsClique ((K.map i) : Set V)

theorem link_matching {G : SimpleGraph V} {i : Fin 9 ↪ V} (hd : Data G i) :
    LinkMatching G (i 0) (liftFamily i M) (Q.map i) := by
  classical
  constructor
  · exact hd.matching_edges
  · intro e he
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp he
    rw [hd.neighborhood]
    apply map_subset_map.mpr
    exact (by decide : ∀ s : ↥M, s.val ⊆ N) ⟨s,hs⟩
  · intro e he f hf hef
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp he
    obtain ⟨t, ht, rfl⟩ := mem_liftFamily.mp hf
    apply (Finset.disjoint_map i).mpr
    have hst : s ≠ t := fun h => hef (congrArg (Finset.map i) h)
    exact (by decide : ∀ s t : ↥M, s.val ≠ t.val → Disjoint s.val t.val) ⟨s,hs⟩ ⟨t,ht⟩ hst
  · intro e he heG
    by_cases heQ : Disjoint e (Q.map i)
    · have heN := (mem_edges.mp he).1
      rw [hd.neighborhood] at heN
      obtain ⟨x, y, hxy, heq⟩ := card_eq_two.mp heG.card_eq
      have hxN : x ∈ N.map i := heN (by rw [heq]; simp)
      have hyN : y ∈ N.map i := heN (by rw [heq]; simp)
      obtain ⟨a, haN, rfl⟩ := mem_map.mp hxN
      obtain ⟨b, hbN, rfl⟩ := mem_map.mp hyN
      have haQ : a ∉ Q := by
        intro ha
        exact disjoint_left.mp heQ (by rw [heq]; simp) (mem_map.mpr ⟨a,ha,rfl⟩)
      have hbQ : b ∉ Q := by
        intro hb
        exact disjoint_left.mp heQ (by rw [heq]; simp) (mem_map.mpr ⟨b,hb,rfl⟩)
      have hab : a ≠ b := fun h => hxy (congrArg i h)
      rcases pair_choice a b haN hbN haQ hbQ hab with hM | hF
      · left
        apply mem_liftFamily.mpr
        refine ⟨{a,b}, hM, ?_⟩
        simpa only [map_insert, map_singleton] using heq.symm
      · exact (hd.forbidden a b hF (heG.isClique (by rw [heq]; simp) (by rw [heq]; simp) hxy)).elim
    · exact Or.inr heQ

private theorem T1_safe : ∀ a b : ↥T1, a.val ≠ b.val →
    a.val ≠ (0 : Fin 9) ∧ b.val ≠ 0 ∧ ({a.val,b.val} : Finset (Fin 9)) ∉ M := by decide
private theorem T2_safe : ∀ a b : ↥T2, a.val ≠ b.val →
    a.val ≠ (0 : Fin 9) ∧ b.val ≠ 0 ∧ ({a.val,b.val} : Finset (Fin 9)) ∉ M := by decide
private theorem triangle_survives {G : SimpleGraph V} {i : Fin 9 ↪ V} (hd : Data G i)
    {T : Finset (Fin 9)} (hTK : T ⊆ K) (hT3 : T.card = 3)
    (hsafe : ∀ a b : ↥T, a.val ≠ b.val →
      a.val ≠ (0 : Fin 9) ∧ b.val ≠ 0 ∧ ({a.val,b.val} : Finset (Fin 9)) ∉ M) :
    T.map i ∈ triangles (remove G {i 0} (liftFamily i M ∪ spokes (i 0) (Q.map i))) := by
  classical
  apply mem_triangles.mpr
  refine ⟨?_, by simpa using hT3⟩
  intro a ha b hb hab
  obtain ⟨x, hx, rfl⟩ := mem_map.mp ha
  obtain ⟨y, hy, rfl⟩ := mem_map.mp hb
  have hxy : x ≠ y := fun h => hab (congrArg i h)
  have hs := hsafe ⟨x,hx⟩ ⟨y,hy⟩ hxy
  refine ⟨hd.clique (mem_map.mpr ⟨x,hTK hx,rfl⟩) (mem_map.mpr ⟨y,hTK hy,rfl⟩) hab,
    ?_, ?_, ?_⟩
  · intro h
    exact hs.1 (i.injective (mem_singleton.mp h))
  · intro h
    exact hs.2.1 (i.injective (mem_singleton.mp h))
  · intro he
    rcases mem_union.mp he with hm | hsp
    · obtain ⟨e, heM, heq⟩ := mem_liftFamily.mp hm
      have hpair : e = {x,y} := (Finset.map_injective i) (by simpa only [map_insert,map_singleton] using heq)
      exact hs.2.2 (hpair ▸ heM)
    · obtain ⟨z, hz, heq⟩ := mem_image.mp hsp
      obtain ⟨j, hj, rfl⟩ := mem_map.mp hz
      have hpair : ({0,j} : Finset (Fin 9)) = {x,y} :=
        (Finset.map_injective i) (by simpa only [map_insert,map_singleton] using heq)
      have h0 : (0 : Fin 9) ∈ ({x,y} : Finset (Fin 9)) := by rw [← hpair]; simp
      rcases mem_insert.mp h0 with h0 | h0
      · exact hs.1 h0.symm
      · exact hs.2.1 (mem_singleton.mp h0).symm

/-- The missing ce case cannot occur in an actual minimal obstruction.
The residual shared-edge contradiction cannot be repaired by outside vertices. -/
theorem minimal_no_missing_cross {G : SimpleGraph V} (hG : MinimalObstruction G)
    {i : Fin 9 ↪ V} (hd : Data G i) : False := by
  classical
  have hm := link_matching hd
  have hM : (liftFamily i M).Nonempty :=
    ⟨({1,5} : Finset (Fin 9)).map i, mem_liftFamily.mpr ⟨{1,5}, by decide, rfl⟩⟩
  have hQ : (Q.map i).card ≤ (liftFamily i M).card := by
    rw [card_map, card_liftFamily]
    decide
  have hbal := minimal_link_matching hG hm hM hQ
  have ht1 := triangle_survives hd (T := T1) (by decide) (by decide) T1_safe
  have ht2 := triangle_survives hd (T := T2) (by decide) (by decide) T2_safe
  have h83 : i 8 ≠ i 3 := fun h => (by decide : (8 : Fin 9) ≠ 3) (i.injective h)
  have he1 : ({i 8,i 3} : Finset V) ∈ edges (T1.map i) := mem_edges.mpr
    ⟨by simp only [insert_subset_iff,singleton_subset_iff]; exact
      ⟨mem_map.mpr ⟨8,by decide,rfl⟩,mem_map.mpr ⟨3,by decide,rfl⟩⟩, by simp [h83]⟩
  have he2 : ({i 8,i 3} : Finset V) ∈ edges (T2.map i) := mem_edges.mpr
    ⟨by simp only [insert_subset_iff,singleton_subset_iff]; exact
      ⟨mem_map.mpr ⟨8,by decide,rfl⟩,mem_map.mpr ⟨3,by decide,rfl⟩⟩, by simp [h83]⟩
  have hshare : ¬ Disjoint (edges (T1.map i)) (edges (T2.map i)) :=
    fun h => disjoint_left.mp h he1 he2
  apply clique_components_no_missing_cross_edge hbal.2.2 ht1 ht2 hshare
    (a := i 1) (b := i 5)
    (mem_map.mpr ⟨1,by decide,rfl⟩) (mem_map.mpr ⟨5,by decide,rfl⟩)
    (fun h => (by decide : (1 : Fin 9) ≠ 5) (i.injective h))
  intro hadj
  exact hadj.2.2.2 (mem_union_left _ (mem_liftFamily.mpr ⟨{1,5},by decide,
    by simp only [map_insert,map_singleton]⟩))
end Tuza06.CrossPattern
