import Tuza23.GraphAPI

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Closure under actual shared-edge triangle adjacency, not vertex adjacency. -/
def TriangleClosed (G : SimpleGraph V) (F : Finset (Finset V)) : Prop :=
  F ⊆ triangles G ∧ ∀ s ∈ F, ∀ t ∈ triangles G,
    ¬ Disjoint (edges s) (edges t) → t ∈ F

/-- The actual graph formed by supported edges of a triangle family. -/
def supportGraph (G : SimpleGraph V) (F : Finset (Finset V)) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ ({a,b} : Finset V) ∈ support F
  symm := ⟨by intro a b h; exact ⟨h.1.symm, by simpa [pair_comm] using h.2⟩⟩
  loopless := ⟨by intro a h; exact G.irrefl h.1⟩

theorem supportGraph_le (G : SimpleGraph V) (F : Finset (Finset V)) :
    supportGraph G F ≤ G := fun _ _ h => h.1

theorem triangles_supportGraph {G : SimpleGraph V} {F : Finset (Finset V)}
    (hF : TriangleClosed G F) : triangles (supportGraph G F) = F := by
  classical
  apply subset_antisymm
  · intro t ht
    have htG := triangles_mono_graph (supportGraph_le G F) ht
    obtain ⟨a, b, c, hab, hac, hbc, heq⟩ := card_eq_three.mp (mem_triangles.mp ht).card_eq
    have ha : a ∈ t := by rw [heq]; simp
    have hb : b ∈ t := by rw [heq]; simp
    have he := ((mem_triangles.mp ht).isClique ha hb hab).2
    obtain ⟨s, hs, hes⟩ := mem_biUnion.mp he
    apply hF.2 s hs t htG
    intro hd
    exact disjoint_left.mp hd hes
      (mem_edges.mpr ⟨by simpa only [insert_subset_iff, singleton_subset_iff, mem_coe] using And.intro ha hb, by simp [hab]⟩)
  · intro t ht
    refine mem_triangles.mpr ⟨?_, (mem_triangles.mp (hF.1 ht)).card_eq⟩
    intro a ha b hb hab
    refine ⟨(mem_triangles.mp (hF.1 ht)).isClique ha hb hab, ?_⟩
    exact mem_biUnion.mpr ⟨t, ht,
      mem_edges.mpr ⟨by simpa only [insert_subset_iff, singleton_subset_iff, mem_coe] using And.intro ha hb, by simp [hab]⟩⟩

theorem triangleClosed_component (G : SimpleGraph V) (s : Finset V) :
    TriangleClosed G (triangleComponent G s) := by
  classical
  refine ⟨filter_subset _ _, ?_⟩
  intro t ht q hq hshare
  exact mem_filter.mpr ⟨hq, (mem_filter.mp ht).2.tail ⟨(mem_filter.mp ht).1, hq, hshare⟩⟩

theorem triangleClosed_complement {G : SimpleGraph V} {F : Finset (Finset V)}
    (hF : TriangleClosed G F) : TriangleClosed G (triangles G \ F) := by
  classical
  refine ⟨sdiff_subset, ?_⟩
  intro s hs t ht hshare
  refine mem_sdiff.mpr ⟨ht, ?_⟩
  intro htF
  exact (mem_sdiff.mp hs).2 (hF.2 t htF s (mem_sdiff.mp hs).1
    (fun hd => hshare hd.symm))

theorem closed_support_disjoint_complement {G : SimpleGraph V} {F : Finset (Finset V)}
    (hF : TriangleClosed G F) : Disjoint (support F) (support (triangles G \ F)) := by
  classical
  apply disjoint_left.mpr
  intro e heF heR
  obtain ⟨s, hs, hes⟩ := mem_biUnion.mp heF
  obtain ⟨t, ht, het⟩ := mem_biUnion.mp heR
  apply (mem_sdiff.mp ht).2
  apply hF.2 s hs t (mem_sdiff.mp ht).1
  intro hd
  exact disjoint_left.mp hd hes het

