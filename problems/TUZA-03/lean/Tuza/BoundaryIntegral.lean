import Tuza.Boundary

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Classical König theorem, stated for the full edge set of a finite bipartite
simple graph. This input has no triangle or boundary content. -/
def BipartiteKonigInput (W : Type*) [Fintype W] [DecidableEq W] : Prop :=
  ∀ (F : Finset (Finset W)) (L R : Finset W), Disjoint L R →
    (∀ e ∈ F, ∃ l ∈ L, ∃ r ∈ R, e = {l,r}) →
    ∃ M : Finset (Finset W), ∃ C : Finset W,
      M ⊆ F ∧
      (∀ e ∈ M, ∀ f ∈ M, e ≠ f → Disjoint e f) ∧
      (∀ e ∈ F, ∃ c ∈ C, c ∈ e) ∧ C.card = M.card

/-- Edges of a triangle incident to the independent terminal set. -/
noncomputable def terminalSpokes (U t : Finset V) : Finset (Finset V) := by
  classical
  exact (edges t).filter fun e => ¬ Disjoint e U

theorem terminalSpokes_sub (U t : Finset V) : terminalSpokes U t ⊆ edges t := by
  classical
  exact filter_subset _ _

theorem terminalSpokes_eq {U : Finset V} {u p x : V}
    (hu : u ∈ U) (hp : p ∉ U) (hx : x ∉ U) (hpx : p ≠ x) :
    terminalSpokes U {u,p,x} = {{u,p},{u,x}} := by
  classical
  have hup : u ≠ p := fun he => hp (he ▸ hu)
  have hux : u ≠ x := fun he => hx (he ▸ hu)
  ext e
  constructor
  · intro he
    obtain ⟨heT,heU⟩ := mem_filter.mp he
    obtain ⟨y,hye,hyU⟩ := not_disjoint_iff.mp heU
    have hyt := (mem_edges.mp heT).1 hye
    have hyu : y = u := by
      simp only [mem_insert,mem_singleton] at hyt
      rcases hyt with rfl | rfl | rfl
      · rfl
      · exact (hp hyU).elim
      · exact (hx hyU).elim
    subst y
    have hcard : (e.erase u).card = 1 := by
      rw [card_erase_of_mem hye,(mem_edges.mp heT).2]
    obtain ⟨z,hz⟩ := card_eq_one.mp hcard
    have hze : z ∈ e.erase u := by rw [hz]; simp
    have hzt := (mem_edges.mp heT).1 (mem_erase.mp hze).2
    have heq : e = {u,z} := by rw [← hz,insert_erase hye]
    have hzpx : z = p ∨ z = x := by
      simp only [mem_insert,mem_singleton] at hzt
      exact hzt.resolve_left (mem_erase.mp hze).1
    rcases hzpx with rfl | rfl <;> simp [heq]
  · intro he
    simp only [mem_insert,mem_singleton] at he
    rcases he with rfl | rfl
    · apply mem_filter.mpr
      refine ⟨mem_edges.mpr ⟨by simp,by simp [hup]⟩,?_⟩
      exact not_disjoint_iff.mpr ⟨u,by simp,hu⟩
    · apply mem_filter.mpr
      refine ⟨mem_edges.mpr ⟨by simp,by simp [hux]⟩,?_⟩
      exact not_disjoint_iff.mpr ⟨u,by simp,hu⟩

