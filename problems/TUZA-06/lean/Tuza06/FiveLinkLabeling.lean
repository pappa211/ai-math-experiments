import Tuza06.FiveCoverage
import Tuza06.SmallLinks
import Tuza06.SparseLinksTools
import Tuza06.SparseLinksPage

namespace Tuza06
open Finset Tuza
set_option linter.unusedSectionVars false
variable {V : Type*} [Fintype V] [DecidableEq V]

def fiveIntoSix : Fin 5 ↪ Fin 6 := ⟨Fin.succ,Fin.succ_injective 5⟩
def fiveHubSpokes : Finset (Finset (Fin 6)) := {{0,1},{0,2},{0,3},{0,4},{0,5}}
def fiveCoreEdges (R : Finset (Finset (Fin 5))) : Finset (Finset (Fin 6)) :=
  fiveHubSpokes ∪ liftFamily fiveIntoSix R

private def frontOrder : Fin 6 → Fin 6 := ![5,0,1,2,3,4]
private theorem frontOrder_injective : Function.Injective frontOrder := by decide

def prependFiveEmbedding (n : Fin 5 ↪ V) (v : V) (hv : ∀ a, n a ≠ v) : Fin 6 ↪ V :=
  (⟨frontOrder,frontOrder_injective⟩ : Fin 6 ↪ Fin 6).trans (extendFiniteEmbedding n v hv)

@[simp] theorem prependFiveEmbedding_zero (n : Fin 5 ↪ V) (v : V) (hv : ∀ a, n a ≠ v) :
    prependFiveEmbedding n v hv 0 = v := by
  change extendFiniteEmbedding n v hv (Fin.last 5) = v
  exact extendFiniteEmbedding_last n v hv

@[simp] theorem prependFiveEmbedding_succ (n : Fin 5 ↪ V) (v : V) (hv : ∀ a, n a ≠ v) (a : Fin 5) :
    prependFiveEmbedding n v hv a.succ = n a := by
  fin_cases a <;> rfl

theorem fiveNeighbor_labels : (univ : Finset (Fin 5)).map fiveIntoSix = fiveLinkNeighbors := by decide

theorem map_mem_liftFamily {I J : Type*} [DecidableEq I] [DecidableEq J]
    (i : I ↪ J) (F : Finset (Finset I)) (e : Finset I) : e.map i ∈ liftFamily i F ↔ e ∈ F := by
  constructor
  · intro he
    obtain ⟨s,hs,hse⟩ := mem_liftFamily.mp he
    exact (map_inj.mp hse) ▸ hs
  · intro he
    exact mem_liftFamily.mpr ⟨e,he,rfl⟩

theorem fiveCoreEdges_succ {R : Finset (Finset (Fin 5))} (a b : Fin 5) :
    ({a.succ,b.succ} : Finset (Fin 6)) ∈ fiveCoreEdges R ↔ ({a,b} : Finset (Fin 5)) ∈ R := by
  have hn : ({a.succ,b.succ} : Finset (Fin 6)) ∉ fiveHubSpokes :=
    (by decide : ∀ a b : Fin 5, ({a.succ,b.succ} : Finset (Fin 6)) ∉ fiveHubSpokes) a b
  rw [fiveCoreEdges,mem_union,or_iff_right hn]
  have he : ({a,b} : Finset (Fin 5)).map fiveIntoSix = {a.succ,b.succ} := by simp only [map_insert,map_singleton]; rfl
  rw [← he]
  exact map_mem_liftFamily fiveIntoSix R _

theorem fiveCoreEdges_zero_succ (R : Finset (Finset (Fin 5))) (a : Fin 5) :
    ({0,a.succ} : Finset (Fin 6)) ∈ fiveCoreEdges R := mem_union_left _
      ((by decide : ∀ a : Fin 5, ({0,a.succ} : Finset (Fin 6)) ∈ fiveHubSpokes) a)

theorem fiveCoreEdges_zero_zero {R : Finset (Finset (Fin 5))} (hR : R ⊆ edges univ) :
    ({0,0} : Finset (Fin 6)) ∉ fiveCoreEdges R := by
  intro he
  rcases mem_union.mp he with hh|hr
  · exact (by decide : ({0,0} : Finset (Fin 6)) ∉ fiveHubSpokes) hh
  · obtain ⟨e,he,heq⟩ := mem_liftFamily.mp hr
    have hc := congrArg Finset.card heq
    have he2 := (mem_edges.mp (hR he)).2
    simp only [card_map,insert_eq_of_mem (mem_singleton_self _),card_singleton] at hc
    omega

