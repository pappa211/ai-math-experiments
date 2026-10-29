import Tuza.Essential
import Tuza.EssentialPages
import Tuza.EssentialFourPages
import Tuza.BowtieEquality

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A graph clique meets an independent set in at most one vertex. -/
theorem restoration_independent_inter_card {G : SimpleGraph V} {U Q : Finset V}
    (hU : IndependentVertices G U) (hQ : G.IsClique (Q : Set V)) :
    (U ∩ Q).card ≤ 1 := by
  apply card_le_one.mpr
  intro a ha b hb
  by_contra hab
  exact hU a (mem_inter.mp ha).1 b (mem_inter.mp hb).1
    (hQ (mem_inter.mp ha).2 (mem_inter.mp hb).2 hab)

theorem restoration_base_avoiding {H : SimpleGraph V} {U Q : Finset V}
    (hU : IndependentVertices H U) (hcard : U.card = 3)
    (hQ : Q ∈ triangles H) : ∃ e ∈ edges U, Disjoint e Q := by
  have hi := restoration_independent_inter_card hU (mem_triangles.mp hQ).isClique
  have hc := card_sdiff_add_card_inter U Q
  have hge : 2 ≤ (U \ Q).card := by omega
  obtain ⟨e,he,hce⟩ := exists_subset_card_eq hge
  refine ⟨e,mem_edges.mpr ⟨he.trans sdiff_subset,hce⟩,?_⟩
  apply disjoint_left.mpr
  intro x hx hxQ
  exact (mem_sdiff.mp (he hx)).2 hxQ

theorem restoration_other_base {U e : Finset V} (hU : U.card = 3) :
    ∃ f ∈ edges U, f ≠ e := by
  have hc : (edges U).card = 3 := by simp [edges,hU]
  by_contra hn
  have hsub : edges U ⊆ {e} := by
    intro f hf
    have hfe : f = e := by by_contra h; exact hn ⟨f,hf,h⟩
    simp [hfe]
  have hle := card_le_card hsub
  rw [hc,card_singleton] at hle
  omega

theorem restoration_page_avoids_old {H : SimpleGraph V} {U Q e : Finset V} {p : V}
    (hU : IndependentVertices H U) (hQ : Q ∈ triangles H) (he : e ∈ edges U)
    (havoid : p ∉ Q ∨ Disjoint e Q) : Disjoint (edges (insert p e)) (edges Q) := by
  apply disjoint_left.mpr
  intro f hfp hfQ
  rcases havoid with hpQ | heQ
  · have hfU : f ⊆ U := by
      intro x hx
      rcases mem_insert.mp ((mem_edges.mp hfp).1 hx) with rfl | hxe
      · exact (hpQ ((mem_edges.mp hfQ).1 hx)).elim
      · exact (mem_edges.mp he).1 hxe
    obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp (mem_edges.mp hfQ).2
    have ha : a ∈ f := by rw [heq]; simp
    have hb : b ∈ f := by rw [heq]; simp
    exact hU a (hfU ha) b (hfU hb)
      ((mem_triangles.mp hQ).isClique ((mem_edges.mp hfQ).1 ha) ((mem_edges.mp hfQ).1 hb) hab)
  · have hfsub : f ⊆ {p} := by
      intro x hx
      rcases mem_insert.mp ((mem_edges.mp hfp).1 hx) with rfl | hxe
      · simp
      · exact (disjoint_left.mp heQ hxe ((mem_edges.mp hfQ).1 hx)).elim
    have hc := card_le_card hfsub
    rw [(mem_edges.mp hfQ).2,card_singleton] at hc
    omega

