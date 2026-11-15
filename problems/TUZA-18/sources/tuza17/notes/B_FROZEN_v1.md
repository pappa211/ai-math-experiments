# Track B: scoped positive deductions and exact AC status

Working mathematical record, first proof freeze 2026-11-04 00:53 UTC. Full AC remains **LIVE_UNPROVED**. These arguments are for all finite graph orders with the stated hypotheses; finite examples are supplementary. Initial scout inherited the coordinator's context. No claim of independent final verification, Lean verification, or historical novelty.

## 1. Definitions and known exact identities

H is finite simple and its actual triangle edges have a three-colouring rainbow on each actual triangle. X is an arbitrary vertex subset with induced L=H[X] triangle-free. G adds z adjacent exactly to X. Let h=nu(H), a=nu(G)-h, D=2h-tau(H), and lambda be the least vc(L-C) over all minimum triangle-edge covers C of H. An edge of L in C is deleted; endpoints are retained.

A cover of G restricts to a triangle-edge cover C of H. The other selected edges are spokes zS, where S covers L-C. Conversely C union zS is a G cover. Thus tau(G)=min_C[|C|+vc(L-C)] over ALL H covers. A packing's apex triangles correspond to a matching M of L. Its old triangles are a packing in H-M, deleting matching EDGES. Conversely these packings combine, so nu(G)=max_M[|M|+nu(H-M)]. Neither identity proves the restriction to minimum covers. AC is exactly lambda<=D+2a. All these identities are KNOWN_INPUT/bookkeeping.

For exact checking, S subset X covers L-C iff every edge F=E(L[X\S]) lies in C. The least H-cover containing F has size |F|+tau(H-F): restriction gives the lower bound, and adding a residual cover gives the upper bound. Hence

    lambda = min {|S| : |F|+tau(H-F)=tau(H), F=E(L[X\S])}.

This is another exact state reduction, not a compatibility theorem.

## 2. Published-input equality structure used, at its exact scope

Aharoni's tripartite 3-uniform theorem supplies tau(J)<=2nu(J) for every edge-subgraph J of H. The HNS equality characterization, through the TUZA-01 graphical extraction and TUZA-03 exhaustion proof, supplies the following when tau(J)=2nu(J)=2k: there are k edge-disjoint actual K4s whose faces are ALL J triangles. Their graph vertices may overlap. Other J edges belong to no triangle.

The exact project proofs read are sources/published/problems/TUZA-01/manuscript/README.md, Lemmas 2.1 and 2.2; and sources/published/problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md, Section 1.1. The extraction's published dependency is Haxell–Narins–Szabó, *Extremal hypergraphs for Ryser's conjecture*, JCTA158(2018),492–547, Theorem1.1 and the 18March2018 manuscript Definitions7.1–7.4/Proposition7.5. No unrestricted equality theorem is assumed. This track has read the attributed project extraction, not independently re-audited the entire HNS proof. Historical originality of deductions below is UNESTABLISHED.

## 3. Scoped theorem AC-0: all eligible tight H

**Theorem.** AC holds whenever D(H)=0. More precisely, a minimum H cover C can be chosen so vc(L-C)<=2a.

**Proof.** Use the k=h edge-disjoint K4 blocks above. Since L=H[X] is induced and triangle-free, X meets a K4 block in at most two vertices. Consequently that block contains at most one L edge. If there is one, choose it and its opposite K4 edge as the block cover; otherwise choose any opposite pair. The union C has size2h, covers every H triangle, and is minimum. Every L edge belonging to any K4 block is in C. Thus every edge in L-C belongs to no block.

Let M be a maximum matching of L-C, of size m. Its apex triangles are edge-disjoint from any choice of one face per K4, because their rim edges are outside all blocks and their spokes use z. So nu(G)>=h+m, hence a>=m. The endpoints of M cover L-C, giving vc(L-C)<=2m<=2a. This includes empty L-C and h=0. Arbitrary outside edges and vertex sharing are accounted for. QED.

Evidence: **PROVED_USING_PUBLISHED_INPUT** (Aharoni is not needed once the equality-block consequence is supplied). The elementary lemma for graphs explicitly supplied with those blocks is **PROVED_ORDINARY**. This is a scoped deduction, not a general equality classification or full AC.

## 4. Elementary triangle-free vertex-cover saving

**Lemma.** If F is a nonempty triangle-free graph and m=matching(F), then vc(F)<=2m-1.

