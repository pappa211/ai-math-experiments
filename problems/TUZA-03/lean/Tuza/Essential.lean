import Tuza.Boundary
import Tuza.Equality
import Mathlib.Algebra.Order.BigOperators.Group.Finset

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
set_option maxHeartbeats 200000
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A cover after deleting edges can be augmented by all the deleted edges. -/
theorem essential_cover_deletion (G : SimpleGraph V) (A : Finset (Finset V)) :
    tau (triangles G) ≤ tau (triangles (deleteEdges G A)) + A.card := by
  classical
  obtain ⟨C,hC,hcard⟩ := exists_min_cover (triangles_valid (deleteEdges G A))
  have hc : Covers (triangles G) (C ∪ A) := by
    intro t ht
    by_cases hk : t ∈ triangles (deleteEdges G A)
    · obtain ⟨e,he,het⟩ := hC t hk
      exact ⟨e,mem_union_left _ he,het⟩
    · obtain ⟨e,he,het⟩ := lost_has_deleted_edge ht hk
      exact ⟨e,mem_union_right _ he,het⟩
  exact (tau_le_card hc).trans ((card_union_le _ _).trans_eq (by rw [hcard]))

/-- Essential deletion from a slack-one tripartite graph leaves exact equality. -/
theorem essential_deletion_equality
    (aharoni : AharoniInput (V := V)) (H : SimpleGraph V) (e : Finset V)
    (htrip : TriangleTripartite H)
    (hslack : tau (triangles H) + 1 = 2 * nu (triangles H))
    (hessential : nu (triangles (deleteEdges H {e})) + 1 = nu (triangles H)) :
    tau (triangles (deleteEdges H {e})) = 2 * nu (triangles (deleteEdges H {e})) := by
  have hlo := essential_cover_deletion H {e}
  simp only [card_singleton] at hlo
  have hhi := aharoni (deleteEdges H {e}) (tripartite_mono (deleteEdges_le H {e}) htrip)
  omega

/-- Every triangle in a four-set contains one of a prescribed opposite pair. -/
theorem essential_opposite_cover {k e t : Finset V}
    (hk : k.card = 4) (he : e ∈ edges k) (ht : t ⊆ k) (hT : t.card = 3) :
    e ∈ edges t ∨ k \ e ∈ edges t := by
  have hek := (mem_edges.mp he).1
  have he2 := (mem_edges.mp he).2
  have hf2 : (k \ e).card = 2 := by rw [card_sdiff_of_subset hek,hk,he2]
  by_cases het : e ⊆ t
  · exact Or.inl (mem_edges.mpr ⟨het,he2⟩)
  · right
    have hmiss : (e \ t).Nonempty := sdiff_nonempty.mpr het
    have hsmall : (k \ t).card = 1 := by rw [card_sdiff_of_subset ht,hk,hT]
    obtain ⟨v,hv⟩ := hmiss
    have hvkt : v ∈ k \ t := mem_sdiff.mpr ⟨hek (mem_sdiff.mp hv).1,(mem_sdiff.mp hv).2⟩
    have hsingle : k \ t = {v} := by
      apply eq_singleton_iff_unique_mem.mpr
      exact ⟨hvkt, fun x hx => card_le_one.mp (show (k \ t).card ≤ 1 by omega) x hx v hvkt⟩
    refine mem_edges.mpr ⟨?_,hf2⟩
    intro x hx
    by_contra hxt
    have hxkt : x ∈ k \ t := mem_sdiff.mpr ⟨(mem_sdiff.mp hx).1,hxt⟩
    rw [hsingle] at hxkt
    have hxv := mem_singleton.mp hxkt
    exact (mem_sdiff.mp hx).2 (hxv ▸ (mem_sdiff.mp hv).1)


/-- A lost triangle after a singleton-edge deletion is a page over that edge. -/
theorem essential_lost_page {H : SimpleGraph V} {x y : V} {t : Finset V}
    (ht : t ∈ triangles H)
    (hl : t ∉ triangles (deleteEdges H {{x,y}})) :
    ∃ w, w ∉ ({x,y} : Finset V) ∧ t = insert w {x,y} := by
  obtain ⟨e,he,het⟩ := lost_has_deleted_edge ht hl
  have heq := mem_singleton.mp he
  subst e
  exact third_vertex (mem_triangles.mp ht).card_eq het

