# Fresh internal check of the budget-six closure

This addition supersedes ONLY the earlier statements that b=6 was an unresolved AC-failure boundary. Earlier frozen reports and their hashes remain unchanged. The original TUZA-17 deadline is unchanged. This is collaborative internal AI mathematics, not a separately commissioned independent final verification.

Track A supplied the universal cover-critical link-edge proof in BOUNDARY_A.md. This critic independently reconstructed its combinatorial argument, checked its use in every matching-five link class, and checked the final contradiction. **Verdict: valid at the literal AC hypotheses. AC is proved whenever b=2nu(G)−tau(H)≤6.** The proof uses Aharoni/HNS only through the scoped matching bounds and tight-residual K4 structure already reviewed; the new link argument is elementary. Full AC remains unresolved.

## 1. The eleven-vertex lemma survives all counting and adjacency checks

**Lemma.** Every triangle-free graph F on eleven vertices with independence number four has an edge f such that alpha(F−f)=5, equivalently vc(F−f)=vc(F)−1.

Choose a maximum independent set A of size four; its complement B has seven vertices. Suppose no such edge exists. A B vertex with no A neighbor would extend A to an independent five-set. A B vertex with exactly one A neighbor would make that incident edge critical, since deleting it makes A plus that vertex independent. Hence every B vertex has at least two A neighbors.

If two B vertices are adjacent, their A-neighborhoods are disjoint, because a common A neighbor would form a triangle. As both neighborhoods have size at least two inside a four-set, both have size exactly two and are complementary. Thus B edges occur only between complementary two-subset label classes. There are three complementary pairs, with class sizes p_i,q_i. Let r count the vertices with three or four A neighbors. Such vertices have NO B neighbors: their label cannot be disjoint from any other label of size at least two.

Selecting the larger class in each complementary pair, and all r remaining vertices, gives an independent set in B. Classes belonging to different complementary pairs cannot have edges between them; vertices within a class share A neighbors and also cannot be adjacent. Therefore

    (7+r+sum_i|p_i−q_i|)/2 ≤ 4.

The nonnegative integer r+sum_i|p_i−q_i| is odd, because sum_i(p_i+q_i)=7−r and each difference has the same parity as its corresponding sum. It is at most one, so it equals one. This step remains valid if some classes are empty.

If r=0, exactly one complementary pair has a one-vertex imbalance. Let S be its larger class's two-element label, and choose a in A outside S. Select that larger class. In each balanced pair select the class whose label omits a; equality of the two class sizes preserves the maximal count. The selected B vertices form an independent four-set with no neighbor a. Adding a gives an independent five-set, contradiction.

If r=1, all pairs are balanced. Let w be the unique three/four-neighbor vertex and choose an A neighbor a of w. Select from each pair its class omitting a and also select w. These are four independent B vertices; among them, a is adjacent only to w. Deleting aw produces an independent five-set, contradiction to the no-critical-edge assumption.

Deleting one graph edge can increase independence number by at most one: from an independent set using both deleted-edge endpoints, remove one endpoint to obtain an old independent set. Thus the constructed increase is exactly one. QED.

No graph census, degree assumption, factor-criticality assumption or uninspected Ramsey theorem enters this lemma. In particular, the proof covers all triangle-free eleven-vertex graphs with alpha=4, not just the checked circulant example.

## 2. Every mu=5, vc=7 link has an allowed critical edge

The complete matching-five link classification was checked in BOUNDARY_CRITIC.md and CRITIC_TIGHT_FRONTIER.md and is restated fully in BOUNDARY_A.md. It gives these cases, up to isolated vertices.

**There is a universally matched vertex v.** Removing v leaves two C5s and isolated vertices, and v has an isolated neighbor w. Choose any edge f of either cycle. A cover of F−f consists of v, a two-cover of the broken five-cycle path, and a three-cover of the other C5; size six. The edge f belongs to a maximum matching: use vw and a two-matching in each C5, choosing the first to contain f. Thus f is both vertex-cover-critical and maximum-matching-allowed.

**No universally matched vertex; two nontrivial components.** These are C5 and a seven-vertex triangle-free factor-critical graph with independence number three. A C5 edge has both required properties by component addition.

