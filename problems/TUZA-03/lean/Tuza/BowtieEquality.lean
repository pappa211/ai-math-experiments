import Tuza.TwoTriangle
import Tuza.IntersectingStructure

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A three-set meeting both bowtie edge sets is one of the four mixed triples. -/
theorem bowtie_mixed_triple {v a b c d : V} (hnd : [v,a,b,c,d].Nodup)
    {q : Finset V} (hq : q.card = 3)
    (h1 : ∃ e ∈ edges ({v,a,b} : Finset V), e ∈ edges q)
    (h2 : ∃ e ∈ edges ({v,c,d} : Finset V), e ∈ edges q) :
    q = {v,a,c} ∨ q = {v,a,d} ∨ q = {v,b,c} ∨ q = {v,b,d} := by
  classical
  have hva : v ≠ a := by rintro rfl; simp at hnd
  have hvb : v ≠ b := by rintro rfl; simp at hnd
  have hvc : v ≠ c := by rintro rfl; simp at hnd
  have hvd : v ≠ d := by rintro rfl; simp at hnd
  have hab : a ≠ b := by rintro rfl; simp at hnd
  have hac : a ≠ c := by rintro rfl; simp at hnd
  have had : a ≠ d := by rintro rfl; simp at hnd
  have hbc : b ≠ c := by rintro rfl; simp at hnd
  have hbd : b ≠ d := by rintro rfl; simp at hnd
  have hcd : c ≠ d := by rintro rfl; simp at hnd
  obtain ⟨e,heU,heq⟩ := h1
  obtain ⟨f,hfW,hfq⟩ := h2
  have hcommon : ∀ z ∈ e, z ∈ f → z = v := by
    intro z hze hzf
    have hzU := (mem_edges.mp heU).1 hze
    have hzW := (mem_edges.mp hfW).1 hzf
    simp only [mem_insert,mem_singleton] at hzU hzW
    rcases hzU with rfl | rfl | rfl
    · rfl
    · rcases hzW with h | h | h
      · exact h
      · exact (hac h).elim
      · exact (had h).elim
    · rcases hzW with h | h | h
      · exact h
      · exact (hbc h).elim
      · exact (hbd h).elim
  have hvq : v ∈ q := by
    by_contra hv
    have hef : Disjoint e f := by
      apply disjoint_left.mpr
      intro z hze hzf
      have hzv := hcommon z hze hzf
      subst z
      exact hv ((mem_edges.mp heq).1 hze)
    have hc := card_le_card (union_subset (mem_edges.mp heq).1 (mem_edges.mp hfq).1)
    rw [card_union_of_disjoint hef,(mem_edges.mp heq).2,(mem_edges.mp hfq).2,hq] at hc
    omega
  have choose_other : ∀ s : Finset V, s.card = 2 → ∃ x ∈ s, x ≠ v := by
    intro s hs
    by_contra hn
    have hsub : s ⊆ {v} := by
      intro x hx
      have hxv : x = v := by by_contra h; exact hn ⟨x,hx,h⟩
      simp [hxv]
    have hc := card_le_card hsub
    rw [hs,card_singleton] at hc
    omega
  obtain ⟨x,hxe,hxv⟩ := choose_other e (mem_edges.mp heq).2
  obtain ⟨y,hyf,hyv⟩ := choose_other f (mem_edges.mp hfq).2
  have hx : x = a ∨ x = b := by
    have hh := (mem_edges.mp heU).1 hxe
    simpa [hxv] using hh
  have hy : y = c ∨ y = d := by
    have hh := (mem_edges.mp hfW).1 hyf
    simpa [hyv] using hh
  have hxy : x ≠ y := by
    intro h
    have hh := hcommon x hxe (h.symm ▸ hyf)
    exact hxv hh
  have hxyz : ({v,x,y} : Finset V) ⊆ q := by
    intro z hz
    simp only [mem_insert,mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact hvq
    · exact (mem_edges.mp heq).1 hxe
    · exact (mem_edges.mp hfq).1 hyf
  have hqeq : q = {v,x,y} := (eq_of_subset_of_card_le hxyz (by
    simp [hq,hxv.symm,hyv.symm,hxy])).symm
  rw [hqeq]
  rcases hx with rfl | rfl <;> rcases hy with rfl | rfl <;> tauto

/-- A nontrivial intersecting first family forbids two cross edges into the same other terminal. -/
theorem bowtie_column_exclusion {G : SimpleGraph V} {v a b c d : V}
    (hnd : [v,a,b,c,d].Nodup) (hU : G.IsNClique 3 {v,a,b})
    (hnu : nu (triangles (deleteTriangle G {v,c,d}) \
      triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b})) = 1)
    (htau : 1 < tau (triangles (deleteTriangle G {v,c,d}) \
      triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b}))) :
    ¬ (G.Adj a c ∧ G.Adj b c) := by
  classical
  let J := deleteTriangle G {v,c,d}
  let F := triangles J \ triangles (deleteTriangle J {v,a,b})
  have hva : v ≠ a := by rintro rfl; simp at hnd
  have hvb : v ≠ b := by rintro rfl; simp at hnd
  have hvc : v ≠ c := by rintro rfl; simp at hnd
  have hvd : v ≠ d := by rintro rfl; simp at hnd
  have hab : a ≠ b := by rintro rfl; simp at hnd
  have hac : a ≠ c := by rintro rfl; simp at hnd
  have had : a ≠ d := by rintro rfl; simp at hnd
  have hbc : b ≠ c := by rintro rfl; simp at hnd
  have hbd : b ≠ d := by rintro rfl; simp at hnd
  have hUj : J.IsNClique 3 {v,a,b} := by
    apply SimpleGraph.is3Clique_triple_iff.mpr
    obtain ⟨hvaG,hvbG,habG⟩ := SimpleGraph.is3Clique_triple_iff.mp hU
    exact ⟨⟨hvaG,by simp [hva.symm,hac,had]⟩,
      ⟨hvbG,by simp [hvb.symm,hbc,hbd]⟩,
      ⟨habG,by simp [hva.symm,hac,had]⟩⟩
  have hUF : ({v,a,b} : Finset V) ∈ F := restored_triangle_in_new_family hUj
  obtain ⟨k,hk,hall⟩ := intersecting_k4_structure (G := J) sdiff_subset hnu htau
  intro hcross
  have habG := (SimpleGraph.is3Clique_triple_iff.mp hU).2.2
  have hQj : J.IsNClique 3 {a,b,c} := SimpleGraph.is3Clique_triple_iff.mpr
    ⟨⟨habG,by simp [hva.symm,hac,had]⟩,
      ⟨hcross.1,by simp [hva.symm,hac,had]⟩,
      ⟨hcross.2,by simp [hvb.symm,hbc,hbd]⟩⟩
  have hQF : ({a,b,c} : Finset V) ∈ F := by
    refine mem_sdiff.mpr ⟨mem_triangles.mpr hQj,?_⟩
    intro hQ
    have habD := (mem_triangles.mp hQ).isClique (by simp) (by simp) hab
    exact habD.2 ⟨by simp,by simp⟩
  have hvk : v ∈ k := hall {v,a,b} hUF (by simp)
  have hck : c ∈ k := hall {a,b,c} hQF (by simp)
  have hvcJ := hk.isClique hvk hck hvc
  exact hvcJ.2 ⟨by simp,by simp⟩

