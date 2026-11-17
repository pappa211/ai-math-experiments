import Tuza23.FourSet
import Tuza23.AdjacentRestoration

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Any supported old edge can be required in an old minimum cover. -/
theorem componentCliques_min_cover_containing {H : SimpleGraph V} (hB : B H)
    {e : Finset V} (he : e ∈ support (triangles H)) :
    ∃ C, Covers (triangles H) C ∧ C.card = tau (triangles H) ∧
      C ⊆ support (triangles H) ∧ e ∈ C := by
  classical
  obtain ⟨K, hK⟩ := componentCliques_decomposition hB
  have hfoot : ∀ k ∈ K, ({e} ∩ edges k).card ≤ 1 := by
    intro k _
    simpa only [card_singleton] using card_le_card
      (inter_subset_left : {e} ∩ edges k ⊆ {e})
  obtain ⟨C, hc, hcard, hsub, hcontains⟩ := blocks_min_cover_footprint hK hfoot
  exact ⟨C, hc, hcard, hsub, hcontains (mem_inter.mpr ⟨mem_singleton_self _, he⟩)⟩

/-- Tight insertion of two disjoint nonedges adds a single literal K4 triangle
component, with all actual new triangles included and arbitrary old attachments. -/
theorem disjoint_tight_restoration {H : SimpleGraph V} (hB : B H)
    {a b c d : V} (hab : a ≠ b) (hcd : c ≠ d)
    (hbase : Disjoint ({a,b} : Finset V) {c,d})
    (hnab : ¬ H.Adj a b) (hncd : ¬ H.Adj c d)
    (hnu : nu (triangles (addEdges H {{a,b},{c,d}})) = nu (triangles H) + 1)
    (htau : tau (triangles (addEdges H {{a,b},{c,d}})) = 2 * nu (triangles H) + 2) :
    B (addEdges H {{a,b},{c,d}}) := by
  classical
  let G := addEdges H {{a,b},{c,d}}
  let S : Finset V := {a,b} ∪ {c,d}
  have hS : S.card = 4 := by
    change ({a,b} ∪ {c,d} : Finset V).card = 4
    rw [card_union_of_disjoint hbase]
    simp [hab, hcd]
  have hHG : H ≤ G := le_addEdges _ _
  have hgAB : G.Adj a b := Or.inr ⟨hab, by simp⟩
  have hgCD : G.Adj c d := Or.inr ⟨hcd, by simp⟩
  have heAB : ¬ H.IsNClique 2 ({a,b} : Finset V) := by
    intro h; exact hnab (h.isClique (by simp) (by simp) hab)
  have heCD : ¬ H.IsNClique 2 ({c,d} : Finset V) := by
    intro h; exact hncd (h.isClique (by simp) (by simp) hcd)
  obtain ⟨x, hax, hbx, hbareX⟩ := tight_pair_bare_page hB hab hnab htau
  have htau' : tau (triangles (addEdges H {{c,d},{a,b}})) = 2 * nu (triangles H) + 2 := by
    simpa [pair_comm] using htau
  obtain ⟨y, hcy, hdy, hbareY⟩ := tight_pair_bare_page hB hcd hncd htau'
  have htx : ({a,b,x} : Finset V) ∈ triangles G := triangle_of_adj hgAB (hHG hax) (hHG hbx)
  have hty : ({c,d,y} : Finset V) ∈ triangles G := triangle_of_adj hgCD (hHG hcy) (hHG hdy)
  have hE : ∀ z, H.Adj a z → H.Adj b z → z = c ∨ z = d := by
    intro z haz hbz
    have htz : ({a,b,z} : Finset V) ∈ triangles G := triangle_of_adj hgAB (hHG haz) (hHG hbz)
    have hshare := page_intersects_bare hHG hB hnu (by simp [hab]) heAB htz
      (mem_edges.mpr ⟨by simp, by simp [hab]⟩) hty hbareY
    exact (disjoint_pages_apices hbase haz.ne.symm hbz.ne.symm hcy.ne.symm hdy.ne.symm hshare).1
  have hF : ∀ z, H.Adj c z → H.Adj d z → z = a ∨ z = b := by
    intro z hcz hdz
    have htz : ({c,d,z} : Finset V) ∈ triangles G := triangle_of_adj hgCD (hHG hcz) (hHG hdz)
    have hshare := page_intersects_bare hHG hB hnu (by simp [hcd]) heCD htz
      (mem_edges.mpr ⟨by simp, by simp [hcd]⟩) htx hbareX
    exact (disjoint_pages_apices hbase.symm hcz.ne.symm hdz.ne.symm hax.ne.symm hbx.ne.symm hshare).1
  have hnew : ∀ t ∈ triangles G, t ∉ triangles H → t ⊆ S := by
    intro t ht hold
    rcases pair_new_triangle_cases ht with hone | hone | htwo
    · obtain ⟨z, haz, hbz, rfl⟩ := single_new_triangle_is_page hab hone hold
      rcases hE z haz hbz with rfl | rfl <;> simp [S, insert_subset_iff, singleton_subset_iff]
    · obtain ⟨z, hcz, hdz, rfl⟩ := single_new_triangle_is_page hcd hone hold
      rcases hF z hcz hdz with rfl | rfl <;> simp [S, insert_subset_iff, singleton_subset_iff]
    · exact (no_triangle_two_disjoint_edges (by simp [hab]) (by simp [hcd]) hbase ht htwo.1 htwo.2).elim
  have hclique : G.IsClique (S : Set V) := by
    intro u hu v hv huv
    by_contra hnot
    have hs : ({u,v} : Finset V) ∈ edges S := mem_edges.mpr
      ⟨by simpa only [insert_subset_iff, singleton_subset_iff, mem_coe] using And.intro hu hv, by simp [huv]⟩
    have hmissing : ¬ G.IsNClique 2 ({u,v} : Finset V) := by
      intro hc; exact hnot (hc.isClique (by simp) (by simp) huv)
    obtain ⟨C, hC, hCard⟩ := exists_min_cover (triangles_valid H)
    have hcover : Covers (triangles G) (insert (S \ {u,v}) C) := by
      intro t ht
      by_cases hold : t ∈ triangles H
      · obtain ⟨e, he, het⟩ := hC t hold
        exact ⟨e, mem_insert_of_mem he, het⟩
      · exact ⟨S \ {u,v}, mem_insert_self _ _,
          four_set_triangle_contains_opposite_of_missing hS hs hmissing ht (hnew t ht hold)⟩
    have hup := tau_le_card hcover
    have hsize := card_insert_le (S \ {u,v}) C
    have hbaseEq := componentCliques_equality hB
    change tau (triangles G) = _ at htau
    omega
  have hdisj : Disjoint (edges S) (support (triangles H)) := by
    apply disjoint_left.mpr
    intro s hs hsupp
    obtain ⟨C, hC, hCard, hsub, hsC⟩ := componentCliques_min_cover_containing hB hsupp
    have hcover : Covers (triangles G) (insert (S \ s) C) := by
      intro t ht
      by_cases hold : t ∈ triangles H
      · obtain ⟨e, he, het⟩ := hC t hold
        exact ⟨e, mem_insert_of_mem he, het⟩
      · have htS : t ∈ cliqueFamily S := mem_powersetCard.mpr
          ⟨hnew t ht hold, (mem_triangles.mp ht).card_eq⟩
        obtain ⟨e, he, het⟩ := opposite_pair_covers_four_set hS hs t htS
        rcases mem_insert.mp he with hes | he
        · exact ⟨e, mem_insert_of_mem (by simpa [hes] using hsC), het⟩
        · have heq : e = S \ s := mem_singleton.mp he
          exact ⟨e, by simp [heq], het⟩
    have hup := tau_le_card hcover
    have hsize := card_insert_le (S \ s) C
    have hbaseEq := componentCliques_equality hB
    change tau (triangles G) = _ at htau
    omega
  exact componentCliques_add_disjoint_K4 hHG hB hS hclique hdisj hnew

end Tuza23
