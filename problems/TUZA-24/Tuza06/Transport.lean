import Tuza.Graph
import Mathlib.Data.Fintype.EquivFin

namespace Tuza06
open Finset Tuza
variable {V W : Type*} [DecidableEq V] [DecidableEq W]

def liftFamily (f : V ↪ W) (F : Finset (Finset V)) : Finset (Finset W) :=
  F.map (Finset.mapEmbedding f).toEmbedding

@[simp] theorem mem_liftFamily {f : V ↪ W} {F : Finset (Finset V)} {t : Finset W} :
    t ∈ liftFamily f F ↔ ∃ s ∈ F, s.map f = t := by
  simp [liftFamily]

@[simp] theorem card_liftFamily (f : V ↪ W) (F : Finset (Finset V)) :
    (liftFamily f F).card = F.card := card_map _

@[simp] theorem edges_map (f : V ↪ W) (s : Finset V) :
    edges (s.map f) = liftFamily f (edges s) := powersetCard_map f 2 s

@[simp] theorem liftFamily_disjoint (f : V ↪ W) (F K : Finset (Finset V)) :
    Disjoint (liftFamily f F) (liftFamily f K) ↔ Disjoint F K := disjoint_map _

@[simp] theorem liftFamily_subset (f : V ↪ W) (F K : Finset (Finset V)) :
    liftFamily f F ⊆ liftFamily f K ↔ F ⊆ K := map_subset_map

@[simp] theorem independent_liftFamily (f : V ↪ W) (P : Finset (Finset V)) :
    Independent (liftFamily f P) ↔ Independent P := by
  constructor
  · intro h s hs t ht hst
    have hm := h (s.map f) (mem_liftFamily.mpr ⟨s, hs, rfl⟩)
      (t.map f) (mem_liftFamily.mpr ⟨t, ht, rfl⟩) (fun he => hst (map_inj.mp he))
    simpa using hm
  · intro h s hs t ht hst
    obtain ⟨a, ha, rfl⟩ := mem_liftFamily.mp hs
    obtain ⟨b, hb, rfl⟩ := mem_liftFamily.mp ht
    have hab : a ≠ b := fun he => hst (congrArg (Finset.map f) he)
    simpa using h a ha b hb hab

@[simp] theorem packing_liftFamily (f : V ↪ W) (F P : Finset (Finset V)) :
    Packing (liftFamily f F) (liftFamily f P) ↔ Packing F P := by
  simp [Packing]

@[simp] theorem triangles_liftFamily (f : V ↪ W) (F : Finset (Finset V)) :
    Triangles (liftFamily f F) ↔ Triangles F := by
  simp only [Triangles, mem_liftFamily]
  constructor
  · intro h t ht
    simpa using h (t.map f) ⟨t, ht, rfl⟩
  · rintro h t ⟨s, hs, rfl⟩
    simpa using h s hs

/-- Every subfamily of an injective image can be pulled back, with no finiteness
assumption on the ambient vertex types. -/
theorem subfamily_lift {f : V ↪ W} {F : Finset (Finset V)} {P : Finset (Finset W)}
    (hP : P ⊆ liftFamily f F) : ∃ Q ⊆ F, liftFamily f Q = P := by
  classical
  refine ⟨F.filter (fun t => t.map f ∈ P), filter_subset _ _, ?_⟩
  ext t
  simp only [mem_liftFamily, mem_filter]
  constructor
  · rintro ⟨s, ⟨hs, hp⟩, rfl⟩
    exact hp
  · intro ht
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp (hP ht)
    exact ⟨s, ⟨hs, ht⟩, rfl⟩

@[simp] theorem nu_liftFamily (f : V ↪ W) (F : Finset (Finset V)) :
    nu (liftFamily f F) = nu F := by
  apply le_antisymm
  · obtain ⟨P, hp, hP⟩ := exists_max_packing (liftFamily f F)
    obtain ⟨Q, hQF, rfl⟩ := subfamily_lift hp.1
    have hQ : Packing F Q := ⟨hQF, (independent_liftFamily f Q).mp hp.2⟩
    simpa [← hP] using packing_card_le hQ
  · obtain ⟨P, hp, hP⟩ := exists_max_packing F
    have h := packing_card_le ((packing_liftFamily f F P).mpr hp)
    simpa [hP] using h

@[simp] theorem covers_liftFamily (f : V ↪ W) (F C : Finset (Finset V)) :
    Covers (liftFamily f F) (liftFamily f C) ↔ Covers F C := by
  constructor
  · intro h t ht
    obtain ⟨e, he, het⟩ := h (t.map f) (mem_liftFamily.mpr ⟨t, ht, rfl⟩)
    obtain ⟨a, ha, rfl⟩ := mem_liftFamily.mp he
    have ha' : a ∈ edges t := by
      rw [edges_map] at het
      obtain ⟨b, hb, heq⟩ := mem_liftFamily.mp het
      exact map_inj.mp heq ▸ hb
    exact ⟨a, ha, ha'⟩
  · rintro h t ht
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp ht
    obtain ⟨e, he, het⟩ := h s hs
    exact ⟨e.map f, mem_liftFamily.mpr ⟨e, he, rfl⟩,
      (edges_map f s).symm ▸ mem_liftFamily.mpr ⟨e, het, rfl⟩⟩

@[simp] theorem support_liftFamily (f : V ↪ W) (F : Finset (Finset V)) :
    support (liftFamily f F) = liftFamily f (support F) := by
  classical
  ext e
  simp only [support, mem_biUnion, mem_liftFamily]
  constructor
  · rintro ⟨t, ⟨s, hs, rfl⟩, het⟩
    rw [edges_map] at het
    obtain ⟨a, ha, rfl⟩ := mem_liftFamily.mp het
    exact ⟨a, ⟨s, hs, ha⟩, rfl⟩
  · rintro ⟨a, ⟨s, hs, ha⟩, rfl⟩
    exact ⟨s.map f, ⟨s, hs, rfl⟩,
      (edges_map f s).symm ▸ mem_liftFamily.mpr ⟨a, ha, rfl⟩⟩

@[simp] theorem tau_liftFamily (f : V ↪ W) {F : Finset (Finset V)} (hf : Triangles F) :
    tau (liftFamily f F) = tau F := by
  apply le_antisymm
  · obtain ⟨C, hc, hC⟩ := exists_min_cover hf
    have h := tau_le_card ((covers_liftFamily f F C).mpr hc)
    simpa [hC] using h
  · obtain ⟨C, hc, hC, hs⟩ := exists_min_cover_supported ((triangles_liftFamily f F).mpr hf)
    rw [support_liftFamily] at hs
    obtain ⟨D, _, rfl⟩ := subfamily_lift hs
    have h := tau_le_card ((covers_liftFamily f F D).mp hc)
    simpa [← hC] using h

/-- Enumerate an arbitrary finite vertex set without identifying it with all vertices. -/
theorem exists_fin_embedding (k : Finset V) {n : ℕ} (hk : k.card = n) :
    ∃ f : Fin n ↪ V, (univ : Finset (Fin n)).map f = k := by
  classical
  let e := (k.equivFinOfCardEq hk).symm
  let f : Fin n ↪ V := e.toEmbedding.trans (Function.Embedding.subtype _)
  refine ⟨f, ?_⟩
  ext v
  simp only [mem_map, mem_univ, true_and]
  constructor
  · rintro ⟨i, rfl⟩
    exact (e i).property
  · intro hv
    refine ⟨e.symm ⟨v, hv⟩, ?_⟩
    change (e (e.symm ⟨v, hv⟩)).val = v
    simp

end Tuza06