theorem cover_enlarge_restoration {F C D : Finset (Finset V)}
    (h : Covers F C) (hCD : C ⊆ D) : Covers F D := by
  intro t ht
  obtain ⟨e,he,het⟩ := h t ht
  exact ⟨e,hCD he,het⟩

theorem new_cover_of_individuals_and_mixed {G : SimpleGraph V} {U W : Finset V}
    {C : Finset (Finset V)}
    (h1 : Covers (triangles (deleteTriangle G W) \
      triangles (deleteTriangle (deleteTriangle G W) U)) C)
    (h2 : Covers (triangles (deleteTriangle G U) \
      triangles (deleteTriangle (deleteTriangle G W) U)) C)
    (hm : ∀ t ∈ triangles G, t ∉ triangles (deleteTriangle G W) →
      t ∉ triangles (deleteTriangle G U) → ∃ e ∈ C, e ∈ edges t) :
    Covers (triangles G \ triangles (deleteTriangle (deleteTriangle G W) U)) C := by
  intro t ht
  by_cases ht1 : t ∈ triangles (deleteTriangle G W)
  · exact h1 t (mem_sdiff.mpr ⟨ht1,(mem_sdiff.mp ht).2⟩)
  · by_cases ht2 : t ∈ triangles (deleteTriangle G U)
    · exact h2 t (mem_sdiff.mpr ⟨ht2,(mem_sdiff.mp ht).2⟩)
    · exact hm t (mem_sdiff.mp ht).1 ht1 ht2

