import Tuza06.SparseLinksTools
import Tuza06.UniqueEdge

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

structure SparsePagePattern where
  augmentation : FiniteAugmentation (Fin 7)
  E : Finset (Finset (Fin 6))
  base : Finset (Fin 6)
  oldM : Finset (Finset (Fin 6))
  oldBad : Finset (Finset (Fin 6))
  oldAug : Finset (Finset (Fin 6))
  hub_eq : augmentation.hub = 0
  N_eq : augmentation.N = fiveLinkNeighbors.map sixIntoSeven
  M_eq : augmentation.M = liftFamily sixIntoSeven oldM
  Bad_eq : augmentation.BadG = liftFamily sixIntoSeven oldBad ∪ {{0,6}}
  Aug_eq : augmentation.Aug = liftFamily sixIntoSeven oldAug ∪ {insert 6 (base.map sixIntoSeven)}
  base_two : base.card = 2
  base_edge : base ∈ E
  M_edges : ∀ e ∈ oldM, e.card = 2 ∧ e ∈ E
  bad_edges : ∀ e ∈ oldBad, e.card = 2 ∧ e ∉ E
  aug_triangles : ∀ t ∈ oldAug, t ∈ coreFamily E
  hub_triangle : insert 0 base ∈ coreFamily E
  internal_unique : ∀ t : ↥(coreFamily E), base ∈ edges t.val → t.val = insert 0 base

theorem sparse_pair_edge {G : SimpleGraph V} {a b : V} (h : G.Adj a b) : G.IsNClique 2 ({a,b} : Finset V) := by
  refine ⟨?_,by simp [G.ne_of_adj h]⟩
  simpa only [Finset.coe_pair] using (SimpleGraph.isClique_pair (G := G) (a := a) (b := b)).mpr (fun _ => h)

theorem core_mapped_edge_only {G : SimpleGraph V} {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))}
    (hr : FiveLinkConfiguration G i E) {e : Finset (Fin 6)} (he2 : e.card = 2)
    (heG : G.IsNClique 2 (e.map i)) : e ∈ E := by
  obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he2
  apply (hr.core_edges a b).mp
  exact heG.isClique (by simp) (by simp) (fun h => hab (i.injective h))

