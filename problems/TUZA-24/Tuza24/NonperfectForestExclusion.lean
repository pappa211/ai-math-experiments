import Tuza24.NonperfectLinkReduction
import Tuza24.ForestMatchingSafeEdge
import Tuza24.PerfectForestExclusionTools

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A nonapex vertex not joined to the apex lies in no triangle of an apex forest. -/
theorem apexForest_non_neighbor_no_triangle {L : SimpleGraph V} {w a : V}
    (hF : (isolate L {w}).IsAcyclic) (haw : a≠w) (hna : ¬L.Adj w a) :
    ∀ t∈triangles L,a∉t := by
  intro t ht ha
  by_cases hw : w∈t
  · exact hna ((mem_triangles.mp ht).isClique hw ha haw.symm)
  · have hcl : (isolate L {w}).IsClique (t : Set V) := by
      intro x hx y hy hxy
      exact ⟨(mem_triangles.mp ht).isClique hx hy hxy,
        by simpa using (ne_of_mem_of_not_mem hx hw),by simpa using (ne_of_mem_of_not_mem hy hw)⟩
    have hc := forest_clique_card_le_two hF hcl
    have ht3 := (mem_triangles.mp ht).card_eq
    omega

/-- Complete nonperfect apex-forest exclusion in an actual minimal CS failure.
All exposure, original-leaf, residual matching and full-footprint obligations
are discharged by checked theorems; no WKE or external theorem premise remains. -/
theorem nonperfect_apex_link_excluded {G : SimpleGraph V} (hG : MinimalCS G) {v w : V}
    (hvw : G.Adj v w) (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching (isolate (linkGraph G v) {w}) M)
    (hdef : 2*M.card < ((peelNeighbors G univ v).erase w).card) : False := by
  classical
  let L := linkGraph G v
  let F := isolate L {w}
  have hpeer : ∀ K,MaximumMatching F K → ∃ N,EdgeMatching F N ∧ Disjoint K N ∧ N.card=K.card := by
    intro K hK
    apply minimal_nonperfect_disjoint_peer hG hF hK
    simpa [maximum_matching_card_eq hK hM] using hdef
  have hnot : ∀ a b,F.Adj a b → L.Adj w a → L.Adj w b →
      ∀ K,MaximumMatching F K → ({a,b}:Finset V)∉K := by
    intro a b hab hwa hwb K hK he
    have hdefK : 2*K.card<((peelNeighbors G univ v).erase w).card := by
      simpa [maximum_matching_card_eq hK hM] using hdef
    have ht : ({a,b,w}:Finset V)∈triangles G := triangle_of_adj hab.1.1 hwa.1.symm hwb.1.symm
    exact minimal_nonperfect_allowed_triangle hG hvw hF hK hdefK he ht
  by_cases htri : (triangles L).Nonempty
  · obtain ⟨t,ht⟩ := htri
    have htriangle := apexForest_triangle_base hF ht
    have hZ : exposureRemainder F=∅ := forest_exposureRemainder_empty_of_avoidable hF
      (fun e _ => maximum_edge_avoidable_of_peer hM hpeer e)
    obtain ⟨a,b,K,hK,he,hna,hnb⟩ := apex_forest_safe_allowed_edge hF
      (fun _ _ hxy hleaf => minimal_forest_leaf_apex hG hxy hleaf) hZ htriangle hnot
    have heF := hK.1.1 _ he
    have haw : a≠w := by
      intro h
      exact disjoint_left.mp (isolate_edge_avoids heF) (show a∈({a,b}:Finset V) by simp) (by simp [h])
    have hbw : b≠w := by
      intro h
      exact disjoint_left.mp (isolate_edge_avoids heF) (show b∈({a,b}:Finset V) by simp) (by simp [h])
    have hdefK : 2*K.card<((peelNeighbors G univ v).erase w).card := by
      simpa [maximum_matching_card_eq hK hM] using hdef
    exact minimal_nonperfect_safe_edge hG hvw hF hK hdefK he
      (apexForest_non_neighbor_no_triangle hF haw hna)
      (apexForest_non_neighbor_no_triangle hF hbw hnb)
  · obtain ⟨u,hu⟩ := card_pos.mp (show 0<((peelNeighbors G univ v).erase w).card by omega)
    obtain ⟨z,huz⟩ := minimal_forest_link_active hG hu
    obtain ⟨e,he⟩ := maximum_matching_nonempty_of_adj hM huz
    obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp (hM.1.1 _ he).card_eq
    have heab : ({a,b}:Finset V)∈M := heq ▸ he
    have hnone : ∀ a:V,∀ t∈triangles L,a∉t := fun _ t ht _ => htri ⟨t,ht⟩
    exact minimal_nonperfect_safe_edge hG hvw hF hM hdef heab (hnone a) (hnone b)

end Tuza24
