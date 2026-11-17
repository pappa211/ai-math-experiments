import Tuza24.AlternatingForestAllowed

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Retain exactly the edges incident with an exposable vertex. In a forest,
these are precisely the D-A edges. All ambient vertices remain present. -/
def exposureBipartite (G : SimpleGraph V) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ (Exposable G a ∨ Exposable G b)
  symm := ⟨by intro a b h; exact ⟨h.1.symm,h.2.symm⟩⟩
  loopless := ⟨by intro a h; exact G.irrefl h.1⟩

theorem exposureBipartite_le (G : SimpleGraph V) : exposureBipartite G ≤ G :=
  fun _ _ h => h.1

/-- Each nontrivial D-A component has two leaves. The A vertices have at least
two D neighbors, so both component leaves are D vertices and original G leaves.
Reachability places both leaves in the original component of the supplied root. -/
theorem forest_exposable_two_leaves_bipartite {G : SimpleGraph V} (hG : G.IsAcyclic)
    {u : V} (hu : Exposable G u) (hne : ∃ a, G.Adj u a) :
    ∃ x y, x ≠ y ∧ Exposable G x ∧ Exposable G y ∧ (exposureBipartite G).Reachable u x ∧ (exposureBipartite G).Reachable u y ∧
      (∃ z, G.Adj x z ∧ ∀ t, G.Adj x t → t = z) ∧
      (∃ z, G.Adj y z ∧ ∀ t, G.Adj y t → t = z) := by
  classical
  let H := exposureBipartite G
  have hHle : H ≤ G := exposureBipartite_le G
  have hHacy : H.IsAcyclic := hG.anti hHle
  obtain ⟨a,hua⟩ := hne
  have huaH : H.Adj u a := ⟨hua,Or.inl hu⟩
  let C := H.connectedComponentMk u
  have huC : u ∈ C := rfl
  have haC : a ∈ C := C.mem_supp_of_adj_mem_supp huC huaH
  letI : Fintype C := Fintype.ofFinite C
  letI : Nontrivial C := ⟨⟨⟨u,huC⟩,⟨a,haC⟩,fun h => hua.ne (congrArg Subtype.val h)⟩⟩
  obtain ⟨x,y,hxy,hx,hy⟩ := (hHacy.isTree_connectedComponent C).exists_ne_and_degree_eq_one
  have hleaf : ∀ v : C, C.toSimpleGraph.degree v = 1 →
      Exposable G v.val ∧ ∃ z, G.Adj v.val z ∧ ∀ t, G.Adj v.val t → t = z := by
    intro v hv
    obtain ⟨z,hvz,hunique⟩ := SimpleGraph.degree_eq_one_iff_existsUnique_adj.mp hv
    have hvzH : H.Adj v.val z.val := hvz
    have hvD : Exposable G v.val := by
      by_contra hvD
      have hzD : Exposable G z.val := hvzH.2.resolve_left hvD
      have hvA : v.val ∈ exposureNeighbors G := mem_exposureNeighbors.mpr ⟨z.val,hzD,hvzH.1.symm⟩
      obtain ⟨d₁,d₂,hne,hd₁,hd₂,hvd₁,hvd₂⟩ := exposureNeighbors_two_exposable_neighbors hG hvA
      have hvd₁H : H.Adj v.val d₁ := ⟨hvd₁,Or.inr hd₁⟩
      have hvd₂H : H.Adj v.val d₂ := ⟨hvd₂,Or.inr hd₂⟩
      have hd₁C : d₁ ∈ C := C.mem_supp_of_adj_mem_supp v.property hvd₁H
      have hd₂C : d₂ ∈ C := C.mem_supp_of_adj_mem_supp v.property hvd₂H
      have h₁ := congrArg Subtype.val (hunique ⟨d₁,hd₁C⟩ hvd₁H)
      have h₂ := congrArg Subtype.val (hunique ⟨d₂,hd₂C⟩ hvd₂H)
      exact hne (h₁.trans h₂.symm)
    refine ⟨hvD,z.val,hvzH.1,?_⟩
    intro t hvt
    have hvtH : H.Adj v.val t := ⟨hvt,Or.inl hvD⟩
    have htC : t ∈ C := C.mem_supp_of_adj_mem_supp v.property hvtH
    exact congrArg Subtype.val (hunique ⟨t,htC⟩ hvtH)
  obtain ⟨hxD,hxleaf⟩ := hleaf x hx
  obtain ⟨hyD,hyleaf⟩ := hleaf y hy
  refine ⟨x.val,y.val,?_,hxD,hyD,?_,?_,hxleaf,hyleaf⟩
  · exact fun h => hxy (Subtype.ext h)
  · exact (SimpleGraph.ConnectedComponent.exact x.property).symm
  · exact (SimpleGraph.ConnectedComponent.exact y.property).symm

/-- Ordinary-component version of the stronger D-A reachability theorem. -/
theorem forest_exposable_two_leaves {G : SimpleGraph V} (hG : G.IsAcyclic)
    {u : V} (hu : Exposable G u) (hne : ∃ a, G.Adj u a) :
    ∃ x y, x ≠ y ∧ Exposable G x ∧ Exposable G y ∧ G.Reachable u x ∧ G.Reachable u y ∧
      (∃ z, G.Adj x z ∧ ∀ t, G.Adj x t → t = z) ∧
      (∃ z, G.Adj y z ∧ ∀ t, G.Adj y t → t = z) := by
  obtain ⟨x,y,hxy,hx,hy,hux,huy,hxl,hyl⟩ := forest_exposable_two_leaves_bipartite hG hu hne
  exact ⟨x,y,hxy,hx,hy,hux.mono (exposureBipartite_le G),
    huy.mono (exposureBipartite_le G),hxl,hyl⟩

/-- The two-exposable-leaf theorem for a nontrivial finite tree, without any
implicit convention about removed or isolated ambient vertices. -/
theorem tree_exposable_two_leaves {G : SimpleGraph V} [Nontrivial V]
    (hG : G.IsTree) {u : V} (hu : Exposable G u) :
    ∃ x y, x ≠ y ∧ Exposable G x ∧ Exposable G y ∧
      (∃ z, G.Adj x z ∧ ∀ t, G.Adj x t → t = z) ∧
      (∃ z, G.Adj y z ∧ ∀ t, G.Adj y t → t = z) := by
  obtain ⟨x,y,hxy,hx,hy,hux,huy,hxl,hyl⟩ := forest_exposable_two_leaves hG.isAcyclic hu
    (hG.preconnected.exists_adj_of_nontrivial u)
  exact ⟨x,y,hxy,hx,hy,hxl,hyl⟩

end Tuza24
