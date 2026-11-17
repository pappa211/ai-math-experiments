import Tuza06.SmallLinksCross

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem hub_matching_edges_removed {v : V} {C N : Finset V} {M : Finset (Finset V)}
    (hN : N.card = 2) (hNC : N ⊆ C) (hNM : N ∈ M) :
    edges (insert v N) ⊆ spokeEdges v C ∪ M := by
  intro e he
  rcases mem_union.mp (hub_edges_split v N he) with hspoke|hrim
  · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
    exact mem_union_left _ (mem_image.mpr ⟨z,hNC hz,rfl⟩)
  · rw [two_vertex_edges hN] at hrim
    exact mem_union_right _ ((mem_singleton.mp hrim) ▸ hNM)

theorem hub_matching_disjoint {v : V} {A M : Finset V} (hAM : Disjoint A M) :
    Disjoint (edges (insert v A)) (edges (insert v M)) := by
  apply edges_disjoint_of_inter_card
  have hsub : insert v A ∩ insert v M ⊆ {v} := by
    intro z hz
    by_cases hzv : z = v
    · simp [hzv]
    · exact (disjoint_left.mp hAM ((mem_insert.mp (mem_inter.mp hz).1).resolve_left hzv)
        ((mem_insert.mp (mem_inter.mp hz).2).resolve_left hzv)).elim
  exact (card_le_card hsub).trans (by simp)

/-- With ab missing, every hub triangle on four rim vertices meets vc or vd. -/
theorem four_hub_cover {G : SimpleGraph V} {v a b c d : V} {t : Finset V}
    (hC : LinkClosed G v {a,b,c,d}) (hab : a ≠ b) (hnab : ¬ G.Adj a b)
    (ht : t ∈ triangles G) (hvt : v ∈ t) (htB : t ⊆ insert v {a,b,c,d}) :
    ∃ e ∈ ({{v,c},{v,d}} : Finset (Finset V)), e ∈ edges t := by
  classical
  have hvC := linkClosed_not_hub hC
  have hvc : v ≠ c := fun h => hvC (by simp [h])
  have hvd : v ≠ d := fun h => hvC (by simp [h])
  by_cases hct : c ∈ t
  · exact ⟨{v,c},by simp,mem_edges.mpr
      ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hvt hct,by simp [hvc]⟩⟩
  · by_cases hdt : d ∈ t
    · exact ⟨{v,d},by simp,mem_edges.mpr
        ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hvt hdt,by simp [hvd]⟩⟩
    · have hsub : t ⊆ ({v,a,b} : Finset V) := by
        intro z hz
        have hzB := htB hz
        simp only [mem_insert,mem_singleton] at hzB ⊢
        rcases hzB with hzv|hza|hzb|hzc|hzd
        · exact Or.inl hzv
        · exact Or.inr (Or.inl hza)
        · exact Or.inr (Or.inr hzb)
        · exact (hct (hzc ▸ hz)).elim
        · exact (hdt (hzd ▸ hz)).elim
      have heq : t = {v,a,b} := eq_of_subset_of_card_le hsub (by rw [(mem_triangles.mp ht).card_eq]; exact card_le_three)
      exact (hnab ((mem_triangles.mp ht).isClique (by rw [heq]; simp) (by rw [heq]; simp) hab)).elim

/-- Every rim triangle on four vertices with ab missing contains cd. -/
theorem four_rim_cover {G : SimpleGraph V} {a b c d : V} {t : Finset V}
    (hab : a ≠ b) (hcd : c ≠ d) (hnab : ¬ G.Adj a b)
    (ht : t ∈ triangles G) (htC : t ⊆ ({a,b,c,d} : Finset V)) : ({c,d} : Finset V) ∈ edges t := by
  have hct : c ∈ t := by
    by_contra hn
    have hsub : t ⊆ ({a,b,d} : Finset V) := by
      intro z hz
      have hzC := htC hz
      simp only [mem_insert,mem_singleton] at hzC ⊢
      rcases hzC with hza|hzb|hzc|hzd
      · exact Or.inl hza
      · exact Or.inr (Or.inl hzb)
      · exact (hn (hzc ▸ hz)).elim
      · exact Or.inr (Or.inr hzd)
    have heq : t = {a,b,d} := eq_of_subset_of_card_le hsub (by rw [(mem_triangles.mp ht).card_eq]; exact card_le_three)
    exact hnab ((mem_triangles.mp ht).isClique (by rw [heq]; simp) (by rw [heq]; simp) hab)
  have hdt : d ∈ t := by
    by_contra hn
    have hsub : t ⊆ ({a,b,c} : Finset V) := by
      intro z hz
      have hzC := htC hz
      simp only [mem_insert,mem_singleton] at hzC ⊢
      rcases hzC with hza|hzb|hzc|hzd
      · exact Or.inl hza
      · exact Or.inr (Or.inl hzb)
      · exact Or.inr (Or.inr hzc)
      · exact (hn (hzd ▸ hz)).elim
    have heq : t = {a,b,c} := eq_of_subset_of_card_le hsub (by rw [(mem_triangles.mp ht).card_eq]; exact card_le_three)
    exact hnab ((mem_triangles.mp ht).isClique (by rw [heq]; simp) (by rw [heq]; simp) hab)
  exact mem_edges.mpr ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hct hdt,by simp [hcd]⟩