/-- Nonadjacent apices allow two compatible new pages avoiding any old triangle. -/
theorem restoration_two_bases_avoid_old {H : SimpleGraph V} {U Q : Finset V} {p q : V}
    (hU : IndependentVertices H U) (hcard : U.card = 3) (hQ : Q ∈ triangles H)
    (hpq : p ≠ q) (hnadj : ¬ H.Adj p q) :
    ∃ e ∈ edges U, ∃ f ∈ edges U, e ≠ f ∧
      Disjoint (edges (insert p e)) (edges Q) ∧
      Disjoint (edges (insert q f)) (edges Q) := by
  by_cases hpQ : p ∈ Q
  · have hqQ : q ∉ Q := by intro hq; exact hnadj ((mem_triangles.mp hQ).isClique hpQ hq hpq)
    obtain ⟨e,he,heQ⟩ := restoration_base_avoiding hU hcard hQ
    obtain ⟨f,hf,hfe⟩ := restoration_other_base (e := e) hcard
    exact ⟨e,he,f,hf,hfe.symm,restoration_page_avoids_old hU hQ he (Or.inr heQ),
      restoration_page_avoids_old hU hQ hf (Or.inl hqQ)⟩
  · obtain ⟨f,hf,hfQ⟩ := restoration_base_avoiding hU hcard hQ
    obtain ⟨e,he,hef⟩ := restoration_other_base (e := f) hcard
    exact ⟨e,he,f,hf,hef,restoration_page_avoids_old hU hQ he (Or.inl hpQ),
      restoration_page_avoids_old hU hQ hf (Or.inr hfQ)⟩

/-- Combine two actual graph packings when every cross pair is edge-disjoint. -/
theorem restoration_packings_sum {G : SimpleGraph V} {P Q : Finset (Finset V)}
    (hp : Packing (triangles G) P) (hq : Packing (triangles G) Q)
    (hc : ∀ p ∈ P, ∀ q ∈ Q, Disjoint (edges p) (edges q)) :
    P.card + Q.card ≤ nu (triangles G) := by
  have hdis := cross_disjoint (triangles_mono hp.1 (triangles_valid G)) hc
  have hh := packing_card_le (packing_union hp hq hc)
  rw [card_union_of_disjoint hdis,union_self] at hh
  exact hh