theorem triangleConnected_mono {G H : SimpleGraph V} (hHG : H ≤ G)
    {s t : Finset V} (h : TriangleConnected H s t) : TriangleConnected G s t := by
  induction h with
  | refl => exact .refl
  | tail hab hbc ih =>
    exact ih.tail ⟨triangles_mono_graph hHG hbc.1,
      triangles_mono_graph hHG hbc.2.1, hbc.2.2⟩

theorem closed_connected_restrict {G : SimpleGraph V} {F : Finset (Finset V)}
    (hF : TriangleClosed G F) {s t : Finset V} (hs : s ∈ F)
    (h : TriangleConnected G s t) :
    t ∈ F ∧ TriangleConnected (supportGraph G F) s t := by
  induction h with
  | refl => exact ⟨hs, .refl⟩
  | tail hab hbc ih =>
    have htF := hF.2 _ ih.1 _ hbc.2.1 hbc.2.2
    refine ⟨htF, ih.2.tail ⟨?_, ?_, hbc.2.2⟩⟩
    · rw [triangles_supportGraph hF]; exact ih.1
    · rw [triangles_supportGraph hF]; exact htF

theorem closed_component_preserved {G : SimpleGraph V} {F : Finset (Finset V)}
    (hF : TriangleClosed G F) {s : Finset V} (hs : s ∈ F) :
    triangleComponent (supportGraph G F) s = triangleComponent G s := by
  classical
  ext t
  constructor
  · intro ht
    obtain ⟨ht, hconn⟩ := mem_filter.mp ht
    exact mem_filter.mpr ⟨triangles_mono_graph (supportGraph_le G F) ht,
      triangleConnected_mono (supportGraph_le G F) hconn⟩
  · intro ht
    have hconn := closed_connected_restrict hF hs (mem_filter.mp ht).2
    apply mem_filter.mpr
    refine ⟨?_, hconn.2⟩
    rw [triangles_supportGraph hF]
    exact hconn.1

/-- A closed family and its complement assemble the full combined conclusion. -/
theorem good_of_closed_split {G : SimpleGraph V} {F : Finset (Finset V)}
    (hF : TriangleClosed G F)
    (hgoodF : Good (supportGraph G F))
    (hgoodR : Good (supportGraph G (triangles G \ F))) : Good G := by
  classical
  have hR := triangleClosed_complement hF
  have hsplit : triangles G = F ∪ (triangles G \ F) := (union_sdiff_of_subset hF.1).symm
  have hd := closed_support_disjoint_complement hF
  have hvF : Triangles F := triangles_mono hF.1 (triangles_valid G)
  have hvR : Triangles (triangles G \ F) := triangles_mono sdiff_subset (triangles_valid G)
  have hnu : nu (triangles G) = nu F + nu (triangles G \ F) := by
    exact (congrArg nu hsplit).trans (nu_union_eq hvF hd)
  have htau : tau (triangles G) = tau F + tau (triangles G \ F) := by
    exact (congrArg tau hsplit).trans (tau_union_eq hvF hvR hd)
  have hiF : tau F ≤ 2 * nu F := by simpa only [triangles_supportGraph hF] using hgoodF.1
  have hiR : tau (triangles G \ F) ≤ 2 * nu (triangles G \ F) := by
    simpa only [triangles_supportGraph hR] using hgoodR.1
  refine ⟨by omega, ?_⟩
  intro heq
  have heF : tau F = 2 * nu F := by omega
  have heR : tau (triangles G \ F) = 2 * nu (triangles G \ F) := by omega
  have hbF := hgoodF.2 (by simpa only [triangles_supportGraph hF] using heF)
  have hbR := hgoodR.2 (by simpa only [triangles_supportGraph hR] using heR)
  intro t ht
  by_cases htF : t ∈ F
  · have ht' : t ∈ triangles (supportGraph G F) := by rwa [triangles_supportGraph hF]
    obtain ⟨k, hk, hs⟩ := hbF t ht'
    exact ⟨k, hk, by rwa [closed_component_preserved hF htF] at hs⟩
  · have htR : t ∈ triangles G \ F := mem_sdiff.mpr ⟨ht, htF⟩
    have ht' : t ∈ triangles (supportGraph G (triangles G \ F)) := by
      rwa [triangles_supportGraph hR]
    obtain ⟨k, hk, hs⟩ := hbR t ht'
    exact ⟨k, hk, by rwa [closed_component_preserved hR htR] at hs⟩

