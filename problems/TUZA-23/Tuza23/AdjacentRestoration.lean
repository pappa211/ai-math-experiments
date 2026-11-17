import Tuza23.PageGeometry

namespace Tuza23
open Finset Tuza Tuza06
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

theorem pair_new_triangle_cases {H : SimpleGraph V} {e f t : Finset V}
    (ht : t ∈ triangles (addEdges H {e,f})) :
    t ∈ triangles (addEdges H {e}) ∨ t ∈ triangles (addEdges H {f}) ∨
      (e ∈ edges t ∧ f ∈ edges t) := by
  rcases triangle_pair_insertion_cases ht with h | hf
  · exact Or.inl h
  · have ht' : t ∈ triangles (addEdges H {f,e}) := by simpa [pair_comm] using ht
    rcases triangle_pair_insertion_cases ht' with h | he
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr ⟨he,hf⟩)

theorem two_adjacent_edges_triangle_eq {G : SimpleGraph V} {a b c : V}
    (hab : a≠b) (hac : a≠c) (hbc : b≠c) {t : Finset V}
    (ht : t ∈ triangles G) (he : ({a,b} : Finset V) ∈ edges t)
    (hf : ({a,c} : Finset V) ∈ edges t) : t={a,b,c} := by
  apply Eq.symm
  apply eq_of_subset_of_card_le
  · simp only [insert_subset_iff,singleton_subset_iff]
    exact ⟨(mem_edges.mp he).1 (by simp),(mem_edges.mp he).1 (by simp),
      (mem_edges.mp hf).1 (by simp)⟩
  · rw [(mem_triangles.mp ht).card_eq]
    simp [hab,hac,hbc]