theorem triple_first_edge {x y z : V} (hxy : x ≠ y) :
    ({x,y} : Finset V) ∈ edges {x,y,z} := by
  refine mem_edges.mpr ⟨?_,by simp [hxy]⟩
  intro a ha
  simp only [mem_insert,mem_singleton] at ha ⊢
  tauto

theorem triple_second_edge {x y z : V} (hxz : x ≠ z) :
    ({x,z} : Finset V) ∈ edges {x,y,z} := by
  refine mem_edges.mpr ⟨?_,by simp [hxz]⟩
  intro a ha
  simp only [mem_insert,mem_singleton] at ha ⊢
  tauto

theorem bowtie_edges_disjoint {v a b c d : V} (hnd : [v,a,b,c,d].Nodup) :
    Disjoint (edges ({v,a,b} : Finset V)) (edges ({v,c,d} : Finset V)) := by
  have hac : a ≠ c := by rintro rfl; simp at hnd
  have had : a ≠ d := by rintro rfl; simp at hnd
  have hbc : b ≠ c := by rintro rfl; simp at hnd
  have hbd : b ≠ d := by rintro rfl; simp at hnd
  apply disjoint_left.mpr
  intro e heU heW
  have hsub : e ⊆ {v} := by
    intro x hx
    have hxU := (mem_edges.mp heU).1 hx
    have hxW := (mem_edges.mp heW).1 hx
    simp only [mem_insert,mem_singleton] at hxU hxW ⊢
    rcases hxU with rfl | rfl | rfl
    · rfl
    · rcases hxW with h | h | h
      · exact h
      · exact (hac h).elim
      · exact (had h).elim
    · rcases hxW with h | h | h
      · exact h
      · exact (hbc h).elim
      · exact (hbd h).elim
  have hc := card_le_card hsub
  rw [(mem_edges.mp heU).2,card_singleton] at hc
  omega