/-- Unified diamond/C4 exclusion. The four cross edges are present, ab is absent,
and cd may be present or absent. All outside attachments remain unrestricted. -/
theorem minimal_no_cross_four_link {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v a b c d : V} (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hC : LinkClosed G v {a,b,c,d}) (hnab : ¬ G.Adj a b)
    (hacG : G.Adj a c) (hadG : G.Adj a d) (hbcG : G.Adj b c) (hbdG : G.Adj b d) : False := by
  classical
  let C : Finset V := {a,b,c,d}
  let B := insert v C
  let A : Finset V := {a,c}
  let M : Finset V := {b,d}
  let TA := insert v A
  let TM := insert v M
  let D : Finset (Finset V) := spokeEdges v C ∪ {A,M}
  let X : Finset (Finset V) := {A,M,{v,c},{v,d}}
  let Y : Finset (Finset V) := {{v,c},{v,d},{c,d}}
  let H := removeEdgeFamily G D
  have hvC : v ∉ C := linkClosed_not_hub hC
  have hAC : A ⊆ C := by simp [A,C,insert_subset_iff]
  have hMC : M ⊆ C := by simp [M,C,insert_subset_iff]
  have hA2 : A.card = 2 := by simp [A,hac]
  have hM2 : M.card = 2 := by simp [M,hbd]
  have hsep : Disjoint A M := by simp [A,M,hab,hab.symm,had,had.symm,hbc,hbc.symm,hcd,hcd.symm]
  have hTAG : TA ∈ triangles G := mem_triangles.mpr
    (SimpleGraph.is3Clique_triple_iff.mpr ⟨hC.1 a (by simp),hC.1 c (by simp),hacG⟩)
  have hTMG : TM ∈ triangles G := mem_triangles.mpr
    (SimpleGraph.is3Clique_triple_iff.mpr ⟨hC.1 b (by simp),hC.1 d (by simp),hbdG⟩)
  have hTA3 := (mem_triangles.mp hTAG).card_eq
  have hdAT := hub_matching_disjoint hsep (v := v)
  have hneAT := triangles_ne_of_edges_disjoint hTA3 hdAT
  have hP : Packing (triangles G) {TA,TM} := packing_pair hTAG hTMG hneAT hdAT
  have hPcard : ({TA,TM} : Finset (Finset V)).card = 2 := card_pair hneAT
  have hAD : A ∈ D := mem_union_right _ (by simp)
  have hTD := hub_matching_edges_removed (v := v) hA2 hAC (show A ∈ ({A,M} : Finset (Finset V)) by simp)
  have hMD := hub_matching_edges_removed (v := v) hM2 hMC (show M ∈ ({A,M} : Finset (Finset V)) by simp)
  have hPD : support {TA,TM} ⊆ D := by
    intro e he
    obtain ⟨T,hT,heT⟩ := mem_biUnion.mp he
    rcases mem_insert.mp hT with hTA|hTM
    · have heTA : e ∈ edges TA := hTA ▸ heT
      exact hTD heTA
    · have heTM : e ∈ edges TM := (mem_singleton.mp hTM) ▸ heT
      exact hMD heTM
  have hlost : ∀ t ∈ triangles G, t ∈ triangles H ∨ ∃ e ∈ X, e ∈ edges t := by
    intro t ht
    by_cases htH : t ∈ triangles H
    · exact Or.inl htH
    · obtain ⟨e,heD,het⟩ := removeEdgeFamily_lost ht htH
      rcases mem_union.mp heD with hspoke|hrim
      · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
        have htB := linkClosed_spoke_triangle hC hz ht het
        have hvt : v ∈ t := (mem_edges.mp het).1 (by simp)
        obtain ⟨f,hf,hft⟩ := four_hub_cover hC hab hnab ht hvt htB
        refine Or.inr ⟨f,?_,hft⟩
        simp only [mem_insert,mem_singleton] at hf
        rcases hf with rfl|rfl <;> simp [X]
      · rcases mem_insert.mp hrim with heA|heM
        · exact Or.inr ⟨A,by simp [X],heA ▸ het⟩
        · exact Or.inr ⟨M,by simp [X],(mem_singleton.mp heM) ▸ het⟩
  have hAG : G.IsNClique 2 A := by
    refine ⟨?_,hA2⟩
    simpa only [A,Finset.coe_pair] using
      (SimpleGraph.isClique_pair (G := G) (a := a) (b := c)).mpr (fun _ => hacG)
  have hbal := minimal_balanced_removeEdges hG hAG hAD hP hPD
    (show X.card ≤ 2 * ({TA,TM} : Finset (Finset V)).card by rw [hPcard]; exact card_le_four) hlost
  have hnu : nu (triangles G) = nu (triangles H) + 2 := by simpa [hPcard] using hbal.2.1
  have hblocks : ComponentCliques H := hbal.2.2.2
  have hnoac : ∀ t ∈ triangles G, A ∈ edges t → t ⊆ B := by
    intro t ht hAt
    by_contra hout
    have hS : ({v,a,d} : Finset V) ∈ triangles G := mem_triangles.mpr
      (SimpleGraph.is3Clique_triple_iff.mpr ⟨hC.1 a (by simp),hC.1 d (by simp),hadG⟩)
    have hR : ({v,c,b} : Finset V) ∈ triangles G := mem_triangles.mpr
      (SimpleGraph.is3Clique_triple_iff.mpr ⟨hC.1 c (by simp),hC.1 b (by simp),hbcG.symm⟩)
    have hsep' : Disjoint ({a,c} : Finset V) {d,b} := by simp [hab,hab.symm,had,had.symm,hbc,hbc.symm,hcd,hcd.symm]
    have hDeq : spokeEdges v C ∪ ({{a,c},{d,b}} : Finset (Finset V)) = D := by
      simp only [D,A,M,pair_comm d b]
    have hblocks' : ComponentCliques (removeEdgeFamily G (spokeEdges v C ∪ {{a,c},{d,b}})) := by
      rw [hDeq]
      exact hblocks
    have haug := crossed_matching_external_augmentation hvC hac hbd.symm hAC
      (show ({d,b} : Finset V) ⊆ C by simp [C,insert_subset_iff]) hsep' ht hAt hout hS hR hblocks'
    rw [hDeq] at haug
    change 3 + nu (triangles H) ≤ nu (triangles G) at haug
    omega
  have hnobd : ∀ t ∈ triangles G, M ∈ edges t → t ⊆ B := by
    intro t ht hMt
    by_contra hout
    have hS : ({v,b,c} : Finset V) ∈ triangles G := mem_triangles.mpr
      (SimpleGraph.is3Clique_triple_iff.mpr ⟨hC.1 b (by simp),hC.1 c (by simp),hbcG⟩)
    have hR : ({v,d,a} : Finset V) ∈ triangles G := mem_triangles.mpr
      (SimpleGraph.is3Clique_triple_iff.mpr ⟨hC.1 d (by simp),hC.1 a (by simp),hadG.symm⟩)
    have hsep' : Disjoint ({b,d} : Finset V) {c,a} := by simp [hab,hab.symm,had,had.symm,hbc,hbc.symm,hcd,hcd.symm]
    have hDeq : spokeEdges v C ∪ ({{b,d},{c,a}} : Finset (Finset V)) = D := by
      simp only [D,A,M,pair_comm c a,pair_comm ({b,d} : Finset V) {a,c}]
    have hblocks' : ComponentCliques (removeEdgeFamily G (spokeEdges v C ∪ {{b,d},{c,a}})) := by rw [hDeq]; exact hblocks
    have haug := crossed_matching_external_augmentation hvC hbd hac.symm hMC
      (show ({c,a} : Finset V) ⊆ C by simp [C,insert_subset_iff]) hsep' ht hMt hout hS hR hblocks'
    rw [hDeq] at haug
    change 3 + nu (triangles H) ≤ nu (triangles G) at haug
    omega
  have hYlost : ∀ t ∈ triangles G, t ∈ triangles H ∨ ∃ e ∈ Y, e ∈ edges t := by
    intro t ht
    by_cases htH : t ∈ triangles H
    · exact Or.inl htH
    · obtain ⟨e,heD,het⟩ := removeEdgeFamily_lost ht htH
      have htB : t ⊆ B := by
        rcases mem_union.mp heD with hspoke|hrim
        · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
          exact linkClosed_spoke_triangle hC hz ht het
        · rcases mem_insert.mp hrim with heA|heM
          · exact hnoac t ht (heA ▸ het)
          · exact hnobd t ht ((mem_singleton.mp heM) ▸ het)
      by_cases hvt : v ∈ t
      · obtain ⟨f,hf,hft⟩ := four_hub_cover hC hab hnab ht hvt htB
        refine Or.inr ⟨f,?_,hft⟩
        simp only [mem_insert,mem_singleton] at hf
        rcases hf with rfl|rfl <;> simp [Y]
      · have htC : t ⊆ C := by intro z hz; exact (mem_insert.mp (htB hz)).resolve_left (by intro h; exact hvt (h ▸ hz))
        exact Or.inr ⟨{c,d},by simp [Y],four_rim_cover hab hcd hnab ht htC⟩
  have hcover := cover_extension (triangles_valid H) hYlost
  have hYcard : Y.card ≤ 3 := card_le_three
  have hfailure := failure_lower_bound hG.1
  have hHt := hbal.2.2.1
  change tau (triangles H) = 2 * nu (triangles H) at hHt
  omega

end Tuza06
