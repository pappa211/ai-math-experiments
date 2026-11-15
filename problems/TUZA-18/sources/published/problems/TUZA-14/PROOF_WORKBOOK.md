# TUZA-14 proof workbook

Definitions and frozen S/E targets: TARGETS_AND_CLOCK.md. All graphs are finite simple; every triangle family below is reconstructed from actual graph edges. Packings are disjoint in graph edges and may share vertices. C always means a globally minimum triangle cover unless a lemma expressly starts with an arbitrary cover. An arbitrary inclusion-minimal cover is insufficient.

## Implication map and final truth status

    S: every optimum cover has 2k>=tau
       => E: some optimum cover has 2k>=tau
       => unrestricted Tuza: tau<=2nu(full triangles).

No converse is established. S and E remain UNPROVED, with no central counterexample. X1/X2 below characterize covers but do not imply a proved packing bound. A2 proves only a scoped sufficient condition. Refutations A3/A4/B1/B5/B8/B9 concern their literal auxiliary statements. The final work is ordinary mathematics and FINITE_CHECKED experiments, not formal proof.

## 1. Reconstructed minimal-counterexample facts

For every R subset of a specified minimum C,

    tau(G-R)=|C|-|R|,
    A(G-R,C-R)={T in A(G,C): E(T) intersects R trivially}.

C-R is a cover. Adding R to any smaller residual cover would improve C; surviving triangles retain exactly their old red edges. More generally, for ANY S subset E(G), tau(G-S)=tau(G)-|S| if and only if S is contained in some global optimum cover. The reverse direction adjoins S to a residual optimum.

For a failing S pair chosen with the fewest graph edges among ALL failing pairs, put c=|C| and k=k(G,C). Red-edge deletion and minimality yield c-1<=2k<c, hence c=2k+1. For every nonempty R subset C,

    k(G-R,C-R)>=ceil((c-|R|)/2),
    k-k(G-R,C-R)<=floor((|R|-1)/2).

Thus each red singleton or pair is avoided by some maximum eligible k-packing of the SAME C. The packing depends on the deleted set. Every edge is tau-critical: red edges by the identity; a blue noncritical edge could be deleted retaining the same optimum C and the failure. An edge is tau-critical exactly when it belongs to some optimum cover, not necessarily the selected C.

A pair with k=0 has c=0 because every red edge has a private triangle. A pair with k=1 has c<=2: pairwise edge-intersecting triangles have a common edge or lie in one K4. Private witnesses then either force all red edges into a bipartite double-star (so there is no all-red triangle and the common edge covers everything), or confine all red edges and all triangles to the K4. Hence a minimal failure has c=2k+1>=5.

The full triangle-conflict graph is connected in an edge-minimal obstruction: components have disjoint graph-edge supports, no extra triangles in their support subgraphs, and additive optimum cover/eligible packing values. A failing sum localizes to a component. Triangle-free background edges can be removed. This works for S pairs and E graphs.

For an edge-minimal E-failing graph set K=max_C k(G,C). Delete an edge belonging to an optimum, apply E to the smaller graph, and adjoin the deleted edge to its favorable cover. This preserves the old eligible packing and gives c=2K+1>=5. For any nonempty R contained in SOME optimum cover, the same argument gives an optimum C_R containing R and an eligible packing avoiding R of size at least ceil((c-|R|)/2). For |R|<=2 this is K.

    E quantifiers: for every R there exists C_R and P_R.
    Not established: there exists a fixed C working for every R.

All-edge tau-criticality is not obtained for E by the S argument: a favorable cover of G-e may fail to cover a triangle restored with a noncritical e. These limitations do not refute the stronger unproved properties. Full proofs and independent reconstruction order: notes/STRUCTURAL_AUDIT.md and notes/TRACK_B.md, B2/B3.

### Flexibility is not already an augmentation

K5 with C={01,23,24,34} has c=4,k=2, all edges tau-critical and connected triangle-conflict graph. Every red pair is avoidable by a maximum eligible packing:

