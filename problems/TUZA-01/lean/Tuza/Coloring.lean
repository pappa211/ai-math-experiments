import Tuza.Graph
import Mathlib.Data.Fin.VecNotation

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

def ProperOn (G : SimpleGraph V) (S : Finset V) {n : ℕ} (c : V → Fin n) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, G.Adj a b → c a ≠ c b

def ProperColor (G : SimpleGraph V) {n : ℕ} (c : V → Fin n) : Prop :=
  ∀ a b, G.Adj a b → c a ≠ c b

def edgeLabel4 (e : Finset (Fin 4)) : Fin 3 :=
  if e = {0, 1} ∨ e = {2, 3} then 0
  else if e = {0, 2} ∨ e = {1, 3} then 1 else 2

/-- A finite kernel-checked identity for the three opposite-edge classes of K4. -/
private theorem edgeLabel4_injective :
    ∀ t : Finset (Fin 4), t.card = 3 →
      ∀ e ∈ edges t, ∀ f ∈ edges t, edgeLabel4 e = edgeLabel4 f → e = f := by
  decide

theorem four_color_tripartite {G : SimpleGraph V} {c : V → Fin 4}
    (hc : ProperColor G c) : TriangleTripartite G := by
  classical
  refine ⟨fun e => edgeLabel4 (e.image c), ?_⟩
  intro t ht
  have hi : Set.InjOn c (t : Set V) := by
    intro a ha b hb hab
    by_contra hne
    exact hc a b ((mem_triangles.mp ht).isClique ha hb hne) hab
  have hcard : (t.image c).card = 3 := by
    rw [card_image_iff.mpr hi, (mem_triangles.mp ht).card_eq]
  intro e he f hf heq
  have himg : ∀ d ∈ edges t, d.image c ∈ edges (t.image c) := by
    intro d hd
    refine mem_edges.mpr ⟨image_subset_image (mem_edges.mp hd).1, ?_⟩
    rw [card_image_iff.mpr (hi.mono (mem_edges.mp hd).1), (mem_edges.mp hd).2]
  have hef := edgeLabel4_injective (t.image c) hcard (e.image c) (himg e he)
    (f.image c) (himg f hf) heq
  apply Subset.antisymm
  · intro a ha
    have ham : c a ∈ f.image c := hef ▸ mem_image_of_mem c ha
    obtain ⟨b, hb, hba⟩ := mem_image.mp ham
    have hab := hi ((mem_edges.mp hf).1 hb) ((mem_edges.mp he).1 ha) hba
    exact hab ▸ hb
  · intro a ha
    have ham : c a ∈ e.image c := hef.symm ▸ mem_image_of_mem c ha
    obtain ⟨b, hb, hba⟩ := mem_image.mp ham
    have hab := hi ((mem_edges.mp he).1 hb) ((mem_edges.mp hf).1 ha) hba
    exact hab ▸ hb

def bitAdj4 (bits : Fin 6 → Bool) (a b : Fin 4) : Prop :=
  match a.val, b.val with
  | 0, 1 | 1, 0 => bits 0 = true
  | 0, 2 | 2, 0 => bits 1 = true
  | 0, 3 | 3, 0 => bits 2 = true
  | 1, 2 | 2, 1 => bits 3 = true
  | 1, 3 | 3, 1 => bits 4 = true
  | 2, 3 | 3, 2 => bits 5 = true
  | _, _ => False

instance bitAdj4_decidable (bits : Fin 6 → Bool) (a b : Fin 4) : Decidable (bitAdj4 bits a b) := by
  unfold bitAdj4
  split <;> infer_instance

/-- All 64 simple graphs on four labeled vertices: triangle-free implies two-colorable.
`decide` generates a proof checked by Lean's kernel. -/
private theorem bit_trianglefree_bipartite :
    ∀ bits : Fin 6 → Bool,
    (∀ a b c : Fin 4, ¬ (bitAdj4 bits a b ∧ bitAdj4 bits a c ∧ bitAdj4 bits b c)) →
    ∃ color : Fin 4 → Fin 2, ∀ a b, bitAdj4 bits a b → color a ≠ color b := by
  decide

private theorem four_vertex_trianglefree_bipartite (G : SimpleGraph (Fin 4))
    (ht : ∀ a b c, ¬ (G.Adj a b ∧ G.Adj a c ∧ G.Adj b c)) :
    ∃ color : Fin 4 → Fin 2, ProperColor G color := by
  classical
  let bits : Fin 6 → Bool := ![decide (G.Adj 0 1), decide (G.Adj 0 2),
    decide (G.Adj 0 3), decide (G.Adj 1 2), decide (G.Adj 1 3), decide (G.Adj 2 3)]
  have heq : ∀ a b, bitAdj4 bits a b ↔ G.Adj a b := by
    intro a b
    fin_cases a <;> fin_cases b <;> simp [bitAdj4, bits] <;> exact G.adj_comm _ _
  obtain ⟨color, hc⟩ := bit_trianglefree_bipartite bits (by
    intro a b c
    simpa only [heq] using ht a b c)
  exact ⟨color, fun a b hab => hc a b ((heq a b).mpr hab)⟩

theorem small_trianglefree_bipartite {G : SimpleGraph V} {S : Finset V}
    (hS : S.card ≤ 4)
    (ht : ∀ a ∈ S, ∀ b ∈ S, ∀ c ∈ S, ¬ (G.Adj a b ∧ G.Adj a c ∧ G.Adj b c)) :
    ∃ color : V → Fin 2, ProperOn G S color := by
  classical
  obtain ⟨e⟩ := Function.Embedding.nonempty_of_card_le
    (α := (S : Set V)) (β := Fin 4) (by simpa using hS)
  let J := (G.induce (S : Set V)).map e
  have hj : ∀ a b c, ¬ (J.Adj a b ∧ J.Adj a c ∧ J.Adj b c) := by
    intro a b c ⟨hab, hac, hbc⟩
    obtain ⟨u, v, huv, rfl, rfl⟩ := (SimpleGraph.map_adj e _ _ _).mp hab
    obtain ⟨u', w, huw, huu, rfl⟩ := (SimpleGraph.map_adj e _ _ _).mp hac
    have hu : u' = u := e.injective huu
    subst u'
    obtain ⟨v', w', hvw, hvv, hww⟩ := (SimpleGraph.map_adj e _ _ _).mp hbc
    have hv : v' = v := e.injective hvv
    have hw : w' = w := e.injective hww
    subst v'
    subst w'
    exact ht u u.property v v.property w w.property ⟨huv, huw, hvw⟩
  obtain ⟨color, hc⟩ := four_vertex_trianglefree_bipartite J hj
  let f : V → Fin 2 := fun v => if h : v ∈ S then color (e ⟨v, h⟩) else 0
  refine ⟨f, ?_⟩
  intro a ha b hb hab
  have hmap : J.Adj (e ⟨a, ha⟩) (e ⟨b, hb⟩) :=
    (SimpleGraph.map_adj e _ _ _).mpr ⟨⟨a, ha⟩, ⟨b, hb⟩, hab, rfl, rfl⟩
  simpa [f, ha, hb] using hc _ _ hmap

end Tuza