/-- The first nontrivial individual family supplies one column restriction;
its prescribed-spoke cover and a prescribed-spoke cover of the second family cover all mixed triangles. -/
theorem bowtie_new_cover_first_nontrivial {G : SimpleGraph V} {v a b c d : V}
    (hnd : [v,a,b,c,d].Nodup) (hU : G.IsNClique 3 {v,a,b})
    (hW : G.IsNClique 3 {v,c,d})
    (hn1 : nu (triangles (deleteTriangle G {v,c,d}) \
      triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b})) = 1)
    (hn2 : nu (triangles (deleteTriangle G {v,a,b}) \
      triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b})) = 1)
    (ht1 : 1 < tau (triangles (deleteTriangle G {v,c,d}) \
      triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b}))) :
    tau (triangles G \ triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b})) ≤ 4 := by
  classical
  let U : Finset V := {v,a,b}
  let W : Finset V := {v,c,d}
  let H := deleteTriangle (deleteTriangle G W) U
  let F1 := triangles (deleteTriangle G W) \ triangles H
  let F2 := triangles (deleteTriangle G U) \ triangles H
  have hva : v ≠ a := by rintro rfl; simp at hnd
  have hvb : v ≠ b := by rintro rfl; simp at hnd
  have hvc : v ≠ c := by rintro rfl; simp at hnd
  have hvd : v ≠ d := by rintro rfl; simp at hnd
  have hed := bowtie_edges_disjoint hnd
  have hUF : U ∈ F1 := restored_triangle_in_new_family (triangle_survives_delete hU hed)
  have hWF : W ∈ F2 := by
    have hh := restored_triangle_in_new_family (triangle_survives_delete hW hed.symm)
    rw [deleteTriangle_comm G U W] at hh
    exact hh
  have hcol := bowtie_column_exclusion hnd hU hn1 ht1
  have hvdW : ({v,d} : Finset V) ∈ edges W := triple_second_edge hvd
  obtain ⟨C2,hC2,hvdC2,hcard2⟩ := intersecting_prescribed_cover (G := deleteTriangle G U)
    (F := F2) sdiff_subset hn2 hWF hvdW
  have finish : ∀ e ∈ edges U,
      (∀ t ∈ triangles G, t ∉ triangles (deleteTriangle G W) →
        t ∉ triangles (deleteTriangle G U) → e ∈ edges t ∨ ({v,d} : Finset V) ∈ edges t) →
      tau (triangles G \ triangles H) ≤ 4 := by
    intro e he hm
    obtain ⟨C1,hC1,heC1,hcard1⟩ := intersecting_prescribed_cover (G := deleteTriangle G W)
      (F := F1) sdiff_subset hn1 hUF he
    have hcover : Covers (triangles G \ triangles H) (C1 ∪ C2) := by
      apply new_cover_of_individuals_and_mixed
      · exact cover_enlarge_restoration hC1 subset_union_left
      · exact cover_enlarge_restoration hC2 subset_union_right
      · intro t ht ht1 ht2
        rcases hm t ht ht1 ht2 with heT | hvdT
        · exact ⟨e,mem_union_left _ heC1,heT⟩
        · exact ⟨{v,d},mem_union_right _ hvdC2,hvdT⟩
    have hle := tau_le_card hcover
    have hc := card_union_le C1 C2
    omega
  by_cases hacG : G.Adj a c
  · apply finish {v,a} (triple_first_edge hva)
    intro t ht ht1 ht2
    have hm := bowtie_mixed_triple hnd (mem_triangles.mp ht).card_eq
      (new_triangle_removed_edge ht ht2) (new_triangle_removed_edge ht ht1)
    rcases hm with rfl | rfl | rfl | rfl
    · exact Or.inl (triple_first_edge hva)
    · exact Or.inl (triple_first_edge hva)
    · exact (hcol ⟨hacG,(SimpleGraph.is3Clique_triple_iff.mp (mem_triangles.mp ht)).2.2⟩).elim
    · exact Or.inr (triple_second_edge hvd)
  · apply finish {v,b} (triple_second_edge hvb)
    intro t ht ht1 ht2
    have hm := bowtie_mixed_triple hnd (mem_triangles.mp ht).card_eq
      (new_triangle_removed_edge ht ht2) (new_triangle_removed_edge ht ht1)
    rcases hm with rfl | rfl | rfl | rfl
    · exact (hacG (SimpleGraph.is3Clique_triple_iff.mp (mem_triangles.mp ht)).2.2).elim
    · exact Or.inr (triple_second_edge hvd)
    · exact Or.inl (triple_first_edge hvb)
    · exact Or.inl (triple_first_edge hvb)

