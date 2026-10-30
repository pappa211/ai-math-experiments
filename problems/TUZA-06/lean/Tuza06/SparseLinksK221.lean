import Tuza06.SparseLinksBadPages
import Tuza06.SparseLinksPage
import Tuza06.K221Finite
import Tuza06.FinalCoreReduction

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem five_hub_triangle_local {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E)
    {t : Finset V} (ht : t ∈ triangles G) (hv : i 0 ∈ t) :
    t ⊆ (univ : Finset (Fin 6)).map i := by
  classical
  intro x hx
  by_cases hxi : x = i 0
  · exact mem_map.mpr ⟨0,mem_univ _,hxi.symm⟩
  · have hadj := (mem_triangles.mp ht).isClique hv hx (Ne.symm hxi)
    have hn : x ∈ peelNeighbors G univ (i 0) := mem_filter.mpr ⟨mem_univ _,hadj⟩
    rw [hr.neighborhood] at hn
    obtain ⟨a,ha,rfl⟩ := mem_map.mp hn
    exact mem_map.mpr ⟨a,mem_univ _,rfl⟩

theorem five_local_family {G : SimpleGraph V} {i : Fin 6 ↪ V}
    {E : Finset (Finset (Fin 6))} (hr : FiveLinkConfiguration G i E) :
    localTriangles G ((univ : Finset (Fin 6)).map i) = liftFamily i (coreFamily E) := by
  ext t
  constructor
  · intro ht
    obtain ⟨s,hs⟩ := pullback_core_subset i (mem_filter.mp ht).2
    exact mem_liftFamily.mpr ⟨s,(core_triangle_iff hr s).mp (hs.symm ▸ (mem_filter.mp ht).1),hs⟩
  · intro ht
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp ht
    exact mem_filter.mpr ⟨(core_triangle_iff hr s).mpr hs,map_subset_map.mpr (subset_univ _)⟩

private theorem k221_nonhub_rim : ∀ e ∈ K221Finite.BEdges, (0 : Fin 6) ∉ e → e ∈ K221Finite.R := by decide

/-- Every arbitrary external page over the six-vertex core has a genuine rim
base and a unique outside apex; hub-edge pages are forced to be local. -/
theorem k221_external_page_repr {G : SimpleGraph V} {i : Fin 6 ↪ V}
    (hr : FiveLinkConfiguration G i K221Finite.BEdges) {t : Finset V}
    (ht : t ∈ externalPages G ((univ : Finset (Fin 6)).map i) ((univ : Finset (Fin 6)).map i)) :
    ∃ f ∈ K221Finite.R, ∃ x ∉ (univ : Finset (Fin 6)).map i, t = insert x (f.map i) := by
  classical
  have htG := (mem_filter.mp ht).1
  obtain ⟨e,heB,het⟩ := (mem_filter.mp ht).2.1
  have hout := (mem_filter.mp ht).2.2
  obtain ⟨f,hfe⟩ := pullback_core_subset i (mem_edges.mp heB).1
  have hf2 : f.card = 2 := by simpa only [← hfe,card_map] using (mem_edges.mp heB).2
  have heG : G.IsNClique 2 e := ⟨fun a ha b hb hab =>
    (mem_triangles.mp htG).isClique ((mem_edges.mp het).1 ha) ((mem_edges.mp het).1 hb) hab,
    (mem_edges.mp het).2⟩
  have hfE : f ∈ K221Finite.BEdges := core_mapped_edge_only hr hf2 (hfe.symm ▸ heG)
  have hf0 : (0 : Fin 6) ∉ f := by
    intro h0
    have hv : i 0 ∈ t := (mem_edges.mp het).1 (hfe ▸ mem_map.mpr ⟨0,h0,rfl⟩)
    exact hout (five_hub_triangle_local hr htG hv)
  have hfR := k221_nonhub_rim f hfE hf0
  obtain ⟨x,hxE,htx⟩ := third_vertex (mem_triangles.mp htG).card_eq het
  have hxB : x ∉ (univ : Finset (Fin 6)).map i := by
    intro hx
    exact hout (htx ▸ insert_subset hx (mem_edges.mp heB).1)
  exact ⟨f,hfR,x,hxB,htx.trans (congrArg (insert x) hfe.symm)⟩

