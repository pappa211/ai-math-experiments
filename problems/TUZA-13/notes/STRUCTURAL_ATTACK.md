# Structural falsification attack

Author: TUZA-13 structural-attack agent, inherited requested model/reasoning configuration; independent serving metadata unavailable. This is ordinary mathematics and exact finite computation, not Lean or external review. The frozen central two-red conjecture is not proved or refuted by the auxiliary results below.

## 1. Minimum-cover deletion and necessary structure

Write A(G,C)=T_1(C) union T_2(C), c=|C|, and k=nu(A(G,C)). For every subset S of a minimum cover C,

    tau(G-S)=c-|S|,

and C minus S is a minimum cover of G-S. It is a cover of that size. Conversely, adjoining S to any cover of G-S covers G, so a smaller cover would contradict minimum cardinality of C. No inclusion-minimal/optimal confusion is involved. The eligible family of (G-S,C-S) is exactly the old eligible family with all triangles meeting S deleted.

Assume a counterexample exists, and select a failing pair with globally fewest actual graph edges among all failing pairs (isolated vertices can be removed). Then:

1. **Odd tight deficiency:** c=2k+1 and D=1. If c>=2k+2, deleting any red edge leaves a minimum cover of size c-1 whose required threshold still exceeds k; its eligible packing cannot increase. This would be a smaller counterexample.
2. **Every actual edge is tau-critical:** tau(G-e)=tau(G)-1 for every e. This is already true for red edges. If a blue edge deletion preserved tau, the same C would remain minimum and the eligible packing could only decrease, again leaving a smaller failure.
3. **Equivalent optimum-cover test:** an edge e is tau-critical if and only if it belongs to some minimum cover of G. The forward direction adjoins e to a minimum cover of G-e; the reverse direction uses the deletion identity. Thus a minimum failing graph must have union of all its minimum covers equal to E(G).
4. **Every one or two red edges can be avoided at maximum packing size:** for S subset C with 1<=|S|<=2, the smaller pair has target k and cannot fail; its packing number is at least k and at most the original k. Hence some original maximum eligible packing avoids every edge of S. In particular, there is no one- or two-element red set meeting every maximum eligible packing.
5. **More general red deletion inequality:** every nonempty S subset C satisfies nu(A(G-S,C-S)) >= ceil((c-|S|)/2). Equivalently, the loss from k is at most floor((|S|-1)/2).
6. **Triangle-conflict connectivity:** the full triangle family can be assumed connected under sharing graph edges. Distinct components use disjoint edge resources; covers and eligible packing numbers add. If each component met its own half-cover threshold, their union would meet the global threshold. Thus a smaller failing component would otherwise exist.

Items 1--6 and the exact quantifiers were independently reviewed by the independent-checker agent, which agreed. These are necessary conditions, not sufficient conditions and not a proof that such a graph is impossible. They justify directed deletion of edges absent from every optimum cover, recomputing optimum covers after each deletion. A failed test of the structural conditions on a nonminimal near-miss has no logical force against the conditions.

A very small exclusion is also elementary: no failing pair can have eligible packing number at most one. If k=0, a private witness for a red edge contradicts nonzero C. By the red-deletion argument, a k=1 failure would yield a failure with c=3. Any pairwise edge-intersecting family of graph triangles either has a common edge or lies among the four faces of one K4. To see this, start with abc and abd; a third triangle avoiding their common edge ab must be acd or bcd, after which every triangle intersecting all three is a face of abcd. In the common-edge case, one edge covers all eligible triangles, and at most one additional edge covers the sole possible all-red triangle in a three-edge C, contradicting tau=3. In the K4 case every red edge has a private eligible witness, so all three red edges lie in that K4; all-red triangles lie there too. An opposite pair of K4 edges covers the full family, again contradicting tau=3. Therefore a minimum failing pair must have k>=2 and c>=5. The independent-checker agent separately reviewed and accepted this small exclusion; its status is PROVED_ORDINARY, without Lean or external human verification.

## 2. A concrete exchange lemma is false

