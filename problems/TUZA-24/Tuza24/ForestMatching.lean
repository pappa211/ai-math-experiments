import Tuza24.MatchingAPI

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem isolate_le (G : SimpleGraph V) (U : Finset V) : isolate G U ≤ G :=
  fun _ _ h => h.1

theorem isolate_acyclic {G : SimpleGraph V} (hG : G.IsAcyclic) (U : Finset V) :
    (isolate G U).IsAcyclic := hG.anti (isolate_le G U)

theorem isolate_edge_avoids {G : SimpleGraph V} {U e : Finset V}
    (he : (isolate G U).IsNClique 2 e) : Disjoint e U := by
  apply disjoint_left.mpr
  intro a ha hU
  obtain ⟨b,hb,hba⟩ := exists_mem_ne (by rw [he.card_eq]; decide : 1 < e.card) a
  exact (he.isClique ha hb hba.symm).2.1 hU

theorem matching_mono {G H : SimpleGraph V} (h : G ≤ H) {M : Finset (Finset V)}
    (hm : EdgeMatching G M) : EdgeMatching H M :=
  ⟨fun e he => (hm.1 e he).mono h,hm.2⟩

/-- Every nonempty finite forest has an actual leaf in a nontrivial component. -/
theorem forest_leaf {G : SimpleGraph V} (hG : G.IsAcyclic)
    (hne : ∃ a b, G.Adj a b) : ∃ x y, G.Adj x y ∧ ∀ z, G.Adj x z → z=y := by
  classical
  obtain ⟨a,b,hab⟩ := hne
  let C := G.connectedComponentMk a
  have ha : a ∈ C := rfl
  have hb : b ∈ C := C.mem_supp_of_adj_mem_supp ha hab
  letI : Fintype C := Fintype.ofFinite C
  letI : Nontrivial C := ⟨⟨⟨a,ha⟩,⟨b,hb⟩,fun h => hab.ne (congrArg Subtype.val h)⟩⟩
  obtain ⟨x,hx⟩ := (hG.isTree_connectedComponent C).exists_vert_degree_one_of_nontrivial
  obtain ⟨y,hxy,hy⟩ := SimpleGraph.degree_eq_one_iff_existsUnique_adj.mp hx
  refine ⟨x.val,y.val,hxy,?_⟩
  intro z hxz
  have hz : z ∈ C := C.mem_supp_of_adj_mem_supp x.property hxz
  exact congrArg Subtype.val (hy ⟨z,hz⟩ hxz)