theorem supportGraph_strict_of_triangle_outside {G : SimpleGraph V}
    {F : Finset (Finset V)} (hF : TriangleClosed G F)
    {t : Finset V} (ht : t ∈ triangles G) (hout : t ∉ F) :
    edgeCount (supportGraph G F) < edgeCount G := by
  classical
  obtain ⟨e, het⟩ := edges_nonempty (s := t) (by rw [(mem_triangles.mp ht).card_eq]; decide)
  have heG : G.IsNClique 2 e := supported_edge_is_graph_edge (mem_biUnion.mpr ⟨t, ht, het⟩)
  apply edgeCount_strict (supportGraph_le G F) heG
  intro heH
  obtain ⟨a, b, hab, heq⟩ := card_eq_two.mp heH.card_eq
  have ha : a ∈ e := by rw [heq]; simp
  have hb : b ∈ e := by rw [heq]; simp
  have heF : e ∈ support F := by
    have hh := (heH.isClique ha hb hab).2
    simpa only [← heq] using hh
  obtain ⟨s, hs, hes⟩ := mem_biUnion.mp heF
  apply hout
  apply hF.2 s hs t ht
  intro hd
  exact disjoint_left.mp hd hes het

/-- Every actual pair of triangles in a minimum CS failure is connected by
shared graph edges. No vertex-connectivity surrogate is used. -/
theorem minimal_triangle_connected {G : SimpleGraph V} (hG : MinimalObstruction G)
    {s t : Finset V} (hs : s ∈ triangles G) (ht : t ∈ triangles G) :
    TriangleConnected G s t := by
  classical
  by_contra hnot
  let F := triangleComponent G s
  have hF : TriangleClosed G F := triangleClosed_component G s
  have hsF : s ∈ F := mem_filter.mpr ⟨hs, .refl⟩
  have htF : t ∉ F := fun h => hnot (mem_filter.mp h).2
  have hproperF := supportGraph_strict_of_triangle_outside hF ht htF
  have hR := triangleClosed_complement hF
  have hsR : s ∉ triangles G \ F := fun h => (mem_sdiff.mp h).2 hsF
  have hproperR := supportGraph_strict_of_triangle_outside hR hs hsR
  have hgoodF := hG.2 _ (supportGraph_le G F) hproperF
  have hgoodR := hG.2 _ (supportGraph_le G (triangles G \ F)) hproperR
  exact hG.1 (good_of_closed_split hF hgoodF hgoodR)

/-- Same finite ambient vertex type; omitted vertices are retained as isolates. -/
def MinimalCS (G : SimpleGraph V) : Prop :=
  ¬ CS G ∧ ∀ H : SimpleGraph V, H < G → CS H

theorem edgeCount_lt_of_lt {G H : SimpleGraph V} (hHG : H < G) :
    edgeCount H < edgeCount G := by
  classical
  have hex : ∃ a b, G.Adj a b ∧ ¬ H.Adj a b := by
    by_contra hn
    apply hHG.ne
    apply le_antisymm hHG.le
    intro a b hab
    by_contra hnot
    exact hn ⟨a, b, hab, hnot⟩
  obtain ⟨a, b, hab, hnot⟩ := hex
  have hne : a ≠ b := G.ne_of_adj hab
  have heG : G.IsNClique 2 ({a,b} : Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair, hne] using hab, by simp [hne]⟩
  apply edgeCount_strict hHG.le heG
  intro heH
  exact hnot (heH.isClique (by simp) (by simp) hne)

