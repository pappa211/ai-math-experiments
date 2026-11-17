import Tuza24.AlternatingForestExchange
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace Tuza24
open Finset Tuza Tuza06 Tuza23
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- All ambient vertices exposed by at least one maximum matching. In particular,
isolated vertices are included; any active-vertex restriction must be explicit. -/
noncomputable def exposureSet (G : SimpleGraph V) : Finset V := by
  classical
  exact univ.filter (Exposable G)

/-- Neighbors of exposable vertices. -/
noncomputable def exposureNeighbors (G : SimpleGraph V) : Finset V := by
  classical
  exact univ.filter (fun a => ∃ d, Exposable G d ∧ G.Adj d a)

/-- Vertices outside the exposed set and its neighborhood. -/
noncomputable def exposureRemainder (G : SimpleGraph V) : Finset V :=
  univ \ (exposureSet G ∪ exposureNeighbors G)

noncomputable def exposureMatchingA (G : SimpleGraph V) (M : Finset (Finset V)) := by
  classical
  exact M.filter (fun e => ¬ Disjoint e (exposureNeighbors G))

noncomputable def exposureMatchingZ (G : SimpleGraph V) (M : Finset (Finset V)) := by
  classical
  exact M.filter (fun e => Disjoint e (exposureNeighbors G))

@[simp] theorem mem_exposureSet {G : SimpleGraph V} {v : V} :
    v ∈ exposureSet G ↔ Exposable G v := by
  classical
  simp [exposureSet]

@[simp] theorem mem_exposureNeighbors {G : SimpleGraph V} {v : V} :
    v ∈ exposureNeighbors G ↔ ∃ d, Exposable G d ∧ G.Adj d v := by
  classical
  simp [exposureNeighbors]

@[simp] theorem mem_exposureRemainder {G : SimpleGraph V} {v : V} :
    v ∈ exposureRemainder G ↔ ¬ Exposable G v ∧ v ∉ exposureNeighbors G := by
  classical
  simp [exposureRemainder]

/-- Every neighbor of an exposable vertex lies in every equality vertex cover. -/
theorem exposureNeighbors_subset_vertexCover {G : SimpleGraph V}
    {M : Finset (Finset V)} {Q : Finset V} (hM : MaximumMatching G M)
    (hQ : VertexCover G Q) (hcard : Q.card = M.card) : exposureNeighbors G ⊆ Q := by
  classical
  intro a ha
  obtain ⟨d,hd,hda⟩ := mem_exposureNeighbors.mp ha
  have he : G.IsNClique 2 ({d,a} : Finset V) :=
    ⟨by simpa [SimpleGraph.isClique_pair,hda.ne] using hda,by simp [hda.ne]⟩
  obtain ⟨x,hx,hxQ⟩ := not_disjoint_iff.mp (hQ _ he)
  rcases mem_insert.mp hx with rfl|hx
  · exact (exposable_not_mem_vertexCover hM hQ hcard hd hxQ).elim
  · exact (mem_singleton.mp hx) ▸ hxQ

/-- Exposed vertices and their neighbors are disjoint in a forest. -/
theorem forest_exposure_disjoint {G : SimpleGraph V} (hG : G.IsAcyclic) :
    Disjoint (exposureSet G) (exposureNeighbors G) := by
  classical
  apply disjoint_left.mpr
  intro v hv ha
  obtain ⟨d,hd,hdv⟩ := mem_exposureNeighbors.mp ha
  exact forest_exposable_independent hG hd (mem_exposureSet.mp hv) hdv

/-- A vertex outside the exposed set is matched by every maximum matching. -/
theorem nonexposable_mem_matchingVertices {G : SimpleGraph V}
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {v : V}
    (hv : ¬ Exposable G v) : v ∈ matchingVertices M := by
  by_contra h
  exact hv ⟨M,hM,h⟩

