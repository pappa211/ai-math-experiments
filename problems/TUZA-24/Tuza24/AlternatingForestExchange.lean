import Tuza24.ForestMatching

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A vertex is exposable when some maximum actual-edge matching misses it. -/
def Exposable (G : SimpleGraph V) (v : V) : Prop :=
  ∃ M, MaximumMatching G M ∧ v ∉ matchingVertices M

/-- Choose the unique cover representative of each matching edge. -/
theorem matching_cover_representatives [Nonempty V] {G : SimpleGraph V}
    {M : Finset (Finset V)} {Q : Finset V} (hM : EdgeMatching G M)
    (hQ : VertexCover G Q) (hcard : Q.card = M.card) :
    ∃ f : Finset V → V, (∀ e ∈ M, f e ∈ e ∧ f e ∈ Q) ∧ M.image f = Q := by
  classical
  have hex : ∀ e : Finset V, ∃ v : V, e ∈ M → v ∈ e ∧ v ∈ Q := by
    intro e
    by_cases he : e ∈ M
    · obtain ⟨v,hve,hvQ⟩ := not_disjoint_iff.mp (hQ e (hM.1 e he))
      exact ⟨v,fun _ => ⟨hve,hvQ⟩⟩
    · exact ⟨Classical.arbitrary V,fun h => (he h).elim⟩
  choose f hf using hex
  have hinj : Set.InjOn f (M : Set (Finset V)) := by
    intro e he g hg hfg
    by_contra hne
    exact disjoint_left.mp (hM.2 e he g hg hne) (hf e he).1
      (hfg.symm ▸ (hf g hg).1)
  have hsub : M.image f ⊆ Q := by
    intro v hv
    obtain ⟨e,he,rfl⟩ := mem_image.mp hv
    exact (hf e he).2
  exact ⟨f,hf,eq_of_subset_of_card_le hsub (by rw [card_image_iff.mpr hinj,hcard])⟩

/-- Equality in matching/vertex-cover weak duality saturates every cover vertex.
This concerns an actual ordinary vertex cover, not a triangle-edge cover. -/
theorem vertexCover_subset_matchingVertices {G : SimpleGraph V}
    {M : Finset (Finset V)} {Q : Finset V} (hM : EdgeMatching G M)
    (hQ : VertexCover G Q) (hcard : Q.card = M.card) : Q ⊆ matchingVertices M := by
  classical
  intro v hv
  letI : Nonempty V := ⟨v⟩
  obtain ⟨f,hf,heq⟩ := matching_cover_representatives hM hQ hcard
  rw [← heq] at hv
  obtain ⟨e,he,rfl⟩ := mem_image.mp hv
  exact mem_biUnion.mpr ⟨e,he,(hf e he).1⟩

/-- An equality cover contains at most one endpoint of each matching edge. -/
theorem vertexCover_matching_edge_unique {G : SimpleGraph V}
    {M : Finset (Finset V)} {Q e : Finset V} (hM : EdgeMatching G M)
    (hQ : VertexCover G Q) (hcard : Q.card = M.card) (he : e ∈ M)
    {u v : V} (hu : u ∈ e) (huQ : u ∈ Q) (hv : v ∈ e) (hvQ : v ∈ Q) : u = v := by
  classical
  letI : Nonempty V := ⟨u⟩
  obtain ⟨f,hf,heq⟩ := matching_cover_representatives hM hQ hcard
  have hrep : ∀ x ∈ e, x ∈ Q → x = f e := by
    intro x hxe hxQ
    rw [← heq] at hxQ
    obtain ⟨g,hg,hgx⟩ := mem_image.mp hxQ
    have hge : g = e := by
      by_contra hne
      exact disjoint_left.mp (hM.2 g hg e he hne) (hf g hg).1 (hgx.symm ▸ hxe)
    simpa [hge] using hgx.symm
  exact (hrep u hu huQ).trans (hrep v hv hvQ).symm

theorem maximum_matching_card_eq {G : SimpleGraph V} {M N : Finset (Finset V)}
    (hM : MaximumMatching G M) (hN : MaximumMatching G N) : M.card = N.card :=
  Nat.le_antisymm (hN.2 M hM.1) (hM.2 N hN.1)

