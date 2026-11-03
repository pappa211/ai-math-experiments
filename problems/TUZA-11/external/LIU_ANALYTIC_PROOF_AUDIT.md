# Independent reconstruction of Liu’s analytic reduction

Final analytic audit,2 November2026; initial frozen draft is retained under review/frozen_analyst/. The post-freeze table correction below is explicit. This audit uses the exact public v1.0.2 manuscript authenticated separately. All statements below concern **finite, simple 3-uniform hypergraphs**, whose edges are triples of vertices. A pair packing has intersections at most one vertex; a pair cover uses whole two-vertex subsets. These are not vertex-transversal parameters. The assumed counterexample has ν₂(H)=4 and τ₂(H)≥9.

The conventional small-packing input is τ₂(J)≤2ν₂(J) for ν₂(J)≤3. For ν₂=2,3 this is Parker’s general-uniformity Theorems1.1–1.2 (specialize r=3, cover by r−1 pairs); ν₂=1 follows from the earlier Aharoni–Zerbib result, and zero is empty. Parker's graph corollary alone would not suffice here. The frozen independent verification already authenticated Parker arXiv2406.06501v3 and HKT; they remain cited ordinary mathematical dependencies. Liu’s analytic lemmas are reconstructed here rather than treating historical AI signoffs as evidence.

## 2.1: every four-packing is connected

Connectivity means the graph on the four triples joining triples with a common **vertex**. If disconnected, split the packing P,Q so their vertex unions are disjoint. Maximality says every H-edge shares a pair with some reference triple. No triple can share a pair on both sides: the two disjoint pairs would need four vertices. Thus H decomposes into H_P,H_Q by pair-neighbourhood. Every H_P triple is pair-compatible with all Q. A packing in H_P larger than |P| appended to Q would exceed four, so ν₂(H_P)=|P| and likewise for Q. Both lie between one and three. Union small-packing covers costs at most2|P|+2|Q|=8, contradiction. Covers may overlap, which only lowers cost. This applies to **every** four-packing, not just the eventual maximizer.

## 2.2: every local pair-neighbourhood needs three pairs

For e∈H let T_e={h:|h∩e|≥2}. Its three pairs cover T_e. In H\T_e a four-packing could append e, hence the remaining packing number is≤3. If τ₂(T_e)≤2 then a small-packing cover of the complement costs≤6, giving total≤8. Therefore τ₂(T_e)=3 for every e. No assumption that e belongs to the chosen reference packing is needed.

## 2.3: one-anchor families overlap in a pair

Choose a four-packing M={e₁,…,e₄} with maximum union U. Define S_i as the edges sharing a pair only with e_i. If distinct h,g∈S_i intersect in≤1 vertex, they append M\{e_i}, producing five pair-compatible triples. Thus any two members of S_i meet in≥2 vertices. The reference triple itself may belong to S_i; there is no exclusion affecting the argument.

Every connected four-triple system has |U|≤9 by a spanning-tree order, adding at most two vertices after the first triple. Call a reference vertex shared when it belongs to at least two e_i, and private otherwise. Every e_i has at least one shared vertex by connectivity.

## 2.4: all exterior triples extend one of at most four fixed pairs

Maximality forces any exterior edge h to share a pair p with e_i. Since h has size3 and includes a vertex x outside U, h=p∪{x}; it has only one exterior vertex. No other reference triple can contain p (M is a pair packing), so h∈S_i and can replace e_i. If the omitted reference vertex v∈e_i\p were shared, it would remain in another reference edge and the replacement union would be U∪{x}, contradicting maximality. Thus v is private, excluding three shared vertices on e_i.

Suppose e_i={a,b,c} has just one shared vertex a, with b,c private. After relabelling h={a,b,x}. Any g∈T_ei omitting a has form{b,c,y}. Private b,c ensure g shares no pair with another reference triple, so g∈S_i. Its required two-vertex overlap with h forces y=x. Replacing e_i by{b,c,x} drops shared a, retained elsewhere, and again enlarges U. Thus no such g exists: all members of T_ei contain a. As they also share a pair with e_i, {a,b},{a,c} cover T_ei, contradicting2.2. Connectivity excludes zero shared vertices. The only possibility is two shared vertices, and p is precisely their pair c_i. Distinct c_i are distinct, since equality would violate the reference packing.

## 3.1: cover-preserving truncation, including cross-neighbours

Let I index reference triples with exactly two shared vertices, s=|I|≤4 and N_i={x outside U:c_i+x∈H}. Independently choose X_i⊆N_i of size min(s,|N_i|); set X=⋃X_i and take the **induced** H₀=H[U∪X]. This retains any edge c_i+x whenever x was selected through any family. It does not assert |N_i∩X|≤s. Only |X|≤s² is used.