**Proof.** Choose a maximum matching M and any edge uv in M. If both u and v have neighbors outside V(M), two distinct such neighbors would give a length-three augmenting path, contradicting maximal cardinality. If the two neighbors are the same vertex, it makes a triangle with uv. Thus one endpoint, say u, has no neighbor outside V(M). The set V(M)\{u} is a vertex cover: V(M) already covers every edge by maximality, and every edge incident with u has its other endpoint in the displayed set. Its size is2m-1. QED.

The graph can have isolated vertices; m>=1 is necessary. No probabilistic or floating certificate appears. This standard matching observation is included as a proof ingredient, not claimed original.

## 5. Scoped theorem AC-1e: slack one with a packing-essential edge

**Theorem.** AC holds whenever D(H)=1 and H has an edge e with nu(H-e)=h-1. More precisely, a minimum H cover C can be chosen so vc(L-C)<=1+2a.

**Proof.** Put J=H-e and k=h-1. Since tau(H)=2h-1, edge deletion gives tau(J)>=2h-2. J inherits the rainbow triangle edge-colouring; Aharoni gives tau(J)<=2nu(J)=2h-2. Thus J is tight and its full triangle family consists of k edge-disjoint K4 blocks as above.

Every such block contains at most one L edge, since it is also an H K4 and X is induced triangle-free in H. Cover each block with an opposite pair containing this edge when present. Add e to their union to obtain C. It has size2k+1=2h-1=tau(H) and covers H: old J triangles are covered by their block covers, while every H triangle absent from J contains e. Therefore C is a MINIMUM H cover.

Set F=L-C. No F edge belongs to a J block, and e is absent from F. Let M be a maximum F matching with size m. If m=0, F has no edges and the asserted inequality is immediate. Otherwise take any actual H triangle Q containing e; such Q exists because e is packing-essential. Q shares at most one edge with each J K4 block. Indeed two shared Q edges would put all three Q vertices in the complete block and force e in J, impossible. In each block choose a face avoiding the possible Q edge. These k faces, together with Q, form an h-packing of H. Every block face avoids all M edges because M lies outside the blocks.

An H triangle contains at most one L edge: two would put its three vertices in X and induce a forbidden L triangle. Hence Q meets at most one edge of M. Delete this edge from M if needed. Append the apex triangles of the remaining matching to the displayed h-packing. This gives nu(G)>=h+m-1, so a>=m-1. The triangle-free graph F has vc(F)<=2m-1 by the preceding lemma. Consequently

    vc(F)<=2m-1<=2a+1=D(H)+2a.

The argument allows arbitrary graph order, block vertex sharing, arbitrary nontriangle edges of J, and arbitrarily many triangles through e. It enumerates all H triangles by the exact J-versus-e dichotomy, and all apex triangles by L. QED.

Evidence: **PROVED_USING_PUBLISHED_INPUT**. No statement about stable slack-one H follows. A graph can have D=1 and no packing-essential edge (two K4s sharing one edge already has that property), so the extra premise is substantive. No patched AC claim replaces the literal target; AC-0/AC-1e are scoped cases of it.

## 6. Initial finite probes

`checks/b_probe.py` reconstructs every triangle, checks a sufficient explicit edge3colouring obtained from a proper vertex4colouring via nonzero F2^2 differences, exactly computes packing and cover optima, enumerates all minimum H covers, and computes lambda by a separate vertex-cover recurrence. Eight structured H seeds were attempted. Seven were eligible in this sufficient-colouring probe and passed AC for every nonempty triangle-free induced link; the K4 edge-cycle seed equals K6 and is NOT_APPLICABLE. The data are `evidence/b_probe.json`. These are finite checks, not proof of AC or evidence of global availability. The maximal observed compatibility gap is negative.

The exact four-port G from TUZA-12 was separately decomposed at every vertex. At core vertices0,1,2,3, L contains a triangle: NOT_APPLICABLE. At page tips4,5,6,7, H has a checked vertex4colouring and L is triangle-free. Exact rows (nu(H),tau(H),lambda,nu(G)) are respectively (3,3,2,4), (3,3,2,4), (3,4,1,4), (3,4,1,4). Every eligible decomposition has compatibility cost5<=8. Thus this archived neutral-restoration counterexample is NOT an AC counterexample. Full edges and relabeling are in `evidence/b_fourport.json`.

## 7. Remaining obligations and relevance