theorem closed_lost_spokes {H : SimpleGraph V} {U P : Finset V}
    {A : Finset (Finset V)} (hb : ClosedBoundary H U P A)
    {t : Finset V} (ht : t ∈ triangles H \ triangles (deleteEdges H A)) :
    ∃ u ∈ U, ∃ p ∈ P, ∃ x, x ∉ U ∪ P ∧ t = {u,p,x} ∧
      terminalSpokes U t = {{u,p},{u,x}} ∧ ({u,p} : Finset V) ∈ A ∧
      ({u,x} : Finset V) ∉ A ∧ H.Adj p x := by
  obtain ⟨u,hu,p,hp,x,hx,htx,ha,hup,hux,hpx⟩ :=
    closed_lost_triangle hb (mem_sdiff.mp ht).1 (mem_sdiff.mp ht).2
  have hpU : p ∉ U := fun hpu => disjoint_left.mp hb.disjoint hpu hp
  have hxU : x ∉ U := fun hxu => hx (mem_union_left _ hxu)
  have hpxne : p ≠ x := by intro he; subst x; exact hx (mem_union_right _ hp)
  have hright : ({u,x} : Finset V) ∉ A := by
    intro ha'
    obtain ⟨v,hv,q,hq,hvq,heq⟩ := hb.deleted {u,x} ha'
    have hqm : q ∈ ({u,x} : Finset V) := by rw [heq]; simp
    rcases mem_insert.mp hqm with rfl | hqm
    · exact disjoint_left.mp hb.disjoint hu hq
    · exact hx (mem_union_right _ ((mem_singleton.mp hqm) ▸ hq))
  refine ⟨u,hu,p,hp,x,hx,htx,?_,ha,hright,hpx⟩
  rw [htx]
  exact terminalSpokes_eq hu hpU hxU hpxne

theorem closed_spokes_recover {H : SimpleGraph V} {U P : Finset V}
    {A : Finset (Finset V)} (hb : ClosedBoundary H U P A)
    {t : Finset V} (ht : t ∈ triangles H \ triangles (deleteEdges H A)) :
    (terminalSpokes U t).biUnion id = t := by
  classical
  obtain ⟨u,hu,p,hp,x,hx,htx,hsp,rest⟩ := closed_lost_spokes hb ht
  rw [hsp,htx]
  ext y
  simp only [mem_biUnion,mem_insert,mem_singleton,id_eq]
  constructor
  · rintro ⟨e,he,hy⟩
    rcases he with rfl | rfl <;> simp only [mem_insert,mem_singleton] at hy <;> tauto
  · intro hy
    rcases hy with hy | hy | hy
    · subst y; exact ⟨{u,p},Or.inl rfl,by simp⟩
    · subst y; exact ⟨{u,p},Or.inl rfl,by simp⟩
    · subst y; exact ⟨{u,x},Or.inr rfl,by simp⟩

theorem closed_spokes_injective {H : SimpleGraph V} {U P : Finset V}
    {A : Finset (Finset V)} (hb : ClosedBoundary H U P A) :
    Set.InjOn (terminalSpokes U)
      (↑(triangles H \ triangles (deleteEdges H A)) : Set (Finset V)) := by
  intro t ht s hs heq
  rw [← closed_spokes_recover hb ht,← closed_spokes_recover hb hs,heq]

