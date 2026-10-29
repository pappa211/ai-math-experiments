import Tuza.Basic

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def triangles (G : SimpleGraph V) : Finset (Finset V) := by
  classical
  exact G.cliqueFinset 3

@[simp] theorem mem_triangles {G : SimpleGraph V} {t : Finset V} :
    t ∈ triangles G ↔ G.IsNClique 3 t := by
  classical
  exact SimpleGraph.mem_cliqueFinset_iff

theorem triangles_valid (G : SimpleGraph V) : Triangles (triangles G) :=
  fun _ ht => (mem_triangles.mp ht).card_eq

theorem supported_edge_is_graph_edge {G : SimpleGraph V} {e : Finset V}
    (he : e ∈ support (triangles G)) : G.IsNClique 2 e := by
  classical
  obtain ⟨t, ht, het⟩ := mem_biUnion.mp he
  refine ⟨?_, (mem_edges.mp het).2⟩
  intro a ha b hb hab
  exact (mem_triangles.mp ht).isClique ((mem_edges.mp het).1 ha)
    ((mem_edges.mp het).1 hb) hab

/-- Thus tau is attained by a cover consisting only of actual graph edges. -/
theorem graph_min_cover (G : SimpleGraph V) :
    ∃ C, Covers (triangles G) C ∧ C.card = tau (triangles G) ∧
      ∀ e ∈ C, G.IsNClique 2 e := by
  obtain ⟨C, hc, hC, hs⟩ := exists_min_cover_supported (triangles_valid G)
  exact ⟨C, hc, hC, fun e he => supported_edge_is_graph_edge (hs he)⟩

def IndependentVertices (G : SimpleGraph V) (U : Finset V) : Prop :=
  ∀ a ∈ U, ∀ b ∈ U, ¬ G.Adj a b

/-- For a triangle U, this deletes exactly its three graph edges. -/
def deleteTriangle (G : SimpleGraph V) (U : Finset V) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ ¬ (a ∈ U ∧ b ∈ U)
  symm := ⟨fun _ _ h => ⟨h.1.symm, fun hu => h.2 ⟨hu.2, hu.1⟩⟩⟩
  loopless := ⟨fun _ h => G.irrefl h.1⟩

theorem delete_le (G : SimpleGraph V) (U : Finset V) : deleteTriangle G U ≤ G :=
  fun _ _ h => h.1

theorem delete_independent (G : SimpleGraph V) (U : Finset V) :
    IndependentVertices (deleteTriangle G U) U :=
  fun _ ha _ hb h => h.2 ⟨ha, hb⟩

theorem triangles_mono_graph {G H : SimpleGraph V} (h : H ≤ G) :
    triangles H ⊆ triangles G := by
  intro t ht
  exact mem_triangles.mpr ((mem_triangles.mp ht).mono h)

theorem deleted_edges_disjoint {G : SimpleGraph V} {U t : Finset V}
    (ht : t ∈ triangles (deleteTriangle G U)) : Disjoint (edges t) (edges U) := by
  apply disjoint_left.mpr
  intro e het heU
  obtain ⟨a, b, hab, he⟩ := card_eq_two.mp (mem_edges.mp het).2
  have ha : a ∈ e := by rw [he]; simp
  have hb : b ∈ e := by rw [he]; simp
  have hadj := (mem_triangles.mp ht).isClique
    ((mem_edges.mp het).1 ha) ((mem_edges.mp het).1 hb) hab
  exact hadj.2 ⟨(mem_edges.mp heU).1 ha, (mem_edges.mp heU).1 hb⟩

theorem new_triangle_removed_edge {G : SimpleGraph V} {U q : Finset V}
    (hq : q ∈ triangles G) (hnew : q ∉ triangles (deleteTriangle G U)) :
    ∃ e ∈ edges U, e ∈ edges q := by
  by_contra hn
  apply hnew
  apply mem_triangles.mpr
  refine ⟨?_, (mem_triangles.mp hq).card_eq⟩
  intro a ha b hb hab
  refine ⟨(mem_triangles.mp hq).isClique ha hb hab, ?_⟩
  intro hU
  apply hn
  refine ⟨{a, b}, mem_edges.mpr ⟨?_, by simp [hab]⟩,
    mem_edges.mpr ⟨?_, by simp [hab]⟩⟩
  · intro v hv
    rcases mem_insert.mp hv with rfl | hv
    · exact hU.1
    · exact (mem_singleton.mp hv) ▸ hU.2
  · intro v hv
    rcases mem_insert.mp hv with rfl | hv
    · exact ha
    · exact (mem_singleton.mp hv) ▸ hb

theorem avoid_new_triangle {U p q : Finset V} (hp : Disjoint p U)
    (hq : q.card = 3) (hnew : ∃ f ∈ edges U, f ∈ edges q) :
    Disjoint (edges p) (edges q) := by
  apply disjoint_left.mpr
  intro e hep heq
  obtain ⟨f, hfU, hfq⟩ := hnew
  have hef : Disjoint e f := by
    apply disjoint_left.mpr
    intro v he hf
    exact disjoint_left.mp hp ((mem_edges.mp hep).1 he) ((mem_edges.mp hfU).1 hf)
  have hsub : e ∪ f ⊆ q := union_subset (mem_edges.mp heq).1 (mem_edges.mp hfq).1
  have hc := card_le_card hsub
  rw [card_union_of_disjoint hef, (mem_edges.mp hep).2, (mem_edges.mp hfq).2, hq] at hc
  omega

