import Tuza06.ExternalPageGeometry
import Tuza06.SparseLinksTools

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A symbolic page-family lemma. Bad bases form a matching; for disjoint bad
partners, every possible third base meeting both is hit by two terminals.
Outside apices are arbitrary and their number is unrestricted. -/
theorem bad_partner_page_cover {F R : Finset (Finset V)} {W A : Finset V}
    (base : Finset V → Finset V) (apex : Finset V → V)
    (Bad : Finset V → Finset V → Prop) (hf : Triangles F)
    (hdata : ∀ q ∈ F, base q ∈ R ∧ apex q ∉ W ∧ q = insert (apex q) (base q))
    (hR : ∀ f ∈ R, f.card = 2 ∧ f ⊆ W)
    (hSym : ∀ f ∈ R, ∀ g ∈ R, Bad f g → Bad g f)
    (hUnique : ∀ f ∈ R, ∀ g ∈ R, ∀ h ∈ R, Bad f g → Bad f h → g = h)
    (hTerm : ∀ f ∈ R, ∀ g ∈ R, Bad f g → Disjoint f g → ∀ k ∈ R,
      (k = f ∨ k = g ∨ (¬ Disjoint k f ∧ ¬ Disjoint k g)) → ¬ Disjoint k A)
    (hNoGood : ∀ s ∈ F, ∀ t ∈ F, Disjoint (edges s) (edges t) → Bad (base s) (base t))
    (hAcard : A.card ≤ 2) : tau F ≤ 2 := by
  classical
  by_cases hInter : ∀ s ∈ F, ∀ t ∈ F, ¬ Disjoint (edges s) (edges t)
  · exact intersecting_cover hf hInter
  · push Not at hInter
    obtain ⟨s,hs,t,ht,hst⟩ := hInter
    let f := base s
    let g := base t
    have hfR : f ∈ R := (hdata s hs).1
    have hgR : g ∈ R := (hdata t ht).1
    have hBad : Bad f g := hNoGood s hs t ht hst
    have hBad' : Bad g f := hSym f hfR g hgR hBad
    have hgeom : ∀ q ∈ F, ∀ r ∈ F,
        (¬ Disjoint (edges q) (edges r)) ↔ base q = base r ∨
          (apex q = apex r ∧ ¬ Disjoint (base q) (base r)) := by
      intro q hq r hr
      have hg := external_pages_intersect_iff (hR _ (hdata q hq).1).1 (hR _ (hdata r hr).1).1
        (hR _ (hdata q hq).1).2 (hR _ (hdata r hr).1).2 (hdata q hq).2.1 (hdata r hr).2.1
      simpa only [← (hdata q hq).2.2,← (hdata r hr).2.2] using hg
    have hBaseEdge : ∀ q ∈ F, base q ∈ edges q := by
      intro q hq
      have he : base q ∈ edges (insert (apex q) (base q)) :=
        mem_edges.mpr ⟨subset_insert _ _,(hR _ (hdata q hq).1).1⟩
      simpa only [← (hdata q hq).2.2] using he
    have hOtherS : ∀ q ∈ F, base q ≠ f → base q ≠ g → ¬ Disjoint (edges q) (edges s) := by
      intro q hq hqf hqg hd
      have hb := hSym _ (hdata q hq).1 f hfR (hNoGood q hq s hs hd)
      exact hqg (hUnique f hfR g hgR _ (hdata q hq).1 hBad hb).symm
    have hOtherT : ∀ q ∈ F, base q ≠ f → base q ≠ g → ¬ Disjoint (edges q) (edges t) := by
      intro q hq hqf hqg hd
      have hb := hSym _ (hdata q hq).1 g hgR (hNoGood q hq t ht hd)
      exact hqf (hUnique g hgR f hfR _ (hdata q hq).1 hBad' hb).symm
    by_cases hThird : ∃ r ∈ F, base r ≠ f ∧ base r ≠ g
    · obtain ⟨r,hr,hrf,hrg⟩ := hThird
      have hrS := ((hgeom r hr s hs).mp (hOtherS r hr hrf hrg)).resolve_left hrf
      have hrT := ((hgeom r hr t ht).mp (hOtherT r hr hrf hrg)).resolve_left hrg
      have hxy : apex s = apex t := hrS.1.symm.trans hrT.1
      have hfg : Disjoint f g := by
        by_contra hn
        exact (hgeom s hs t ht).mpr (Or.inr ⟨hxy,hn⟩) hst
      have hall : ∀ q ∈ F, apex q = apex s ∧ ¬ Disjoint (base q) A := by
        intro q hq
        by_cases hqf : base q = f
        · have hqr : ¬ Disjoint (edges q) (edges r) := by
            intro hd
            have hb := hNoGood q hq r hr hd
            rw [hqf] at hb
            exact hrg (hUnique f hfR g hgR _ (hdata r hr).1 hBad hb).symm
          have hqnr : base q ≠ base r := by intro he; exact hrf (he.symm.trans hqf)
          have hqrgeom := ((hgeom q hq r hr).mp hqr).resolve_left hqnr
          exact ⟨hqrgeom.1.trans hrS.1,hTerm f hfR g hgR hBad hfg _ (hdata q hq).1 (Or.inl hqf)⟩
        · by_cases hqg : base q = g
          · have hqr : ¬ Disjoint (edges q) (edges r) := by
              intro hd
              have hb := hNoGood q hq r hr hd
              rw [hqg] at hb
              exact hrf (hUnique g hgR f hfR _ (hdata r hr).1 hBad' hb).symm
            have hqnr : base q ≠ base r := by intro he; exact hrg (he.symm.trans hqg)
            have hqrgeom := ((hgeom q hq r hr).mp hqr).resolve_left hqnr
            exact ⟨hqrgeom.1.trans hrS.1,hTerm f hfR g hgR hBad hfg _ (hdata q hq).1 (Or.inr (Or.inl hqg))⟩
          · have hqS := ((hgeom q hq s hs).mp (hOtherS q hq hqf hqg)).resolve_left hqf
            have hqT := ((hgeom q hq t ht).mp (hOtherT q hq hqf hqg)).resolve_left hqg
            exact ⟨hqS.1,hTerm f hfR g hgR hBad hfg _ (hdata q hq).1 (Or.inr (Or.inr ⟨hqS.2,hqT.2⟩))⟩
      let C : Finset (Finset V) := A.image (fun a => ({apex s,a} : Finset V))
      have hCover : Covers F C := by
        intro q hq
        obtain ⟨a,haBase,haA⟩ := not_disjoint_iff.mp (hall q hq).2
        have hxa : apex s ≠ a := fun h => (hdata s hs).2.1
          (h ▸ (hR _ (hdata q hq).1).2 haBase)
        refine ⟨{apex s,a},mem_image.mpr ⟨a,haA,rfl⟩,?_⟩
        rw [(hdata q hq).2.2,(hall q hq).1]
        exact mem_edges.mpr ⟨by simp [haBase],by simp [hxa]⟩
      exact (tau_le_card hCover).trans (card_image_le.trans hAcard)
    · have hCover : Covers F {f,g} := by
        intro q hq
        by_cases hqf : base q = f
        · exact ⟨f,by simp,hqf ▸ hBaseEdge q hq⟩
        · have hqg : base q = g := by
            by_contra hn
            exact hThird ⟨q,hq,hqf,hn⟩
          exact ⟨g,by simp,hqg ▸ hBaseEdge q hq⟩
      exact (tau_le_card hCover).trans card_le_two

/-- Transfer matching bad-base and terminal certificates on a finite local core
into an arbitrary ambient page family. -/
theorem bad_partner_mapped_page_cover {I : Type*} [DecidableEq I]
    (i : I ↪ V) {F : Finset (Finset V)} {R : Finset (Finset I)} {W : Finset V} {A : Finset I}
    (base : Finset V → Finset I) (apex : Finset V → V)
    (Bad : Finset I → Finset I → Prop) (hf : Triangles F)
    (hdata : ∀ q ∈ F, base q ∈ R ∧ apex q ∉ W ∧ q = insert (apex q) ((base q).map i))
    (hR : ∀ f ∈ R, f.card = 2 ∧ f.map i ⊆ W)
    (hSym : ∀ f ∈ R, ∀ g ∈ R, Bad f g → Bad g f)
    (hUnique : ∀ f ∈ R, ∀ g ∈ R, ∀ h ∈ R, Bad f g → Bad f h → g = h)
    (hTerm : ∀ f ∈ R, ∀ g ∈ R, Bad f g → Disjoint f g → ∀ k ∈ R,
      (k = f ∨ k = g ∨ (¬ Disjoint k f ∧ ¬ Disjoint k g)) → ¬ Disjoint k A)
    (hNoGood : ∀ s ∈ F, ∀ t ∈ F, Disjoint (edges s) (edges t) → Bad (base s) (base t))
    (hAcard : A.card ≤ 2) : tau F ≤ 2 := by
  classical
  let BadV : Finset V → Finset V → Prop := fun f g =>
    ∃ a ∈ R, ∃ b ∈ R, a.map i = f ∧ b.map i = g ∧ Bad a b
  have hEq : ∀ a ∈ R, ∀ b ∈ R, BadV (a.map i) (b.map i) ↔ Bad a b := by
    intro a ha b hb
    constructor
    · rintro ⟨c,hc,d,hd,hca,hdb,hbad⟩
      have hca' : c = a := map_inj.mp hca
      have hdb' : d = b := map_inj.mp hdb
      simpa only [hca',hdb'] using hbad
    · intro h
      exact ⟨a,ha,b,hb,rfl,rfl,h⟩
  apply bad_partner_page_cover (R := liftFamily i R) (A := A.map i)
    (base := fun q => (base q).map i) (apex := apex) BadV hf
  · intro q hq
    exact ⟨mem_liftFamily.mpr ⟨base q,(hdata q hq).1,rfl⟩,(hdata q hq).2⟩
  · intro f hf
    obtain ⟨a,ha,rfl⟩ := mem_liftFamily.mp hf
    exact ⟨by simpa using (hR a ha).1,(hR a ha).2⟩
  · intro f hf g hg hb
    obtain ⟨a,ha,rfl⟩ := mem_liftFamily.mp hf
    obtain ⟨b,hbR,rfl⟩ := mem_liftFamily.mp hg
    exact (hEq b hbR a ha).mpr (hSym a ha b hbR ((hEq a ha b hbR).mp hb))
  · intro f hf g hg h hh hfg hfh
    obtain ⟨a,ha,rfl⟩ := mem_liftFamily.mp hf
    obtain ⟨b,hb,rfl⟩ := mem_liftFamily.mp hg
    obtain ⟨c,hc,rfl⟩ := mem_liftFamily.mp hh
    exact congrArg (Finset.map i) (hUnique a ha b hb c hc
      ((hEq a ha b hb).mp hfg) ((hEq a ha c hc).mp hfh))
  · intro f hf g hg hbad hdisj k hk hcases
    obtain ⟨a,ha,rfl⟩ := mem_liftFamily.mp hf
    obtain ⟨b,hb,rfl⟩ := mem_liftFamily.mp hg
    obtain ⟨c,hc,rfl⟩ := mem_liftFamily.mp hk
    have hbad' := (hEq a ha b hb).mp hbad
    have hdisj' := (Finset.disjoint_map i).mp hdisj
    have hcases' : c = a ∨ c = b ∨ (¬ Disjoint c a ∧ ¬ Disjoint c b) := by
      simpa only [map_inj,Finset.disjoint_map] using hcases
    simpa only [Finset.disjoint_map] using hTerm a ha b hb hbad' hdisj' c hc hcases'
  · intro q hq r hr hd
    exact (hEq _ (hdata q hq).1 _ (hdata r hr).1).mpr (hNoGood q hq r hr hd)
  · simpa using hAcard

end Tuza06
