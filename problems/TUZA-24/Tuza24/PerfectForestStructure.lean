import Tuza24.ForestMatchingSlack
import Tuza24.AlternatingForestDecomposition

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Two intersecting distinct edges can be covered by their shared vertex,
saving one vertex over independent endpoint selection. -/
theorem edgeFamily_strict_vertexCover (E : Finset (Finset V))
    (hE : ∀ e ∈ E, e.Nonempty)
    (hbad : ∃ e ∈ E, ∃ f ∈ E, e ≠ f ∧ ¬ Disjoint e f) :
    ∃ Q : Finset V, (∀ e ∈ E, ¬ Disjoint e Q) ∧ Q.card < E.card := by
  classical
  obtain ⟨e,he,f,hf,hef,hd⟩ := hbad
  obtain ⟨a,hae,haf⟩ := not_disjoint_iff.mp hd
  have hf' : f ∈ E.erase e := mem_erase.mpr ⟨hef.symm,hf⟩
  obtain ⟨Q,hQ,hcard⟩ := edgeFamily_vertexCover ((E.erase e).erase f) (by
    intro g hg
    exact hE g (mem_erase.mp (mem_erase.mp hg).2).2)
  refine ⟨insert a Q,?_,?_⟩
  · intro g hg
    by_cases hge : g=e
    · subst g
      exact fun hd => disjoint_left.mp hd hae (mem_insert_self _ _)
    · by_cases hgf : g=f
      · subst g
        exact fun hd => disjoint_left.mp hd haf (mem_insert_self _ _)
      · exact fun hd => hQ g (mem_erase.mpr ⟨hgf,mem_erase.mpr ⟨hge,hg⟩⟩)
          (hd.mono_right (subset_insert _ _))
  · have h₁ := card_erase_add_one he
    have h₂ := card_erase_add_one hf'
    have h₃ := card_insert_le a Q
    omega

/-- The actual edges outside a specified matching. -/
noncomputable def matchingResidualEdges (G : SimpleGraph V) (M : Finset (Finset V)) :=
  graphEdges G \ M

/-- In a forest with a nonempty perfect matching on its incident vertices,
either the residual cover saves a vertex beyond the usual bound, or the
residual edge family itself is a matching with exactly one fewer edge. -/
theorem perfect_forest_residual_alternative {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : EdgeMatching G M) (hMn : M.Nonempty)
    (hperfect : ∀ e, G.IsNClique 2 e → e ⊆ matchingVertices M) :
    (∃ Q, ResidualVertexCover G M Q ∧ Q.card + 1 < M.card) ∨
    (EdgeMatching G (matchingResidualEdges G M) ∧
      (matchingResidualEdges G M).card + 1 = M.card) := by
  classical
  let R := matchingResidualEdges G M
  have hactual : ∀ e ∈ R, G.IsNClique 2 e := fun e he => mem_graphEdges.mp (mem_sdiff.mp he).1
  have hNonempty : ∀ e ∈ R, e.Nonempty := by
    intro e he
    exact card_pos.mp (by rw [(hactual e he).card_eq]; decide)
  have hMsub : M ⊆ graphEdges G := fun e he => mem_graphEdges.mpr (hM.1 e he)
  have hsupport : (matchingVertices M).Nonempty := by
    apply card_pos.mp
    rw [matchingVertices_card hM]
    have hmpos := card_pos.mpr hMn
    omega
  have hbound := forest_edgeCount_lt_support hG hsupport hperfect
  rw [matchingVertices_card hM] at hbound
  have hdiff : R.card = (graphEdges G).card - M.card := card_sdiff_of_subset hMsub
  have hboundR : R.card < M.card := by
    change (graphEdges G).card < 2 * M.card at hbound
    omega
  have hres : ∀ Q, (∀ e ∈ R, ¬ Disjoint e Q) → ResidualVertexCover G M Q := by
    intro Q hQ e he heM
    exact hQ e (mem_sdiff.mpr ⟨mem_graphEdges.mpr he,heM⟩)
  by_cases hsmall : R.card + 1 < M.card
  · obtain ⟨Q,hQ,hcard⟩ := edgeFamily_vertexCover R hNonempty
    exact Or.inl ⟨Q,hres Q hQ,by omega⟩
  · have hcard : R.card + 1 = M.card := by omega
    by_cases hmatch : EdgeMatching G R
    · exact Or.inr ⟨hmatch,hcard⟩
    · have hbad : ∃ e ∈ R, ∃ f ∈ R, e ≠ f ∧ ¬ Disjoint e f := by
        by_contra h
        push_neg at h
        apply hmatch
        exact ⟨hactual,fun e he f hf hef => h e he f hf hef⟩
      obtain ⟨Q,hQ,hQc⟩ := edgeFamily_strict_vertexCover R hNonempty hbad
      exact Or.inl ⟨Q,hres Q hQ,by omega⟩

