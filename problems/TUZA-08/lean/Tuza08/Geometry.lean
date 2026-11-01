import Tuza08.Targets

namespace Tuza08
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

namespace Geometry
variable {G : SimpleGraph V} {u v a b : V}
theorem swapUV (h : Geometry G u v a b) : Geometry G v u a b := by
  rcases h with ⟨huv,hua,hub,hva,hvb,hab,hn,hc⟩
  exact ⟨huv.symm,hva,hvb,hua,hub,hab,(fun hvu => hn hvu.symm),
    fun w => by simpa only [and_comm] using hc w⟩
theorem swapAB (h : Geometry G u v a b) : Geometry G u v b a := by
  rcases h with ⟨huv,hua,hub,hva,hvb,hab,hn,hc⟩
  exact ⟨huv,hub,hua,hvb,hva,hab.symm,hn,
    fun w => by simpa only [or_comm] using hc w⟩
theorem uv (h : Geometry G u v a b) : u ≠ v := h.1
theorem ua (h : Geometry G u v a b) : u ≠ a := h.2.1
theorem ub (h : Geometry G u v a b) : u ≠ b := h.2.2.1
theorem va (h : Geometry G u v a b) : v ≠ a := h.2.2.2.1
theorem vb (h : Geometry G u v a b) : v ≠ b := h.2.2.2.2.1
theorem ab (h : Geometry G u v a b) : a ≠ b := h.2.2.2.2.2.1
theorem nonadj (h : Geometry G u v a b) : ¬ G.Adj u v := h.2.2.2.2.2.2.1
theorem common (h : Geometry G u v a b) (w : V) :
    G.Adj u w ∧ G.Adj v w ↔ w = a ∨ w = b := h.2.2.2.2.2.2.2 w
theorem adj_ua (h : Geometry G u v a b) : G.Adj u a := ((h.common a).mpr (Or.inl rfl)).1
theorem adj_va (h : Geometry G u v a b) : G.Adj v a := ((h.common a).mpr (Or.inl rfl)).2
theorem adj_ub (h : Geometry G u v a b) : G.Adj u b := h.swapAB.adj_ua
theorem adj_vb (h : Geometry G u v a b) : G.Adj v b := h.swapAB.adj_va
end Geometry

@[simp] theorem mem_spokes {u v a : V} {e : Edge V} :
    e ∈ spokes u v a ↔ e = {u,a} ∨ e = {v,a} := by simp [spokes]

theorem pair_ne_of_left {u v a : V} (huv : u ≠ v) (hua : u ≠ a) :
    ({u,a} : Edge V) ≠ {v,a} := by
  intro h
  have : u ∈ ({v,a} : Edge V) := h ▸ (by simp : u ∈ ({u,a} : Edge V))
  simp only [mem_insert,mem_singleton] at this
  exact this.elim huv hua

theorem disjoint_spokes {G : SimpleGraph V} {u v a b : V}
    (h : Geometry G u v a b) : Disjoint (spokes u v a) (spokes u v b) := by
  apply disjoint_left.mpr
  intro e he hf
  have ha : a ∈ e := by rcases mem_spokes.mp he with rfl|rfl <;> simp
  rcases mem_spokes.mp hf with rfl|rfl
  · simp only [mem_insert,mem_singleton] at ha
    exact ha.elim h.ua.symm h.ab
  · simp only [mem_insert,mem_singleton] at ha
    exact ha.elim h.va.symm h.ab

theorem spokes_card {G : SimpleGraph V} {u v a b : V} (h : Geometry G u v a b) :
    (spokes u v a).card = 2 := by
  simp [spokes, pair_ne_of_left h.uv h.ua]

theorem pair_actual {G : SimpleGraph V} {p c : V} (h : G.Adj p c) :
    G.IsNClique 2 ({p,c} : Edge V) := by
  refine ⟨?_, by simp [G.ne_of_adj h]⟩
  intro x hx y hy hxy
  simp only [mem_coe,mem_insert,mem_singleton] at hx hy
  rcases hx with rfl|rfl <;> rcases hy with rfl|rfl
  · exact (hxy rfl).elim
  · exact h
  · exact h.symm
  · exact (hxy rfl).elim

