# TUZA-17 — outcome

The critical-core distinction gives a real necessary condition, but it does not rescue the proposed colour-deletion repair. The old obstruction can be strengthened to survive arbitrarily large fixed triangle codegree and connectivity, one shared-edge triangle component, and extension of every prescribed packing of at most two triangles. It still fails actual criticality: deleting a spoke lowers the packing number. Full apex compatibility (AC) remains **UNRESOLVED**. We proved unbounded scoped AC results, including **every eligible instance with budget b≤6**, and an explicit minimum-cover-safe reduction for private triangle and K4 ears.

The decision is **REDIRECT**. Retain these precise lemmas and investigate minimum-cover states of the remaining colourable slack-one remainders. There is no supported basis for a longer campaign claiming an architecture for unrestricted Tuza. A separately commissioned frozen-source audit is **NOT_RUN** and has not been started. Historical originality of the new deductions is **UNESTABLISHED**.

## Strongest exact positive results

For an actual edge-minimal Tuza counterexample G and every nonisolated vertex v,

    nu(G) <= nu(G−v) + matching(G[N(v)]) − 1.

Moreover, for EVERY maximum matching M of the link G[N(v)],

    nu((G−v)−M) <= nu(G−v) − 1.

This is a complete ordinary proof from the authenticated one/two-edge deletion resilience plus a proved elementary graph-matching blocker. Deleting matching edges retains their endpoints. The argument uses substantive graph geometry: removing link vertices corresponds to deleting apex spokes. It is not merely criticality arithmetic that would also apply to the abstract Fano plane. It supplies a necessary obstruction to saturation, not a forced cover-saving operation.

For AC, H has a rainbow triangle-edge colouring with three colours, L=H[X] is induced triangle-free, and G adds one apex adjacent exactly to X. Put h=nu(H), p=nu(G), a=p−h, D=2h−tau(H), b=D+2a, m=matching(L), and lambda=min over MINIMUM H covers C of vc(L−C). We prove:

- m≤b in every eligible instance.
- If m=b, a compatible minimum H cover exists; in fact lambda≤2a.
- AC holds when D=0, or when D=1 and H has a packing-essential edge.
- At m=b−1, the branch where H−M has slack one and a packing-essential edge is also settled.
- AC holds for **all b≤6**, with arbitrary graph order and outside incidence. This uses Aharoni/HNS only on justified colourable tight remainders; complete link arguments establish the low-budget cases.
- More generally, if m=b−1, some maximum link matching M has vc(L−M)≤b, and at most m−2 link edges belong to EVERY maximum link matching, then AC holds. This is an all-orders structural certificate, not a finite budget table.
- A K4 with two private degree-three tips admits a deterministic reduction to H−{tips}−{root edge}, with an explicitly adjusted marking. Every minimum cover of the smaller graph lifts to a minimum old cover. AC for the smaller pair implies AC for the original pair, for every eligible marking. A private degree-two triangle vertex has a companion reduction. Both are **PROVED_ORDINARY** and strictly reduce size; no optimum oracle is part of the operation.

Thus any smallest AC counterexample avoids these ears. No theorem forces an ear, and the minimal AC-counterexample object is not silently substituted for a minimal Tuza violation.

## The owner's boundary correction

The proposed matching-three argument is correct. In a maximum matching, each matched edge has an endpoint with no neighbor outside the matching endpoints: distinct outside neighbors would augment the matching, and a shared outside neighbor would create a triangle. Choose such an endpoint on each edge. Among three selected endpoints, two are nonadjacent; removing them from the six-endpoint cover leaves a four-vertex cover. Hence m=3 implies vc(L)≤4, and budget four works for EVERY minimum H cover in that case.

Budget four with matching at least five is impossible under AC's full hypotheses, since m≤b. At m=b=4, the saturation theorem guarantees existence of a compatible minimum cover; it does not assert that every minimum cover works.

The investigation then closed budget five and budget six. The key extra result is that every triangle-free graph with matching five and vertex cover seven has a cover-critical edge belonging to a maximum matching. At a hypothetical failure, every minimum H cover must avoid that edge; deleting it first forces a tight matching-deletion remainder. A new tight-frontier lemma would then require at least four link edges to lie in EVERY maximum matching, whereas the complete link classification permits at most one. Contradiction. The eleven-vertex part has a short ordinary proof using neighborhoods in a maximum independent four-set, not a computer census.

