import Tuza.EssentialPages
import Tuza.BowtieEquality

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Pages at one apex are disjoint whenever their bases are vertex-disjoint. -/
theorem essential_same_apex_disjoint {e f : Finset V} {p : V} (hd : Disjoint e f) :
    Disjoint (edges (insert p e)) (edges (insert p f)) := by
  apply disjoint_left.mpr
  intro d hde hdf
  have hsub : d ⊆ ({p} : Finset V) := by
    intro x hx
    rcases mem_insert.mp ((mem_edges.mp hde).1 hx) with heq | hxe
    · exact mem_singleton.mpr heq
    · rcases mem_insert.mp ((mem_edges.mp hdf).1 hx) with heq | hxf
      · exact mem_singleton.mpr heq
      · exact (disjoint_left.mp hd hxe hxf).elim
  have hc := card_le_card hsub
  rw [(mem_edges.mp hde).2,card_singleton] at hc
  omega

/-- Disjoint triangles are distinct; this converts explicit packings to cardinalities. -/
theorem essential_triangles_ne {s t : Finset V} (hs : s.card = 3)
    (hd : Disjoint (edges s) (edges t)) : s ≠ t := by
  intro he
  subst t
  have hh := disjoint_self.mp hd
  exact (edges_nonempty (s := s) (by rw [hs]; decide)).ne_empty hh

/-- A four-triangle family with all six compatibility checks is a four-packing. -/
theorem essential_four_packing {F : Finset (Finset V)} (hF : Triangles F)
    {a b c d : Finset V} (ha : a ∈ F) (hb : b ∈ F) (hc : c ∈ F) (hd : d ∈ F)
    (hab : Disjoint (edges a) (edges b)) (hac : Disjoint (edges a) (edges c))
    (had : Disjoint (edges a) (edges d)) (hbc : Disjoint (edges b) (edges c))
    (hbd : Disjoint (edges b) (edges d)) (hcd : Disjoint (edges c) (edges d)) :
    Packing F {a,b,c,d} ∧ ({a,b,c,d} : Finset (Finset V)).card = 4 := by
  have nab := essential_triangles_ne (hF a ha) hab
  have nac := essential_triangles_ne (hF a ha) hac
  have nad := essential_triangles_ne (hF a ha) had
  have nbc := essential_triangles_ne (hF b hb) hbc
  have nbd := essential_triangles_ne (hF b hb) hbd
  have ncd := essential_triangles_ne (hF c hc) hcd
  refine ⟨⟨?_,?_⟩,by simp [nab,nac,nad,nbc,nbd,ncd]⟩
  · simp [insert_subset_iff,ha,hb,hc,hd]
  · intro s hs t ht hst
    simp only [mem_insert,mem_singleton] at hs ht
    rcases hs with rfl | rfl | rfl | rfl <;>
      rcases ht with rfl | rfl | rfl | rfl <;>
      first | exact (hst rfl).elim | assumption | apply Disjoint.symm; assumption