**No universally matched vertex; one nontrivial component.** This is an eleven-vertex triangle-free factor-critical graph with independence number four. The preceding lemma supplies a cover-critical edge. Every edge uv of a factor-critical graph is maximum-matching-allowed: take a perfect matching of F−u, write vw for its edge at v, and replace vw by uv. The resulting matching has maximum cardinality and contains uv. This is an edge replacement, not an unsupported assertion about extension of arbitrary matchings.

The cases exhaust matching number five because every nontrivial triangle-free factor-critical component has matching number at least two. Consequently every triangle-free link with mu=5 and vc=7 has an edge f satisfying

    vc(L−f)=6,
    f belongs to some maximum L matching.

The forced-edge-intersection bound |R|≤1 remains valid in all cases, with isolated neighbors explicitly accounted for.

## 3. Exact AC contradiction at b=6

The matching bound m≤b, saturation when m=b, and ordinary vertex-cover bounds reduce a putative b=6 AC failure to

    m=5, vc(L)=lambda=7.

Choose the allowed critical edge f above and a maximum matching M containing f. Every minimum H triangle-edge cover must avoid f. Otherwise its residual link is a subgraph of L−f and has vertex cover at most six, proving AC.

Therefore tau(H−f)=tau(H). If deleting f lowered the old cover optimum by one, adding f to a minimum residual cover would produce a minimum H cover containing f. Delete f first, then the other four matching edges. With p=nu(G) and k=p−5,

    tau(H−M)≥tau(H)−4=2p−10=2k.

Aharoni for the inherited rainbow-coloured residual and the actual apex-page packing bound give

    tau(H−M)≤2nu(H−M)≤2k.

Hence J=H−M is tight. The independently checked tight-frontier theorem in CRITIC_TIGHT_FRONTIER.md forces the intersection R of all maximum link matchings to have at least m−1=4 edges. The complete link classification gives |R|≤1. Contradiction.

Thus AC holds at b=6, and the earlier b≤5 argument proves the full scoped theorem b≤6. It is the original existential minimum-cover AC statement. The proof neither substitutes an arbitrary cover nor claims that every minimum cover works in the critical cases.

## 4. Correct updated boundary and realizability statement

The first remaining conditional numerical AC-failure stratum is now

    b=7, m=6, 8≤lambda≤vc(L)≤9.

Indeed m≤5 gives vc(L)≤7 and every minimum H cover works; m=7 is saturation; m≥8 is impossible. At m=6, choose one safe endpoint from every maximum-matching edge as in the elementary triangle-free bound. The six safe endpoints induce a triangle-free graph and contain an independent triple by the proved six-vertex Ramsey argument. Removing that triple from the twelve matched endpoints leaves a vertex cover of size nine. Failure requires lambda≥8.

This is a conditional parameter window, NOT a claimed realized full apex instance or counterexample. No H satisfying the entire updated tuple, its exact triangle-cover number, its exact apex packing number, and all eligibility hypotheses has been constructed in this review. The theorem b≤6 excludes AC FAILURE at earlier budgets; it does not prove numerical nonrealizability of eligible instances with the earlier raw budget/link parameters. The distinction demanded by the user remains intact.

The proposed universal helper “every matching-five/cover-seven link has an allowed critical edge” is now PROVED, so passing or failing link-only searches are unnecessary to its validity. This does not settle the analogous matching-six question and does not authorize inferring a global AC theorem from the low-budget cases.

## 5. Status and provenance

The new eleven-vertex and allowed-edge lemmas are PROVED_ORDINARY. The b≤6 AC theorem is PROVED_USING_PUBLISHED_INPUT through Aharoni/HNS at the exact eligible tight-residual scope. All face-avoidance, old/apex triangle classification, matching-edge deletion and minimum-cover quantifiers were explicitly checked in the preceding critic notes.

This critic did not write Track A's eleven-vertex proof; it independently checked it after receipt. The overall chain is collaborative internal AI research and criticism. Historical originality UNESTABLISHED; full AC UNRESOLVED; global applicability to arbitrary minimal Tuza counterexamples UNESTABLISHED; new Lean and independent_final_verification NOT_RUN.
