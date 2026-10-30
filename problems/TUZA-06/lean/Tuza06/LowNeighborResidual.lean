import Tuza06.LowNeighborEndpointTools

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 6000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem retained_matching_triangle {I : Type*} [Fintype I] [DecidableEq I]
    {G : SimpleGraph V} (i : I ↪ V) (u : I) (M : Finset (Finset I)) (Q t : Finset I)
    (ht : t.map i ∈ triangles G) (hu : u ∉ t) (hd : Disjoint (edges t) M) :
    t.map i ∈ triangles (remove G {i u} (liftFamily i M ∪ spokes (i u) (Q.map i))) := by
  classical
  by_contra hn
  rcases remove_lost_triangle ht hn with hhub|hedge
  · obtain ⟨z,hz,hzt⟩ := hhub
    have hzEq := mem_singleton.mp hz
    subst z
    exact hu ((mem_map.mp hzt).choose_spec.1 |> fun ha => by
      obtain ⟨a,ha,hai⟩ := mem_map.mp hzt
      exact i.injective hai ▸ ha)
  · obtain ⟨e,heX,het⟩ := hedge
    rw [edges_map] at het
    obtain ⟨f,hf,rfl⟩ := mem_liftFamily.mp het
    rcases mem_union.mp heX with heM|heSp
    · exact disjoint_left.mp hd hf ((map_mem_liftFamily i M f).mp heM)
    · obtain ⟨z,hz,hEq⟩ := mem_image.mp heSp
      have huEdge : i u ∈ f.map i := hEq ▸ (by simp : i u ∈ ({i u,z} : Finset V))
      have huT := (mem_edges.mp hf).1
      obtain ⟨a,ha,hai⟩ := mem_map.mp huEdge
      exact hu (i.injective hai ▸ huT ha)

structure ResidualOverlapPattern (I : Type*) [Fintype I] [DecidableEq I] where
  hub : I
  N : Finset I
  M : Finset (Finset I)
  Q : Finset I
  Bad : Finset (Finset I)
  Known : Finset (Finset I)
  S : Finset I
  T : Finset I
  e : Finset I
  a : I
  b : I
  m_nonempty : M.Nonempty
  q_card : Q.card ≤ M.card
  m_size : ∀ f ∈ M, f.card = 2
  m_known : M ⊆ Known
  m_sub : ∀ f ∈ M, f ⊆ N
  m_match : ∀ f ∈ M, ∀ g ∈ M, f ≠ g → Disjoint f g
  choice : ∀ x ∈ N, ∀ y ∈ N, x ∉ Q → y ∉ Q → x ≠ y → {x,y} ∈ M ∨ {x,y} ∈ Bad
  s_tri : S.card = 3 ∧ edges S ⊆ Known
  t_tri : T.card = 3 ∧ edges T ⊆ Known
  s_hub : hub ∉ S
  t_hub : hub ∉ T
  s_old : Disjoint (edges S) M
  t_old : Disjoint (edges T) M
  common_s : e ∈ edges S
  common_t : e ∈ edges T
  a_s : a ∈ S
  b_t : b ∈ T
  ab_ne : a ≠ b
  ab_m : {a,b} ∈ M

theorem ResidualOverlapPattern.excluded {I : Type*} [Fintype I] [DecidableEq I]
    (W : ResidualOverlapPattern I) {G : SimpleGraph V} (hG : MinimalObstruction G) (i : I ↪ V)
    (hN : peelNeighbors G univ (i W.hub) = W.N.map i)
    (hKnown : ∀ f ∈ W.Known, G.IsNClique 2 (f.map i))
    (hBad : ∀ a b, ({a,b} : Finset I) ∈ W.Bad → ¬ G.Adj (i a) (i b)) : False := by
  classical
  have hm : LinkMatching G (i W.hub) (liftFamily i W.M) (W.Q.map i) := by
    apply linkMatching_of_pattern i W.hub W.N W.M W.Q W.Bad hN
    · intro f hf
      obtain ⟨e,he,rfl⟩ := mem_liftFamily.mp hf
      exact hKnown e (W.m_known he)
    · exact W.m_sub
    · exact W.m_match
    · exact W.choice
    · exact hBad
  have hMn : (liftFamily i W.M).Nonempty := by
    obtain ⟨f,hf⟩ := W.m_nonempty
    exact ⟨f.map i,mem_liftFamily.mpr ⟨f,hf,rfl⟩⟩
  have hQc : (W.Q.map i).card ≤ (liftFamily i W.M).card := by
    rw [card_map,card_liftFamily]
    exact W.q_card
  have hblocks := (minimal_link_matching hG hm hMn hQc).2.2
  have htG : ∀ t ∈ ({W.S,W.T} : Finset (Finset I)), t.map i ∈ triangles G := by
    have hSub : liftFamily i ({W.S,W.T} : Finset (Finset I)) ⊆ triangles G := by
      apply mapped_triangles_of_edges i hKnown
      intro t ht
      rcases mem_insert.mp ht with rfl|ht
      · exact W.s_tri
      · exact mem_singleton.mp ht ▸ W.t_tri
    exact fun t ht => hSub (mem_liftFamily.mpr ⟨t,ht,rfl⟩)
  have hs := retained_matching_triangle i W.hub W.M W.Q W.S (htG W.S (by simp)) W.s_hub W.s_old
  have ht := retained_matching_triangle i W.hub W.M W.Q W.T (htG W.T (by simp)) W.t_hub W.t_old
  have hcommon : ¬ Disjoint (edges (W.S.map i)) (edges (W.T.map i)) := by
    intro hd
    rw [edges_map,edges_map] at hd
    exact disjoint_left.mp hd (mem_liftFamily.mpr ⟨W.e,W.common_s,rfl⟩) (mem_liftFamily.mpr ⟨W.e,W.common_t,rfl⟩)
  have hmissing : ¬ (remove G {i W.hub} (liftFamily i W.M ∪ spokes (i W.hub) (W.Q.map i))).Adj (i W.a) (i W.b) := by
    intro hab
    exact hab.2.2.2 (mem_union_left _ (mem_liftFamily.mpr ⟨{W.a,W.b},W.ab_m,by simp only [map_insert,map_singleton]⟩))
  exact clique_components_no_missing_cross_edge hblocks hs ht hcommon
    (mem_map.mpr ⟨W.a,W.a_s,rfl⟩) (mem_map.mpr ⟨W.b,W.b_t,rfl⟩)
    (fun h => W.ab_ne (i.injective h)) hmissing

end Tuza06