theorem spokes_actual {G : SimpleGraph V} {u v a b : V} (h : Geometry G u v a b) :
    ∀ e ∈ spokes u v a, G.IsNClique 2 e := by
  intro e he
  rcases mem_spokes.mp he with rfl|rfl
  · exact pair_actual h.adj_ua
  · exact pair_actual h.adj_va

theorem edge_vertices {T : Edge V} {p c : V} (he : ({p,c} : Edge V) ∈ edges T) :
    p ∈ T ∧ c ∈ T := ⟨(mem_edges.mp he).1 (by simp),(mem_edges.mp he).1 (by simp)⟩

theorem pair_in_edges {T : Edge V} {p c : V} (hp : p ∈ T) (hc : c ∈ T) (hne : p ≠ c) :
    ({p,c} : Edge V) ∈ edges T :=
  mem_edges.mpr ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hp hc,
    by simp [hne]⟩

theorem triangle_through_pair {G : SimpleGraph V} {T : Edge V} {p c : V}
    (ht : T ∈ triangles G) (he : ({p,c} : Edge V) ∈ edges T) :
    ∃ s, s ≠ p ∧ s ≠ c ∧ T = {p,c,s} ∧ G.Adj p s ∧ G.Adj c s := by
  have hcard := (mem_triangles.mp ht).card_eq
  have hc2 := (mem_edges.mp he).2
  obtain ⟨s,hs,hn⟩ := exists_mem_notMem_of_card_lt_card (show ({p,c} : Edge V).card < T.card by omega)
  have hsp : s ≠ p := fun h => hn (by simp [h])
  have hsc : s ≠ c := fun h => hn (by simp [h])
  have hp := (edge_vertices he).1
  have hc := (edge_vertices he).2
  have hpc : p ≠ c := by intro h; simp [h] at hc2
  refine ⟨s,hsp,hsc,?_,(mem_triangles.mp ht).isClique hp hs hsp.symm,
    (mem_triangles.mp ht).isClique hc hs hsc.symm⟩
  apply (eq_of_subset_of_card_le ?_ ?_).symm
  · simp only [insert_subset_iff,singleton_subset_iff]
    exact ⟨hp,hc,hs⟩
  · simp [hpc,hsp.symm,hsc.symm,hcard]

theorem triangle_edges {p c s : V} (hpc : p ≠ c) (hps : p ≠ s) (hcs : c ≠ s) :
    edges ({p,c,s} : Edge V) = {{p,c},{p,s},{c,s}} := by
  ext e
  constructor
  · intro he
    obtain ⟨x,y,hxy,rfl⟩ := card_eq_two.mp (mem_edges.mp he).2
    have hx := (mem_edges.mp he).1 (show x ∈ ({x,y} : Edge V) by simp)
    have hy := (mem_edges.mp he).1 (show y ∈ ({x,y} : Edge V) by simp)
    simp only [mem_insert,mem_singleton] at hx hy
    rcases hx with rfl|rfl|rfl <;> rcases hy with rfl|rfl|rfl <;> simp_all [pair_comm]
  · intro he
    simp only [mem_insert,mem_singleton] at he
    rcases he with rfl|rfl|rfl <;> apply mem_edges.mpr <;> simp [hpc,hps,hcs]