/-- Local uniqueness is what makes matching disjointness control rim edges too. -/
theorem closed_spokes_disjoint {H : SimpleGraph V} {U P : Finset V}
    {A : Finset (Finset V)} (hb : ClosedBoundary H U P A)
    {t s : Finset V} (ht : t ∈ triangles H \ triangles (deleteEdges H A))
    (hs : s ∈ triangles H \ triangles (deleteEdges H A))
    (hd : Disjoint (terminalSpokes U t) (terminalSpokes U s)) :
    Disjoint (edges t) (edges s) := by
  classical
  apply disjoint_left.mpr
  intro e het hes
  by_cases heU : ¬ Disjoint e U
  · exact disjoint_left.mp hd (mem_filter.mpr ⟨het,heU⟩) (mem_filter.mpr ⟨hes,heU⟩)
  · have heU : Disjoint e U := by tauto
    obtain ⟨u,hu,p,hp,x,hx,htx,hsp,ha,hna,hpx⟩ := closed_lost_spokes hb ht
    obtain ⟨v,hv,q,hq,y,hy,hsy,hsp',ha',hna',hqy⟩ := closed_lost_spokes hb hs
    have rim : ∀ {a b c : V} {r : Finset V}, a ∈ U → r = {a,b,c} →
        e ∈ edges r → e = {b,c} := by
      intro a b c r ha hr her
      apply eq_of_subset_of_card_le
      · intro z hz
        have hzr := (mem_edges.mp her).1 hz
        rw [hr] at hzr
        rcases mem_insert.mp hzr with rfl | hzr
        · exact (disjoint_left.mp heU hz ha).elim
        · exact hzr
      · exact ((card_insert_le b {c}).trans (by simp)).trans_eq (mem_edges.mp her).2.symm
    have hepx := rim hu htx het
    have heqy := rim hv hsy hes
    have hpq : p = q := by
      have hpqy : p ∈ ({q,y} : Finset V) := by rw [← heqy,hepx]; simp
      rcases mem_insert.mp hpqy with hpq | hpy
      · exact hpq
      · have hpy := mem_singleton.mp hpy
        exact (hy (mem_union_right _ (hpy ▸ hp))).elim
    subst q
    have hxy : x = y := by
      have hxpy : x ∈ ({p,y} : Finset V) := by rw [← heqy,hepx]; simp
      rcases mem_insert.mp hxpy with hxp | hxy
      · exact (hx (mem_union_right _ (hxp.symm ▸ hp))).elim
      · exact mem_singleton.mp hxy
    subst y
    have hup := (mem_triangles.mp (mem_sdiff.mp ht).1).isClique
      (by rw [htx]; simp : u ∈ t) (by rw [htx]; simp : p ∈ t)
      (by intro he; exact disjoint_left.mp hb.disjoint (he ▸ hu) hp)
    have hux := (mem_triangles.mp (mem_sdiff.mp ht).1).isClique
      (by rw [htx]; simp : u ∈ t) (by rw [htx]; simp : x ∈ t)
      (by intro he; exact hx (mem_union_left _ (he ▸ hu)))
    have hvp := (mem_triangles.mp (mem_sdiff.mp hs).1).isClique
      (by rw [hsy]; simp : v ∈ s) (by rw [hsy]; simp : p ∈ s)
      (by intro he; exact disjoint_left.mp hb.disjoint (he ▸ hv) hp)
    have hvx := (mem_triangles.mp (mem_sdiff.mp hs).1).isClique
      (by rw [hsy]; simp : v ∈ s) (by rw [hsy]; simp : x ∈ s)
      (by intro he; exact hx (mem_union_left _ (he ▸ hv)))
    have huv := hb.unique p hp x hx hpx u hu v hv hup.symm hux.symm hvp.symm hvx.symm
    subst v
    have he1 : ({u,p} : Finset V) ∈ terminalSpokes U t := by rw [hsp]; simp
    have he2 : ({u,p} : Finset V) ∈ terminalSpokes U s := by rw [hsp']; simp
    exact disjoint_left.mp hd he1 he2

/-- All elementary conversions from boundary triangles to bipartite edges are proved. -/
theorem closed_lost_cover_le_packing
    (konig : BipartiteKonigInput (Finset V))
    {H : SimpleGraph V} {U P : Finset V} {A : Finset (Finset V)}
    (hb : ClosedBoundary H U P A) :
    tau (triangles H \ triangles (deleteEdges H A)) ≤
      nu (triangles H \ triangles (deleteEdges H A)) := by
  classical
  let L := triangles H \ triangles (deleteEdges H A)
  let F := L.image (terminalSpokes U)
  have hpart : ∀ e ∈ F, ∃ l ∈ A, ∃ r ∈ (univ \ A : Finset (Finset V)), e = {l,r} := by
    intro e he
    obtain ⟨t,ht,rfl⟩ := mem_image.mp he
    obtain ⟨u,hu,p,hp,x,hx,htx,hsp,ha,hna,hadj⟩ := closed_lost_spokes hb ht
    exact ⟨{u,p},ha,{u,x},by simp [hna],hsp⟩
  have hdis : Disjoint A (univ \ A : Finset (Finset V)) := by
    apply disjoint_left.mpr
    intro e hea her
    exact (mem_sdiff.mp her).2 hea
  obtain ⟨M,C,hMF,hM,hC,hcard⟩ := konig F A (univ \ A) hdis hpart
  let Q := L.filter fun t => terminalSpokes U t ∈ M
  have hinj := closed_spokes_injective hb
  have hQimage : Q.image (terminalSpokes U) = M := by
    ext e
    constructor
    · intro he
      obtain ⟨t,ht,rfl⟩ := mem_image.mp he
      exact (mem_filter.mp ht).2
    · intro he
      obtain ⟨t,ht,hfe⟩ := mem_image.mp (hMF he)
      exact mem_image.mpr ⟨t,mem_filter.mpr ⟨ht,hfe.symm ▸ he⟩,hfe⟩
  have hQcard : Q.card = M.card := by
    have hinjQ : Set.InjOn (terminalSpokes U) (Q : Set (Finset V)) := by
      intro t ht s hs heq
      exact hinj (mem_filter.mp ht).1 (mem_filter.mp hs).1 heq
    rw [← hQimage,card_image_iff.mpr hinjQ]
  have hQ : Packing L Q := by
    refine ⟨filter_subset _ _,?_⟩
    intro t ht s hs hne
    have hft := (mem_filter.mp ht).2
    have hfs := (mem_filter.mp hs).2
    have hdiff : terminalSpokes U t ≠ terminalSpokes U s := by
      intro heq
      exact hne (hinj (mem_filter.mp ht).1 (mem_filter.mp hs).1 heq)
    exact closed_spokes_disjoint hb (mem_filter.mp ht).1 (mem_filter.mp hs).1
      (hM _ hft _ hfs hdiff)
  have hcover : Covers L C := by
    intro t ht
    obtain ⟨e,he,hes⟩ := hC (terminalSpokes U t) (mem_image_of_mem _ ht)
    exact ⟨e,he,terminalSpokes_sub U t hes⟩
  change tau L ≤ nu L
  calc
    tau L ≤ C.card := tau_le_card hcover
    _ = Q.card := hcard.trans hQcard.symm
    _ ≤ nu L := packing_card_le hQ

/-- An actual graph edge is essential for triangle packing. -/
def HasPackingEssentialEdge (H : SimpleGraph V) : Prop :=
  ∃ a b, H.Adj a b ∧ nu (triangles (deleteEdges H {{a,b}})) + 1 = nu (triangles H)

/-- Full unbounded closed-boundary equality-deletion theorem. -/
theorem closed_boundary_equality_deletion
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    (konig : BipartiteKonigInput (Finset V))
    {H : SimpleGraph V} {U P : Finset V} {A : Finset (Finset V)}
    (htrip : TriangleTripartite H) (hb : ClosedBoundary H U P A)
    (hslack : tau (triangles H) + 1 = 2 * nu (triangles H))
    (heq : tau (triangles (deleteEdges H A)) = 2 * nu (triangles (deleteEdges H A))) :
    HasPackingEssentialEdge H := by
  classical
  let K := deleteEdges H A
  let L := triangles H \ triangles K
  have hKH : K ≤ H := deleteEdges_le H A
  have hsub : triangles K ⊆ triangles H := triangles_mono_graph hKH
  have hL : Triangles L := triangles_mono sdiff_subset (triangles_valid H)
  change tau (triangles K) = 2 * nu (triangles K) at heq
  have hint : tau L ≤ nu L := closed_lost_cover_le_packing konig hb
  have htripK := tripartite_mono hKH htrip
  obtain ⟨B,hB,hi,hsize⟩ := hns K htripK heq
  obtain ⟨R,hR,hRsize,hcompat⟩ := closed_boundary_faces hb (le_refl K) hB hi
  have hRH := packing_mono hsub hR
  have hlow := nu_union_lower (triangles_valid H) hRH hcompat
  change R.card + nu L ≤ nu (triangles H ∪ L) at hlow
  have hunionH : triangles H ∪ L = triangles H := by simp [L]
  rw [hunionH,hRsize,hsize] at hlow
  have hunion : triangles K ∪ L = triangles H := union_sdiff_of_subset hsub
  have hcover := tau_union_le (triangles_valid K) hL
  rw [hunion] at hcover
  have hmono := tau_mono hsub (triangles_valid H)
  have hdrop : nu (triangles K) + 1 = nu (triangles H) := by omega
  have hnuL : nu L = 1 := by omega
  have hnon : L.Nonempty := by
    by_contra hn
    have hz : L = ∅ := not_nonempty_iff_eq_empty.mp hn
    rw [hz,nu_empty] at hnuL
    omega
  obtain ⟨C,hC,hCcard,hCs⟩ := exists_min_cover_supported hL
  obtain ⟨t,ht⟩ := hnon
  obtain ⟨e,heC,het⟩ := hC t ht
  have hCone : C.card = 1 := by
    have hlo := card_pos.mpr (show C.Nonempty from ⟨e,heC⟩)
    omega
  have hCeq : C = {e} := eq_singleton_iff_unique_mem.mpr ⟨heC,by
    intro f hf
    exact card_le_one.mp (show C.card ≤ 1 by omega) f hf e heC⟩
  have heH : H.IsNClique 2 e := supported_edge_is_graph_edge
    (show e ∈ support (triangles H) from mem_biUnion.mpr
      ⟨t, (mem_sdiff.mp ht).1,het⟩)
  obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp heH.card_eq
  have habH : H.Adj a b := heH.isClique (by simp) (by simp) hab
  refine ⟨a,b,habH,?_⟩
  let J := deleteEdges H {{a,b}}
  have hJKtri : triangles J ⊆ triangles K := by
    intro q hq
    by_contra hqK
    have hql : q ∈ L := mem_sdiff.mpr ⟨triangles_mono_graph (deleteEdges_le H _) hq,hqK⟩
    obtain ⟨f,hfC,hfq⟩ := hC q hql
    rw [hCeq] at hfC
    have hfe := mem_singleton.mp hfC
    subst f
    exact deleted_pair_not_in_triangle hq (mem_singleton_self _) hfq
  have hJnu := nu_mono hJKtri
  have hJtrip := tripartite_mono (deleteEdges_le H ({{a,b}} : Finset (Finset V))) htrip
  have hJbound := aharoni J hJtrip
  have hJcover := tau_deleteEdges_le H ({{a,b}} : Finset (Finset V))
  change tau (triangles H) ≤ tau (triangles J) + _ at hJcover
  simp only [card_singleton] at hJcover
  change nu (triangles J) + 1 = nu (triangles H)
  omega

/-- Stable boundary deletion loses at most floor(|A|/2) packed triangles. -/
theorem closed_boundary_packing_loss
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    (konig : BipartiteKonigInput (Finset V))
    {H : SimpleGraph V} {U P : Finset V} {A : Finset (Finset V)}
    (htrip : TriangleTripartite H) (hb : ClosedBoundary H U P A)
    (hslack : tau (triangles H) + 1 = 2 * nu (triangles H))
    (hstable : PackingEdgeStable H) :
    nu (triangles H) ≤ nu (triangles (deleteEdges H A)) + A.card / 2 := by
  have hK := aharoni (deleteEdges H A) (tripartite_mono (deleteEdges_le H A) htrip)
  have hneq : tau (triangles (deleteEdges H A)) ≠ 2 * nu (triangles (deleteEdges H A)) := by
    intro heq
    obtain ⟨a,b,hab,hess⟩ := closed_boundary_equality_deletion aharoni hns konig htrip hb hslack heq
    have hs := hstable a b hab
    omega
  have hcover := tau_deleteEdges_le H A
  omega

#check closed_lost_cover_le_packing
#check closed_boundary_equality_deletion
#check closed_boundary_packing_loss
#print axioms closed_lost_cover_le_packing
#print axioms closed_boundary_equality_deletion
#print axioms closed_boundary_packing_loss
end Tuza
