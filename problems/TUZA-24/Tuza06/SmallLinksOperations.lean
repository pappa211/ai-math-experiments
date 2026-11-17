import Tuza06.SmallLinksBase

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A union of link components: each vertex neighbors v, and no link edge leaves C.
Connectivity is unnecessary for the local deletion arguments. -/
def LinkClosed (G : SimpleGraph V) (v : V) (C : Finset V) : Prop :=
  (∀ a ∈ C, G.Adj v a) ∧ ∀ a ∈ C, ∀ b, G.Adj v b → G.Adj a b → b ∈ C

def spokeEdges (v : V) (C : Finset V) : Finset (Finset V) := C.image (fun a => {v,a})

/-- Deletion of a finite graph-edge family on the same arbitrary vertex type. -/
def removeEdgeFamily (G : SimpleGraph V) (D : Finset (Finset V)) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ ({a,b} : Finset V) ∉ D
  symm := ⟨fun _ _ h => ⟨h.1.symm,by simpa only [pair_comm] using h.2⟩⟩
  loopless := ⟨fun _ h => G.irrefl h.1⟩

theorem removeEdgeFamily_le (G : SimpleGraph V) (D : Finset (Finset V)) :
    removeEdgeFamily G D ≤ G := fun _ _ h => h.1

theorem removeEdgeFamily_lost {G : SimpleGraph V} {D : Finset (Finset V)} {t : Finset V}
    (ht : t ∈ triangles G) (hnot : t ∉ triangles (removeEdgeFamily G D)) :
    ∃ e ∈ D, e ∈ edges t := by
  by_contra hn
  apply hnot
  refine mem_triangles.mpr ⟨?_,(mem_triangles.mp ht).card_eq⟩
  intro a ha b hb hab
  refine ⟨(mem_triangles.mp ht).isClique ha hb hab,?_⟩
  intro heD
  exact hn ⟨{a,b},heD,mem_edges.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff,Finset.mem_coe] using And.intro ha hb,by simp [hab]⟩⟩

theorem removeEdgeFamily_surviving {G : SimpleGraph V} {D : Finset (Finset V)} {t e : Finset V}
    (ht : t ∈ triangles (removeEdgeFamily G D)) (he : e ∈ edges t) : e ∉ D := by
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp (mem_edges.mp he).2
  have ha : a ∈ e := by rw [heq]; simp
  have hb : b ∈ e := by rw [heq]; simp
  have h := ((mem_triangles.mp ht).isClique ((mem_edges.mp he).1 ha)
    ((mem_edges.mp he).1 hb) hab).2
  simpa [heq] using h

theorem removeEdgeFamily_independent {G : SimpleGraph V} {D : Finset (Finset V)}
    {A : Finset V} (hA : edges A ⊆ D) : IndependentVertices (removeEdgeFamily G D) A := by
  intro a ha b hb hadj
  have hab : a ≠ b := G.ne_of_adj hadj.1
  exact hadj.2 (hA (mem_edges.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff,Finset.mem_coe] using And.intro ha hb,by simp [hab]⟩))

theorem removeEdgeFamily_strict {G : SimpleGraph V} {D : Finset (Finset V)}
    {A : Finset V} (hA : G.IsNClique 2 A) (hAD : A ∈ D) :
    edgeCount (removeEdgeFamily G D) < edgeCount G := by
  apply edgeCount_strict (removeEdgeFamily_le G D) hA
  intro hAH
  obtain ⟨a,b,hab,heq⟩ := card_eq_two.mp hA.card_eq
  have ha : a ∈ A := by rw [heq]; simp
  have hb : b ∈ A := by rw [heq]; simp
  exact (hAH.isClique ha hb hab).2 (heq ▸ hAD)

/-- A checked balanced deletion of actual graph edges forces exact residual
equality and hence clique blocks in a minimal combined obstruction. -/
theorem minimal_balanced_removeEdges {G : SimpleGraph V} (hG : MinimalObstruction G)
    {D X P : Finset (Finset V)} {A : Finset V} (hA : G.IsNClique 2 A) (hAD : A ∈ D)
    (hP : Packing (triangles G) P) (hPD : support P ⊆ D)
    (hXcard : X.card ≤ 2 * P.card)
    (hlost : ∀ t ∈ triangles G, t ∈ triangles (removeEdgeFamily G D) ∨
      ∃ e ∈ X, e ∈ edges t) :
    Good (removeEdgeFamily G D) ∧
    nu (triangles G) = nu (triangles (removeEdgeFamily G D)) + P.card ∧
    tau (triangles (removeEdgeFamily G D)) = 2 * nu (triangles (removeEdgeFamily G D)) ∧
    ComponentCliques (removeEdgeFamily G D) := by
  classical
  have hGood := hG.2 _ (removeEdgeFamily_le G D) (removeEdgeFamily_strict hA hAD)
  have hcross : ∀ p ∈ P, ∀ q ∈ triangles (removeEdgeFamily G D),
      Disjoint (edges p) (edges q) := by
    intro p hp q hq
    apply disjoint_left.mpr
    intro e hep heq
    exact removeEdgeFamily_surviving hq heq (hPD (mem_biUnion.mpr ⟨p,hp,hep⟩))
  have hpack := packing_extension (triangles_valid G) (triangles_mono_graph (removeEdgeFamily_le G D)) hP hcross
  have hcover := cover_extension (triangles_valid (removeEdgeFamily G D)) hlost
  have hacct := balanced_accounting (failure_lower_bound hG.1) hGood.1 hpack
    (show tau (triangles G) ≤ tau (triangles (removeEdgeFamily G D)) + 2 * P.card by omega)
  exact ⟨hGood,hacct.2.1,hacct.2.2,hGood.2 hacct.2.2⟩

/-- Partial spoke deletion at one closed link set loses only hub triangles in
its local core. Other link components and arbitrary outside vertices remain. -/
theorem linkClosed_spoke_triangle {G : SimpleGraph V} {v a : V} {C t : Finset V}
    (hC : LinkClosed G v C) (ha : a ∈ C) (ht : t ∈ triangles G)
    (hspoke : ({v,a} : Finset V) ∈ edges t) : t ⊆ insert v C := by
  have hspcard := (mem_edges.mp hspoke).2
  obtain ⟨x,hx,hxt⟩ := third_vertex (mem_triangles.mp ht).card_eq hspoke
  have hvT : v ∈ t := (mem_edges.mp hspoke).1 (by simp)
  have haT : a ∈ t := (mem_edges.mp hspoke).1 (by simp)
  have hxT : x ∈ t := by rw [hxt]; simp
  have hxv : x ≠ v := by intro heq; exact hx (by simp [heq])
  have hxa : x ≠ a := by intro heq; exact hx (by simp [heq])
  have hvx := (mem_triangles.mp ht).isClique hvT hxT hxv.symm
  have hax := (mem_triangles.mp ht).isClique haT hxT hxa.symm
  have hxC := hC.2 a ha x hvx hax
  rw [hxt]
  intro y hy
  simp only [mem_insert,mem_singleton] at hy
  rcases hy with rfl|rfl|rfl
  · exact mem_insert_of_mem hxC
  · exact mem_insert_self _ _
  · exact mem_insert_of_mem ha

end Tuza06