/-- A clique avoiding the removed vertices remains an actual clique after isolation. -/
theorem isNClique_isolate_of_disjoint {G : SimpleGraph V} {U e : Finset V}
    (he : G.IsNClique 2 e) (hd : Disjoint e U) : (isolate G U).IsNClique 2 e := by
  refine ⟨?_,he.card_eq⟩
  intro a ha b hb hab
  exact ⟨he.isClique ha hb hab,fun h => disjoint_left.mp hd ha h,
    fun h => disjoint_left.mp hd hb h⟩

/-- A vertex saturated by M but missed by the complementary matching has exactly
one original graph neighbor. Thus it is an original leaf, not a deletion artifact. -/
theorem perfect_residual_unmatched_leaf {G : SimpleGraph V}
    {M : Finset (Finset V)} (hM : EdgeMatching G M) {t : V}
    (ht : t ∈ matchingVertices M \ matchingVertices (matchingResidualEdges G M)) :
    ∃ a, G.Adj t a ∧ ∀ b, G.Adj t b → b=a := by
  classical
  obtain ⟨a,hta,hea⟩ := matching_partner hM (mem_sdiff.mp ht).1
  refine ⟨a,hta,?_⟩
  intro b htb
  have heb : G.IsNClique 2 ({t,b} : Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,htb.ne] using htb,by simp [htb.ne]⟩
  have htbM : ({t,b} : Finset V) ∈ M := by
    by_contra h
    exact (mem_sdiff.mp ht).2 (mem_biUnion.mpr
      ⟨{t,b},mem_sdiff.mpr ⟨mem_graphEdges.mpr heb,h⟩,by simp⟩)
  have heq : ({t,b} : Finset V) = {t,a} := by
    by_contra h
    exact disjoint_left.mp (hM.2 {t,b} htbM {t,a} hea h)
      (by simp : t ∈ ({t,b} : Finset V)) (by simp)
  have hb : b ∈ ({t,a} : Finset V) := heq ▸ (by simp : b ∈ ({t,b} : Finset V))
  rcases mem_insert.mp hb with hbt|hb
  · exact (htb.ne hbt.symm).elim
  · exact mem_singleton.mp hb

/-- In the balanced perfect-forest case, there are exactly two residual-unmatched
vertices in the explicit active set matchingVertices M. -/
theorem perfect_residual_unmatched_card {G : SimpleGraph V}
    {M : Finset (Finset V)} (hM : EdgeMatching G M)
    (hR : EdgeMatching G (matchingResidualEdges G M))
    (hc : (matchingResidualEdges G M).card + 1 = M.card)
    (hperfect : ∀ e, G.IsNClique 2 e → e ⊆ matchingVertices M) :
    (matchingVertices M \ matchingVertices (matchingResidualEdges G M)).card = 2 := by
  classical
  have hsub : matchingVertices (matchingResidualEdges G M) ⊆ matchingVertices M := by
    intro v hv
    obtain ⟨e,he,hve⟩ := mem_biUnion.mp hv
    exact hperfect e (hR.1 e he) hve
  rw [card_sdiff_of_subset hsub,matchingVertices_card hM,matchingVertices_card hR]
  omega