/-- Complete new-family four-edge cover, including every mixed bowtie triangle. -/
theorem bowtie_new_cover {G : SimpleGraph V} {v a b c d : V}
    (hnd : [v,a,b,c,d].Nodup) (hU : G.IsNClique 3 {v,a,b})
    (hW : G.IsNClique 3 {v,c,d})
    (hn1 : nu (triangles (deleteTriangle G {v,c,d}) \
      triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b})) = 1)
    (hn2 : nu (triangles (deleteTriangle G {v,a,b}) \
      triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b})) = 1) :
    tau (triangles G \ triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b})) ≤ 4 := by
  classical
  let U : Finset V := {v,a,b}
  let W : Finset V := {v,c,d}
  let H := deleteTriangle (deleteTriangle G W) U
  let F1 := triangles (deleteTriangle G W) \ triangles H
  let F2 := triangles (deleteTriangle G U) \ triangles H
  by_cases ht1 : tau F1 ≤ 1
  · by_cases ht2 : tau F2 ≤ 1
    · obtain ⟨C1,hC1,hcard1⟩ := exists_min_cover (triangles_mono (F := F1) sdiff_subset (triangles_valid _))
      obtain ⟨C2,hC2,hcard2⟩ := exists_min_cover (triangles_mono (F := F2) sdiff_subset (triangles_valid _))
      let C := (C1 ∪ C2) ∪ {{v,a},{v,b}}
      have hva : v ≠ a := by rintro rfl; simp at hnd
      have hvb : v ≠ b := by rintro rfl; simp at hnd
      have hcover : Covers (triangles G \ triangles H) C := by
        apply new_cover_of_individuals_and_mixed
        · exact cover_enlarge_restoration hC1 (subset_union_left.trans subset_union_left)
        · exact cover_enlarge_restoration hC2 (subset_union_right.trans subset_union_left)
        · intro t ht ht1 ht2
          have hm := bowtie_mixed_triple hnd (mem_triangles.mp ht).card_eq
            (new_triangle_removed_edge ht ht2) (new_triangle_removed_edge ht ht1)
          rcases hm with rfl | rfl | rfl | rfl
          · exact ⟨{v,a},mem_union_right _ (by simp),triple_first_edge hva⟩
          · exact ⟨{v,a},mem_union_right _ (by simp),triple_first_edge hva⟩
          · exact ⟨{v,b},mem_union_right _ (by simp),triple_first_edge hvb⟩
          · exact ⟨{v,b},mem_union_right _ (by simp),triple_first_edge hvb⟩
      have hle := tau_le_card hcover
      have hc := card_union_le (C1 ∪ C2) ({{v,a},{v,b}} : Finset (Finset V))
      have hc12 := card_union_le C1 C2
      have hcsp : ({{v,a},{v,b}} : Finset (Finset V)).card ≤ 2 :=
        (card_insert_le _ _).trans (by simp)
      change tau (triangles G \ triangles H) ≤ 4
      dsimp [C] at hle
      omega
    · have hnd2 : [v,c,d,a,b].Nodup := by
        have hva : v ≠ a := by rintro rfl; simp at hnd
        have hvb : v ≠ b := by rintro rfl; simp at hnd
        have hvc : v ≠ c := by rintro rfl; simp at hnd
        have hvd : v ≠ d := by rintro rfl; simp at hnd
        have hab : a ≠ b := by rintro rfl; simp at hnd
        have hac : a ≠ c := by rintro rfl; simp at hnd
        have had : a ≠ d := by rintro rfl; simp at hnd
        have hbc : b ≠ c := by rintro rfl; simp at hnd
        have hbd : b ≠ d := by rintro rfl; simp at hnd
        have hcd : c ≠ d := by rintro rfl; simp at hnd
        simp [hva,hvb,hvc,hvd,hab,hac.symm,had.symm,hbc.symm,hbd.symm,hcd]
      have hcomm := deleteTriangle_comm G U W
      have hnswap1 : nu (triangles (deleteTriangle G U) \ triangles (deleteTriangle (deleteTriangle G U) W)) = 1 := by
        rw [hcomm]; exact hn2
      have hnswap2 : nu (triangles (deleteTriangle G W) \ triangles (deleteTriangle (deleteTriangle G U) W)) = 1 := by
        rw [hcomm]; exact hn1
      have htswap : 1 < tau (triangles (deleteTriangle G U) \ triangles (deleteTriangle (deleteTriangle G U) W)) := by
        rw [hcomm]; change 1 < tau F2; omega
      have hh := bowtie_new_cover_first_nontrivial hnd2 hW hU hnswap1 hnswap2 htswap
      change tau (triangles G \ triangles (deleteTriangle (deleteTriangle G U) W)) ≤ 4 at hh
      rw [hcomm] at hh
      exact hh
  · exact bowtie_new_cover_first_nontrivial hnd hU hW hn1 hn2 (by change 1 < tau F1; omega)