M⊆H₀⊆H gives ν₂(H₀)=4. For any cover C of H₀, delete irrelevant pairs outside U∪X. If C already covers H, keep it. Otherwise an uncovered c_i+x has x∉X and c_i∉C. If |N_i|≤s then X_i=N_i, impossible; hence |N_i|>s and |X_i|=s. Each y∈X_i needs one pair containing y and one endpoint of c_i. These are s distinct pairs: each has exactly one exterior vertex, namely its different y. Delete **all** pairs of C not contained in U, and add all fixed c_j (at most s). At least s pairs are removed, so cost does not rise. All internal triples keep their original covering pair (an internal triple cannot have been covered by an exterior pair). All exterior triples receive their fixed pair. This covers H with≤|C| pairs. Together with subhypergraph monotonicity, τ₂(H₀)=τ₂(H). Shared exterior neighbours create no difficulty and need not be assigned to a unique family. For s=0, exterior edges do not exist and H₀=H on U.

## 3.2: twenty-four vertices and inherited constraints

For s≤3, |U|+|X|≤9+s²≤18. For s=4 each reference triple has two shared and one private vertex. There are eight shared incidences, hence at most four shared vertices, plus exactly four private vertices: |U|≤8. Thus |U∪X|≤8+16=24. Padding by isolated exterior vertices up to N=|U|+s² is harmless. Every H₀ four-packing stays connected because it is in H, and has union≤|U| by the original maximum choice. These inherited properties justify the later bad-four clauses.

## Exhaustive reference types and encoding bridge

A shared reference vertex has a nonempty incidence mask in[4] of size≥2; there are11 options. No mask repeats, and no pair of indices is contained in two selected masks, or a pair of reference edges would intersect twice. Each index has degree≤3; singleton private masks fill the remaining slots of its triple. Retain connected systems, identify under all24 permutations of the four edge labels. This is the exact equivalence: equal incidence multisets after an edge permutation give a vertex isomorphism, including freely matched private vertices; every isomorphism gives such an edge permutation. Thus no nonisomorphic systems are conflated. Independent enumeration of all ten actual certificate representatives is verified. The literal printed Table1 comparison failed at class9:378 must be389, as already stored in the released path certificate. The printed row duplicates the C4 type and is not isomorphic to the intended path. CLASS9_TABLE_ERRATUM.md and the superseding critic review give the exact independently verified repair. No certificate data changed.

The candidate universe must include all internal triples sharing a reference pair and all exterior fixed-pair triples, padded to N. A singly anchored candidate whose replacement packing disconnects is impossible by2.1. It is safe to discard it; if multiply anchored, no such replacement argument is presumed. Every counterexample therefore embeds as a Boolean subfamily of this exact universe.

Reference units, same-anchor incompatibilities, five-packing exclusions, disconnected/overlarge four-packing exclusions, and clauses forbidding each supplied≤8 pair-cover are all necessary. A cover clause must contain **every** unhit candidate variable, not a selected subset. A proper subset of the *collection of necessary clauses* suffices for an UNSAT proof; dropping literals within an individual necessary clause would require separate justification. This distinction was checked in the code.

RUP additions are consequences because negating the entire new clause and unit-propagating from previously justified clauses yields contradiction. Ignoring deletions retains consequences and is sound. A final empty clause refutes the original necessary conditions. Shape0 already has an empty cover clause; four disjoint complete 3-graphs on four vertices show sharpness ν₂=4,τ₂=8. The universal proof combines this analytic reduction with actual finite replay; finite replay alone has no arbitrary-ground-set quantifier.

## Parameter map to graphs

For a finite simple graph G, use its full vertex-triple family T(G). Pair-compatible triangles are exactly edge-disjoint graph triangles, so ν₂(T(G))=ν(G). Any pair occurring inside a triangle is an actual graph edge. Given a hypergraph pair cover, discard pairs in no triangle; all remaining pairs are graph edges and cover the same triangles. Conversely any graph triangle-edge cover is a pair cover. Hence τ₂(T(G))=τ(G). Apply Liu only at ν(G)=4; for≤3 apply the prior small-packing result. No vertex-cover substitution, line-graph identification or assumption that arbitrary triples are a graph’s full triangles is involved.

Final conclusion after actual finite comparison: Lemmas2.1–2.4,3.1 and Proposition3.2 are sound. The printed Table1 class9 requires the explicit378→389 correction; the released certificates already contain the correct exhaustive types, and all their clauses and154,874 additions now have complete independent coverage. This verified repair restores the universal finite-exclusion step. The initial unqualified table-agreement assessment is superseded. Computational acceptance and independent criticism are separate gates recorded in their own reports. This is ordinary computer-assisted mathematics, not a Lean theorem.
