import Tuza07.RigidityIntersecting

namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

theorem opposite_bases_for_disjoint_new {H G : SimpleGraph V} (hHG : H ≤ G)
    (hnu : nu (triangles G) = nu (triangles H) + 1)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K) {k p q e f : Finset V}
    (hk : k ∈ K) (hp : p ∈ newTriangles H G) (hq : q ∈ newTriangles H G)
    (hpc : (edges p ∩ support (triangles H)).card ≤ 1)
    (he : e ∈ edges p ∩ edges k) (hf : f ∈ edges q ∩ edges k)
    (hd : Disjoint (edges p) (edges q)) : Disjoint e f := by
  obtain ⟨g,hg,heg⟩ := disjoint_new_has_opposite_base hHG hnu hK hk hp hq hpc he hd
  have hgf := card_le_one.mp (new_triangle_block_overlap hq (hK.clique k hk)) g hg f hf
  exact hgf ▸ heg

theorem outside_pages_vertex_disjoint {k e f : Finset V} {x y : V}
    (he : e ⊆ k) (hf : f ⊆ k) (hd : Disjoint e f)
    (hx : x ∉ k) (hy : y ∉ k) (hxy : x ≠ y) : Disjoint (insert x e) (insert y f) := by
  apply disjoint_left.mpr
  intro a ha hb
  rcases mem_insert.mp ha with ha|ha <;> rcases mem_insert.mp hb with hb|hb
  · exact hxy (ha.symm.trans hb)
  · exact hx (ha ▸ hf hb)
  · exact hy (hb ▸ he ha)
  · exact disjoint_left.mp hd ha hb

theorem clique_page_representation {k r : Finset V} {z : V}
    (hr : r ∈ cliqueFamily (insert z k) \ cliqueFamily k) :
    ∃ g ∈ edges k, r = insert z g := by
  classical
  have hr3 := (mem_powersetCard.mp (mem_sdiff.mp hr).1).2
  have hrsub := (mem_powersetCard.mp (mem_sdiff.mp hr).1).1
  have hz : z ∈ r := by
    by_contra hz
    apply (mem_sdiff.mp hr).2
    refine mem_powersetCard.mpr ⟨?_,hr3⟩
    intro x hx
    exact (mem_insert.mp (hrsub hx)).resolve_left (fun h => hz (h ▸ hx))
  refine ⟨r.erase z,mem_edges.mpr ⟨?_,?_⟩,(insert_erase hz).symm⟩
  · intro x hx
    exact (mem_insert.mp (hrsub (mem_erase.mp hx).2)).resolve_left (mem_erase.mp hx).1
  · rw [card_erase_of_mem hz,hr3]

theorem page_new_of_clique {H G : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k : Finset V} {z : V}
    (hk : k ∈ K) (hz : z ∉ k) (hclique : G.IsClique ((insert z k : Finset V) : Set V))
    {g : Finset V} (hg : g ∈ edges k) : insert z g ∈ newTriangles H G := by
  classical
  have hzg : z ∉ g := fun h => hz ((mem_edges.mp hg).1 h)
  have hG : insert z g ∈ triangles G := cliqueFamily_subset_triangles hclique
    (mem_powersetCard.mpr ⟨insert_subset_insert _ (mem_edges.mp hg).1,
      by simp [hzg,(mem_edges.mp hg).2]⟩)
  refine mem_newTriangles.mpr ⟨hG,?_⟩
  intro hH
  have hsub := old_triangle_with_block_edge hK hk hH hg
    (mem_edges.mpr ⟨subset_insert _ _,(mem_edges.mp hg).2⟩)
  exact hz (hsub (mem_insert_self _ _))

