import Tuza23.GraphAPI

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem triangle_of_adj {H : SimpleGraph V} {a b c : V}
    (hab : H.Adj a b) (hac : H.Adj a c) (hbc : H.Adj b c) :
    ({a,b,c} : Finset V) ∈ triangles H := by
  apply mem_triangles.mpr
  constructor
  · intro x hx y hy hxy
    simp only [mem_coe,mem_insert,mem_singleton] at hx hy
    rcases hx with rfl | rfl | rfl <;> rcases hy with rfl | rfl | rfl
    · exact (hxy rfl).elim
    · exact hab
    · exact hac
    · exact hab.symm
    · exact (hxy rfl).elim
    · exact hbc
    · exact hac.symm
    · exact hbc.symm
    · exact (hxy rfl).elim
  · simp [hab.ne,hac.ne,hbc.ne]

/-- Exhaustivity includes crossing triangles, so a triangle sharing any block
edge lies wholly in that block. No restriction on other attachments. -/
theorem triangle_subset_block_of_edge {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k t e : Finset V} (hk : k ∈ K)
    (ht : t ∈ triangles H) (het : e ∈ edges t) (hek : e ∈ edges k) : t ⊆ k := by
  obtain ⟨l,hl,htl⟩ := hK.exhaustive t ht
  by_cases hlk : l=k
  · exact hlk ▸ htl
  · exact (disjoint_left.mp (hK.independent l hl k hk hlk)
      (edges_mono htl het) hek).elim

/-- Any vertex adjacent to two distinct vertices of a clique triangle component
belongs to the component's literal vertex set. -/
theorem two_neighbors_in_block {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k : Finset V} (hk : k ∈ K)
    {x y v : V} (hx : x ∈ k) (hy : y ∈ k) (hxy : x ≠ y)
    (hvx : H.Adj v x) (hvy : H.Adj v y) : v ∈ k := by
  have ht := triangle_of_adj hvx hvy (hK.clique k hk hx hy hxy)
  have hsub := triangle_subset_block_of_edge hK hk ht
    (e := {x,y}) (mem_edges.mpr ⟨by simp,by simp [hxy]⟩)
    (mem_edges.mpr ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hx hy,by simp [hxy]⟩)
  exact hsub (mem_insert_self _ _)

noncomputable def pageApices (H : SimpleGraph V) (a b : V) : Finset V := by
  classical
  exact univ.filter (fun x => H.Adj a x ∧ H.Adj b x)

@[simp] theorem mem_pageApices {H : SimpleGraph V} {a b x : V} :
    x ∈ pageApices H a b ↔ H.Adj a x ∧ H.Adj b x := by
  classical
  simp [pageApices]

noncomputable def pageSpokes (H : SimpleGraph V) (a b : V) : Finset (Finset V) :=
  (pageApices H a b).biUnion (fun x => {{a,x},{b,x}})

@[simp] theorem mem_pageSpokes {H : SimpleGraph V} {a b : V} {e : Finset V} :
    e ∈ pageSpokes H a b ↔ ∃ x, H.Adj a x ∧ H.Adj b x ∧ (e={a,x} ∨ e={b,x}) := by
  classical
  simp only [pageSpokes,mem_biUnion,mem_pageApices,mem_insert,mem_singleton]
  constructor
  · rintro ⟨x,⟨ha,hb⟩,he⟩; exact ⟨x,ha,hb,he⟩
  · rintro ⟨x,ha,hb,he⟩; exact ⟨x,⟨ha,hb⟩,he⟩

theorem pageSpokes_symm (H : SimpleGraph V) (a b : V) :
    pageSpokes H a b = pageSpokes H b a := by
  ext e
  simp only [mem_pageSpokes]
  constructor <;> rintro ⟨x,h1,h2,he⟩ <;> exact ⟨x,h2,h1,he.symm⟩

/-- Full-family footprint, not a bound for one selected page. -/
theorem whole_page_footprint {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {a b : V} (hab : a ≠ b) (hne : ¬ H.Adj a b)
    {k : Finset V} (hk : k ∈ K) :
    (pageSpokes H a b ∩ edges k).card ≤ 1 := by
  apply card_le_one.mpr
  intro e he f hf
  obtain ⟨x,hax,hbx,heq⟩ := mem_pageSpokes.mp (mem_inter.mp he).1
  obtain ⟨y,hay,hby,hfq⟩ := mem_pageSpokes.mp (mem_inter.mp hf).1
  have hek := (mem_edges.mp (mem_inter.mp he).2).1
  have hfk := (mem_edges.mp (mem_inter.mp hf).2).1
  rcases heq with rfl|rfl <;> rcases hfq with rfl|rfl
  · have ha : a ∈ k := hek (by simp)
    have hx : x ∈ k := hek (by simp)
    have hy : y ∈ k := hfk (by simp)
    by_cases hxy : x=y
    · simp [hxy]
    · have hb := two_neighbors_in_block hK hk hx hy hxy hbx hby
      exact (hne (hK.clique k hk ha hb hab)).elim
  · have ha : a ∈ k := hek (by simp)
    have hb : b ∈ k := hfk (by simp)
    exact (hne (hK.clique k hk ha hb hab)).elim
  · have hb : b ∈ k := hek (by simp)
    have ha : a ∈ k := hfk (by simp)
    exact (hne (hK.clique k hk ha hb hab)).elim
  · have hb : b ∈ k := hek (by simp)
    have hx : x ∈ k := hek (by simp)
    have hy : y ∈ k := hfk (by simp)
    by_cases hxy : x=y
    · simp [hxy]
    · have ha := two_neighbors_in_block hK hk hx hy hxy hax hay
      exact (hne (hK.clique k hk ha hb hab)).elim

end Tuza23
