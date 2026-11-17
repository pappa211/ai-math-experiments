import Tuza24.FootprintGeometry

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A vertex-disjoint actual full-link matching supplies its hub packing without
any residual-cover or maximum-matching premise. -/
theorem link_edge_matching_packing {G : SimpleGraph V} {v : V}
    {M : Finset (Finset V)} (hM : EdgeMatching (linkGraph G v) M) :
    Packing (triangles G) (hubPacking v M) ∧ (hubPacking v M).card=M.card := by
  classical
  have hm : LinkMatching G v M univ := by
    refine ⟨fun e he => (hM.1 e he).mono (linkGraph_le G v),
      fun e he => linkGraph_edge_neighbors (hM.1 e he),hM.2,?_⟩
    intro e _ he
    right
    obtain ⟨a,ha⟩ := card_pos.mp (show 0<e.card by rw [he.card_eq]; decide)
    exact fun hd => disjoint_left.mp hd ha (mem_univ a)
  exact hub_matching_packing hm

/-- A non-hub page appends exactly when its rim edges avoid the chosen link matching. -/
theorem hub_page_packing {G : SimpleGraph V} {v : V}
    {M : Finset (Finset V)} (hM : EdgeMatching (linkGraph G v) M)
    {t : Finset V} (ht : t∈triangles G) (hvt : v∉t) (havoid : Disjoint M (edges t)) :
    Packing (triangles G) (hubPacking v M∪{t}) ∧ (hubPacking v M∪{t}).card=M.card+1 := by
  classical
  have hp := link_edge_matching_packing hM
  have hcross : ∀ p∈hubPacking v M,∀ q∈({t}:Finset (Finset V)),Disjoint (edges p) (edges q) := by
    intro p hp q hq
    have hqt : q=t := mem_singleton.mp hq
    subst q
    obtain ⟨e,he,rfl⟩ := mem_image.mp hp
    apply disjoint_left.mpr
    intro f hfp hft
    have hvf : v∉f := fun hv => hvt ((mem_edges.mp hft).1 hv)
    have hfe : f⊆e := by
      intro x hx
      exact (mem_insert.mp ((mem_edges.mp hfp).1 hx)).resolve_left (fun h => hvf (h ▸ hx))
    have hfeq : f=e := eq_of_subset_of_card_le hfe (by rw [(hM.1 e he).card_eq,(mem_edges.mp hfp).2])
    exact disjoint_left.mp havoid (hfeq.symm ▸ he) hft
  have hdisj := cross_disjoint (triangles_mono hp.1.1 (triangles_valid G)) hcross
  refine ⟨?_,?_⟩
  · simpa only [union_self] using packing_union hp.1 (packing_singleton ht) hcross
  · rw [card_union_of_disjoint hdisj,hp.2,card_singleton]

/-- Full-footprint augmentation after balanced accounting. The bound applies to
the union of all selected triangle edges in every residual literal clique. -/
theorem minimal_link_augmentation {G : SimpleGraph V} (hG : MinimalCS G) {v : V}
    {M : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G v M Q)
    (hMn : M.Nonempty) (hQ : Q.card≤M.card)
    {P : Finset (Finset V)} (hP : Packing (triangles G) P) (hlarge : M.card<P.card)
    (hfoot : ∀ k : Finset V, (remove G {v} (M∪spokes v Q)).IsClique (k : Set V) →
      (k.card=4 ∨ k.card=5) →
      (support P∩edges k).card≤2 ∧ ∃ x : V,∀ e∈support P∩edges k,x∈e) : False := by
  classical
  have hbal := minimal_link_matching ((minimalCS_iff_minimalObstruction G).mp hG) hm hMn hQ
  obtain ⟨K,hK⟩ := componentCliques_decomposition hbal.2.2
  obtain ⟨R,hR,hRcard,havoid⟩ := blocks_avoid_edges hK
    (fun k hk => hfoot k (hK.clique k hk) (hK.size k hk))
  have hcross : ∀ p∈P,∀ r∈R,Disjoint (edges p) (edges r) := by
    intro p hp r hr
    apply disjoint_left.mpr
    intro e hep her
    exact disjoint_left.mp havoid (mem_biUnion.mpr ⟨r,hr,her⟩) (mem_biUnion.mpr ⟨p,hp,hep⟩)
  have hpack : Packing (triangles G) (P∪R) := packing_mono
    (union_subset (Subset.refl _) (triangles_mono_graph (remove_le G {v} (M∪spokes v Q))))
    (packing_union hP hR hcross)
  have hdisj := cross_disjoint (triangles_mono hP.1 (triangles_valid G)) hcross
  have hn := packing_card_le hpack
  rw [card_union_of_disjoint hdisj,hRcard] at hn
  omega

/-- At most one surviving rim edge in each residual clique permits a larger
hub matching to contradict the balanced reduction. -/
theorem minimal_link_no_larger_matching {G : SimpleGraph V} (hG : MinimalCS G) {v w : V}
    (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M Z : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G v M Q)
    (hMn : M.Nonempty) (hQ : Q.card≤M.card)
    (hZ : EdgeMatching (linkGraph G v) Z) (hlarge : M.card<Z.card) : False := by
  have hp := link_edge_matching_packing hZ
  apply minimal_link_augmentation hG hm hMn hQ hp.1 (by rw [hp.2]; exact hlarge)
  intro k hk hkcard
  have hsub := hub_surviving_footprint hZ hk
  have hc := (card_le_card hsub).trans (link_matching_clique_footprint
    (remove_le G {v} (M∪spokes v Q)) hF hZ hk)
  have hn : Nonempty V := by
    obtain ⟨x,_⟩ := card_pos.mp (show 0<k.card by rcases hkcard with h|h <;> omega)
    exact ⟨x⟩
  have hs := two_singleton_edge_families_star hc (by simp : (∅:Finset (Finset V)).card≤1)
    (fun e he => (mem_edges.mp (mem_inter.mp (by simpa using he)).2).2)
    (by simp) hn
  simpa using hs

/-- Whole augmented support is contained in the union of the matching and page
footprints, after all hub spokes have been removed. -/
theorem hub_page_surviving_footprint {G : SimpleGraph V} {v : V}
    {M X : Finset (Finset V)} (hM : EdgeMatching (linkGraph G v) M) {t k : Finset V}
    (hk : (remove G {v} X).IsClique (k : Set V)) :
    support (hubPacking v M∪{t})∩edges k ⊆ (M∩edges k)∪(edges t∩edges k) := by
  classical
  intro e he
  obtain ⟨p,hp,hep⟩ := mem_biUnion.mp (mem_inter.mp he).1
  rcases mem_union.mp hp with hp|hp
  · exact mem_union_left _ (hub_surviving_footprint hM hk
      (mem_inter.mpr ⟨mem_biUnion.mpr ⟨p,hp,hep⟩,(mem_inter.mp he).2⟩))
  · exact mem_union_right _ (mem_inter.mpr ⟨(mem_singleton.mp hp) ▸ hep,(mem_inter.mp he).2⟩)

end Tuza24
