import Tuza07.Completion
import Tuza06.ExternalPageGeometry

namespace Tuza07
open Finset Tuza Tuza06
variable {V : Type*} [Fintype V] [DecidableEq V]
set_option linter.unusedSectionVars false

theorem equality_supported_card {H G : SimpleGraph V} (hH : ComponentCliques H)
    (hHG : H ≤ G) (hnu : nu (triangles G) = nu (triangles H) + 1)
    (htau : tau (triangles G) = 2 * nu (triangles H) + 2)
    {p : Finset V} (hp : p ∈ newTriangles H G) :
    (edges p ∩ support (triangles H)).card ≤ 1 := by
  by_contra hn
  have hstrict := b1_strict hH hHG hnu ⟨p,hp,by omega⟩
  omega

theorem gain_one_pair_obstruction {H G : SimpleGraph V} (hHG : H ≤ G)
    (hnu : nu (triangles G) = nu (triangles H) + 1)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K) {p q : Finset V}
    (hp : p ∈ newTriangles H G) (hq : q ∈ newTriangles H G)
    (hd : Disjoint (edges p) (edges q)) :
    ∃ k ∈ K, k.card = 4 ∧ ∃ e ∈ edges p ∩ edges k,
      ∃ f ∈ edges q ∩ edges k, Disjoint e f := by
  classical
  have hn : ¬ Compatible K p q := by
    intro hc
    obtain ⟨P,hP,hcard⟩ := compatible_pair_packing hHG hK hp hq hd hc
    have hle := packing_card_le hP
    omega
  simp only [Compatible,not_forall,not_not] at hn
  obtain ⟨k,hk,h4,e,he,f,hf,hd⟩ := hn
  exact ⟨k,hk,h4,e,he,f,hf,hd⟩

theorem block_eq_of_shared_edge {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k l e : Finset V}
    (hk : k ∈ K) (hl : l ∈ K) (hek : e ∈ edges k) (hel : e ∈ edges l) : k = l := by
  by_contra hn
  exact disjoint_left.mp (hK.independent k hk l hl hn) hek hel

theorem old_triangle_with_block_edge {H : SimpleGraph V} {K : Finset (Finset V)}
    (hK : CliqueDecomposition H K) {k q e : Finset V}
    (hk : k ∈ K) (hq : q ∈ triangles H) (hek : e ∈ edges k) (heq : e ∈ edges q) : q ⊆ k := by
  obtain ⟨l,hl,hql⟩ := hK.exhaustive q hq
  have hkl := block_eq_of_shared_edge hK hk hl hek (edges_mono hql heq)
  exact hkl.symm ▸ hql

/-- One supported edge determines the block in every incompatible pairing. -/
theorem disjoint_new_has_opposite_base {H G : SimpleGraph V} (hHG : H ≤ G)
    (hnu : nu (triangles G) = nu (triangles H) + 1)
    {K : Finset (Finset V)} (hK : CliqueDecomposition H K) {k p q e : Finset V}
    (hk : k ∈ K) (hp : p ∈ newTriangles H G) (hq : q ∈ newTriangles H G)
    (hpc : (edges p ∩ support (triangles H)).card ≤ 1)
    (he : e ∈ edges p ∩ edges k) (hd : Disjoint (edges p) (edges q)) :
    ∃ f ∈ edges q ∩ edges k, Disjoint e f := by
  obtain ⟨l,hl,_,a,ha,b,hb,hab⟩ := gain_one_pair_obstruction hHG hnu hK hp hq hd
  have hae : a = e := card_le_one.mp hpc a
    (mem_inter.mpr ⟨(mem_inter.mp ha).1,block_edges_supported hK hl (mem_inter.mp ha).2⟩)
    e (mem_inter.mpr ⟨(mem_inter.mp he).1,block_edges_supported hK hk (mem_inter.mp he).2⟩)
  subst a
  have hkl := block_eq_of_shared_edge hK hk hl (mem_inter.mp he).2 (mem_inter.mp ha).2
  subst l
  exact ⟨b,hb,hab⟩

theorem new_page_representation {H G : SimpleGraph V} {k p e : Finset V}
    (hk : H.IsClique (k : Set V)) (hp : p ∈ newTriangles H G)
    (he : e ∈ edges p ∩ edges k) : ∃ x, x ∉ k ∧ p = insert x e := by
  obtain ⟨x,hxe,hpx⟩ := third_vertex (mem_triangles.mp (mem_newTriangles.mp hp).1).card_eq (mem_inter.mp he).1
  refine ⟨x,?_,hpx⟩
  intro hxk
  apply new_triangle_not_subset_block hp hk
  rw [hpx]
  exact insert_subset hxk (mem_edges.mp (mem_inter.mp he).2).1

theorem edges_union_of_opposite {k e f : Finset V} (hk : k.card = 4)
    (he : e ∈ edges k) (hf : f ∈ edges k) (hd : Disjoint e f) : e ∪ f = k := by
  apply eq_of_subset_of_card_le (union_subset (mem_edges.mp he).1 (mem_edges.mp hf).1)
  rw [card_union_of_disjoint hd,(mem_edges.mp he).2,(mem_edges.mp hf).2,hk]

