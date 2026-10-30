import Tuza06.SparseLinksK23Page
import Tuza06.SparseLinksC5Page

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

def fiveLinkNeighbors : Finset (Fin 6) := {1,2,3,4,5}
def sixIntoSeven : Fin 6 ↪ Fin 7 := ⟨Fin.castSucc,Fin.castSucc_injective 6⟩

/-- Exact five-neighbor configuration; no restrictions apply elsewhere in G. -/
structure FiveLinkConfiguration (G : SimpleGraph V) (i : Fin 6 ↪ V)
    (E : Finset (Finset (Fin 6))) : Prop where
  neighborhood : peelNeighbors G univ (i 0) = fiveLinkNeighbors.map i
  core_edges : ∀ a b : Fin 6, G.Adj (i a) (i b) ↔ ({a,b} : Finset (Fin 6)) ∈ E

/-- Extend any finite embedding by one genuinely outside vertex. -/
def extendFiniteEmbedding {n : ℕ} (i : Fin n ↪ V) (x : V) (hx : ∀ a, i a ≠ x) : Fin (n+1) ↪ V where
  toFun a := if h : a.val < n then i ⟨a.val,h⟩ else x
  inj' := by
    intro a b h
    by_cases ha : a.val < n
    · by_cases hb : b.val < n
      · have h' : i ⟨a.val,ha⟩ = i ⟨b.val,hb⟩ := by simpa only [dif_pos ha,dif_pos hb] using h
        exact Fin.ext (congrArg (fun z : Fin n => z.val) (i.injective h'))
      · have h' : i ⟨a.val,ha⟩ = x := by simpa only [dif_pos ha,dif_neg hb] using h
        exact (hx _ h').elim
    · by_cases hb : b.val < n
      · have h' : x = i ⟨b.val,hb⟩ := by simpa only [dif_neg ha,dif_pos hb] using h
        exact (hx _ h'.symm).elim
      · apply Fin.ext
        have ha' := a.isLt
        have hb' := b.isLt
        omega

@[simp] theorem extendFiniteEmbedding_old {n : ℕ} (i : Fin n ↪ V) (x : V) (hx : ∀ a, i a ≠ x) (a : Fin n) :
    extendFiniteEmbedding i x hx a.castSucc = i a := by
  change (if h : a.val < n then i ⟨a.val,h⟩ else x) = i a
  rw [dif_pos a.isLt]

@[simp] theorem extendFiniteEmbedding_last {n : ℕ} (i : Fin n ↪ V) (x : V) (hx : ∀ a, i a ≠ x) :
    extendFiniteEmbedding i x hx (Fin.last n) = x := by
  change (if h : n < n then i ⟨n,h⟩ else x) = x
  simp

theorem liftFamily_union {I J : Type*} [DecidableEq I] [DecidableEq J]
    (i : I ↪ J) (F K : Finset (Finset I)) : liftFamily i (F ∪ K) = liftFamily i F ∪ liftFamily i K := by
  ext t
  simp only [mem_liftFamily,mem_union]
  constructor
  · rintro ⟨s,hs|hs,rfl⟩
    · exact Or.inl ⟨s,hs,rfl⟩
    · exact Or.inr ⟨s,hs,rfl⟩
  · rintro (⟨s,hs,rfl⟩|⟨s,hs,rfl⟩)
    · exact ⟨s,Or.inl hs,rfl⟩
    · exact ⟨s,Or.inr hs,rfl⟩

theorem liftFamily_comp {I J W : Type*} [DecidableEq I] [DecidableEq J] [DecidableEq W]
    (i : I ↪ J) (j : J ↪ W) (F : Finset (Finset I)) :
    liftFamily j (liftFamily i F) = liftFamily (i.trans j) F := by
  ext t
  simp only [mem_liftFamily]
  constructor
  · rintro ⟨s,⟨r,hr,rfl⟩,rfl⟩
    exact ⟨r,hr,by simp [Finset.map_map]⟩
  · rintro ⟨r,hr,rfl⟩
    exact ⟨r.map i,⟨r,hr,rfl⟩,by simp [Finset.map_map]⟩

theorem extended_six_composition (i : Fin 6 ↪ V) (x : V) (hx : ∀ a, i a ≠ x) :
    sixIntoSeven.trans (extendFiniteEmbedding i x hx) = i := by
  ext a
  exact extendFiniteEmbedding_old i x hx a

theorem core_mapped_edge {G : SimpleGraph V} {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))}
    (hr : FiveLinkConfiguration G i E) {e : Finset (Fin 6)} (he2 : e.card = 2) (heE : e ∈ E) :
    G.IsNClique 2 (e.map i) := by
  obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp he2
  have habG := (hr.core_edges a b).mpr heE
  refine ⟨?_,by simp [hab]⟩
  simpa only [map_insert,map_singleton,Finset.coe_pair] using
    (SimpleGraph.isClique_pair (G := G) (a := i a) (b := i b)).mpr (fun _ => habG)

def coreFamily (E : Finset (Finset (Fin 6))) : Finset (Finset (Fin 6)) :=
  univ.powersetCard 3 |>.filter (fun t => edges t ⊆ E)

theorem core_triangle_iff {G : SimpleGraph V} {i : Fin 6 ↪ V} {E : Finset (Finset (Fin 6))}
    (hr : FiveLinkConfiguration G i E) (t : Finset (Fin 6)) :
    t.map i ∈ triangles G ↔ t ∈ coreFamily E := by
  constructor
  · intro ht
    refine mem_filter.mpr ⟨mem_powersetCard.mpr ⟨subset_univ _,by simpa using (mem_triangles.mp ht).card_eq⟩,?_⟩
    intro e he
    obtain ⟨a,b,hab,rfl⟩ := card_eq_two.mp (mem_edges.mp he).2
    apply (hr.core_edges a b).mp
    exact (mem_triangles.mp ht).isClique
      (mem_map.mpr ⟨a,(mem_edges.mp he).1 (by simp),rfl⟩)
      (mem_map.mpr ⟨b,(mem_edges.mp he).1 (by simp),rfl⟩)
      (fun h => hab (i.injective h))
  · intro ht
    refine mem_triangles.mpr ⟨?_,by simpa using (mem_powersetCard.mp (mem_filter.mp ht).1).2⟩
    intro a ha b hb hab
    obtain ⟨x,hx,rfl⟩ := mem_map.mp ha
    obtain ⟨y,hy,rfl⟩ := mem_map.mp hb
    apply (hr.core_edges x y).mpr
    exact (mem_filter.mp ht).2 (mem_edges.mpr
      ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hx hy,
        by simp [show x ≠ y from fun h => hab (congrArg i h)]⟩)

theorem pullback_core_subset (i : Fin 6 ↪ V) {t : Finset V} (ht : t ⊆ (univ : Finset (Fin 6)).map i) :
    ∃ s : Finset (Fin 6), s.map i = t := by
  classical
  refine ⟨univ.filter (fun x => i x ∈ t),?_⟩
  ext v
  simp only [mem_map,mem_filter,mem_univ,true_and]
  constructor
  · rintro ⟨x,hx,rfl⟩; exact hx
  · intro hv
    obtain ⟨x,_,rfl⟩ := mem_map.mp (ht hv)
    exact ⟨x,hv,rfl⟩

end Tuza06
