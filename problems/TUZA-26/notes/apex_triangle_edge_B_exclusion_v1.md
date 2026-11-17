> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle plus one edge over B: a minimum-Q exclusion and a named countercontrol

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-16. Independent review required. The broad two-edge-resilient defect-one forbiddance is REFUTED by a frozen C12 model. The positive theorem below is explicitly modular and uses the paid-region exclusions already derived for the conditional minimum unknown Q. Neither a new model nor a general resilience descent is asserted.

## 1. Exact statement and paid premises

Let Q be a finite simple triangle-supported graph with

    nu(Q)=m+2, tau(Q)=2m+3,
    nu(Q-D)=nu(Q) for every edge set D of size at most two.

Let T=abc be an actual triangle, let e be a Q edge outside E(T), and let L=Q-(E(T) union{e}) satisfy B with nu(L)=m. In the application e is packing-critical in Q-E(T), so it creates an actual triangle already in L+e. The proof below also accounts for every triangle using both e and a T edge.

Assume these three additional geometric exclusions:

1. Q has no literal K4 or K5 whose COMPLETE outside-triangle boundary has at most two edges. For a literal clique D, this boundary is the set of its edges lying in some actual Q triangle not wholly inside D; it is not the vertex boundary.
2. Every Q support vertex has degree at least four.
3. Q has no genuine K5 triangle leaf: a literal K5 containing two vertices whose entire Q neighborhoods are precisely the other four clique vertices.

Then the displayed triangle-plus-edge configuration is impossible.

For the conditional minimum unknown Q inside a fixed minimum-edge CS failure G, premise1 follows from notes/two_edge_tight_boundary_v2.md and notes/matching26_opposite_boundary_closure_v1.md; the latter's P3-plus-edge dependency has since passed independent review. Premise2 is the degree-three programme, including the wedge and simplicial reductions; premise3 is notes/apex_k5_triangle_leaf_v2.md. Those dependencies must be independently accepted before applying the modular theorem to Q. The present proof does not assume their availability in an arbitrary defect-one graph. Every old vertex and background edge remains present throughout.

## 2. Two-edge resilience forces the complete new family to be K5-e

Put K=L+E(T), and let N be ALL triangles of K absent from L. Since a,b,c are independent in L, N consists of T and ordinary pages on its three bases. The exact one-triangle interface gives

    nu(K)=m+nu(N).

Here nu(N) means the packing number of this triangle family alone. To recall the full interface: pages have a base among ab,ac,bc and an outside apex; a full apex gives all three pages, while any other page apex gives only one base. A new packing uses distinct bases and distinct apices. Its old footprint inside any literal L clique is a star of at most two edges, because the clique contains at most one T vertex. Maximum K4/K5 packings avoid that footprint, so every new packing appends over a maximum L packing. This proves the equality, including arbitrary old components and background.

Since K is a subgraph of Q, nu(N)<=2. If N had an edge cover of size at most two, say {f,g}, then every surviving N triangle after deleting f would contain g. Thus

    nu(Q-{e,f})=nu(K-f)<=m+1,

contradicting two-edge resilience. A one-edge cover gives an even stronger contradiction after deleting that edge with e. The cover edges lie in K and therefore differ from e.

The exact page-incidence classification now forces N to be precisely the seven triangles of K5-xy on {a,b,c,x,y}, with x,y distinct full apices and no other T pages. Briefly: three full apices, two full apices plus any extra page, or one full apex plus singleton pages on two different bases give a three-matching. With one full apex and singleton pages confined to one base, that base plus the opposite full-apex spoke covers N with two edges. With no full apex, at most two bases have pages and those bases cover N. Hence the sole exception is two full apices and no extra pages. This reconstructs the archived exact interface in TUZA22 notes/two_triangle_restoration_v1.md, Section1; no later restoration theorem is used.

The edge xy is absent from L. Otherwise axy and bxy are old triangles sharing xy, hence lie in one literal B clique; that clique would contain a,b and force the absent ab into L. Therefore K contains the literal core C=K5-xy, not merely an abstract seven-triangle family.