The full AC target remains unresolved. In particular neither theorem handles arbitrary slack, or even all packing-edge-stable slack-one graphs. A possible concrete next scoped task is a characterization or compatible-cover theorem for packing-edge-stable, rainbow-colourable H with D=1. It should first be tested on arbitrary overlaps and attachments, since two edge-sharing K4s already show that essential-edge reduction is unavailable.

Even full AC would only rule out a hypothetical minimal counterexample admitting a vertex z whose remainder is triangle-edge3colourable and whose induced link is triangle-free. No availability theorem for arbitrary minimal counterexamples is established, and the class is not proved closed under iteration. AC-0 and AC-1e add further residual restrictions. Claiming all minimal counterexamples possess such a z is presently an unsupported global requirement, not a demonstrated easier theorem. A longer unrestricted campaign is not justified solely by these restricted positive deductions or the finite battery.

Independent final verification: NOT_RUN. New Lean: NOT_RUN. This document is a working freeze to receive fresh AI criticism, not a separately commissioned final audit.


## 8. Joint coordinator/scout theorem: a saturated link matching

This is joint development after the initial scout's AC-0/AC-1e proofs. Let p=nu(G), b=2p-tau(H)=D(H)+2a, and m=matching(L). Here b is a nonnegative integer by Aharoni on H and nu(G)>=nu(H).

**Necessary bound.** m<=b. For any maximum matching M of L, appending its m apex triangles gives nu(H-M)<=p-m. On the other hand tau(H-M)>=tau(H)-m. Apply Aharoni to the edge-subgraph H-M:

    tau(H)-m <= tau(H-M) <= 2nu(H-M) <= 2p-2m.

Rearrangement gives m<=2p-tau(H)=b. The proof uses matching EDGE deletion and the full actual triangle family.

**Theorem AC-saturation.** If m=b, AC holds, with a minimum H cover C satisfying vc(L-C)<=2a.

**Proof.** For a maximum L matching M, all inequalities above are equalities. Put J=H-M and k=p-m. Then tau(J)=2nu(J)=2k. Published-input equality exhaustion gives k edge-disjoint K4 blocks containing all J triangles. Each block has at most one L edge, because H[X] is induced triangle-free. Cover each block by an opposite pair including its L edge if present, and let C be their union with M. The sets are edge-disjoint and

    |C|=2k+m=2p-m=2p-b=tau(H).

It covers all H triangles: every J triangle is a block face; every other H triangle contains an edge of M. Thus C is minimum.

Let f be any edge of L-C. It lies outside M and outside the K4 blocks. It cannot belong to an H triangle. Such a triangle, if retained in J, would be a block face. If destroyed, it would contain an M edge in addition to f; both edges lie in L, forcing all three vertices into X and contradicting the triangle-free induced link. Hence every residual link edge belongs to NO H triangle. Any matching in L-C therefore gives apex triangles edge-disjoint from every H packing. Its size is at most a=p-nu(H). A maximum matching's endpoints cover L-C, giving vc(L-C)<=2a<=D+2a=b. QED.

This argument allows arbitrary outside attachments, disconnected H and L, isolated vertices, and vertex sharing among K4 blocks. It relies on equality structure only for the justified tight graph J. If a=0, the constructed C contains every L edge.

**Corollary AC-small-budget.** AC holds whenever b<=3. If m=0 the link has no edges. If m=b apply AC-saturation. Otherwise 1<=m<=b-1 and the elementary triangle-free bound gives vc(L)<=2m-1<=b for b<=3. Consequently ANY minimum H cover suffices in this last branch.

**Exact surviving numerical window.** A counterexample to AC must have

    b>=4,  b/2+1/2 < m < b,

or equivalently 2m-1>b and m<=b-1. This is only a necessary window, not existence evidence. It is stronger than the prior C5-only attempted discriminator. A nonempty bipartite link is always automatic from Konig's theorem and m<=b, regardless of b.

Evidence: necessary bound is PROVED_USING_PUBLISHED_INPUT (Aharoni); AC-saturation and its corollary are PROVED_USING_PUBLISHED_INPUT (Aharoni and equality extraction/exhaustion). No new external priority claim.

## 9. Joint first-frontier reduction, m=b-1

Fix any maximum L matching M and put J=H-M, k=p-m. The same bounds force

    nu(J)=k,  tau(J) in {2k-1,2k}.

Indeed tau(H)-m=2p-b-m=2k-1, tau(J) is at least this, and tau(J)<=2nu(J)<=2k. Thus nu(J)=k.