/-- An exposable vertex lies in no minimum vertex cover certified by matching equality. -/
theorem exposable_not_mem_vertexCover {G : SimpleGraph V}
    {M : Finset (Finset V)} {Q : Finset V} (hM : MaximumMatching G M)
    (hQ : VertexCover G Q) (hcard : Q.card=M.card) {v : V}
    (hv : Exposable G v) : v ∉ Q := by
  obtain ⟨N,hN,hvN⟩ := hv
  exact fun hvQ => hvN (vertexCover_subset_matchingVertices hN.1 hQ
    (hcard.trans (maximum_matching_card_eq hM hN)) hvQ)

/-- In a graph with a matching-equal vertex cover, exposed vertices are independent. -/
theorem exposable_independent_of_minmax {G : SimpleGraph V}
    {M : Finset (Finset V)} {Q : Finset V} (hM : MaximumMatching G M)
    (hQ : VertexCover G Q) (hcard : Q.card=M.card) {u v : V}
    (hu : Exposable G u) (hv : Exposable G v) : ¬ G.Adj u v := by
  intro huv
  have hactual : G.IsNClique 2 ({u,v} : Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,huv.ne] using huv,by simp [huv.ne]⟩
  obtain ⟨x,hxe,hxQ⟩ := not_disjoint_iff.mp (hQ _ hactual)
  simp only [mem_insert,mem_singleton] at hxe
  rcases hxe with rfl|rfl
  · exact exposable_not_mem_vertexCover hM hQ hcard hu hxQ
  · exact exposable_not_mem_vertexCover hM hQ hcard hv hxQ

/-- All vertices deleted by isolation are unmatched in every remaining matching. -/
theorem isolate_matching_vertices_avoids {G : SimpleGraph V} {U : Finset V}
    {M : Finset (Finset V)} (hM : EdgeMatching (isolate G U) M)
    {v : V} (hv : v ∈ U) : v ∉ matchingVertices M := by
  classical
  intro hvm
  obtain ⟨e,he,hve⟩ := mem_biUnion.mp hvm
  exact disjoint_left.mp (isolate_edge_avoids (hM.1 e he)) hve hv

/-- Restoring one removed vertex to a cover covers all restored incident edges. -/
theorem vertexCover_insert_isolate {G : SimpleGraph V} {Q : Finset V} {v : V}
    (hQ : VertexCover (isolate G {v}) Q) : VertexCover G (insert v Q) := by
  classical
  intro e he
  by_cases hv : v ∈ e
  · exact fun hd => disjoint_left.mp hd hv (mem_insert_self _ _)
  · have heH : (isolate G {v}).IsNClique 2 e := by
      refine ⟨?_,he.card_eq⟩
      intro a ha b hb hab
      exact ⟨he.isClique ha hb hab,by simpa using (ne_of_mem_of_not_mem ha hv),
        by simpa using (ne_of_mem_of_not_mem hb hv)⟩
    exact fun hd => hQ e heH (hd.mono_right (subset_insert _ _))

/-- For a forest, every vertex that cannot be exposed belongs to some minimum
vertex cover. This is proved by deletion and forest minmax, without paths. -/
theorem nonexposable_minimum_cover {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {v : V}
    (hv : ¬ Exposable G v) :
    ∃ Q, VertexCover G Q ∧ Q.card = M.card ∧ v ∈ Q := by
  classical
  obtain ⟨N,Q,hN,hQ,hcard⟩ := forest_maximum_matching_cover (isolate_acyclic hG {v})
  have hNG := matching_mono (isolate_le G {v}) hN.1
  have hle := hM.2 N hNG
  have hlt : N.card < M.card := by
    by_contra h
    have heq : N.card = M.card := by omega
    apply hv
    refine ⟨N,⟨hNG,?_⟩,isolate_matching_vertices_avoids hN.1 (by simp)⟩
    intro P hP
    simpa [heq] using hM.2 P hP
  have hcover := vertexCover_insert_isolate hQ
  have hlower := matching_card_le_vertexCover hM.1 hcover
  refine ⟨insert v Q,hcover,?_,by simp⟩
  have hupper := card_insert_le v Q
  omega

/-- Exposable vertices of a finite forest form an independent set. -/
theorem forest_exposable_independent {G : SimpleGraph V} (hG : G.IsAcyclic)
    {u v : V} (hu : Exposable G u) (hv : Exposable G v) : ¬ G.Adj u v := by
  obtain ⟨M,Q,hM,hQ,hcard⟩ := forest_maximum_matching_cover hG
  exact exposable_independent_of_minmax hM hQ hcard hu hv

end Tuza24