/-- A clique in the edge-deleted graph cannot contain both deleted endpoints. -/
theorem essential_not_both_endpoints {H : SimpleGraph V} {x y : V} {k : Finset V}
    (hxy : x ≠ y) (hk : (deleteEdges H {{x,y}}).IsNClique 4 k) :
    ¬ (x ∈ k ∧ y ∈ k) := by
  intro h
  exact (hk.isClique h.1 h.2 hxy).2 (mem_singleton_self _)

/-- When a page meets a block excluding one endpoint, the shared edge is forced. -/
theorem essential_spoke_identity {x y w : V} {k t f : Finset V}
    (hw : w ∉ ({x,y} : Finset V)) (ht : t = insert w {x,y})
    (hy : y ∉ k) (hft : f ∈ edges t) (hfk : f ∈ edges k) :
    f = {x,w} := by
  have hxw : x ≠ w := by intro he; apply hw; simp [← he]
  have hsub : f ⊆ ({x,w} : Finset V) := by
    intro a ha
    have hat := (mem_edges.mp hft).1 ha
    rw [ht] at hat
    simp only [mem_insert,mem_singleton] at hat ⊢
    rcases hat with rfl | rfl | rfl
    · exact Or.inr rfl
    · exact Or.inl rfl
    · exact (hy ((mem_edges.mp hfk).1 ha)).elim
  exact eq_of_subset_of_card_le hsub (by simp [hxw,(mem_edges.mp hft).2])

/-- Equality blocks sharing a graph edge are the same block. -/
theorem essential_block_same {K : Finset (Finset V)} (hi : Independent K)
    {k l e : Finset V} (hk : k ∈ K) (hl : l ∈ K)
    (hek : e ∈ edges k) (hel : e ∈ edges l) : k = l := by
  by_contra hne
  exact disjoint_left.mp (hi k hk l hl hne) hek hel

/-- A fixed equality block excluding y cannot touch spokes of two distinct xy-pages. -/
theorem essential_same_page_at_endpoint {H : SimpleGraph V} {x y : V}
    (hxy : x ≠ y) {K : Finset (Finset V)}
    (hK : ∀ k ∈ K, (deleteEdges H {{x,y}}).IsNClique 4 k)
    (hi : Independent K)
    (hexhaust : ∀ t ∈ triangles (deleteEdges H {{x,y}}), ∃ k ∈ K, t ⊆ k)
    {k : Finset V} (hk : k ∈ K) (hy : y ∉ k)
    {w z : V} (hw : w ∉ ({x,y} : Finset V)) (hz : z ∉ ({x,y} : Finset V))
    (hwk : w ∈ k) (hzk : z ∈ k)
    (hyw : H.Adj y w) (hyz : H.Adj y z) : w = z := by
  by_contra hwz
  have hwx : w ≠ x := by intro he; apply hw; simp [he]
  have hwy : w ≠ y := by intro he; apply hw; simp [he]
  have hzx : z ≠ x := by intro he; apply hz; simp [he]
  have hzy : z ≠ y := by intro he; apply hz; simp [he]
  have hYW : (deleteEdges H {{x,y}}).Adj y w := by
    refine ⟨hyw,?_⟩
    simp only [mem_singleton]
    intro he
    have hxx : x ∈ ({y,w} : Finset V) := by rw [he]; simp
    simp only [mem_insert,mem_singleton] at hxx
    exact hxx.elim hxy (fun hx => hwx hx.symm)
  have hYZ : (deleteEdges H {{x,y}}).Adj y z := by
    refine ⟨hyz,?_⟩
    simp only [mem_singleton]
    intro he
    have hxx : x ∈ ({y,z} : Finset V) := by rw [he]; simp
    simp only [mem_insert,mem_singleton] at hxx
    exact hxx.elim hxy (fun hx => hzx hx.symm)
  have hWZ := (hK k hk).isClique hwk hzk hwz
  have htri : ({y,w,z} : Finset V) ∈ triangles (deleteEdges H {{x,y}}) := by
    apply mem_triangles.mpr
    refine ⟨?_,by simp [hwy.symm,hzy.symm,hwz]⟩
    intro a ha b hb hab
    change a ∈ ({y,w,z} : Finset V) at ha
    change b ∈ ({y,w,z} : Finset V) at hb
    simp only [mem_insert,mem_singleton] at ha hb
    rcases ha with rfl | rfl | rfl <;> rcases hb with rfl | rfl | rfl
    · exact (hab rfl).elim
    · exact hYW
    · exact hYZ
    · exact hYW.symm
    · exact (hab rfl).elim
    · exact hWZ
    · exact hYZ.symm
    · exact hWZ.symm
    · exact (hab rfl).elim
  obtain ⟨l,hl,hsub⟩ := hexhaust _ htri
  have hkl : k = l := essential_block_same hi hk hl
    (e := {w,z}) (mem_edges.mpr ⟨by intro a ha; rcases mem_insert.mp ha with rfl | ha; exact hwk; exact (mem_singleton.mp ha) ▸ hzk,by simp [hwz]⟩)
    (mem_edges.mpr ⟨by intro a ha; exact hsub (by simpa using Or.inr ha),by simp [hwz]⟩)
  apply hy
  rw [hkl]
  exact hsub (by simp)


