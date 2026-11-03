# Track B: joint cover optimization and exact K4 attachment reduction


**Final reviewed scope (2026-11-02):** General S and E remain unresolved. The final accepted chain in sections17–18 proves that a globally minimum cover with k<=3 and an all-red triangle has tau<=6. With the accepted small-packing ordinary Tuza input and Track A lower-threshold lemmas, this gives S for tau<=8 and S for nu<=4. Earlier sections preserve the successive scoped mechanisms and first-freeze limitations; sections15–18 supersede their historical frontier statements.

## 1. Reconstructed arithmetic and quantifiers

For any maximum full packing P of size n=nu and any globally minimum cover C of size c=tau, let t members of P be all-red. These edge-disjoint triangles consume at least 3t+(n-t)=n+2t distinct red edges. Thus t<=floor((c-n)/2), and k(C)>=n-floor((c-n)/2). The lower bound equals ceil((3n-c)/2). If 2c<=3n, then 3n-c>=c, so this is at least ceil(c/2). No assumption of Tuza is used.

For c=2n or c=2n-1, the allowance n-ceil(c/2) is zero. A mechanism starting with a free all-red triangle relative to an eligible packing can repair loss but cannot alone prove Tuza: an E-minimal obstruction could have nu=K and then no such free triangle exists. When c<=2nu is already certified, the loss-repair question has its correct scope.

A fewest-edge E obstruction has c=2K+1. For every one- or two-edge set A contained in SOME optimum cover, deletion gives some (possibly different) optimum cover C_A and a K-packing avoiding A. The existential quantifier order is essential. It does not give same-cover pair avoidance, unlike a fewest-edge S-failing pair. These prior reductions are used only at their exact quantifiers.

## 2. Exact K4 attachment theorem (new scoped mechanism)

Let H be a finite simple graph and D a subset of its edges, d=|D|. Let R=H-D, retaining the same vertices. For each e=uv in D add two fresh vertices x_e,y_e, and all five edges ux_e,uy_e,vx_e,vy_e,x_ey_e. The shared edge uv plus these five new edges is a leaf K4 B_e. Different leaf pairs are disjoint, with no other new edges. Denote the resulting graph by L_D(H).

Every triangle of L_D(H) is either an actual triangle of H or a face of a unique B_e. The supports E(B_e) are pairwise edge-disjoint and are disjoint from E(R). This statement uses actual closure: a triangle containing x_e or y_e lies in its B_e because those vertices have no other neighbors.

**Theorem B-L.**

1. tau(L_D(H)) = 2d + tau(R).
2. nu(L_D(H)) = d + nu(H).
3. Every globally minimum cover C of L_D(H) has C_R=C intersect E(R) globally minimum for R, and C intersect E(B_e) is one of the three opposite-edge pairs of B_e, for every e. Conversely, these conditions together with S=C intersect E(H) covering H characterize all minimum covers.
4. For each such C, every leaf face is eligible, and

       k(L_D(H),C) = d + k(H,S),   S=C intersect E(H),

   where k(H,S) is defined for this (not necessarily globally minimum) cover S of H.
5. If S holds for R, then S holds for L_D(H). If E holds for R, then E holds for L_D(H).

**Proof.** Every cover meets each edge-disjoint K4 support in at least two edges, and its restriction to E(R) covers R. These supports partition the expanded edge set, so every cover has size at least 2d+tau(R). To attain the bound, select an optimum cover A of R; select every e in D and its opposite edge x_ey_e. The resulting set covers every leaf K4 and every core triangle (a core triangle either uses D or belongs to R). Thus (1) holds. Equality in the lower bound forces equality in every summand. A size-two cover of K4 is precisely an opposite-edge pair. This proves (3), with the stated core-cover condition ensuring all actual triangles are covered.

A full packing has at most one face from each K4 and at most nu(H) core triangles, yielding the upper bound in (2). Conversely take a maximum core packing. In each B_e select one of the two faces avoiding e; these faces use only fresh edges, so they do not collide with any core triangle or another leaf face. This attains d+nu(H).

An opposite-edge pair colors every K4 face with exactly one red edge, hence every leaf face is eligible. Splitting an eligible packing into core triangles and leaf faces bounds its size by k(H,S)+d. Any maximum eligible core packing extends by one face avoiding e in each leaf. Thus (4) holds.

For (5), any minimum C has the minimum residual cover C_R. Every eligible triangle in R remains eligible for S since its edges avoid D. Hence k(L_D(H),C)>=d+k(R,C_R). The threshold satisfies ceil(tau(L_D(H))/2)=d+ceil(tau(R)/2). This proves S inheritance. For E choose a favorable minimum A of R and extend it by every e and its opposite fresh edge, as in the attaining construction; the same inequality proves E inheritance. QED.

This is a structural sufficient hypothesis and a concrete reduction, not a reformulation of S/E: the residual graph deletes all decorated edges, and the exact objective is proved by local K4 optima. It permits arbitrary actual core triangles across different decorated and residual edges. It does not assert all graphs have such a removable structure.

The loss/allowance identities make the near-tight scope explicit:

    loss(L_D(H),C) = nu(H)-k(H,S)
                  <= (nu(H)-nu(R)) + loss(R,C_R),
    allowance(L_D(H)) = nu(H)-ceil(tau(R)/2)
                     = (nu(H)-nu(R)) + allowance(R).

Thus the extra possible core packing contributes equally to the allowance budget and the worst-case loss bound. If the expanded graph is tight or one-off and S holds for R, the inherited full residual packing automatically supplies the required full expanded packing. In particular, with tau(R) in {2nu(R),2nu(R)-1} and nu(H)=nu(R), this mechanism addresses allowance zero exactly.

## 3. Full decoration: all optimum covers and nonlocal moves

When D=E(H), write m=|E(H)|. R has no edges, so tau=2m and nu=m+nu(H). The optimum-cover classification simplifies:

* choose ANY triangle cover S of H, including a nonminimum one;
* for e in S use {e,x_ey_e}; for e not in S choose either of the other two opposite-edge pairs.

These choices are bijective with all optimum covers, and

    k(L(H),C)=m+k(H,S),
    K(L(H))=m+J(H),
    J(H):=max{k(H,S): S ANY triangle cover of H}.

The number of optimum covers is sum_{S covers H} 2^(m-|S|). The statement K=m+K(H) would be incorrect without proving that arbitrary cover optimization equals minimum-cover optimization.

No optimum cover has a one-red-for-one-blue exchange: changing a size-two K4 cover requires replacing an entire opposite-edge pair. Nevertheless all optimum covers are connected by exchanges removing two red edges and adding two blue edges. To see this, first add missing core edges one at a time, switching that leaf's cross matching to {e,x_ey_e}; the core set stays a cover. This reaches the all-core-red cover. Reverse a corresponding path to any desired optimum. Different cross-matching choices can also be switched in one such exchange. Thus one-edge isolation does not prevent global cover mobility.

Choose the all-core-red cover C_0. Then all core triangles are all-red and k(C_0)=m. It follows that

    loss(C_0)=nu(H)=allowance(L(H)),

so the strong inequality is exactly tight, with positive packing loss whenever H contains a triangle. All optimum covers still satisfy S by Theorem B-L.

### Connected hard-regime family

Take H to be a book of r>=1 triangles sharing one edge, with distinct tips and no other edges. Then m=2r+1, nu(H)=1. The fully decorated graph has

    vertices=5r+4, edges=12r+6, triangles=9r+4,
    tau=4r+2, nu=2r+2, k(C_0)=2r+1,
    allowance=loss(C_0)=1,
    tau/nu=2-1/(r+1).

For r>=2 this is in the nonautomatic hard range. Its actual triangle-conflict graph is connected: core book triangles meet at the common edge and each leaf's faces connect through that leaf's core edge to a core triangle. Hence this is not a disjoint-union inflation.

There are exactly 9^r+2*5^r optimum covers. If the common edge lies in S, each pair of rim edges has weighted sum 3^2=9. If the common edge is absent, its leaf has two cross-matching choices and each rim pair must contain a red edge, giving weighted sum 9-4=5. Exactly one optimum is C_0 and has k=2r+1; every other optimum leaves at least one core triangle eligible and has k=2r+2. A single two-for-two exchange removing a rim edge from S repairs the loss. There are still no one-edge optimum moves.

This family approaches ratio two but always has tau=2nu-2, so it does not discharge the separately required tau=2nu or 2nu-1 tests.

## 4. A unique optimum does not restore full packing

An exploratory candidate was: unique globally minimum C implies k(C)=nu. It is false. Take H=K3 and attach TWO fresh K4s along each of its three edges. More generally q>=2 leaves per core edge force every core edge into a minimum cover: if S is the core red set, leaf covering costs at least 2qm-(q-1)|S| overall, minimized uniquely at S=E(H). Every leaf then uses the unique opposite-edge pair containing its core edge.

