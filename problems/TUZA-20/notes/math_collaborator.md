> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Gain prepayment: a concrete obstruction to Candidate 01

Status: ordinary argument proposed for independent reconstruction. The labelled finite instance and independent checker are to be supplied separately. This refutes the owner-choice restriction of Candidate 01; it does not refute PK-all, PK-exists, or Tuza. No novelty or Lean claim.

## Relevant source reconstruction

For a maximum edge-disjoint triangle packing P, two private pages of one owner on different bases cannot have different tips, since they would replace that owner by two edge-disjoint triangles. Two distinct private bases therefore share a unique tip and complete a private K4; its third face is private too. Thus types are 0,1,3. The fixed all-type-one problem has A(P)=B(P), all bases forced, and all actual residual clauses have two or three spokes from distinct owners.

The corrected multi-page cover costs 3k-2m+2p. The stronger published triple lemma states that every base-free triangle with three type-one owners has two singleton owners whose private pages intersect outside B. That statement does not license deleting the third literal.

For a singleton owner abx with unique page abz, the gain xz, if actual, belongs to B: otherwise both axz and bxz are private spoke pages, contradicting type one. This verifies the elementary premise of gain prepayment, but not its proposed global cover consequence.

## Candidate being refuted

Let L be singleton owners with an actual gain, F the set of their gains excluding the already selected private bases. Candidate 01 selects all bases and F, then permits additional spokes only from owners outside L (at most one per ordinary owner, with a separate exceptional-pair allowance). A gain which is already a selected base nevertheless places its lender in L and forbids that lender's spokes. The counterexample exploits exactly this restriction.

## General construction

Let J be any finite simple ordered graph, with m edges. For every edge e=ij with i<j introduce fresh vertices x_e,y_e,w_e. For every head j of an edge introduce a fresh vertex z_j. All these vertices are mutually distinct and outside V(J).

Retain all J edges and add, for every e=ij,

    ix_e, jx_e, jz_j, z_jx_e, iz_j,
    iy_e, z_jy_e, iw_e, z_jw_e.

Repeated jz_j is one actual edge. Add no other edges. Specify

    T_e=ijx_e, R_e=iz_jy_e,
    P={T_e,R_e : e in E(J)}.

These 2m triangles are pairwise edge-disjoint: each R_e uses a distinct edge iz_j, while its other edges use its fresh y_e; T_e supports are the original disjoint pages, and none of their edges is an R edge.

## Complete triangle accounting

Every triangle is of one of these forms:

1. A triangle of J.
2. T_e=ijx_e.
3. Q_e=jz_jx_e.
4. U_e=iz_jx_e.
5. R_e=iz_jy_e or W_e=iz_jw_e.
6. z_j u v, where u,v are distinct core vertices adjacent in J and each lies in {j} union {i<j:ij in E(J)}.

The list is complete. Each x_e has exactly neighbours i,j,z_j, which span the triangle ijz_j; hence its three faces are precisely T_e,Q_e,U_e. Each y_e and w_e has exactly the two neighbours i,z_j. There are no edges among z vertices or between different fresh x/y/w vertices, so any remaining triangle containing a z has two core vertices. The only remaining triangles lie in J.

## All owners are singleton type one

For T_e, Q_e is private on base jx_e. U_e meets both T_e (at ix_e) and R_e (at iz_j). No other triangle contains its two x_e edges. A core triangle meets three original T owners. A z_j core triangle contains at least one gain iz_j in an R owner as well as its J edge in a T owner; thus it cannot give a second private base to T_e. Consequently Q_e is the unique private page of T_e.

For R_e, W_e is private on base iz_j. Every other triangle on iz_j either is U_e and uses ix_e in T_e, or contains a core edge in an original T owner, or is R_e itself. The fresh y_e lies in no other triangle. Thus W_e is the unique private page of R_e.

Therefore every owner is type one with one private page. The gain of T_e is iz_j, which is exactly the base of R_e. The gain of R_e is y_e w_e, which is absent. No exceptional multi-page K5 pair occurs. Hence L={T_e}, F is empty, and all permitted additional candidate spokes lie in the R owners.

## Maximum packing, uniformly in J

Let H={iz_j:e=ij in E(J)}. These are m distinct actual graph edges. Deleting H leaves the archived arbitrary-core embedding on J and isolated y_e,w_e vertices. For completeness its maximum packing is m:

The remaining triangles are core J triangles, T_e, and Q_e. If a packing has q core triangles, they use 3q distinct J edges. For e outside those edges, at most one of T_e,Q_e is usable because both contain jx_e, contributing at most m-3q. For the used edges, T_e is unavailable. Chosen Q_e have distinct heads j because equal heads share jz_j. Each ordered core triangle has only two possible heads among its three edges, so these 3q edges have at most 2q distinct heads, contributing at most 2q pages. Total is at most q+(m-3q)+2q=m. The m original T_e attain equality.

In G, any packing has at most m triangles meeting H, because those triangles are edge-disjoint and each uses a distinct edge of H. Its triangles avoiding H form a packing in G-H, of size at most m. Therefore nu(G)<=2m. The displayed P attains 2m, so it is maximum.

## Exact failure and cheap valid cover

All residual core triangles use only original T_e spokes, and no gain lies in J. Candidate 01 forbids every such spoke. If J has any triangle, no candidate cover can hit it, regardless of its allowed R choices.

A permitted cover is nevertheless easy. Select all 2m private bases, and any edge cover D of the triangles of J. Every noncore triangle in the complete list meets a selected base: T_e,Q_e meet jx_e; U_e,R_e,W_e meet iz_j; each z_j core triangle meets a gain iz_j. Thus the exact allowed optimum is

    c_G(P)=2m+tau(J).

The lower bound follows because every private base is forced for a B-contained cover, and the core triangles require a disjoint set of J edges forming a triangle cover of J. The upper bound is the explicit construction. Since tau(J)<=m, this gives c_G(P)<=3m<4m=2|P| for m>0. The construction is far from a PK failure.

## Small literal instance

Take J=K3 on 0,1,2. Set

    z_1=3, z_2=4;
    (x_01,y_01,w_01)=(5,6,7);
    (x_02,y_02,w_02)=(8,9,10);
    (x_12,y_12,w_12)=(11,12,13).

Then G has 14 vertices, 29 edges, 20 actual triangles, nu=6, and c_G(P)=7. A cover is the six bases plus core edge01. These counts are predictions from the complete construction, pending independent literal checking. The proof of maximum cardinality above is ordinary and does not depend on a solver.

## What this supplies and what remains

The failure isolates an accounting mistake: selecting an already forced base as a gain spends zero additional edges, but the candidate discards the lender's entire residual choice budget. A revision must retain that surplus globally. Even replacing this rule by freely spendable total credit is not a proof: a theorem must show all residual clauses can be hit within the remaining budget, with repeated gains charged once and all crossing triangles retained.

This obstruction does not motivate page rotation, since the original allowed set already has a cheap cover. It motivates a precise next test: allow all owners to receive spokes after preselecting distinct nonbase gains and ask whether a full residual cover of size at most k containing those gains always exists. That stronger-than-PK forced-gain statement remains a conjecture. Its failure, if found, would show that mandatory gain preselection itself is too rigid, beyond the zero-cost lender issue exposed here.