/-- The shared-vertex equality-restoration theorem, with the complete new triangle family. -/
theorem two_triangle_equality_bowtie (hns : HNSInput (V := V))
    (G : SimpleGraph V) (v a b c d : V) (hnd : [v,a,b,c,d].Nodup)
    (hU : G.IsNClique 3 {v,a,b}) (hW : G.IsNClique 3 {v,c,d})
    (htrip : TriangleTripartite (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b}))
    (heq : tau (triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b})) =
      2 * nu (triangles (deleteTriangle (deleteTriangle G {v,c,d}) {v,a,b}))) :
    tau (triangles G) ≤ 2 * nu (triangles G) := by
  classical
  let U : Finset V := {v,a,b}
  let W : Finset V := {v,c,d}
  let H := deleteTriangle (deleteTriangle G W) U
  let F := triangles H
  have hd := bowtie_edges_disjoint hnd
  have hTU := triangle_survives_delete hU hd
  have hgain1 := one_restoration_packing_gain hTU
  have hgain2 := one_restoration_packing_gain hW
  have hcov1 := one_restoration_cover_bound hTU
  have hcov2 := one_restoration_cover_bound hW
  change nu (triangles (deleteTriangle G W)) + 1 ≤ nu (triangles G) at hgain2
  change tau (triangles G) ≤ tau (triangles (deleteTriangle G W)) + 3 at hcov2
  by_cases hbig : nu F + 3 ≤ nu (triangles G)
  · change tau F = 2 * nu F at heq
    change tau (triangles (deleteTriangle G W)) ≤ tau F + 3 at hcov1
    omega
  · have hsmall : nu (triangles G) < nu F + 3 := by omega
    have hn1 := equality_individual_family_nu_one hns G U W hU hW hd htrip heq hsmall
    have hcomm := deleteTriangle_comm G U W
    have ht2 : TriangleTripartite (deleteTriangle (deleteTriangle G U) W) := by
      rw [hcomm]; exact htrip
    have he2 : tau (triangles (deleteTriangle (deleteTriangle G U) W)) =
        2 * nu (triangles (deleteTriangle (deleteTriangle G U) W)) := by
      rw [hcomm]; exact heq
    have hs2 : nu (triangles G) < nu (triangles (deleteTriangle (deleteTriangle G U) W)) + 3 := by
      rw [hcomm]; exact hsmall
    have hn2 := equality_individual_family_nu_one hns G W U hW hU hd.symm ht2 he2 hs2
    rw [hcomm] at hn2
    have hnew := bowtie_new_cover hnd hU hW hn1 hn2
    have hsub : F ⊆ triangles G := triangles_mono_graph
      ((delete_le (deleteTriangle G W) U).trans (delete_le G W))
    have hc := tau_union_le (K := triangles G \ F) (triangles_valid H)
      (triangles_mono sdiff_subset (triangles_valid G))
    rw [union_sdiff_of_subset hsub] at hc
    change tau (triangles G) ≤ tau F + tau (triangles G \ F) at hc
    change tau (triangles G \ F) ≤ 4 at hnew
    change tau F = 2 * nu F at heq
    change nu F + 1 ≤ nu (triangles (deleteTriangle G W)) at hgain1
    omega

