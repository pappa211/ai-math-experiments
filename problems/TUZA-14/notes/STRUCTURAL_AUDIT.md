# Independent structural audit — TUZA-14

Author: structural-critic subagent. Requested tool configuration: GPT-6 Astra / Ultra; independent serving-model attestation is unavailable. Ordinary mathematical arguments only, not Lean verification or external human review.

Scope read: canonical AGENTS.md and both mandated migration documents; this mission's TARGETS_AND_CLOCK.md. Sections 1–5 were reconstructed independently before reading the prior proof. The prior TUZA-13 `notes/STRUCTURAL_ATTACK.md` was then read at immutable checkpoint `frozen-packet-13d` for comparison. No historical source was edited. The initial reconstruction used no computation or census; subsequent independent literal checks are recorded separately in INDEPENDENT_CRITIC.md.

Throughout G is finite simple, C is a globally minimum actual-edge triangle cover unless explicitly stated otherwise, c=|C|, A(G,C)=T_1 union T_2, and k(G,C) is its maximum GRAPH-EDGE-disjoint packing size. S quantifies over every optimum cover; E asks for at least one optimum cover. Both remain unproved.

## 1. Exact deletion and criticality, without minimal-counterexample assumptions

For every R subset C,

    tau(G-R)=c-|R|,
    A(G-R,C-R)={T in A(G,C): T avoids every edge of R}.

Indeed C-R covers G-R. Conversely, adjoining R to any cover of G-R covers G, giving the reverse inequality. A surviving triangle has exactly its original red edges, proving exact eligible-family restriction.

For every graph edge e,

    tau(G-e)=tau(G)-1 iff e belongs to some globally minimum cover of G.

The drop is at most one, because any cover of G-e together with e covers G. Membership in an optimum cover gives the one-edge deletion identity. In the converse direction, adjoin e to an optimum cover of G-e. This equivalence holds for every graph, independent of S and E.

## 2. Globally edge-minimal failing S pair

Minimality here must mean that (G,C) fails S and no failing pair (H,D), with D any globally minimum cover of H, has fewer actual graph edges. Minimality under deletion while retaining only one prescribed cover would be insufficient for the universal smaller-graph invocations below.

Every red edge e has tau(G-e)=c-1, with inherited optimum cover C-e and eligible packing at most k. S holds on this smaller pair; hence c-1<=2k<c, so

    c=2k+1.

For any nonempty R subset C, S holds on the smaller pair (G-R,C-R), and therefore

    k_R := k(G-R,C-R) >= ceil((c-|R|)/2),
    0 <= k-k_R <= floor((|R|-1)/2).

In particular every red singleton and every red pair is avoided by some maximum eligible packing of the SAME selected pair (G,C). The packing may depend on the singleton or pair; no single packing avoiding all red pairs is asserted.

Every graph edge is tau-critical. This is already proved for red edges. For a blue edge e, if tau(G-e)=c, the same C remains optimum on G-e and its eligible packing cannot increase. It is therefore a smaller S-failing pair, contradiction. Consequently the union of all optimum covers of G is E(G).

## 3. Small exclusion independent of counterexample minimality

For any globally minimum C, k(G,C)=0 forces c=0: every red edge has an actual private triangle with exactly that red edge, by inclusion minimality of C.

In fact k(G,C)=1 implies c<=2. The elementary classification used is: a nonempty family of pairwise graph-edge-intersecting actual triangles either has a common graph edge or is contained in the four triangular faces of one K4. For distinct triangles abc and abd, a third triangle avoiding ab but meeting both must be acd or bcd. Once such a third triangle exists, any triangle meeting all three is one of those four faces.

Apply this to A(G,C).

* In the common-edge case, write the common edge as uv. If uv is red then every private witness uses that same red, so C={uv}. If uv is blue, each red edge occurs in a private triangle containing uv. Thus every red edge joins u or v to a third vertex, while uv itself is not red. The red graph is bipartite with parts {u,v} and the remaining vertices; it contains no all-red triangle. Every actual triangle is consequently eligible, and uv alone covers G. Thus c<=1.
* In the K4 case, every red edge has a private witness among its four faces, so C is contained in that K4's edge set. All-red triangles also lie in that K4. Hence every actual triangle is one of its four faces, and an opposite pair of K4 edges is a cover. Thus c<=2.

Therefore a minimum S-failing pair has k>=2 and c=2k+1>=5. The same small exclusion will apply to E below. This direct proof is slightly stronger than the prior note's route through a reduced three-red failure; both routes are sound.

## 4. Triangle-conflict connectivity for both targets

Form the graph whose vertices are ALL actual triangles and whose adjacency means sharing an actual graph edge. Distinct connected components use disjoint edge resources. Taking the union of edges in each component gives smaller graph subproblems with no extra triangles: any extra triangle would already be an actual triangle of G and belong to that same component. Triangle covers decompose additively, every global optimum restricts to local optima, and eligible packing numbers add for each choice of component covers.

For S, a failure of the sum forces a failing component. For E, if every component admits a favorable local optimum cover, their union is a favorable global optimum cover. Thus a globally edge-minimal S-failing pair or a globally edge-minimal E-failing graph has connected full triangle-conflict graph. Triangle-free edges can also be deleted without changing either target, so none occurs in an edge-minimal obstruction. The empty triangle family cannot be an obstruction.

## 5. Corrected E-specific minimum-obstruction facts

