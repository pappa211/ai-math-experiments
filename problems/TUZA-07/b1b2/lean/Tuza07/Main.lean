import Tuza07.Configurations

namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem b2_classification {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hnu : nu (triangles G) = nu (triangles H) + 1)
    (htau : tau (triangles G) = 2 * nu (triangles H) + 2) :
    NewK4 H G ∨ PromotedK4 H G := by
  classical
  by_cases hi : ∀ p ∈ newTriangles H G, ∀ q ∈ newTriangles H G,
      ¬ Disjoint (edges p) (edges q)
  · exact Or.inl (equality_intersecting_newK4 hH hHG hnu htau hi)
  · simp only [not_forall,not_not] at hi
    obtain ⟨p,hp,q,hq,hd⟩ := hi
    exact Or.inr (equality_pair_promotedK4 hH hHG hnu htau hp hq hd)

theorem b2_full {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hnu : nu (triangles G) = nu (triangles H) + 1)
    (htau : tau (triangles G) = 2 * nu (triangles H) + 2) :
    ComponentCliques G ∧ (NewK4 H G ∨ PromotedK4 H G) := by
  have hc := b2_classification hH hHG hnu htau
  refine ⟨?_,hc⟩
  rcases hc with h|h
  · exact (newK4_consequences hH hHG h).1
  · exact (promotedK4_consequences hH hHG h).1

theorem b2_coarse {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hnu : nu (triangles G) = nu (triangles H) + 1)
    (htau : tau (triangles G) = 2 * nu (triangles H) + 2) : ComponentCliques G :=
  (b2_full hH hHG hnu htau).1

theorem b2_converse {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hc : NewK4 H G ∨ PromotedK4 H G) :
    nu (triangles G) = nu (triangles H) + 1 ∧
    tau (triangles G) = 2 * nu (triangles H) + 2 := by
  rcases hc with h|h
  · exact (newK4_consequences hH hHG h).2
  · exact (promotedK4_consequences hH hHG h).2

theorem configurations_exclusive {H G : SimpleGraph V} :
    ¬ (NewK4 H G ∧ PromotedK4 H G) := by
  classical
  rintro ⟨⟨U,hU,hNU,_⟩,⟨t,ht,B,z,hB,hs,hz,hNB,_⟩⟩
  have h4 : (newTriangles H G).card = 4 := by
    rw [hNU,cliqueFamily,card_powersetCard,hU]
    decide
  have h6 : (newTriangles H G).card = 6 := by
    rw [hNB,card_sdiff_of_subset (show cliqueFamily B ⊆ cliqueFamily (insert z B) from
      fun r hr => mem_powersetCard.mpr ⟨(mem_powersetCard.mp hr).1.trans (subset_insert _ _),(mem_powersetCard.mp hr).2⟩)]
    simp [cliqueFamily,card_powersetCard,hz,hB]
    decide
  omega

/-- These checks inhabit the propositions frozen before proof development. -/
theorem b1_constructive_verified : B1ConstructiveTarget (V:=V) :=
  fun _ _ hH hHG hn => b1_constructive hH hHG hn

theorem b1_gain_verified : B1GainTarget (V:=V) :=
  fun _ _ hH hHG hn => new_triangle_gain_witness hH hHG hn

theorem b1_scalar_verified : B1ScalarTarget (V:=V) :=
  fun _ _ hH hHG hnu => b1_scalar hH hHG hnu

theorem b1_strict_verified : B1StrictTarget (V:=V) :=
  fun _ _ hH hHG hnu hs => b1_strict hH hHG hnu hs

theorem b2_coarse_verified : B2CoarseTarget (V:=V) :=
  fun _ _ hH hHG hnu htau => b2_coarse hH hHG hnu htau

theorem b2_full_verified : B2FullTarget (V:=V) :=
  fun _ _ hH hHG hnu htau => b2_full hH hHG hnu htau

theorem b2_converse_verified : B2ConverseTarget (V:=V) :=
  fun _ _ hH hHG hc => b2_converse hH hHG hc
end Tuza07
