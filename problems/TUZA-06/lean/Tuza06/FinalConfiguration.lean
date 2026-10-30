import Tuza06.FinalCoreReduction
import Tuza06.FinalCoreFinite

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- An embedded final core in an arbitrary finite simple graph. The three
neighborhood inclusions are the only restrictions on outside attachments. -/
structure FinalConfiguration (G : SimpleGraph V) (i : Fin 8 ↪ V) (p q : V) : Prop where
  core_edges : ∀ a b : Fin 8, G.Adj (i a) (i b) ↔ ({a,b} : Finset (Fin 8)) ∈ Core.BEdges
  u_neighbors : ∀ z, G.Adj (i 0) z → z ∈ (univ : Finset (Fin 8)).map i
  v_neighbors : ∀ z, G.Adj (i 1) z → z ∈ (univ : Finset (Fin 8)).map i ∨ z = p
  w_neighbors : ∀ z, G.Adj (i 2) z → z ∈ (univ : Finset (Fin 8)).map i ∨ z = q

/-- The full local family is the image of ALL triangles of the core. -/
theorem configuration_local_family {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hc : FinalConfiguration G i p q) :
    localTriangles G ((univ : Finset (Fin 8)).map i) = liftFamily i Core.family := by
  classical
  have hmap : ∀ t : Finset (Fin 8), t.map i ∈ triangles G ↔ t ∈ Core.family := by
    intro t
    constructor
    · intro ht
      refine mem_filter.mpr ⟨mem_powersetCard.mpr ⟨subset_univ _, ?_⟩, ?_⟩
      · simpa using (mem_triangles.mp ht).card_eq
      · intro e he
        obtain ⟨a, b, hab, rfl⟩ := card_eq_two.mp (mem_edges.mp he).2
        apply (hc.core_edges a b).mp
        exact (mem_triangles.mp ht).isClique
          (mem_map.mpr ⟨a, (mem_edges.mp he).1 (by simp), rfl⟩)
          (mem_map.mpr ⟨b, (mem_edges.mp he).1 (by simp), rfl⟩)
          (fun heq => hab (i.injective heq))
    · intro ht
      refine mem_triangles.mpr ⟨?_, ?_⟩
      · intro a ha b hb hab
        obtain ⟨x, hx, rfl⟩ := mem_map.mp ha
        obtain ⟨y, hy, rfl⟩ := mem_map.mp hb
        apply (hc.core_edges x y).mpr
        exact (mem_filter.mp ht).2 (mem_edges.mpr
          ⟨by simpa only [insert_subset_iff, singleton_subset_iff] using And.intro hx hy,
            by simp [show x ≠ y from fun h => hab (congrArg i h)]⟩)
      · simpa using (Core.family_valid t ht)
  ext t
  constructor
  · intro ht
    have hB := (mem_filter.mp ht).2
    let s := (univ : Finset (Fin 8)).filter (fun x => i x ∈ t)
    have heq : s.map i = t := by
      ext v
      simp only [s, mem_map, mem_filter, mem_univ, true_and]
      constructor
      · rintro ⟨x, hx, rfl⟩; exact hx
      · intro hv
        obtain ⟨x, _, rfl⟩ := mem_map.mp (hB hv)
        exact ⟨x, hv, rfl⟩
    exact mem_liftFamily.mpr ⟨s, (hmap s).mp (heq.symm ▸ (mem_filter.mp ht).1), heq⟩
  · intro ht
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp ht
    exact mem_filter.mpr ⟨(hmap s).mpr hs, map_subset_map.mpr (subset_univ s)⟩

/-- Exact outside-triangle classification, derived from actual graph adjacency. -/
theorem configuration_hub_triangles {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hc : FinalConfiguration G i p q) :
    ∀ t ∈ triangles G, (∃ v ∈ Core.U.map i, v ∈ t) →
      t ∈ localTriangles G ((univ : Finset (Fin 8)).map i) ∨
      ∃ e ∈ ({{i 1,p},{i 2,q}} : Finset (Finset V)), e ∈ edges t := by
  classical
  intro t ht hhub
  by_cases hB : t ⊆ (univ : Finset (Fin 8)).map i
  · exact Or.inl (mem_filter.mpr ⟨ht, hB⟩)
  · obtain ⟨x, hxt, hxB⟩ := not_subset.mp hB
    obtain ⟨v, hvU, hvt⟩ := hhub
    obtain ⟨j, hjU, rfl⟩ := mem_map.mp hvU
    have hjB : i j ∈ (univ : Finset (Fin 8)).map i := mem_map.mpr ⟨j, mem_univ _, rfl⟩
    have hjx : i j ≠ x := by intro h; exact hxB (h ▸ hjB)
    have hadj := (mem_triangles.mp ht).isClique hvt hxt hjx
    simp only [Core.U, mem_insert, mem_singleton] at hjU
    rcases hjU with rfl | rfl | rfl
    · exact (hxB (hc.u_neighbors x hadj)).elim
    · have hxp : x = p := (hc.v_neighbors x hadj).resolve_left hxB
      subst x
      exact Or.inr ⟨{i 1,p}, by simp, mem_edges.mpr
        ⟨by simpa only [insert_subset_iff, singleton_subset_iff] using And.intro hvt hxt,
          by simp [hjx]⟩⟩
    · have hxq : x = q := (hc.w_neighbors x hadj).resolve_left hxB
      subst x
      exact Or.inr ⟨{i 2,q}, by simp, mem_edges.mpr
        ⟨by simpa only [insert_subset_iff, singleton_subset_iff] using And.intro hvt hxt,
          by simp [hjx]⟩⟩