/-- Exact 4/8 accounting from actual minimality for the K221 local core. -/
theorem k221_balanced {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i K221Finite.BEdges) :
    let B := (univ : Finset (Fin 6)).map i
    let H := prune G ∅ B
    Good H ∧ nu (triangles G) = nu (triangles H) + 4 ∧
      tau (triangles H) = 2 * nu (triangles H) ∧ ComponentCliques H := by
  classical
  let B := (univ : Finset (Fin 6)).map i
  let H := prune G ∅ B
  let L := localTriangles G B
  let F := externalPages G B B
  have hlocal : L = liftFamily i K221Finite.family := five_local_family hr
  have hP : Packing (triangles G) (liftFamily i K221Finite.P4) := by
    apply packing_mono (show L ⊆ triangles G from filter_subset _ _)
    rw [hlocal]
    exact (packing_liftFamily i _ _).mpr K221Finite.packing_four.1
  have hcross : ∀ p ∈ liftFamily i K221Finite.P4, ∀ q ∈ triangles H, Disjoint (edges p) (edges q) := by
    intro p hp q hq
    obtain ⟨s,hs,rfl⟩ := mem_liftFamily.mp hp
    exact prune_local_cross (by simp : B ⊆ (∅ : Finset V) ∪ B)
      (map_subset_map.mpr (subset_univ s)) hq
  have hpack := packing_extension (triangles_valid G) (triangles_mono_graph (prune_le G ∅ B)) hP hcross
  rw [card_liftFamily,K221Finite.packing_four.2] at hpack
  change 4 + nu (triangles H) ≤ nu (triangles G) at hpack
  have hRlocal : Covers L (liftFamily i K221Finite.R) := by
    rw [hlocal]
    exact (covers_liftFamily i _ _).mpr K221Finite.rim_cover
  have hRpage : Covers F (liftFamily i K221Finite.R) := by
    intro t ht
    obtain ⟨f,hf,x,hx,heq⟩ := k221_external_page_repr hr ht
    refine ⟨f.map i,mem_liftFamily.mpr ⟨f,hf,rfl⟩,?_⟩
    rw [heq]
    exact mem_edges.mpr ⟨subset_insert _ _,by simpa using K221Finite.rim_edge_size f hf⟩
  have hlost : ∀ t ∈ triangles G, t ∈ triangles H ∨ ∃ e ∈ liftFamily i K221Finite.R, e ∈ edges t := by
    intro t ht
    by_cases htH : t ∈ triangles H
    · exact Or.inl htH
    · rcases prune_lost_triangle ht htH with hU|hbase
      · simp at hU
      · by_cases htB : t ⊆ B
        · exact Or.inr (hRlocal t (mem_filter.mpr ⟨ht,htB⟩))
        · exact Or.inr (hRpage t (mem_filter.mpr ⟨ht,hbase,htB⟩))
  have hcover := cover_extension (triangles_valid H) hlost
  rw [card_liftFamily,K221Finite.R_card] at hcover
  have hA : G.IsNClique 2 (({1,3} : Finset (Fin 6)).map i) := core_mapped_edge hr (by decide) (by decide)
  have hproper : edgeCount H < edgeCount G := by
    apply edgeCount_strict (prune_le G ∅ B) hA
    intro hAH
    have h13 : i (1 : Fin 6) ≠ i (3 : Fin 6) := fun h => (by decide : (1 : Fin 6) ≠ 3) (i.injective h)
    have hadj := hAH.isClique (by simp) (by simp) h13
    exact hadj.2.2.2 ⟨mem_map.mpr ⟨1,mem_univ _,rfl⟩,mem_map.mpr ⟨3,mem_univ _,rfl⟩⟩
  have hGood := hG.2 H (prune_le G ∅ B) hproper
  have hacct := balanced_accounting (failure_lower_bound hG.1) hGood.1 hpack
    (show tau (triangles G) ≤ tau (triangles H) + 2 * 4 by omega)
  exact ⟨hGood,hacct.2.1,hacct.2.2,hGood.2 hacct.2.2⟩