/-- Two edge-disjoint triangles are vertex-disjoint or a genuine five-vertex bowtie. -/
theorem edge_disjoint_triangle_vertex_cases {U W : Finset V}
    (hU : U.card = 3) (hW : W.card = 3) (hd : Disjoint (edges U) (edges W)) :
    Disjoint U W ∨ ∃ v a b c d, [v,a,b,c,d].Nodup ∧ U = {v,a,b} ∧ W = {v,c,d} := by
  classical
  by_cases hdv : Disjoint U W
  · exact Or.inl hdv
  · right
    have hi : (U ∩ W).card ≤ 1 := by
      by_contra hn
      have hge : 2 ≤ (U ∩ W).card := by omega
      obtain ⟨e,hes,hec⟩ := exists_subset_card_eq hge
      have heU : e ∈ edges U := mem_edges.mpr ⟨hes.trans inter_subset_left,hec⟩
      have heW : e ∈ edges W := mem_edges.mpr ⟨hes.trans inter_subset_right,hec⟩
      exact disjoint_left.mp hd heU heW
    obtain ⟨v,hvU,hvW⟩ := not_disjoint_iff.mp hdv
    have huv : (U.erase v).card = 2 := by rw [card_erase_of_mem hvU,hU]
    have hwv : (W.erase v).card = 2 := by rw [card_erase_of_mem hvW,hW]
    obtain ⟨a,b,hab,habset⟩ := card_eq_two.mp huv
    obtain ⟨c,d,hcd,hcdset⟩ := card_eq_two.mp hwv
    have haE : a ∈ U.erase v := by rw [habset]; simp
    have hbE : b ∈ U.erase v := by rw [habset]; simp
    have hcE : c ∈ W.erase v := by rw [hcdset]; simp
    have hdE : d ∈ W.erase v := by rw [hcdset]; simp
    have hva : v ≠ a := (mem_erase.mp haE).1.symm
    have hvb : v ≠ b := (mem_erase.mp hbE).1.symm
    have hvc : v ≠ c := (mem_erase.mp hcE).1.symm
    have hvd : v ≠ d := (mem_erase.mp hdE).1.symm
    have hinteq : ∀ x ∈ U, x ∈ W → x = v := by
      intro x hxU hxW
      exact (card_le_one.mp hi) x (mem_inter.mpr ⟨hxU,hxW⟩) v (mem_inter.mpr ⟨hvU,hvW⟩)
    have hac : a ≠ c := by
      intro he
      have hav := hinteq a (mem_erase.mp haE).2 (he.symm ▸ (mem_erase.mp hcE).2)
      exact hva hav.symm
    have had : a ≠ d := by
      intro he
      have hav := hinteq a (mem_erase.mp haE).2 (he.symm ▸ (mem_erase.mp hdE).2)
      exact hva hav.symm
    have hbc : b ≠ c := by
      intro he
      have hbv := hinteq b (mem_erase.mp hbE).2 (he.symm ▸ (mem_erase.mp hcE).2)
      exact hvb hbv.symm
    have hbd : b ≠ d := by
      intro he
      have hbv := hinteq b (mem_erase.mp hbE).2 (he.symm ▸ (mem_erase.mp hdE).2)
      exact hvb hbv.symm
    refine ⟨v,a,b,c,d,?_,?_,?_⟩
    · simp [hva,hvb,hvc,hvd,hab,hac,had,hbc,hbd,hcd]
    · calc
        U = insert v (U.erase v) := (insert_erase hvU).symm
        _ = {v,a,b} := by rw [habset]
    · calc
        W = insert v (W.erase v) := (insert_erase hvW).symm
        _ = {v,c,d} := by rw [hcdset]

/-- Full exact-equality two-triangle restoration for an actual finite simple graph.
Only the frozen published HNS extraction interface is assumed; every new elementary deduction is proved. -/
theorem two_triangle_exact_equality (hns : HNSInput (V := V))
    (G : SimpleGraph V) (U W : Finset V)
    (hU : G.IsNClique 3 U) (hW : G.IsNClique 3 W)
    (hd : Disjoint (edges U) (edges W))
    (htrip : TriangleTripartite (deleteTriangle (deleteTriangle G W) U))
    (heq : tau (triangles (deleteTriangle (deleteTriangle G W) U)) =
      2 * nu (triangles (deleteTriangle (deleteTriangle G W) U))) :
    tau (triangles G) ≤ 2 * nu (triangles G) := by
  rcases edge_disjoint_triangle_vertex_cases hU.card_eq hW.card_eq hd with hdv | hbow
  · exact two_triangle_equality_vertex_disjoint hns G U W hU hW hdv htrip heq
  · obtain ⟨v,a,b,c,d,hnd,hUeq,hWeq⟩ := hbow
    subst U W
    exact two_triangle_equality_bowtie hns G v a b c d hnd hU hW htrip heq

#check two_triangle_exact_equality
#print axioms bowtie_new_cover
#print axioms two_triangle_equality_bowtie
#print axioms two_triangle_exact_equality
end Tuza