/-- All finite interfaces are discharged by checked core witnesses, and all
outside-attachment interfaces by symbolic graph arguments. -/
theorem configuration_data {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hc : FinalConfiguration G i p q) :
    FinalCoreData G (Core.U.map i) (Core.A.map i) ((univ : Finset (Fin 8)).map i)
      {{i 1,p},{i 2,q}} := by
  classical
  have hlocal := configuration_local_family hc
  constructor
  · exact map_subset_map.mpr (subset_univ _)
  · intro v hv
    obtain ⟨j, hj, rfl⟩ := mem_map.mp hv
    have hj' : j ∈ Core.U ∨ j ∈ Core.A := by fin_cases j <;> decide
    rcases hj' with hu | ha
    · exact mem_union_left _ (mem_map.mpr ⟨j, hu, rfl⟩)
    · exact mem_union_right _ (mem_map.mpr ⟨j, ha, rfl⟩)
  · exact (card_insert_le _ _).trans (by simp)
  · exact configuration_hub_triangles hc
  · refine ⟨liftFamily i Core.P7, ?_, ?_⟩
    · rw [hlocal]
      exact (packing_liftFamily i _ _).mpr Core.packing7.1
    · simpa using Core.packing7.2
  · refine ⟨liftFamily i (edges Core.A ∪ {{0,1},{0,2}}), ?_, ?_, ?_⟩
    · rw [hlocal]
      exact (covers_liftFamily i _ _).mpr Core.cover12_initial
    · rw [edges_map]
      intro e he
      obtain ⟨f, hf, rfl⟩ := mem_liftFamily.mp he
      exact mem_liftFamily.mpr ⟨f, mem_union_left _ hf, rfl⟩
    · simpa using Core.card_initial_le12
  · refine ⟨liftFamily i Core.C9, ?_, ?_⟩
    · rw [hlocal]
      exact (covers_liftFamily i _ _).mpr Core.cover9.1
    · simp [Core.cover9.2]
  · intro f hf g hg hfg
    rw [edges_map] at hf hg
    obtain ⟨a, ha, rfl⟩ := mem_liftFamily.mp hf
    obtain ⟨b, hb, rfl⟩ := mem_liftFamily.mp hg
    have hab : a ≠ b := fun h => hfg (congrArg (Finset.map i) h)
    obtain ⟨P, hP, hcard, hd⟩ := Core.pair_six a ha b hb hab
    refine ⟨liftFamily i P, ?_, by simpa using hcard, ?_⟩
    · rw [hlocal]
      exact (packing_liftFamily i _ _).mpr hP
    · rw [support_liftFamily]
      have h := (liftFamily_disjoint i (support P) {a,b}).mpr hd
      have ha : (Finset.mapEmbedding i).toEmbedding a = a.map i := rfl
      have hb : (Finset.mapEmbedding i).toEmbedding b = b.map i := rfl
      simpa only [liftFamily, Finset.map_insert, Finset.map_singleton, ha, hb] using h

/-- The instantiated final-core inequality reduction for arbitrary ambient graphs. -/
theorem configuration_inequality {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hc : FinalConfiguration G i p q)
    (hind : tau (triangles (prune G (Core.U.map i) (Core.A.map i))) ≤
      2 * nu (triangles (prune G (Core.U.map i) (Core.A.map i)))) :
    tau (triangles G) ≤ 2 * nu (triangles G) := final_core_inequality (configuration_data hc) hind

/-- The instantiated equality exclusion. The residual induction obligations remain
explicit; no claim of the global degeneracy induction is made by this theorem. -/
theorem configuration_strict {G : SimpleGraph V} {i : Fin 8 ↪ V} {p q : V}
    (hc : FinalConfiguration G i p q)
    (hind : tau (triangles (prune G (Core.U.map i) (Core.A.map i))) ≤
      2 * nu (triangles (prune G (Core.U.map i) (Core.A.map i))))
    (heq : tau (triangles (prune G (Core.U.map i) (Core.A.map i))) =
      2 * nu (triangles (prune G (Core.U.map i) (Core.A.map i))) →
      ComponentCliques (prune G (Core.U.map i) (Core.A.map i))) :
    tau (triangles G) < 2 * nu (triangles G) := final_core_strict (configuration_data hc) hind heq

end Tuza06