Let G have the globally smallest number of actual graph edges among E-failing graphs. Set

    c=tau(G),
    K=max{k(G,C): C is a globally minimum cover of G}.

Every optimum cover fails, so 2K<c. Select any red edge e from any optimum cover C_0. In H=G-e, tau(H)=c-1. E holds on H, so there exists an optimum cover D of H satisfying 2k(H,D)>=c-1. Its extension D union {e} is an optimum cover of G, and every eligible triangle of (H,D) remains eligible in (G,D union {e}). Therefore

    2K>=c-1,
    c=2K+1.

Together with Section 3 this gives K>=2 and c>=5. It does NOT identify k(G,C) with K for each optimum cover C.

More generally, let nonempty R be contained in SOME optimum cover of G. The exact deletion identity gives tau(G-R)=c-|R|. E on the smaller graph supplies an optimum D_R of G-R and an eligible packing P_R of size at least ceil((c-|R|)/2). Then

    C_R=D_R union R

is an optimum cover of G containing R, and P_R remains eligible and avoids R. Thus

    for every such R there exists C_R containing R with
    k(G-R,C_R-R)>=ceil((c-|R|)/2).

For |R|=1 or 2 the lower bound is K, so C_R attains the best value K and has a maximum eligible packing avoiding R. In particular every tau-critical edge lies in a best optimum cover with a maximum packing avoiding that edge.

The quantifiers are FOR EVERY R, THERE EXISTS C_R. They are not THERE EXISTS C, FOR EVERY R, and they do not yield the same-cover red-deletion inequality of Section 2. Nor does E-minimality alone supply the S argument that every blue edge is tau-critical: after deleting a noncritical blue edge, the favorable optimum cover supplied by E might fail to cover the triangles restored with that edge. No counterexample to either unproved target is claimed; these are identified gaps in importing the S reduction wholesale.

## 6. Comparison with TUZA-13

All six structural claims in TUZA-13 Section 1 are accepted for globally edge-minimal S-failing pairs with exactly their stated quantifiers. The red-set loss bound is correctly floor((|R|-1)/2), including the stronger even-cardinality bound. The older note does not prove these same-cover properties for an E-minimal graph. The E repair in Section 5 records the necessary changed-cover quantifier.

## 7. Independent review of coordinator candidate X

Literal candidate received from the coordinator as a literal statement before directed tests: for ANY actual triangle cover C, write B=E(G) minus C. For S subset C containing no actual all-red triangle, let F(S) be the set of blue edges in every T2 whose two red edges belong to S. Let H_S have vertex set B minus F(S), and an edge {b_1,b_2} for each T1 whose red edge belongs to S and whose two blue edges avoid F(S). The candidate asserts

    min{|D|: D subset B, (C-S) union D covers G}
       = |F(S)| + vc(H_S).

If S contains an actual all-red triangle, no such D exists.

Verdict: ACCEPTED, ordinary proof. A triangle needing repair has all its red edges in S. An all-red triangle gives the exact impossibility condition. A two-red triangle forces its unique blue edge, giving exactly F(S). A one-red triangle gives a two-blue hitting constraint; it is already satisfied if either blue edge lies in F(S), and otherwise is exactly an edge of H_S. Thus every D must contain F(S), and D minus F(S) must be a vertex cover of H_S. Conversely these two conditions cover every triangle. The resource sets are disjoint, proving the cardinality formula. Isolated auxiliary vertices and duplicate constraints cause no difficulty.

Consequently C is globally minimum if and only if the displayed cost is at least |S| for every admissible S. Given any alternative cover C', use the uniquely determined S=C minus C' and D=C' minus C. Such S is necessarily admissible. Conversely every repair D produces the corresponding alternative cover, and its size is |C|-|S|+|D|.

When C is minimum, every optimum cover is obtained exactly by an admissible S with cost |S| and a minimum vertex cover Z of H_S, via

    C'=(C-S) union F(S) union Z.

Indeed optimality forces |D|=|S| and equality throughout the lower bound for D. The case S empty yields the original C. This is an exact optimum-cover parametrization, not a packing theorem and not a proof of S or E.

## 8. Independent review of track A's supplied geometric statements

The statements below were received as literal claims from the coordinator; no track A proof draft was read.

A1: Two actual private triangles for distinct red edges that share a blue edge cannot have those two reds as the red pair of an actual T2.

Verdict: ACCEPTED for any actual triangle cover C. Write the private triangles abc and abd, sharing the blue edge ab. If their red edges are the two edges of another triangle, they must share an endpoint; relabel to make them ac and ad. For the third triangle acd to be T2, cd is blue. But bc and bd are blue from privateness, so bcd is an actual all-blue triangle, contradicting the cover property. If the reds are disjoint they cannot be in a triangle at all.

A2: If C is globally minimum and every red edge has exactly one actual private (T1) witness, then k(G,C)=c.

Verdict: ACCEPTED, with exact actual uniqueness essential. If the unique witnesses of two distinct red edges e,f shared a blue edge b, replace e and f in C by b. All private triangles of either removed red are handled by uniqueness. No T2 has both removed reds by A1. Every remaining triangle retains a red edge. This would be a cover of size c-1, contradiction. Hence the c unique private witnesses are pairwise graph-edge-disjoint, and k>=c. Every eligible triangle uses a red edge, so any packing has at most c members and k=c. Merely selecting one witness for each red is not the required uniqueness hypothesis.

Status at first checkpoint: no source edits, no publication, no remote computation, no installation, no finite census, and no general Tuza claim.