Any old tight component D of L contains at most ONE of the six spokes ax,ay,bx,by,cx,cy. Two spokes with different T endpoints would force an absent T edge inside D; two with the same T endpoint would force the absent xy. This is the precise supported-spoke constraint, not a claim that all six spokes are background.

## 3. Whole-family footprint for the extra edge

Write e=uv. The ordinary e-pages relative to L are triangles uvz with both old spokes uz,vz in L. A literal old tight component D contains at most one distinct old edge from the ENTIRE ordinary e-page family.

Indeed it cannot contain spokes incident to both u and v, since then both endpoints lie in its clique and uv would be present in L. If it contains two distinct spokes uz,uw, then z,w lie in D and zw is an old D edge. Since vz,vw are old spokes of their corresponding pages, vzw is an old triangle sharing zw with D. It must be in that same triangle component, forcing v into D and again forcing uv into L. The argument with v in place of u is identical.

Thus the complete outside-triangle boundary of any old D receives at most one edge from the N family and at most one from ordinary e-pages. Old L triangles outside D use no D edge by the definition of an edge-sharing triangle component. The only additional possibilities are actual triangles using both e and a restored T edge, addressed next.

## 4. All old tight components are forbidden paid regions

If e has no T endpoint, a triangle cannot contain both e and a T edge: two triangle edges must meet. Consequently every old D has complete boundary of size at most two. Premise1 excludes every such D. This includes e=xy explicitly; it does not silently assume e lies outside the five-vertex core.

Otherwise e has exactly one T endpoint. It cannot have two, since those pairs are E(T). Relabel e=au. Because ax,ay already lie in L, u is outside {a,b,c,x,y}. The only triangles using e and a T edge are abu when ub is old, and acu when uc is old. Both ub and uc cannot be present: they would create the forbidden additional T-page bcu, whose apex u is neither x nor y. Thus there is at most one mixed triangle. Relabel so that it is abu when it exists.

Every old D not containing ub still has complete boundary of size at most two, and is forbidden. If ub is background, this excludes all old components. Otherwise there is exactly one possible exceptional old component D, the one containing ub. It must have boundary size exactly three: the mixed edge ub, one N spoke, and one ordinary e-page footprint edge. D contains b,u and cannot contain a (au and ab are absent) or c (bc is absent). Its N spoke is therefore bx or by; relabel it bx. Since a is outside D, its ordinary e-page footprint must be uz for an apex z with az in L.

If z differs from x, the old D edge xz and the old spokes ax,az make an actual old triangle axz sharing xz with D. This would put a in D, impossible. Hence z=x, and the COMPLETE boundary is exactly the triangle

    F={ub,bx,ux}.

D cannot contain y because xy is absent; hence every private vertex w of D outside {u,b,x} is outside the core C and all four restored-edge terminals. All other old tight components have already been excluded. Any Q triangle containing w outside D would have to be new: an N triangle, an ordinary e-page, or the mixed triangle abu. It cannot be N or abu, whose vertices were specified. As an ordinary e-page auw it would use the D edge uw, creating an additional boundary edge outside F, also impossible. Therefore every Q triangle containing w is internal to D. Since Q is triangle-supported, w has no outside neighbor at all.

If D is K4, its sole private vertex has degree three, contrary to premise2. If D is K5, its two private vertices form a genuine fresh K5 triangle leaf on the boundary triangle ubx, contrary to premise3. This excludes the exceptional D as well.

Thus L has NO triangles and m=0. The argument explicitly derives freshness; it does not infer private-vertex isolation solely from a triangle boundary. Arbitrary old components sharing isolated vertices, old background edges, and crossing triangles were included in the case split.

## 5. The triangle-free-background tail, including e=xy

Now the entire triangle family of K is the literal C=K5-xy family, but K may still have arbitrary triangle-free background. We have nu(K)=2 and nu(Q)=m+2=2. Since Q is triangle-supported, e belongs to some actual Q triangle. Every triangle newly created by e has two K spokes.

