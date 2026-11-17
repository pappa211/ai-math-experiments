import Tuza24.PointedAssembly
import Tuza24.AlternatingForestDecomposition

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- First apex-forest branch: a neighbor exposed by a maximum forest matching. -/
theorem pointed_exposable_case {L : SimpleGraph V} {w u : V}
    (hF : (isolate L {w}).IsAcyclic) (hwu : L.Adj w u)
    (hu : Exposable (isolate L {w}) u) :
    ∃ M Q, PointedWitness L w M Q := by
  classical
  obtain ⟨N,hN,hu⟩ := hu
  obtain ⟨K,B,hK,hB,hcard⟩ := forest_maximum_matching_cover hF
  have hcard' : B.card ≤ N.card := by
    rw [hcard,maximum_matching_card_eq hK hN]
  exact ⟨insert {w,u} N,insert w B,pointed_of_exposed_neighbor hwu hN.1 hu hB hcard'⟩

/-- The perfect remainder supplies the one-unit saving needed to cover the apex.
The hypotheses here describe a concrete matching partition, not an assumed
pointed or apex-forest theorem. -/
theorem pointed_perfect_remainder_case {L : SimpleGraph V} {w : V}
    (hF : (isolate L {w}).IsAcyclic) {N NZ : Finset (Finset V)} {A U : Finset V}
    (hN : EdgeMatching (isolate L {w}) N)
    (hNZ : EdgeMatching (isolate (isolate L {w}) U) NZ) (hNZn : NZ.Nonempty)
    (hsub : NZ ⊆ N) (hcard : A.card + NZ.card = N.card)
    (hperfect : ∀ e, (isolate (isolate L {w}) U).IsNClique 2 e →
      e ⊆ matchingVertices NZ)
    (hpartition : ∀ e, (isolate L {w}).IsNClique 2 e → e ∉ N →
      ¬Disjoint e A ∨ (isolate (isolate L {w}) U).IsNClique 2 e) :
    ∃ M Q, PointedWitness L w M Q := by
  classical
  obtain ⟨B,hB,hBcard⟩ := forest_perfect_residual_slack (isolate_acyclic hF U)
    hNZ hNZn hperfect
  have hcover : ResidualVertexCover (isolate L {w}) N (A ∪ B) := by
    intro e he heN hd
    rcases hpartition e he heN with hA|hR
    · exact hA (hd.mono_right subset_union_left)
    · exact hB e hR (fun heNZ => heN (hsub heNZ)) (hd.mono_right subset_union_right)
  have hslack : (A ∪ B).card < N.card := by
    have hu := card_union_le A B
    omega
  exact ⟨N,insert w (A ∪ B),pointed_of_residual_slack hN hcover hslack⟩

/-- The pointed apex-forest matching lemma, valid for disconnected graphs and
ambient isolated vertices, including the distinguished isolated apex. -/
theorem pointed_apex_forest {L : SimpleGraph V} (w : V)
    (hF : (isolate L {w}).IsAcyclic) :
    ∃ M Q, PointedWitness L w M Q := by
  classical
  let F := isolate L {w}
  by_cases hex : ∃ u, L.Adj w u ∧ Exposable F u
  · obtain ⟨u,hwu,hu⟩ := hex
    exact pointed_exposable_case hF hwu hu
  · obtain ⟨N,B,hN,hB,hBcard⟩ := forest_maximum_matching_cover hF
    let A := exposureNeighbors F
    let U := exposureSet F ∪ A
    let NZ := exposureMatchingZ F N
    have hNZ : EdgeMatching (isolate F U) NZ := exposureMatchingZ_isMatching hN.1
    have hcard : A.card + NZ.card = N.card := (forest_matching_exposure_card hF hN).symm
    have hvertices : matchingVertices NZ = exposureRemainder F := exposureMatchingZ_vertices hF hN
    by_cases hNZn : NZ.Nonempty
    · apply pointed_perfect_remainder_case hF hN.1 hNZ hNZn
      · exact filter_subset _ _
      · exact hcard
      · intro e he
        rw [hvertices]
        intro x hx
        apply mem_sdiff.mpr
        exact ⟨mem_univ _,fun hxU => disjoint_left.mp (isolate_edge_avoids he) hx hxU⟩
      · intro e he _
        by_cases hA : Disjoint e A
        · right
          have heZ := edge_subset_exposureRemainder he hA
          refine ⟨?_,he.card_eq⟩
          intro a ha b hb hab
          exact ⟨he.isClique ha hb hab,(mem_sdiff.mp (heZ ha)).2,(mem_sdiff.mp (heZ hb)).2⟩
        · exact Or.inl hA
    · have hNZempty : NZ=∅ := not_nonempty_iff_eq_empty.mp hNZn
      have hZempty : exposureRemainder F = ∅ := by
        rw [← hvertices,hNZempty]
        simp [matchingVertices]
      have hout : ∀ x, x ∉ A → Exposable F x := by
        intro x hx
        by_contra hn
        have hz := mem_exposureRemainder.mpr ⟨hn,hx⟩
        rw [hZempty] at hz
        simpa using hz
      have hcover : VertexCover L A := by
        intro e he hd
        by_cases hwE : w ∈ e
        · obtain ⟨u,hu,huw⟩ := exists_mem_ne (by rw [he.card_eq]; decide : 1<e.card) w
          exact hex ⟨u,he.isClique hwE hu huw.symm,
            hout u (fun huA => disjoint_left.mp hd hu huA)⟩
        · have heF := isolate_singleton_edge he hwE
          obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he.card_eq
          exact forest_exposable_independent hF
            (hout a (fun haA => disjoint_left.mp hd (by simp) haA))
            (hout b (fun hbA => disjoint_left.mp hd (by simp) hbA))
            (heF.isClique (by simp) (by simp) hab)
      have hle : A.card ≤ N.card := by simp [hNZempty] at hcard; omega
      exact ⟨N,A,pointed_of_full_cover hN.1 hcover hle⟩

end Tuza24