For H=K3,q=2 this is a 15-vertex graph with 33 edges, 25 triangles, unique minimum cover of size9, full packing7 and eligible packing6. The core triangle is all-red; all six leaf K4s supply one eligible triangle, and a full packing adds the core triangle using leaf faces avoiding their core edges. The cover's uniqueness is an ordinary cost proof, not an enumerator cap. The graph is automatic: 2tau=18<=21=3nu. It refutes only unique-cover full compatibility, not S/E.

## 5. Current distinct fallback question

For any fixed packing P, a cover S making all P eligible exists exactly when there is a triangle-free blue edge set meeting each P triangle. If one exists, delete all but one chosen blue edge from each P member; triangle-freeness persists. Thus J(H)=nu(H) would follow if some maximum packing has a triangle-free one-edge-per-triangle transversal. This is a new constrained selection problem, not yet a theorem. A preliminary literature search did not identify a primary theorem settling this exact claim; no novelty or literature-based assertion is made. Directed fixed-control checks will be recorded separately.

Even proving J(H)=nu(H) would not prove E, because S is unrestricted in cardinality. The missing general bridge would have to control the cover size simultaneously, or show a migration into the optimum-cover face while retaining enough eligible packing. K7 already prevents insisting on zero loss for every graph.

## 6. K5 root avoidance and mixed attachment theorem

**Lemma B-5.** For every globally minimum triangle cover C of K5 and every prescribed root edge e, there is an eligible packing of size two avoiding e; both triangles can be chosen one-red.

**Proof.** A minimum cover has size four. Its blue complement is a triangle-free six-edge graph on five vertices, necessarily K2,3. To see the equality classification directly, such a graph has a vertex of degree at least three; degree four would leave at most four edges because its neighbors are independent, so the degree is three. The three neighbors are independent; the remaining vertex must join all three to reach six edges. Therefore after relabelling C={ab,cd,ce,de}. There are three edge orbits under permutations preserving this partition. For root ab use {acd,bce}; for root cd use {ace,bde}; for root ac use {ade,bce}. Each pair is edge-disjoint, avoids the prescribed root, and has exactly one red edge per triangle. This exhausts all roots. QED.

The K4 counterpart is immediate: every minimum cover is an opposite-edge pair, every face has exactly one red edge, and two faces avoid a prescribed root edge. A leaf contributes one such face.

**Theorem B-M (mixed attachment).** In the construction of B-L permit each decorated edge to carry either one fresh K4 or one fresh K5, with disjoint sets of new vertices. Let b=d4+2d5 and R=H-D. Then

    tau(G)=2b+tau(R),    nu(G)=b+nu(H),
    k(G,C)=b+k(H,S),    S=C intersect E(H),

for every globally minimum C. Its restriction to R is globally minimum and its restriction to each leaf block is globally minimum for that clique. S and E each inherit from R to G. The same loss/allowance identities from B-L apply, with b in place of d in the intermediate size formulas.

**Proof.** Supports of the attached clique blocks and E(R) partition E(G). Lower cover costs are two for K4, four for K5, and tau(R) for R. Each root belongs to a minimum cover of its clique; choose these covers including every root and extend a minimum cover of R to attain the lower bound. Equality forces optimum restrictions. Every packing uses at most one/two faces per K4/K5 respectively. Lemma B-5 and its K4 counterpart give eligible local optimum packings avoiding roots, so they extend arbitrary core eligible packings without collisions and prove the exact k formula; forgetting colors proves the nu formula. The threshold and inheritance proof is identical to B-L. QED.

**Minimal-obstruction consequence.** A fewest-edge S-failing pair (G,C), or a fewest-edge E-failing graph G, cannot contain a pendant K4 or K5 block meeting the remaining graph in exactly its root edge. More explicitly, the nonroot vertices must have no neighbors outside that block. Remove its entire edge support and then ignore isolated nonroot vertices to obtain R. For S, the given C restricts to an optimum C_R and k(G,C)>=r+k(R,C_R), while tau(G)=2r+tau(R), where r=1 or2. If the residual pair satisfied S, so would (G,C); hence a smaller failing pair would exist. For E, a favorable minimum residual cover extends as in B-M, so an E failure likewise descends to R. These are distinct quantifiers; no fixed-cover avoidance statement is transferred from S to E.

This reduction supplies a concrete pruning criterion for hard-regime search. The general missing bridge is now sharper: there is no proved reduction or improving joint exchange for leafless graphs, and no claim that all tight or one-off graphs contain these blocks.

## 7. Directed finite receipt

`checks/track_b_attachments.py` and `evidence/track_b_attachments.json` record six attachment controls, the unique-cover auxiliary refutation, and the unrestricted-cover transversal checks. The optimum solver is reused read-only from the authenticated TUZA-13 core; these are discovery implementation checks, not independently authored solver verification. Complete actual triangle lists are separately regenerated in the new script.

* K4: all 3 minimum covers and all 6 roots, 18 pairs, admit the required root-avoiding eligible packing.
* K5: all 10 minimum covers and all 10 roots, 100 pairs, admit it.
* Fully decorated K3: (tau,nu)=(6,4); all 19 minima, k histogram {3:1,4:18}.
* Fully decorated two-page book: (tau,nu)=(10,6); all 131 minima, k histogram {5:1,6:130}. This is nonautomatic and has positive loss at one optimum.
* K4 core with one K4 leaf: (tau,nu)=(3,2), one optimum, full eligible packing two.
* K5 core with one K4 leaf: (tau,nu)=(5,3), four optima, all full eligible packing three.
* K4 core with one K5 leaf: (tau,nu)=(5,3), four optima, all full eligible packing three.
* K5 core with one K5 leaf: (tau,nu)=(7,4), sixteen optima, all full eligible packing four.

The last four controls have allowance zero; the first of them is at the integer automatic boundary, while the others include genuine one-off hard cases. The proof is structural, and these are not added to an unrelated random search count.

The two-K4s-per-K3-edge graph has a literal unique nine-cover, full packing seven, and eligible packing six. Its uniqueness certificate exhausts the eight possible core selections and uses the exact independent local costs; it does not report a capped cover enumeration as complete.

For fixed exact maximum packings in K7 and K9, direct one-edge-per-packed-triangle backtracking found triangle-free blue transversals, proving J=nu for those two controls. It visited eight and twenty-two search states respectively. This neither proves the general transversal statement nor identifies a minimum cover of either graph. Total first-run script time was approximately 0.030 seconds. No broad census or heavy CPU was used.

## 8. Saturated edge-support certificates beyond pendant leaves

**Lemma B-SAT.** Let B_1,...,B_s be actual subgraphs of G with pairwise edge-disjoint supports. Suppose tau(G)=sum_i tau(B_i), and S holds for every B_i. Then S holds for G. No separation of G's triangle family into the B_i is required.

**Proof.** Any minimum cover C of G restricts to a cover C_i of each B_i, so |C_i|>=tau(B_i). Equality of the sum with |C| forces every C_i to be minimum and C to contain no edge outside the union of their supports. Each B_i admits an eligible packing for C_i of size at least ceil(tau(B_i)/2). Since the supports are edge-disjoint, these packings combine, and their eligibility is unchanged in G. The sum of the ceilings is at least ceil(tau(G)/2). Additional actual triangles crossing the blocks do not invalidate the selected packing or its red counts. QED.

K3, K4 and K5 satisfy the local hypothesis by explicit local checks/ordinary arguments, so a saturated certificate from these blocks proves S. This was discussed independently with the coordinator; it is not claimed as historical novelty.

For the first leaf-unreduced 12-vertex seed with tau11, nu7, input hash `fa30239cb67e48b46b1374eaf3b8a94ed07a013cd07c3b9b42f814a325d05240`, the edge-disjoint supports K5 on {0,2,7,10,11}, K5 on {3,5,6,9,10}, K4 on {1,4,6,8}, and K3 on {3,4,7} have costs4+4+2+1=11. Hence they already certify S and an eligible six-packing for every optimum, despite the absence of pendant leaf blocks. The coordinator found a stronger decomposition into two K5s and three K3s, certifying the full seven. The exact search's all-optimum full-packings agree, but the structural proof is separate.

The coordinator reported that leaf reduction alone disposed of 745 of 746 new hard-regime graphs in the first targeted batch. That count is sourced to `evidence/leaf_reduction_audit.json`, not independently recomputed by Track B, and is not a new universal theorem. The sole residual seed is disposed of by B-SAT as above. Subsequent kernel mutations were therefore checked separately rather than treated as fresh pressure merely because the leaf test failed.