| Deleted pair | Avoiding packing |
|---|---|
| 01,23 | 024,134 |
| 01,24 | 023,134 |
| 01,34 | 023,124 |
| 23,24 | 012,034 |
| 23,34 | 013,024 |
| 24,34 | 014,023 |

Ten triangles with each edge in three give tau>=4, attained by C. Three packed triangles would leave a single edge of the even-degree K5, contradicting parity, so nu=k=2. All edges are in some optimum by symmetry. This illustrates why flexibility, criticality and connectivity alone do not force augmentation. The essential odd-deficit hypothesis is absent; this is NOT a counterexample to the full necessary-condition package.

## 2. Track A: integrating private witnesses into a global packing

For a maximum eligible packing with p1 one-red and p2 two-red members, let U_P be the unused red edges. Then c<=2k is exactly |U_P|<=p1. This identifies the demand/capacity problem but proves no injection.

**A1 (PROVED_ORDINARY).** If private triangles for distinct reds e,f share a blue edge, no actual T2 has red set {e,f}. If e,f are disjoint they cannot form a triangle. Otherwise relabel them uv,uw; shared-blue geometry gives private apex x and blue ux,vx,wx. A T2 on uv,uw would require blue vw, creating the forbidden all-blue triangle vwx.

**A2 (PROVED_ORDINARY).** Let U be red edges with exactly one ACTUAL private triangle. Their witnesses are pairwise edge-disjoint. Otherwise replace two conflicting red edges by their shared blue edge: uniqueness repairs T1, A1 excludes an uncovered T2, and two deletions cannot remove all three reds of a T3. This improves C, contradiction. Thus k>=|U|; if 2|U|>=c the desired target holds for this pair. If U=C, k=c.

**A3 (REFUTED_EXACT).** Rejected: some maximum eligible packing contains all these unique witnesses. One unique witness already fails in the nine-vertex K5/K4 arrangement: eligible maximum five, forced maximum four, tau seven. The finite and structural proofs are in the counterexample record.

**A4 (REFUTED_EXACT).** Rejected: at most two private witnesses per red edge guarantee a private-only packing of ceil(c/2). The 20-vertex cone has (c,private,eligible)=(13,6,9). Two-red resource interactions remain necessary under this strong local bound.

**A3-threshold (UNPROVED).** A packing of size at least ceil(c/2) can be required to contain all unique witnesses. The fixed control audit did not refute it. An exploratory stored-record comparison preceded its naming; a subsequent literal freeze and repeat audit are recorded. No new passing census or proof is claimed.

**First unproved step:** convert the private-witness allocation and exact cover optimality into a nonlocal exchange obeying all graph-edge capacities. Safe prepacking and bounded private multiplicity cannot supply that step. Source: notes/TRACK_A.md.

## 3. Track B: favorable optimum covers

Choose C to maximize k over minimum covers, optionally minimizing the number of all-red triangles afterward. Finite existence of this optimizer is not an exchange theorem.

**B1 (REFUTED_EXACT/ORDINARY).** Rejected: max_C k(C)=nu(G). K7 gives 6<7 for every optimum cover, yet target five holds.

**B4 (PROVED_ORDINARY).** A swap (C minus {e}) union {b}, b blue, is an optimum cover precisely when e has a unique actual private triangle and b is one of its two blue edges. Distinct private triangles on e have disjoint blue pairs; every other triangle retains a red. Only a packed T2 using b and avoiding e can become all-red, so at most one packing member is lost.

