import Tuza24.PerfectForestExclusionTools

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A minimum CS failure cannot have an apex-forest full link whose forest part
has a perfect matching on the explicit active neighborhood minus the apex. -/
theorem perfect_apex_link_excluded {G : SimpleGraph V} (hG : MinimalCS G) {v w : V}
    (hvw : G.Adj v w) (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M : Finset (Finset V)} (hM : EdgeMatching (isolate (linkGraph G v) {w}) M)
    (hperfect : matchingVertices M = (peelNeighbors G univ v).erase w) : False := by
  classical
  let L := linkGraph G v
  let F := isolate L {w}
  let R := matchingResidualEdges F M
  have hwN : w ∈ peelNeighbors G univ v := mem_filter.mpr ⟨mem_univ _,hvw⟩
  have hsize := minimal_full_link_size hG hvw
  have hactivecard := card_erase_add_one hwN
  have hsupportcard := matchingVertices_card hM
  rw [hperfect] at hsupportcard
  have hr : 2 ≤ M.card := by omega
  have hMn : M.Nonempty := card_pos.mp (by omega)
  have hfull : ∀ e, F.IsNClique 2 e → e ⊆ matchingVertices M := by
    intro e he
    rw [hperfect]
    exact forest_link_edge_active he
  have hML : EdgeMatching L M := matching_mono (isolate_le L {w}) hM
  have hwM : w ∉ matchingVertices M := isolate_matching_vertices_avoids hM (by simp)
  rcases perfect_forest_residual_alternative hF hM hMn hfull with hstrict|⟨hR,hRc⟩
  · obtain ⟨Q,hQ,hQc⟩ := hstrict
    have hQL := isolate_residual_insert_vertex hQ
    apply minimal_link_strict_cover_false hG (full_link_matching_of_residual hML hQL)
    have hc := card_insert_le w Q
    omega
  · change EdgeMatching F R at hR
    change R.card + 1 = M.card at hRc
    have hwR : w ∉ matchingVertices R := isolate_matching_vertices_avoids hR (by simp)
    have hRm : ∀ e ∈ R, e ∉ M := fun e he => (mem_sdiff.mp he).2
    have hMR : ∀ e ∈ M, e ∉ R := fun e he heR => hRm e heR he
    obtain ⟨Q₀,hQ₀,hQ₀c⟩ := edgeFamily_vertexCover R (by
      intro e he
      exact card_pos.mp (by rw [(hR.1 e he).card_eq]; decide))
    have hQF : ResidualVertexCover F M Q₀ := by
      intro e he heM
      exact hQ₀ e (mem_sdiff.mpr ⟨mem_graphEdges.mpr he,heM⟩)
    have hm₀ : LinkMatching G v M (insert w Q₀) :=
      full_link_matching_of_residual hML (isolate_residual_insert_vertex hQF)
    have hQ₀bound : (insert w Q₀).card ≤ M.card := by
      have hi := card_insert_le w Q₀
      omega
    have hspoke : ∀ f ∈ M, ∃ t, t ∉ matchingVertices R ∧ t ∉ f ∧ L.Adj w t := by
      intro f hf
      obtain ⟨t,htM,htR,htf,a,hta,hleaf⟩ := perfect_residual_leaf_outside_edge
        hF hM hr hR hRc hfull hf
      exact ⟨t,htR,htf,minimal_forest_leaf_apex hG hta hleaf⟩
    by_cases hMtri : ∃ a b, ({a,b} : Finset V) ∈ M ∧ L.Adj w a ∧ L.Adj w b
    · obtain ⟨a,b,habM,hwa,hwb⟩ := hMtri
      have habne : a ≠ b := by
        intro h
        have hc := (hM.1 _ habM).card_eq
        simp [h] at hc
      have habL := ((hM.1 _ habM).isClique (by simp) (by simp) habne).1
      have htL : ({a,b,w} : Finset V) ∈ triangles L := triangle_of_adj habL hwa.symm hwb.symm
      have htG : ({a,b,w} : Finset V) ∈ triangles G :=
        triangles_mono_graph (linkGraph_le G v) htL
      obtain ⟨t,htR,htab,hwt⟩ := hspoke {a,b} habM
      have hZ := isolate_insert_spoke_matching hR htR hwt
      apply minimal_internal_page_augmentation hG hF hm₀ hQ₀bound habM htG
        (full_link_triangle_neighbors htL) hZ.1
      · rw [hZ.2,hRc]
      · exact insert_spoke_disjoint_apex_triangle hwR (hMR _ habM) htab hwt.ne
    · by_cases htri : ∃ t, t ∈ triangles L
      · obtain ⟨T,hT⟩ := htri
        obtain ⟨a,b,habF,hwa,hwb⟩ := apexForest_triangle_base hF hT
        have habE : F.IsNClique 2 ({a,b} : Finset V) :=
          ⟨by simpa [SimpleGraph.isClique_pair,habF.ne] using habF,by simp [habF.ne]⟩
        have habNotM : ({a,b} : Finset V) ∉ M := fun h => hMtri ⟨a,b,h,hwa,hwb⟩
        have habR : ({a,b} : Finset V) ∈ R := mem_sdiff.mpr ⟨mem_graphEdges.mpr habE,habNotM⟩
        obtain ⟨f,hf⟩ := hMn
        obtain ⟨t,htR,htf,hwt⟩ := hspoke f hf
        have hP := isolate_insert_spoke_matching hR htR hwt
        have hactive : ∀ x, L.Adj w x → x ∈ matchingVertices M := by
          intro x hx
          rw [hperfect]
          exact mem_erase.mpr ⟨hx.ne.symm,mem_filter.mpr ⟨mem_univ _,hx.2.2⟩⟩
        obtain ⟨Q,hQ,hQc⟩ := perfect_switch_residual_cover (t := t) hM hactive hMtri
        have hm := full_link_matching_of_residual hP.1 hQ
        have htL : ({a,b,w} : Finset V) ∈ triangles L := triangle_of_adj habF.1 hwa.symm hwb.symm
        have htG : ({a,b,w} : Finset V) ∈ triangles G :=
          triangles_mono_graph (linkGraph_le G v) htL
        apply minimal_internal_page_augmentation hG hF hm
          (by rw [hQc,hP.2,hRc]) (mem_insert_of_mem habR) htG
          (full_link_triangle_neighbors htL) hML
        · rw [hP.2,hRc]
        · exact matching_disjoint_apex_triangle hwM habNotM
      · obtain ⟨f,hf⟩ := hMn
        obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp (hM.1 f hf).card_eq
        have habL := ((hM.1 _ hf).isClique (by simp) (by simp) hab).1
        have hnoa : ∀ t ∈ triangles L, a ∉ t := fun t ht => (htri ⟨t,ht⟩).elim
        have hnob : ∀ t ∈ triangles L, b ∉ t := fun t ht => (htri ⟨t,ht⟩).elim
        obtain ⟨z,htG,hvt,hz⟩ := minimal_external_page hG habL hnoa
        obtain ⟨t,htR,htab,hwt⟩ := hspoke {a,b} hf
        have hZ := isolate_insert_spoke_matching hR htR hwt
        have hwab : w ∉ ({a,b} : Finset V) := fun h =>
          disjoint_left.mp (isolate_edge_avoids (hM.1 _ hf)) h (by simp)
        have hbaseNot := insert_spoke_avoids_base (t := t) hwab (hMR _ hf)
        apply minimal_safe_external_page_augmentation hG hF hm₀ hQ₀bound hf htG hvt hnoa hnob hZ.1
        · rw [hZ.2,hRc]
        · exact external_page_matching_disjoint hZ.1 hz hbaseNot

end Tuza24