noncomputable def linkEdgesOn (G : SimpleGraph V) (n : Fin 5 ↪ V) : Finset (Finset (Fin 5)) := by
  classical
  exact (edges univ).filter (fun e => G.IsNClique 2 (e.map n))

theorem linkEdgesOn_pair {G : SimpleGraph V} (n : Fin 5 ↪ V) (a b : Fin 5) :
    ({a,b} : Finset (Fin 5)) ∈ linkEdgesOn G n ↔ G.Adj (n a) (n b) := by
  classical
  constructor
  · intro he
    have he2 := (mem_edges.mp (mem_filter.mp he).1).2
    have hab : a ≠ b := by intro h; subst b; simp at he2
    exact (mem_filter.mp he).2.isClique (by simp) (by simp) (fun h => hab (n.injective h))
  · intro hab
    have hne : a ≠ b := fun h => G.irrefl (congrArg n h ▸ hab)
    exact mem_filter.mpr ⟨mem_edges.mpr ⟨subset_univ _,by simp [hne]⟩,
      by simpa only [map_insert,map_singleton] using sparse_pair_edge hab⟩

/-- Assemble a six-label configuration from a genuine five-neighbor labeling and
its exact induced-link adjacency. -/
theorem five_configuration_from_neighbors {G : SimpleGraph V} {v : V} (n : Fin 5 ↪ V)
    (hN : (univ : Finset (Fin 5)).map n = peelNeighbors G univ v)
    (hv : ∀ a, n a ≠ v) {R : Finset (Finset (Fin 5))} (hR : R ⊆ edges univ)
    (hAdj : ∀ a b : Fin 5, G.Adj (n a) (n b) ↔ ({a,b} : Finset (Fin 5)) ∈ R) :
    FiveLinkConfiguration G (prependFiveEmbedding n v hv) (fiveCoreEdges R) := by
  classical
  let j := prependFiveEmbedding n v hv
  have hj0 : j 0 = v := prependFiveEmbedding_zero n v hv
  have hjs : ∀ a : Fin 5, j a.succ = n a := prependFiveEmbedding_succ n v hv
  have hjcomp : fiveIntoSix.trans j = n := by ext a; exact hjs a
  constructor
  · have hmap : fiveLinkNeighbors.map j = (univ : Finset (Fin 5)).map n := by
      rw [← fiveNeighbor_labels,map_map]
      change (univ : Finset (Fin 5)).map (fiveIntoSix.trans j) = _
      rw [hjcomp]
    rw [hj0,hmap]
    exact hN.symm
  · intro a
    refine Fin.cases ?_ (fun a => ?_) a
    · intro b
      refine Fin.cases ?_ (fun b => ?_) b
      · rw [hj0]
        exact iff_of_false G.irrefl (fiveCoreEdges_zero_zero hR)
      · rw [hj0,hjs]
        have hn : n b ∈ peelNeighbors G univ v := hN ▸ mem_map.mpr ⟨b,mem_univ _,rfl⟩
        exact iff_of_true (mem_filter.mp hn).2 (fiveCoreEdges_zero_succ R b)
    · intro b
      refine Fin.cases ?_ (fun b => ?_) b
      · rw [hj0,hjs]
        have hn : n a ∈ peelNeighbors G univ v := hN ▸ mem_map.mpr ⟨a,mem_univ _,rfl⟩
        exact iff_of_true (mem_filter.mp hn).2.symm (by simpa only [pair_comm] using fiveCoreEdges_zero_succ R a)
      · rw [hjs,hjs,fiveCoreEdges_succ]
        exact hAdj a b

theorem five_representative_edges : ∀ r : Fin 11, FiveCoverage.representative r ⊆ edges univ := by decide

