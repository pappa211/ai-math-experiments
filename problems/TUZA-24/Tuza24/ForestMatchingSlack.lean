import Tuza24.ForestMatching

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A finite forest supported on a nonempty vertex set has strictly fewer edges
than available vertices. Isolated vertices outside that set play no role. -/
theorem forest_edgeCount_lt_support {G : SimpleGraph V} (hG : G.IsAcyclic)
    {S : Finset V} (hSn : S.Nonempty)
    (hS : ∀ e, G.IsNClique 2 e → e ⊆ S) : edgeCount G < S.card := by
  classical
  generalize hn : S.card = n
  induction n using Nat.strong_induction_on generalizing G S with
  | h n ih =>
    by_cases hne : ∃ a b, G.Adj a b
    · obtain ⟨x,y,hxy,hleaf⟩ := forest_leaf hG hne
      have hxyE : G.IsNClique 2 ({x,y} : Finset V) :=
        ⟨by simpa [SimpleGraph.isClique_pair,hxy.ne] using hxy,by simp [hxy.ne]⟩
      have hxS : x ∈ S := hS _ hxyE (by simp)
      have hyS : y ∈ S := hS _ hxyE (by simp)
      let H := isolate G {x}
      have hHacy : H.IsAcyclic := isolate_acyclic hG {x}
      have hSn' : (S.erase x).Nonempty := ⟨y,mem_erase.mpr ⟨hxy.ne.symm,hyS⟩⟩
      have hS' : ∀ e, H.IsNClique 2 e → e ⊆ S.erase x := by
        intro e he z hz
        refine mem_erase.mpr ⟨?_,hS e (he.mono (isolate_le G {x})) hz⟩
        intro hzx
        exact disjoint_left.mp (isolate_edge_avoids he) hz (by simp [hzx])
      have hlt : (S.erase x).card < n := by
        rw [← hn]
        exact card_erase_lt_of_mem hxS
      have hind := ih (S.erase x).card hlt hHacy hSn' hS' rfl
      have heNot : ({x,y} : Finset V) ∉ graphEdges H := by
        intro he
        exact disjoint_left.mp (isolate_edge_avoids (mem_graphEdges.mp he))
          (show x ∈ ({x,y} : Finset V) by simp) (by simp)
      have hedges : graphEdges G = insert {x,y} (graphEdges H) := by
        ext e
        constructor
        · intro he
          have heG := mem_graphEdges.mp he
          by_cases hx : x ∈ e
          · obtain ⟨z,hz,hzx⟩ := exists_mem_ne (by rw [heG.card_eq]; decide : 1<e.card) x
            have hzY : z=y := hleaf z (heG.isClique hx hz hzx.symm)
            have hepair : e = {x,y} := by
              apply eq_of_subset_of_card_le
              · intro a ha
                by_cases hax : a=x
                · simp [hax]
                · have hay := hleaf a (heG.isClique hx ha (Ne.symm hax))
                  simp [hay]
              · simp [heG.card_eq,hxy.ne]
            exact mem_insert.mpr (Or.inl hepair)
          · apply mem_insert_of_mem
            apply mem_graphEdges.mpr
            refine ⟨?_,heG.card_eq⟩
            intro a ha b hb hab
            exact ⟨heG.isClique ha hb hab,by simpa using (fun h : a=x => hx (h ▸ ha)),
              by simpa using (fun h : b=x => hx (h ▸ hb))⟩
        · intro he
          rcases mem_insert.mp he with rfl|he
          · exact mem_graphEdges.mpr hxyE
          · exact mem_graphEdges.mpr ((mem_graphEdges.mp he).mono (isolate_le G {x}))
      have hcard : edgeCount G = edgeCount H + 1 := by
        change (graphEdges G).card = (graphEdges H).card + 1
        rw [hedges,card_insert_of_notMem heNot]
      have herase := card_erase_add_one hxS
      omega
    · have hEmpty : graphEdges G = ∅ := by
        apply eq_empty_iff_forall_notMem.mpr
        intro e he
        obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp (mem_graphEdges.mp he).card_eq
        exact hne ⟨a,b,(mem_graphEdges.mp he).isClique (by simp) (by simp) hab⟩
      have hzero : edgeCount G = 0 := by change (graphEdges G).card=0; rw [hEmpty]; rfl
      have hpos := card_pos.mpr hSn
      omega

/-- A vertex-disjoint family of actual edges has twice as many incident vertices. -/
theorem matchingVertices_card {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : EdgeMatching G M) : (matchingVertices M).card = 2*M.card := by
  classical
  unfold matchingVertices
  rw [card_biUnion (by intro e he f hf hef; exact hM.2 e he f hf hef)]
  simp only [id_eq]
  calc
    ∑ e ∈ M, e.card = ∑ _e ∈ M, 2 := sum_congr rfl (fun e he => (hM.1 e he).card_eq)
    _ = 2*M.card := by simp [Nat.mul_comm]

/-- Choose one endpoint from every member of a finite family of nonempty edges. -/
theorem edgeFamily_vertexCover (E : Finset (Finset V))
    (hE : ∀ e ∈ E, e.Nonempty) :
    ∃ Q : Finset V, (∀ e ∈ E, ¬Disjoint e Q) ∧ Q.card ≤ E.card := by
  classical
  have hex : ∀ e : E, ∃ x, x ∈ e.val := fun e => hE e.val e.property
  choose f hf using hex
  refine ⟨E.attach.image f,?_,?_⟩
  · intro e he hd
    apply disjoint_left.mp hd (hf ⟨e,he⟩)
    exact mem_image.mpr ⟨⟨e,he⟩,mem_attach _ _,rfl⟩
  · exact (card_image_le).trans_eq card_attach

/-- A nonempty perfect matching of a forest leaves fewer residual edges than
matching edges, hence admits a strict residual vertex-cover saving. Perfectness
is expressed on the graph's incident vertices, so ambient isolates are harmless. -/
theorem forest_perfect_residual_slack {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : EdgeMatching G M) (hMn : M.Nonempty)
    (hperfect : ∀ e, G.IsNClique 2 e → e ⊆ matchingVertices M) :
    ∃ Q, ResidualVertexCover G M Q ∧ Q.card < M.card := by
  classical
  have hpos : 0<M.card := card_pos.mpr hMn
  have hsupp : (matchingVertices M).Nonempty := by
    apply card_pos.mp
    rw [matchingVertices_card hM]
    omega
  have hbound := forest_edgeCount_lt_support hG hsupp hperfect
  rw [matchingVertices_card hM] at hbound
  have hsub : M ⊆ graphEdges G := fun e he => mem_graphEdges.mpr (hM.1 e he)
  obtain ⟨Q,hQ,hcard⟩ := edgeFamily_vertexCover (graphEdges G \ M) (by
    intro e he
    have heG := mem_graphEdges.mp (mem_sdiff.mp he).1
    exact card_pos.mp (by rw [heG.card_eq]; decide))
  refine ⟨Q,?_,?_⟩
  · intro e he heM
    exact hQ e (mem_sdiff.mpr ⟨mem_graphEdges.mpr he,heM⟩)
  · have hdiff := card_sdiff_of_subset hsub
    have heq : (graphEdges G).card = edgeCount G := rfl
    omega

end Tuza24