theorem equality_pair_promotedK4 {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hnu : nu (triangles G) = nu (triangles H) + 1)
    (htau : tau (triangles G) = 2 * nu (triangles H) + 2)
    {p q : Finset V} (hp : p ∈ newTriangles H G) (hq : q ∈ newTriangles H G)
    (hdpq : Disjoint (edges p) (edges q)) : PromotedK4 H G := by
  classical
  obtain ⟨K,hK⟩ := componentCliques_decomposition hH
  obtain ⟨k,hk,hk4,e,he,f,hf,hef⟩ := gain_one_pair_obstruction hHG hnu hK hp hq hdpq
  have hek := (mem_inter.mp he).2
  have hfk := (mem_inter.mp hf).2
  have hekSub := (mem_edges.mp hek).1
  have hfkSub := (mem_edges.mp hfk).1
  have he2 := (mem_edges.mp hek).2
  have hf2 := (mem_edges.mp hfk).2
  have hpc := equality_supported_card hH hHG hnu htau hp
  have hqc := equality_supported_card hH hHG hnu htau hq
  obtain ⟨x,hx,hpx⟩ := new_page_representation (hK.clique k hk) hp he
  obtain ⟨y,hy,hqy⟩ := new_page_representation (hK.clique k hk) hq hf
  have hallbase : ∀ r ∈ newTriangles H G, (edges r ∩ edges k).Nonempty := by
    intro r hr
    by_contra hn
    have hrp : ¬ Disjoint (edges r) (edges p) := by
      intro hd
      obtain ⟨g,hg,_⟩ := disjoint_new_has_opposite_base hHG hnu hK hk hp hr hpc he hd.symm
      exact hn ⟨g,hg⟩
    have hrq : ¬ Disjoint (edges r) (edges q) := by
      intro hd
      obtain ⟨g,hg,_⟩ := disjoint_new_has_opposite_base hHG hnu hK hk hq hr hqc hf hd.symm
      exact hn ⟨g,hg⟩
    rw [hpx] at hrp
    rw [hqy] at hrq
    by_cases hxy : x = y
    · subst y
      exact hn (meeting_common_apex_has_base hekSub hfkSub hef hrp hrq)
    · exact triple_cannot_meet_disjoint (mem_triangles.mp (mem_newTriangles.mp hr).1).card_eq
        (outside_pages_vertex_disjoint hekSub hfkSub hef hx hy hxy) hrp hrq
  have hxy : x = y := by
    by_contra hxy
    have hall : ∀ r ∈ newTriangles H G, e ∈ edges r ∨ f ∈ edges r := by
      intro r hr
      obtain ⟨g,hg⟩ := hallbase r hr
      by_cases hge : g = e
      · exact Or.inl (hge ▸ (mem_inter.mp hg).1)
      by_cases hgf : g = f
      · exact Or.inr (hgf ▸ (mem_inter.mp hg).1)
      obtain ⟨w,hw,hrw⟩ := new_page_representation (hK.clique k hk) hr hg
      have hrp : ¬ Disjoint (edges r) (edges p) := by
        intro hd
        have heg := opposite_bases_for_disjoint_new hHG hnu hK hk hp hr hpc he hg hd.symm
        have hgfe := (opposite_eq_complement hk4 hek (mem_inter.mp hg).2 heg).trans
          (opposite_eq_complement hk4 hek hfk hef).symm
        exact hgf hgfe
      have hrq : ¬ Disjoint (edges r) (edges q) := by
        intro hd
        have hfg := opposite_bases_for_disjoint_new hHG hnu hK hk hq hr hqc hf hg hd.symm
        have hgee := (opposite_eq_complement hk4 hfk (mem_inter.mp hg).2 hfg).trans
          (opposite_eq_complement hk4 hfk hek hef.symm).symm
        exact hge hgee
      rw [hrw,hpx] at hrp
      rw [hrw,hqy] at hrq
      have hxw := ((external_pages_intersect_iff (mem_edges.mp (mem_inter.mp hg).2).2 he2
        (mem_edges.mp (mem_inter.mp hg).2).1 hekSub hw hx).mp hrp).resolve_left hge
      have hyw := ((external_pages_intersect_iff (mem_edges.mp (mem_inter.mp hg).2).2 hf2
        (mem_edges.mp (mem_inter.mp hg).2).1 hfkSub hw hy).mp hrq).resolve_left hgf
      exact (hxy (hxw.1.symm.trans hyw.1)).elim
    obtain ⟨C,hC,_,hcard,hpC,hopp⟩ := selected_block_cover hK hp
    have heC := hpC (mem_inter.mpr ⟨(mem_inter.mp he).1,block_edges_supported hK hk hek⟩)
    have hfC : f ∈ C := (opposite_eq_complement hk4 hek hfk hef).symm ▸ hopp k hk e he hk4
    have hCG : Covers (triangles G) C := by
      intro r hr
      by_cases hrH : r ∈ triangles H
      · exact hC r hrH
      · rcases hall r (mem_newTriangles.mpr ⟨hr,hrH⟩) with her|hfr
        · exact ⟨e,heC,her⟩
        · exact ⟨f,hfC,hfr⟩
    have hbound := tau_le_card hCG
    omega
  subst y
  have hkunion := edges_union_of_opposite hk4 hek hfk hef
  have hspokes : ∀ a ∈ k, G.Adj x a := by
    intro a ha
    have hae : a ∈ e ∪ f := hkunion.symm ▸ ha
    rcases mem_union.mp hae with hae|haf
    · apply (mem_triangles.mp (mem_newTriangles.mp hp).1).isClique
      · rw [hpx]; simp
      · rw [hpx]; exact mem_insert_of_mem hae
      · intro h; exact hx (h.symm ▸ ha)
    · apply (mem_triangles.mp (mem_newTriangles.mp hq).1).isClique
      · rw [hqy]; simp
      · rw [hqy]; exact mem_insert_of_mem haf
      · intro h; exact hx (h.symm ▸ ha)
  have hclique : G.IsClique ((insert x k : Finset V) : Set V) := by
    intro a ha b hb hab
    change a ∈ insert x k at ha
    change b ∈ insert x k at hb
    rcases mem_insert.mp ha with hax|hak <;> rcases mem_insert.mp hb with hbx|hbk
    · exact (hab (hax.trans hbx.symm)).elim
    · exact hax.symm ▸ hspokes b hbk
    · exact hbx.symm ▸ (hspokes a hak).symm
    · exact hHG ((hK.clique k hk) hak hbk hab)
  have hallpages : ∀ r ∈ newTriangles H G, ∃ g ∈ edges k, r = insert x g := by
    intro r hr
    obtain ⟨g,hg⟩ := hallbase r hr
    obtain ⟨w,hw,hrw⟩ := new_page_representation (hK.clique k hk) hr hg
    have hwx : w = x := by
      by_contra hwx
      obtain ⟨a,ha,hag,hagmeet⟩ := incident_other_edge hk4 (mem_inter.mp hg).2
      have hnew := page_new_of_clique hK hk hx hclique ha
      have hdisj : Disjoint (edges r) (edges (insert x a)) := by
        rw [hrw]
        by_contra hi
        rcases (external_pages_intersect_iff (mem_edges.mp (mem_inter.mp hg).2).2
          (mem_edges.mp ha).2 (mem_edges.mp (mem_inter.mp hg).2).1 (mem_edges.mp ha).1 hw hx).mp hi with hga|h
        · exact hag hga.symm
        · exact hwx h.1
      have hga : Disjoint g a := opposite_bases_for_disjoint_new hHG hnu hK hk hr hnew
        (equality_supported_card hH hHG hnu htau hr) hg
        (mem_inter.mpr ⟨mem_edges.mpr ⟨subset_insert _ _,(mem_edges.mp ha).2⟩,ha⟩) hdisj
      exact hagmeet hga
    exact ⟨g,(mem_inter.mp hg).2,by simpa [hwx] using hrw⟩
  have hfamily : newTriangles H G = cliqueFamily (insert x k) \ cliqueFamily k := by
    apply subset_antisymm
    · intro r hr
      obtain ⟨g,hg,rfl⟩ := hallpages r hr
      apply mem_sdiff.mpr
      refine ⟨mem_powersetCard.mpr ⟨insert_subset_insert _ (mem_edges.mp hg).1,?_⟩,?_⟩
      · simp [show x ∉ g from fun h => hx ((mem_edges.mp hg).1 h),(mem_edges.mp hg).2]
      · intro h
        exact hx ((mem_powersetCard.mp h).1 (mem_insert_self _ _))
    · intro r hr
      obtain ⟨g,hg,rfl⟩ := clique_page_representation hr
      exact page_new_of_clique hK hk hx hclique hg
  have hsupport : Disjoint (edges (insert x k) \ edges k) (support (triangles H)) := by
    apply disjoint_left.mpr
    intro a ha haH
    have haK := (mem_sdiff.mp ha).1
    rw [← support_cliqueFamily (show 3 ≤ (insert x k).card by simp [hx,hk4])] at haK
    obtain ⟨r,hr,har⟩ := mem_biUnion.mp haK
    have hrn : r ∈ newTriangles H G := by
      rw [hfamily]
      refine mem_sdiff.mpr ⟨hr,?_⟩
      intro hrk
      exact (mem_sdiff.mp ha).2 (edges_mono (mem_powersetCard.mp hrk).1 har)
    obtain ⟨g,hg,hrg⟩ := hallpages r hrn
    have hgr : g ∈ edges r := by rw [hrg]; exact mem_edges.mpr ⟨subset_insert _ _,(mem_edges.mp hg).2⟩
    have hag := card_le_one.mp (equality_supported_card hH hHG hnu htau hrn) a
      (mem_inter.mpr ⟨har,haH⟩) g (mem_inter.mpr ⟨hgr,block_edges_supported hK hk hg⟩)
    exact (mem_sdiff.mp ha).2 (hag.symm ▸ hg)
  obtain ⟨t,htk,ht3⟩ := exists_subset_card_eq (show 3 ≤ k.card by omega)
  have htF : t ∈ cliqueFamily k := mem_powersetCard.mpr ⟨htk,ht3⟩
  refine ⟨t,cliqueFamily_subset_triangles (hK.clique k hk) htF,k,x,hk4,?_,hx,hfamily,hsupport⟩
  rw [decomposition_component_eq hK hk htF]
  exact support_cliqueFamily (by omega)
end Tuza07
