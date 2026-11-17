import Tuza06.SmallLinksPatterns

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Arbitrary external pages are excluded at a closed K4 link using a balanced
2/4 reduction and a compatible 3-packing. -/
theorem minimal_k4_link_no_external_page {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} {C : Finset V} (hC : LinkClosed G v C) (hC4 : C.card = 4)
    (hclique : G.IsClique (C : Set V)) {A t : Finset V}
    (hAC : A ∈ edges C) (ht : t ∈ triangles G) (hAt : A ∈ edges t)
    (hout : ¬ t ⊆ insert v C) : False := by
  classical
  have hvC := linkClosed_not_hub hC
  have hAsub := (mem_edges.mp hAC).1
  have hA2 := (mem_edges.mp hAC).2
  let M := C \ A
  have hMsub : M ⊆ C := sdiff_subset
  have hM2 : M.card = 2 := by
    change (C \ A).card = 2
    rw [card_sdiff_of_subset hAsub,hC4,hA2]
  have hvA : v ∉ A := fun hv => hvC (hAsub hv)
  have hvM : v ∉ M := fun hv => hvC (hMsub hv)
  let B := insert v C
  let TA := insert v A
  let TM := insert v M
  let D : Finset (Finset V) := spokeEdges v C ∪ {A,M}
  let X : Finset (Finset V) := edges TA ∪ edges M
  let H := removeEdgeFamily G D
  have hBclique : G.IsClique (B : Set V) := linkClosed_hub_clique hC hclique
  have hTA3 : TA.card = 3 := by simp [TA,hvA,hA2]
  have hTM3 : TM.card = 3 := by simp [TM,hvM,hM2]
  have hTAB : TA ⊆ B := insert_subset_insert v hAsub
  have hTMB : TM ⊆ B := insert_subset_insert v hMsub
  have hTAG : TA ∈ triangles G := cliqueFamily_subset_triangles hBclique (mem_powersetCard.mpr ⟨hTAB,hTA3⟩)
  have hTMG : TM ∈ triangles G := cliqueFamily_subset_triangles hBclique (mem_powersetCard.mpr ⟨hTMB,hTM3⟩)
  have hAMinter : TA ∩ TM ⊆ {v} := by
    intro z hz
    by_cases hzv : z = v
    · simp [hzv]
    · have hzA : z ∈ A := (mem_insert.mp (mem_inter.mp hz).1).resolve_left hzv
      have hzM : z ∈ M := (mem_insert.mp (mem_inter.mp hz).2).resolve_left hzv
      exact ((mem_sdiff.mp hzM).2 hzA).elim
  have hdisjAM := edges_disjoint_of_inter_card
    ((card_le_card hAMinter).trans (by simp))
  have hneAM := triangles_ne_of_edges_disjoint hTA3 hdisjAM
  have hP : Packing (triangles G) {TA,TM} := packing_pair hTAG hTMG hneAM hdisjAM
  have hPcard : ({TA,TM} : Finset (Finset V)).card = 2 := card_pair hneAM
  have hAD : A ∈ D := mem_union_right _ (by simp)
  have hMD : M ∈ D := mem_union_right _ (by simp)
  have hTD : ∀ N, N ∈ ({A,M} : Finset (Finset V)) → edges (insert v N) ⊆ D := by
    intro N hN e he
    rcases mem_insert.mp hN with hNA|hNM
    · subst N
      rcases mem_union.mp (hub_edges_split v A he) with hspoke|hrim
      · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
        exact mem_union_left _ (mem_image.mpr ⟨z,hAsub hz,rfl⟩)
      · rw [two_vertex_edges hA2] at hrim
        exact (mem_singleton.mp hrim) ▸ hAD
    · have hNM' : N = M := mem_singleton.mp hNM
      subst N
      rcases mem_union.mp (hub_edges_split v M he) with hspoke|hrim
      · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
        exact mem_union_left _ (mem_image.mpr ⟨z,hMsub hz,rfl⟩)
      · rw [two_vertex_edges hM2] at hrim
        exact (mem_singleton.mp hrim) ▸ hMD
  have hPD : support {TA,TM} ⊆ D := by
    intro e he
    obtain ⟨N,hN,heN⟩ := mem_biUnion.mp he
    rcases mem_insert.mp hN with hNA|hNM
    · have heTA : e ∈ edges TA := hNA ▸ heN
      exact hTD A (by simp) heTA
    · have heTM : e ∈ edges TM := (mem_singleton.mp hNM) ▸ heN
      exact hTD M (by simp) heTM
  have hCover : Covers (cliqueFamily B) X := triangle_partition_cover (cliqueFamily_valid B) (by
    intro q hq z hz
    have hzB := (mem_powersetCard.mp hq).1 hz
    rcases mem_insert.mp hzB with hzv|hzC
    · exact mem_union_left _ (by simp [TA,hzv])
    · by_cases hzA : z ∈ A
      · exact mem_union_left _ (mem_insert_of_mem hzA)
      · exact mem_union_right _ (mem_sdiff.mpr ⟨hzC,hzA⟩))
  have hXcard : X.card ≤ 4 := by
    have hE3 : (edges TA).card = 3 := by rw [edges,card_powersetCard,hTA3]; decide
    have hE1 : (edges M).card = 1 := by rw [two_vertex_edges hM2]; simp
    have hle := card_union_le (edges TA) (edges M)
    change (edges TA ∪ edges M).card ≤ 4
    omega
  have hAX : A ∈ X := mem_union_left _ (mem_edges.mpr ⟨subset_insert _ _,hA2⟩)
  have hMX : M ∈ X := mem_union_right _ (by rw [two_vertex_edges hM2]; simp)
  have hlost : ∀ q ∈ triangles G, q ∈ triangles H ∨ ∃ e ∈ X, e ∈ edges q := by
    intro q hq
    by_cases hqH : q ∈ triangles H
    · exact Or.inl hqH
    · obtain ⟨e,heD,heq⟩ := removeEdgeFamily_lost hq hqH
      rcases mem_union.mp heD with hspoke|hrim
      · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
        exact Or.inr (hCover q (mem_powersetCard.mpr
          ⟨linkClosed_spoke_triangle hC hz hq heq,(mem_triangles.mp hq).card_eq⟩))
      · rcases mem_insert.mp hrim with heA|heM
        · exact Or.inr ⟨A,hAX,heA ▸ heq⟩
        · exact Or.inr ⟨M,hMX,(mem_singleton.mp heM) ▸ heq⟩
  have hAG : G.IsNClique 2 A := ⟨fun a ha b hb hab => hclique (hAsub ha) (hAsub hb) hab,hA2⟩
  have hbal := minimal_balanced_removeEdges hG hAG hAD hP hPD (by simpa [hPcard] using hXcard) hlost
  have hnu : nu (triangles G) = nu (triangles H) + 2 := by simpa [hPcard] using hbal.2.1
  have hblocks : ComponentCliques H := hbal.2.2.2
  have hAind : IndependentVertices H A := removeEdgeFamily_independent (by
    intro e he; rw [two_vertex_edges hA2] at he; exact (mem_singleton.mp he) ▸ hAD)
  obtain ⟨a,b,hab,hAeq⟩ := card_eq_two.mp hA2
  obtain ⟨c,d,hcd,hMeq⟩ := card_eq_two.mp hM2
  have haA : a ∈ A := by rw [hAeq]; simp
  have hbA : b ∈ A := by rw [hAeq]; simp
  have hcM : c ∈ M := by rw [hMeq]; simp
  have hdM : d ∈ M := by rw [hMeq]; simp
  have haC := hAsub haA
  have hbC := hAsub hbA
  have hcC := hMsub hcM
  have hdC := hMsub hdM
  have hca : c ≠ a := fun h => (mem_sdiff.mp hcM).2 (h ▸ haA)
  have hcb : c ≠ b := fun h => (mem_sdiff.mp hcM).2 (h ▸ hbA)
  have hda : d ≠ a := fun h => (mem_sdiff.mp hdM).2 (h ▸ haA)
  have hdb : d ≠ b := fun h => (mem_sdiff.mp hdM).2 (h ▸ hbA)
  have hva : v ≠ a := fun h => hvC (h.symm ▸ haC)
  have hvb : v ≠ b := fun h => hvC (h.symm ▸ hbC)
  have hvc : v ≠ c := fun h => hvC (h.symm ▸ hcC)
  have hvd : v ≠ d := fun h => hvC (h.symm ▸ hdC)
  obtain ⟨x,hxA,htx⟩ := third_vertex (mem_triangles.mp ht).card_eq hAt
  have hxB : x ∉ B := by
    intro hx
    apply hout
    rw [htx]
    exact insert_subset hx (hAsub.trans (subset_insert v C))
  have hxa : x ≠ a := fun h => hxA (h ▸ haA)
  have hxb : x ≠ b := fun h => hxA (h ▸ hbA)
  let S := insert v ({a,c} : Finset V)
  let R := insert v ({b,d} : Finset V)
  let E : Finset (Finset V) := {{a,c},{b,d},{x,a},{x,b}}
  have hSB : S ⊆ B := by simp [S,B,insert_subset_iff,haC,hcC]
  have hRB : R ⊆ B := by simp [R,B,insert_subset_iff,hbC,hdC]
  have hS3 : S.card = 3 := by simp [S,hva,hvc,hca.symm]
  have hR3 : R.card = 3 := by simp [R,hvb,hvd,hdb.symm]
  have hSG := cliqueFamily_subset_triangles hBclique (mem_powersetCard.mpr ⟨hSB,hS3⟩)
  have hRG := cliqueFamily_subset_triangles hBclique (mem_powersetCard.mpr ⟨hRB,hR3⟩)
  have hSRinter : S ∩ R ⊆ {v} := by
    intro z hz
    by_cases hzv : z = v
    · simp [hzv]
    · have hzS : z ∈ ({a,c} : Finset V) := (mem_insert.mp (mem_inter.mp hz).1).resolve_left hzv
      have hzR : z ∈ ({b,d} : Finset V) := (mem_insert.mp (mem_inter.mp hz).2).resolve_left hzv
      simp only [mem_insert,mem_singleton] at hzS hzR
      rcases hzS with hza|hzc
      · subst z
        rcases hzR with hab'|had'
        · exact (hab hab').elim
        · exact (hda had'.symm).elim
      · subst z
        rcases hzR with hcb'|hcd'
        · exact (hcb hcb').elim
        · exact (hcd hcd').elim
  have hdSR := edges_disjoint_of_inter_card ((card_le_card hSRinter).trans (by simp))
  have hneSR := triangles_ne_of_edges_disjoint hS3 hdSR
  have hbS : b ∉ S := by simp [S,hvb.symm,hab.symm,hcb.symm]
  have haR : a ∉ R := by simp [R,hva.symm,hab,hda.symm]
  have hAS : A ∉ edges S := fun he => hbS ((mem_edges.mp he).1 hbA)
  have hAR : A ∉ edges R := fun he => haR ((mem_edges.mp he).1 haA)
  have hdSt := external_page_local_cross (mem_triangles.mp ht).card_eq hAt
    (hAsub.trans (subset_insert v C)) hout hSB hAS
  have hdRt := external_page_local_cross (mem_triangles.mp ht).card_eq hAt
    (hAsub.trans (subset_insert v C)) hout hRB hAR
  have hLocal := packing_pair hSG hRG hneSR hdSR
  have hcross : ∀ z ∈ ({S,R} : Finset (Finset V)), ∀ y ∈ ({t} : Finset (Finset V)),
      Disjoint (edges z) (edges y) := by
    intro z hz y hy
    have hyt := mem_singleton.mp hy
    subst y
    rcases mem_insert.mp hz with hzS|hzR
    · exact hzS ▸ hdSt
    · exact (mem_singleton.mp hzR) ▸ hdRt
  let Q : Finset (Finset V) := {S,R} ∪ {t}
  have hQ : Packing (triangles G) Q := packing_mono (by simp)
    (packing_union hLocal (packing_singleton ht) hcross)
  have hdFam := cross_disjoint (triangles_mono hLocal.1 (triangles_valid G)) hcross
  have hQcard : Q.card = 3 := by
    change (({S,R} : Finset (Finset V)) ∪ {t}).card = 3
    rw [card_union_of_disjoint hdFam,card_pair hneSR,card_singleton]
  have hterm : ∀ e ∈ E, ∃ z ∈ A, z ∈ e := by
    intro e he
    simp only [E,mem_insert,mem_singleton] at he
    rcases he with rfl|rfl|rfl|rfl
    · exact ⟨a,haA,by simp⟩
    · exact ⟨b,hbA,by simp⟩
    · exact ⟨a,haA,by simp⟩
    · exact ⟨b,hbA,by simp⟩
  have hdeg : ∀ z ∈ A, (E.filter (fun e => z ∈ e)).card ≤ 2 := by
    intro z hz
    rw [hAeq] at hz
    rcases mem_insert.mp hz with hza|hzb
    · subst z
      have hsub : E.filter (fun e => a ∈ e) ⊆ {{a,c},{x,a}} := by
        intro e he
        obtain ⟨heE,hae⟩ := mem_filter.mp he
        simp only [E,mem_insert,mem_singleton] at heE
        rcases heE with rfl|rfl|rfl|rfl
        · simp
        · exact (by simpa [hab,hda.symm] using hae : False).elim
        · simp
        · exact (by simpa [hxa.symm,hab] using hae : False).elim
      exact (card_le_card hsub).trans ((card_insert_le _ _).trans (by simp))
    · have hzb' : z = b := mem_singleton.mp hzb
      subst z
      have hsub : E.filter (fun e => b ∈ e) ⊆ {{b,d},{x,b}} := by
        intro e he
        obtain ⟨heE,hbe⟩ := mem_filter.mp he
        simp only [E,mem_insert,mem_singleton] at heE
        rcases heE with rfl|rfl|rfl|rfl
        · exact (by simpa [hab.symm,hcb.symm] using hbe : False).elim
        · simp
        · exact (by simpa [hxb.symm,hab.symm] using hbe : False).elim
        · simp
      exact (card_le_card hsub).trans ((card_insert_le _ _).trans (by simp))
  obtain ⟨K,hK⟩ := componentCliques_decomposition hblocks
  obtain ⟨W,hW,hWcard,hWE⟩ := blocks_avoid_terminal_edges hK hAind hterm hdeg
  have hSedges : edges S ⊆ D ∪ E := by
    rw [edges_hub_pair (by simp [hva,hvc]) (by simp [hca.symm])]
    intro e he
    rcases mem_union.mp he with hrim|hspoke
    · have heq := mem_singleton.mp hrim
      exact mem_union_right _ (heq ▸ (by simp [E]))
    · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
      have hzC : z ∈ C := by
        simp only [mem_insert,mem_singleton] at hz
        rcases hz with hza|hzc
        · exact hza ▸ haC
        · exact hzc ▸ hcC
      exact mem_union_left _ (mem_union_left _ (mem_image.mpr ⟨z,hzC,rfl⟩))
  have hRedges : edges R ⊆ D ∪ E := by
    rw [edges_hub_pair (by simp [hvb,hvd]) (by simp [hdb.symm])]
    intro e he
    rcases mem_union.mp he with hrim|hspoke
    · have heq := mem_singleton.mp hrim
      exact mem_union_right _ (heq ▸ (by simp [E]))
    · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
      have hzC : z ∈ C := by simp only [mem_insert,mem_singleton] at hz; rcases hz with rfl|rfl; exact hbC; exact hdC
      exact mem_union_left _ (mem_union_left _ (mem_image.mpr ⟨z,hzC,rfl⟩))
  have htedges : edges t ⊆ D ∪ E := by
    rw [htx,edges_hub_pair hxA hA2]
    intro e he
    rcases mem_union.mp he with hrim|hspoke
    · have heq := mem_singleton.mp hrim
      exact mem_union_left _ (heq ▸ hAD)
    · obtain ⟨z,hz,rfl⟩ := mem_image.mp hspoke
      rw [hAeq] at hz
      simp only [mem_insert,mem_singleton] at hz
      rcases hz with rfl|rfl <;> exact mem_union_right _ (by simp [E])
  have hQE : support Q ⊆ D ∪ E := by
    intro e he
    obtain ⟨z,hz,hez⟩ := mem_biUnion.mp he
    rcases mem_union.mp hz with hzLocal|hzt
    · rcases mem_insert.mp hzLocal with hzS|hzR
      · exact hSedges (hzS ▸ hez)
      · exact hRedges ((mem_singleton.mp hzR) ▸ hez)
    · exact htedges ((mem_singleton.mp hzt) ▸ hez)
  have haug := removeEdges_augment_avoiding hQ hW hWcard hWE hQE
  change Q.card + nu (triangles H) ≤ nu (triangles G) at haug
  rw [hQcard] at haug
  omega

/-- Complete K4 link-component exclusion, including all external pages. -/
theorem minimal_no_k4_link {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} {C : Finset V} (hC : LinkClosed G v C) (hC4 : C.card = 4)
    (hclique : G.IsClique (C : Set V)) : False := by
  let B := insert v C
  have hBclique : G.IsClique (B : Set V) := linkClosed_hub_clique hC hclique
  have hB5 : B.card = 5 := by simp [B,linkClosed_not_hub hC,hC4]
  apply minimal_no_isolated_clique hG hBclique (Or.inr hB5)
  intro t ht hnd
  obtain ⟨e,het,heB⟩ := not_disjoint_iff.mp hnd
  rcases mem_union.mp (hub_edges_split v C heB) with hspoke|hrim
  · obtain ⟨a,ha,rfl⟩ := mem_image.mp hspoke
    exact linkClosed_spoke_triangle hC ha ht het
  · by_contra hout
    exact minimal_k4_link_no_external_page hG hC hC4 hclique hrim ht het hout

end Tuza06
