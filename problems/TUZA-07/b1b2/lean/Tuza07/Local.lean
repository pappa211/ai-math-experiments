import Tuza07.Basic

namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

/-- The only obstruction to two new triangles is an opposite pair in an old K4. -/
def Compatible (K : Finset (Finset V)) (p q : Finset V) : Prop :=
  ∀ k ∈ K, k.card = 4 → ∀ e ∈ edges p ∩ edges k,
    ∀ f ∈ edges q ∩ edges k, ¬ Disjoint e f

theorem union_singleton_star {A B : Finset (Finset V)} {k : Finset V}
    (hk : k.Nonempty) (hA : A ⊆ edges k) (hB : B ⊆ edges k)
    (hcA : A.card ≤ 1) (hcB : B.card ≤ 1)
    (hi : ∀ e ∈ A, ∀ f ∈ B, ¬ Disjoint e f) :
    ∃ a : V, ∀ e ∈ A ∪ B, a ∈ e := by
  classical
  by_cases hnA : A.Nonempty
  · obtain ⟨e,he⟩ := hnA
    by_cases hnB : B.Nonempty
    · obtain ⟨f,hf⟩ := hnB
      obtain ⟨a,hae,haf⟩ := not_disjoint_iff.mp (hi e he f hf)
      refine ⟨a,fun g hg => ?_⟩
      rcases mem_union.mp hg with hg|hg
      · exact (card_le_one.mp hcA g hg e he).symm ▸ hae
      · exact (card_le_one.mp hcB g hg f hf).symm ▸ haf
    · rw [not_nonempty_iff_eq_empty.mp hnB,union_empty]
      exact singleton_footprint_star hk hA hcA
  · rw [not_nonempty_iff_eq_empty.mp hnA,empty_union]
    exact singleton_footprint_star hk hB hcB

theorem blocks_avoid_compatible {H G : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {p q : Finset V}
    (hp : p ∈ newTriangles H G) (hq : q ∈ newTriangles H G)
    (hcomp : Compatible K p q) :
    ∃ P, Packing (triangles H) P ∧ P.card = nu (triangles H) ∧
      Disjoint (support P) (edges p ∪ edges q) := by
  classical
  have hex : ∀ k : Finset V, ∃ P : Finset (Finset V), k ∈ K →
      Packing (cliqueFamily k) P ∧ P.card = nu (cliqueFamily k) ∧
      Disjoint (support P) (edges p ∪ edges q) := by
    intro k
    by_cases hk : k ∈ K
    · have hpc := new_triangle_block_overlap hp (hK.clique k hk)
      have hqc := new_triangle_block_overlap hq (hK.clique k hk)
      have hD : ((edges p ∪ edges q) ∩ edges k).card ≤ 2 := by
        rw [union_inter_distrib_right]
        exact (card_union_le _ _).trans (by omega)
      rcases hK.size k hk with h4|h5
      · have hstar : ∃ a : V, ∀ e ∈ (edges p ∪ edges q) ∩ edges k, a ∈ e := by
          rw [union_inter_distrib_right]
          exact union_singleton_star (card_pos.mp (by omega)) inter_subset_right
            inter_subset_right hpc hqc (hcomp k hk h4)
        obtain ⟨P,hP⟩ := clique_avoid_edges (hK.clique k hk) (Or.inl h4) hD hstar
        exact ⟨P,fun _ => hP⟩
      · obtain ⟨P,hP,hcard,hd⟩ := k5_avoid_two h5 inter_subset_right hD
        refine ⟨P,fun _ => ⟨hP,hcard.trans (k5_parameters h5).1.symm,?_⟩⟩
        apply disjoint_left.mpr
        intro e he heD
        exact disjoint_left.mp hd he (mem_inter.mpr ⟨heD,blocks_support_subset k
          (support_mono hP.1 he)⟩)
    · exact ⟨∅,fun h => (hk h).elim⟩
  choose f hf using hex
  have hpack := fun k hk => (hf k hk).1
  refine ⟨K.biUnion f,blocks_combine_packings hK f hpack,?_,?_⟩
  · rw [blocks_packing_card hK f hpack,blocks_nu hK]
    exact sum_congr rfl (fun k hk => (hf k hk).2.1)
  · apply disjoint_left.mpr
    intro e he heD
    obtain ⟨t,ht,het⟩ := mem_biUnion.mp he
    obtain ⟨k,hk,htk⟩ := mem_biUnion.mp ht
    exact disjoint_left.mp (hf k hk).2.2 (mem_biUnion.mpr ⟨t,htk,het⟩) heD

theorem compatible_pair_packing {H G : SimpleGraph V} (hHG : H ≤ G)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K) {p q : Finset V}
    (hp : p ∈ newTriangles H G) (hq : q ∈ newTriangles H G)
    (hd : Disjoint (edges p) (edges q)) (hcomp : Compatible K p q) :
    ∃ P, Packing (triangles G) P ∧ P.card = nu (triangles H) + 2 := by
  classical
  obtain ⟨P,hP,hcard,havoid⟩ := blocks_avoid_compatible hK hp hq hcomp
  have hp3 := (mem_triangles.mp (mem_newTriangles.mp hp).1).card_eq
  have hpq : p ≠ q := by
    intro heq
    have he : edges p = ∅ := disjoint_self.mp (heq ▸ hd)
    exact (edges_nonempty (s:=p) (by omega)).ne_empty he
  have hpair : Packing (triangles G) {p,q} := by
    refine ⟨by simp [insert_subset_iff,(mem_newTriangles.mp hp).1,(mem_newTriangles.mp hq).1],?_⟩
    intro a ha b hb hab
    simp only [mem_insert,mem_singleton] at ha hb
    rcases ha with rfl|rfl <;> rcases hb with rfl|rfl
    · exact (hab rfl).elim
    · exact hd
    · exact hd.symm
    · exact (hab rfl).elim
  have happ := append_packing hHG hP hpair (by simpa [support] using havoid)
  exact ⟨P ∪ {p,q},happ.1,by simpa [hcard,card_pair hpq] using happ.2⟩