/-- Any disjoint external-page pair in a minimal K221 configuration has bad
bases. Good bases provide a checked local three-packing and an augmentation. -/
theorem k221_pages_bad {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i K221Finite.BEdges)
    (base : Finset V → Finset (Fin 6)) (apex : Finset V → V)
    (hdata : ∀ q ∈ externalPages G ((univ : Finset (Fin 6)).map i) ((univ : Finset (Fin 6)).map i),
      base q ∈ K221Finite.R ∧ apex q ∉ (univ : Finset (Fin 6)).map i ∧
        q = insert (apex q) ((base q).map i)) :
    ∀ s ∈ externalPages G ((univ : Finset (Fin 6)).map i) ((univ : Finset (Fin 6)).map i),
    ∀ t ∈ externalPages G ((univ : Finset (Fin 6)).map i) ((univ : Finset (Fin 6)).map i),
      Disjoint (edges s) (edges t) → K221Finite.Bad (base s) (base t) := by
  classical
  let B := (univ : Finset (Fin 6)).map i
  let H := prune G ∅ B
  let F := externalPages G B B
  have hbal := k221_balanced hG i hr
  have hnu : nu (triangles G) = nu (triangles H) + 4 := hbal.2.1
  have hblocks : ComponentCliques H := hbal.2.2.2
  have hlocal : localTriangles G B = liftFamily i K221Finite.family := five_local_family hr
  have hbaseEdge : ∀ q ∈ F, (base q).map i ∈ edges q := by
    intro q hq
    have he : (base q).map i ∈ edges (insert (apex q) ((base q).map i)) :=
      mem_edges.mpr ⟨subset_insert _ _,by simpa using K221Finite.rim_edge_size _ (hdata q hq).1⟩
    simpa only [← (hdata q hq).2.2] using he
  intro s hs t ht hd
  by_contra hgood
  have hsG := (mem_filter.mp hs).1
  have htG := (mem_filter.mp ht).1
  have hfg : base s ≠ base t := by
    intro heq
    have hsEdge := hbaseEdge s hs
    rw [heq] at hsEdge
    exact disjoint_left.mp hd hsEdge (hbaseEdge t ht)
  obtain ⟨Q,hQ,hQcard,havoid⟩ := K221Finite.good_pair_three _ (hdata s hs).1 _ (hdata t ht).1 hfg hgood
  have hQlocal : Packing (localTriangles G B) (liftFamily i Q) := by
    rw [hlocal]
    exact (packing_liftFamily i _ _).mpr hQ
  have hQG := packing_mono (show localTriangles G B ⊆ triangles G from filter_subset _ _) hQlocal
  have hQB : ∀ q ∈ liftFamily i Q, q ⊆ B := fun q hq => (mem_filter.mp (hQlocal.1 hq)).2
  have hForbidden : Disjoint (support (liftFamily i Q)) {(base s).map i,(base t).map i} := by
    rw [support_liftFamily]
    have h := (liftFamily_disjoint i (support Q) {base s,base t}).mpr havoid
    have hPair : liftFamily i {base s,base t} = {(base s).map i,(base t).map i} := by
      unfold liftFamily
      rw [map_insert,map_singleton]
      rfl
    simpa only [hPair] using h
  have hQs : ∀ q ∈ liftFamily i Q, Disjoint (edges q) (edges s) := by
    intro q hq
    apply external_page_local_cross (mem_triangles.mp hsG).card_eq (hbaseEdge s hs)
      (map_subset_map.mpr (subset_univ _)) (mem_filter.mp hs).2.2 (hQB q hq)
    intro hbase
    exact disjoint_left.mp hForbidden (mem_biUnion.mpr ⟨q,hq,hbase⟩) (by simp)
  have hQt : ∀ q ∈ liftFamily i Q, Disjoint (edges q) (edges t) := by
    intro q hq
    apply external_page_local_cross (mem_triangles.mp htG).card_eq (hbaseEdge t ht)
      (map_subset_map.mpr (subset_univ _)) (mem_filter.mp ht).2.2 (hQB q hq)
    intro hbase
    exact disjoint_left.mp hForbidden (mem_biUnion.mpr ⟨q,hq,hbase⟩) (by simp)
  obtain ⟨K,hK⟩ := componentCliques_decomposition hblocks
  have haug := two_page_augmentation (U := (∅ : Finset V)) (A := B) (B := B) (by simp)
    hK hsG htG (mem_filter.mp hs).2.1 (mem_filter.mp ht).2.1 hd hQG hQB hQs hQt
  rw [card_liftFamily,hQcard] at haug
  change 3 + 2 + nu (triangles H) ≤ nu (triangles G) at haug
  omega