/-- Every original matching edge leaves a residual-unmatched original leaf outside
its endpoints. An isolated K2 containing both possible leaves would contradict
acyclic edge counting on the remaining active vertices. -/
theorem perfect_residual_leaf_outside_edge {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : EdgeMatching G M) (hr : 2 ≤ M.card)
    (hR : EdgeMatching G (matchingResidualEdges G M))
    (hc : (matchingResidualEdges G M).card + 1 = M.card)
    (hperfect : ∀ e, G.IsNClique 2 e → e ⊆ matchingVertices M)
    {f : Finset V} (hf : f ∈ M) :
    ∃ t, t ∈ matchingVertices M ∧ t ∉ matchingVertices (matchingResidualEdges G M) ∧
      t ∉ f ∧ ∃ a, G.Adj t a ∧ ∀ b, G.Adj t b → b=a := by
  classical
  let R := matchingResidualEdges G M
  let S := matchingVertices M
  let T := S \ matchingVertices R
  have hTcard : T.card = 2 := perfect_residual_unmatched_card hM hR hc hperfect
  have hfcard : f.card = 2 := (hM.1 f hf).card_eq
  have hfS : f ⊆ S := fun v hv => mem_biUnion.mpr ⟨f,hf,hv⟩
  have hTex : ∃ t ∈ T, t ∉ f := by
    by_contra h
    push_neg at h
    have hTf : T = f := eq_of_subset_of_card_le h (by omega)
    have havoid : ∀ e ∈ R, Disjoint e f := by
      intro e he
      apply disjoint_left.mpr
      intro v hv hvf
      have hvT : v ∈ T := hTf.symm ▸ hvf
      exact (mem_sdiff.mp hvT).2 (mem_biUnion.mpr ⟨e,he,hv⟩)
    let H := isolate G f
    have hHacy : H.IsAcyclic := isolate_acyclic hG f
    have hHS : ∀ e, H.IsNClique 2 e → e ⊆ S \ f := by
      intro e he v hv
      exact mem_sdiff.mpr ⟨hperfect e (he.mono (isolate_le G f)) hv,
        fun h => disjoint_left.mp (isolate_edge_avoids he) hv h⟩
    have hScard : (S \ f).card + 2 = 2 * M.card := by
      have hd := card_sdiff_of_subset hfS
      have hs : S.card = 2*M.card := matchingVertices_card hM
      omega
    have hSn : (S \ f).Nonempty := card_pos.mp (by omega)
    have hHbound := forest_edgeCount_lt_support hHacy hSn hHS
    have hsub : M.erase f ∪ R ⊆ graphEdges H := by
      intro e he
      apply mem_graphEdges.mpr
      rcases mem_union.mp he with he|he
      · exact isNClique_isolate_of_disjoint (hM.1 e (mem_erase.mp he).2)
          (hM.2 e (mem_erase.mp he).2 f hf (mem_erase.mp he).1)
      · exact isNClique_isolate_of_disjoint (hR.1 e he) (havoid e he)
    have hd : Disjoint (M.erase f) R := by
      apply disjoint_left.mpr
      intro e he heR
      exact (mem_sdiff.mp heR).2 (mem_erase.mp he).2
    have hucard : (M.erase f ∪ R).card + 2 = 2*M.card := by
      rw [card_union_of_disjoint hd]
      have herase := card_erase_add_one hf
      change R.card + 1 = M.card at hc
      omega
    have hle := card_le_card hsub
    change (graphEdges H).card < (S \ f).card at hHbound
    omega
  obtain ⟨t,ht,htf⟩ := hTex
  exact ⟨t,(mem_sdiff.mp ht).1,(mem_sdiff.mp ht).2,htf,perfect_residual_unmatched_leaf hM ht⟩

end Tuza24
