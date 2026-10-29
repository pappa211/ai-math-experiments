import Tuza.Lifting

namespace Tuza
open Finset
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Delete the specified graph edges, represented as unordered vertex pairs. -/
def deleteEdges (G : SimpleGraph V) (A : Finset (Finset V)) : SimpleGraph V where
  Adj a b := G.Adj a b ∧ ({a, b} : Finset V) ∉ A
  symm := ⟨fun _ _ h => ⟨h.1.symm, by simpa [pair_comm] using h.2⟩⟩
  loopless := ⟨fun _ h => G.irrefl h.1⟩

theorem deleteEdges_le (G : SimpleGraph V) (A : Finset (Finset V)) :
    deleteEdges G A ≤ G := fun _ _ h => h.1

theorem tripartite_mono {G H : SimpleGraph V} (h : H ≤ G)
    (ht : TriangleTripartite G) : TriangleTripartite H := by
  obtain ⟨c, hc⟩ := ht
  exact ⟨c, fun t hT => hc t (triangles_mono_graph h hT)⟩

theorem deleted_pair_not_in_triangle {G : SimpleGraph V} {A : Finset (Finset V)}
    {t e : Finset V} (ht : t ∈ triangles (deleteEdges G A)) (he : e ∈ A) :
    e ∉ edges t := by
  intro het
  obtain ⟨a, b, hab, rfl⟩ := card_eq_two.mp (mem_edges.mp het).2
  exact ((mem_triangles.mp ht).isClique
    ((mem_edges.mp het).1 (by simp)) ((mem_edges.mp het).1 (by simp)) hab).2 he

theorem lost_has_deleted_edge {G : SimpleGraph V} {A : Finset (Finset V)}
    {t : Finset V} (ht : t ∈ triangles G)
    (hl : t ∉ triangles (deleteEdges G A)) : ∃ e ∈ A, e ∈ edges t := by
  by_contra hn
  apply hl
  apply mem_triangles.mpr
  refine ⟨?_, (mem_triangles.mp ht).card_eq⟩
  intro a ha b hb hab
  refine ⟨(mem_triangles.mp ht).isClique ha hb hab, ?_⟩
  intro he
  exact hn ⟨{a,b}, he, mem_edges.mpr ⟨by
    intro v hv
    rcases mem_insert.mp hv with rfl | hv
    · exact ha
    · exact (mem_singleton.mp hv) ▸ hb, by simp [hab]⟩⟩

/-- The precise local boundary hypothesis: uniqueness is only at actual P--outside edges. -/
structure ClosedBoundary (H : SimpleGraph V) (U P : Finset V)
    (A : Finset (Finset V)) : Prop where
  disjoint : Disjoint U P
  independentU : IndependentVertices H U
  independentP : IndependentVertices H P
  deleted : ∀ e ∈ A, ∃ u ∈ U, ∃ p ∈ P, H.Adj u p ∧ e = {u,p}
  unique : ∀ p ∈ P, ∀ x, x ∉ U ∪ P → H.Adj p x →
    ∀ u ∈ U, ∀ t ∈ U, H.Adj p u → H.Adj x u →
      H.Adj p t → H.Adj x t → u = t

