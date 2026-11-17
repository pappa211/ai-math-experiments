import Tuza24.ForestAnchor
import Tuza24.PerfectForestExclusion
import Tuza24.NonperfectForestExclusion

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Perfect and nonperfect active forest matchings exhaust the full-link case. -/
theorem minimal_apex_forest_link_impossible {G : SimpleGraph V} (hG : MinimalCS G)
    {v w : V} (hvw : G.Adj v w) (hF : (isolate (linkGraph G v) {w}).IsAcyclic) : False := by
  classical
  obtain ⟨M,Q,hM,hQ,hcard⟩ := forest_maximum_matching_cover hF
  have hsub : matchingVertices M⊆(peelNeighbors G univ v).erase w := by
    intro x hx
    obtain ⟨e,he,hxe⟩ := mem_biUnion.mp hx
    exact forest_link_edge_active (hM.1.1 e he) hxe
  by_cases hperfect : matchingVertices M=(peelNeighbors G univ v).erase w
  · exact perfect_apex_link_excluded hG hvw hF hM.1 hperfect
  · have hlt := card_lt_card (Finset.ssubset_iff_subset_ne.mpr ⟨hsub,hperfect⟩)
    rw [matchingVertices_card hM.1] at hlt
    exact nonperfect_apex_link_excluded hG hvw hF hM hlt

/-- No minimal CS failure has an actual selected forest covering all triangles. -/
theorem minimal_forest_cover_impossible {G : SimpleGraph V} (hG : MinimalCS G)
    {C : Finset (Finset V)} (hC : ForestCover G C) : False := by
  classical
  obtain ⟨t,ht⟩ := (minimal_cs_package hG).1
  obtain ⟨e,he,_⟩ := hC.1.2 t ht
  obtain ⟨v,w,hleaf⟩ := forestCover_leaf hC ⟨e,he⟩
  have hvw : G.Adj v w := selectedGraph_le_of_actual hC.1.1 hleaf.1
  exact minimal_apex_forest_link_impossible hG hvw (selectedLeaf_link_forest hC hleaf)

/-- Full forest-cover CS, for any finite graph with some actual forest triangle
edge cover. No size, degree, minimum-cover, matching, local reduction, or
unproved compatibility hypothesis remains. General B retains both K4 and K5. -/
theorem forest_cover_cs {G : SimpleGraph V} (hG : HasForestCover G) : CS G := by
  by_contra hbad
  obtain ⟨H,_,⟨C,hC⟩,hmin⟩ := exists_minimal_forest_failure hG hbad
  exact minimal_forest_cover_impossible hmin hC

/-- Direct equality statement retaining the general literal K4/K5 component predicate. -/
theorem forest_cover_equality {G : SimpleGraph V} (hG : HasForestCover G) :
    tau (triangles G)=2*nu (triangles G) ↔ B G := (forest_cover_cs hG).2

end Tuza24