## 9. A distinct fractional-packing mechanism

Let t=tau*(G) be the common optimum of fractional triangle packing and fractional actual-edge cover. Let c=tau(G) and delta=c-t>=0. A fractional packing assigns nonnegative weights w_T to actual graph triangles with sum_{T contains e} w_T<=1 for every graph edge e.

**External input, exact scope.** Füredi's rank-three theorem states that a finite rank-three hypergraph containing no Fano plane as a partial hypergraph has fractional matching number at most twice its integral matching number. This is the p=0,r=3 case of the theorem in Z. Füredi, *Maximum degree and fractional matchings in uniform hypergraphs*, Combinatorica1(1981),155–162, printed page157, Section2. The primary PDF was inspected through successful web-extracted text at https://www.renyi.hu/~furedi/PUBS3/furedi_007_cca1981_fractional_matchings.pdf (8pages,286 extracted lines; theorem at lines79–82). Direct local downloads by the coordinator were rejected403, so no local1981PDF or visual page inspection is claimed. The same author's1991 primary restatement, equation(2.1) at printed page206, is available locally as `sources/furedi_1991_degree.pdf` for the independent source audit.

**Why it applies to arbitrary actual triangle subfamilies.** The hypergraph vertices are graph edges and hyperedges are the three edges of selected actual triangles. It cannot contain a Fano plane. Indeed, every pairwise edge-intersecting family of distinct graph triangles either has a common graph edge or is contained in the four faces of a K4. To verify the non-common-edge case, choose two triangles abc,abd sharing ab and a third missing ab but meeting both. Up to interchange it is acd. A triangle meeting all three is either one of these, bcd, or contains ab and must then be abc or abd. Thus at most four triangles occur. A Fano plane has seven pairwise intersecting hyperedges, with no common vertex, so it is impossible. The argument does not require the selected triangle family to be closed under graph triangle completion.

**Theorem B-LP.** For every globally minimum cover C,

    k(G,C) >= ceil((3tau*(G)-tau(G))/4).

In particular S holds if tau*=tau. More generally it holds if delta<4/3 when c is even, or delta<2/3 when c is odd. The endpoints in these sufficient tests are strict.

**Proof.** Fix an optimum full fractional packing w of weight t. Let a_j be its total weight on triangles with exactly j red edges, for j=1,2,3. Since C is a cover, a_1+a_2+a_3=t. Summing the edge-capacity inequalities over the c red edges gives

    a_1+2a_2+3a_3 <= c,
    a_2+2a_3 <= c-t=delta.

Discard the all-red triangles. The retained eligible fractional packing has weight t-a_3>=t-delta/2=(3t-c)/2. Füredi's theorem applies to this actual eligible triangle subfamily and gives its fractional matching number <=2k(G,C). Therefore k>= (3t-c)/4, and integrality gives the displayed ceiling. If c=2q and delta<4/3, the real lower bound q-3delta/4 exceeds q-1, so k>=q. If c=2q+1 and delta<2/3, the bound q+1/2-3delta/4 exceeds q, so k>=q+1. QED.

When delta=0, the mass inequality forces a_2=a_3=0. Thus every optimum full fractional packing is supported on one-red triangles for every minimum C; additionally all the c red-edge capacity inequalities are saturated. Füredi then already gives a private-only packing of size at least ceil(c/2). This does not contradict the previous private-only obstruction: its fractional gap is positive.

This is a distinct, checkable sufficient hypothesis rather than an equivalent formulation of S. It unlocks exact rational primal/dual certificates and identifies two independent defects: weight lost on all-red triangles, and the factor-two fractional-to-integral matching loss. It does not assume half-integrality, nor replace a cover of the eligible family by a minimum full cover. Historical novelty of this derived bound is unestablished.

### Joint optimization refinement, still only a reduction

For any optimum full fractional packing w and any minimum cover C,

    k(G,C) >= ceil((tau*(G)-sum_{T all-red for C} w_T)/2).

One may minimize the removed mass jointly over the finite minimum-cover set and the compact full optimum fractional-packing face. A selected minimizing pair exists and can improve the displayed lower bound for E. Existence does not prove that its mass is small enough. Reoptimizing directly on the eligible subfamily can improve the bound further, but still needs a valid integral rounding theorem. Neither construction supplies a universal cover migration invariant.

The general missing bridge for this approach is not ordinary LP duality: it is a universal relationship between optimum-cover choice, all-red fractional mass, and the actual integrality gap of the eligible triangle family. On the new hard kernels the crude scalar bound reaches an exact parity endpoint and cannot certify S, although direct integral packings do. The full-graph Haxell–Kostochka–Thomassé fractional stability theorem is not automatically applicable to an eligible subfamily; its published graph-pattern proof uses completion triangles and local subgraphs whose triangles may be excluded by the coloring. No such extension is asserted here.

## 10. Exact rational LP certificate receipt

`checks/track_b_fractional.py` implements a rational primal simplex for max 1^T w subject to triangle-edge incidence Aw<=1,w>=0, starting from the feasible slack basis and using Bland's entering/leaving tie rule. It independently checks exact nonnegative primal/dual feasibility and matching objective values before emitting `evidence/track_b_fractional.json`. Rational numbers are numerator/denominator pairs. The fresh independent critic checked the certificates without importing the simplex; the coordinator read the results and reconstructed the argument, but did not author that independent certificate checker. These are fixed controls, not a new LP census.

| Control | tau | nu | tau* | delta | universal B-LP lower bound | target |
|---|---:|---:|---:|---:|---:|---:|
| K4 |2|1|2|0|1|1|
| K5 |4|2|10/3|2/3|2|2|
| K7 |9|7|7|2|3|5|
| Clebsch cone |11|8|8|3|4|6|
| Reduced20-vertex cone |13|9|19/2|7/2|4|7|
| Decorated two-page book |10|6|10|0|5|5|
| Unique-cover double-decoration |9|7|9|0|5|5|
| New kernel545c3d746e1f |11|7|29/3|4/3|5|6|
| New kernel4c21554d63d3 |11|7|31/3|2/3|5|6|
| New kernel85fe064961fd |11|7|31/3|2/3|5|6|
| New kernel1299d6e8bd49 |11|7|31/3|2/3|5|6|

The four kernel inputs are the records with `NOT_FOUND_COMPLETE` in the coordinator's `evidence/saturated_blocks.json`; full source hashes and literals are in the LP receipt. All supplied optimum covers (148 or210 per kernel) satisfy the exact fractional mass inequality, but this full-witness bound yields only five. Reoptimizing the eligible LP at a worst-all-red-mass supplied cover gives exact values9 for the first kernel and10 for the other three, still yielding only five through the factor-two theorem. This is a limitation of the sufficient mechanism, not a counterexample to S: the original exact records have k7.

Eleven full LPs and ten eligible LPs were certified, with first-run elapsed0.238seconds. No floating-point optimization, dependency installation, half-integrality assumption, broad census, or background process was used.

## 11. Fixed-packing repair as a constrained cut problem

This is a third scoped mechanism, developed after the exact attachment and fractional arguments. It refines the prior blue-replacement formula with constraints needed to keep a prescribed packing eligible. Its hypotheses are checkable in the actual colored graph; the bipartite case unlocks a minimum-cut certificate. It does not claim a universally available exchange set.

Fix a globally minimum C, a packing P of actual triangles (possibly containing all-red members), and a red set S subset C. Assume S contains no entire all-red triangle of G and meets every all-red member of P. Blue edges are the Boolean variables x_b, indicating selection in B. Build the following constraints:

* x_b=1 for every sole blue edge b of a two-red triangle whose two red edges both lie in S;
* x_b OR x_c for every one-red triangle whose unique red edge lies in S and whose blue pair is {b,c};
* x_b=0 for every sole blue edge b of a packed two-red triangle whose two red edges both avoid S;
* NOT x_b OR NOT x_c for every packed one-red triangle whose unique red edge avoids S and whose blue pair is {b,c}.

**Lemma B-CUT.** These constraints characterize exactly the blue sets B for which (C minus S) union B covers all actual triangles of G and every member of P is eligible. If the undirected graph of all positive and negative pair clauses is bipartite, minimum |B| is an explicit minimum-cut problem. A finite cut of value |S| produces another globally minimum cover keeping P eligible. If |P|>=ceil(tau/2), this certifies E; if |P|=nu and allowance zero, it repairs the exact near-tight requirement.

