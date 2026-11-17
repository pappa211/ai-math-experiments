import Tuza06.SmallLinksPatterns

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option linter.unnecessarySimpa false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Symbolic 3-packing augmentation across two deleted matching rim edges.
The two crossed hub triangles are actual G triangles; outside vertices are arbitrary. -/
theorem crossed_matching_external_augmentation {G : SimpleGraph V} {v a b c d : V}
    {C t : Finset V} (hvC : v ∉ C) (hab : a ≠ b) (hcd : c ≠ d)
    (hAsub : ({a,b} : Finset V) ⊆ C) (hMsub : ({c,d} : Finset V) ⊆ C)
    (hsep : Disjoint ({a,b} : Finset V) {c,d})
    (ht : t ∈ triangles G) (hAt : ({a,b} : Finset V) ∈ edges t)
    (hout : ¬ t ⊆ insert v C)
    (hS : ({v,a,c} : Finset V) ∈ triangles G) (hR : ({v,b,d} : Finset V) ∈ triangles G)
    (hblocks : ComponentCliques (removeEdgeFamily G (spokeEdges v C ∪ {{a,b},{c,d}}))) :
    3 + nu (triangles (removeEdgeFamily G (spokeEdges v C ∪ {{a,b},{c,d}}))) ≤ nu (triangles G) := by
  classical
  let A : Finset V := {a,b}
  let M : Finset V := {c,d}
  let B := insert v C
  let D : Finset (Finset V) := spokeEdges v C ∪ {A,M}
  let H := removeEdgeFamily G D
  have hAeq : A = {a,b} := rfl
  have hMeq : M = {c,d} := rfl
  have hA2 : A.card = 2 := by simp [A,hab]
  have hM2 : M.card = 2 := by simp [M,hcd]
  have hAD : A ∈ D := mem_union_right _ (by simp)
  have hAind : IndependentVertices H A := removeEdgeFamily_independent (by
    intro e he; rw [two_vertex_edges hA2] at he; exact (mem_singleton.mp he) ▸ hAD)
  have haA : a ∈ A := by rw [hAeq]; simp
  have hbA : b ∈ A := by rw [hAeq]; simp
  have hcM : c ∈ M := by rw [hMeq]; simp
  have hdM : d ∈ M := by rw [hMeq]; simp
  have hcA : c ∉ A := fun hc => disjoint_left.mp hsep hc hcM
  have hdA : d ∉ A := fun hd => disjoint_left.mp hsep hd hdM
  have haC := hAsub haA
  have hbC := hAsub hbA
  have hcC := hMsub hcM
  have hdC := hMsub hdM
  have hca : c ≠ a := fun h => hcA (h ▸ haA)
  have hcb : c ≠ b := fun h => hcA (h ▸ hbA)
  have hda : d ≠ a := fun h => hdA (h ▸ haA)
  have hdb : d ≠ b := fun h => hdA (h ▸ hbA)
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
  have hxa : x ≠ a := fun h => hxA (by simp [h])
  have hxb : x ≠ b := fun h => hxA (by simp [h])
  let S := insert v ({a,c} : Finset V)
  let R := insert v ({b,d} : Finset V)
  let E : Finset (Finset V) := {{a,c},{b,d},{x,a},{x,b}}
  have hSB : S ⊆ B := by simp [S,B,insert_subset_iff,haC,hcC]
  have hRB : R ⊆ B := by simp [R,B,insert_subset_iff,hbC,hdC]
  have hS3 : S.card = 3 := by simp [S,hva,hvc,hca.symm]
  have hR3 : R.card = 3 := by simp [R,hvb,hvd,hdb.symm]
  have hSG : S ∈ triangles G := hS
  have hRG : R ∈ triangles G := hR
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
      change z ∈ A at hz
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
  exact haug

end Tuza06