/-- Oriented form of the one-touched-spoke property. -/
theorem essential_block_touch_unique_oriented {H : SimpleGraph V} {x y : V}
    (hxy : x ≠ y) {K : Finset (Finset V)}
    (hK : ∀ k ∈ K, (deleteEdges H {{x,y}}).IsNClique 4 k)
    (hi : Independent K)
    (hexhaust : ∀ t ∈ triangles (deleteEdges H {{x,y}}), ∃ k ∈ K, t ⊆ k)
    {k : Finset V} (hk : k ∈ K) (hy : y ∉ k)
    {f g : Finset V}
    (hf : f ∈ support (triangles H \ triangles (deleteEdges H {{x,y}})))
    (hg : g ∈ support (triangles H \ triangles (deleteEdges H {{x,y}})))
    (hfk : f ∈ edges k) (hgk : g ∈ edges k) : f = g := by
  obtain ⟨t,ht,hft⟩ := mem_biUnion.mp hf
  obtain ⟨s,hs,hgs⟩ := mem_biUnion.mp hg
  obtain ⟨w,hw,htw⟩ := essential_lost_page (mem_sdiff.mp ht).1 (mem_sdiff.mp ht).2
  obtain ⟨z,hz,hsz⟩ := essential_lost_page (mem_sdiff.mp hs).1 (mem_sdiff.mp hs).2
  have hfeq := essential_spoke_identity hw htw hy hft hfk
  have hgeq := essential_spoke_identity hz hsz hy hgs hgk
  have hwk : w ∈ k := (mem_edges.mp hfk).1 (by rw [hfeq]; simp)
  have hzk : z ∈ k := (mem_edges.mp hgk).1 (by rw [hgeq]; simp)
  have hwy : w ≠ y := by intro he; apply hw; simp [he]
  have hzy : z ≠ y := by intro he; apply hz; simp [he]
  have hyw : H.Adj y w := (mem_triangles.mp (mem_sdiff.mp ht).1).isClique
    (by rw [htw]; simp) (by rw [htw]; simp) hwy.symm
  have hyz : H.Adj y z := (mem_triangles.mp (mem_sdiff.mp hs).1).isClique
    (by rw [hsz]; simp) (by rw [hsz]; simp) hzy.symm
  have hwz := essential_same_page_at_endpoint hxy hK hi hexhaust hk hy hw hz hwk hzk hyw hyz
  rw [hfeq,hgeq,hwz]