theorem restoration_three_packing {G : SimpleGraph V} {r s t : Finset V}
    (hr : r ∈ triangles G) (hs : s ∈ triangles G) (ht : t ∈ triangles G)
    (hrs : Disjoint (edges r) (edges s)) (hrt : Disjoint (edges r) (edges t))
    (hst : Disjoint (edges s) (edges t)) :
    Packing (triangles G) {r,s,t} ∧ ({r,s,t} : Finset (Finset V)).card = 3 := by
  have hneq : ∀ x ∈ triangles G, ∀ y ∈ triangles G,
      Disjoint (edges x) (edges y) → x ≠ y := by
    intro x hx y hy hd he
    subst y
    have hem := disjoint_self.mp hd
    exact (edges_nonempty (s := x) (by rw [(mem_triangles.mp hx).card_eq]; decide)).ne_empty hem
  have hrs' := hneq r hr s hs hrs
  have hrt' := hneq r hr t ht hrt
  have hst' := hneq s hs t ht hst
  refine ⟨⟨?_,?_⟩,by simp [hrs',hrt',hst']⟩
  · intro x hx
    simp only [mem_insert,mem_singleton] at hx
    rcases hx with rfl | rfl | rfl <;> assumption
  · intro x hx y hy hxy
    simp only [mem_insert,mem_singleton] at hx hy
    rcases hx with rfl | rfl | rfl <;> rcases hy with rfl | rfl | rfl
    · exact (hxy rfl).elim
    · exact hrs
    · exact hrt
    · exact hrs.symm
    · exact (hxy rfl).elim
    · exact hst
    · exact hrt.symm
    · exact hst.symm
    · exact (hxy rfl).elim

/-- A free old triangle and nonadjacent universal apices force three triangles beyond the equality blocks. -/
theorem restoration_nonadjacent_apex_gain {G : SimpleGraph V} {U : Finset V}
    (hU : G.IsNClique 3 U) {J : SimpleGraph V} (hJ : J ≤ deleteTriangle G U)
    {K : Finset (Finset V)} (hk : ∀ k ∈ K, J.IsNClique 4 k) (hi : Independent K)
    (hmax : K.card = nu (triangles J))
    {Q : Finset V} (hQ : Q ∈ triangles (deleteTriangle G U))
    (hfree : ∀ k ∈ K, Disjoint (edges Q) (edges k))
    {p q : V} (hpq : p ≠ q) (hpU : p ∉ U) (hqU : q ∉ U)
    (hspokes : ∀ u ∈ U, G.Adj u p ∧ G.Adj u q)
    (hnadj : ¬ (deleteTriangle G U).Adj p q) :
    K.card + 3 ≤ nu (triangles G) := by
  classical
  let H := deleteTriangle G U
  have hUH : IndependentVertices H U := delete_independent G U
  have hUJ : IndependentVertices J U := fun a ha b hb hadj => hUH a ha b hb (hJ hadj)
  obtain ⟨P,hP,hcard,havoid⟩ := k4_packing_faces hUJ hk hi
  have hJG : J ≤ G := hJ.trans (delete_le G U)
  have hPG := packing_mono (triangles_mono_graph hJG) hP
  obtain ⟨e,he,f,hf,hef,hpeQ,hqfQ⟩ := restoration_two_bases_avoid_old hUH hU.card_eq hQ hpq hnadj
  have hpA : p ∈ essentialApices G U e := essential_mem_apices.mpr
    ⟨hpU,fun u hu => (hspokes u ((mem_edges.mp he).1 hu)).1⟩
  have hqA : q ∈ essentialApices G U f := essential_mem_apices.mpr
    ⟨hqU,fun u hu => (hspokes u ((mem_edges.mp hf).1 hu)).2⟩
  have hpN := essential_page_mem hU he hpA
  have hqN := essential_page_mem hU hf hqA
  have hpages := essential_distinct_pages_disjoint he hf hef hpU hqU hpq
  have hQG := triangles_mono_graph (delete_le G U) hQ
  obtain ⟨hR,hRcard⟩ := restoration_three_packing (mem_sdiff.mp hpN).1 (mem_sdiff.mp hqN).1 hQG hpages hpeQ hqfQ
  have hcross : ∀ t ∈ P, ∀ r ∈ ({insert p e,insert q f,Q} : Finset (Finset V)),
      Disjoint (edges t) (edges r) := by
    intro t ht r hr
    simp only [mem_insert,mem_singleton] at hr
    rcases hr with rfl | rfl | rfl
    · exact avoid_new_triangle (havoid t ht) (mem_triangles.mp (mem_sdiff.mp hpN).1).card_eq
        (new_triangle_removed_edge (mem_sdiff.mp hpN).1 (mem_sdiff.mp hpN).2)
    · exact avoid_new_triangle (havoid t ht) (mem_triangles.mp (mem_sdiff.mp hqN).1).card_eq
        (new_triangle_removed_edge (mem_sdiff.mp hqN).1 (mem_sdiff.mp hqN).2)
    · obtain ⟨k,hkk,htk⟩ := maximum_k4_exhaustion hk hi hmax t (hP.1 ht)
      apply disjoint_left.mpr
      intro g hgt hgQ
      exact disjoint_left.mp (hfree k hkk) hgQ (edges_mono htk hgt)
  have hh := restoration_packings_sum hPG hR hcross
  rw [hcard,hRcard] at hh
  exact hh

theorem restoration_two_terminals_avoid_edge {H : SimpleGraph V} {U : Finset V}
    (hU : IndependentVertices H U) (hcard : U.card = 3) {x y : V} (hxy : H.Adj x y) :
    ∃ u ∈ U, ∃ v ∈ U, u ≠ v ∧ u ∉ ({x,y} : Finset V) ∧ v ∉ ({x,y} : Finset V) := by
  have hpair : H.IsClique (({x,y} : Finset V) : Set V) := by
    intro a ha b hb hab
    change a ∈ ({x,y} : Finset V) at ha
    change b ∈ ({x,y} : Finset V) at hb
    simp only [mem_insert,mem_singleton] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact (hab rfl).elim
    · exact hxy
    · exact hxy.symm
    · exact (hab rfl).elim
  have hi := restoration_independent_inter_card hU hpair
  have hc := card_sdiff_add_card_inter U {x,y}
  have hge : 2 ≤ (U \ {x,y}).card := by omega
  obtain ⟨s,hs,hsc⟩ := exists_subset_card_eq hge
  obtain ⟨u,v,huv,hseq⟩ := card_eq_two.mp hsc
  have hus : u ∈ s := by rw [hseq]; simp
  have hvs : v ∈ s := by rw [hseq]; simp
  exact ⟨u,(mem_sdiff.mp (hs hus)).1,v,(mem_sdiff.mp (hs hvs)).1,huv,
    (mem_sdiff.mp (hs hus)).2,(mem_sdiff.mp (hs hvs)).2⟩

/-- The adjacent universal-apex pair must be the essential deleted edge. -/
theorem restoration_adjacent_apex_pair {H : SimpleGraph V} {U : Finset V}
    (hU : IndependentVertices H U) (hcard : U.card = 3) {x y : V} (hxy : H.Adj x y)
    {K : Finset (Finset V)} (hk : ∀ k ∈ K, (deleteEdges H {{x,y}}).IsNClique 4 k)
    (hi : Independent K)
    (hexhaust : ∀ t ∈ triangles (deleteEdges H {{x,y}}), ∃ k ∈ K, t ⊆ k)
    {p q : V} (hpq : H.Adj p q) (hpU : p ∉ U) (hqU : q ∉ U)
    (hspokes : ∀ u ∈ U, H.Adj u p ∧ H.Adj u q) :
    ({p,q} : Finset V) = {x,y} := by
  by_contra hne
  obtain ⟨u,hu,v,hv,huv,huout,hvout⟩ := restoration_two_terminals_avoid_edge hU hcard hxy
  have htriangle : ∀ w ∈ U, w ∉ ({x,y} : Finset V) →
      ({p,q,w} : Finset V) ∈ triangles (deleteEdges H {{x,y}}) := by
    intro w hw hwout
    have hwp := (hspokes w hw).1
    have hwq := (hspokes w hw).2
    have hpwn : ({p,w} : Finset V) ∉ ({{x,y}} : Finset (Finset V)) := by
      intro he
      have heq := mem_singleton.mp he
      apply hwout
      rw [← heq]
      simp
    have hqwn : ({q,w} : Finset V) ∉ ({{x,y}} : Finset (Finset V)) := by
      intro he
      have heq := mem_singleton.mp he
      apply hwout
      rw [← heq]
      simp
    apply mem_triangles.mpr
    exact SimpleGraph.is3Clique_triple_iff.mpr
      ⟨⟨hpq,by simpa using hne⟩,⟨hwp.symm,hpwn⟩,⟨hwq.symm,hqwn⟩⟩
  have htu := htriangle u hu huout
  have htv := htriangle v hv hvout
  obtain ⟨k,hkk,huk⟩ := hexhaust _ htu
  obtain ⟨l,hll,hvl⟩ := hexhaust _ htv
  have hpqk : ({p,q} : Finset V) ∈ edges k := edges_mono huk (triple_first_edge hpq.ne)
  have hpql : ({p,q} : Finset V) ∈ edges l := edges_mono hvl (triple_first_edge hpq.ne)
  have hkl : k = l := by
    by_contra hn
    exact disjoint_left.mp (hi k hkk l hll hn) hpqk hpql
  have huk' : u ∈ k := huk (by simp)
  have hvk' : v ∈ k := by rw [hkl]; exact hvl (by simp)
  exact hU u hu v hv ((hk k hkk).isClique huk' hvk' huv).1

/-- An expensive tight restoration over an essential-edge remainder has the essential endpoints as universal apices. -/
theorem restoration_tight_essential_endpoints
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    (G : SimpleGraph V) (U : Finset V) (hU : G.IsNClique 3 U) (x y : V)
    (hxy : (deleteTriangle G U).Adj x y)
    (htrip : TriangleTripartite (deleteTriangle G U))
    (hslack : tau (triangles (deleteTriangle G U)) + 1 = 2 * nu (triangles (deleteTriangle G U)))
    (hessential : nu (triangles (deleteEdges (deleteTriangle G U) {{x,y}})) + 1 =
      nu (triangles (deleteTriangle G U)))
    (hpack : nu (triangles G) ≤ nu (triangles (deleteTriangle G U)) + 1)
    (hcover : tau (triangles G \ triangles (deleteTriangle G U)) = 3) :
    x ∉ U ∧ y ∉ U ∧ ∀ u ∈ U, (deleteTriangle G U).Adj u x ∧ (deleteTriangle G U).Adj u y := by
  classical
  let H := deleteTriangle G U
  let J := deleteEdges H {{x,y}}
  let N := triangles G \ triangles H
  obtain ⟨K,hk,hi,hcard,hexhaust,Q,hQ,hQe,hfree⟩ :=
    essential_free_page aharoni hns H x y hxy htrip hslack hessential
  have hJH : J ≤ H := deleteEdges_le H {{x,y}}
  have hJG : J ≤ G := hJH.trans (delete_le G U)
  have hUJ : IndependentVertices J U := fun a ha b hb hadj =>
    delete_independent G U a ha b hb (hJH hadj)
  obtain ⟨P,hP,hPcard,havoid⟩ := k4_packing_faces hUJ hk hi
  have hcross : ∀ t ∈ P, ∀ r ∈ N, Disjoint (edges t) (edges r) := by
    intro t ht r hr
    exact avoid_new_triangle (havoid t ht) (mem_triangles.mp (mem_sdiff.mp hr).1).card_eq
      (new_triangle_removed_edge (mem_sdiff.mp hr).1 (mem_sdiff.mp hr).2)
  have hl := nu_union_lower (triangles_valid J) hP hcross
  have hm : nu (triangles J ∪ N) ≤ nu (triangles G) := nu_mono
    (union_subset (triangles_mono_graph hJG) sdiff_subset)
  rw [hPcard,hcard] at hl
  change nu (triangles J) + nu N ≤ nu (triangles J ∪ N) at hl
  have hpackN : nu N ≤ 2 := by
    change nu (triangles J) + 1 = nu (triangles H) at hessential
    change nu (triangles G) ≤ nu (triangles H) + 1 at hpack
    omega
  obtain ⟨p,q,hpq,hpU,hqU,hspokes,hfull⟩ :=
    essential_two_apex_classification G U hU hcover hpackN
  have hspokesH : ∀ u ∈ U, H.Adj u p ∧ H.Adj u q := by
    intro u hu
    exact ⟨⟨(hspokes u hu).1,fun hh => hpU hh.2⟩,
      ⟨(hspokes u hu).2,fun hh => hqU hh.2⟩⟩
  have hpqH : H.Adj p q := by
    by_contra hn
    have hg := restoration_nonadjacent_apex_gain hU hJH hk hi hcard hQ hfree hpq hpU hqU hspokes hn
    change K.card = nu (triangles J) at hcard
    change nu (triangles J) + 1 = nu (triangles H) at hessential
    change nu (triangles G) ≤ nu (triangles H) + 1 at hpack
    omega
  have heq := restoration_adjacent_apex_pair (delete_independent G U) hU.card_eq hxy hk hi hexhaust hpqH hpU hqU hspokesH
  have hx : x = p ∨ x = q := by
    have hxmem : x ∈ ({p,q} : Finset V) := by rw [heq]; simp
    simpa using hxmem
  have hy : y = p ∨ y = q := by
    have hymem : y ∈ ({p,q} : Finset V) := by rw [heq]; simp
    simpa using hymem
  refine ⟨?_,?_,?_⟩
  · rcases hx with rfl | rfl <;> assumption
  · rcases hy with rfl | rfl <;> assumption
  · intro u hu
    constructor
    · rcases hx with rfl | rfl
      · exact (hspokesH u hu).1
      · exact (hspokesH u hu).2
    · rcases hy with rfl | rfl
      · exact (hspokesH u hu).1
      · exact (hspokesH u hu).2

/-- Strong critical-case conclusion: an essential edge forces a two-edge individual-family cover. -/
theorem two_triangle_essential_family_saving
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    (G : SimpleGraph V) (U W : Finset V) (hU : G.IsNClique 3 U) (hW : G.IsNClique 3 W)
    (hd : Disjoint (edges U) (edges W)) (x y : V)
    (hxy : (deleteTriangle (deleteTriangle G W) U).Adj x y)
    (htrip : TriangleTripartite (deleteTriangle (deleteTriangle G W) U))
    (hslack : tau (triangles (deleteTriangle (deleteTriangle G W) U)) + 1 =
      2 * nu (triangles (deleteTriangle (deleteTriangle G W) U)))
    (hessential : nu (triangles (deleteEdges (deleteTriangle (deleteTriangle G W) U) {{x,y}})) + 1 =
      nu (triangles (deleteTriangle (deleteTriangle G W) U)))
    (hpack : nu (triangles G) ≤ nu (triangles (deleteTriangle (deleteTriangle G W) U)) + 2) :
    tau (triangles (deleteTriangle G W) \ triangles (deleteTriangle (deleteTriangle G W) U)) ≤ 2 ∨
    tau (triangles (deleteTriangle G U) \ triangles (deleteTriangle (deleteTriangle G W) U)) ≤ 2 := by
  classical
  let H := deleteTriangle (deleteTriangle G W) U
  let J := deleteEdges H {{x,y}}
  let F1 := triangles (deleteTriangle G W) \ triangles H
  let F2 := triangles (deleteTriangle G U) \ triangles H
  have hcomm := deleteTriangle_comm G U W
  have hTU := triangle_survives_delete hU hd
  have hTW := triangle_survives_delete hW hd.symm
  by_contra hn
  have hnot1 : ¬ tau F1 ≤ 2 := fun h => hn (Or.inl h)
  have hnot2 : ¬ tau F2 ≤ 2 := fun h => hn (Or.inr h)
  have h3one : tau F1 = 3 := by
    have hh := restoration_new_cover_three hTU
    change tau F1 ≤ 3 at hh
    omega
  have h3two : tau F2 = 3 := by
    have hh := restoration_new_cover_three hTW
    rw [hcomm] at hh
    change tau F2 ≤ 3 at hh
    omega
  have hgain1 := one_restoration_packing_gain hW
  have hgain2 := one_restoration_packing_gain hU
  have hpack1 : nu (triangles (deleteTriangle G W)) ≤ nu (triangles H) + 1 := by
    change nu (triangles G) ≤ nu (triangles H) + 2 at hpack
    omega
  have hpack2 : nu (triangles (deleteTriangle G U)) ≤ nu (triangles H) + 1 := by
    change nu (triangles G) ≤ nu (triangles H) + 2 at hpack
    omega
  have hep1 := restoration_tight_essential_endpoints aharoni hns (deleteTriangle G W) U hTU x y
    hxy htrip hslack hessential hpack1 h3one
  have hep2 : x ∉ W ∧ y ∉ W ∧ ∀ u ∈ W, H.Adj u x ∧ H.Adj u y := by
    have hxy2 : (deleteTriangle (deleteTriangle G U) W).Adj x y := by rw [hcomm]; exact hxy
    have ht2 : TriangleTripartite (deleteTriangle (deleteTriangle G U) W) := by rw [hcomm]; exact htrip
    have hs2 : tau (triangles (deleteTriangle (deleteTriangle G U) W)) + 1 =
        2 * nu (triangles (deleteTriangle (deleteTriangle G U) W)) := by rw [hcomm]; exact hslack
    have he2 : nu (triangles (deleteEdges (deleteTriangle (deleteTriangle G U) W) {{x,y}})) + 1 =
        nu (triangles (deleteTriangle (deleteTriangle G U) W)) := by rw [hcomm]; exact hessential
    have hp2 : nu (triangles (deleteTriangle G U)) ≤ nu (triangles (deleteTriangle (deleteTriangle G U) W)) + 1 := by
      rw [hcomm]; exact hpack2
    have hc2 : tau (triangles (deleteTriangle G U) \ triangles (deleteTriangle (deleteTriangle G U) W)) = 3 := by
      rw [hcomm]; exact h3two
    have hh := restoration_tight_essential_endpoints aharoni hns (deleteTriangle G U) W hTW x y
      hxy2 ht2 hs2 he2 hp2 hc2
    rw [hcomm] at hh
    exact hh
  have hx : x ∉ U ∪ W := by simpa only [mem_union,not_or] using And.intro hep1.1 hep2.1
  have hy : y ∉ U ∪ W := by simpa only [mem_union,not_or] using And.intro hep1.2.1 hep2.2.1
  have hHG : H ≤ G := (delete_le (deleteTriangle G W) U).trans (delete_le G W)
  have hspokes : ∀ u ∈ U ∪ W, G.Adj u x ∧ G.Adj u y := by
    intro u hu
    rcases mem_union.mp hu with hu | hu
    · exact ⟨hHG (hep1.2.2 u hu).1,hHG (hep1.2.2 u hu).2⟩
    · exact ⟨hHG (hep2.2.2 u hu).1,hHG (hep2.2.2 u hu).2⟩
  obtain ⟨R,hR,hRcard,hRpages⟩ := essential_four_pages G U W hU hW hd x y hxy.ne hx hy hspokes
  obtain ⟨K,hk,hi,hK,hexhaust,Q,hQ,hQe,hfree⟩ :=
    essential_free_page aharoni hns H x y hxy htrip hslack hessential
  have hJH : J ≤ H := deleteEdges_le H {{x,y}}
  have hJG : J ≤ G := hJH.trans hHG
  have hind : IndependentVertices J {x,y} := by
    intro a ha b hb hadj
    simp only [mem_insert,mem_singleton] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact J.irrefl hadj
    · exact hadj.2 (by simp)
    · exact hadj.2 (by simp [pair_comm])
    · exact J.irrefl hadj
  obtain ⟨P,hP,hPcard,havoid⟩ := k4_packing_faces hind hk hi
  have hUJ : IndependentVertices J U := fun a ha b hb hadj =>
    delete_independent (deleteTriangle G W) U a ha b hb (hJH hadj)
  have hWJ : IndependentVertices J W := fun a ha b hb hadj =>
    delete_independent G W a ha b hb ((delete_le (deleteTriangle G W) U) (hJH hadj))
  have hcross : ∀ t ∈ P, ∀ r ∈ R, Disjoint (edges t) (edges r) := by
    intro t ht r hr
    have hpage : ∀ S : Finset V, IndependentVertices J S → ∀ e ∈ edges S, ∀ z ∈ ({x,y} : Finset V),
        Disjoint (edges t) (edges (insert z e)) := by
      intro S hS e he z hz
      have hzout : z ∉ t := fun hzt => disjoint_left.mp (havoid t ht) hzt hz
      exact (restoration_page_avoids_old hS (hP.1 ht) he (Or.inl hzout)).symm
    rcases hRpages r hr with h | h
    · obtain ⟨e,he,heq⟩ := h
      rcases heq with rfl | rfl
      · exact hpage U hUJ e he x (by simp)
      · exact hpage U hUJ e he y (by simp)
    · obtain ⟨e,he,heq⟩ := h
      rcases heq with rfl | rfl
      · exact hpage W hWJ e he x (by simp)
      · exact hpage W hWJ e he y (by simp)
  have hsum := restoration_packings_sum (packing_mono (triangles_mono_graph hJG) hP) hR hcross
  rw [hPcard,hK,hRcard] at hsum
  change nu (triangles J) + 4 ≤ nu (triangles G) at hsum
  change nu (triangles J) + 1 = nu (triangles H) at hessential
  change nu (triangles G) ≤ nu (triangles H) + 2 at hpack
  omega

theorem restoration_cover_by_new (G : SimpleGraph V) (U : Finset V) :
    tau (triangles G) ≤ tau (triangles (deleteTriangle G U)) +
      tau (triangles G \ triangles (deleteTriangle G U)) := by
  have hsub := triangles_mono_graph (delete_le G U)
  have hh := tau_union_le (K := triangles G \ triangles (deleteTriangle G U))
    (triangles_valid (deleteTriangle G U)) (triangles_mono sdiff_subset (triangles_valid G))
  rw [union_sdiff_of_subset hsub] at hh
  exact hh

/-- Full essential-edge restoration, without an additional slack hypothesis.
The entire ordinary TUZA-02 deduction is proved from the frozen published inputs. -/
theorem two_triangle_essential_edge_restoration
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    (G : SimpleGraph V) (U W : Finset V) (hU : G.IsNClique 3 U) (hW : G.IsNClique 3 W)
    (hd : Disjoint (edges U) (edges W)) (x y : V)
    (hxy : (deleteTriangle (deleteTriangle G W) U).Adj x y)
    (htrip : TriangleTripartite (deleteTriangle (deleteTriangle G W) U))
    (hessential : nu (triangles (deleteEdges (deleteTriangle (deleteTriangle G W) U) {{x,y}})) + 1 =
      nu (triangles (deleteTriangle (deleteTriangle G W) U))) :
    tau (triangles G) ≤ 2 * nu (triangles G) := by
  classical
  let H := deleteTriangle (deleteTriangle G W) U
  let J := deleteEdges H {{x,y}}
  have hcomm := deleteTriangle_comm G U W
  have hTU := triangle_survives_delete hU hd
  have hTW := triangle_survives_delete hW hd.symm
  have hgain1 := one_restoration_packing_gain hTU
  have hgain2 := one_restoration_packing_gain hW
  change nu (triangles H) + 1 ≤ nu (triangles (deleteTriangle G W)) at hgain1
  have hcov1 := one_restoration_cover_bound hTU
  have hcov2 := one_restoration_cover_bound hW
  change tau (triangles (deleteTriangle G W)) ≤ tau (triangles H) + 3 at hcov1
  have hdel := essential_cover_deletion H {{x,y}}
  simp only [card_singleton] at hdel
  have hA := aharoni J (tripartite_mono (deleteEdges_le H {{x,y}}) htrip)
  change nu (triangles J) + 1 = nu (triangles H) at hessential
  change tau (triangles H) ≤ tau (triangles J) + 1 at hdel
  have hslackbound : tau (triangles H) + 1 ≤ 2 * nu (triangles H) := by omega
  by_cases hslack2 : tau (triangles H) + 2 ≤ 2 * nu (triangles H)
  · omega
  · have hslack : tau (triangles H) + 1 = 2 * nu (triangles H) := by omega
    by_cases hbig : nu (triangles H) + 3 ≤ nu (triangles G)
    · omega
    · have hsmall : nu (triangles G) ≤ nu (triangles H) + 2 := by omega
      have hsaving := two_triangle_essential_family_saving aharoni hns G U W hU hW hd x y
        hxy htrip hslack hessential hsmall
      rcases hsaving with hs | hs
      · have hnew := restoration_cover_by_new (deleteTriangle G W) U
        change tau (triangles (deleteTriangle G W)) ≤ tau (triangles H) +
          tau (triangles (deleteTriangle G W) \ triangles H) at hnew
        change tau (triangles (deleteTriangle G W) \ triangles H) ≤ 2 at hs
        omega
      · have hnew := restoration_cover_by_new (deleteTriangle G U) W
        rw [hcomm] at hnew
        change tau (triangles (deleteTriangle G U)) ≤ tau (triangles H) +
          tau (triangles (deleteTriangle G U) \ triangles H) at hnew
        change tau (triangles (deleteTriangle G U) \ triangles H) ≤ 2 at hs
        have hcovU := one_restoration_cover_bound hU
        omega

#check two_triangle_essential_edge_restoration
#print axioms restoration_tight_essential_endpoints
#print axioms two_triangle_essential_family_saving
#print axioms two_triangle_essential_edge_restoration
end Tuza
