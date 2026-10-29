import Tuza.Graph

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A triangle external to a K4 leaves some face edge-disjoint from it. -/
theorem k4_face_avoiding_external_triangle {G : SimpleGraph V} {k q : Finset V}
    (hk : G.IsNClique 4 k) (hq : q.card = 3) (hn : ¬ q ⊆ k) :
    ∃ f, f ⊆ k ∧ f ∈ triangles G ∧ Disjoint (edges f) (edges q) := by
  classical
  have hi : (k ∩ q).card ≤ 2 := by
    by_contra h
    have heq : k ∩ q = q := eq_of_subset_of_card_le inter_subset_right (by omega)
    apply hn
    rw [← heq]
    exact inter_subset_left
  have hu : ∃ u ∈ k, ((k.erase u) ∩ q).card ≤ 1 := by
    by_cases hh : (k ∩ q).Nonempty
    · obtain ⟨u,hu⟩ := hh
      have he : (k.erase u) ∩ q = (k ∩ q).erase u := by ext a; simp
      refine ⟨u,(mem_inter.mp hu).1,?_⟩
      rw [he,card_erase_of_mem hu]
      omega
    · have hem : k ∩ q = ∅ := not_nonempty_iff_eq_empty.mp hh
      obtain ⟨u,hu⟩ := card_pos.mp (show 0 < k.card by rw [hk.card_eq]; decide)
      refine ⟨u,hu,?_⟩
      have hsub : (k.erase u) ∩ q ⊆ k ∩ q := by
        intro a ha
        exact mem_inter.mpr ⟨(mem_erase.mp (mem_inter.mp ha).1).2,(mem_inter.mp ha).2⟩
      rw [hem] at hsub
      rw [subset_empty.mp hsub]
      simp
  obtain ⟨u,hu,hsmall⟩ := hu
  let f := k.erase u
  have hfk : f ⊆ k := erase_subset _ _
  have hcard : f.card = 3 := by simp [f,card_erase_of_mem hu,hk.card_eq]
  refine ⟨f,hfk,mem_triangles.mpr ⟨?_,hcard⟩,?_⟩
  · intro a ha b hb hab
    exact hk.isClique (hfk ha) (hfk hb) hab
  · apply disjoint_left.mpr
    intro e hef heq
    have hsub : e ⊆ f ∩ q := subset_inter (mem_edges.mp hef).1 (mem_edges.mp heq).1
    have hc := card_le_card hsub
    rw [(mem_edges.mp hef).2] at hc
    change (f ∩ q).card ≤ 1 at hsmall
    omega

/-- Extraction of a maximum number of edge-disjoint K4s exhausts the full triangle family.
This new elementary deduction is proved, not included in HNSInput. -/
theorem maximum_k4_exhaustion {G : SimpleGraph V} {K : Finset (Finset V)}
    (hk : ∀ k ∈ K, G.IsNClique 4 k) (hi : Independent K)
    (hK : K.card = nu (triangles G)) :
    ∀ q ∈ triangles G, ∃ k ∈ K, q ⊆ k := by
  classical
  intro q hq
  by_contra hn
  have hout : ∀ k ∈ K, ¬ q ⊆ k := by
    intro k hk' hqk
    exact hn ⟨k,hk',hqk⟩
  have hex : ∀ k : Finset V, ∃ t : Finset V,
      k ∈ K → t ⊆ k ∧ t ∈ triangles G ∧ Disjoint (edges t) (edges q) := by
    intro k
    by_cases hm : k ∈ K
    · obtain ⟨t,ht⟩ := k4_face_avoiding_external_triangle (hk k hm)
        (mem_triangles.mp hq).card_eq (hout k hm)
      exact ⟨t,fun _ => ht⟩
    · exact ⟨∅,fun he => (hm he).elim⟩
  choose f hf using hex
  have hinj : Set.InjOn f (K : Set (Finset V)) := by
    intro k hkk l hll heq
    by_contra hne
    have hd := hi k hkk l hll hne
    obtain ⟨e,he⟩ := edges_nonempty (s := f k) (by
      rw [(mem_triangles.mp (hf k hkk).2.1).card_eq]; decide)
    exact disjoint_left.mp hd (edges_mono (hf k hkk).1 he)
      (edges_mono (hf l hll).1 (heq ▸ he))
  have hp : Packing (triangles G) (K.image f) := by
    constructor
    · intro p hp
      obtain ⟨k,hkk,rfl⟩ := mem_image.mp hp
      exact (hf k hkk).2.1
    · intro p hp t ht hpt
      obtain ⟨k,hkk,rfl⟩ := mem_image.mp hp
      obtain ⟨l,hll,rfl⟩ := mem_image.mp ht
      have hkl : k ≠ l := fun h => hpt (congrArg f h)
      apply disjoint_left.mpr
      intro e hek hel
      exact disjoint_left.mp (hi k hkk l hll hkl)
        (edges_mono (hf k hkk).1 hek) (edges_mono (hf l hll).1 hel)
  have hc : ∀ p ∈ K.image f, ∀ t ∈ ({q} : Finset (Finset V)),
      Disjoint (edges p) (edges t) := by
    intro p hp t ht
    obtain ⟨k,hkk,rfl⟩ := mem_image.mp hp
    have htq := mem_singleton.mp ht
    subst t
    exact (hf k hkk).2.2
  have hl := nu_union_lower (triangles_valid G) hp hc
  have hsingle : 1 ≤ nu ({q} : Finset (Finset V)) := nu_pos (singleton_nonempty _)
  have heq : triangles G ∪ {q} = triangles G := union_eq_left.mpr (by simpa using hq)
  rw [card_image_iff.mpr hinj,hK,heq] at hl
  omega

theorem equality_k4_exhaustion (hns : HNSInput (V := V)) (G : SimpleGraph V)
    (htrip : TriangleTripartite G) (heq : tau (triangles G) = 2 * nu (triangles G)) :
    ∃ K : Finset (Finset V), (∀ k ∈ K, G.IsNClique 4 k) ∧ Independent K ∧
      K.card = nu (triangles G) ∧ (∀ t ∈ triangles G, ∃ k ∈ K, t ⊆ k) := by
  obtain ⟨K,hk,hi,hK⟩ := hns G htrip heq
  exact ⟨K,hk,hi,hK,maximum_k4_exhaustion hk hi hK⟩

#print axioms maximum_k4_exhaustion
#print axioms equality_k4_exhaustion
end Tuza