If such a new page had at most one spoke in E(C), choose a maximum two-packing of C avoiding that spoke (or any maximum packing if both are background), and append the new page. This gives three edge-disjoint triangles in Q, contradiction. The required single-edge avoidance in C is elementary: to avoid a base ab use acx and bcy; to avoid a spoke ax use aby and bcx; the two edge types cover all cases by symmetry.

Thus EVERY e-page has both spokes in C. In particular its two base endpoints lie in V(C), and because e is missing from K, its only possibility is e=xy, the unique C nonedge. All e-pages are then inside the same five vertices. Together with the seven old C triangles they are precisely the ten triangles of K5. Q's triangle-supported edge set is consequently exactly K5, with tau(Q)=4. This contradicts the prescribed tau(Q)=2m+3=3.

This final step controls arbitrary background directly. No background edge can secretly support an extra e-page: that would be the three-packing just ruled out. It is also a special direct proof of the named packing-neutral insertion response, so no finite C12 insertion table is needed here.

## 6. Exact named countercontrol and scope repair

The same conclusion WITHOUT the three paid premises is false. Let Q consist of K5 on 01234 and K5 on 01567, sharing edge01. Take T=023 and e=14. The exact local control gives

    Q: nu4, tau7, connected supported, two-edge resilient;
    J=Q-E(T): nu3, tau5;
    L=J-e: nu2, tau4, only triangle component K5 on01567;
    K=L+E(T): nu4, tau6.

The seven new K triangles form K5-14 on01234. Its spoke01 belongs to the old K5; the other five spokes are old background. This is exactly the supported-spoke interaction that a blanket claim would miss. The old K5 has complete outside-triangle boundary {01}, violating paid premise1. Q is the already frozen double-K5 C12 model; it is not a new model, a minimum-unknown-Q witness, or a counterexample to Tuza.

scripts/apex_triangle_edge_control.py uses the separately authored exact checker to verify every one of the191 deletions of zero, one, or two edges of Q, with an explicit four-packing for each. It also supplies exact covers/packings, all single-edge deletions, all actual triangles of Q,J,L,K, and the literal B and supported-spoke checks. evidence/apex_triangle_edge_control.json records the complete certificates. Elapsed local numerical time was about0.022 seconds. The broad forbiddance is REFUTED; the modular minimum-Q theorem is an ordinary candidate awaiting independent review.

## 7. Consequences and the remaining global bridge

Suppose all three paid premises have been independently established for the conditional minimum Q and Q is two-edge resilient. For any actual triangle T, the accepted elementary triangle-residual lemma gives nu(J)=nu(Q)-1 for J=Q-E(T).

- If J has defect one and has a critical edge e, proper-subgraph CS and cover extension force J-e to be tight B. With m=nu(Q)-2 this is precisely the configuration excluded above. Hence EVERY defect-one triangle residual J is single-edge packing-resilient. This concerns its complete actual graph; connected active-support decomposition and naming are separate steps.
- If J has defect two and has a critical edge e, proper CS and cover extension allow delta(J-e) only0 or1. The tight B alternative is excluded here, so its critical residual must have defect one. This does not prove that residual resilient and does not classify the defect-two branch.

Implication chain: the fixed-G conditional minimum framework and the previously supplied paid exclusions -> the present all-size B-branch exclusion is CONDITIONAL until this proof and its queued dependencies pass review; the forced K5-e new-family deduction is an independent ordinary proof under the numeric/two-edge premises; the broad exclusion is REFUTED by the exact named control; universal availability of a reduction in every remaining two-edge-resilient minimum Q is still OPEN. Naming resilient defect-one triangle residuals does not by itself restore Q with the correct payment, and defect-two residuals remain a distinct obstruction. No global R assumption, C12 enlargement, unrestricted Tuza conclusion, historical novelty assertion, or Lean verification is claimed.
