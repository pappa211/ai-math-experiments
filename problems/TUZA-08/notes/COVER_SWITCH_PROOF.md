> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Two-common-neighbor cover exchange and its sharp obstruction

Status: **PROVED_ORDINARY**. This is an internal AI mathematical derivation, not a Lean theorem, an externally reviewed theorem, or a historical-priority claim. The proof uses only finite simple graph triangle covers and the stated local geometry. It assumes neither Tuza nor any minimal counterexample.

## Exact statement

Let H be any finite simple graph. Let u,v,a,b be distinct vertices, with uv absent and
N_H(u) ∩ N_H(v) = {a,b}. Write
A={ua,va}, B={ub,vb}.
Every edge named in a cover is an actual H edge, and every graph triangle must be covered.

Let C_A and C_B be triangle covers of equal cardinality t such that
A ⊆ C_A, C_A ∩ B=∅, B ⊆ C_B, C_B ∩ A=∅.
Put D_A=C_A\A, D_B=C_B\B, D=D_A∩D_B, X=D_A\D_B, Y=D_B\D_A.
Then X,Y are disjoint, avoid A∪B, and have the same cardinality r. Let J=H−D, deleting the actual common cover edges. Both A∪X and B∪Y cover the full triangle family of J, and J still has exactly the two common neighbors a,b.

Define X_u to consist of x∈X for which a triangle of J contains x and ub while meeting no edge of A. Define X_v similarly with vb. Define X_0=X minus (X_u∪X_v). Define Y_u,Y_v analogously using the spokes ua,va and triangles avoiding B; put Y_0=Y minus (Y_u∪Y_v). Set n_0=|X_0|+|Y_0|.

These are disjoint partitions. The following are triangle covers of J meeting both A and B:

Q_uv = {ua,vb} ∪ X_u ∪ Y_v ∪ X_0 ∪ Y_0,
Q_vu = {va,ub} ∪ X_v ∪ Y_u ∪ X_0 ∪ Y_0.

Consequently H has a triangle cover meeting both A and B of size at most

 t + floor(n_0/2).

A trivial alternative is to add one B-spoke to C_A, giving a mixed cover of size t+1. Thus the scalar bound can be written t+min(1,floor(n_0/2)); its improvement over that trivial bound occurs when n_0≤1. The substantive content is the explicit switch and the resulting neutral-edge/orientation obstruction, not a broad quantitative improvement for large n_0. More precise bounds use |D|+min(|Q_uv|,|Q_vu|). If any of X_u,X_v,Y_u,Y_v is empty, H has such a cover of size at most t, independently of n_0.

In particular, if C_A,C_B are minimum covers and no minimum H cover meets both A and B, then

1. all four oriented classes X_u,X_v,Y_u,Y_v are nonempty;
2. |X_0|+|Y_0| ≥ 2;
3. r≥3, so |C_A\C_B|=|C_B\C_A|≥5 and |C_A△C_B|≥10;
4. if r=3, each of the six classes X_u,X_v,X_0,Y_u,Y_v,Y_0 has exactly one member.

Thus cover incompatibility cannot arise from changing at most two outside edges of a pair-containing minimum cover. The radius-three obstruction is sharp, as proved below.

The word “neutral” may describe X_0,Y_0, but means only lack of these specifically oriented private triangle incidences. Such edges can lie in many graph triangles. They are not asserted to be triangle-free or irrelevant.

## Proof

Deleting D is legitimate without discarding outside triangles: precisely the triangles already hit by D disappear; every remaining triangle is an actual triangle of J. No member of A∪B is in D, so all four spokes remain. Deletion cannot create another common neighbor of u,v.

### 1. Local incidence fact

For an edge y outside A∪B, at most one triangle of J can contain y, an edge of A, and no edge of B.

Indeed, a triangle using ua and avoiding B has the form uas with s outside {u,v,a,b}. (s=b would use ub, and s=v would require uv.) Besides ua its edges are us and as. A triangle using va and avoiding B similarly has the form vat with t outside these four vertices. For a single outside edge y to belong to both triangles, it must be as=at, hence s=t. That vertex would be an additional common neighbor of u,v, a contradiction. For a fixed A spoke and y the triangle, if any, is uniquely determined. The same argument applies to x and B, avoiding A.