**Scoped theorem AC-frontier-essential.** If tau(J)=2k-1 and J has a packing-essential edge e, then AC holds.

**Proof.** Deleting e from J gives R with nu(R)=k-1 and, by cover loss plus Aharoni, tau(R)=2k-2. Use equality blocks of R. Let C be M, e, and opposite pairs covering the blocks and containing every block edge in L. Its cardinality is

    m+1+2(k-1)=m+2k-1=tau(H),

so it is minimum once verified as a cover. Every H triangle either uses M, or is a J triangle using e, or is an R block face; hence it is covered.

Take a surviving link edge f. It lies outside M, e, and all blocks. If f belongs to an old H triangle Q, Q cannot contain any M edge because both that edge and f would be in L. Q is thus a J triangle and must contain e. Every Q has exactly one L edge f, so e must have exactly one endpoint x in X; otherwise either no such Q exists (zero endpoints in X) or Q contains two L edges (two endpoints in X). In the one-endpoint case, f is incident with x. Therefore all old-supported edges of L-C form a star at x. The remaining edges U belong to no H triangle; every U matching appends to every H maximum packing, so vc(U)<=2a. Adding x when needed covers all of L-C at cost at most1+2a. If D>=1 this is at most D+2a=b. If D=0, AC-0 already settles the instance. QED.

The case tau(J)=2k with minimum-cover restriction is NOT settled by this argument. Its analogous block cover union M has size tau(H)+1, hence is NOT a minimum H cover. It must not be counted as an AC proof.

**Critical-subcase observation, not AC.** If tau(J)=2k and every L edge belongs to an H triangle, that nonminimum H cover also covers every apex triangle: the saturated-link residual argument shows any uncovered link edge would have been unsupported. Thus it covers G using tau(H)+1=2p-b+1 edges. For b>=1 this is at most2p, excluding a Tuza counterexample in that subcase. It does not produce a minimum H cover and hence does not resolve AC there. If unsupported link edges remain, adding an endpoint cover costs at most2a, giving a G-cover of size2p+1-D; this proves Tuza when D>=1, again not AC.

## 10. Targeted C5 run and computation qualifications

The fixed C5 link search was frozen before AC-saturation was found. H vertices0..4 induce C5, every rim edge must be in an old H triangle, and outside attachments respect an explicit proper vertex4colouring. `checks/b_c5_probe.py` attempted4129 qualifying graphs, completed3808, and timed out321; timed-out optima are UNKNOWN, not PASS. Runtime98.231019seconds; seed17052026. None of the completed instances entered budget b<=2. Thus the batch supplies no evidence in its intended narrow hard regime; that regime was settled symbolically above instead. `evidence/b_c5_probe.json` retains aggregate counts and exact seed, generator, limits. No broad all-graphs census occurred.

Two attempted macOS RSS/AS limits raised ValueError before any search. The finalized script uses125s CPU limit,115s wall stopping,0.16s per-graph deadlines, graph order<=12, bounded recurrence caches, and a700MiB peak-RSS stop check between cases. The RSS check is a measured stopping convention, not an OS-enforced hard bound. RLIMIT_RSS and RLIMIT_AS are identical on this environment and could not be set. No solver was installed. All search computations have stopped.

## 11. Exact current status and missing theorem

The literal AC statement remains **UNRESOLVED / LIVE_UNPROVED**. Proved scoped cases: D=0; D=1 with an essential edge of H; m=b; all b<=3; and the m=b-1 branch whose residual J is slack one with an essential edge. The genuinely remaining first-frontier configurations have J tight (minimum-cover restriction unresolved) or J slack one and packing-edge-stable. The tight-J branch is already excluded for a hypothetical critical G with all link edges old-supported, but that is a separate restricted critical-subcase implication.

A concrete next local theorem is to settle AC in the first surviving m=b-1 branch, especially packing-edge-stable slack-one J. It is materially more specific than arbitrary Tuza: J has known numerical slack and matching-deletion origin, and actual graph geometry must control the minimum-cover choices. However no global theorem forces arbitrary minimal counterexamples into this apex class; availability remains unsupported. The new reductions therefore justify a precise scoped question, not a longer unrestricted campaign by themselves.

All new proofs require fresh internal AI criticism and retain independent_final_verification: NOT_RUN. No Lean claim. The coordinator should record any later amendments and preserve this frozen text separately.