/-- Full supporting triangle and its exclusive third vertex. -/
theorem witness_form {G : SimpleGraph V} {u v a b : V} (h : Geometry G u v a b)
    {e T : Edge V} (hout : e ∉ spokes u v a ∪ spokes u v b)
    (hw : Witness G (spokes u v b) u a e T) :
    ∃ s, s ∉ ({u,v,a,b} : Finset V) ∧ G.Adj u s ∧ ¬ G.Adj v s ∧
      T = {u,a,s} ∧ (e = {u,s} ∨ e = {a,s}) := by
  obtain ⟨ht,he,hs,hd⟩ := hw
  obtain ⟨s,hsu,hsa,hT,hus,_⟩ := triangle_through_pair ht hs
  have hsv : s ≠ v := fun heq => h.nonadj (heq ▸ hus)
  have hsb : s ≠ b := by
    intro heq
    have hbT : b ∈ T := heq ▸ (show s ∈ T by simp [hT])
    exact disjoint_left.mp hd (pair_in_edges (edge_vertices hs).1 hbT h.ub)
      (mem_spokes.mpr (Or.inl rfl))
  have hnvs : ¬ G.Adj v s := by
    intro hvs
    exact ((h.common s).mp ⟨hus,hvs⟩).elim hsa hsb
  refine ⟨s,?_,hus,hnvs,hT,?_⟩
  · simpa only [mem_insert,mem_singleton,not_or] using And.intro hsu ⟨hsv,hsa,hsb⟩
  · rw [hT,triangle_edges h.ua hsu.symm hsa.symm] at he
    simp only [mem_insert,mem_singleton] at he
    rcases he with he|he|he
    · exact (hout (mem_union_left _ (mem_spokes.mpr (Or.inl he)))).elim
    · exact Or.inl he
    · exact Or.inr he

/-- Opposite orientations at the same spoke pair are impossible. -/
theorem witness_not_both {G : SimpleGraph V} {u v a b : V} (h : Geometry G u v a b)
    {e T U : Edge V} (hout : e ∉ spokes u v a ∪ spokes u v b)
    (ht : Witness G (spokes u v b) u a e T)
    (hu : Witness G (spokes u v b) v a e U) : False := by
  obtain ⟨s,hs,hus,hnvs,hT,he⟩ := witness_form h hout ht
  have hout' : e ∉ spokes v u a ∪ spokes v u b := by
    simpa only [spokes,pair_comm] using hout
  have hu' : Witness G (spokes v u b) v a e U := by
    simpa only [spokes,pair_comm] using hu
  obtain ⟨t,_,hvt,_,hU,_⟩ := witness_form h.swapUV hout' hu'
  have hse : s ∈ e := by rcases he with rfl|rfl <;> simp
  have hsU : s ∈ U := (mem_edges.mp hu.2.1).1 hse
  rw [hU] at hsU
  simp only [mem_insert,mem_singleton] at hsU
  have hsn : s ≠ v ∧ s ≠ a := by
    simp only [mem_insert,mem_singleton,not_or] at hs
    exact ⟨hs.2.1,hs.2.2.1⟩
  rcases hsU with hsv|hsa|hst
  · exact hsn.1 hsv
  · exact hsn.2 hsa
  · exact hnvs (hst ▸ hvt)

/-- Two distinct edges in a triangle determine its entire vertex set. -/
theorem triangle_eq_of_two_edges {T U e f : Edge V} (hT : T.card = 3) (hU : U.card = 3)
    (heT : e ∈ edges T) (hfT : f ∈ edges T) (heU : e ∈ edges U) (hfU : f ∈ edges U)
    (hne : e ≠ f) : T = U := by
  have hec := (mem_edges.mp heT).2
  have hfc := (mem_edges.mp hfT).2
  have hs : e ∪ f ⊆ T := union_subset (mem_edges.mp heT).1 (mem_edges.mp hfT).1
  have hsu : e ∪ f ⊆ U := union_subset (mem_edges.mp heU).1 (mem_edges.mp hfU).1
  have hlt : 2 < (e ∪ f).card := by
    by_contra hn
    have heq : e = e ∪ f := eq_of_subset_of_card_le subset_union_left (by omega)
    have hfe : f ⊆ e := heq ▸ (subset_union_right : f ⊆ e ∪ f)
    exact hne (eq_of_subset_of_card_le hfe (by omega)).symm
  have ht := card_le_card hs
  have heqT : e ∪ f = T := eq_of_subset_of_card_le hs (by omega)
  have heqU : e ∪ f = U := eq_of_subset_of_card_le hsu (by omega)
  exact heqT.symm.trans heqU