Therefore the oriented classes are disjoint. Moreover, if x∈X_v and y∈Y_u, choose their supporting triangles vbs and uat. Here s,t lie outside {u,v,a,b}, x is either vs or bs, and y is either ut or at. If s=t, it is an additional common neighbor of u,v. Otherwise the two displayed triples are disjoint, so the edges x,y are vertex-disjoint. Thus no graph triangle contains both x and y. Symmetrically no triangle contains both X_u and Y_v edges.

### 2. The two explicit covers

Suppose a triangle T of J avoids Q_uv. Because A∪X and B∪Y both cover J, T must meet both

 {va}∪X_v and {ub}∪Y_u.

There are four possibilities.

- T contains va and ub. Those two edges are vertex-disjoint, impossible in a triangle.
- T contains va and y∈Y_u. Since T avoids vb and cannot contain the disjoint edge ub, it avoids B. It would therefore place y also in Y_v, contrary to the local incidence fact.
- T contains x∈X_v and ub. It avoids ua, and cannot contain the disjoint edge va. It would place x also in X_u, again impossible.
- T contains x∈X_v and y∈Y_u. These edges are vertex-disjoint by the final observation in step 1.

Thus Q_uv covers every triangle. Reversing u,v proves the other cover.

All edges in these covers are actual J edges. The displayed unions are disjoint, so

 |Q_uv|+|Q_vu| = 4+2r+n_0.

One of them has size at most r+2+floor(n_0/2). Adding D gives a mixed cover of H with size at most |D|+r+2+floor(n_0/2)=t+floor(n_0/2).

### 3. Missing orientations

For example, if Y_v=∅, then {ua,vb}∪X covers J. Otherwise an uncovered triangle would meet A only through va, would avoid B (vb is selected and ub is disjoint from va), and would contain some y∈Y. This would put y in Y_v, a contradiction. The other three empty-class cases are symmetric. The cover has size r+2, so adding D costs t.

### 4. Incompatible minimum covers

If there is no mixed minimum cover, every constructed mixed cover has size at least t+1. Step 2 yields n_0≥2; step 3 makes all four oriented classes nonempty. Hence 2r≥4+n_0≥6, giving r≥3. At r=3 there are exactly six outside edges, so all six required classes have one edge. Also C_A\C_B=A∪X, proving the stated distance.

No packing argument, optimum estimate, block decomposition, hereditary Tuza property, or counterexample assumption occurs in this proof.

## Sharp seven-vertex graph (independent ordinary certificates)

Take vertices 0,1,2,3,4,5,6 with u=0,v=1,a=2,b=3 and edge set

02,03,05,12,13,16,23,24,25,26,34,35,36,45,46.

The full triangle list is

023,025,035,123,126,136,234,235,236,245,246,345,346.

Here uv=01 is absent and the common neighbors are exactly 2,3.

The covers

C_A={02,12,24,35,36},
C_B={03,13,25,26,34}

both have size five. They have no common edges. Their outside classes are

X_u={35}, X_v={36}, X_0={24},
Y_u={25}, Y_v={26}, Y_0={34}.

Thus r=3 and n_0=2. Every class is nonempty exactly as the lower bound allows.

### Exact packing number

The four triangles 023,126,245,346 are edge-disjoint. There are fifteen edges. A packing of five triangles would use every edge, but vertices 0 and 1 each have odd degree three, whereas a union of edge-disjoint triangles using every edge has even degrees. Therefore ν(H)=4.

### Exact covering number

If a cover contains 23, it must also cover the eight triangles
025,035,126,136,245,246,345,346.
Every edge lies in at most two of these, so at least four additional edges are necessary.

If a cover omits 23, triangles 234,235,236 require at least one edge from each of the three disjoint pairs
{24,34}, {25,35}, {26,36}.
Choose one such edge from each pair. Of the two triangles 025,035, exactly one remains uncovered by those three choices, as does exactly one of 126,136. The two remaining triangles are edge-disjoint, so a single fourth edge cannot cover both. Thus no cover has size four. The displayed covers show τ(H)=5.

### No mixed minimum cover

If a size-five cover contains 23, its other four edges must cover all eight triangles above. An edge of A∪B lies in only one of those eight, while every other edge lies in at most two. Such a cover cannot contain any spoke.

If a size-five cover omits 23 and meets both A and B, it contains at least two spokes and the three core-pair choices above, so it has exactly two spokes and exactly one edge of each core pair. If both spokes have the same endpoint u or v, the other endpoint's two outer triangles cannot both be covered by the single corresponding core-pair choice. If the two spokes are 02 and 13, the uncovered outer triangles force the choices 35 and 26. Choice 24 then leaves 346 uncovered, while choice 34 leaves 245 uncovered. For spokes 12 and 03 the symmetric alternatives leave 345 or 246 uncovered. Thus no size-five cover meets both pairs.

