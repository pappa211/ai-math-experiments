# Frozen local test for the budget-seven boundary

Same TUZA-17 mission; original deadline unchanged. Frozen before the finite test. Root authorizes this tiny exact link probe with no other heavy computation running. This does not assert a full eligible H,X realization.

## Exact sufficient criterion

Let an eligible AC instance have m=mu(L)=b-1, and let R be the intersection of all maximum L matchings. Suppose |R|<m-1 and there is a maximum matching M of L with

    vc(L-M)<=b.

Then AC holds for this instance. More generally it suffices that F subset M has vc(L-F)<=b.

Proof. Under AC failure no minimum H cover contains F. The exact forced-cover identity gives |F|+tau(H-F)>=tau(H)+1. Deleting the remaining M edges lowers tau by at most their count, so tau(H-M)>=tau(H)-m+1=2(p-m). Aharoni and the apex packing bound force H-M tight. The tight-frontier intersection lemma then gives |R|>=m-1, contradiction. No outside-incidence assumptions are omitted. This criterion depends on the previously declared equality input through that lemma; it is not an identity presented as compatibility.

## Literal finite test

Test L=C13 with edges whose endpoint difference modulo13 is in {1,5,8,12}. Reconstruct its full edge set, verify triangle-freeness, compute exact ordinary matching number and independence/vertex-cover numbers. Determine whether some maximum matching M has vc(L-M)<=7. Equivalently, seek a vertex set I of size at least6 for which L[I] is a matching F that extends to a maximum L matching. Also record the minimum number of induced edges on a6-set and the number of6-sets inducing a matching.

The comparison control is three disjoint C5s (matching6,cover9). This probes the sufficient criterion, not AC itself. If the criterion fails for a link, arbitrary outside H attachments remain unresolved and no AC counterexample is asserted. A full eligible instance still needs b=2nu(G)-tau(H)=7 and the original minimum-cover condition.

Exact algorithms will use finite integer subset recurrences and a separately checkable explicit witness when one exists. Time/RSS watchdogs apply. No broad all-graphs census is permitted or planned.

## Exact matching-six, cover-nine classification

**Lemma.** If a triangle-free graph F has mu(F)=6 and vc(F)=9, then, apart from isolated vertices, it is either three disjoint C5s or one13-vertex triangle-free factor-critical graph of independence number4. In both cases the intersection R of all maximum matchings is empty.

Proof. An essential vertex would leave matching5 and cover number at most7, hence give vc(F)<=8; so no vertex is essential. Gallai's elementary lemma makes all components factor-critical. Each nontrivial triangle-free component has matching number at least2. The partitions of6 are6,4+2,3+3,2+2+2. The middle two possibilities have covers at most5+3=8 and4+4=8, using the9-vertex independent4-set and7-vertex independent3-set bounds. The last possibility is three C5s. The first is a13-vertex factor-critical component, where cover9 means independence4. A forced matching edge would make both endpoints essential, so R is empty. QED.

This classification uses no enumeration or external Ramsey-graph uniqueness claim. Any such completeness input is a separate declared dependency owned by the coordinator.

## Explicit C13 witness for the sufficient criterion — PROVED_ORDINARY

Let L have vertices modulo13 and edges of differences plus/minus1 and plus/minus5. It is triangle-free: the neighbours {1,5,8,12} of0 are independent, as their pair differences are never plus/minus1 or plus/minus5; translation handles every vertex.

The cycle of difference1 gives a maximum matching of size6 and a perfect matching after deletion of any vertex. Hence L is factor-critical, mu(L)=6, and R is empty.

Its independence number is4. The set {0,2,4,6} is independent. If an independent5-set existed, the cyclic gaps between its successive vertices would all be at least2 and sum13. Up to order, their only patterns are

    (5,2,2,2,2), (4,3,2,2,2), (3,3,3,2,2).

The first has an arc of length5, a forbidden edge. In the second, the gap3 has at least one gap2 neighbour because there is only one gap4. In the third, some gap2 and gap3 are consecutive. Their sum5 again gives a forbidden edge. Thus no independent5-set exists, proving vc(L)=9.

Take

    I={0,1,3,4,7,10},
    F={01,34},
    M={01,34,56,78,9-10,11-12}.

The ONLY edges induced by I are01 and34. Both belong to the displayed maximum matching M. Consequently I is independent in L-M and its complement

    S={2,5,6,8,9,11,12}

is a vertex cover of L-M of size7. Thus the sufficient criterion applies: EVERY eligible AC instance with this exact induced link, arbitrary outside incidence, and b=7 satisfies AC. This is an unbounded statement about the possible surrounding H, justified by the exact finite link certificate plus the general transfer. It does not assert that a full eligible H with this link and b=7 exists.

For comparison, when L=3C5, choose one edge from two distinct cycles and extend them to a maximum matching M. Deleting those two edges reduces link vertex-cover number from9 to7. Since R is empty, the same criterion proves AC in the b=7 branch with this link.

## Actual bounded computation

`checks/a_boundary_link_probe.py` reconstructed only the two frozen links. It used exact vertex-subset matching and independence recurrences, then exhaustively considered every vertex subset I to determine whether the induced edge set is a matching that can extend to a maximum link matching. This tests the criterion for ALL maximum matchings without trusting a single greedy choice: I can become independent after deleting a matching exactly when its induced edges form a matching extendable to that matching.

For C13 it obtained matching6, cover9, and minimum residual cover7 over all maximum-matching deletions; there are26six-vertex subsets inducing a matching, and the minimum induced-edge count on six vertices is2. For3C5 it obtained matching6, cover9 and minimum residual cover6. The explicit witnesses are retained in evidence/a_boundary_link_probe.json. The C13 criterion's sufficiency is also checked directly in the ordinary proof above; no exact numerical optimisation verdict is needed for that implication.

Run time was about0.067s in the child and0.214s under the watchdog. CPU/alarm45s and wall50s/sampled-RSS384MiB bounds were applied. Logs and limits are evidence/a_boundary_link_probe.log and .limits.json. No process remains. This was not a broad all-graphs census, and no full H/G boundary search was run by this scout.

## Scope at development closeout

The b=7,matching6,cover8 link branch is not settled by this note. The thirteen-vertex cover9 branch requires either an argument for every graph in that class or a declared complete catalogue plus checked isomorphism; the coordinator is assessing that separate input. The explicit C13 calculation alone does not supply catalogue completeness. No raw boundary realization or AC counterexample has been constructed here. The strongest global obstruction remains lack of an availability theorem placing arbitrary minimal Tuza counterexamples into the eligible apex class.

## Final disposition at Track A handoff

The budget<=6 deduction was accepted by the fresh internal critic (notes/CRITIC_BUDGET_SIX.md). The coordinator authenticated the external thirteen-vertex Ramsey catalogue and its isomorphism to the displayed C13; notes/CRITIC_CATALOGUE_SCOPE.md accepts that separately declared completeness input, not an internally recomputed census. With that input, the budget7,cover9 branch is also settled. The first remaining conditional numerical AC branch is b=7,m=6,lambda=vc(L)=8. A full eligible H,X realization at that boundary is UNKNOWN; none was constructed here. Literal AC remains unresolved. No further search is running or authorized by this handoff, and independent_final_verification remains NOT_RUN. Earlier freezes are preserved as chronology rather than silently promoted.