/-- Two bases per triangle, with the two same-apex pairs disjoint, supply four pages. -/
theorem essential_four_pages_from_bases (G : SimpleGraph V) (U W : Finset V)
    (hU : G.IsNClique 3 U) (hW : G.IsNClique 3 W)
    (hd : Disjoint (edges U) (edges W)) (x y : V) (hxy : x ≠ y)
    (hx : x ∉ U ∪ W) (hy : y ∉ U ∪ W)
    (hadj : ∀ u ∈ U ∪ W, G.Adj u x ∧ G.Adj u y)
    (e₁ e₂ e₃ e₄ : Finset V)
    (h₁ : e₁ ∈ edges U) (h₂ : e₂ ∈ edges U)
    (h₃ : e₃ ∈ edges W) (h₄ : e₄ ∈ edges W)
    (hne₁ : e₁ ≠ e₂) (hne₂ : e₃ ≠ e₄)
    (hsep₁ : Disjoint e₁ e₄) (hsep₂ : Disjoint e₂ e₃) :
    ∃ R, Packing (triangles G) R ∧ R.card = 4 ∧
      ∀ r ∈ R, (∃ e ∈ edges U, r = insert x e ∨ r = insert y e) ∨
        (∃ e ∈ edges W, r = insert x e ∨ r = insert y e) := by
  classical
  have hxU : x ∉ U := fun h => hx (mem_union_left _ h)
  have hyU : y ∉ U := fun h => hy (mem_union_left _ h)
  have hxW : x ∉ W := fun h => hx (mem_union_right _ h)
  have hyW : y ∉ W := fun h => hy (mem_union_right _ h)
  have hp₁ : insert x e₁ ∈ triangles G := (mem_sdiff.mp (essential_page_mem hU h₁
    (essential_mem_apices.mpr ⟨hxU,fun u hu => (hadj u (mem_union_left _ ((mem_edges.mp h₁).1 hu))).1⟩))).1
  have hp₂ : insert y e₂ ∈ triangles G := (mem_sdiff.mp (essential_page_mem hU h₂
    (essential_mem_apices.mpr ⟨hyU,fun u hu => (hadj u (mem_union_left _ ((mem_edges.mp h₂).1 hu))).2⟩))).1
  have hp₃ : insert y e₃ ∈ triangles G := (mem_sdiff.mp (essential_page_mem hW h₃
    (essential_mem_apices.mpr ⟨hyW,fun u hu => (hadj u (mem_union_right _ ((mem_edges.mp h₃).1 hu))).2⟩))).1
  have hp₄ : insert x e₄ ∈ triangles G := (mem_sdiff.mp (essential_page_mem hW h₄
    (essential_mem_apices.mpr ⟨hxW,fun u hu => (hadj u (mem_union_right _ ((mem_edges.mp h₄).1 hu))).1⟩))).1
  have h₁all := edges_mono (subset_union_left : U ⊆ U ∪ W) h₁
  have h₂all := edges_mono (subset_union_left : U ⊆ U ∪ W) h₂
  have h₃all := edges_mono (subset_union_right : W ⊆ U ∪ W) h₃
  have h₄all := edges_mono (subset_union_right : W ⊆ U ∪ W) h₄
  have hcross : ∀ e ∈ edges U, ∀ f ∈ edges W, e ≠ f := by
    intro e he f hf heq
    exact disjoint_left.mp hd he (heq.symm ▸ hf)
  have h12 := essential_distinct_pages_disjoint h₁all h₂all hne₁ hx hy hxy
  have h13 := essential_distinct_pages_disjoint h₁all h₃all (hcross _ h₁ _ h₃) hx hy hxy
  have h14 := essential_same_apex_disjoint (p := x) hsep₁
  have h23 := essential_same_apex_disjoint (p := y) hsep₂
  have h24 := essential_distinct_pages_disjoint h₂all h₄all (hcross _ h₂ _ h₄) hy hx hxy.symm
  have h34 := essential_distinct_pages_disjoint h₃all h₄all hne₂ hy hx hxy.symm
  obtain ⟨hpack,hcard⟩ := essential_four_packing (triangles_valid G) hp₁ hp₂ hp₃ hp₄ h12 h13 h14 h23 h24 h34
  refine ⟨{insert x e₁,insert y e₂,insert y e₃,insert x e₄},hpack,hcard,?_⟩
  intro r hr
  simp only [mem_insert,mem_singleton] at hr
  rcases hr with rfl | rfl | rfl | rfl
  · exact Or.inl ⟨e₁,h₁,Or.inl rfl⟩
  · exact Or.inl ⟨e₂,h₂,Or.inr rfl⟩
  · exact Or.inr ⟨e₃,h₃,Or.inr rfl⟩
  · exact Or.inr ⟨e₄,h₄,Or.inl rfl⟩


/-- A triple has two different bases. -/
theorem essential_two_bases {U : Finset V} (hU : U.card = 3) :
    ∃ e ∈ edges U, ∃ f ∈ edges U, e ≠ f := by
  classical
  obtain ⟨e,he⟩ := edges_nonempty (s := U) (by rw [hU]; decide)
  have hcard : ((edges U).erase e).card = 2 := by
    rw [card_erase_of_mem he]
    simp [edges,hU]
  obtain ⟨f,hf⟩ := card_pos.mp (show 0 < ((edges U).erase e).card by omega)
  exact ⟨e,he,f,(mem_erase.mp hf).2,(mem_erase.mp hf).1.symm⟩