/-- A matched vertex has an actual neighboring partner in its matching. -/
theorem matching_partner {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : EdgeMatching G M) {v : V} (hv : v ∈ matchingVertices M) :
    ∃ w, G.Adj v w ∧ ({v,w} : Finset V) ∈ M := by
  classical
  obtain ⟨e,he,hve⟩ := mem_biUnion.mp hv
  obtain ⟨w,hw,hwv⟩ := exists_mem_ne (by rw [(hM.1 e he).card_eq]; decide : 1 < e.card) v
  have hp : ({v,w} : Finset V) = e := eq_of_subset_of_card_le
    (by intro x hx; rcases mem_insert.mp hx with rfl|hx; exact hve; exact (mem_singleton.mp hx).symm ▸ hw)
    (by rw [(hM.1 e he).card_eq]; simp [hwv.symm])
  exact ⟨w,(hM.1 e he).isClique hve hw hwv.symm,hp.symm ▸ he⟩

/-- Every matched neighbor of D is matched into D. No alternating path theorem
is assumed: a hypothetical non-D partner belongs to a minimum cover. -/
theorem exposureNeighbors_edge_partner {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {e : Finset V}
    (he : e ∈ M) {a b : V} (ha : a ∈ e) (hb : b ∈ e) (hab : a ≠ b)
    (haA : a ∈ exposureNeighbors G) : Exposable G b := by
  by_contra hbD
  obtain ⟨Q,hQ,hcard,hbQ⟩ := nonexposable_minimum_cover hG hM hbD
  have haQ := exposureNeighbors_subset_vertexCover hM hQ hcard haA
  exact hab (vertexCover_matching_edge_unique hM.1 hQ hcard he ha haQ hb hbQ)

/-- Every A vertex is saturated, and its matching partner is in D. -/
theorem exposureNeighbors_partner {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {a : V}
    (ha : a ∈ exposureNeighbors G) :
    ∃ d, Exposable G d ∧ G.Adj a d ∧ ({a,d} : Finset V) ∈ M := by
  classical
  obtain ⟨N,Q,hN,hQ,hcard⟩ := forest_maximum_matching_cover hG
  have hcardM : Q.card = M.card := hcard.trans (maximum_matching_card_eq hN hM)
  have ham := vertexCover_subset_matchingVertices hM.1 hQ hcardM
    (exposureNeighbors_subset_vertexCover hM hQ hcardM ha)
  obtain ⟨d,had,he⟩ := matching_partner hM.1 ham
  exact ⟨d,exposureNeighbors_edge_partner hG hM he (by simp) (by simp) had.ne ha,had,he⟩

/-- An edge avoiding A has both endpoints in Z. -/
theorem edge_subset_exposureRemainder {G : SimpleGraph V} {e : Finset V}
    (he : G.IsNClique 2 e) (hA : Disjoint e (exposureNeighbors G)) :
    e ⊆ exposureRemainder G := by
  classical
  intro v hv
  refine mem_exposureRemainder.mpr ⟨?_,fun h => disjoint_left.mp hA hv h⟩
  intro hvD
  obtain ⟨w,hw,hwv⟩ := exists_mem_ne (by rw [he.card_eq]; decide : 1 < e.card) v
  exact disjoint_left.mp hA hw (mem_exposureNeighbors.mpr
    ⟨v,hvD,he.isClique hv hw hwv.symm⟩)

/-- Every Z vertex is matched within Z. -/
theorem exposureRemainder_partner {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {z : V}
    (hz : z ∈ exposureRemainder G) :
    ∃ b, b ∈ exposureRemainder G ∧ G.Adj z b ∧ ({z,b} : Finset V) ∈ M := by
  classical
  obtain ⟨b,hzb,he⟩ := matching_partner hM.1
    (nonexposable_mem_matchingVertices hM (mem_exposureRemainder.mp hz).1)
  have hbA : b ∉ exposureNeighbors G := by
    intro hbA
    have hzD := exposureNeighbors_edge_partner hG hM he (by simp) (by simp) hzb.ne.symm hbA
    exact (mem_exposureRemainder.mp hz).1 hzD
  have hd : Disjoint ({z,b} : Finset V) (exposureNeighbors G) := by
    exact disjoint_left.mpr (by
      intro x hx hxA
      rcases mem_insert.mp hx with rfl|hx
      · exact (mem_exposureRemainder.mp hz).2 hxA
      · exact hbA ((mem_singleton.mp hx) ▸ hxA))
  exact ⟨b,edge_subset_exposureRemainder (hM.1.1 _ he) hd (by simp),hzb,he⟩

/-- The Z part is a matching in the induced remainder, represented by isolation. -/
theorem exposureMatchingZ_isMatching {G : SimpleGraph V} {M : Finset (Finset V)}
    (hM : EdgeMatching G M) :
    EdgeMatching (isolate G (exposureSet G ∪ exposureNeighbors G)) (exposureMatchingZ G M) := by
  classical
  constructor
  · intro e he
    obtain ⟨heM,heA⟩ := mem_filter.mp he
    have heZ := edge_subset_exposureRemainder (hM.1 e heM) heA
    refine ⟨?_,(hM.1 e heM).card_eq⟩
    intro a ha b hb hab
    exact ⟨(hM.1 e heM).isClique ha hb hab,
      (mem_sdiff.mp (heZ ha)).2,(mem_sdiff.mp (heZ hb)).2⟩
  · intro e he f hf hef
    exact hM.2 e (mem_filter.mp he).1 f (mem_filter.mp hf).1 hef

/-- The Z matching saturates exactly Z, including the empty remainder case. -/
theorem exposureMatchingZ_vertices {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) :
    matchingVertices (exposureMatchingZ G M) = exposureRemainder G := by
  classical
  ext z
  constructor
  · intro hz
    obtain ⟨e,he,hze⟩ := mem_biUnion.mp hz
    exact edge_subset_exposureRemainder (hM.1.1 e (mem_filter.mp he).1)
      (mem_filter.mp he).2 hze
  · intro hz
    obtain ⟨b,hb,hzb,he⟩ := exposureRemainder_partner hG hM hz
    apply mem_biUnion.mpr
    refine ⟨{z,b},mem_filter.mpr ⟨he,?_⟩,by simp⟩
    exact disjoint_left.mpr (by
      intro x hx hxA
      rcases mem_insert.mp hx with rfl|hx
      · exact (mem_exposureRemainder.mp hz).2 hxA
      · exact (mem_exposureRemainder.mp hb).2 ((mem_singleton.mp hx) ▸ hxA))

/-- Matching edges meeting A have precisely one A endpoint, and every A vertex
is on one such edge. Hence this part has exactly |A| edges. -/
theorem exposureMatchingA_card {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) :
    (exposureMatchingA G M).card = (exposureNeighbors G).card := by
  classical
  obtain ⟨N,Q,hN,hQ,hcard⟩ := forest_maximum_matching_cover hG
  have hcardM : Q.card = M.card := hcard.trans (maximum_matching_card_eq hN hM)
  have hAQ := exposureNeighbors_subset_vertexCover hM hQ hcardM
  have hone : ∀ e ∈ exposureMatchingA G M, (e ∩ exposureNeighbors G).card = 1 := by
    intro e he
    obtain ⟨heM,heA⟩ := mem_filter.mp he
    obtain ⟨a,ha,haA⟩ := not_disjoint_iff.mp heA
    apply card_eq_one_iff_existsUnique.mpr
    refine ⟨a,mem_inter.mpr ⟨ha,haA⟩,?_⟩
    intro b hb
    exact vertexCover_matching_edge_unique hM.1 hQ hcardM heM
      (mem_inter.mp hb).1 (hAQ (mem_inter.mp hb).2) ha (hAQ haA)
  have hu : (exposureMatchingA G M).biUnion (fun e => e ∩ exposureNeighbors G) =
      exposureNeighbors G := by
    ext a
    constructor
    · intro ha
      obtain ⟨e,he,hae⟩ := mem_biUnion.mp ha
      exact (mem_inter.mp hae).2
    · intro ha
      obtain ⟨d,hd,had,he⟩ := exposureNeighbors_partner hG hM ha
      apply mem_biUnion.mpr
      refine ⟨{a,d},mem_filter.mpr ⟨he,?_⟩,mem_inter.mpr ⟨by simp,ha⟩⟩
      exact not_disjoint_iff.mpr ⟨a,by simp,ha⟩
  have hd : ((exposureMatchingA G M : Finset (Finset V)) : Set (Finset V)).PairwiseDisjoint
      (fun e => e ∩ exposureNeighbors G) := by
    intro e he f hf hef
    exact (hM.1.2 e (mem_filter.mp he).1 f (mem_filter.mp hf).1 hef).mono
      inter_subset_left inter_subset_left
  calc
    (exposureMatchingA G M).card = ∑ e ∈ exposureMatchingA G M, 1 := by simp
    _ = ∑ e ∈ exposureMatchingA G M, (e ∩ exposureNeighbors G).card :=
      sum_congr rfl (fun e he => (hone e he).symm)
    _ = ((exposureMatchingA G M).biUnion (fun e => e ∩ exposureNeighbors G)).card :=
      (card_biUnion hd).symm
    _ = (exposureNeighbors G).card := congrArg card hu

/-- Exact cardinal decomposition, avoiding any implicit active vertex count. -/
theorem forest_matching_exposure_card {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) :
    M.card = (exposureNeighbors G).card + (exposureMatchingZ G M).card := by
  classical
  have h := card_filter_add_card_filter_not (s := M)
    (fun e => Disjoint e (exposureNeighbors G))
  rw [← exposureMatchingA_card hG hM]
  simpa [exposureMatchingA,exposureMatchingZ,Nat.add_comm] using h.symm

/-- Every original edge either meets A or survives in the isolated remainder. -/
theorem exposure_edge_partition {G : SimpleGraph V} {e : Finset V}
    (he : G.IsNClique 2 e) : ¬ Disjoint e (exposureNeighbors G) ∨
    (isolate G (exposureSet G ∪ exposureNeighbors G)).IsNClique 2 e := by
  classical
  by_cases hA : Disjoint e (exposureNeighbors G)
  · right
    have hZ := edge_subset_exposureRemainder he hA
    refine ⟨?_,he.card_eq⟩
    intro a ha b hb hab
    exact ⟨he.isClique ha hb hab,(mem_sdiff.mp (hZ ha)).2,(mem_sdiff.mp (hZ hb)).2⟩
  · exact Or.inl hA

/-- The isolated remainder is supported exactly where its matching is perfect. -/
theorem exposureMatchingZ_perfect {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) {e : Finset V}
    (he : (isolate G (exposureSet G ∪ exposureNeighbors G)).IsNClique 2 e) :
    e ⊆ matchingVertices (exposureMatchingZ G M) := by
  classical
  rw [exposureMatchingZ_vertices hG hM]
  intro v hv
  exact mem_sdiff.mpr ⟨mem_univ v,fun h => disjoint_left.mp (isolate_edge_avoids he) hv h⟩

theorem exposureMatchingZ_subset (G : SimpleGraph V) (M : Finset (Finset V)) :
    exposureMatchingZ G M ⊆ M := by
  classical
  exact filter_subset _ _

theorem exposureMatchingZ_nonempty_iff {G : SimpleGraph V} (hG : G.IsAcyclic)
    {M : Finset (Finset V)} (hM : MaximumMatching G M) :
    (exposureMatchingZ G M).Nonempty ↔ (exposureRemainder G).Nonempty := by
  classical
  rw [← exposureMatchingZ_vertices hG hM]
  constructor
  · rintro ⟨e,he⟩
    have heG := hM.1.1 e (exposureMatchingZ_subset G M he)
    obtain ⟨v,hv⟩ := card_pos.mp (by rw [heG.card_eq]; decide : 0 < e.card)
    exact ⟨v,mem_biUnion.mpr ⟨e,he,hv⟩⟩
  · rintro ⟨v,hv⟩
    obtain ⟨e,he,hve⟩ := mem_biUnion.mp hv
    exact ⟨e,he⟩

end Tuza24