Auxiliary proposal tested:

    tau(A(G,C)) = tau(G) for every minimum cover C.

This is **REFUTED_EXACT as an auxiliary claim**, not the two-red packing target. A nine-vertex witness discovered in the root's restoration mutation family has

    E={01,02,03,04,07,08,12,13,14,15,23,25,26,28,36,37,38,45,47,56,68},
    C={03,04,12,15,25,28,36}.

Its full triangle list is

    012,013,014,023,028,037,038,047,123,125,145,236,238,256,268,368.

Triangle 125 is all-red. All other fifteen triangles have exactly one red edge, and there are no two-red triangles.

The six triangles

    P={368,256,145,047,028,123}

are pairwise edge-disjoint. Their edges leave exactly {01,03,37} unused. Any full cover of size six must select exactly one edge from each member of P and no unused edge. The following short forcing chain determines its choices:

- Triangle 013 forces edge 13.
- Triangle 037 forces edge 07.
- Triangle 012 then forces edge 02.
- Triangle 014 then forces edge 14.
- Triangle 038 then forces edge 38.
- Triangle 236 then forces edge 26.

Thus the only possible six-cover is F={13,07,02,14,38,26}. It misses 125, so no six-cover of G exists. The displayed C covers every triangle, proving tau(G)=7.

On the other hand F covers every eligible triangle. Together with P this proves

    tau(A)=nu(A)=6 < tau(G)=7.

The two-red target asks only for ceil(7/2)=4, so this witness has D=-2 and comfortably survives. It refutes a tempting cover-preservation/exchange intermediate even when there are no two-red triangles. Full nu(G)=6: P attains six, and seven triangles would partition all 21 edges, impossible because vertices 1 and 7 have odd degree.

The independent checker re-enumerated all graph triangles, rejected all 54,264 six-element subsets of E(G), certified tau(G)=7 and eligible/full packing six, and checked the short forcing proof. Evidence: `evidence/independent_tau_drop.json`. The original immutable literal is `witnesses/theory_tau_drop.json`; it contains the source discovery record. The bounded inherited-cover minimizer tried all 21 single-edge deletions; none preserves this auxiliary gap with the inherited restricted C. Every deletion lowers global tau to six. This is not a claim of global smallest order or minimization over all replacement covers. Trace: `witnesses/theory_tau_drop_minimized.json`.

## 3. Strict local add-only repair is false

Let the graph have triangles 012,013,124,025 and exactly their nine edges. Let C={01,14,05}. The three page triangles 013,124,025 are edge-disjoint, so tau=3, and C is a cover. All four triangles are one-red. The single triangle packing {012} is inclusion-maximal (it intersects every page in an edge) but has size one, below ceil(3/2)=2. The maximum eligible packing is three, attained by the pages.

Thus an augmentation statement must allow deleting previously packed triangles; maximality alone and add-only extension are insufficient. This example does not challenge maximum-packing versions of the conjecture. Literal certificate and exact standard-library checks are in `witnesses/theory_maximal_packing.json` and `checks/theory_small_certificates.py`.

## 4. Why the obvious tight-block amplification stalls

The root's near-miss `nearest_loss_9.json` is three K4 blocks attached to the three edges of an all-red central triangle. Choosing the central edges plus the three opposite block edges gives a minimum cover of size six. Each eligible triangle lies in one K4 block, so the eligible packing is three; including the all-red central triangle raises unrestricted packing to four. This reaches the half-cover threshold exactly.

More generally, start with an arbitrary graph H whose edges are red; independently complete each edge to a K4 using two new vertices, and also color the opposite new edge red. The K4 blocks share no graph edges, each requires two cover edges and supplies eligible packing one, so tau=2|E(H)| and eligible nu=|E(H)|. The extra all-red base triangles cannot create a deficiency because each local optimum can include its root edge for free.

A precise missing gadget for this architecture would be a tight rooted block whose specified root edge belongs to no minimum cover. Gluing such blocks around a new all-red triangle could force an extra global cover payment. No such tight rooted gadget was found or asserted to exist. Root's tau-neutral deletion search directly probes the obstruction.