/-- Each equality K4 meets the supports of all restored-edge pages in at most one edge. -/
theorem essential_block_touch_unique {H : SimpleGraph V} {x y : V}
    (hxy : x ≠ y) {K : Finset (Finset V)}
    (hK : ∀ k ∈ K, (deleteEdges H {{x,y}}).IsNClique 4 k)
    (hi : Independent K)
    (hexhaust : ∀ t ∈ triangles (deleteEdges H {{x,y}}), ∃ k ∈ K, t ⊆ k)
    {k : Finset V} (hk : k ∈ K) {f g : Finset V}
    (hf : f ∈ support (triangles H \ triangles (deleteEdges H {{x,y}})))
    (hg : g ∈ support (triangles H \ triangles (deleteEdges H {{x,y}})))
    (hfk : f ∈ edges k) (hgk : g ∈ edges k) : f = g := by
  by_cases hy : y ∈ k
  · have hx : x ∉ k := fun hx => essential_not_both_endpoints hxy (hK k hk) ⟨hx,hy⟩
    have hK' : ∀ k ∈ K, (deleteEdges H {{y,x}}).IsNClique 4 k := by
      simpa only [pair_comm] using hK
    have hexhaust' : ∀ t ∈ triangles (deleteEdges H {{y,x}}), ∃ k ∈ K, t ⊆ k := by
      simpa only [pair_comm] using hexhaust
    have hf' : f ∈ support (triangles H \ triangles (deleteEdges H {{y,x}})) := by
      simpa only [pair_comm] using hf
    have hg' : g ∈ support (triangles H \ triangles (deleteEdges H {{y,x}})) := by
      simpa only [pair_comm] using hg
    exact essential_block_touch_unique_oriented hxy.symm hK' hi hexhaust' hk hx hf' hg' hfk hgk
  · exact essential_block_touch_unique_oriented hxy hK hi hexhaust hk hy hf hg hfk hgk


/-- An opposite-pair cover can include every page edge touched by a fixed equality block. -/
theorem essential_block_cover {H : SimpleGraph V} {x y : V}
    (hxy : x ≠ y) {K : Finset (Finset V)}
    (hK : ∀ k ∈ K, (deleteEdges H {{x,y}}).IsNClique 4 k)
    (hi : Independent K)
    (hexhaust : ∀ t ∈ triangles (deleteEdges H {{x,y}}), ∃ k ∈ K, t ⊆ k)
    {k : Finset V} (hk : k ∈ K) :
    ∃ C : Finset (Finset V), C.card ≤ 2 ∧
      (∀ t, t ⊆ k → t.card = 3 → ∃ e ∈ C, e ∈ edges t) ∧
      (∀ t ∈ triangles H \ triangles (deleteEdges H {{x,y}}),
        ¬ Disjoint (edges t) (edges k) → ∃ e ∈ C, e ∈ edges t) := by
  classical
  let L := triangles H \ triangles (deleteEdges H {{x,y}})
  have hsel : ∃ f ∈ edges k, ∀ g ∈ support L, g ∈ edges k → g = f := by
    by_cases hn : ∃ f ∈ edges k, f ∈ support L
    · obtain ⟨f,hfk,hf⟩ := hn
      exact ⟨f,hfk,fun g hg hgk => essential_block_touch_unique hxy hK hi hexhaust hk hg hf hgk hfk⟩
    · obtain ⟨f,hfk⟩ := edges_nonempty (s := k) (by rw [(hK k hk).card_eq]; decide)
      exact ⟨f,hfk,fun g hg hgk => (hn ⟨g,hgk,hg⟩).elim⟩
  obtain ⟨f,hfk,hunique⟩ := hsel
  refine ⟨{f,k \ f},(card_insert_le _ _).trans (by simp),?_,?_⟩
  · intro t htk hT
    rcases essential_opposite_cover (hK k hk).card_eq hfk htk hT with h | h
    · exact ⟨f,by simp,h⟩
    · exact ⟨k \ f,by simp,h⟩
  · intro t ht htouch
    obtain ⟨g,hgt,hgk⟩ := not_disjoint_iff.mp htouch
    have hgL : g ∈ support L := mem_biUnion.mpr ⟨t,ht,hgt⟩
    have hgf := hunique g hgL hgk
    exact ⟨f,by simp,hgf ▸ hgt⟩

