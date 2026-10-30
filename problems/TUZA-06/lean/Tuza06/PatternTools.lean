import Tuza06.Footprints
import Tuza06.MatchingReduction

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V I : Type*} [Fintype V] [DecidableEq V] [Fintype I] [DecidableEq I]

/-- Finite link-pattern certificates lift into arbitrary graphs with exactly the
specified hub neighborhood, while all other outside attachments stay arbitrary. -/
theorem linkMatching_of_pattern {G : SimpleGraph V} (i : I ↪ V) (hub : I)
    (N : Finset I) (M : Finset (Finset I)) (Q : Finset I) (Bad : Finset (Finset I))
    (hN : peelNeighbors G univ (i hub) = N.map i)
    (hE : ∀ e ∈ liftFamily i M, G.IsNClique 2 e)
    (hSub : ∀ e ∈ M, e ⊆ N)
    (hMatch : ∀ e ∈ M, ∀ f ∈ M, e ≠ f → Disjoint e f)
    (hChoice : ∀ a ∈ N, ∀ b ∈ N, a ∉ Q → b ∉ Q → a ≠ b →
      ({a,b} : Finset I) ∈ M ∨ ({a,b} : Finset I) ∈ Bad)
    (hBad : ∀ a b : I, ({a,b} : Finset I) ∈ Bad → ¬ G.Adj (i a) (i b)) :
    LinkMatching G (i hub) (liftFamily i M) (Q.map i) := by
  classical
  constructor
  · exact hE
  · intro e he
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp he
    rw [hN]
    exact map_subset_map.mpr (hSub s hs)
  · intro e he f hf hef
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp he
    obtain ⟨t, ht, rfl⟩ := mem_liftFamily.mp hf
    exact (Finset.disjoint_map i).mpr (hMatch s hs t ht (fun h => hef (congrArg (Finset.map i) h)))
  · intro e he heG
    by_cases heQ : Disjoint e (Q.map i)
    · have heN := (mem_edges.mp he).1
      rw [hN] at heN
      obtain ⟨x, y, hxy, heq⟩ := card_eq_two.mp heG.card_eq
      obtain ⟨a, ha, rfl⟩ := mem_map.mp (heN (show x ∈ e by rw [heq]; simp))
      obtain ⟨b, hb, rfl⟩ := mem_map.mp (heN (show y ∈ e by rw [heq]; simp))
      have haQ : a ∉ Q := fun h => disjoint_left.mp heQ (by rw [heq]; simp) (mem_map.mpr ⟨a,h,rfl⟩)
      have hbQ : b ∉ Q := fun h => disjoint_left.mp heQ (by rw [heq]; simp) (mem_map.mpr ⟨b,h,rfl⟩)
      rcases hChoice a ha b hb haQ hbQ (fun h => hxy (congrArg i h)) with hm | hbad
      · exact Or.inl (mem_liftFamily.mpr ⟨{a,b},hm,by simpa only [map_insert,map_singleton] using heq.symm⟩)
      · exact (hBad a b hbad (heG.isClique (by rw [heq]; simp) (by rw [heq]; simp) hxy)).elim
    · exact Or.inr heQ

theorem lifted_incidence_card (i : I ↪ V) (D : Finset (Finset I)) (a : I) :
    ((liftFamily i D).filter (fun e => i a ∈ e)).card = (D.filter (fun e => a ∈ e)).card := by
  classical
  have heq : (liftFamily i D).filter (fun e => i a ∈ e) = liftFamily i (D.filter (fun e => a ∈ e)) := by
    ext e
    constructor
    · intro he
      obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp (mem_filter.mp he).1
      exact mem_liftFamily.mpr ⟨s,mem_filter.mpr ⟨hs,by simpa using (mem_filter.mp he).2⟩,rfl⟩
    · intro he
      obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp he
      exact mem_filter.mpr ⟨mem_liftFamily.mpr ⟨s,(mem_filter.mp hs).1,rfl⟩,
        by simpa using (mem_filter.mp hs).2⟩
  rw [heq, card_liftFamily]

theorem remove_lifted_independent {G : SimpleGraph V} (i : I ↪ V) (hub : I)
    {A : Finset I} {M : Finset (Finset I)} {Q : Finset I} (hA : edges A ⊆ M) :
    IndependentVertices (remove G {i hub} (liftFamily i M ∪ spokes (i hub) (Q.map i))) (A.map i) := by
  classical
  intro a ha b hb hadj
  obtain ⟨x, hx, rfl⟩ := mem_map.mp ha
  obtain ⟨y, hy, rfl⟩ := mem_map.mp hb
  have hxy : x ≠ y := fun h => G.irrefl (congrArg i h ▸ hadj.1)
  have heM : ({x,y} : Finset I) ∈ M := hA (mem_edges.mpr
    ⟨by simpa only [insert_subset_iff,singleton_subset_iff] using And.intro hx hy,by simp [hxy]⟩)
  exact hadj.2.2.2 (mem_union_left _ (mem_liftFamily.mpr
    ⟨{x,y},heM,by simp only [map_insert,map_singleton]⟩))