/-- Classify the genuine induced link of any degree-five vertex in an actual
minimal obstruction. All labels and relabelings are constructed in arbitrary G. -/
theorem minimal_degree_five_representative {G : SimpleGraph V} (hG : MinimalObstruction G)
    {v : V} (hdeg : degreeWithin G univ v = 5) :
    ∃ r : Fin 11, ∃ i : Fin 6 ↪ V, i 0 = v ∧
      FiveLinkConfiguration G i (fiveCoreEdges (FiveCoverage.representative r)) := by
  classical
  let N := peelNeighbors G univ v
  have hNcard : N.card = 5 := hdeg
  obtain ⟨n,hN⟩ := exists_fin_embedding N hNcard
  have hv : ∀ a : Fin 5, n a ≠ v := by
    intro a heq
    have hn : n a ∈ N := hN ▸ mem_map.mpr ⟨a,mem_univ _,rfl⟩
    exact G.irrefl (heq ▸ (mem_filter.mp hn).2)
  have hClosed : LinkClosed G v N := by
    constructor
    · exact fun a ha => (mem_filter.mp ha).2
    · exact fun a ha b hvb hab => mem_filter.mpr ⟨mem_univ _,hvb⟩
  let E := linkEdgesOn G n
  have hE : E ⊆ edges univ := filter_subset _ _
  have hmin : ∀ a : Fin 5, 2 ≤ ((univ : Finset (Fin 5)).filter (fun b => ({a,b} : Finset (Fin 5)) ∈ E)).card := by
    intro a
    have haN : n a ∈ N := hN ▸ mem_map.mpr ⟨a,mem_univ _,rfl⟩
    obtain ⟨x,hx,y,hy,hxy,hax,hay⟩ := minimal_link_two_neighbors hG hClosed haN
    have hx' : x ∈ (univ : Finset (Fin 5)).map n := hN.symm ▸ hx
    have hy' : y ∈ (univ : Finset (Fin 5)).map n := hN.symm ▸ hy
    obtain ⟨b,hb,hbx⟩ := mem_map.mp hx'
    obtain ⟨c,hc,hcy⟩ := mem_map.mp hy'
    have hbc : b ≠ c := fun h => hxy (hbx.symm.trans ((congrArg n h).trans hcy))
    have hsub : ({b,c} : Finset (Fin 5)) ⊆ univ.filter (fun z => ({a,z} : Finset (Fin 5)) ∈ E) := by
      simp only [insert_subset_iff,singleton_subset_iff,mem_filter,mem_univ,true_and]
      exact ⟨(linkEdgesOn_pair n a b).mpr (by simpa only [hbx] using hax),
        (linkEdgesOn_pair n a c).mpr (by simpa only [hcy] using hay)⟩
    simpa only [card_pair hbc] using card_le_card hsub
  obtain ⟨r,p,hrel⟩ := FiveCoverage.classify E hE hmin
  let σ := FiveCoverage.permutation p
  let n' := σ.symm.toEmbedding.trans n
  have hσuniv : (univ : Finset (Fin 5)).map σ.symm.toEmbedding = univ := by
    ext a
    constructor
    · intro _; exact mem_univ _
    · intro _; exact mem_map.mpr ⟨σ a,mem_univ _,by simp⟩
  have hN' : (univ : Finset (Fin 5)).map n' = N := by
    change (univ : Finset (Fin 5)).map (σ.symm.toEmbedding.trans n) = N
    rw [← map_map,hσuniv,hN]
  have hv' : ∀ a : Fin 5, n' a ≠ v := fun a => hv (σ.symm a)
  have hAdj : ∀ a b : Fin 5, G.Adj (n' a) (n' b) ↔ ({a,b} : Finset (Fin 5)) ∈ FiveCoverage.representative r := by
    intro a b
    have hp : ({σ.symm a,σ.symm b} : Finset (Fin 5)).map σ.toEmbedding = {a,b} := by
      simp only [map_insert,map_singleton,Equiv.coe_toEmbedding,Equiv.apply_symm_apply]
    have hm : ({a,b} : Finset (Fin 5)) ∈ FiveCoverage.representative r ↔
        ({σ.symm a,σ.symm b} : Finset (Fin 5)) ∈ E := by
      rw [← hrel,← hp]
      exact map_mem_liftFamily σ.toEmbedding E _
    exact (linkEdgesOn_pair n (σ.symm a) (σ.symm b)).symm.trans hm.symm
  refine ⟨r,prependFiveEmbedding n' v hv',prependFiveEmbedding_zero _ _ _,?_⟩
  exact five_configuration_from_neighbors n' hN' hv' (five_representative_edges r) hAdj

end Tuza06
