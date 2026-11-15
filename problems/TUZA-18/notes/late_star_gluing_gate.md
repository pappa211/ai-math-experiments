# Existential gluing of vertex-star packing covers

Status: hypothesis record frozen after decisive subgate failures, 2026-11-14. Full existential star gluing SG remains UNRESOLVED. Canonical-centre gluing and bounded strict Hall-deficiency descent are REFUTED; no unrestricted conclusion is assumed.

## Exact global candidate and implication

Fix ANY maximum triangle packing P in a finite simple graph G. Assign to each T in P one centre c(T) in V(T). Let P_v={T:c(T)=v}, B_v=E(P_v), B=E(P), and G_v=G-(B minus B_v), deleting graph edges only. Empty groups are ignored. P_v is maximum in G_v: any larger packing there could be united with P minus P_v to enlarge P in G. The local permitted set A_v is B_v plus the edges of all private K4 completions of P_v in G_v. Every such completion is also an original private K4 completion, because its edges survive deletion of B minus B_v and its three spokes avoid B_v. Thus A_v is contained in original A(P).

The complete ordinary star theorem in criticality_star_pk_theorem.md gives a triangle cover C_v of G_v within A_v with |C_v|<=2|P_v|, since every member of P_v contains v. Candidate SG asserts that centres and these local covers can be chosen simultaneously so their union covers EVERY actual triangle of G. If true, their union lies in A(P) and has size at most sum_v 2|P_v|=2|P|, proving PK-all and hence unrestricted Tuza.

The only independent existence obligation is compatibility on actual triangles whose packed-support edges belong to two or three different groups. Such a triangle does not survive in any one G_v and is not covered by the local theorem alone. The candidate is existential in both centre assignment and covers; arbitrary local covers need not glue. The K5 obstruction to a fixed two-edge budget per packed triangle is handled by grouping its two packed faces at their common vertex, permitting a3/1 allocation inside that group.

## First substantive subgate: type1 canonical centres

When every packed member has private pages on exactly one base edge b(T), assign the canonical centre c(T) opposite b(T). All bases R={b(T)} are mandatory in a B-contained cover, and there are no private K4 completions. Put U=B minus R. The canonical-centre strengthening asks for a cover D of all actual triangles of G-R using U such that, for every v,

  |D intersect E(P_v)| <= |P_v|.

Then C_v=(R intersect B_v) union (D intersect B_v) are local covers within budget and their union covers G. This is stronger than the unbudgeted pure-type1 residual bound and is not silently substituted for it.

First decisive check: reuse already-complete literal type1 controls from evidence/apex_type1_directed_ledger.json.gz, beginning with the earliest eligible prescribed packing. Recompute actual triangles, bases and canonical centres, and exactly solve the new partition-capacitated residual cover. Stop at the first failure; retain its literal graph, packing, all feasible constrained states and a plain unrestricted permitted cover. If the canonical choice fails, test every centre assignment of that same witness to distinguish canonical-centre failure from SG failure. This is a targeted new-constraint discriminator using existing inputs, not another graph-order census or evidence that finite survival proves SG.

## First gate outcome and quantifier repair

The canonical-centre strengthening fails on the17th eligible saved control (source row214); all9 feasible residual covers of size at most4 violate a singleton quota. The same witness admits an arbitrary-centre repair grouping its third and fourth packed triangles at vertex4. Thus no unrestricted SG failure follows. The full existential-centre subgate will now be tested on the same existing complete literal controls, with a90-second cap and immediate stop at the first graph for which every centre assignment fails. This changes the quantifier substantively rather than raising graph order. If no failure appears, no further census is justified; the next obligation must be a structural centre-selection argument.

## Structural pivot gate after the canonical failure

For pure type1 P, take a minimum B-contained cover C. Let h(C) be the number of heavy packed triangles (three selected support edges), and let m(C) be the maximum matching size between heavy and light (one selected edge) packed triangles that share a vertex. Define delta(C)=h(C)-m(C). Exact star-quota compatibility is delta(C)=0; the matching equivalence is proved in late_star_gluing_obstruction.md.

A concrete sufficient exchange claim PIV1 is: whenever delta(C)>0, there is another minimum B-contained cover C' obtained by removing one selected edge and adding one unselected B edge, with delta(C')<delta(C). This would prove existence of a compatible minimum cover by finite descent. The resulting star budgets would imply the pure-type1 PK bound without first assuming its cardinality bound. Hence the claim has a genuine unbounded role, but its global one-pivot existence assertion is entirely new and unproved.

First decisive test uses the same frozen complete literal type1 controls, enumerates every minimum B-cover, and seeks one with positive deficiency but no one-pivot decrease, while retaining a globally compatible minimum cover as a scope control. Stop at the first failure. This tests a stated local descent assertion, not a further graph-order bound. The source TUZA14B TRACK_A Sections A1-A6 was inspected: its global mixed-packet versus cheaper-cover bridge remains unproved, and PIV1 is not inferred from those results.

## Final outcome of the gluing track

The canonical-centre failure and exact support-cover/Hall equivalence are frozen in late_star_gluing_obstruction.md. The full existential-centre type1 discriminator completed the36,218 eligible previously saved controls with no failure; this was finite screening only.

PIV1 also passed that same small fixed corpus, but a symbolic role-collision construction subsequently refuted it. The first chain used vertex sums and had separate shared-edge triangle components. A natural two-block edge-sum repair was checked across all50 outside-support edge identifications; all81 minimum-cover products in every case admitted the required strict pivot when needed. This finite survival did not extend to longer chains.

The decisive final construction is late_star_connected_pivot_obstruction.md: for every N, an edge-glued chain of fixed blocks has one actual shared-edge triangle component, an all-type1 maximum packing of4N members, a minimum B-contained cover of8N edges and Hall deficiency1. Any compatible minimum support cover must change at least ceil(N/2) blocks, and that bound is attained by explicit odd-block pivots. Choosing N=2r+1 refutes every fixed-radius strict-descent claim replacing at most r selected edges, including PIV1 at N=3. A separate literal checker certified the N=3 instance.

Decision: stop bounded strict-deficiency descent. The remaining exact SG existence step is compatible cover selection across arbitrary vertex-star groups, already equivalent in the support-only setting to existence of a cover with saturated heavy/light matching. The chain permits a nonlocal repair and does not refute that existence assertion. A new nonlocal exchange theorem, or a separator-aware boundary argument with a separately proved global availability condition, is required; neither is supplied. Merely renaming the unresolved TUZA14B mixed-packet bridge is not progress.
