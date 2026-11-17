import Tuza06.MinimalObstruction

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Vertex/edge deletion used in Puleo's reducible-set framework. -/
def remove (G : SimpleGraph V) (U : Finset V) (X : Finset (Finset V)) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ a ∉ U ∧ b ∉ U ∧ ({a,b} : Finset V) ∉ X
  symm := ⟨fun a b h => ⟨h.1.symm, h.2.2.1, h.2.1, by simpa only [Finset.pair_comm] using h.2.2.2⟩⟩
  loopless := ⟨fun _ h => G.irrefl h.1⟩

theorem remove_le (G : SimpleGraph V) (U : Finset V) (X : Finset (Finset V)) : remove G U X ≤ G :=
  fun _ _ h => h.1

theorem remove_edge_status {G : SimpleGraph V} {U e : Finset V} {X : Finset (Finset V)}
    (he : (remove G U X).IsNClique 2 e) : Disjoint e U ∧ e ∉ X := by
  obtain ⟨a, b, hab, heq⟩ := card_eq_two.mp he.card_eq
  have ha : a ∈ e := by rw [heq]; simp
  have hb : b ∈ e := by rw [heq]; simp
  have hadj := he.isClique ha hb hab
  constructor
  · rw [heq]
    apply disjoint_left.mpr
    intro x hx hxU
    rcases mem_insert.mp hx with rfl | hx
    · exact hadj.2.1 hxU
    · exact hadj.2.2.1 ((mem_singleton.mp hx) ▸ hxU)
  · simpa only [heq] using hadj.2.2.2

theorem remove_triangle_edge_status {G : SimpleGraph V} {U e t : Finset V}
    {X : Finset (Finset V)} (ht : t ∈ triangles (remove G U X)) (het : e ∈ edges t) :
    Disjoint e U ∧ e ∉ X := by
  apply remove_edge_status
  exact ⟨fun _ ha _ hb hab => (mem_triangles.mp ht).isClique
    ((mem_edges.mp het).1 ha) ((mem_edges.mp het).1 hb) hab, (mem_edges.mp het).2⟩

theorem remove_lost_triangle {G : SimpleGraph V} {U t : Finset V}
    {X : Finset (Finset V)} (ht : t ∈ triangles G) (hlost : t ∉ triangles (remove G U X)) :
    (∃ v ∈ U, v ∈ t) ∨ ∃ e ∈ X, e ∈ edges t := by
  by_contra hn
  apply hlost
  refine mem_triangles.mpr ⟨?_, (mem_triangles.mp ht).card_eq⟩
  intro a ha b hb hab
  refine ⟨(mem_triangles.mp ht).isClique ha hb hab, ?_, ?_, ?_⟩
  · intro haU
    exact hn (Or.inl ⟨a, haU, ha⟩)
  · intro hbU
    exact hn (Or.inl ⟨b, hbU, hb⟩)
  · intro habX
    exact hn (Or.inr ⟨{a,b}, habX, mem_edges.mpr
      ⟨by simpa only [insert_subset_iff,singleton_subset_iff,Finset.mem_coe] using And.intro ha hb,
        by simp [hab]⟩⟩)

/-- Actual reducible-set witnesses, credited to Puleo Definition 2.1.
The size inequality is kept separate so balanced and strict reductions share code. -/
structure ReductionWitness (G : SimpleGraph V) (U : Finset V)
    (X P : Finset (Finset V)) : Prop where
  packing : Packing (triangles G) P
  cover_incident : ∀ t ∈ triangles G, (∃ v ∈ U, v ∈ t) → ∃ e ∈ X, e ∈ edges t
  old_edges : ∀ p ∈ P, ∀ e ∈ edges p, Disjoint e U → e ∈ X

theorem reduction_witness_packing {G : SimpleGraph V} {U : Finset V}
    {X P : Finset (Finset V)} (hw : ReductionWitness G U X P) :
    P.card + nu (triangles (remove G U X)) ≤ nu (triangles G) := by
  apply packing_extension (triangles_valid G) (triangles_mono_graph (remove_le G U X)) hw.packing
  intro p hp q hq
  apply disjoint_left.mpr
  intro e hep heq
  have hstatus := remove_triangle_edge_status hq heq
  exact hstatus.2 (hw.old_edges p hp e hep hstatus.1)

theorem reduction_witness_cover {G : SimpleGraph V} {U : Finset V}
    {X P : Finset (Finset V)} (hw : ReductionWitness G U X P) :
    tau (triangles G) ≤ tau (triangles (remove G U X)) + X.card := by
  apply cover_extension (triangles_valid (remove G U X))
  intro t ht
  by_cases hr : t ∈ triangles (remove G U X)
  · exact Or.inl hr
  · rcases remove_lost_triangle ht hr with hU | hX
    · exact Or.inr (hw.cover_incident t ht hU)
    · exact Or.inr hX

theorem reduction_witness_proper {G : SimpleGraph V} {U : Finset V}
    {X P : Finset (Finset V)} (hw : ReductionWitness G U X P) (hP : P.Nonempty) :
    edgeCount (remove G U X) < edgeCount G := by
  obtain ⟨t, ht⟩ := hP
  have htG := mem_triangles.mp (hw.packing.1 ht)
  obtain ⟨e, het⟩ := edges_nonempty (s := t) (by rw [htG.card_eq]; decide)
  have heG : G.IsNClique 2 e := ⟨fun _ ha _ hb hab =>
    htG.isClique ((mem_edges.mp het).1 ha) ((mem_edges.mp het).1 hb) hab, (mem_edges.mp het).2⟩
  apply edgeCount_strict (remove_le G U X) heG
  intro heH
  have hstatus := remove_edge_status heH
  exact hstatus.2 (hw.old_edges t ht e het hstatus.1)

/-- A strict reducible witness is impossible in a minimal combined obstruction. -/
theorem minimal_no_strict_reduction {G : SimpleGraph V} (hG : MinimalObstruction G)
    {U : Finset V} {X P : Finset (Finset V)} (hw : ReductionWitness G U X P)
    (hP : P.Nonempty) (hstrict : X.card < 2 * P.card) : False := by
  have hGood := hG.2 _ (remove_le G U X) (reduction_witness_proper hw hP)
  exact strict_accounting (failure_lower_bound hG.1) hGood.1
    (reduction_witness_packing hw) (reduction_witness_cover hw) hstrict

/-- Balanced reductions force exact residual equality and a PROVED block
classification from the actual minimality hypothesis. -/
theorem minimal_balanced_reduction {G : SimpleGraph V} (hG : MinimalObstruction G)
    {U : Finset V} {X P : Finset (Finset V)} (hw : ReductionWitness G U X P)
    (hP : P.Nonempty) (hbalance : X.card = 2 * P.card) :
    tau (triangles G) = 2 * nu (triangles G) ∧
    nu (triangles G) = nu (triangles (remove G U X)) + P.card ∧
    tau (triangles (remove G U X)) = 2 * nu (triangles (remove G U X)) ∧
    ComponentCliques (remove G U X) := by
  have hGood := hG.2 _ (remove_le G U X) (reduction_witness_proper hw hP)
  have ha := balanced_accounting (failure_lower_bound hG.1) hGood.1
    (reduction_witness_packing hw) (by simpa only [hbalance] using reduction_witness_cover hw)
  exact ⟨ha.1, ha.2.1, ha.2.2, hGood.2 ha.2.2⟩

end Tuza06
