import Tuza06.FiveCoverage.Group0
import Tuza06.FiveCoverage.Group1
import Tuza06.FiveCoverage.Group2
import Tuza06.FiveCoverage.Group3
import Tuza06.FiveCoverage.Group4
import Tuza06.FiveCoverage.Group5
import Tuza06.FiveCoverage.Group6
import Tuza06.FiveCoverage.Group7
namespace Tuza06.FiveCoverage
open Finset Tuza
set_option maxRecDepth 16000
set_option maxHeartbeats 2000000
/-- Complete kernel-checked eleven-type coverage of all 1024 five-vertex graphs. -/
theorem classify_bits (f : Fin 10 → Bool) (h : Eligible f) :
    ∃ r : Fin 11, ∃ p : Fin 120, Relabel f r p := by
  cases h7 : f 7 <;> cases h8 : f 8 <;> cases h9 : f 9
  · exact Group0.classify f h h7 h8 h9
  · exact Group4.classify f h h7 h8 h9
  · exact Group2.classify f h h7 h8 h9
  · exact Group6.classify f h h7 h8 h9
  · exact Group1.classify f h h7 h8 h9
  · exact Group5.classify f h h7 h8 h9
  · exact Group3.classify f h h7 h8 h9
  · exact Group7.classify f h h7 h8 h9

/-- Every actual minimum-degree-two graph on five vertices is isomorphic to one
of the eleven exact local-link representatives. -/
theorem classify (E : Finset (Finset (Fin 5))) (hE : E ⊆ edges univ)
    (hmin : ∀ a : Fin 5, 2 ≤ ((univ : Finset (Fin 5)).filter (fun b => ({a,b} : Finset (Fin 5)) ∈ E)).card) :
    ∃ r : Fin 11, ∃ p : Fin 120, liftFamily (permutation p).toEmbedding E = representative r := by
  obtain ⟨f, hf⟩ := exists_graph_encoding E hE
  have helig : Eligible f := by
    intro a
    rw [hf]
    exact hmin a
  obtain ⟨r,p,hrel⟩ := classify_bits f helig
  exact ⟨r,p,by simpa only [Relabel,hf] using hrel⟩
end Tuza06.FiveCoverage
#check @Tuza06.FiveCoverage.classify
#print axioms Tuza06.FiveCoverage.classify