If a previously all-red triangle T is disjoint from P and contains e, the swap makes T eligible. Without the blocking T2, it increases packing size by one; if P was maximum, k(C')>=k(C)+1. With a blocker, replacing it by T preserves cardinality. This describes migration, not inevitable progress.

**B7 (PROVED_ORDINARY).** If C maximizes k among all optima and P is maximum for C, then for a free all-red T and e in T with unique private witness Q, BOTH blue edges of Q must be used by distinct members of P that are T2. Either unblocked blue swap would give an optimum cover with a larger packing. Distinctness follows because two distinct graph triangles share at most one edge.

**B5 (REFUTED_ORDINARY, FINITE_CHECKED).** Star-local cover optimality does not replace global optimality: red C5 in K5 has c5,k2 and every star optimum, but true tau4. **B8 (REFUTED_EXACT for unconditional progress).** A three-cycle of valid swaps in a ten-vertex graph keeps k and all-red count constant. Its all-red triangle is not free from a maximum packing, so no free-triangle claim is refuted.

**B6 (PROVED_ORDINARY; prior local result rederived).** Every minimum cover of a cone over triangle-free H has no all-red triangle. A red base edge together with any incident red spoke would be redundant. Triangle packing equals matching in H, and triangle cover equals vertex cover in H; matching endpoints prove S for this restricted class.

**B9 (REFUTED_EXACT).** Rejected final bridge: if Q is the unique actual private triangle of a red edge for an optimum C, then tau(G-E(Q))>=tau(G)-2. Equivalently, Q cannot be all-red for any other optimum cover D. The known TUZA-13 cover-drop graph refutes this with tau=7, Q=125, D={03,04,12,15,25,28,36}, and C={02,07,12,13,14,26,38}. The six edges C minus {12} cover every triangle except Q. Thus Q is uniquely private for12 under C, all-red under D, and D minus E(Q) covers the residual with four edges. The general extension lower bound gives residual tau>=7-3=4. The graph itself is prior evidence; its cross-cover/deletion interpretation is the new auxiliary failure. The initial129 checks over the fixed264-cover domain survived, which does not weaken this exact refutation.

**First unproved step:** no global exchange or secondary potential is proved to avoid migration or handle covers with no one-edge move. Removing all-red obstructions alone would still not prove ordinary Tuza for the remaining full triangle family. Source: notes/TRACK_B.md.

## 4. Exact general cover exchanges

X1/X2 (PROVED_ORDINARY): for any cover C and admissible S subset C, force every blue edge of a T2 whose reds both lie S. Call this F(S). On B minus F(S), form H_S from the two-blue pairs of affected T1 triangles whose BOTH blue edges avoid F(S). Exact blue repair cost is beta(S)=|F(S)|+vc(H_S). S containing a T3 is impossible to repair by blue edges. C is globally minimum iff beta(S)>=|S| for every admissible S; equalities and minimum vertex covers of H_S enumerate all alternative optimum covers.

The ordinary inequality vc(H_S)<=2nu(H_S) is insufficient: repeated red labels and overlapping red pairs remain capacity constraints invisible to ordinary matching. This is the first missing bridge to S/E. Complete proof: notes/EXCHANGE_CHARACTERIZATION.md. All3,308 red subsets of eight designated controls reconstruct exactly all246 optimum covers; this is a directed implementation check, not the proof.

## 5. Targeted primary-source comparison

Sichen Wang's [2026 preprint, Section2](https://arxiv.org/html/2609.13831v1) uses the complete family of one-red triangles. Its exchange relies on actual triangle closure and yields a stated 8/3 family-cover bound; the paper states a165/59 general bound. These are not S/E and do not identify a chosen minimum full cover with the eligible-family cover number. No Lean artifact from that paper was imported or rerun.

Aharoni–Zerbib's [published article](https://onlinelibrary.wiley.com/doi/10.1002/jgt.22533) formulates a broader conjecture for pair-covering arbitrary triples. Even a bound for the eligible subfamily's own cover number would not identify it with tau(G); TUZA-13 already refutes that equality. An arbitrary abstract3-uniform incidence system is not substituted for actual graph triangles here.

The accepted TUZA-11 five-edge flat-piece gluing result needs full triangle separation, flat pieces and an actual boundary of at most five edges. Liu's accepted external pair-packing-four input includes the local Table1 class9 correction378 to389; no author-confirmed erratum is asserted. These scopes were read locally and do not supply the missing arbitrary-graph colored exchange. No old Lean theorem, fractional half-integrality assumption or unrestricted integral matching theorem is invoked. No historical novelty determination was attempted.