theorem k4_face_avoiding {G : SimpleGraph V} {U k : Finset V}
    (hU : IndependentVertices G U) (hk : G.IsNClique 4 k) :
    ∃ t, t ⊆ k ∧ t ∈ triangles G ∧ Disjoint t U := by
  have hi : (k ∩ U).card ≤ 1 := by
    apply card_le_one.mpr
    intro a ha b hb
    by_contra hab
    exact hU a (mem_inter.mp ha).2 b (mem_inter.mp hb).2
      (hk.isClique (mem_inter.mp ha).1 (mem_inter.mp hb).1 hab)
  have hsize : 3 ≤ (k \ U).card := by
    have h := card_sdiff_add_card_inter k U
    rw [hk.card_eq] at h
    omega
  obtain ⟨t, ht, hcard⟩ := exists_subset_card_eq hsize
  have htk : t ⊆ k := ht.trans sdiff_subset
  refine ⟨t, htk, mem_triangles.mpr ⟨?_, hcard⟩, ?_⟩
  · intro a ha b hb hab
    exact hk.isClique (htk ha) (htk hb) hab
  · apply disjoint_left.mpr
    intro a ha hU
    exact (mem_sdiff.mp (ht ha)).2 hU

/-- Edge-disjoint K4s produce equally many disjoint triangle faces avoiding U. -/
theorem k4_packing_faces {G : SimpleGraph V} {U : Finset V}
    {K : Finset (Finset V)} (hU : IndependentVertices G U)
    (hk : ∀ k ∈ K, G.IsNClique 4 k) (hi : Independent K) :
    ∃ P, Packing (triangles G) P ∧ P.card = K.card ∧ ∀ p ∈ P, Disjoint p U := by
  classical
  have hex : ∀ k : Finset V, ∃ t : Finset V,
      k ∈ K → t ⊆ k ∧ t ∈ triangles G ∧ Disjoint t U := by
    intro k
    by_cases h : k ∈ K
    · obtain ⟨t, ht⟩ := k4_face_avoiding hU (hk k h)
      exact ⟨t, fun _ => ht⟩
    · exact ⟨∅, fun he => (h he).elim⟩
  choose f hf using hex
  have hinj : Set.InjOn f (K : Set (Finset V)) := by
    intro k hk' l hl' heq
    by_contra hne
    have hd := hi k hk' l hl' hne
    obtain ⟨e, he⟩ := edges_nonempty (s := f k) (by
      rw [(mem_triangles.mp (hf k hk').2.1).card_eq]; decide)
    have hek := edges_mono (hf k hk').1 he
    have hel := edges_mono (hf l hl').1 (heq ▸ he)
    exact disjoint_left.mp hd hek hel
  refine ⟨K.image f, ⟨?_, ?_⟩, card_image_iff.mpr hinj, ?_⟩
  · intro p hp
    obtain ⟨k, hk', rfl⟩ := mem_image.mp hp
    exact (hf k hk').2.1
  · intro p hp q hq hpq
    obtain ⟨k, hk', rfl⟩ := mem_image.mp hp
    obtain ⟨l, hl', rfl⟩ := mem_image.mp hq
    have hkl : k ≠ l := fun h => hpq (congrArg f h)
    apply disjoint_left.mpr
    intro e he hf'
    exact disjoint_left.mp (hi k hk' l hl' hkl)
      (edges_mono (hf k hk').1 he) (edges_mono (hf l hl').1 hf')
  · intro p hp
    obtain ⟨k, hk', rfl⟩ := mem_image.mp hp
    exact (hf k hk').2.2

/-- Three labels on graph edges, rainbow on every triangle; no ordinary vertex coloring is assumed. -/
def TriangleTripartite (G : SimpleGraph V) : Prop :=
  ∃ color : Finset V → Fin 3, ∀ t ∈ triangles G,
    Set.InjOn color (edges t : Set (Finset V))

/-- Published tripartite Ryser inequality, explicitly an external input. -/
def AharoniInput : Prop :=
  ∀ G : SimpleGraph V, TriangleTripartite G → tau (triangles G) ≤ 2 * nu (triangles G)

/-- Precise graphical consequence of HNS Theorem 1.1 and the loose-cycle/K4 conversion.
The conversion is justified in MATHEMATICAL_AUDIT.md; this entire input is external here. -/
def HNSInput : Prop :=
  ∀ G : SimpleGraph V, TriangleTripartite G → tau (triangles G) = 2 * nu (triangles G) →
    ∃ K : Finset (Finset V), (∀ k ∈ K, G.IsNClique 4 k) ∧ Independent K ∧
      K.card = nu (triangles G)

end Tuza