/-- Complete K221 five-link exclusion. Its arbitrary external-page argument and
all finite good/bad-base certificates are discharged in this dependency closure. -/
theorem minimal_no_k221_link {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i K221Finite.BEdges) : False := by
  classical
  let B := (univ : Finset (Fin 6)).map i
  let H := prune G ∅ B
  let F := externalPages G B B
  have hbal := k221_balanced hG i hr
  have hnu : nu (triangles G) = nu (triangles H) + 4 := hbal.2.1
  have hHt : tau (triangles H) = 2 * nu (triangles H) := hbal.2.2.1
  have hrepr : ∀ q : Finset V, ∃ f : Finset (Fin 6), ∃ x : V, q ∈ F →
      f ∈ K221Finite.R ∧ x ∉ B ∧ q = insert x (f.map i) := by
    intro q
    by_cases hq : q ∈ F
    · obtain ⟨f,hf,x,hx,heq⟩ := k221_external_page_repr hr hq
      exact ⟨f,x,fun _ => ⟨hf,hx,heq⟩⟩
    · exact ⟨∅,i 0,fun h => (hq h).elim⟩
  choose base apex hdata using hrepr
  have hdata' : ∀ q ∈ F, base q ∈ K221Finite.R ∧ apex q ∉ B ∧ q = insert (apex q) ((base q).map i) := hdata
  have hFvalid : Triangles F := triangles_mono (filter_subset _ _) (triangles_valid G)
  have hNoGood := k221_pages_bad hG i hr base apex hdata'
  have hFtau : tau F ≤ 2 := bad_partner_mapped_page_cover i (A := ({1,2} : Finset (Fin 6)))
    base apex K221Finite.Bad hFvalid hdata'
    (fun f hf => ⟨K221Finite.rim_edge_size f hf,map_subset_map.mpr (subset_univ _)⟩)
    (fun f hf g hg hb => K221Finite.bad_symm.mp hb)
    K221Finite.bad_partner_unique
    (fun f hf g hg hb hd k hk hc => K221Finite.terminal_hit f hf g hg k hk hb hd hc)
    hNoGood (by decide)
  have hlocal : localTriangles G B = liftFamily i K221Finite.family := five_local_family hr
  have hCLocal : Covers (localTriangles G B) (liftFamily i K221Finite.C4) := by
    rw [hlocal]
    exact (covers_liftFamily i _ _).mpr K221Finite.core_cover_four.1
  obtain ⟨D,hD,hDcard⟩ := exists_min_cover hFvalid
  have hlost : ∀ q ∈ triangles G, q ∈ triangles H ∨
      ∃ e ∈ liftFamily i K221Finite.C4 ∪ D, e ∈ edges q := by
    intro q hq
    by_cases hqH : q ∈ triangles H
    · exact Or.inl hqH
    · rcases prune_lost_triangle hq hqH with hU|hbase
      · simp at hU
      · by_cases hqB : q ⊆ B
        · obtain ⟨e,he,heq⟩ := hCLocal q (mem_filter.mpr ⟨hq,hqB⟩)
          exact Or.inr ⟨e,mem_union_left _ he,heq⟩
        · obtain ⟨e,he,heq⟩ := hD q (mem_filter.mpr ⟨hq,hbase,hqB⟩)
          exact Or.inr ⟨e,mem_union_right _ he,heq⟩
  have hcover := cover_extension (triangles_valid H) hlost
  have hCardLocal : (liftFamily i K221Finite.C4).card = 4 := by simpa using K221Finite.core_cover_four.2
  have hCard := card_union_le (liftFamily i K221Finite.C4) D
  have hfailure := failure_lower_bound hG.1
  omega

namespace SparseLinksK221
 theorem excluded {G : SimpleGraph V} (hG : MinimalObstruction G) (i : Fin 6 ↪ V)
    (hr : FiveLinkConfiguration G i K221Finite.BEdges) : False := minimal_no_k221_link hG i hr
end SparseLinksK221

end Tuza06

#check @Tuza06.minimal_no_k221_link
#print axioms Tuza06.minimal_no_k221_link
