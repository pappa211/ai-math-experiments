import Tuza06.LowNeighborStructure
import Tuza06.OverlapTools

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
set_option maxRecDepth 8000
set_option maxHeartbeats 1800000
variable {V : Type*} [Fintype V] [DecidableEq V]

def threeNx : Finset (Fin 9) := {2,3,4,5,6}
def threeNy : Finset (Fin 9) := {2,3,4,7,8}
def orderedNine (x y a b c p q r s : V) : Fin 9 → V := ![x,y,a,b,c,p,q,r,s]

private theorem orderedNine_image (x y a b c p q r s : V) :
    (univ : Finset (Fin 9)).image (orderedNine x y a b c p q r s) =
      {x,y,a,b,c,p,q,r,s} := by
  ext z
  constructor
  · rintro hz
    obtain ⟨k,hk,rfl⟩ := mem_image.mp hz
    fin_cases k <;> simp [orderedNine]
  · intro hz
    simp only [mem_insert,mem_singleton] at hz
    rcases hz with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl
    · exact mem_image.mpr ⟨0,mem_univ _,rfl⟩
    · exact mem_image.mpr ⟨1,mem_univ _,rfl⟩
    · exact mem_image.mpr ⟨2,mem_univ _,rfl⟩
    · exact mem_image.mpr ⟨3,mem_univ _,rfl⟩
    · exact mem_image.mpr ⟨4,mem_univ _,rfl⟩
    · exact mem_image.mpr ⟨5,mem_univ _,rfl⟩
    · exact mem_image.mpr ⟨6,mem_univ _,rfl⟩
    · exact mem_image.mpr ⟨7,mem_univ _,rfl⟩
    · exact mem_image.mpr ⟨8,mem_univ _,rfl⟩

/-- An arbitrary pair with exactly three common neighbors admits the actual
nine-vertex ordinary Section 7 labeling. No cross-private edges are prescribed. -/
theorem three_common_actual_labeling {G : SimpleGraph V} {x y : V}
    (hx : degreeWithin G univ x = 5) (hy : degreeWithin G univ y = 5)
    (hne : x ≠ y) (hxy : ¬ G.Adj x y)
    (hC : (peelNeighbors G univ x ∩ peelNeighbors G univ y).card = 3) :
    ∃ i : Fin 9 ↪ V, i 0 = x ∧ i 1 = y ∧
      peelNeighbors G univ x = threeNx.map i ∧
      peelNeighbors G univ y = threeNy.map i := by
  classical
  let Nx := peelNeighbors G univ x
  let Ny := peelNeighbors G univ y
  let C := Nx ∩ Ny
  let P := Nx \ Ny
  let Q := Ny \ Nx
  have hCc : C.card = 3 := hC
  have hxc : Nx.card = 5 := hx
  have hyc : Ny.card = 5 := hy
  have hPc : P.card = 2 := by
    have h := card_sdiff_add_card_inter Nx Ny
    change P.card + C.card = Nx.card at h
    omega
  have hQc : Q.card = 2 := by
    have h := card_sdiff_add_card_inter Ny Nx
    rw [inter_comm Ny Nx] at h
    change Q.card + C.card = Ny.card at h
    omega
  obtain ⟨a,b,c,hab,hac,hbc,hCeq⟩ := card_eq_three.mp hCc
  obtain ⟨p,q,hpq,hPeq⟩ := card_eq_two.mp hPc
  obtain ⟨r,s,hrs,hQeq⟩ := card_eq_two.mp hQc
  have hCP : Disjoint C P := by
    apply disjoint_left.mpr
    intro z hz hzP
    exact (mem_sdiff.mp hzP).2 (mem_inter.mp hz).2
  have hCQ : Disjoint C Q := by
    apply disjoint_left.mpr
    intro z hz hzQ
    exact (mem_sdiff.mp hzQ).2 (mem_inter.mp hz).1
  have hPQ : Disjoint P Q := by
    apply disjoint_left.mpr
    intro z hzP hzQ
    exact (mem_sdiff.mp hzP).2 (mem_sdiff.mp hzQ).1
  have hDcard : (C ∪ P ∪ Q).card = 7 := by
    rw [card_union_of_disjoint (disjoint_union_left.mpr ⟨hCQ,hPQ⟩),card_union_of_disjoint hCP,hCc,hPc,hQc]
  have hDsub : C ∪ P ∪ Q ⊆ Nx ∪ Ny := by
    intro z hz
    rcases mem_union.mp hz with hz|hz
    · rcases mem_union.mp hz with hz|hz
      · exact mem_union_left _ (mem_inter.mp hz).1
      · exact mem_union_left _ (mem_sdiff.mp hz).1
    · exact mem_union_right _ (mem_sdiff.mp hz).1
  have hxNot : x ∉ C ∪ P ∪ Q := by
    intro hz
    rcases mem_union.mp (hDsub hz) with hz|hz
    · exact G.irrefl (mem_filter.mp hz).2
    · exact hxy (mem_filter.mp hz).2.symm
  have hyNot : y ∉ C ∪ P ∪ Q := by
    intro hz
    rcases mem_union.mp (hDsub hz) with hz|hz
    · exact hxy (mem_filter.mp hz).2
    · exact G.irrefl (mem_filter.mp hz).2
  have hBcard : (insert x (insert y (C ∪ P ∪ Q))).card = 9 := by
    rw [card_insert_of_notMem (by simpa only [mem_insert] using not_or_intro hne hxNot),
      card_insert_of_notMem hyNot,hDcard]
  let f := orderedNine x y a b c p q r s
  have himage : (univ : Finset (Fin 9)).image f = insert x (insert y (C ∪ P ∪ Q)) := by
    rw [orderedNine_image,hCeq,hPeq,hQeq]
    ext z
    simp only [mem_insert,mem_singleton,mem_union]
    tauto
  have hInjective : Function.Injective f := by
    have hc : ((univ : Finset (Fin 9)).image f).card = (univ : Finset (Fin 9)).card := by
      rw [himage,hBcard]
      rfl
    have hinj := card_image_iff.mp hc
    exact fun u v huv => hinj (mem_univ _) (mem_univ _) huv
  let i : Fin 9 ↪ V := ⟨f,hInjective⟩
  have hNx : Nx = C ∪ P := by
    ext z
    simp only [C,P,mem_inter,mem_sdiff,mem_union]
    tauto
  have hNy : Ny = C ∪ Q := by
    ext z
    simp only [C,Q,mem_inter,mem_sdiff,mem_union]
    tauto
  refine ⟨i,rfl,rfl,?_,?_⟩
  · change Nx = _
    rw [hNx,hCeq,hPeq]
    simp only [threeNx,map_insert,map_singleton]
    change {a,b,c} ∪ {p,q} = {a,b,c,p,q}
    ext z; simp only [mem_insert,mem_singleton,mem_union];tauto
  · change Ny = _
    rw [hNy,hCeq,hQeq]
    simp only [threeNy,map_insert,map_singleton]
    change {a,b,c} ∪ {r,s} = {a,b,c,r,s}
    ext z; simp only [mem_insert,mem_singleton,mem_union];tauto

end Tuza06
