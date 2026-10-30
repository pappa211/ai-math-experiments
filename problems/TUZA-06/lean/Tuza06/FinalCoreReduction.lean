import Tuza06.PageAugmentation
import Tuza.Intersecting

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def localTriangles (G : SimpleGraph V) (B : Finset V) : Finset (Finset V) := by
  classical
  exact (triangles G).filter (fun t => t ⊆ B)

noncomputable def externalPages (G : SimpleGraph V) (A B : Finset V) : Finset (Finset V) := by
  classical
  exact (triangles G).filter (fun t => HasBase A t ∧ ¬ t ⊆ B)

/-- Finite local certificates and the exact-neighborhood interface.
These fields are explicit hypotheses until instantiated by the eight-vertex core. -/
structure FinalCoreData (G : SimpleGraph V) (U A B : Finset V)
    (Z : Finset (Finset V)) : Prop where
  A_subset : A ⊆ B
  B_subset : B ⊆ U ∪ A
  outside_spokes : Z.card ≤ 2
  hub_triangles : ∀ t ∈ triangles G, (∃ v ∈ U, v ∈ t) →
    t ∈ localTriangles G B ∨ ∃ e ∈ Z, e ∈ edges t
  packing_seven : ∃ P, Packing (localTriangles G B) P ∧ P.card = 7
  cover_initial : ∃ C, Covers (localTriangles G B) C ∧ edges A ⊆ C ∧ C.card ≤ 12
  cover_nine : ∃ C, Covers (localTriangles G B) C ∧ C.card ≤ 9
  pair_six : ∀ f ∈ edges A, ∀ g ∈ edges A, f ≠ g →
    ∃ P, Packing (localTriangles G B) P ∧ P.card = 6 ∧ Disjoint (support P) {f, g}

/-- No lost triangle is omitted: it is local, an outside page, or hit by one of
at most two designated outside spokes. -/
theorem final_core_lost {G : SimpleGraph V} {U A B : Finset V} {Z : Finset (Finset V)}
    (hD : FinalCoreData G U A B Z) {t : Finset V} (ht : t ∈ triangles G) :
    t ∈ triangles (prune G U A) ∨ t ∈ localTriangles G B ∨
      t ∈ externalPages G A B ∨ ∃ e ∈ Z, e ∈ edges t := by
  classical
  by_cases hres : t ∈ triangles (prune G U A)
  · exact Or.inl hres
  · rcases prune_lost_triangle ht hres with hhub | hbase
    · rcases hD.hub_triangles t ht hhub with hlocal | hz
      · exact Or.inr (Or.inl hlocal)
      · exact Or.inr (Or.inr (Or.inr hz))
    · by_cases hB : t ⊆ B
      · exact Or.inr (Or.inl (mem_filter.mpr ⟨ht, hB⟩))
      · exact Or.inr (Or.inr (Or.inl (mem_filter.mpr ⟨ht, hbase, hB⟩)))

theorem final_core_packing_lower {G : SimpleGraph V} {U A B : Finset V}
    {Z : Finset (Finset V)} (hD : FinalCoreData G U A B Z) :
    7 + nu (triangles (prune G U A)) ≤ nu (triangles G) := by
  classical
  obtain ⟨P, hP, hcP⟩ := hD.packing_seven
  have hlocal : localTriangles G B ⊆ triangles G := filter_subset _ _
  have hPG : Packing (triangles G) P := packing_mono hlocal hP
  have hcross : ∀ p ∈ P, ∀ q ∈ triangles (prune G U A), Disjoint (edges p) (edges q) := by
    intro p hp q hq
    exact prune_local_cross hD.B_subset (mem_filter.mp (hP.1 hp)).2 hq
  simpa [hcP] using packing_extension (triangles_valid G)
    (triangles_mono_graph (prune_le G U A)) hPG hcross

theorem final_core_cover_fourteen {G : SimpleGraph V} {U A B : Finset V}
    {Z : Finset (Finset V)} (hD : FinalCoreData G U A B Z) :
    tau (triangles G) ≤ tau (triangles (prune G U A)) + 14 := by
  classical
  obtain ⟨C, hc, hA, hcard⟩ := hD.cover_initial
  have hcover := cover_extension (triangles_valid (prune G U A)) (X := C ∪ Z) (F := triangles G) (by
    intro t ht
    rcases final_core_lost hD ht with hr | hl | hp | hz
    · exact Or.inl hr
    · obtain ⟨e, he, het⟩ := hc t hl
      exact Or.inr ⟨e, mem_union_left _ he, het⟩
    · obtain ⟨e, heA, het⟩ := (mem_filter.mp hp).2.1
      exact Or.inr ⟨e, mem_union_left _ (hA heA), het⟩
    · obtain ⟨e, he, het⟩ := hz
      exact Or.inr ⟨e, mem_union_right _ he, het⟩)
  have hle := card_union_le C Z
  have hZ := hD.outside_spokes
  omega

/-- The complete inequality-only final-core reduction. -/
theorem final_core_inequality {G : SimpleGraph V} {U A B : Finset V}
    {Z : Finset (Finset V)} (hD : FinalCoreData G U A B Z)
    (hind : tau (triangles (prune G U A)) ≤ 2 * nu (triangles (prune G U A))) :
    tau (triangles G) ≤ 2 * nu (triangles G) :=
  balanced_inequality hind (final_core_packing_lower hD) (by
    simpa using final_core_cover_fourteen hD)