/-- Tightness with a genuinely new triangle cannot survive insertion of two
adjacent nonedges, at any graph order and with all old attachments retained. -/
theorem adjacent_tight_impossible {H : SimpleGraph V} (hB : B H)
    {a b c : V} (hab : a≠b) (hac : a≠c) (hbc : b≠c)
    (hnab : ¬ H.Adj a b) (hnac : ¬ H.Adj a c)
    (hnu : nu (triangles (addEdges H {{a,b},{a,c}})) = nu (triangles H)+1)
    (htau : tau (triangles (addEdges H {{a,b},{a,c}})) = 2*nu (triangles H)+2) : False := by
  classical
  let G := addEdges H {{a,b},{a,c}}
  have hHG : H ≤ G := le_addEdges _ _
  have hgAB : G.Adj a b := Or.inr ⟨hab,by simp⟩
  have hgAC : G.Adj a c := Or.inr ⟨hac,by simp⟩
  have heAB : ¬ H.IsNClique 2 ({a,b} : Finset V) := by
    intro h; exact hnab (h.isClique (by simp) (by simp) hab)
  have heAC : ¬ H.IsNClique 2 ({a,c} : Finset V) := by
    intro h; exact hnac (h.isClique (by simp) (by simp) hac)
  obtain ⟨x,hax,hbx,hbareX⟩ := tight_pair_bare_page hB hab hnab htau
  have htau' : tau (triangles (addEdges H {{a,c},{a,b}})) = 2*nu (triangles H)+2 := by
    simpa [pair_comm] using htau
  obtain ⟨y,hay,hcy,hbareY⟩ := tight_pair_bare_page hB hac hnac htau'
  have htx : ({a,b,x} : Finset V) ∈ triangles G := triangle_of_adj hgAB (hHG hax) (hHG hbx)
  have hty : ({a,c,y} : Finset V) ∈ triangles G := triangle_of_adj hgAC (hHG hay) (hHG hcy)
  have hxy : x=y := adjacent_pages_same_apex hbc hnab hnac hax hbx hay hcy
    (page_intersects_bare hHG hB hnu (by simp [hab]) heAB htx
      (mem_edges.mpr ⟨by simp,by simp [hab]⟩) hty hbareY)
  subst y
  have hE : ∀ z, H.Adj a z → H.Adj b z → z=x := by
    intro z haz hbz
    have htz : ({a,b,z} : Finset V) ∈ triangles G := triangle_of_adj hgAB (hHG haz) (hHG hbz)
    exact adjacent_pages_same_apex hbc hnab hnac haz hbz hay hcy
      (page_intersects_bare hHG hB hnu (by simp [hab]) heAB htz
        (mem_edges.mpr ⟨by simp,by simp [hab]⟩) hty hbareY)
  have hF : ∀ z, H.Adj a z → H.Adj c z → z=x := by
    intro z haz hcz
    have htz : ({a,c,z} : Finset V) ∈ triangles G := triangle_of_adj hgAC (hHG haz) (hHG hcz)
    have hshare := page_intersects_bare hHG hB hnu (by simp [hac]) heAC htz
      (mem_edges.mpr ⟨by simp,by simp [hac]⟩) htx hbareX
    exact (adjacent_pages_same_apex hbc hnab hnac hax hbx haz hcz
      (fun hd => hshare hd.symm)).symm
  have hnbc : ¬ H.Adj b c := by
    intro hbcH
    have htold := triangle_of_adj hbcH hbx hcy
    have hebx : ({b,x} : Finset V) ∈ edges ({a,b,x} : Finset V) :=
      mem_edges.mpr ⟨by simp,by simp [hbx.ne]⟩
    have hesupp : ({b,x} : Finset V) ∈ support (triangles H) :=
      mem_biUnion.mpr ⟨{b,c,x},htold,mem_edges.mpr ⟨by simp,by simp [hbx.ne]⟩⟩
    exact disjoint_left.mp hbareX hebx hesupp
  have hnewHit : ∀ t ∈ triangles G, t ∉ triangles H → ({a,x} : Finset V) ∈ edges t := by
    intro t ht hold
    rcases pair_new_triangle_cases ht with hone | hone | htwo
    · obtain ⟨z,haz,hbz,rfl⟩ := single_new_triangle_is_page hab hone hold
      rw [hE z haz hbz]
      exact mem_edges.mpr ⟨by simp,by simp [hax.ne]⟩
    · obtain ⟨z,haz,hcz,rfl⟩ := single_new_triangle_is_page hac hone hold
      rw [hF z haz hcz]
      exact mem_edges.mpr ⟨by simp,by simp [hax.ne]⟩
    · have htEq := two_adjacent_edges_triangle_eq hab hac hbc ht htwo.1 htwo.2
      have hgBC := (mem_triangles.mp ht).isClique
        (show b ∈ t from by rw [htEq]; simp) (show c ∈ t from by rw [htEq]; simp) hbc
      rcases hgBC with h | ⟨_,h⟩
      · exact (hnbc h).elim
      · have hbca : ({b,c} : Finset V) ≠ {a,b} := by
          intro he; have : a ∈ ({b,c} : Finset V) := he.symm ▸ (by simp : a ∈ ({a,b} : Finset V))
          simp [hab,hac] at this
        have hbcc : ({b,c} : Finset V) ≠ {a,c} := by
          intro he; have : a ∈ ({b,c} : Finset V) := he.symm ▸ (by simp : a ∈ ({a,c} : Finset V))
          simp [hab,hac] at this
        exact (by simpa [hbca,hbcc] using h : False).elim
  obtain ⟨C,hC,hCard⟩ := exists_min_cover (triangles_valid H)
  have hcover : Covers (triangles G) (insert {a,x} C) := by
    intro t ht
    by_cases hold : t ∈ triangles H
    · obtain ⟨e,he,het⟩ := hC t hold
      exact ⟨e,mem_insert_of_mem he,het⟩
    · exact ⟨{a,x},mem_insert_self _ _,hnewHit t ht hold⟩
  have hup := tau_le_card hcover
  have hsize := card_insert_le ({a,x} : Finset V) C
  have hbase := componentCliques_equality hB
  change tau (triangles G) = _ at htau
  omega

end Tuza23
