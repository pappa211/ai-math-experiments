# Frozen Track B addendum 4: K4-ear reduction for arbitrary apex-neighborhood membership

Coordinator proposal, independently checked by Track B scout, 4 November2026. This strengthens addendum3's outside-X special case; that earlier frozen statement remains valid. Exact AC is unchanged. The result is an ordinary counterexample-preserving reduction with at most two smaller marked instances, not an unconditional proof of AC or an availability theorem.

## Statement

Let H' be an eligible AC remainder containing an actual K4 Q={u,v,a,b}, with e=uv and

    N_H'(a)={u,v,b},  N_H'(b)={u,v,a}.

Thus a,b are the two private degree-three vertices of a K4 attached along e. Their membership in the prescribed apex neighborhood X is now ARBITRARY. Put H0=H'-{a,b}, J=H0-e, X0=X intersect V(H0), and L'=H'[X]. Assume, as required by AC, that H' is rainbow triangle-edge-3-colourable and L' is triangle-free. Let G'=H'+z with neighborhood X, and R=J+z with neighborhood X0.

If AC holds for (J,X0), and also for (J,X0\{u}) in the exceptional membership case X intersect Q={u,a} (up to swapping the two old endpoints and the two private tips), then AC holds for (H',X). Every smaller pair is eligible: J inherits the old edge colouring, and induced subgraphs of the old triangle-free link remain triangle-free.

Equivalently an AC counterexample with this ear yields an AC counterexample on J, with marking X0 or, in the exceptional case, X0\{u}. Both possibilities have two fewer remainder vertices and six fewer remainder edges. One may prepare BOTH smaller instances rather than assume an oracle for a residual optimum. Their strictly decreasing size makes this a well-founded two-branch reduction whenever the displayed ear exists.

## Shared exact cover facts

All new triangles relative to H0 are exactly the four Q faces. The normalization proved in addendum3 is independent of X:

    tau(H')=tau(J)+2,

and for EVERY minimum J triangle-edge cover C_J, the set

    C'=C_J union {uv,ab}

is a minimum H' cover. To recall the complete argument: a cover omitting uv needs at least two private Q edges and can replace all private edges by {uv,ab} without increasing cost; one containing uv can replace all private edges by {ab}. Its old J part covers J. Conversely a J cover plus uv,ab covers all old triangles restored by uv and all Q faces. This proves both the minimum cardinality and the existence of the displayed minimum cover.

Also every maximum R packing appends at least one Q face. In fact all six Q edges are outside R: uv was deleted, and the other five use the removed private vertices. Hence

    nu(G')>=nu(R)+1.

Extra apex edges to a or b do not invalidate this lower bound. No upper bound on nu(G') is asserted here.

## Exhaustive apex-membership split

Since Q is complete and H'[X] is triangle-free, X meets Q in at most two vertices.

Outside the exceptional pattern consisting of one old endpoint and one private tip, the normalized minimum cover removes every NEW link edge:
- if the two old endpoints are in X, the only Q link edge is uv and it is selected;
- if both private tips are in X, the only Q link edge is ab and it is selected;
- if zero or one Q vertex is in X, there is no Q link edge.

An isolated marked private tip has no other H' neighbors in X, since its only neighbors lie in Q. Thus, after selecting uv,ab, the residual link has exactly the old residual edges J[X0]-C_J, with possible isolated private vertices. Choose C_J witnessing AC for (J,X0). Then

    |C'|+vc(L'-C')
      =tau(J)+2+vc(J[X0]-C_J)
      <=2nu(R)+2<=2nu(G').

This proves AC in all these cases, including X containing arbitrary additional old vertices outside Q.

## Exceptional pattern X intersect Q={u,a}

Now v,b are outside X. The new link is the old link J[X0] plus one pendant edge ua; uv and ab are not link edges. Write p_R=nu(R). The edge zu is present in R. Deleting a single graph edge changes a maximum triangle packing number by at most one, so there are exactly two cases.

### Case1: nu(R-zu)=p_R

Take a maximum R-zu packing and append

    T1=zua,  T2=vab.

These triangles are actual in G'. They are mutually edge-disjoint; their only edge in R is zu, which the chosen packing avoids. Thus nu(G')>=p_R+2.

Take a minimum J cover C_J witnessing AC for (J,X0), and a vertex cover S of J[X0]-C_J with tau(J)+|S|<=2p_R. The normalized C' is minimum in H', while S union {u} covers the residual old link and the new leaf edge ua. Therefore

    |C'|+vc(L'-C')<=tau(J)+2+|S|+1
      <=2p_R+3<=2nu(G')-1.

In particular AC holds.

### Case2: nu(R-zu)=p_R-1

The graph R-zu is exactly the apex instance of J with neighborhood X0\{u}. Use AC for that smaller marked pair to obtain a minimum J cover C_J and a vertex cover S of J[X0\{u}]-C_J such that

    tau(J)+|S|<=2(p_R-1).

Again C'=C_J union {uv,ab} is a minimum H' cover. Adding vertex u to S covers all old residual link edges incident with u and the new leaf edge ua, while S covers all remaining old link edges. Hence

    |C'|+vc(L'-C')<=tau(J)+2+|S|+1
      <=2p_R+1<=2nu(G')-1,

where the last inequality uses nu(G')>=p_R+1. Thus AC holds here too. If p_R=0 this case cannot occur; no negative packing number is used.

These cases exhaust all eligible X patterns. The analogous configuration {v,a}, {u,b}, or {v,b} is obtained by renaming the old endpoint and private tip. QED.

## Exact implication and limitations

For a fixed eligible ear input, failure of AC forces failure of one of the explicitly constructed smaller eligible pairs. No minimum H' cover is discarded without a valid normalization, no matching deletes vertices in place of edges, and the proof uses only packing LOWER bounds to establish the positive cover budget. The exceptional branch compares whole actual packings, with the two appended triangles checked edge by edge.

A smallest AC counterexample therefore cannot contain this K4 ear, regardless of whether its private vertices lie in X. For a family that can be repeatedly reduced this way to already proved AC cases, induction proves AC. No theorem shows that every eligible remainder has such an ear, and a decreasing size alone gives no availability. Graphs with no adjacent private degree-three pair remain untouched, including possible stable slack-one remainders after all ears are removed. No arbitrary minimal Tuza counterexample is assumed to admit an eligible apex decomposition.

This proof has no Aharoni/HNS or unrestricted equality dependency. Its reliance on smaller AC statements is an explicit implication/counterexample-preserving reduction, not a hidden assumption that full AC is true. Evidence category: PROVED_ORDINARY for the transfer implication. Historical originality UNESTABLISHED; new Lean NOT_RUN; independent_final_verification NOT_RUN.