/-- An arbitrary external apex is appended to the six local vertices; the finite
seven-label certificate is then instantiated in the full ambient graph. -/
theorem SparsePagePattern.no_external (P : SparsePagePattern) {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : Fin 6 ↪ V) (hr : FiveLinkConfiguration G i P.E)
    {x : V} (hx : x ∉ (univ : Finset (Fin 6)).map i)
    (hpage : insert x (P.base.map i) ∈ triangles G) : False := by
  classical
  have hx' : ∀ a : Fin 6, i a ≠ x := by
    intro a h
    exact hx (mem_map.mpr ⟨a,mem_univ _,h⟩)
  let j := extendFiniteEmbedding i x hx'
  have hjold : sixIntoSeven.trans j = i := extended_six_composition i x hx'
  have hj0 : j 0 = i 0 := extendFiniteEmbedding_old i x hx' 0
  have hj6 : j 6 = x := extendFiniteEmbedding_last i x hx'
  have hNmap : P.augmentation.N.map j = fiveLinkNeighbors.map i := by
    rw [P.N_eq,map_map]
    change fiveLinkNeighbors.map (sixIntoSeven.trans j) = _
    rw [hjold]
  have hMmap : liftFamily j P.augmentation.M = liftFamily i P.oldM := by
    rw [P.M_eq,liftFamily_comp,hjold]
  have hBadmap : liftFamily j P.augmentation.BadG = liftFamily i P.oldBad ∪ {{i 0,x}} := by
    rw [P.Bad_eq,liftFamily_union,liftFamily_comp,hjold]
    change liftFamily i P.oldBad ∪ {({0,6} : Finset (Fin 7)).map j} = _
    simp only [map_insert,map_singleton,hj0,hj6]
  have hBaseMap : (P.base.map sixIntoSeven).map j = P.base.map i := by
    rw [map_map]
    change P.base.map (sixIntoSeven.trans j) = _
    rw [hjold]
  have hAugmap : liftFamily j P.augmentation.Aug = liftFamily i P.oldAug ∪ {insert x (P.base.map i)} := by
    rw [P.Aug_eq,liftFamily_union,liftFamily_comp,hjold]
    change liftFamily i P.oldAug ∪ {(insert 6 (P.base.map sixIntoSeven)).map j} = _
    rw [map_insert,hj6,hBaseMap]
  have hNoOutside : ¬ G.Adj (i 0) x := by
    intro hadj
    have hn : x ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,hadj⟩
    rw [hr.neighborhood] at hn
    obtain ⟨a,ha,heq⟩ := mem_map.mp hn
    exact hx (mem_map.mpr ⟨a,mem_univ _,heq⟩)
  have hNoBad : ∀ e ∈ liftFamily j P.augmentation.BadG, ¬ G.IsNClique 2 e := by
    intro e he heG
    rw [hBadmap] at he
    rcases mem_union.mp he with hold|hnew
    · obtain ⟨f,hf,rfl⟩ := mem_liftFamily.mp hold
      exact (P.bad_edges f hf).2 (core_mapped_edge_only hr (P.bad_edges f hf).1 heG)
    · have heq : e = {i 0,x} := mem_singleton.mp hnew
      subst e
      exact hNoOutside (heG.isClique (by simp) (by simp) (hx' 0))
  have hreal : RealizesAugmentation P.augmentation G j := by
    constructor
    · rw [P.hub_eq,hj0,hNmap]
      exact hr.neighborhood
    · intro e he
      rw [hMmap] at he
      obtain ⟨f,hf,rfl⟩ := mem_liftFamily.mp he
      exact core_mapped_edge hr (P.M_edges f hf).1 (P.M_edges f hf).2
    · intro a b hab hadj
      exact hNoBad {j a,j b} (mem_liftFamily.mpr ⟨{a,b},hab,by simp only [map_insert,map_singleton]⟩)
        (sparse_pair_edge hadj)
    · intro t ht
      rw [hAugmap] at ht
      rcases mem_union.mp ht with hold|hpage'
      · obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp hold
        exact (core_triangle_iff hr s).mpr (P.aug_triangles s hs)
      · exact (mem_singleton.mp hpage') ▸ hpage
  exact minimal_no_finite_augmentation P.augmentation hG j hreal

/-- A triangle-free five-link pattern cannot occur in a minimal obstruction:
a second full graph triangle on its chosen rim edge would have an arbitrary
outside apex, which the fully certified augmentation excludes. -/
theorem SparsePagePattern.excluded (P : SparsePagePattern) {G : SimpleGraph V}
    (hG : MinimalObstruction G) (i : Fin 6 ↪ V) (hr : FiveLinkConfiguration G i P.E) : False := by
  classical
  have hA := core_mapped_edge hr P.base_two P.base_edge
  have hHub : (insert 0 P.base).map i ∈ triangles G := (core_triangle_iff hr _).mpr P.hub_triangle
  have hBase : P.base.map i ∈ edges ((insert 0 P.base).map i) := mem_edges.mpr
    ⟨map_subset_map.mpr (subset_insert _ _),by simpa using P.base_two⟩
  apply minimal_no_unique_triangle_edge hG hA
  refine ⟨(insert 0 P.base).map i,hHub,hBase,?_⟩
  intro t ht hAt
  by_cases hinside : t ⊆ (univ : Finset (Fin 6)).map i
  · obtain ⟨s,hs⟩ := pullback_core_subset i hinside
    have hsTri : s ∈ coreFamily P.E := (core_triangle_iff hr s).mp (hs.symm ▸ ht)
    have hBaseS : P.base ∈ edges s := by
      have hA' : P.base.map i ∈ edges (s.map i) := hs.symm ▸ hAt
      rw [edges_map] at hA'
      obtain ⟨e,he,heq⟩ := mem_liftFamily.mp hA'
      exact (map_inj.mp heq) ▸ he
    have hsEq := P.internal_unique ⟨s,hsTri⟩ hBaseS
    exact hs.symm.trans (congrArg (Finset.map i) hsEq)
  · obtain ⟨x,hxA,htx⟩ := third_vertex (mem_triangles.mp ht).card_eq hAt
    have hx : x ∉ (univ : Finset (Fin 6)).map i := by
      intro hx
      apply hinside
      rw [htx]
      exact insert_subset hx (map_subset_map.mpr (subset_univ _))
    exact (P.no_external hG i hr hx (htx ▸ ht)).elim

end Tuza06