theorem closed_lost_triangle {H : SimpleGraph V} {U P : Finset V}
    {A : Finset (Finset V)} (hb : ClosedBoundary H U P A)
    {t : Finset V} (ht : t ∈ triangles H)
    (hl : t ∉ triangles (deleteEdges H A)) :
    ∃ u ∈ U, ∃ p ∈ P, ∃ x, x ∉ U ∪ P ∧ t = {u,p,x} ∧
      ({u,p} : Finset V) ∈ A ∧ H.Adj u p ∧ H.Adj u x ∧ H.Adj p x := by
  obtain ⟨e, heA, het⟩ := lost_has_deleted_edge ht hl
  obtain ⟨u, hu, p, hp, hup, rfl⟩ := hb.deleted e heA
  obtain ⟨x, hxe, htx⟩ := third_vertex (mem_triangles.mp ht).card_eq het
  have huT : u ∈ t := (mem_edges.mp het).1 (by simp)
  have hpT : p ∈ t := (mem_edges.mp het).1 (by simp)
  have hxT : x ∈ t := by rw [htx]; simp
  have hxu : x ≠ u := by intro he; apply hxe; simp [he]
  have hxp : x ≠ p := by intro he; apply hxe; simp [he]
  have hux := (mem_triangles.mp ht).isClique huT hxT hxu.symm
  have hpx := (mem_triangles.mp ht).isClique hpT hxT hxp.symm
  have hxW : x ∉ U ∪ P := by
    intro hx
    rcases mem_union.mp hx with hx | hx
    · exact hb.independentU u hu x hx hux
    · exact hb.independentP p hp x hx hpx
  refine ⟨u,hu,p,hp,x,hxW,?_,heA,hup,hux,hpx⟩
  rw [htx]
  ext y
  simp only [mem_insert, mem_singleton]
  tauto

/-- Every equality block has a face avoiding all lost triangles at once.
The intermediate graph J may have further deletions, as required by stability. -/
theorem closed_boundary_face {H J : SimpleGraph V} {U P : Finset V}
    {A : Finset (Finset V)} (hb : ClosedBoundary H U P A)
    (hJ : J ≤ deleteEdges H A) {k : Finset V} (hk : J.IsNClique 4 k) :
    ∃ f, f ⊆ k ∧ f ∈ triangles J ∧
      ∀ t ∈ triangles H \ triangles (deleteEdges H A), Disjoint (edges f) (edges t) := by
  classical
  have hJH : J ≤ H := hJ.trans (deleteEdges_le H A)
  by_cases hu : ∃ u ∈ k, u ∈ U
  · obtain ⟨u, huk, huU⟩ := hu
    let f := k.erase u
    have hfk : f ⊆ k := erase_subset _ _
    have hcard : f.card = 3 := by simp [f, card_erase_of_mem huk, hk.card_eq]
    have hf : f ∈ triangles J := mem_triangles.mpr
      ⟨fun a ha b hb hab => hk.isClique (hfk ha) (hfk hb) hab, hcard⟩
    have havoidU : Disjoint f U := by
      apply disjoint_left.mpr
      intro a ha haU
      have hau := (mem_erase.mp ha).1
      exact hb.independentU a haU u huU (hJH (hk.isClique (hfk ha) huk hau))
    refine ⟨f,hfk,hf,?_⟩
    intro t ht
    obtain ⟨v,hv,p,hp,x,hxW,htx,hvpA,hvp,hvx,hpx⟩ :=
      closed_lost_triangle hb (mem_sdiff.mp ht).1 (mem_sdiff.mp ht).2
    apply disjoint_left.mpr
    intro e hef het
    have ev : v ∉ e := fun he => disjoint_left.mp havoidU ((mem_edges.mp hef).1 he) hv
    have esub : e ⊆ ({p,x} : Finset V) := by
      intro a ha
      have hat := (mem_edges.mp het).1 ha
      rw [htx] at hat
      rcases mem_insert.mp hat with rfl | hrest
      · exact (ev ha).elim
      · exact hrest
    have hpxne : p ≠ x := by intro he; subst x; exact hxW (mem_union_right _ hp)
    have eeq : e = {p,x} := eq_of_subset_of_card_le esub (by simp [(mem_edges.mp hef).2,hpxne])
    have hpf : p ∈ f := (mem_edges.mp hef).1 (by rw [eeq]; simp)
    have hxf : x ∈ f := (mem_edges.mp hef).1 (by rw [eeq]; simp)
    have hpu : p ≠ u := (mem_erase.mp hpf).1
    have hxu : x ≠ u := (mem_erase.mp hxf).1
    have hpuJ := hk.isClique (hfk hpf) huk hpu
    have hxuJ := hk.isClique (hfk hxf) huk hxu
    have huv : u = v := hb.unique p hp x hxW hpx u huU v hv
      (hJH hpuJ) (hJH hxuJ) hvp.symm hvx.symm
    have hpuA : ({p,u} : Finset V) ∈ A := by simpa [huv,pair_comm] using hvpA
    exact (hJ hpuJ).2 hpuA
  · have hkU : Disjoint k U := by
      apply disjoint_left.mpr
      intro u huk huU
      exact hu ⟨u,huk,huU⟩
    have hP : IndependentVertices J P := fun a ha b hpb hadj =>
      hb.independentP a ha b hpb (hJH hadj)
    obtain ⟨f,hfk,hf,hfP⟩ := k4_face_avoiding hP hk
    have hfU : Disjoint f U := hkU.mono_left hfk
    refine ⟨f,hfk,hf,?_⟩
    intro t ht
    obtain ⟨u,huU,p,hp,x,hxW,htx,rest⟩ :=
      closed_lost_triangle hb (mem_sdiff.mp ht).1 (mem_sdiff.mp ht).2
    apply disjoint_left.mpr
    intro e hef het
    have hes : e ⊆ ({x} : Finset V) := by
      intro a ha
      have hat := (mem_edges.mp het).1 ha
      rw [htx] at hat
      rcases mem_insert.mp hat with rfl | hat
      · exact (disjoint_left.mp hfU ((mem_edges.mp hef).1 ha) huU).elim
      · rcases mem_insert.mp hat with rfl | hat
        · exact (disjoint_left.mp hfP ((mem_edges.mp hef).1 ha) hp).elim
        · exact hat
    have hc := card_le_card hes
    rw [(mem_edges.mp hef).2, card_singleton] at hc
    omega