/-- If every restored-edge page touches equality blocks, those blocks cover H in 2|K| edges. -/
theorem essential_cover_when_all_pages_touch {H : SimpleGraph V} {x y : V}
    (hxy : x ≠ y) {K : Finset (Finset V)}
    (hK : ∀ k ∈ K, (deleteEdges H {{x,y}}).IsNClique 4 k)
    (hi : Independent K)
    (hexhaust : ∀ t ∈ triangles (deleteEdges H {{x,y}}), ∃ k ∈ K, t ⊆ k)
    (htouch : ∀ t ∈ triangles H \ triangles (deleteEdges H {{x,y}}),
      ∃ k ∈ K, ¬ Disjoint (edges t) (edges k)) :
    tau (triangles H) ≤ 2 * K.card := by
  classical
  have hex : ∀ k : Finset V, ∃ C : Finset (Finset V), k ∈ K →
      C.card ≤ 2 ∧
      (∀ t, t ⊆ k → t.card = 3 → ∃ e ∈ C, e ∈ edges t) ∧
      (∀ t ∈ triangles H \ triangles (deleteEdges H {{x,y}}),
        ¬ Disjoint (edges t) (edges k) → ∃ e ∈ C, e ∈ edges t) := by
    intro k
    by_cases hk : k ∈ K
    · obtain ⟨C,hC⟩ := essential_block_cover hxy hK hi hexhaust hk
      exact ⟨C,fun _ => hC⟩
    · exact ⟨∅,fun he => (hk he).elim⟩
  choose c hc using hex
  have hcover : Covers (triangles H) (K.biUnion c) := by
    intro t ht
    by_cases hj : t ∈ triangles (deleteEdges H {{x,y}})
    · obtain ⟨k,hk,htk⟩ := hexhaust t hj
      obtain ⟨e,he,het⟩ := (hc k hk).2.1 t htk (triangles_valid H t ht)
      exact ⟨e,mem_biUnion.mpr ⟨k,hk,he⟩,het⟩
    · have hl := mem_sdiff.mpr ⟨ht,hj⟩
      obtain ⟨k,hk,hkt⟩ := htouch t hl
      obtain ⟨e,he,het⟩ := (hc k hk).2.2 t hl hkt
      exact ⟨e,mem_biUnion.mpr ⟨k,hk,he⟩,het⟩
  have hcard : (K.biUnion c).card ≤ K.card * 2 :=
    card_biUnion_le_card_mul K c 2 (fun k hk => (hc k hk).1)
  exact (tau_le_card hcover).trans (by simpa [Nat.mul_comm] using hcard)

/-- The free-page theorem: the critical essential-edge remainder has an old triangle
whose edges avoid all equality K4 blocks after deletion of the essential edge. -/
theorem essential_free_page
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    (H : SimpleGraph V) (x y : V) (hxy : H.Adj x y)
    (htrip : TriangleTripartite H)
    (hslack : tau (triangles H) + 1 = 2 * nu (triangles H))
    (hessential : nu (triangles (deleteEdges H {{x,y}})) + 1 = nu (triangles H)) :
    ∃ K : Finset (Finset V),
      (∀ k ∈ K, (deleteEdges H {{x,y}}).IsNClique 4 k) ∧ Independent K ∧
      K.card = nu (triangles (deleteEdges H {{x,y}})) ∧
      (∀ t ∈ triangles (deleteEdges H {{x,y}}), ∃ k ∈ K, t ⊆ k) ∧
      ∃ Q ∈ triangles H, ({x,y} : Finset V) ∈ edges Q ∧
        ∀ k ∈ K, Disjoint (edges Q) (edges k) := by
  classical
  let J : SimpleGraph V := deleteEdges H {{x,y}}
  have heq : tau (triangles J) = 2 * nu (triangles J) := by
    exact essential_deletion_equality aharoni H {x,y} htrip hslack hessential
  have hJtrip : TriangleTripartite J := tripartite_mono (deleteEdges_le H {{x,y}}) htrip
  obtain ⟨K,hK,hi,hcard⟩ := hns J hJtrip heq
  have hexhaust := maximum_k4_exhaustion hK hi hcard
  refine ⟨K,hK,hi,hcard,hexhaust,?_⟩
  by_contra hn
  have htouch : ∀ t ∈ triangles H \ triangles (deleteEdges H {{x,y}}),
      ∃ k ∈ K, ¬ Disjoint (edges t) (edges k) := by
    intro t ht
    by_contra hall
    have hdis : ∀ k ∈ K, Disjoint (edges t) (edges k) := by
      intro k hk
      by_contra hd
      exact hall ⟨k,hk,hd⟩
    obtain ⟨e,he,het⟩ := lost_has_deleted_edge (mem_sdiff.mp ht).1 (mem_sdiff.mp ht).2
    have heq := mem_singleton.mp he
    subst e
    exact hn ⟨t,(mem_sdiff.mp ht).1,het,hdis⟩
  have hbound := essential_cover_when_all_pages_touch (SimpleGraph.Adj.ne hxy) hK hi hexhaust htouch
  change K.card = nu (triangles (deleteEdges H {{x,y}})) at hcard
  change tau (triangles H) ≤ 2 * K.card at hbound
  omega

#print axioms essential_free_page
end Tuza