theorem minimalCS_iff_minimalObstruction (G : SimpleGraph V) :
    MinimalCS G ↔ MinimalObstruction G := by
  constructor
  · rintro ⟨hbad, hproper⟩
    refine ⟨fun hgood => hbad ((cs_iff_good G).mpr hgood), ?_⟩
    intro H hHG hcount
    apply (cs_iff_good H).mp
    apply hproper H
    apply lt_of_le_of_ne hHG
    intro heq
    subst H
    omega
  · rintro ⟨hbad, hproper⟩
    refine ⟨fun hcs => hbad ((cs_iff_good G).mp hcs), ?_⟩
    intro H hHG
    exact (cs_iff_good H).mpr (hproper H hHG.le (edgeCount_lt_of_lt hHG))

theorem exists_minimal_cs {G : SimpleGraph V} (hbad : ¬ CS G) :
    ∃ H : SimpleGraph V, H ≤ G ∧ MinimalCS H := by
  obtain ⟨H, hHG, hmin⟩ := exists_minimal_obstruction
    (show ¬ Good G from fun h => hbad ((cs_iff_good G).mpr h))
  exact ⟨H, hHG, (minimalCS_iff_minimalObstruction H).mpr hmin⟩

/-- Hereditary classes enter only through this explicit subgraph closure. -/
theorem exists_minimal_cs_in_class (P : SimpleGraph V → Prop)
    (hereditary : ∀ G H, H ≤ G → P G → P H)
    {G : SimpleGraph V} (hPG : P G) (hbad : ¬ CS G) :
    ∃ H : SimpleGraph V, H ≤ G ∧ P H ∧ MinimalCS H := by
  obtain ⟨H, hHG, hmin⟩ := exists_minimal_cs hbad
  exact ⟨H, hHG, hereditary G H hHG hPG, hmin⟩

/-- The class-independent M0 package, conditional solely on actual proper-subgraph CS. -/
theorem minimal_cs_package {G : SimpleGraph V} (hG : MinimalCS G) :
    (triangles G).Nonempty ∧
    (∀ s ∈ triangles G, ∀ t ∈ triangles G, TriangleConnected G s t) ∧
    (∀ e, G.IsNClique 2 e → e ∈ support (triangles G)) ∧
    tau (triangles G) = 2 * nu (triangles G) ∧
    (∀ e, G.IsNClique 2 e →
      nu (triangles (deleteTriangle G e)) = nu (triangles G) ∧
      tau (triangles (deleteTriangle G e)) + 1 = 2 * nu (triangles G)) := by
  classical
  have hm := (minimalCS_iff_minimalObstruction G).mp hG
  have hn : (triangles G).Nonempty := by
    by_contra hnone
    exact hm.1 (triangle_free_good (not_nonempty_iff_eq_empty.mp hnone))
  obtain ⟨t, ht⟩ := hn
  obtain ⟨e, het⟩ := edges_nonempty (s := t) (by rw [(mem_triangles.mp ht).card_eq]; decide)
  have heG : G.IsNClique 2 e := supported_edge_is_graph_edge (mem_biUnion.mpr ⟨t, ht, het⟩)
  have heq := (minimal_tight_critical hm heG).1
  refine ⟨⟨t, ht⟩, ?_, ?_, heq, ?_⟩
  · intro s hs t ht
    exact minimal_triangle_connected hm hs ht
  · intro f hf
    obtain ⟨q, hq, hfq⟩ := minimal_every_edge_in_triangle hm hf
    exact mem_biUnion.mpr ⟨q, hq, hfq⟩
  · intro f hf
    obtain ⟨_, hnu, htau⟩ := minimal_tight_critical hm hf
    exact ⟨hnu, htau.trans heq⟩

end Tuza23