theorem incidence_unique {G : SimpleGraph V} {u v a b : V} (h : Geometry G u v a b) :
    Data.IncidenceUnique G (spokes u v a) (spokes u v b) := by
  intro e hout T ht U hu heT heU hfT hfU hdT hdU
  obtain ⟨f,hf,hfT⟩ := hfT
  obtain ⟨g,hg,hgU⟩ := hfU
  have hne : ∀ f ∈ spokes u v a, e ≠ f := by
    intro f hf heq
    exact hout (mem_union_left _ (heq ▸ hf))
  rcases mem_spokes.mp hf with rfl|rfl <;> rcases mem_spokes.mp hg with rfl|rfl
  · exact triangle_eq_of_two_edges (triangles_valid G T ht) (triangles_valid G U hu)
      heT hfT heU hgU (hne _ (by simp))
  · exact (witness_not_both h hout ⟨ht,heT,hfT,hdT⟩ ⟨hu,heU,hgU,hdU⟩).elim
  · exact (witness_not_both h hout ⟨hu,heU,hgU,hdU⟩ ⟨ht,heT,hfT,hdT⟩).elim
  · exact triangle_eq_of_two_edges (triangles_valid G T ht) (triangles_valid G U hu)
      heT hfT heU hgU (hne _ (by simp))

/-- The geometric obstruction used to cover arbitrary exterior triangles. -/
theorem opposite_disjoint {G : SimpleGraph V} {u v a b : V} (h : Geometry G u v a b)
    {x y T U : Edge V} (hx : x ∉ spokes u v a ∪ spokes u v b)
    (hy : y ∉ spokes u v a ∪ spokes u v b)
    (hT : Witness G (spokes u v a) v b x T)
    (hU : Witness G (spokes u v b) u a y U) : Disjoint x y := by
  obtain ⟨s,hs,hus,hnvs,hUs,hyform⟩ := witness_form h hy hU
  have hx' : x ∉ spokes v u b ∪ spokes v u a := by
    simpa only [spokes,pair_comm,union_comm] using hx
  have hT' : Witness G (spokes v u a) v b x T := by
    simpa only [spokes,pair_comm] using hT
  obtain ⟨t,ht,hvt,_,hTt,hxform⟩ := witness_form h.swapUV.swapAB hx' hT'
  have hst : s ≠ t := fun heq => hnvs (heq ▸ hvt)
  simp only [mem_insert,mem_singleton,not_or] at hs ht
  have hdis : Disjoint ({v,b,t} : Finset V) {u,a,s} := by
    apply disjoint_left.mpr
    intro z hz hw
    simp only [mem_insert,mem_singleton] at hz hw
    rcases hz with rfl|rfl|rfl <;> rcases hw with heq|heq|heq
    · exact h.uv heq.symm
    · exact h.va heq
    · exact hs.2.1 heq.symm
    · exact h.ub heq.symm
    · exact h.ab heq.symm
    · exact hs.2.2.2 heq.symm
    · exact ht.2.1 heq
    · exact ht.2.2.2 heq
    · exact hst heq.symm
  exact hdis.mono (hTt ▸ (mem_edges.mp hT.2.1).1) (hUs ▸ (mem_edges.mp hU.2.1).1)

theorem disjoint_edges_not_triangle {G : SimpleGraph V} {T e f : Edge V}
    (ht : T ∈ triangles G) (he : e ∈ edges T) (hf : f ∈ edges T) (hd : Disjoint e f) : False := by
  have hc := card_le_card (union_subset (mem_edges.mp he).1 (mem_edges.mp hf).1)
  rw [card_union_of_disjoint hd,(mem_edges.mp he).2,(mem_edges.mp hf).2,
    triangles_valid G T ht] at hc
  omega
end Tuza08