**Proof of the characterization.** A formerly one-red triangle loses coverage exactly when its unique red is removed and neither blue is added; these are the positive clauses. A two-red triangle loses coverage only when both reds are removed, forcing its sole blue. An all-red triangle cannot be repaired with original blue edges, so the assumption excluding such a triangle inside S is necessary and sufficient for this class. This proves cover equivalence. A packed two-red triangle becomes all-red exactly when neither red is removed and its blue is added, giving the forbidden variables. A packed one-red triangle becomes all-red exactly when its red is retained and both blues are added, giving the negative clauses. A packed all-red triangle becomes eligible exactly when one or two reds are removed; this follows from the two assumptions on S. Cover preservation ensures no packed triangle becomes all-blue. Thus all conditions are exact.

**Cut construction.** Let L,R be a bipartition of the pair-clause graph, including isolated blue variables arbitrarily. Put y_b=x_b on L and y_b=1-x_b on R. A positive clause across (l,r) becomes implication y_r=>y_l; a negative clause becomes y_l=>y_r. A feasible assignment is therefore a set of y=1 vertices closed under these arcs and satisfying the translated forced values.

Make source s and sink t. For each l in L add arc l->t of capacity1; for each r in R add arc s->r of capacity1. Add each implication arc with capacity M, and force y=1 or0 with s->v or v->t arcs of capacity M, where M exceeds the number of blue edges. For any finite feasible cut, the source-side variable set is the closed y=1 set. Its unit-capacity cost is |{l:x_l=1}|+|{r:x_r=1}|=|B|. Conversely every feasible assignment gives this cut. A minimum cut of value at least M signals infeasibility; otherwise its value is the exact replacement cost. Because C is globally minimum, every feasible B has |B|>=|S|. Equality supplies an optimum migration. QED.

The new tool is the min-cut representation under bipartiteness of the combined positive/negative constraint graph. This condition is stronger than bipartiteness of the original private-resource graph alone, because preserving the packing adds negative clauses. It is not valid to ignore those clauses or the forbidden variables. For nonbipartite clause graphs the exact Boolean formulation still holds, but this particular cut proof does not apply.

**General bridge still absent.** No theorem supplies a red set S meeting the relevant all-red packing members, with an admissible bipartite clause graph and replacement cost |S|. Nor is every maximum packing necessarily compatible with any optimum C; K7 rules that out. A universal argument would need to select a sufficient packing and exchange set jointly, or establish another controlled rounding theorem. The cut characterization alone is not S or E.

Directed tests of the literal construction follow in a separate receipt; no positive test is substituted for the proof.

### Signed-cut tests and an exact cardinality-relaxation gap

`checks/track_b_packing_cut.py` and `evidence/track_b_packing_cut.json` implement the signed clause construction and a small integral max-flow/min-cut algorithm. Each successful output directly checks the repaired actual cover and every prescribed packing member. Flow conservation, antisymmetry, capacities and equality of flow/cut values are checked exactly; the receipt retains the network and net flow for independent verification.

For the decorated books r=1,2, take the all-core-red optimum, a full packing consisting of one core triangle and one root-avoiding face from each leaf, and remove the common book edge together with its leaf's opposite edge. The signed graph is bipartite and its minimum cut is2, exactly the two reds removed. Switching the leaf to a cross matching preserves optimum cardinality and makes the full packing eligible. This recovers a genuinely nonlocal exchange in a graph with no one-edge optimum moves.

For K7, choose C as internal edges of the partition {0,1,2}|{3,4,5,6} and the full packing

    {356,246,145,123,034,025,016}.

All512 red subsets were checked:225 contain an entire all-red triangle,56 do not break the packed all-red triangle,213 have a nonbipartite combined clause graph, and18 yield feasible bipartite cut systems. Every feasible one has cost exceeding the number of removed reds by at least2; the minimum excess is attained by removing35 and adding05,15,23. Thus even a bipartite repair system need not have the cardinality needed for an optimum-cover migration.

An exploratory expectation that a ten-edge cover might preserve the full packing failed. The script rejected all352,716 ten-edge subsets and then found an eleven-edge cover. The failed upper guess is preserved in the script comments and receipt. It was never a claimed theorem.

**Lemma B-K7-RELAX.** The minimum size of a triangle cover of K7 that admits a full seven-triangle eligible packing is11, whereas tau(K7)=9.

**Lower bound, independent of enumeration.** Any triangle-free nonbipartite graph on seven vertices has at most10edges. Take a shortest odd cycle. If it has length5, it has no chord, and each of the other two vertices has at most two neighbors on it; their mutual edge contributes at most one, so there are at most5+4+1=10edges. If the shortest odd cycle has length7, it uses all vertices and has no chord, since any chord makes a shorter odd cycle, so there are only7edges. Consequently the blue complement of a cover of size at most10 has at least11edges and is bipartite.

Every seven-triangle packing of K7 partitions all21edges. If a bipartite blue graph met all seven packed triangles, each packed triangle would be nonmonochromatic under that bipartition and so would contain exactly one within-part edge. The decomposition would then have exactly seven within-part edges altogether. But every bipartition of seven vertices has at least binom(3,2)+binom(4,2)=9 within-part edges. Contradiction. Hence such a cover has size at least11, for every possible maximum packing.

**Attainment.** For the displayed packing, take the eleven-edge cover

    {01,02,03,04,13,16,24,25,36,45,56}.

Its ten-edge blue complement is

    {05,06,12,14,15,23,26,34,35,46}.

Direct complete triangle enumeration verifies that this blue graph is triangle-free and meets every displayed packed triangle. Thus the cover is valid and that full packing is eligible. This proves the exact joint relaxed optimum11. It does not assert eleven is the optimum full-compatible cover for each individually prescribed maximum packing, although the universal lower bound holds for each.

This is an auxiliary limitation of the cardinality-relaxed J(H) route. K7 remains in the automatic S regime, and its S/E threshold is five. It is not a new S/E counterexample.

### Fractional-mass potential can be flat while actual loss changes

In every fully K4-decorated book, tau*=tau: assign weight1/2 to every face in each edge-disjoint leaf K4, and zero to core triangles. This gives fractional packing weight2m, equal to the displayed minimum cover size. Therefore complementary slackness from B-LP forces all-red fractional mass zero for EVERY minimum cover and EVERY optimum full fractional packing. Yet one minimum cover has loss1 and every other minimum cover has loss0. Minimizing this fractional mass cannot distinguish the unrepaired cover from the repaired covers, even in the genuine hard range r>=2.

K7 gives the complementary obstruction. Every optimum full fractional packing has weight7 and saturates all21graph-edge capacities, since summing them gives3*7=21. For any optimum cover its blue graph is K3,4 with12edges, and every eligible triangle uses two blue edges. Summing the blue loads gives eligible fractional mass6, leaving all-red mass1. Hence no joint choice of optimum cover and full optimum fractional packing makes this mass zero.

These exact controls block two tempting potential claims: zero all-red fractional mass does not imply zero integral packing loss, and optimum cover selection cannot always force the mass to zero. The valid fractional inequality and the cut lemma retain their scoped statements.

## 12. One unit of slack beyond saturated clique blocks

This lemma arose after the scalar fractional bound failed at the odd delta=2/3 endpoint of the new hard kernels. It is a new structural exchange argument, not an inference from passing examples.

**Lemma B-ROBUST.** Let B be K4 or K5, r=nu(B), and let A be a triangle cover of B with |A|<=tau(B)+1=2r+1. For every prescribed edge e of B, there is an eligible r-packing avoiding e.

**Proof.** If A contains a minimum cover A_0, use the root-avoiding one-red packing from the K4/K5 lemmas. Adding at most one selected edge changes each such triangle's red count from1 to at most2, so all remain eligible.

Otherwise A is an inclusion-minimal nonminimum cover of size exactly3 for K4 or5 for K5. In K4, a three-edge set with no opposite-edge pair is a star or triangle. A star is not a cover because the opposite face is uncovered. Thus A is a triangle. Only that face is all-red; of the two faces avoiding e, at least one is another face and is eligible.

For K5, the blue complement F has five edges and is inclusion-maximal triangle-free, since A is inclusion-minimal. If F had a degree-four vertex, its other four vertices would be independent, giving only four edges. If it has a degree-three vertex v, its three neighbors are independent; the fifth vertex w is not adjacent to v and, to make five edges, joins exactly two of those neighbors. Adding the third such edge remains triangle-free, contradicting maximality. Thus every degree is at most two. With five edges on five vertices, every degree is two, so F=C5. Its complementary red graph A is also C5. Hence every actual triangle is eligible. K5-e has a two-packing for every e (also witnessed by the earlier root-avoidance lemma), which proves the assertion. QED.

A complete direct check of all cover/root pairs found96 applicable pairs for K4 covers of size3 and720 for K5 covers of size5, with no failure. The structural proof above is independent of those counts; the finite receipt is to be persisted below.

**Theorem B-ONE.** Let G contain pairwise edge-disjoint clique blocks B_i, each K4 or K5. Put b=sum_i nu(B_i), so sum_i tau(B_i)=2b. If tau(G)=2b+1, then S holds for every minimum C.

