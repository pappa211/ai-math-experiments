import Tuza24.LinkAugmentation

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A link vertex in no link triangle cannot share a residual clique with a
vertex-disjoint link edge. -/
theorem no_triangle_vertex_disjoint_edge {G H : SimpleGraph V} (hHG : H≤G)
    {v a : V} (hva : G.Adj v a)
    (hno : ∀ t∈triangles (linkGraph G v),a∉t)
    {e k : Finset V} (he : (linkGraph G v).IsNClique 2 e)
    (hk : H.IsClique (k : Set V)) (hak : a∈k) (hek : e⊆k) (hae : a∉e) : False := by
  obtain ⟨x,y,hxy,rfl⟩ := card_eq_two.mp he.card_eq
  have hax : a≠x := fun h => hae (by simp [h])
  have hay : a≠y := fun h => hae (by simp [h])
  have hxyL := he.isClique (by simp) (by simp) hxy
  have haxL : (linkGraph G v).Adj a x :=
    ⟨hHG (hk hak (hek (by simp)) hax),hva,hxyL.2.1⟩
  have hayL : (linkGraph G v).Adj a y :=
    ⟨hHG (hk hak (hek (by simp)) hay),hva,hxyL.2.2⟩
  exact hno {a,x,y} (triangle_of_adj haxL hayL hxyL) (by simp)

/-- Full-footprint compatibility for an external page with safe link endpoints. -/
theorem safe_external_page_whole_footprint {G : SimpleGraph V} {v w a b z : V}
    (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {Z X : Finset (Finset V)} (hZ : EdgeMatching (linkGraph G v) Z)
    (hab : a≠b) (hbase : ({a,b}:Finset V)∈X) (hva : G.Adj v a) (hvb : G.Adj v b)
    (hnoa : ∀ t∈triangles (linkGraph G v),a∉t)
    (hnob : ∀ t∈triangles (linkGraph G v),b∉t)
    {k : Finset V} (hk : (remove G {v} X).IsClique (k : Set V)) (hkne : k.Nonempty) :
    (support (hubPacking v Z∪{{a,b,z}})∩edges k).card≤2 ∧
      ∃ x : V,∀ e∈support (hubPacking v Z∪{{a,b,z}})∩edges k,x∈e := by
  classical
  let A := Z∩edges k
  let B := edges ({a,b,z}:Finset V)∩edges k
  have hA : A.card≤1 := link_matching_clique_footprint (remove_le G {v} X) hF hZ hk
  have hB : B.card≤1 := deleted_base_page_footprint (H:=remove G {v} X) hab (fun h => h.2.2.2 hbase) hk
  have hcard : ∀ e∈A∪B,e.card=2 := by
    intro e he
    rcases mem_union.mp he with he|he
    · exact (mem_edges.mp (mem_inter.mp he).2).2
    · exact (mem_edges.mp (mem_inter.mp he).2).2
  have hcross : ∀ e∈A,∀ f∈B,¬ Disjoint e f := by
    intro e he f hf hd
    have heL := hZ.1 e (mem_inter.mp he).1
    have hek := (mem_edges.mp (mem_inter.mp he).2).1
    have hfk := (mem_edges.mp (mem_inter.mp hf).2).1
    have hcases := edges_triple a b z (mem_inter.mp hf).1
    simp only [mem_insert,mem_singleton] at hcases
    rcases hcases with rfl|rfl|rfl
    · exact no_triangle_vertex_disjoint_edge (remove_le G {v} X) hva hnoa heL hk
        (hfk (by simp)) hek (fun h => disjoint_left.mp hd h (by simp))
    · exact no_triangle_vertex_disjoint_edge (remove_le G {v} X) hva hnoa heL hk
        (hfk (by simp)) hek (fun h => disjoint_left.mp hd h (by simp))
    · exact no_triangle_vertex_disjoint_edge (remove_le G {v} X) hvb hnob heL hk
        (hfk (by simp)) hek (fun h => disjoint_left.mp hd h (by simp))
  have hn : Nonempty V := by obtain ⟨x,_⟩:=hkne; exact ⟨x⟩
  obtain ⟨hc,x,hx⟩ := two_singleton_edge_families_star hA hB hcard hcross hn
  have hsub := hub_page_surviving_footprint hZ (t:={a,b,z}) hk
  exact ⟨(card_le_card hsub).trans hc,x,fun e he => hx e (hsub he)⟩

/-- Safe external-page augmentation includes arbitrary outside attachments and
checks the matching/page union against each complete residual clique. -/
theorem minimal_safe_external_page_augmentation {G : SimpleGraph V} (hG : MinimalCS G)
    {v w a b z : V} (hF : (isolate (linkGraph G v) {w}).IsAcyclic)
    {M Z : Finset (Finset V)} {Q : Finset V} (hm : LinkMatching G v M Q)
    (hQ : Q.card≤M.card) (hbase : ({a,b}:Finset V)∈M)
    (ht : ({a,b,z}:Finset V)∈triangles G) (hvt : v∉({a,b,z}:Finset V))
    (hnoa : ∀ t∈triangles (linkGraph G v),a∉t)
    (hnob : ∀ t∈triangles (linkGraph G v),b∉t)
    (hZ : EdgeMatching (linkGraph G v) Z) (hcard : M.card≤Z.card)
    (havoid : Disjoint Z (edges ({a,b,z}:Finset V))) : False := by
  classical
  have hab : a≠b := by
    have hc := (hm.edge _ hbase).card_eq
    intro heq
    simp [heq] at hc
  have hva : G.Adj v a := (mem_filter.mp (hm.neighbors _ hbase (by simp))).2
  have hvb : G.Adj v b := (mem_filter.mp (hm.neighbors _ hbase (by simp))).2
  have hp := hub_page_packing hZ ht hvt havoid
  apply minimal_link_augmentation hG hm ⟨{a,b},hbase⟩ hQ hp.1 (by rw [hp.2]; omega)
  intro k hk hkcard
  have hkn : k.Nonempty := card_pos.mp (by rcases hkcard with h|h <;> omega)
  exact safe_external_page_whole_footprint hF hZ hab (mem_union_left _ hbase) hva hvb hnoa hnob hk hkn

end Tuza24