theorem triple_cannot_meet_disjoint {p q r : Finset V} (hr : r.card = 3)
    (hd : Disjoint p q) (hp : ¬ Disjoint (edges r) (edges p))
    (hq : ¬ Disjoint (edges r) (edges q)) : False := by
  obtain ⟨e,her,hep⟩ := not_disjoint_iff.mp hp
  obtain ⟨f,hfr,hfq⟩ := not_disjoint_iff.mp hq
  have hef := hd.mono (mem_edges.mp hep).1 (mem_edges.mp hfq).1
  have hc := card_le_card (union_subset (mem_edges.mp her).1 (mem_edges.mp hfr).1)
  rw [card_union_of_disjoint hef,(mem_edges.mp her).2,(mem_edges.mp hfr).2,hr] at hc
  omega

theorem meeting_common_apex_has_base {k e f r : Finset V} {z : V}
    (he : e ⊆ k) (hf : f ⊆ k) (hd : Disjoint e f)
    (hrp : ¬ Disjoint (edges r) (edges (insert z e)))
    (hrq : ¬ Disjoint (edges r) (edges (insert z f))) :
    (edges r ∩ edges k).Nonempty := by
  obtain ⟨a,har,hap⟩ := not_disjoint_iff.mp hrp
  obtain ⟨b,hbr,hbq⟩ := not_disjoint_iff.mp hrq
  obtain ⟨u,hua,huz⟩ := exists_mem_ne (by rw [(mem_edges.mp har).2]; decide : 1 < a.card) z
  obtain ⟨v,hvb,hvz⟩ := exists_mem_ne (by rw [(mem_edges.mp hbr).2]; decide : 1 < b.card) z
  have hue : u ∈ e := (mem_insert.mp ((mem_edges.mp hap).1 hua)).resolve_left huz
  have hvf : v ∈ f := (mem_insert.mp ((mem_edges.mp hbq).1 hvb)).resolve_left hvz
  have huv : u ≠ v := by intro h; exact disjoint_left.mp hd hue (h.symm ▸ hvf)
  exact ⟨{u,v},mem_inter.mpr ⟨mem_edges.mpr ⟨by simp only [insert_subset_iff,singleton_subset_iff]; exact ⟨(mem_edges.mp har).1 hua,(mem_edges.mp hbr).1 hvb⟩,by simp [huv]⟩,
    mem_edges.mpr ⟨by simp only [insert_subset_iff,singleton_subset_iff]; exact ⟨he hue,hf hvf⟩,by simp [huv]⟩⟩⟩

theorem incident_other_edge {k e : Finset V} (hk : k.card = 4) (he : e ∈ edges k) :
    ∃ f ∈ edges k, f ≠ e ∧ ¬ Disjoint e f := by
  obtain ⟨a,ha⟩ := card_pos.mp (show 0 < e.card by rw [(mem_edges.mp he).2]; decide)
  obtain ⟨b,hb⟩ := card_pos.mp (show 0 < (k \ e).card by
    rw [card_sdiff_of_subset (mem_edges.mp he).1,hk,(mem_edges.mp he).2]; decide)
  have hab : a ≠ b := by intro h; exact (mem_sdiff.mp hb).2 (h ▸ ha)
  refine ⟨{a,b},mem_edges.mpr ⟨by simp only [insert_subset_iff,singleton_subset_iff]; exact ⟨(mem_edges.mp he).1 ha,(mem_sdiff.mp hb).1⟩,by simp [hab]⟩,?_,?_⟩
  · intro hh
    exact (mem_sdiff.mp hb).2 (hh ▸ (show b ∈ ({a,b}:Finset V) by simp))
  · exact not_disjoint_iff.mpr ⟨a,ha,by simp⟩

/-- A cover using C plus one edge, when C already contains the other cover edge. -/
theorem cover_with_one_more {H G : SimpleGraph V} (hHG : H ≤ G)
    {C : Finset (Finset V)} {e f : Finset V} (hC : Covers (triangles H) C)
    (heC : e ∈ C) (hnew : Covers (newTriangles H G) {e,f}) :
    tau (triangles G) ≤ C.card + 1 := by
  apply (tau_le_card (C:=insert f C) ?_).trans (card_insert_le _ _)
  intro t ht
  by_cases hH : t ∈ triangles H
  · obtain ⟨a,ha,hat⟩ := hC t hH
    exact ⟨a,mem_insert_of_mem ha,hat⟩
  · obtain ⟨a,ha,hat⟩ := hnew t (mem_newTriangles.mpr ⟨ht,hH⟩)
    rcases mem_insert.mp ha with ha|ha
    · exact ⟨e,mem_insert_of_mem heC,ha ▸ hat⟩
    · exact ⟨f,mem_insert_self _ _,(mem_singleton.mp ha) ▸ hat⟩
end Tuza07