**Proof.** Since C restricts to a cover of each block, its total excess over the block minima is exactly one. There are two cases.

1. C has exactly one red edge f outside the block supports and every block restriction is minimum. Global minimum cardinality implies that f has an actual private triangle Q. This triangle is not inside any block because it contains f. A triangle not contained in a clique block meets its edge support in at most one edge: two edges would put all three vertices in the clique and hence all three triangle edges there. In each block choose an eligible maximum local packing avoiding its possible one edge of Q. These local packings are mutually edge-disjoint and avoid Q; adjoining the private triangle Q yields b+1 eligible triangles.
2. All red edges lie in block supports. Exactly one block restriction has size tau(B_i)+1; all others are minimum. There must be an eligible actual triangle Q outside the individual blocks. Otherwise every actual triangle outside the blocks is all-red. Replace the overfull block restriction by any minimum cover of that block. Triangles within it are covered; triangles in other blocks are unchanged; any crossing triangle loses at most one of its three former red edges because it meets that clique support in at most one edge. Thus the replacement is a smaller full cover, a contradiction. Choose such an eligible Q. By B-ROBUST, each block, including the overfull one, has a full eligible local packing avoiding its possible single edge of Q. Their union with Q gives b+1 eligible triangles.

In both cases b+1=ceil(tau(G)/2), proving S. QED.

No triangle-separation hypothesis is present. The proof controls actual crossing triangles explicitly, and no assertion that all local restrictions are minimum is made in the one-overfull-block case.

**Corollary B-ONE-345.** If pairwise edge-disjoint K3/K4/K5 blocks have summed local cover cost at least tau(G)-1, then S holds.

**Proof.** Their cost cannot exceed tau(G). Equality is B-SAT. Suppose the cost is tau(G)-1. Every local restriction has at most one extra red edge. A K3 then has at most two reds and remains eligible; B-ROBUST supplies full eligible packings in the other blocks. If there is at least one K3, the sum of the local packing sizes is at least ceil(tau(G)/2): writing o for the number of K3 blocks and c=tau(G), this sum is (c-1+o)/2, and parity forces o>=1 when c is even and o>=2 when c is odd. If there is no K3, c is odd and B-ONE applies. QED.

The statement is a sufficient certificate, not a characterization of all S-good graphs. It rules out another concrete configuration in an edge-minimal S or E obstruction, but no theorem ensures such blocks exist in every hard graph.

### Local sharpness and an all-K4 corollary

The file `evidence/track_b_one_slack.json`, generated by an independently written direct subset/packing checker with no imported solver, preserves all816 one-extra cover/root pairs (96 for K4,720 for K5), all passing. It also records90 K4 cover-size4/root pairs, all passing, and1,400 K5 cover-size6/root pairs,20 of which fail. Those20 failures are exactly the five possible red K4s, each with one of the four blue spokes designated as root; this classification is a finite receipt, not needed for the ordinary argument.

The K5 boundary has a short proof. Color all six edges of a K4 red inside K5 and the four spokes from the fifth vertex x blue. Every eligible triangle uses two blue spokes. A two-packing exists, but forbidding a blue root xa leaves only three blue spokes, so an eligible two-packing avoiding that root is impossible. This is a cover of K5 with two extra selected edges above its local minimum. It refutes the naive extension of B-ROBUST to tau(B)+2, not S and not any assertion about a globally minimum K5 cover.

For K4 alone, root avoidance does extend to covers of size at most4: the two faces avoiding a fixed edge together contain five distinct edges, so they cannot both be all-red under a cover of size at most4. At least one is eligible, since the cover property prevents zero reds.

**Corollary B-K4-TWO.** If edge-disjoint K4 blocks have total minimum-cover cost2b with tau(G)<=2b+2, then S holds. The natural lower bound gives tau(G)>=2b. At equality use B-SAT. Otherwise each local restriction has at most4 red edges. If C has an outside red edge, its private triangle is an eligible crossing Q. If C has no outside red edge, some block restriction is overfull; the same replacement contradiction from B-ONE guarantees an eligible crossing Q. Select in every block a root-avoiding eligible face and adjoin Q. This yields b+1 eligible triangles, which reaches ceil(tau(G)/2) for both possible values2b+1 and2b+2. QED.

The mixed K4/K5 version does not follow from the arbitrary-root lemma alone at two units of slack because of the explicit K5 failure above. A red-root refinement below repairs this particular issue. No general obstruction classification is inferred.

## 13. Red-root refinement: two units of slack for mixed blocks

This refinement was derived after the K5 arbitrary-root obstruction was explicitly identified. Its proof uses the global minimum-cover condition to choose a private crossing triangle with a RED root in the overfull block. It does not silently discard the blue-root counterexample.

**Lemma B-REDROOT.** Let A be a triangle cover of K5 with |A|<=6. For every prescribed RED edge e in A, there is an eligible two-packing avoiding e.

**Proof.** There are at least four blue edges. Let F be the eligible triangle family avoiding e, and suppose it has no two edge-disjoint members. Every blue edge f differs from the red root e and lies in at least two triangles avoiding e: among its three K5 triangles, at most one can contain the distinct edge e. Each such triangle is eligible because A covers K5 and it contains the blue edge f.

The pairwise edge-intersecting family F either has a common edge h or is contained in the faces of a K4. In the common-edge case, the two distinct triangles through any blue f also contain h. Two distinct graph edges lie together in at most one triangle, so f=h. This would allow at most one blue edge, contradicting the at least four.

In the K4 case, let z be the fifth vertex. A blue edge incident to z would lie in an eligible member of F containing z, a contradiction, so all blue edges lie inside that K4. For any such blue edge f, the triangle formed by f and z must contain the forbidden root e; otherwise it is an eligible member of F outside the K4. Therefore e joins z to a vertex v in the K4 and every blue f is incident to v. There are at most three such edges, again a contradiction. Thus F has an edge-disjoint pair. QED.

The analogous red-root statement for K4 covers of size at most4 follows from the arbitrary-root five-edge-union argument above.

**Theorem B-MIXED-TWO.** If G contains edge-disjoint K4/K5 blocks with total local minimum-cover cost2b and tau(G)<=2b+2, then S holds.

**Proof.** The lower bound tau(G)>=2b is automatic. At equality use B-SAT. Let C be a minimum cover with one or two units of excess.

If C contains an edge outside the block supports, choose its actual private triangle Q. The remaining total excess within blocks is at most one, so every block restriction is minimum or has only one extra red edge. B-ROBUST gives a full eligible local packing avoiding Q's at most one edge in each block. Adjoin Q to obtain b+1 eligible triangles.

Suppose instead every red edge lies in a block. Choose a block B whose restriction is overfull and replace that restriction by a local minimum cover. The resulting set is smaller than C, hence by global minimum cardinality it fails to cover some actual triangle Q. This Q cannot lie inside B or another block. It meets B in at most one edge, and the other two graph edges are unchanged by the replacement. Therefore Q was an ACTUAL PRIVATE triangle under C, whose unique red edge e lies in B and was removed. In particular the root to be avoided in B is red.

The restriction to B has at most two extra reds, so B-REDROOT (or its K4 counterpart) supplies a full eligible local packing avoiding e. Every other block has at most one extra red, because the total excess is at most two and B has at least one. Apply B-ROBUST there to avoid Q's possible single edge. The block packings together with Q are edge-disjoint and eligible, of size b+1. This reaches ceil(tau(G)/2) for both possible excesses. QED.

The K5 arbitrary-root counterexample remains true: its forbidden root is BLUE. The proof above obtains a red root exactly when a block has two extra selected edges, and uses arbitrary-root robustness only in blocks with at most one extra selected edge. This distinction is the mechanism that makes the stronger statement valid.

## 14. Final scope, corrections and review handoff

Track B's general conclusion remains S UNPROVED and E UNPROVED. The strongest new structural sufficient theorem is B-MIXED-TWO, with B-ONE-345 covering certificates containing K3 blocks at one unit of slack. The attachment theorem gives a valid reduction and explains connected near-two examples with positive loss, while B-LP and B-CUT give genuinely different sufficient mechanisms with explicit missing bridges.

The new kernel certificate audit is precise: `evidence/one_slack_kernel_certificates.json` certifies the kernel beginning545c3d746e1f with total block cost10 (two K5s and two K3s). The other three twelve-vertex kernels have no edge-disjoint K3/K4/K5 certificate of cost at least10 under the coordinator's complete check. Their odd cover number11 means the even-cost B-MIXED-TWO test would also need cost at least10, so it does not silently dispose of them. Each has tau*=31/3, delta=2/3, and the scalar LP bound reaches only five versus target six. Independently checked all-minimum-cover packings have k7 in all three. These remain finite positive controls outside the proved certificate classes, not counterexamples.

