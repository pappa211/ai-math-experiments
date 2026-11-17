import Tuza24.ForestMatchingDeficiency

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- An A-D forest with a labelled A vertex and all original leaves labelled has
an allowed edge whose endpoints are both unlabelled, provided no allowed edge
has two labelled endpoints. This is the parity argument expressed through a
component invariant, with no ordered-path representation. -/
theorem forest_exposure_safe_edge {G : SimpleGraph V} (hG : G.IsAcyclic)
    (P : V → Prop)
    (hleaf : ∀ x z, G.Adj x z → (∀ t, G.Adj x t → t=z) → P x)
    (hno11 : ∀ a d, Exposable G d → G.Adj a d → ¬(P a ∧ P d))
    {a : V} (ha : a∈exposureNeighbors G) (haP : P a) :
    ∃ x d, G.Adj x d ∧ Exposable G d ∧ ¬P x ∧ ¬P d := by
  classical
  by_contra hnone
  let H := exposureBipartite G
  have hPcover : ∀ {x y}, H.Adj x y → P x ∨ P y := by
    intro x y hxy
    by_contra h
    have hx : ¬P x := fun hx => h (Or.inl hx)
    have hy : ¬P y := fun hy => h (Or.inr hy)
    rcases hxy.2 with hxD|hyD
    · exact hnone ⟨y,x,hxy.1.symm,hxD,hy,hx⟩
    · exact hnone ⟨x,y,hxy.1,hyD,hx,hy⟩
  have hPind : ∀ {x y}, H.Adj x y → ¬(P x ∧ P y) := by
    intro x y hxy hp
    rcases hxy.2 with hxD|hyD
    · exact hno11 y x hxD hxy.1.symm hp.symm
    · exact hno11 x y hyD hxy.1 hp
  have hstep : ∀ {x y}, H.Adj x y →
      (P x ↔ ¬Exposable G x) → (P y ↔ ¬Exposable G y) := by
    intro x y hxy hinv
    have hDc := hxy.2
    have hDi : ¬(Exposable G x ∧ Exposable G y) :=
      fun h => forest_exposable_independent hG h.1 h.2 hxy.1
    have hPc := hPcover hxy
    have hPi := hPind hxy
    tauto
  have hwalk : ∀ {x y}, H.Walk x y →
      (P x ↔ ¬Exposable G x) → (P y ↔ ¬Exposable G y) := by
    intro x y p
    induction p with
    | nil => exact id
    | cons h p ih => exact fun hinv => ih (hstep h hinv)
  have haD : ¬Exposable G a := by
    intro h
    exact disjoint_left.mp (forest_exposure_disjoint hG) (mem_exposureSet.mpr h) ha
  have haInv : P a ↔ ¬Exposable G a := ⟨fun _ => haD,fun _ => haP⟩
  obtain ⟨d,hd,hda⟩ := mem_exposureNeighbors.mp ha
  obtain ⟨x,y,hxy,hx,hy,hdx,hdy,⟨z,hxz,hxleaf⟩,hyleaf⟩ :=
    forest_exposable_two_leaves_bipartite hG hd ⟨a,hda⟩
  have hadH : H.Adj a d := ⟨hda.symm,Or.inr hd⟩
  have hax : H.Reachable a x := hadH.reachable.trans hdx
  obtain ⟨p⟩ := hax
  exact (hwalk p haInv).mp (hleaf x z hxz hxleaf) hx

/-- A safe edge comes with an actual maximum-matching witness containing it. -/
theorem forest_safe_allowed_edge {G : SimpleGraph V} (hG : G.IsAcyclic)
    (P : V → Prop)
    (hleaf : ∀ x z, G.Adj x z → (∀ t, G.Adj x t → t=z) → P x)
    (hno11 : ∀ a d, Exposable G d → G.Adj a d → ¬(P a ∧ P d))
    {a : V} (ha : a∈exposureNeighbors G) (haP : P a) :
    ∃ x d M, MaximumMatching G M ∧ ({x,d}:Finset V)∈M ∧ ¬P x ∧ ¬P d := by
  obtain ⟨x,d,hxd,hd,hxP,hdP⟩ := forest_exposure_safe_edge hG P hleaf hno11 ha haP
  obtain ⟨M,hM,he⟩ := exposable_incident_edge_allowed hG hd hxd
  exact ⟨x,d,M,hM,he,hxP,hdP⟩

/-- In an apex forest with no perfect remainder, a triangular forest edge that
is in no maximum matching has both endpoints in A. -/
theorem forest_unallowed_edge_endpoints_in_A {G : SimpleGraph V}
    (hG : G.IsAcyclic) (hZ : exposureRemainder G=∅) {a b : V}
    (hab : G.Adj a b)
    (hnot : ∀ M, MaximumMatching G M → ({a,b}:Finset V)∉M) :
    a∈exposureNeighbors G ∧ b∈exposureNeighbors G := by
  classical
  have haD : ¬Exposable G a := by
    intro ha
    obtain ⟨M,hM,he⟩ := exposable_incident_edge_allowed hG ha hab.symm
    exact hnot M hM (by simpa [pair_comm] using he)
  have hbD : ¬Exposable G b := by
    intro hb
    obtain ⟨M,hM,he⟩ := exposable_incident_edge_allowed hG hb hab
    exact hnot M hM he
  have hA : ∀ x, ¬Exposable G x → x∈exposureNeighbors G := by
    intro x hx
    by_contra hn
    have hZx := mem_exposureRemainder.mpr ⟨hx,hn⟩
    rw [hZ] at hZx
    simpa using hZx
  exact ⟨hA a haD,hA b hbD⟩

/-- The safe-edge conclusion used in the final nonperfect apex-forest branch:
a maximum matching contains an edge neither of whose endpoints sees the apex. -/
theorem apex_forest_safe_allowed_edge {L : SimpleGraph V} {w : V}
    (hF : (isolate L {w}).IsAcyclic)
    (hleaf : ∀ x z, (isolate L {w}).Adj x z →
      (∀ t, (isolate L {w}).Adj x t → t=z) → L.Adj w x)
    (hZ : exposureRemainder (isolate L {w})=∅)
    (htriangle : ∃ a b, (isolate L {w}).Adj a b ∧ L.Adj w a ∧ L.Adj w b)
    (hnot : ∀ a b, (isolate L {w}).Adj a b → L.Adj w a → L.Adj w b →
      ∀ M, MaximumMatching (isolate L {w}) M → ({a,b}:Finset V)∉M) :
    ∃ a b M, MaximumMatching (isolate L {w}) M ∧ ({a,b}:Finset V)∈M ∧
      ¬L.Adj w a ∧ ¬L.Adj w b := by
  obtain ⟨a,b,hab,hwa,hwb⟩ := htriangle
  have haA := (forest_unallowed_edge_endpoints_in_A hF hZ hab (hnot a b hab hwa hwb)).1
  apply forest_safe_allowed_edge hF (fun x => L.Adj w x) hleaf _ haA hwa
  intro x d hd hxd hboth
  obtain ⟨M,hM,he⟩ := exposable_incident_edge_allowed hF hd hxd
  exact hnot x d hxd hboth.1 hboth.2 M hM he

end Tuza24
