import Tuza06.PatternTools

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V I : Type*} [Fintype V] [DecidableEq V] [Fintype I] [DecidableEq I]

/-- A finite certificate for one specified local link pattern. Every field is a
finite combinatorial assertion proved by the concrete instances; no extremal
inequality or graph classification is an assumed field. -/
structure FiniteAugmentation (I : Type*) [Fintype I] [DecidableEq I] where
  hub : I
  N : Finset I
  Q : Finset I
  M : Finset (Finset I)
  BadG : Finset (Finset I)
  Aug : Finset (Finset I)
  D : Finset (Finset I)
  BadH : Finset (Finset I)
  rim_neighbors : ∀ e ∈ M, e ⊆ N
  matching : ∀ e ∈ M, ∀ f ∈ M, e ≠ f → Disjoint e f
  link_cover : ∀ a ∈ N, ∀ b ∈ N, a ∉ Q → b ∉ Q → a ≠ b →
    ({a,b} : Finset I) ∈ M ∨ ({a,b} : Finset I) ∈ BadG
  m_nonempty : M.Nonempty
  cover_size : Q.card ≤ M.card
  independent : Independent Aug
  gain : M.card < Aug.card
  old_edges : ∀ p ∈ Aug, ∀ e ∈ edges p, hub ∉ e → e ∉ M → e ∈ D
  residual_missing : ∀ a b : I, ({a,b} : Finset I) ∈ BadH →
    ({a,b} : Finset I) ∈ M ∨ a = hub ∨ b = hub ∨ ({a,b} : Finset I) ∈ BadG
  footprints : ∀ J : ↥((univ : Finset I).powerset),
    (∀ a ∈ J.val, ∀ b ∈ J.val, a ≠ b → ({a,b} : Finset I) ∉ BadH) →
    (D ∩ edges J.val).card ≤ 2 ∧ ∃ a : I, ∀ e ∈ D ∩ edges J.val, a ∈ e

/-- The meaning of a concrete finite pattern inside an arbitrary ambient graph. -/
structure RealizesAugmentation (W : FiniteAugmentation I) (G : SimpleGraph V) (i : I ↪ V) : Prop where
  neighborhood : peelNeighbors G univ (i W.hub) = W.N.map i
  matching_edges : ∀ e ∈ liftFamily i W.M, G.IsNClique 2 e
  forbidden : ∀ a b : I, ({a,b} : Finset I) ∈ W.BadG → ¬ G.Adj (i a) (i b)
  triangles : liftFamily i W.Aug ⊆ Tuza.triangles G

/-- Any fully certified balanced-then-augmenting pattern is excluded in an actual
minimal combined obstruction, for arbitrary outside attachments. -/
theorem minimal_no_finite_augmentation (W : FiniteAugmentation I)
    {G : SimpleGraph V} (hG : MinimalObstruction G) (i : I ↪ V)
    (hr : RealizesAugmentation W G i) : False := by
  classical
  have hm := linkMatching_of_pattern i W.hub W.N W.M W.Q W.BadG
    hr.neighborhood hr.matching_edges W.rim_neighbors W.matching W.link_cover hr.forbidden
  have hM : (liftFamily i W.M).Nonempty := by
    obtain ⟨e, he⟩ := W.m_nonempty
    exact ⟨e.map i, mem_liftFamily.mpr ⟨e,he,rfl⟩⟩
  have hQ : (W.Q.map i).card ≤ (liftFamily i W.M).card := by
    rw [card_map,card_liftFamily]
    exact W.cover_size
  have hbal := minimal_link_matching hG hm hM hQ
  let H := remove G {i W.hub} (liftFamily i W.M ∪ spokes (i W.hub) (W.Q.map i))
  obtain ⟨K, hK⟩ := componentCliques_decomposition (show ComponentCliques H from hbal.2.2)
  have hBadH : ∀ a b : I, ({a,b} : Finset I) ∈ W.BadH → ¬ H.Adj (i a) (i b) := by
    intro a b hab hadj
    rcases W.residual_missing a b hab with hm | ha | hb | hg
    · exact hadj.2.2.2 (mem_union_left _ (mem_liftFamily.mpr
        ⟨{a,b},hm,by simp only [map_insert,map_singleton]⟩))
    · exact hadj.2.1 (mem_singleton.mpr (congrArg i ha))
    · exact hadj.2.2.1 (mem_singleton.mpr (congrArg i hb))
    · exact hr.forbidden a b hg hadj.1
  have hfoot : ∀ k ∈ K, ((liftFamily i W.D) ∩ edges k).card ≤ 2 ∧
      ∃ a : V, ∀ e ∈ (liftFamily i W.D) ∩ edges k, a ∈ e :=
    fun k hk => footprint_of_pattern i W.D W.BadH hBadH W.footprints (hK.clique k hk)
  obtain ⟨P, hp, hc, hav⟩ := blocks_avoid_edges hK hfoot
  have hAug : Packing (triangles G) (liftFamily i W.Aug) :=
    ⟨hr.triangles, (independent_liftFamily i W.Aug).mpr W.independent⟩
  have hOld := old_edges_of_pattern (G := G) i W.hub W.M W.Aug W.D W.Q W.old_edges
  have hgain := packing_augmentation_avoiding (remove_le G {i W.hub} _) hp hc hav hAug hOld
  have hnu : nu (triangles G) = nu (triangles H) + W.M.card := by
    simpa only [card_liftFamily] using hbal.1
  change (liftFamily i W.Aug).card + nu (triangles H) ≤ nu (triangles G) at hgain
  rw [card_liftFamily] at hgain
  have hg := W.gain
  omega
end Tuza06