An early informal expectation in the independent review that all four kernels might contain two K5s and a K4 was rejected by literal edge checks. No such claim appears as a theorem here. The actual one-kernel positive certificate and three negative certificate-search results replace that expectation.

The fresh independent critic verified eleven full and ten eligible rational LP certificates and844 weighted-cover rows without importing the simplex; receipt `evidence/critic_fractional_check.json`. The critic directly inspected the1991 primary source for Füredi's theorem, while the1981 access here was web-extracted text. Track A independently checked the signed-cut proof and the uniform K7 relaxed-cover lower bound. Track A and the critic checked the one-slack theorem; the final red-root/two-slack refinement was independently reconstructed and accepted in its ordinary scope by both the coordinator and fresh critic before freeze. The local finite receipt additionally checks all840 size-six K5 cover/red-root pairs, all passing. These are internal ordinary reviews, not formal or external human verification.

The negative controls remain scoped: unique minimum cover does not ensure full packing compatibility; a full K7 packing needs a cover of size at least11; fractional all-red mass can be identically zero while integral loss varies; and K5 arbitrary-root robustness fails at two extra local reds. None refutes S/E. No original source was modified, no dependency installed, no Lean or remote process launched, and no publication attempted. New scripts write only under this mission's checks/evidence directories and use no Python bytecode in originals.

## 15. Bounded continuation: two-slack K3/K4/K5 certificates

The coordinator authorized a further bounded frontier investigation after the first freeze. This section supersedes the earlier statement that the last three kernels remain outside all proved certificate classes. It does NOT claim the unrestricted TWO-345 extension.

Let edge-disjoint clique blocks have summed local cover cost B and let o be the number of K3 blocks. Their total ordinary packing capacity is

    p = (B+o)/2.

For a globally minimum C with tau(G)=B+2, the sum of local excess red counts above the block minima, plus red edges outside all blocks, is exactly two.

**Local loss observation.** A K4 restriction with at most two extra reds has at least two blue edges, hence an eligible triangle. A K5 restriction with at most two extra reds has at least four blue edges, hence an eligible two-packing. For the latter statement, choose any two distinct blue edges: adjacent edges ab,ac extend to disjoint triangles abd,ace using the other vertices d,e; disjoint edges ab,cd extend to abz,cdz using the fifth vertex z. Each chosen triangle has a blue edge and has a red edge because the restriction is a cover. A K3 block becomes ineligible only when all three of its edges are red, which costs two extra reds. Thus at most one K3 block can be ineligible, and all K4/K5 blocks retain their full local packing capacities.

**Theorem B-TWO-345-MANY-TRIANGLES.** Suppose edge-disjoint K3/K4/K5 blocks have cost B>=tau(G)-2 and there are at least four K3 blocks. Then S holds.

**Proof.** If B is tau or tau-1, use B-SAT or B-ONE-345. Otherwise tau=B+2. The local observation yields k(G,C)>=p-1=(B+o-2)/2 for every minimum C. Since B and o have the same parity, o>=4 implies

    (B+o-2)/2 >= ceil((B+2)/2).

For even B the smallest allowed o is4; for odd B it is5. This is precisely the desired threshold. QED.

**Theorem B-TWO-345-TWO-TRIANGLES.** The same conclusion holds when o=2.

**Proof.** Again only B=tau-2 needs consideration. If neither K3 is all-red, every block retains full local capacity p=(B+2)/2=tau/2, enough. If one K3 R is all-red, it consumes both units of excess; the other K3 T and all K4/K5 restrictions are minimum, and there are no outside red edges. The edge-disjoint triangles R and T share at most one vertex v. Choose an edge e of R avoiding v (any edge if their vertex sets are disjoint), and an actual private triangle Q for e under C. It is edge-disjoint from T: its two vertices on e lie outside T and its third vertex contributes at most one shared vertex. It is not inside any K4/K5 block because it uses e from R, so it meets each clique support in at most one edge. Choose a root-avoiding maximum eligible packing in each clique and adjoin T and Q. This yields exactly p eligible triangles, meeting the threshold. QED.

The independent critic supplied and checked the o=2 proof. Together with B-MIXED-TWO for o=0, the two-slack extension is now proved for o in {0,2} or o>=4. The unresolved structural cases of unrestricted TWO-345 are precisely o=1 and o=3 (when no alternative better certificate is available); they are not established counterexamples.

### Structural certificates for the final three kernels

Each remaining kernel has tau11 and contains one K5 plus five edge-disjoint K3s, for B=4+5=9 and o=5. Thus B-TWO-345-MANY-TRIANGLES guarantees an eligible six-packing for EVERY minimum cover, reaching ceil(11/2)=6. The literal blocks are:

* `4c21554d63d3...`: K5 on {0,2,7,10,11}; triangles {6,9,10}, {3,5,9}, {3,4,7}, {4,6,8}, {0,1,8}.
* `85fe064961fd...`: K5 on {3,5,6,9,10}; triangles {3,4,7}, {2,10,11}, {4,6,8}, {0,7,11}, {0,1,8}.
* `1299d6e8bd49...`: K5 on {0,2,7,10,11}; triangles {5,9,10}, {3,6,9}, {3,4,7}, {4,6,8}, {0,1,8}.

`checks/track_b_two_slack.py` uses no discovery-solver imports. It directly regenerates actual triangles, checks that each block exists and the supports are pairwise edge-disjoint, checks the cost and capacity, and verifies local eligible packing witnesses for the210 sourced minimum covers of each graph. In fact, all630 supplied optimum covers leave all five selected K3s eligible, so these SAME block families supply eligible seven-packings throughout the saved all-optimum lists. This stronger full-packing observation is a finite receipt; the general theorem's guarantee is six. The independent global optimum/all-cover verification is credited to the earlier critic, not to this new literal checker.

The resulting certificate is `evidence/track_b_two_slack.json`, first-run time0.138seconds. The old negative result “no certificate of cost at least10” remains true; these are cost9 certificates justified by a different theorem, not a reversal of that exhaustive search result. The LP parity endpoint also remains a genuine limitation of the scalar LP bound.

### What remains of the small-o obstruction

For o=3, if no K3 is all-red, the local capacities already reach the threshold. Only one all-red K3 R needs repair. Two other K3 blocks can obstruct private witnesses at different R vertices, so the o=2 opposite-edge argument does not immediately apply.

For o=1, even when the K3 is eligible the local capacities are one below the threshold; when it is all-red the shortfall is two. A pair of edge-disjoint private triangles using different red edges of R meets a clique block in at most two edges, and if it meets two they are adjacent: that clique can contain at most one vertex of R, because it is edge-disjoint from the complete triangle R. K4 local minimum covers have an eligible face avoiding two adjacent edges. A K5 minimum cover can fail this stronger avoidance property: with red partition {a,z,w}|{x,y}, forbidding the blue edges ax,ay leaves the only remaining triangle through a, namely azw, all-red; the other four vertices alone cannot pack two triangles. This is an exact local obstruction to naive simultaneous repair, not a failure of TWO-345.

For the all-red-R case with only ONE K5 block, the coordinator's repair works. If a bad pair is Q1=a u x and Q2=a v y, where R=a u v and ax,ay are the obstructing K5 blue edges, choose a private Q3=u v w of the third red edge. The K5 meets R only at a, so Q3 uses none of its edges. Also w=a is impossible because R is all-red. If w!=x, Q1 and Q3 are disjoint; if w=x, Q2 and Q3 are disjoint. The K5 then needs to avoid only one edge. Any additional K4 blocks can avoid the at most two adjacent edges from the chosen pair. This repairs that particular all-red fan configuration. It does not settle all o=1 cases, especially the initially eligible K3 case or several interacting K5 blocks.

The critic identified a possible fully blocked multi-K5 fan pattern leading to a six-vertex octahedral red/blue core. No globally safe cover pivot or terminating migration argument for that pattern has been proved here. Thus the useful outcome is the proved parity/K3-count extension and concrete resolution of the three saved kernels, with the general small-o bridge explicitly left open.

## 16. A quantitative unique-private-edge migration

**Lemma B-UNIQUE-PIVOT.** Let C be a globally minimum triangle cover, let P be an eligible packing of size m, and let R be an all-red triangle edge-disjoint from P. Suppose one edge e of R has exactly one actual private triangle Q. If |C|<=m+4, a one-edge migration to another globally minimum cover makes all m+1 triangles of P union {R} eligible.