/-- A finite old-edge certificate classifies ALL surviving edges of the displayed
packing, in the arbitrary ambient graph after singleton deletion. -/
theorem old_edges_of_pattern {G : SimpleGraph V} (i : I ↪ V) (hub : I)
    (M P D : Finset (Finset I)) (Q : Finset I)
    (hOld : ∀ p ∈ P, ∀ e ∈ edges p, hub ∉ e → e ∉ M → e ∈ D) :
    ∀ p ∈ liftFamily i P, ∀ e ∈ edges p,
      (remove G {i hub} (liftFamily i M ∪ spokes (i hub) (Q.map i))).IsNClique 2 e →
      e ∈ liftFamily i D := by
  classical
  intro p hp e hep heH
  obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp hp
  rw [edges_map] at hep
  obtain ⟨f, hf, rfl⟩ := mem_liftFamily.mp hep
  have status := remove_edge_status heH
  have hhub : hub ∉ f := fun h => disjoint_left.mp status.1 (by simpa using h) (mem_singleton_self _)
  have hfM : f ∉ M := fun h => status.2 (mem_union_left _ (mem_liftFamily.mpr ⟨f,h,rfl⟩))
  exact mem_liftFamily.mpr ⟨f,hOld s hs f hf hhub hfM,rfl⟩

/-- Append a selected graph packing to a maximum residual packing that avoids its
entire surviving footprint. -/
theorem packing_augmentation_avoiding {G H : SimpleGraph V} (hHG : H ≤ G)
    {P Q D : Finset (Finset V)} (hP : Packing (triangles H) P)
    (hcP : P.card = nu (triangles H)) (hdP : Disjoint (support P) D)
    (hQ : Packing (triangles G) Q)
    (hOld : ∀ q ∈ Q, ∀ e ∈ edges q, H.IsNClique 2 e → e ∈ D) :
    Q.card + nu (triangles H) ≤ nu (triangles G) := by
  classical
  have hcross : ∀ q ∈ Q, ∀ p ∈ P, Disjoint (edges q) (edges p) := by
    intro q hq p hp
    apply disjoint_left.mpr
    intro e heq hep
    have heH : H.IsNClique 2 e := ⟨fun _ ha _ hb hab =>
      (mem_triangles.mp (hP.1 hp)).isClique ((mem_edges.mp hep).1 ha) ((mem_edges.mp hep).1 hb) hab,
      (mem_edges.mp hep).2⟩
    exact disjoint_left.mp hdP (mem_biUnion.mpr ⟨p,hp,hep⟩) (hOld q hq e heq heH)
  have hpack := packing_mono (show triangles G ∪ triangles G ⊆ triangles G by simp)
    (packing_union hQ (packing_mono (triangles_mono_graph hHG) hP) hcross)
  have hd := cross_disjoint (triangles_mono hQ.1 (triangles_valid G)) hcross
  have h := packing_card_le hpack
  rw [card_union_of_disjoint hd, hcP] at h
  exact h
/-- Transfer a complete finite clique-footprint certificate to every actual
residual clique, including cliques containing arbitrary additional outside vertices. -/
theorem footprint_of_pattern {H : SimpleGraph V} (i : I ↪ V)
    (D Bad : Finset (Finset I))
    (hBad : ∀ a b : I, ({a,b} : Finset I) ∈ Bad → ¬ H.Adj (i a) (i b))
    (hCert : ∀ J : ↥((univ : Finset I).powerset),
      (∀ a ∈ J.val, ∀ b ∈ J.val, a ≠ b → ({a,b} : Finset I) ∉ Bad) →
      (D ∩ edges J.val).card ≤ 2 ∧ ∃ a : I, ∀ e ∈ D ∩ edges J.val, a ∈ e)
    {k : Finset V} (hk : H.IsClique (k : Set V)) :
    ((liftFamily i D) ∩ edges k).card ≤ 2 ∧
      ∃ a : V, ∀ e ∈ (liftFamily i D) ∩ edges k, a ∈ e := by
  classical
  let J := (univ : Finset I).filter (fun a => i a ∈ k)
  have hJ : ∀ a ∈ J, ∀ b ∈ J, a ≠ b → ({a,b} : Finset I) ∉ Bad := by
    intro a ha b hb hab hpair
    exact hBad a b hpair (hk (mem_filter.mp ha).2 (mem_filter.mp hb).2
      (fun h => hab (i.injective h)))
  have hc := hCert ⟨J, mem_powerset.mpr (subset_univ _)⟩ hJ
  have heq : (liftFamily i D) ∩ edges k = liftFamily i (D ∩ edges J) := by
    ext e
    constructor
    · intro he
      obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp (mem_inter.mp he).1
      have hsk := (mem_edges.mp (mem_inter.mp he).2).1
      have hs2 : s.card = 2 := by simpa using (mem_edges.mp (mem_inter.mp he).2).2
      have hsJ : s ⊆ J := by
        intro a ha
        exact mem_filter.mpr ⟨mem_univ _,hsk (mem_map.mpr ⟨a,ha,rfl⟩)⟩
      exact mem_liftFamily.mpr ⟨s,mem_inter.mpr ⟨hs,mem_edges.mpr ⟨hsJ,hs2⟩⟩,rfl⟩
    · intro he
      obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp he
      have hsJ := (mem_edges.mp (mem_inter.mp hs).2).1
      refine mem_inter.mpr ⟨mem_liftFamily.mpr ⟨s,(mem_inter.mp hs).1,rfl⟩,mem_edges.mpr ⟨?_,?_⟩⟩
      · intro a ha
        obtain ⟨b,hb,rfl⟩ := mem_map.mp ha
        exact (mem_filter.mp (hsJ hb)).2
      · simpa using (mem_edges.mp (mem_inter.mp hs).2).2
  constructor
  · rw [heq, card_liftFamily]
    exact hc.1
  · obtain ⟨a, ha⟩ := hc.2
    refine ⟨i a,?_⟩
    intro e he
    rw [heq] at he
    obtain ⟨s, hs, rfl⟩ := mem_liftFamily.mp he
    simpa using ha s hs
end Tuza06