The first remaining necessary window is **b=7, m=6, lambda=vc(L)=8**. The vc(L)=9 alternative is also settled, using the general matching certificate plus the explicitly declared completeness of [McKay’s primary Ramsey catalogue](https://users.cecs.anu.edu.au/~bdm/data/ramsey.html); that completeness was not recomputed. The budget≤6 theorem is independent of this catalogue. A link with matching six and cover eight is not a realization of the full eligible H,X,b constraints. No full eligible H realizing the remaining difficult numerical stratum has been constructed, and no nonexistence theorem for it is claimed. In particular, this is a conditional boundary, not a certified nonempty class of AC counterexamples.

## Strengthened obstruction and failed intermediaries

Let B0 be connected, triangle-free and chromatic number greater than r, let B=B0□K2, and form G=I_q join B[t]. Arbitrary mixed colours inside clone classes are allowed. The minimum monochromatic rim-edge cost is exactly t²m_r(B)=2t²m_r(B0). For t≥2q+8, the ordinary construction gives

    nu(G)=q|V(B)|t/2,

and extends EVERY prescribed zero/one/two-triangle packing to a maximum one. The actual triangles all have one apex; rim codegree is q and spoke codegree is t deg_B(v). Connectivity is at least q under the stated size condition, and there is one nonempty shared-edge triangle component. Taking t large defeats the prescribed colour-deletion budget at any fixed threshold.

A concrete symbolic example has4282 vertices, colour-deletion cost at least17298, and2nu=17112. An explicit cover has16740 edges. Removing any spoke gives nu=8555 instead of8556. These graphs therefore refute only the specified relaxed repair mechanism; they are not critical Tuza counterexamples. The universal proof is supplemented by independent finite reconstructions; the5708340 triangles of the large example were not materialized.

The new matching-deletion certificate also has a precise unbounded limitation. For q≥2 disjoint Petersen graphs, m=5q, no edge belongs to every maximum matching, but EVERY maximum matching deletion leaves vertex-cover number6q>m+1. Thus the sufficient certificate is not universally available even on literal triangle-free links. This does not construct H at that budget or refute AC.

Two other exact candidates were refuted. The supported-link-slack assertion fails for the rainbow wheel W5: D=1, but every minimum old cover leaves residual link cover at least2. Its apex instance satisfies AC with ample budget; it is not an AC counterexample. The proposed bound nu≤2 for connected packing-stable slack-one colourable cores fails at explicit nu=3 and nu=4 K4-gluing examples. The attempted attachment iteration stops at the documented ten-vertex graph; no unbounded core family is asserted. A small-separator approach reproduced known two-edge gluing and the prior4-connectivity conclusion, so it was deprioritized.

## Evidence and limits

All unbounded statements have saved complete arguments. A fresh no-history internal critic read the initial frozen proofs before the new executive report, preserved its objections, and found no defect at the stated scopes. Later deterministic ear and boundary work includes collaborative critic contributions, explicitly distinguished from blind review. Independent implementations checked all minimum covers where finite claims require them, including8112 marked-ear cases. No new Lean theorem is claimed.

Finite searches did not resolve full AC. The random four-partite probe completed2588 interactions with70 timed-out H cases marked UNKNOWN. The targeted C5 run found zero instances in its intended small-budget stratum; it is not positive evidence for that difficult regime. The natural Clebsch and VB apex decompositions are automatic triangle-free-H controls. The archived four-port graph passes only its actually eligible tip-apex decompositions. K10/K11 historical certificates and the unrelated partial-slope20/21 optimum were not rerun.

Dependencies, exact scopes and source-access limitations appear in PRIOR_ART_AND_DEPENDENCIES.md. Aharoni's inequality and HNS's tripartite equality theorem are attributed inputs; their deep published proofs were not re-proved. No unrestricted equality, general S/E, or hypothetical critical graph was treated as an available finite witness.

## Relevance to unrestricted Tuza and next decision

The missing global theorem would have to show that every genuine minimal Tuza counterexample has an eligible apex remainder, or admits explicit counterexample-preserving transformations into that class and then into the settled configurations. Arbitrary graphs need not have a vertex with triangle-free link and triangle-edge-colourable remainder; no closure under repeated apex addition is proved. Likewise, nonsaturation at every vertex does not force an exchange or an ear. Asking for those configurations without a separate existence argument is still the original global difficulty in another form.

Accordingly, the next separately authorizable mathematical task should be narrow: after a frozen-source audit, decide full-instance realizability of the first remaining AC boundary and characterize the exact minimum-cover states needed in its stable slack-one remainder. Require a complete H edge list, rainbow colouring, induced link, exact packing/cover bounds and all-minimum-cover analysis for any witness. A graph-realizable failure of the proposed state transfer would kill that specific transfer; mere finite survival would not justify a global campaign. No new campaign, publication or independent final audit was launched.

The authenticated original start/deadline, final source-integrity result, private checkpoint and stopped-job record are in FINAL_RECEIPT.md. The final commit is returned to the owner outside the receipt to avoid a self-referential hash.