**Proof.** Write f,g for the two blue edges of Q. Both C-e+f and C-e+g are covers of unchanged size: deleting e uncovers exactly Q, while every formerly T2/T3 triangle retains another red edge. The packing P avoids e. If p2 members of P have two red edges, edge-disjointness from R gives m+p2+3<=|C|, hence p2<=1. Adding one blue edge can turn a member of P all-red only if that member was T2 and the added edge was its sole blue edge. At most one of the distinct choices f,g is therefore blocked. The other migration preserves all of P, and R loses precisely e and becomes eligible. QED.

Thus if C maximizes k(G,C) among globally minimum covers and an all-red R is free from a maximum eligible packing and has a uniquely witnessed edge, then tau(G)>=k(G,C)+5. This is a strict improvement mechanism under a substantive numerical hypothesis, not a rewording of E. Applied to a full packing of size nu with one all-red member, it works whenever tau<=nu+3. The coordinator's accepted theorem E for nu<=4 uses the exact (tau,nu)=(7,4) instance after the independently reviewed Track A fan classification; the lift to tau8 uses the separately accepted ordinary Tuza input in that packing range. No unrestricted E or fixed-cover S conclusion follows from this lemma alone.

## 17. Final bounded fixed-cover frontier: a nonsingleton exclusive family

This section starts from the remaining Track A structural case, not from a hypothesis inferred by computation. Let C be globally minimum, k(G,C)<=3, and R=abc all-red. There is exactly one common private apex x. Edge ab has the unique private triangle abx. Write

    N_ac={x,y},       N_bc={x} union B,

where |B|>=2, and y and all members of B are exclusive private apices. All seven types of spokes ax,bx,cx,ay,cy,bz,cz (z in B) are blue; by and az are absent or red. Let D=C minus E(R).

Every actual private triangle Q of a red edge in D has exactly one vertex in R. With zero vertices it is edge-disjoint from the eligible fan three-packing {abx,acy,bcz}, for any z in B, giving four. It cannot have two R vertices because their joining edge is another red. It must block EVERY fan packing of this form.

At vertex a, such Q must contain ax or ay. At b, it must contain bx or all b-B spokes; the second alternative is possible only when |B|=2 and Q has the two B vertices. At c it must contain cy or all c-B spokes, again the latter only for |B|=2. This is an exact intersection test: the three fan members use disjoint red labels, Q has no R-red edge, and only its spokes at its single R vertex can intersect them.

### Classification of the outside red edges

1. A red a-spoke au has all actual private apices in {x,y}. It cannot have only x, because its unique witness aux would share the blue edge ax with the unique witness abx, contrary to the minimum-cover unique-witness lemma A1. Thus every such u is blue-adjacent to y. It either also is blue-adjacent to x (a double-private spoke), or has only the private apex y.
2. There are no red b-spokes. Such a spoke could have only private apex x: a private triangle through it has just one blue b-spoke and cannot contain all |B|>=2 B-spokes. Its unique witness would conflict with abx at bx.
3. A red c-spoke cv has only private apex y. An individual private triangle cvw contains only ONE blue c-spoke cw, so it cannot block the entire B family of size at least two. In particular a second apex in B does not help: each private triangle separately must block every fan three-packing. Its unique witness is cvy.
4. Among red edges incident to x, only xy is possible. For a candidate xv, any private witness at a or b either forces v to be an exclusive apex (because a second blue R adjacency supplies the corresponding root-private triangle), or is the sole private witness and conflicts with abx. If v is in B, the forced private triangle cxv contains neither cy nor both B-spokes and fails the intersection test. A private witness at c likewise passes that test only when v=y. Thus xy is the sole surviving case.
5. Every remaining red edge has form yv, or is the pair zz' when B={z,z'}. A yv edge distinct from xy has exactly one actual private witness, at a or at c. It cannot have both because av and cv blue would imply v is another private apex of ac, contrary to N_ac={x,y}; it cannot have private apex b by the intersection test. The B-pair has its private witnesses at b and c.

By A1, at most one unique actual private witness can use ay, and at most one can use cy. The first allowance includes a possible y-only red a-spoke and a possible yv rim edge witnessed at a; they cannot both occur. The second includes red c-spokes and yv rim edges witnessed at c. Apart from double-private a-spokes, D therefore consists of at most these four types: the ay-unique edge, the cy-unique edge, xy, and the B-pair.

### Double-private a-spokes permit a smaller cover

Suppose a double-private a-spoke au exists. Then xy is absent: it cannot be blue because axy would be all-blue; if xy were red, uxy would be a private triangle for xy having no R vertex, giving four with the fan packing.

If there is a y-only a-spoke av, then bv is not blue. Otherwise choose z in B different from v (possible since |B|>=2). The triangles

    aux, abv, acy, bcz

are four eligible edge-disjoint triangles. Here u is outside B: ux, cx, cu could not all be blue, so u cannot be a B apex. Also u,v,x,y are distinct in the required places. The displayed packing contradicts k<=3. For a double-private a-spoke av, bv also cannot be blue, now because vx and bx are blue and a blue bv would give the uncovered triangle bvx.

Remove ab, every red a-spoke in D, and the possible ay-unique rim edge yv. Add ax and ay. This produces a triangle cover:

* Any newly uncovered triangle with exactly one removed red edge would be an actual private witness, and is hit by ax or ay; a retained red edge already covers every other such triangle. The unique witness of ab is abx; a-spoke private witnesses use ax/ay; the removed rim edge has its unique witness using ay.
* A triangle containing two removed a-spokes has its third edge between their outside endpoints. Every such endpoint is blue-adjacent to y, so that third edge cannot be blue; if red it was retained, unless it is the removed rim edge. It cannot be that rim edge because none of those endpoints is y.
* A triangle containing removed ab and a removed a-spoke av would need blue bv to become uncovered, and this was excluded above.
* The removed rim edge yv cannot lie in a triangle with removed ab (the edges are disjoint: v is not a or b), or with a removed a-spoke au. In the latter case v=u would be necessary, but then uy is blue by item1, contrary to yv being red. The other possible shared endpoint y cannot be an a-spoke endpoint because ay is blue.

The resulting cover has at most six edges: the retained ac,bc; the two added ax,ay; at most one cy-unique edge; and at most one B-pair. Therefore tau<=6.

### No double-private a-spoke

If none exists, |D|<=4 by the classification. If tau>=7, all four types must occur: xy, a B-pair zz' (so B has exactly two members), an ay-unique edge with private witness Qa, and a cy-unique edge with private witness Qc. The four triangles

    abx, Qa, Qc, bzz'

are eligible and edge-disjoint. Qa and Qc are edge-disjoint by A1. Qa has vertices a,y,v and Qc has c,y,w; neither can use x because its red label would then be xy, already a separate type. Neither can contain a second R vertex, by the initial private-triangle observation. Hence both avoid abx. Finally bzz' has only the R vertex b and the two B vertices, whereas Qa and Qc each have their displayed R vertex, y outside B, and only one remaining vertex. Each shares at most one vertex with bzz', so has no common edge. This contradicts k<=3. Thus tau<=6 also in this case.

**Lemma B-U1-NONSINGLETON.** Under the displayed remaining U1/unique-ab hypotheses, if one exclusive family has size one and the other has size at least two, then tau<=6. The fresh independent critic reconstructed and accepted the classification, the cover exchange including all two-removed-red cases, and the final four-packing; its one wording correction about newly uncovered triangles is incorporated above. The case where both exclusive families have size at least two has the simpler classification D contained in the pair inside each size-two family, giving tau<=5. The critic also accepted the latter branch. Thus the only remaining U1/unique-ab fixed-cover case has N_ac={x,y}, N_bc={x,z} with x,y,z distinct. This is a precise structural gap, not yet a fixed-cover S theorem.

## 18. The final singleton profile: independently accepted ordinary proof

The fresh independent critic separately reconstructed and ACCEPTED the complete ordinary proof in this section at the final review. The reviewer checked the classification, all crossing-triangle replacements, doubled-type packings including coincident leaves, and the final four forbidden-anchor cases; its review did not rely on the finite local receipt. Track A supplied the final c-star closure and independently checked the a-star branch; Track B supplied the safe core-cover replacement mechanism, no-star case and nonsingleton reduction. The proof uses actual private triangles throughout.

**Lemma B-SINGLETON.** Let C be globally minimum and k(G,C)<=3. Suppose R=abc is all-red, with exact private-apex families

    N_ab={x}, N_ac={x,y}, N_bc={x,z},

where x,y,z are distinct. Then tau(G)<=6.

Write H=G[{a,b,c,x,y,z}] and W=V(G) minus V(H). The red root edges are ab,ac,bc. The seven compulsory blue edges are ax,bx,cx,ay,cy,bz,cz. The fixed eligible three-packing is

    F={abx,acy,bcz}.

