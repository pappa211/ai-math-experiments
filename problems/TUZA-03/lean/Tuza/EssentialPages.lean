import Tuza.Essential
import Mathlib.Combinatorics.Hall.Finite

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The three-set Hall criterion, used with the three restored bases. -/
theorem essential_three_set_hall (A B C : Finset V)
    (hA : 1 ≤ A.card) (hB : 1 ≤ B.card) (hC : 1 ≤ C.card)
    (hAB : 2 ≤ (A ∪ B).card) (hAC : 2 ≤ (A ∪ C).card)
    (hBC : 2 ≤ (B ∪ C).card) (hABC : 3 ≤ (A ∪ B ∪ C).card) :
    ∃ x ∈ A, ∃ y ∈ B, ∃ z ∈ C, x ≠ y ∧ x ≠ z ∧ y ≠ z := by
  classical
  let t : Fin 3 → Finset V := fun i => if i = 0 then A else if i = 1 then B else C
  have hh : ∀ s : Finset (Fin 3), s.card ≤ (s.biUnion t).card := by
    intro s
    fin_cases s
    · exact Nat.zero_le _
    · change 1 ≤ (({0} : Finset (Fin 3)).biUnion t).card
      simpa [t] using hA
    · change 1 ≤ (({1} : Finset (Fin 3)).biUnion t).card
      simpa [t] using hB
    · change 2 ≤ (({0,1} : Finset (Fin 3)).biUnion t).card
      simpa [t] using hAB
    · change 1 ≤ (({2} : Finset (Fin 3)).biUnion t).card
      simpa [t] using hC
    · change 2 ≤ (({0,2} : Finset (Fin 3)).biUnion t).card
      simpa [t] using hAC
    · change 2 ≤ (({1,2} : Finset (Fin 3)).biUnion t).card
      simpa [t] using hBC
    · change 3 ≤ (({0,1,2} : Finset (Fin 3)).biUnion t).card
      simpa [t,union_assoc] using hABC
  obtain ⟨f,hinj,hf⟩ := (all_card_le_biUnion_card_iff_existsInjective' t).mp hh
  refine ⟨f 0,by simpa [t] using hf 0,f 1,by simpa [t] using hf 1,
    f 2,by simpa [t] using hf 2,?_,?_,?_⟩
  · exact fun he => (by decide : (0 : Fin 3) ≠ 1) (hinj he)
  · exact fun he => (by decide : (0 : Fin 3) ≠ 2) (hinj he)
  · exact fun he => (by decide : (1 : Fin 3) ≠ 2) (hinj he)


/-- All possible external apices for a specified base of the restored triangle. -/
noncomputable def essentialApices (G : SimpleGraph V) (U e : Finset V) : Finset V := by
  classical
  exact univ.filter (fun p => p ∉ U ∧ ∀ u ∈ e, G.Adj u p)

@[simp] theorem essential_mem_apices {G : SimpleGraph V} {U e : Finset V} {p : V} :
    p ∈ essentialApices G U e ↔ p ∉ U ∧ ∀ u ∈ e, G.Adj u p := by
  classical
  simp [essentialApices]

/-- The individual new family consists of its base triangle and ordinary pages. -/
theorem essential_new_page_decomposition {G : SimpleGraph V} {U t : Finset V}
    (hU : G.IsNClique 3 U)
    (ht : t ∈ triangles G \ triangles (deleteTriangle G U)) :
    t = U ∨ ∃ e ∈ edges U, ∃ p ∈ essentialApices G U e, t = insert p e := by
  obtain ⟨e,heU,het⟩ := new_triangle_removed_edge (mem_sdiff.mp ht).1 (mem_sdiff.mp ht).2
  obtain ⟨p,hpe,htp⟩ := third_vertex (triangles_valid G t (mem_sdiff.mp ht).1) het
  by_cases hpU : p ∈ U
  · left
    apply eq_of_subset_of_card_le
    · rw [htp]
      exact insert_subset hpU (mem_edges.mp heU).1
    · rw [(triangles_valid G t (mem_sdiff.mp ht).1),hU.card_eq]
  · right
    refine ⟨e,heU,p,essential_mem_apices.mpr ⟨hpU,?_⟩,htp⟩
    intro u hu
    have hut := (mem_edges.mp het).1 hu
    have hpt : p ∈ t := by rw [htp]; simp
    have hup : u ≠ p := by intro he; exact hpe (he ▸ hu)
    exact (mem_triangles.mp (mem_sdiff.mp ht).1).isClique hut hpt hup

/-- Every actual external page belongs to the full individual new family. -/
theorem essential_page_mem {G : SimpleGraph V} {U e : Finset V} {p : V}
    (hU : G.IsNClique 3 U) (he : e ∈ edges U)
    (hp : p ∈ essentialApices G U e) :
    insert p e ∈ triangles G \ triangles (deleteTriangle G U) := by
  have heU := (mem_edges.mp he).1
  have hpU := (essential_mem_apices.mp hp).1
  have hpe : p ∉ e := fun h => hpU (heU h)
  have ht : insert p e ∈ triangles G := by
    apply mem_triangles.mpr
    refine ⟨?_,by simp [hpe,(mem_edges.mp he).2]⟩
    intro a ha b hb hab
    change a ∈ insert p e at ha
    change b ∈ insert p e at hb
    rcases mem_insert.mp ha with hap | ha
    · subst a
      rcases mem_insert.mp hb with hbp | hb
      · exact (hab hbp.symm).elim
      · exact ((essential_mem_apices.mp hp).2 b hb).symm
    · rcases mem_insert.mp hb with hbp | hb
      · subst b
        exact (essential_mem_apices.mp hp).2 a ha
      · exact hU.isClique (heU ha) (heU hb) hab
  refine mem_sdiff.mpr ⟨ht,?_⟩
  intro hdel
  exact disjoint_left.mp (deleted_edges_disjoint hdel)
    (mem_edges.mpr ⟨subset_insert p e,(mem_edges.mp he).2⟩) he

/-- Different bases and different external apices give edge-disjoint pages. -/
theorem essential_distinct_pages_disjoint {U e f : Finset V} {p q : V}
    (he : e ∈ edges U) (hf : f ∈ edges U) (hef : e ≠ f)
    (hp : p ∉ U) (hq : q ∉ U) (hpq : p ≠ q) :
    Disjoint (edges (insert p e)) (edges (insert q f)) := by
  apply disjoint_left.mpr
  intro d hde hdf
  have hsube : d ⊆ e := by
    intro x hx
    rcases mem_insert.mp ((mem_edges.mp hde).1 hx) with rfl | he'
    · rcases mem_insert.mp ((mem_edges.mp hdf).1 hx) with heq | hf'
      · exact (hpq heq).elim
      · exact (hp ((mem_edges.mp hf).1 hf')).elim
    · exact he'
  have hsubf : d ⊆ f := by
    intro x hx
    rcases mem_insert.mp ((mem_edges.mp hdf).1 hx) with rfl | hf'
    · rcases mem_insert.mp ((mem_edges.mp hde).1 hx) with heq | he'
      · exact (hpq heq.symm).elim
      · exact (hq ((mem_edges.mp he).1 he')).elim
    · exact hf'
  have hdeq : d = e := eq_of_subset_of_card_le hsube (by rw [(mem_edges.mp hde).2,(mem_edges.mp he).2])
  have hdfq : d = f := eq_of_subset_of_card_le hsubf (by rw [(mem_edges.mp hdf).2,(mem_edges.mp hf).2])
  exact hef (hdeq.symm.trans hdfq)

/-- An injective representative choice for all three bases is a three-page packing. -/
theorem essential_injective_apices_packing {G : SimpleGraph V} {U : Finset V}
    (hU : G.IsNClique 3 U)
    (f : {e // e ∈ edges U} → V) (hinj : Function.Injective f)
    (hf : ∀ e, f e ∈ essentialApices G U e.1) :
    3 ≤ nu (triangles G \ triangles (deleteTriangle G U)) := by
  classical
  let Q : Finset (Finset V) := univ.image (fun e : {e // e ∈ edges U} => insert (f e) e.1)
  have hinjQ : Function.Injective (fun e : {e // e ∈ edges U} => insert (f e) e.1) := by
    intro e g heq
    dsimp only at heq
    have hfem : f e ∈ insert (f g) g.1 := by rw [← heq]; simp
    rcases mem_insert.mp hfem with hefg | hfg
    · exact hinj hefg
    · exact ((essential_mem_apices.mp (hf e)).1 ((mem_edges.mp g.2).1 hfg)).elim
  have hcard : Q.card = 3 := by
    dsimp only [Q]
    rw [card_image_of_injective _ hinjQ,card_univ,Fintype.card_coe]
    simp [edges,hU.card_eq]
  have hp : Packing (triangles G \ triangles (deleteTriangle G U)) Q := by
    constructor
    · intro t ht
      obtain ⟨e,he,rfl⟩ := mem_image.mp ht
      exact essential_page_mem hU e.2 (hf e)
    · intro s hs t ht hst
      obtain ⟨e,he,rfl⟩ := mem_image.mp hs
      obtain ⟨g,hg,rfl⟩ := mem_image.mp ht
      have heg : e ≠ g := by intro h; subst g; exact hst rfl
      have hval : e.1 ≠ g.1 := fun h => heg (Subtype.ext h)
      exact essential_distinct_pages_disjoint e.2 g.2 hval
        (essential_mem_apices.mp (hf e)).1 (essential_mem_apices.mp (hf g)).1
        (fun h => heg (hinj h))
  rw [← hcard]
  exact packing_card_le hp


/-- An empty page column permits a cover by the other two restored bases. -/
theorem essential_empty_base_cover {G : SimpleGraph V} {U e : Finset V}
    (hU : G.IsNClique 3 U) (he : e ∈ edges U)
    (hempty : essentialApices G U e = ∅) :
    tau (triangles G \ triangles (deleteTriangle G U)) ≤ 2 := by
  classical
  have hc : ((edges U).erase e).card = 2 := by
    rw [card_erase_of_mem he]
    simp [edges,hU.card_eq]
  have hnon : ((edges U).erase e).Nonempty := card_pos.mp (by omega)
  have hcover : Covers (triangles G \ triangles (deleteTriangle G U)) ((edges U).erase e) := by
    intro t ht
    rcases essential_new_page_decomposition hU ht with rfl | ⟨f,hf,p,hp,rfl⟩
    · obtain ⟨f,hf⟩ := hnon
      exact ⟨f,hf,(mem_erase.mp hf).2⟩
    · have hfe : f ≠ e := by
        intro h
        subst f
        rw [hempty] at hp
        exact notMem_empty p hp
      exact ⟨f,mem_erase.mpr ⟨hfe,hf⟩,
        mem_edges.mpr ⟨subset_insert p f,(mem_edges.mp hf).2⟩⟩
  exact (tau_le_card hcover).trans_eq hc

/-- Two page columns confined to the same apex permit a spoke-and-base cover. -/
theorem essential_same_apex_cover {G : SimpleGraph V} {U e f : Finset V} {p : V}
    (hU : G.IsNClique 3 U) (he : e ∈ edges U) (hf : f ∈ edges U)
    (hef : e ≠ f) (hp : p ∉ U)
    (hAe : essentialApices G U e ⊆ {p}) (hAf : essentialApices G U f ⊆ {p}) :
    tau (triangles G \ triangles (deleteTriangle G U)) ≤ 2 := by
  classical
  have hsize : (edges U).card = 3 := by simp [edges,hU.card_eq]
  have hup := card_le_card (union_subset (mem_edges.mp he).1 (mem_edges.mp hf).1)
  have hefc := card_union_add_card_inter e f
  have hinter : (e ∩ f).Nonempty := card_pos.mp (by
    rw [(mem_edges.mp he).2,(mem_edges.mp hf).2] at hefc
    rw [hU.card_eq] at hup
    omega)
  obtain ⟨u,hu⟩ := hinter
  have hue := (mem_inter.mp hu).1
  have huf := (mem_inter.mp hu).2
  have hpair : ({e,f} : Finset (Finset V)) ⊆ edges U := by simp [insert_subset_iff,he,hf]
  have hrest : (edges U \ {e,f}).card = 1 := by
    rw [card_sdiff_of_subset hpair,hsize]
    simp [hef]
  obtain ⟨g,hg⟩ := card_pos.mp (show 0 < (edges U \ {e,f}).card by omega)
  have hgU := (mem_sdiff.mp hg).1
  have hspcard : ({u,p} : Finset V).card = 2 := by
    have hupne : u ≠ p := fun heq => hp (heq ▸ (mem_edges.mp he).1 hue)
    simp [hupne]
  have hcover : Covers (triangles G \ triangles (deleteTriangle G U)) {g,{u,p}} := by
    intro t ht
    rcases essential_new_page_decomposition hU ht with rfl | ⟨b,hb,r,hr,rfl⟩
    · exact ⟨g,by simp,hgU⟩
    · by_cases hbe : b = e
      · subst b
        have hrp := mem_singleton.mp (hAe hr)
        subst r
        exact ⟨{u,p},by simp,mem_edges.mpr ⟨by simp [insert_subset_iff,hue],hspcard⟩⟩
      · by_cases hbf : b = f
        · subst b
          have hrp := mem_singleton.mp (hAf hr)
          subst r
          exact ⟨{u,p},by simp,mem_edges.mpr ⟨by simp [insert_subset_iff,huf],hspcard⟩⟩
        · have hbrest : b ∈ edges U \ {e,f} := mem_sdiff.mpr ⟨hb,by simp [hbe,hbf]⟩
          have hbg : b = g := card_le_one.mp (show (edges U \ {e,f}).card ≤ 1 by omega) b hbrest g hg
          exact ⟨g,by simp,hbg ▸ mem_edges.mpr ⟨subset_insert r b,(mem_edges.mp hb).2⟩⟩
  exact (tau_le_card hcover).trans ((card_insert_le _ _).trans (by simp))

/-- Cover number three forces every page column to be nonempty. -/
theorem essential_apices_nonempty {G : SimpleGraph V} {U e : Finset V}
    (hU : G.IsNClique 3 U)
    (hcover : tau (triangles G \ triangles (deleteTriangle G U)) = 3)
    (he : e ∈ edges U) : (essentialApices G U e).Nonempty := by
  by_contra hn
  have hc := essential_empty_base_cover hU he (not_nonempty_iff_eq_empty.mp hn)
  omega

/-- Cover number three gives the two-column Hall condition. -/
theorem essential_apices_pair_large {G : SimpleGraph V} {U e f : Finset V}
    (hU : G.IsNClique 3 U)
    (hcover : tau (triangles G \ triangles (deleteTriangle G U)) = 3)
    (he : e ∈ edges U) (hf : f ∈ edges U) (hef : e ≠ f) :
    2 ≤ (essentialApices G U e ∪ essentialApices G U f).card := by
  classical
  by_contra hn
  obtain ⟨p,hpe⟩ := essential_apices_nonempty hU hcover he
  have hsmall : (essentialApices G U e ∪ essentialApices G U f).card ≤ 1 := by omega
  have hpin : p ∈ essentialApices G U e ∪ essentialApices G U f := mem_union_left _ hpe
  have hAe : essentialApices G U e ⊆ {p} := by
    intro r hr
    exact mem_singleton.mpr (card_le_one.mp hsmall r (mem_union_left _ hr) p hpin)
  have hAf : essentialApices G U f ⊆ {p} := by
    intro r hr
    exact mem_singleton.mpr (card_le_one.mp hsmall r (mem_union_right _ hr) p hpin)
  have hc := essential_same_apex_cover hU he hf hef (essential_mem_apices.mp hpe).1 hAe hAf
  omega


/-- Hall's theorem forces at most two apices across all three page columns. -/
theorem essential_apices_union_small {G : SimpleGraph V} {U : Finset V}
    (hU : G.IsNClique 3 U)
    (hcover : tau (triangles G \ triangles (deleteTriangle G U)) = 3)
    (hpack : nu (triangles G \ triangles (deleteTriangle G U)) ≤ 2) :
    ((edges U).biUnion (essentialApices G U)).card ≤ 2 := by
  classical
  let I := {e // e ∈ edges U}
  let A : I → Finset V := fun e => essentialApices G U e.1
  have hIcard : Fintype.card I = 3 := by
    dsimp only [I]
    rw [Fintype.card_coe]
    simp [edges,hU.card_eq]
  have htotal : univ.biUnion A = (edges U).biUnion (essentialApices G U) := by
    ext p
    simp only [mem_biUnion,mem_univ,true_and]
    constructor
    · rintro ⟨e,hp⟩
      exact ⟨e.1,e.2,hp⟩
    · rintro ⟨e,he,hp⟩
      exact ⟨⟨e,he⟩,hp⟩
  by_contra hn
  have hlarge : 3 ≤ (univ.biUnion A).card := by rw [htotal]; omega
  have hhall : ∀ s : Finset I, s.card ≤ (s.biUnion A).card := by
    intro s
    have hbound : s.card ≤ 3 := by
      have hh := card_le_card (subset_univ s)
      rw [card_univ,hIcard] at hh
      exact hh
    by_cases hz : s.card = 0
    · omega
    by_cases h1 : s.card = 1
    · obtain ⟨e,he⟩ := card_eq_one.mp h1
      rw [he]
      simpa [A] using card_pos.mpr (essential_apices_nonempty hU hcover e.2)
    by_cases h2 : s.card = 2
    · obtain ⟨e,f,hef,heq⟩ := card_eq_two.mp h2
      rw [heq]
      have hvals : e.1 ≠ f.1 := fun h => hef (Subtype.ext h)
      simpa [A,hef] using essential_apices_pair_large hU hcover e.2 f.2 hvals
    have h3 : s.card = 3 := by omega
    have hs : s = univ := eq_of_subset_of_card_le (subset_univ s) (by rw [card_univ,hIcard,h3])
    rw [hs,card_univ,hIcard]
    exact hlarge
  obtain ⟨f,hinj,hf⟩ := (all_card_le_biUnion_card_iff_existsInjective' A).mp hhall
  have hp := essential_injective_apices_packing hU f hinj hf
  omega


/-- The union of all page columns has at least two apices when three cover edges are needed. -/
theorem essential_apices_union_large {G : SimpleGraph V} {U : Finset V}
    (hU : G.IsNClique 3 U)
    (hcover : tau (triangles G \ triangles (deleteTriangle G U)) = 3) :
    2 ≤ ((edges U).biUnion (essentialApices G U)).card := by
  classical
  obtain ⟨e,he⟩ := edges_nonempty (s := U) (by rw [hU.card_eq]; decide)
  have hrest : ((edges U).erase e).card = 2 := by
    rw [card_erase_of_mem he]
    simp [edges,hU.card_eq]
  obtain ⟨f,hf⟩ := card_pos.mp (show 0 < ((edges U).erase e).card by omega)
  have hfe := (mem_erase.mp hf).1
  have hfU := (mem_erase.mp hf).2
  have hp := essential_apices_pair_large hU hcover he hfU hfe.symm
  apply hp.trans (card_le_card ?_)
  intro r hr
  rcases mem_union.mp hr with hr | hr
  · exact mem_biUnion.mpr ⟨e,he,hr⟩
  · exact mem_biUnion.mpr ⟨f,hfU,hr⟩

/-- Two possible apices and cover number three force each apex to see every terminal. -/
theorem essential_apex_universal {G : SimpleGraph V} {U : Finset V} {p q : V}
    (hU : G.IsNClique 3 U)
    (hcover : tau (triangles G \ triangles (deleteTriangle G U)) = 3)
    (hall : (edges U).biUnion (essentialApices G U) ⊆ {p,q}) :
    ∀ u ∈ U, G.Adj u p := by
  classical
  intro u hu
  by_contra hnot
  have hrem : (U.erase u).card = 2 := by rw [card_erase_of_mem hu,hU.card_eq]
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp hrem
  have ha : a ∈ U.erase u := by rw [heq]; simp
  have hb : b ∈ U.erase u := by rw [heq]; simp
  have hau := (mem_erase.mp ha).1
  have hbu := (mem_erase.mp hb).1
  have hae : ({u,a} : Finset V) ∈ edges U := mem_edges.mpr
    ⟨by simp [insert_subset_iff,hu,(mem_erase.mp ha).2],by simp [hau.symm]⟩
  have hbe : ({u,b} : Finset V) ∈ edges U := mem_edges.mpr
    ⟨by simp [insert_subset_iff,hu,(mem_erase.mp hb).2],by simp [hbu.symm]⟩
  have hne : ({u,a} : Finset V) ≠ {u,b} := by
    intro he
    have haa : a ∈ ({u,b} : Finset V) := by rw [← he]; simp
    simp only [mem_insert,mem_singleton] at haa
    exact haa.elim hau hab
  have hcol : ∀ e ∈ edges U, u ∈ e → essentialApices G U e ⊆ {q} := by
    intro e he hue r hr
    have hrall := hall (mem_biUnion.mpr ⟨e,he,hr⟩)
    simp only [mem_insert,mem_singleton] at hrall
    rcases hrall with hrp | hrq
    · subst r
      exact (hnot ((essential_mem_apices.mp hr).2 u hue)).elim
    · exact mem_singleton.mpr hrq
  have hsmall : (essentialApices G U {u,a} ∪ essentialApices G U {u,b}).card ≤ 1 := by
    have hh := card_le_card (union_subset (hcol {u,a} hae (by simp)) (hcol {u,b} hbe (by simp)))
    simpa using hh
  have hlarge := essential_apices_pair_large hU hcover hae hbe hne
  omega

/-- Exact two-apex classification of the full individual restoration family.
The full family, not a chosen subfamily, determines both extremal hypotheses. -/
theorem essential_two_apex_classification (G : SimpleGraph V) (U : Finset V)
    (hU : G.IsNClique 3 U)
    (hcover : tau (triangles G \ triangles (deleteTriangle G U)) = 3)
    (hpack : nu (triangles G \ triangles (deleteTriangle G U)) ≤ 2) :
    ∃ p q : V, p ≠ q ∧ p ∉ U ∧ q ∉ U ∧
      (∀ u ∈ U, G.Adj u p ∧ G.Adj u q) ∧
      (∀ e ∈ edges U, ∀ r, r ∉ U → (∀ u ∈ e, G.Adj u r) → r = p ∨ r = q) := by
  classical
  have hsmall := essential_apices_union_small hU hcover hpack
  have hlarge := essential_apices_union_large hU hcover
  have htwo : ((edges U).biUnion (essentialApices G U)).card = 2 := by omega
  obtain ⟨p,q,hpq,hunion⟩ := card_eq_two.mp htwo
  have hp : p ∈ (edges U).biUnion (essentialApices G U) := by rw [hunion]; simp
  have hq : q ∈ (edges U).biUnion (essentialApices G U) := by rw [hunion]; simp
  have hpout : p ∉ U := by
    obtain ⟨e,he,hpe⟩ := mem_biUnion.mp hp
    exact (essential_mem_apices.mp hpe).1
  have hqout : q ∉ U := by
    obtain ⟨e,he,hqe⟩ := mem_biUnion.mp hq
    exact (essential_mem_apices.mp hqe).1
  have hpall : ∀ u ∈ U, G.Adj u p := essential_apex_universal hU hcover (by rw [hunion])
  have hqall : ∀ u ∈ U, G.Adj u q := essential_apex_universal hU hcover (by rw [hunion,pair_comm])
  refine ⟨p,q,hpq,hpout,hqout,fun u hu => ⟨hpall u hu,hqall u hu⟩,?_⟩
  intro e he r hr hadj
  have hrmem : r ∈ (edges U).biUnion (essentialApices G U) :=
    mem_biUnion.mpr ⟨e,he,essential_mem_apices.mpr ⟨hr,hadj⟩⟩
  rw [hunion] at hrmem
  simpa using hrmem

#print axioms essential_two_apex_classification
end Tuza