/-- Constructive matching-cover equality for forests. The reverse inequality is
provided separately by weak duality, so no assumed matching minmax enters. -/
theorem forest_matching_cover {G : SimpleGraph V} (hG : G.IsAcyclic) :
    ∃ M Q, EdgeMatching G M ∧ VertexCover G Q ∧ Q.card ≤ M.card := by
  classical
  generalize hn : edgeCount G = n
  induction n using Nat.strong_induction_on generalizing G with
  | h n ih =>
    by_cases hne : ∃ a b, G.Adj a b
    · obtain ⟨x,y,hxy,hleaf⟩ := forest_leaf hG hne
      let H := isolate G {x,y}
      have hHle : H ≤ G := isolate_le G {x,y}
      have hHacy : H.IsAcyclic := isolate_acyclic hG {x,y}
      have hxyE : G.IsNClique 2 ({x,y} : Finset V) :=
        ⟨by simpa [SimpleGraph.isClique_pair,hxy.ne] using hxy,by simp [hxy.ne]⟩
      have hHsmall : edgeCount H < n := by
        rw [← hn]
        apply edgeCount_strict hHle hxyE
        intro he
        have hh := (he.isClique (by simp) (by simp) hxy.ne).2.1
        exact hh (by simp)
      obtain ⟨M,Q,hM,hQ,hcard⟩ := ih (edgeCount H) hHsmall hHacy rfl
      have hMavoids : ∀ e ∈ M, Disjoint e ({x,y} : Finset V) :=
        fun e he => isolate_edge_avoids (hM.1 e he)
      have heNot : ({x,y} : Finset V) ∉ M := by
        intro h
        have hd := hMavoids {x,y} h
        exact disjoint_left.mp hd (mem_insert_self _ _) (mem_insert_self _ _)
      refine ⟨insert {x,y} M,insert y Q,?_,?_,?_⟩
      · constructor
        · intro e he
          rcases mem_insert.mp he with rfl|he
          · exact hxyE
          · exact (hM.1 e he).mono hHle
        · intro e he f hf hef
          rcases mem_insert.mp he with rfl|he <;> rcases mem_insert.mp hf with rfl|hf
          · exact (hef rfl).elim
          · exact (hMavoids f hf).symm
          · exact hMavoids e he
          · exact hM.2 e he f hf hef
      · intro e he
        by_cases hy : y ∈ e
        · intro hd; exact disjoint_left.mp hd hy (mem_insert_self _ _)
        · have hx : x ∉ e := by
            intro hx
            obtain ⟨z,hz,hzx⟩ := exists_mem_ne (by rw [he.card_eq]; decide : 1<e.card) x
            exact hy ((hleaf z (he.isClique hx hz hzx.symm)) ▸ hz)
          have heH : H.IsNClique 2 e := by
            refine ⟨?_,he.card_eq⟩
            intro a ha b hb hab
            refine ⟨he.isClique ha hb hab,?_,?_⟩
            · simp only [mem_insert,mem_singleton,not_or]
              exact ⟨fun h => hx (h ▸ ha),fun h => hy (h ▸ ha)⟩
            · simp only [mem_insert,mem_singleton,not_or]
              exact ⟨fun h => hx (h ▸ hb),fun h => hy (h ▸ hb)⟩
          intro hd
          exact hQ e heH (hd.mono_right (subset_insert _ _))
      · rw [card_insert_of_notMem heNot]
        exact (card_insert_le _ _).trans (Nat.add_le_add_right hcard 1)
    · refine ⟨∅,∅,?_,?_,by simp⟩
      · simp [EdgeMatching]
      · intro e he
        obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he.card_eq
        exact (hne ⟨a,b,he.isClique (by simp) (by simp) hab⟩).elim

/-- Any vertex cover meets distinct matching edges in distinct vertices. -/
theorem matching_card_le_vertexCover {G : SimpleGraph V} {M : Finset (Finset V)}
    {Q : Finset V} (hM : EdgeMatching G M) (hQ : VertexCover G Q) : M.card ≤ Q.card := by
  classical
  by_cases hMn : M.Nonempty
  · obtain ⟨e,he⟩ := hMn
    obtain ⟨x,hx⟩ := card_pos.mp (show 0<e.card by rw [(hM.1 e he).card_eq]; decide)
    letI : Nonempty V := ⟨x⟩
    have hex : ∀ e : Finset V, ∃ x : V, e ∈ M → x ∈ e ∧ x ∈ Q := by
      intro e
      by_cases he : e ∈ M
      · obtain ⟨x,hxe,hxQ⟩ := not_disjoint_iff.mp (hQ e (hM.1 e he))
        exact ⟨x,fun _ => ⟨hxe,hxQ⟩⟩
      · exact ⟨Classical.choice (inferInstance : Nonempty V),fun h => (he h).elim⟩
    choose f hf using hex
    have hinj : Set.InjOn f (M : Set (Finset V)) := by
      intro e he g hg hfg
      by_contra hne
      exact disjoint_left.mp (hM.2 e he g hg hne) (hf e he).1 (hfg.symm ▸ (hf g hg).1)
    calc
      M.card = (M.image f).card := (card_image_iff.mpr hinj).symm
      _ ≤ Q.card := card_le_card (by intro x hx; obtain ⟨e,he,rfl⟩:=mem_image.mp hx; exact (hf e he).2)
  · have hMempty := not_nonempty_iff_eq_empty.mp hMn
    simp [hMempty]

/-- The constructive forest witnesses are simultaneously maximum and minimum. -/
theorem forest_maximum_matching_cover {G : SimpleGraph V} (hG : G.IsAcyclic) :
    ∃ M Q, MaximumMatching G M ∧ VertexCover G Q ∧ Q.card = M.card := by
  obtain ⟨M,Q,hM,hQ,hcard⟩ := forest_matching_cover hG
  have hreverse := matching_card_le_vertexCover hM hQ
  refine ⟨M,Q,⟨hM,?_⟩,hQ,by omega⟩
  intro N hN
  exact (matching_card_le_vertexCover hN hQ).trans hcard

end Tuza24