Every private triangle of a red edge outside E(R) must intersect F, or it augments F to four. It has exactly one R vertex: two would give another red root edge; zero would use no edge of F. The available blue anchors at its single R vertex are ax or ay at a, bx or bz at b, and cy or cz at c. In particular cx does not block F.

### Complete outside-red classification

No apex-pair edge xy,xz,yz is blue, because each has the common blue neighbor c. The opposite core edges az and by are absent: if, for example, az were red, its private apex at a would have to be x or y, but zx and zy are not blue; a private triangle with another R vertex has another root red, and a private triangle outside the allowed anchors misses F. The argument for by is symmetric.

For edges involving W:

* There is no red edge joining two W vertices. A private witness would need one R vertex and two W vertices, so would use no anchor of F.
* There is no red edge xu with u in W. Its private witnesses can only be axu or bxu; cxu misses F. If just one exists it is unique and shares ax or bx with the unique private triangle abx, contrary to A1. If both exist, u is a second private apex of ab, contrary to N_ab={x}.
* A red yu has exactly one actual private witness, at a or c. Having both would make u a third private apex of ac. A red zu similarly has exactly one private witness, at b or c.
* A red au has private apices among x,y; x alone is forbidden by A1 and abx. Thus it is either uniquely witnessed through y or doubly witnessed through x,y. A red bu is either uniquely witnessed through z or doubly witnessed through x,z. A red cu has private apices among y,z and is either unique or doubly witnessed through both.

Thus every red edge outside H either has exactly one actual private witness or is a doubled spoke of one of three types:

    A+: au with private apices x,y;
    B+: bu with private apices x,z;
    C+: cu with private apices y,z.

Let q be the number of outside-H red edges with a unique actual private witness. A1 says all their witnesses, together with the unique abx, form an eligible packing. Hence q<=2. Every such witness has exactly one H edge, its blue anchor, among ay,bz,cy,cz. Anchors ax and bx are excluded by A1 against abx, and cx misses F.

At most one doubled-spoke type occurs. If au is A+ and bv is B+, the four triangles aux,bvz,acy,bcx are edge-disjoint and eligible. If au is A+ and cw is C+, use aux,cwz,acy,bcx. If bv is B+ and cw is C+, use bvx,cwy,bcz,acx. The leaves may coincide without introducing a common edge; all displayed blue-apex labels are distinct where needed.

### Core-red private-witness confinement and replacement

Every actual private witness of a CORE RED edge lies within H. This holds for root edges by their exact stated apex families. For an optional red apex pair xy,xz or yz, a witness with its third vertex in W has no R vertex, misses F, and would give a fourth eligible triangle. Opposite edges az,by are absent, so there are no other core reds.

Consequently replacing C intersect E(H) by ANY triangle cover of H, while retaining all red edges outside H, is a globally valid cover replacement. An actual triangle not contained in H has at most one H edge. If it has a retained outside red it stays covered; otherwise its old unique red would have been a core red with an actual private witness outside H, which was excluded. No minimum-cardinality assumption on the local restriction is being made.

If no doubled spoke occurs, all outside reds are the q<=2 unique labels. The local set

    L0={ac,cz,bx,xy} intersect E(H)

covers H. Indeed H is a subgraph of K6 minus the two disjoint edges az,by, and L0 is the within-part edge set for the bipartition {a,c,z}|{b,x,y}. Its size is at most four. Replacing core reds by L0 and retaining the q outside reds gives tau<=6.

### The A+ branch and its symmetric B+ branch

Suppose au is A+. Then bu and cu are absent. They cannot be blue because ux is blue and bx,cx are blue. If bu were red, bux would be private; its x-only family is forbidden, so it would also have apex z and be B+, contradicting the incompatibility above. If cu were red, cux would be a private triangle missing F, giving four. Thus u has no blue R neighbor, and no other red edge incident to u can have an allowed private witness. Its only incident red edge is au.

Also xy is absent: it is not blue; if red, uxy would be a private triangle with no R vertex and would augment F. These assertions hold for every A+ leaf.

If q=2, let Q1,Q2 be the outside unique witnesses. Neither can contain u: a private triangle through a and u has the red label au, which is double, while bu and cu are absent; a private witness with no R vertex is forbidden. Their H anchors lie among ay,bz,cy,cz, so both avoid the H triangle bcx. Therefore

    aux, bcx, Q1, Q2

are four edge-disjoint eligible triangles, a contradiction. Hence q<=1.

Because xy,az,by are absent, the local set

    LA={ax,ay,bc,cz,bx}

covers H. Replace ALL core reds and ALL A+ spokes by LA, retaining the at most one outside unique label. Private A+ triangles are hit by ax or ay. Any new uncovered triangle involving a removed A+ spoke au and a core red would require bu or cu, which are absent; any other such triangle was already excluded by the complete private family, or has a retained outside red. Two A+ leaves share the blue neighbor y, so their joining edge cannot be blue; if it were red and retained it would cover the triangle, while it cannot be another removed spoke or core edge. Thus the replacement is globally valid and has size at most six. The B+ case is symmetric under a↔b and y↔z.

### The C+ branch

Suppose cu is C+. Then au and bu cannot be blue, since uy,uz and ay,bz are blue. The edge ux is absent: it cannot be red by the outside classification, and if blue cux would be private and miss F. The apex edge yz is absent: it cannot be blue; if red, uyz would be private outside R and augment F.

More generally, replacing all core reds AND all C+ spokes by any local cover of H containing cy and cz is globally valid while retaining outside unique reds. The private C+ witnesses are repaired by cy,cz. A triangle containing a removed C+ spoke cu and a removed core red ac or bc could become uncovered only if au or bu were blue, which was excluded; if either is red, it is an outside unique label and is retained. No other removed core red can join cu in a triangle. A triangle using two removed C+ spokes has a third edge between leaves sharing the blue neighbor y, so that edge is not blue; any retained red covers it. Core-red private confinement handles the remaining cases.

If xy is absent, the local cover

    LC1={cy,cz,ac,bx}

has size four and contains cy,cz. If xz is absent, use LC2={cy,cz,bc,ax}. Retaining q<=2 outside uniques therefore proves tau<=6 in either case.

It remains that both xy and xz are red. Suppose q=2, with unique witnesses Q1,Q2. The three triangles abx,Q1,Q2 are edge-disjoint by A1. Each C+ witness cuy and cuz is disjoint from abx and so must intersect Q1 or Q2. No single private triangle Q can intersect both cuy and cuz: sharing their common red cu would make its label cu rather than unique; selecting one other edge from each requires four vertices except the pairs cy,cz or uy,uz, which would require the absent edge yz. Thus one Q, call it QY, intersects cuy, and the other QZ intersects cuz. The H anchor of QY lies in {ay,cy}; the anchor of QZ lies in {bz,cz}. An intersection at uy forces QY=auy with anchor ay (the other allowed R vertex c would give label cu), and similarly an intersection at uz gives anchor bz; intersections at cy or cz give those anchors directly.

For each possible pair of H anchors there is an eligible H two-packing avoiding both:

    anchors cy,cz: axy and bcx;
    anchors cy,bz: axy and bcx;
    anchors ay,cz: bxz and acx;
    anchors ay,bz: abx and cxy.

Each displayed pair is edge-disjoint; xy and xz are red and the listed spokes are blue, so all its members are eligible. The crossing private triangles QY,QZ each have exactly their one anchor in H, so adjoining them gives four eligible edge-disjoint triangles. This contradiction proves q<=1.

Finally

    LC3={cy,cz,ax,bx,ab}

is a local cover of H containing cy,cz, of size five. Apply the proved core-plus-C+-spoke replacement and retain q<=1 outside unique reds to obtain a cover of size at most six. This finishes the singleton lemma. QED.

Combined with the independently accepted nonsingleton lemma in section17 and Track A's previously accepted zero-/two-universal and no-unique-edge cases, this proves the ordinary implication: if a globally minimum cover C has k(G,C)<=3 and contains an all-red triangle, then tau(G)<=6. Together with the previously accepted small-packing ordinary Tuza input and the lower-threshold Track A lemmas, this yields S for tau(G)<=8 and S for nu(G)<=4. This does not assert full packing attainment for every minimum cover throughout nu=4 when tau<=6. General S and E remain unresolved.


Final local receipt: `checks/track_b_singleton_local.py` independently checks20 local-cover rows across the eight optional apex-pair patterns and all four forbidden-anchor eligible-packing rows; `evidence/track_b_singleton_local.json` records PASS. This bounded literal verification checks only the local tables, not the global ordinary classification proof. The latter is supported by the fresh independent critic's separate reconstruction. Track B is frozen after this accepted strengthening; earlier first-freeze status paragraphs are historical and are superseded by sections15–18.