/-- Under tight seven/fourteen accounting, two disjoint external pages augment
the graph packing. All outside vertices remain arbitrary. -/
theorem final_core_pages_intersect {G : SimpleGraph V} {U A B : Finset V}
    {Z : Finset (Finset V)} (hD : FinalCoreData G U A B Z)
    (hblocks : ComponentCliques (prune G U A))
    (hnu : nu (triangles G) ≤ nu (triangles (prune G U A)) + 7) :
    ∀ s ∈ externalPages G A B, ∀ t ∈ externalPages G A B,
      ¬ Disjoint (edges s) (edges t) := by
  classical
  intro s hs t ht hdst
  have hsG := (mem_filter.mp hs).1
  have htG := (mem_filter.mp ht).1
  obtain ⟨f, hfA, hfs⟩ := (mem_filter.mp hs).2.1
  obtain ⟨g, hgA, hgt⟩ := (mem_filter.mp ht).2.1
  have hfg : f ≠ g := by
    intro h
    exact disjoint_left.mp hdst hfs (h.symm ▸ hgt)
  obtain ⟨Q, hQ, hcQ, hdQ⟩ := hD.pair_six f hfA g hgA hfg
  have hlocal : localTriangles G B ⊆ triangles G := filter_subset _ _
  have hQG := packing_mono hlocal hQ
  have hQB : ∀ q ∈ Q, q ⊆ B := fun q hq => (mem_filter.mp (hQ.1 hq)).2
  have hQs : ∀ q ∈ Q, Disjoint (edges q) (edges s) := by
    intro q hq
    apply external_page_local_cross (mem_triangles.mp hsG).card_eq hfs
      ((mem_edges.mp hfA).1.trans hD.A_subset) (mem_filter.mp hs).2.2 (hQB q hq)
    intro hfq
    exact disjoint_left.mp hdQ (mem_biUnion.mpr ⟨q, hq, hfq⟩) (by simp)
  have hQt : ∀ q ∈ Q, Disjoint (edges q) (edges t) := by
    intro q hq
    apply external_page_local_cross (mem_triangles.mp htG).card_eq hgt
      ((mem_edges.mp hgA).1.trans hD.A_subset) (mem_filter.mp ht).2.2 (hQB q hq)
    intro hgq
    exact disjoint_left.mp hdQ (mem_biUnion.mpr ⟨q, hq, hgq⟩) (by simp)
  obtain ⟨K, hK⟩ := componentCliques_decomposition hblocks
  have haug := two_page_augmentation hD.B_subset hK hsG htG
    (mem_filter.mp hs).2.1 (mem_filter.mp ht).2.1 hdst hQG hQB hQs hQt
  rw [hcQ] at haug
  omega

/-- The separate cover contributions are 9 local + 2 page + 2 outside spokes. -/
theorem final_core_cover_thirteen {G : SimpleGraph V} {U A B : Finset V}
    {Z : Finset (Finset V)} (hD : FinalCoreData G U A B Z)
    (hblocks : ComponentCliques (prune G U A))
    (hnu : nu (triangles G) ≤ nu (triangles (prune G U A)) + 7) :
    tau (triangles G) ≤ tau (triangles (prune G U A)) + 13 := by
  classical
  have hFvalid : Triangles (externalPages G A B) :=
    triangles_mono (filter_subset _ _) (triangles_valid G)
  have hFtau := intersecting_cover hFvalid (final_core_pages_intersect hD hblocks hnu)
  obtain ⟨C, hc, hcCard⟩ := hD.cover_nine
  obtain ⟨D, hd, hdCard⟩ := exists_min_cover hFvalid
  have hlost : ∀ t ∈ triangles G, t ∈ triangles (prune G U A) ∨
      ∃ e ∈ (C ∪ D) ∪ Z, e ∈ edges t := by
    intro t ht
    rcases final_core_lost hD ht with hr | hl | hp | hz
    · exact Or.inl hr
    · obtain ⟨e, he, het⟩ := hc t hl
      exact Or.inr ⟨e, mem_union_left _ (mem_union_left _ he), het⟩
    · obtain ⟨e, he, het⟩ := hd t hp
      exact Or.inr ⟨e, mem_union_left _ (mem_union_right _ he), het⟩
    · obtain ⟨e, he, het⟩ := hz
      exact Or.inr ⟨e, mem_union_right _ he, het⟩
  have hcover := cover_extension (triangles_valid (prune G U A)) hlost
  have h1 := card_union_le C D
  have h2 := card_union_le (C ∪ D) Z
  have hz := hD.outside_spokes
  omega

/-- Complete local equality reduction, conditional only on the explicitly stated
residual induction conclusion. This is NOT the global 5-degenerate theorem. -/
theorem final_core_strict {G : SimpleGraph V} {U A B : Finset V}
    {Z : Finset (Finset V)} (hD : FinalCoreData G U A B Z)
    (hind : tau (triangles (prune G U A)) ≤ 2 * nu (triangles (prune G U A)))
    (heq : tau (triangles (prune G U A)) = 2 * nu (triangles (prune G U A)) →
      ComponentCliques (prune G U A)) : tau (triangles G) < 2 * nu (triangles G) := by
  by_contra hn
  have hfailure : 2 * nu (triangles G) ≤ tau (triangles G) := by omega
  have hacct := balanced_accounting hfailure hind (final_core_packing_lower hD)
    (show tau (triangles G) ≤ tau (triangles (prune G U A)) + 2 * 7 by
      simpa using final_core_cover_fourteen hD)
  have h13 := final_core_cover_thirteen hD (heq hacct.2.2) (by omega)
  omega

end Tuza06