/-- Four simultaneous pages over two edge-disjoint restored triangles.
This includes the bowtie and does not assume the restored triangles are vertex-disjoint. -/
theorem essential_four_pages (G : SimpleGraph V) (U W : Finset V)
    (hU : G.IsNClique 3 U) (hW : G.IsNClique 3 W)
    (hd : Disjoint (edges U) (edges W)) (x y : V) (hxy : x ≠ y)
    (hx : x ∉ U ∪ W) (hy : y ∉ U ∪ W)
    (hadj : ∀ u ∈ U ∪ W, G.Adj u x ∧ G.Adj u y) :
    ∃ R, Packing (triangles G) R ∧ R.card = 4 ∧
      ∀ r ∈ R, (∃ e ∈ edges U, r = insert x e ∨ r = insert y e) ∨
        (∃ e ∈ edges W, r = insert x e ∨ r = insert y e) := by
  classical
  rcases edge_disjoint_triangle_vertex_cases hU.card_eq hW.card_eq hd with hdv | hbow
  · obtain ⟨e₁,h₁,e₂,h₂,hne₁⟩ := essential_two_bases hU.card_eq
    obtain ⟨e₃,h₃,e₄,h₄,hne₂⟩ := essential_two_bases hW.card_eq
    have hsep₁ : Disjoint e₁ e₄ := hdv.mono (mem_edges.mp h₁).1 (mem_edges.mp h₄).1
    have hsep₂ : Disjoint e₂ e₃ := hdv.mono (mem_edges.mp h₂).1 (mem_edges.mp h₃).1
    exact essential_four_pages_from_bases G U W hU hW hd x y hxy hx hy hadj
      e₁ e₂ e₃ e₄ h₁ h₂ h₃ h₄ hne₁ hne₂ hsep₁ hsep₂
  · obtain ⟨v,a,b,c,d,hnd,hUeq,hWeq⟩ := hbow
    subst U W
    have hva : v ≠ a := by rintro rfl; simp at hnd
    have hvb : v ≠ b := by rintro rfl; simp at hnd
    have hvc : v ≠ c := by rintro rfl; simp at hnd
    have hvd : v ≠ d := by rintro rfl; simp at hnd
    have hab : a ≠ b := by rintro rfl; simp at hnd
    have hac : a ≠ c := by rintro rfl; simp at hnd
    have had : a ≠ d := by rintro rfl; simp at hnd
    have hbc : b ≠ c := by rintro rfl; simp at hnd
    have hcd : c ≠ d := by rintro rfl; simp at hnd
    have h₁ : ({a,b} : Finset V) ∈ edges {v,a,b} :=
      mem_edges.mpr ⟨by simp [insert_subset_iff],by simp [hab]⟩
    have h₂ : ({v,a} : Finset V) ∈ edges {v,a,b} :=
      mem_edges.mpr ⟨by simp [insert_subset_iff],by simp [hva]⟩
    have h₃ : ({c,d} : Finset V) ∈ edges {v,c,d} :=
      mem_edges.mpr ⟨by simp [insert_subset_iff],by simp [hcd]⟩
    have h₄ : ({v,c} : Finset V) ∈ edges {v,c,d} :=
      mem_edges.mpr ⟨by simp [insert_subset_iff],by simp [hvc]⟩
    have hne₁ : ({a,b} : Finset V) ≠ {v,a} := by
      intro he
      have h : b ∈ ({v,a} : Finset V) := by rw [← he]; simp
      simp [hvb.symm,hab.symm] at h
    have hne₂ : ({c,d} : Finset V) ≠ {v,c} := by
      intro he
      have h : d ∈ ({v,c} : Finset V) := by rw [← he]; simp
      simp [hvd.symm,hcd.symm] at h
    have hsep₁ : Disjoint ({a,b} : Finset V) {v,c} := by
      simp [disjoint_left,hva.symm,hvb.symm,hac,hbc]
    have hsep₂ : Disjoint ({v,a} : Finset V) {c,d} := by
      simp [disjoint_left,hvc,hvd,hac,had]
    exact essential_four_pages_from_bases G {v,a,b} {v,c,d} hU hW hd x y hxy hx hy hadj
      {a,b} {v,a} {c,d} {v,c} h₁ h₂ h₃ h₄ hne₁ hne₂ hsep₁ hsep₂

#print axioms essential_four_pages
end Tuza