Containing all of A forces the unique minimum cover C_A: a size-five cover containing A cannot contain 23 by the preceding count, so its other three edges must be exactly one from each core pair {24,34}, {25,35}, {26,36}. Within that budget, 035 and 136 force 35 and 36 (the alternative edges05 and16 cannot be extra choices), after which 245 and 246 force24. Containing all of B analogously forces C_B. The cover-distance lower bound is therefore attained, not merely approached.

### Exact wedge losses, and the missing criticality

Deleting A leaves the size-three cover {24,35,36} and the packing 035,136,246 of size three. Deleting B leaves cover {25,26,34} and packing 025,126,345. Hence ν(H−A)=ν(H−B)=3 and τ(H−A)=τ(H−B)=3. Both wedge deletions lose one packing triangle and two cover edges, and both pairs individually belong to a minimum cover, but no minimum cover meets both.

This is not a Tuza counterexample: τ(H)=5<8=2ν(H). Restoring 01 gives ν=4, τ=6 by the exact restoration identity in [INDEPENDENT_MECHANISM.md](INDEPENDENT_MECHANISM.md). The example shows the covering incompatibility, exact wedge losses, and the sharp neutral-edge obstruction can coexist in a genuine graph. Tightness and stronger deletion resilience cannot silently be discarded.

## Mechanism-specific verification

- `mechanism_r1_check.py` (historical record, not included in this public archive) initially tested the maximal triangle family without the exactly-two-common-neighbor restriction. It found failures, including K5−01. These are failures of that deliberately weakened test, not of the theorem.
- `mechanism_r1_exact_common.py` (historical record, not included in this public archive) examined 506 ordered outside-edge identifications on labels 0..7, 9,272 triangle subfamilies, and retained 7,336 cases satisfying the common-neighbor constraint. Every retained case has a mixed cover of size at most three. The family enumeration deliberately overapproximates actual full graph triangle families; this is safe for its positive result. It is not an exhaustive eight-vertex graph census.
- `mechanism_r2_oriented_check.py` (historical record, not included in this public archive) checked the hard r=2 geometry: 4,096 choices of external-vertex equality pattern and nonspoke support edges, 1,068 feasible oriented cases, and 7,008 possible additional triangles. No proposed explicit cover failed. This is an independent finite check of the local case analysis, not a Lean proof or a test of a hypothetical minimal counterexample.

These checks corroborate the proof; the arbitrary-r theorem is established by the ordinary argument above, not by finite enumeration.

## Research value and limit

The lemma gives a concrete necessary geometry for cover incompatibility: two neutral outside edges and both endpoint orientations on both sides. It is falsifiable independently of Tuza and sharp in a non-tight graph. It does not bound those neutral edges in a tight critical descendant, and does not itself contradict the hypothetical A1 profile. A longer proof mission would need a new ancestry-to-neutral-edge argument or a packing obstruction that rules out this sharp configuration. Merely asserting that the necessary neutral edges cannot occur would leave the central gap unproved. Historical originality remains unassessed here and must be checked against the separate prior-art review.

## Negative control: exactly two common neighbors is necessary

The conclusion with r≤2 is false if additional common neighbors are allowed. Let H=K5−01 on vertices 0,1,2,3,4 and retain A={02,12}, B={03,13}. Then

C_A={02,12,34}, C_B={03,13,24}

are minimum covers of size three with r=1, yet no size-three cover meets both pairs. There are seven triangles and each edge belongs to at most three, so two edges cannot cover all seven; the displayed covers prove τ=3. The packing 034,124 has size two; a packing of three would decompose all nine edges but vertices 0,1 have odd degree three. Thus ν=2.

To check cover incompatibility, a mixed cover must contain two selected spokes and at most one other edge. If the selected spokes share endpoint 0 (02,03), the K4 on {1,2,3,4} remains to be covered by one edge, impossible; the endpoint-1 case is symmetric. If they are the opposite pair 02,13, the two triangles 034 and 124 are both unhit and edge-disjoint; the pair 12,03 is symmetric. Adding further spokes cannot evade the same obstruction. Here 4 is a third common neighbor of 0,1. The edge 34 supports both B orientations, exactly the failure prohibited by the local incidence fact. This is a concrete refutation of an overgeneralized exchange theorem, not a Tuza counterexample.
