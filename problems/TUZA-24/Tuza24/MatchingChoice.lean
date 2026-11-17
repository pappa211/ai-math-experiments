import Tuza24.ForestMatching

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Choose exactly one endpoint per matching edge while including every marked
vertex, provided at most one vertex on each edge is marked. -/
theorem constrained_matching_vertexCover {L : SimpleGraph V} {M : Finset (Finset V)}
    (hM : EdgeMatching L M) {B : Finset V} (hB : B⊆matchingVertices M)
    (hmark : ∀ e∈M,(e∩B).card≤1) :
    ∃ Q : Finset V,(∀ e∈M,¬ Disjoint e Q) ∧ Q.card=M.card ∧ B⊆Q := by
  classical
  by_cases hMn : M.Nonempty
  · obtain ⟨e0,he0⟩ := hMn
    obtain ⟨x0,_⟩ := card_pos.mp (show 0<e0.card by rw [(hM.1 _ he0).card_eq]; decide)
    have hex : ∀ e : Finset V,∃ x : V,e∈M → x∈e ∧ ∀ y∈e,y∈B → y=x := by
      intro e
      by_cases he : e∈M
      · by_cases hmeet : (e∩B).Nonempty
        · obtain ⟨x,hx⟩ := hmeet
          refine ⟨x,fun _ => ⟨(mem_inter.mp hx).1,?_⟩⟩
          intro y hy hyB
          exact card_le_one.mp (hmark e he) y (mem_inter.mpr ⟨hy,hyB⟩) x hx
        · obtain ⟨x,hx⟩ := card_pos.mp (show 0<e.card by rw [(hM.1 _ he).card_eq]; decide)
          exact ⟨x,fun _ => ⟨hx,fun y hy hyB => (hmeet ⟨y,mem_inter.mpr ⟨hy,hyB⟩⟩).elim⟩⟩
      · exact ⟨x0,fun h => (he h).elim⟩
    choose f hf using hex
    have hinj : Set.InjOn f (M : Set (Finset V)) := by
      intro e he g hg hfg
      by_contra hne
      exact disjoint_left.mp (hM.2 e he g hg hne) (hf e he).1 (hfg.symm ▸ (hf g hg).1)
    refine ⟨M.image f,?_,card_image_iff.mpr hinj,?_⟩
    · intro e he hd
      exact disjoint_left.mp hd (hf e he).1 (mem_image.mpr ⟨e,he,rfl⟩)
    · intro y hy
      obtain ⟨e,he,hye⟩ := mem_biUnion.mp (hB hy)
      exact mem_image.mpr ⟨e,he,((hf e he).2 y hye hy).symm⟩
  · have he : M=∅ := not_nonempty_iff_eq_empty.mp hMn
    subst M
    refine ⟨∅,by simp,by simp,?_⟩
    simpa [matchingVertices] using hB

end Tuza24