theorem partition_cover {k A B : Finset V} (h : k ⊆ A ∪ B) :
    Covers (cliqueFamily k) (edges A ∪ edges B) := by
  classical
  intro t ht
  have ht3 := (mem_powersetCard.mp ht).2
  have hsub := (mem_powersetCard.mp ht).1.trans h
  by_cases hA : 2 ≤ (t ∩ A).card
  · obtain ⟨e,he⟩ := edges_nonempty hA
    exact ⟨e,mem_union_left _ (edges_mono inter_subset_right he),edges_mono inter_subset_left he⟩
  · by_cases hB : 2 ≤ (t ∩ B).card
    · obtain ⟨e,he⟩ := edges_nonempty hB
      exact ⟨e,mem_union_right _ (edges_mono inter_subset_right he),edges_mono inter_subset_left he⟩
    · have htAB : t ⊆ (t ∩ A) ∪ (t ∩ B) := by
        intro x hx
        rcases mem_union.mp (hsub hx) with ha|hb
        · exact mem_union_left _ (mem_inter.mpr ⟨hx,ha⟩)
        · exact mem_union_right _ (mem_inter.mpr ⟨hx,hb⟩)
      have hc := (card_le_card htAB).trans (card_union_le _ _)
      omega

theorem block_cover_for_edge {k e : Finset V} (hk : k.card = 4 ∨ k.card = 5)
    (he : e ∈ edges k) : ∃ C,
    Covers (cliqueFamily k) C ∧ C ⊆ edges k ∧ C.card ≤ 2 * nu (cliqueFamily k) ∧
    e ∈ C ∧ (k.card = 4 → k \ e ∈ C) := by
  classical
  have he2 := (mem_edges.mp he).2
  have hsub := (mem_edges.mp he).1
  rcases hk with h4|h5
  · refine ⟨{e,k \ e},k4_opposite_cover h4 (cliqueFamily_valid k)
      (fun _ ht => (mem_powersetCard.mp ht).1) he,?_,?_,by simp,by simp⟩
    · simp only [insert_subset_iff,singleton_subset_iff]
      exact ⟨he,mem_edges.mpr ⟨sdiff_subset,by rw [card_sdiff_of_subset hsub,h4,he2]⟩⟩
    · rw [(k4_parameters h4).1]
      exact (card_insert_le _ _).trans (by simp)
  · let C := edges e ∪ edges (k \ e)
    have hC : Covers (cliqueFamily k) C := partition_cover (by rw [union_sdiff_of_subset hsub])
    refine ⟨C,hC,union_subset (edges_mono hsub) (edges_mono sdiff_subset),?_,?_,by omega⟩
    · have hcard := card_union_le (edges e) (edges (k \ e))
      have hcE : (edges e).card = 1 := by simp [edges,card_powersetCard,he2]
      have hcK : (edges (k \ e)).card = 3 := by
        rw [edges,card_powersetCard,card_sdiff_of_subset hsub,h5,he2]; decide
      rw [(k5_parameters h5).1]
      dsimp [C]
      omega
    · exact mem_union_left _ (mem_edges.mpr ⟨Subset.rfl,he2⟩)

theorem opposite_eq_complement {k e f : Finset V} (hk : k.card = 4)
    (he : e ∈ edges k) (hf : f ∈ edges k) (hd : Disjoint e f) : f = k \ e := by
  apply eq_of_subset_of_card_le
  · exact subset_sdiff.mpr ⟨(mem_edges.mp hf).1,hd.symm⟩
  · rw [card_sdiff_of_subset (mem_edges.mp he).1,hk,(mem_edges.mp he).2,(mem_edges.mp hf).2]
end Tuza07
