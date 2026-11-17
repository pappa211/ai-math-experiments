import Tuza24.ForestMatchingSlack

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Isolated vertices cannot belong to any matching edge. -/
theorem matchingVertices_isolate_disjoint {G : SimpleGraph V} {U : Finset V}
    {M : Finset (Finset V)} (hM : EdgeMatching (isolate G U) M) :
    Disjoint (matchingVertices M) U := by
  classical
  apply disjoint_left.mpr
  intro x hx hxU
  obtain ⟨e,he,hxe⟩ := mem_biUnion.mp hx
  exact disjoint_left.mp (isolate_edge_avoids (hM.1 e he)) hxe hxU

/-- Edges away from the deleted vertex are exactly the surviving isolated edges. -/
theorem isolate_singleton_edge {G : SimpleGraph V} {w : V} {e : Finset V}
    (he : G.IsNClique 2 e) (hw : w ∉ e) : (isolate G {w}).IsNClique 2 e := by
  classical
  refine ⟨?_,he.card_eq⟩
  intro a ha b hb hab
  exact ⟨he.isClique ha hb hab,by simpa using (fun h : a=w => hw (h ▸ ha)),
    by simpa using (fun h : b=w => hw (h ▸ hb))⟩

/-- If an apex neighbor can be exposed while retaining a matching-sized forest
cover, adding its apex edge produces the required pointed witness. -/
theorem pointed_of_exposed_neighbor {L : SimpleGraph V} {w u : V}
    (hwu : L.Adj w u) {N : Finset (Finset V)} {B : Finset V}
    (hN : EdgeMatching (isolate L {w}) N) (hu : u ∉ matchingVertices N)
    (hB : VertexCover (isolate L {w}) B) (hcard : B.card ≤ N.card) :
    PointedWitness L w (insert {w,u} N) (insert w B) := by
  classical
  have hw : w ∉ matchingVertices N := by
    intro h
    exact disjoint_left.mp (matchingVertices_isolate_disjoint hN) h (by simp)
  have havoid : ∀ e ∈ N, Disjoint e ({w,u} : Finset V) := by
    intro e he
    apply disjoint_right.mpr
    intro x hx hxe
    have hxN : x ∈ matchingVertices N := mem_biUnion.mpr ⟨e,he,hxe⟩
    rcases mem_insert.mp hx with rfl|hx
    · exact hw hxN
    · exact hu (mem_singleton.mp hx ▸ hxN)
  have hnew : ({w,u} : Finset V) ∉ N := by
    intro he
    exact disjoint_left.mp (havoid _ he) (show w ∈ ({w,u} : Finset V) by simp) (by simp)
  have hewu : L.IsNClique 2 ({w,u} : Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,hwu.ne] using hwu,by simp [hwu.ne]⟩
  refine ⟨?_,?_,?_,fun _ => mem_insert_self _ _⟩
  · constructor
    · intro e he
      rcases mem_insert.mp he with rfl|he
      · exact hewu
      · exact (hN.1 e he).mono (isolate_le _ _)
    · intro e he f hf hef
      rcases mem_insert.mp he with rfl|he <;> rcases mem_insert.mp hf with rfl|hf
      · exact (hef rfl).elim
      · exact (havoid f hf).symm
      · exact havoid e he
      · exact hN.2 e he f hf hef
  · intro e he _
    by_cases hwE : w ∈ e
    · intro hd; exact disjoint_left.mp hd hwE (by simp)
    · intro hd
      exact hB e (isolate_singleton_edge he hwE) (hd.mono_right (subset_insert _ _))
  · rw [card_insert_of_notMem hnew]
    exact (card_insert_le _ _).trans (Nat.add_le_add_right hcard 1)

/-- A strict residual saving pays for the apex itself; the matching avoids the
apex, so the conditional anchor is vacuous. -/
theorem pointed_of_residual_slack {L : SimpleGraph V} {w : V}
    {M : Finset (Finset V)} {B : Finset V}
    (hM : EdgeMatching (isolate L {w}) M)
    (hB : ResidualVertexCover (isolate L {w}) M B) (hcard : B.card < M.card) :
    PointedWitness L w M (insert w B) := by
  classical
  refine ⟨matching_mono (isolate_le _ _) hM,?_,?_,?_⟩
  · intro e he heM
    by_cases hwE : w ∈ e
    · intro hd; exact disjoint_left.mp hd hwE (by simp)
    · intro hd
      exact hB e (isolate_singleton_edge he hwE) heM (hd.mono_right (subset_insert _ _))
  · exact (card_insert_le _ _).trans (by omega)
  · intro hw
    exact (disjoint_left.mp (matchingVertices_isolate_disjoint hM) hw (by simp)).elim

/-- An apex-avoiding matching and a full cover of no larger size already form a
pointed witness, with no maximality assumption. -/
theorem pointed_of_full_cover {L : SimpleGraph V} {w : V}
    {M : Finset (Finset V)} {Q : Finset V}
    (hM : EdgeMatching (isolate L {w}) M) (hQ : VertexCover L Q)
    (hcard : Q.card ≤ M.card) : PointedWitness L w M Q := by
  refine ⟨matching_mono (isolate_le _ _) hM,fun e he _ => hQ e he,hcard,?_⟩
  intro hw
  exact (disjoint_left.mp (matchingVertices_isolate_disjoint hM) hw (by simp)).elim

end Tuza24