/-- Choose compatible faces simultaneously; no exhaustion assumption is needed. -/
theorem closed_boundary_faces {H J : SimpleGraph V} {U P : Finset V}
    {A : Finset (Finset V)} (hb : ClosedBoundary H U P A)
    (hJ : J ≤ deleteEdges H A) {B : Finset (Finset V)}
    (hk : ∀ k ∈ B, J.IsNClique 4 k) (hi : Independent B) :
    ∃ R, Packing (triangles J) R ∧ R.card = B.card ∧
      ∀ r ∈ R, ∀ t ∈ triangles H \ triangles (deleteEdges H A),
        Disjoint (edges r) (edges t) := by
  classical
  have hex : ∀ k : Finset V, ∃ f : Finset V,
      k ∈ B → f ⊆ k ∧ f ∈ triangles J ∧
        ∀ t ∈ triangles H \ triangles (deleteEdges H A), Disjoint (edges f) (edges t) := by
    intro k
    by_cases h : k ∈ B
    · obtain ⟨f,hf⟩ := closed_boundary_face hb hJ (hk k h)
      exact ⟨f,fun _ => hf⟩
    · exact ⟨∅,fun he => (h he).elim⟩
  choose f hf using hex
  have hinj : Set.InjOn f (B : Set (Finset V)) := by
    intro k hk' l hl' heq
    by_contra hne
    obtain ⟨e,he⟩ := edges_nonempty (s := f k) (by
      rw [(mem_triangles.mp (hf k hk').2.1).card_eq]; decide)
    exact disjoint_left.mp (hi k hk' l hl' hne)
      (edges_mono (hf k hk').1 he) (edges_mono (hf l hl').1 (heq ▸ he))
  refine ⟨B.image f, ⟨?_,?_⟩, card_image_iff.mpr hinj, ?_⟩
  · intro r hr
    obtain ⟨k,hk',rfl⟩ := mem_image.mp hr
    exact (hf k hk').2.1
  · intro r hr s hs hne
    obtain ⟨k,hk',rfl⟩ := mem_image.mp hr
    obtain ⟨l,hl',rfl⟩ := mem_image.mp hs
    have hkl : k ≠ l := fun h => hne (congrArg f h)
    apply disjoint_left.mpr
    intro e hek hel
    exact disjoint_left.mp (hi k hk' l hl' hkl)
      (edges_mono (hf k hk').1 hek) (edges_mono (hf l hl').1 hel)
  · intro r hr
    obtain ⟨k,hk',rfl⟩ := mem_image.mp hr
    exact (hf k hk').2.2

/-- Adjoining the deleted edges to a cover always covers the original graph. -/
theorem tau_deleteEdges_le (H : SimpleGraph V) (A : Finset (Finset V)) :
    tau (triangles H) ≤ tau (triangles (deleteEdges H A)) + A.card := by
  obtain ⟨C,hC,hcard⟩ := exists_min_cover (triangles_valid (deleteEdges H A))
  have hc : Covers (triangles H) (C ∪ A) := by
    intro t ht
    by_cases h : t ∈ triangles (deleteEdges H A)
    · obtain ⟨e,he,het⟩ := hC t h
      exact ⟨e,mem_union_left _ he,het⟩
    · obtain ⟨e,he,het⟩ := lost_has_deleted_edge ht h
      exact ⟨e,mem_union_right _ he,het⟩
  exact (tau_le_card hc).trans ((card_union_le C A).trans_eq (by rw [hcard]))

/-- Every actual edge can be deleted without reducing the maximum triangle packing. -/
def PackingEdgeStable (G : SimpleGraph V) : Prop :=
  ∀ a b, G.Adj a b →
    nu (triangles (deleteEdges G {{a,b}})) = nu (triangles G)

/-- The full closed-boundary companion stability criterion.  The only external
inputs are the frozen Aharoni and HNS inputs from TUZA-01. -/
theorem closed_boundary_stability
    (aharoni : AharoniInput (V := V)) (hns : HNSInput (V := V))
    {H : SimpleGraph V} {U P : Finset V} {A : Finset (Finset V)}
    (htrip : TriangleTripartite H) (hb : ClosedBoundary H U P A)
    (d : ℕ)
    (hslack : tau (triangles (deleteEdges H A)) + 1 =
      2 * nu (triangles (deleteEdges H A)))
    (hloss : nu (triangles (deleteEdges H A)) + d = nu (triangles H))
    (hlost : d + 2 ≤ nu (triangles H \ triangles (deleteEdges H A))) :
    PackingEdgeStable (deleteEdges H A) := by
  classical
  let K := deleteEdges H A
  change tau (triangles K) + 1 = 2 * nu (triangles K) at hslack
  change nu (triangles K) + d = nu (triangles H) at hloss
  change d + 2 ≤ nu (triangles H \ triangles K) at hlost
  intro a b hab
  let J := deleteEdges K {{a,b}}
  change nu (triangles J) = nu (triangles K)
  by_contra hne
  have hJK : J ≤ K := deleteEdges_le K {{a,b}}
  have hmono := nu_mono (triangles_mono_graph hJK)
  have hJtrip : TriangleTripartite J :=
    tripartite_mono (hJK.trans (deleteEdges_le H A)) htrip
  have hA := aharoni J hJtrip
  have hcover := tau_deleteEdges_le K ({{a,b}} : Finset (Finset V))
  change tau (triangles K) ≤ tau (triangles J) + _ at hcover
  simp only [card_singleton] at hcover
  have hdrop : nu (triangles J) + 1 = nu (triangles K) := by omega
  have heq : tau (triangles J) = 2 * nu (triangles J) := by omega
  obtain ⟨B,hB,hi,hsize⟩ := hns J hJtrip heq
  obtain ⟨R,hR,hRsize,hcompat⟩ := closed_boundary_faces hb hJK hB hi
  have hRH : Packing (triangles H) R :=
    packing_mono (triangles_mono_graph (hJK.trans (deleteEdges_le H A))) hR
  have hlow := nu_union_lower (triangles_valid H) hRH hcompat
  have hunion : triangles H ∪ (triangles H \ triangles K) = triangles H :=
    by simp
  change R.card + nu (triangles H \ triangles K) ≤
    nu (triangles H ∪ (triangles H \ triangles K)) at hlow
  rw [hunion,hRsize,hsize] at hlow
  omega

#check closed_boundary_face
#check closed_boundary_stability
#print axioms closed_boundary_face
#print axioms closed_boundary_faces
#print axioms closed_boundary_stability
end Tuza