A second bounded amplification uses the auxiliary nine-vertex witness above. Complete any subset of its six disjoint P triangles to K4s by adding one fresh vertex adjacent to that triangle. `checks/theory_bud_candidates.py` produces all 64 literal cases in `evidence/theory_bud_candidates.json`; each includes a designated cover adding the new edge opposite the unique old red edge. The structural agent ran the root exact engine on all 64 cases: all 4,864 minimum-cover pairs were enumerated completely, 2,304 contain all-red triangles, no timeouts occurred, and every pair passed. The minimum margin was one, attained in case mask 18 (11 vertices, 27 edges, tau nine, eligible packing six). Full results are in `evidence/search_theory_buds.jsonl` and its summary; all 64 designated covers were also minimum, as recorded separately in `evidence/theory_bud_designated.json`. For the designated all-six completion, a symbolic obstruction to the naive plan is immediate: any old eligible triangle outside P can be added to one chosen new K4 face per block, because it uses at most one original edge of each P triangle, and each block offers a face using another original edge. Hence eligible packing is at least seven, defeating the hoped-for size-thirteen/packing-six deficiency. Other optimum covers still require exact testing.

## 5. Computation and provenance

The auxiliary `theory_exchange_probe.py` inspected completed root ledgers, in order `search_controls.jsonl` then `search_restoration.jsonl`, and stopped at its first auxiliary failure. It visited 172 graph records and 1,742 cover records; 1,311 covers had no all-red triangle and were skipped as tautological, and 431 covers had an all-red triangle and entered bounded hitting-set tests. Exact successes, the failure, and every timeout are retained in `evidence/theory_exchange_probe.json`. There were 305 completed exact tests and 126 K9 cover tests that exceeded their individual 0.5-second budget; the latter are unresolved for this auxiliary query, never passes. The measured locked interval was about 64.12 seconds. The third requested input `search_hostile.jsonl` was not reached. The checked source-ledger hashes are recorded. No all-optima completeness claim is added by this auxiliary scan beyond the root's input scopes.

`theory_minimize.py` preserves the original witness and tries its individual edges with inherited restricted C, using exact root Graph cover/packing code and separately authored hitting-set recursion. This shares discovery code with the root and is not independent certification; the separate checker described above supplies that.

The [Clebsch private-only proof](../../TUZA-11/arguments/CLEBSCH_PRIVATE_OBSTRUCTION.md)
is an earlier mathematical input; the cone exclusion was independently rederived.
Historical access and operating notes are omitted from this public edition.

## 6. Reproduction and bounded reduction controls

Use the [public reproduction guide](../REPRODUCTION.md) from the repository root.
It runs small exact controls on fresh output copies. The discovery programs under
`checks/` are retained as algorithm records; their named output writers require
a separate scratch copy and are not part of the default release replay.
The historical auxiliary exchange scan intentionally left 126 K9 queries
unresolved. Its [mathematical data](../evidence/theory_exchange_probe.json)
are retained; no fresh optimization of those UNKNOWN cases is claimed.

`theory_reduction_checks.py` tested the deletion identity and exact eligible-family restriction on all subsets of one specified minimum cover each for K4, K5, the eight-vertex restoration graph, and the nine-vertex auxiliary witness: 180 subset checks. It independently re-solved every single-edge deletion and compared tau-criticality with membership in the union of exhaustively enumerated minimum covers: 54 edge checks. Every check passed. These are finite attempts to falsify the symbolic reduction; they are not an empirical replacement for its proof.

The tight-root-gadget avenue has an additional conditional obstruction independently observed by the hostile-families agent: if e lies in no minimum cover of H, then tau(H-e)=tau(H). If e lies in every maximum packing, then nu(H-e)=nu(H)-1. Consequently a block with tau(H)>=2nu(H)-1 and both root properties would make H-e a counterexample to ordinary Tuza. This explains why such a low-slack gadget cannot be expected as an easy auxiliary-only counterexample in already verified Tuza classes. It does not rule out more complicated colored-boundary gadgets.
