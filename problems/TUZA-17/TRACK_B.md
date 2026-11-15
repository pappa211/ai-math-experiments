# Track B — minimum-cover apex compatibility

**Outcome at this update:** the literal AC statement remains **UNRESOLVED**. No eligible counterexample defeating every minimum residual cover has been produced. The mission has proved several unbounded scoped cases, exact minimum-cover-safe local reductions, and precise restrictions on the first numerical obstruction strata. These are substantive partial results, not a proof for arbitrary graphs or a justification for a longer unrestricted campaign by themselves.

Initial proposals were saved before searching in [B_INITIAL.md](notes/B_INITIAL.md). The original scout inherited coordinator context; subsequent coordinator/scout proof development is collaborative. A separately spawned fresh critic reviewed frozen proofs and supplied the simpler final K4-ear reduction. This is internal AI review. Independent final verification and new Lean verification are both NOT_RUN.

## 1. Frozen literal target and complete state identities

H is finite simple and has a three-colouring of GRAPH EDGES under which every ACTUAL H triangle is rainbow. X is a vertex subset and L=H[X] is induced and triangle-free. G adds a new vertex z adjacent exactly to X. Let h=nu(H), p=nu(G), a=p-h, D=2h-tau(H), b=2p-tau(H)=D+2a, and m=matching(L).

For minimum H triangle-edge covers C define

    lambda(H,L)=min_C vc(L-C).

AC is the existence assertion lambda<=b, equivalently some MINIMUM H cover C has |C|+vc(L-C)<=2nu(G). A poorly chosen minimum cover does not refute it. A counterexample must defeat every minimum cover and needs a packing upper bound, not merely a constructed packing.

Independently reconstructed known identities are

    tau(G)=min_{ALL H triangle covers C} [|C|+vc(L-C)],
    nu(G)=max_{matchings M of L} [|M|+nu(H-M)].

C deletes only link EDGES, not their endpoints; H-M deletes matching EDGES. A G cover splits into an H cover and spoke endpoints covering the surviving link. A G packing splits into a matching of apex pages and an old packing avoiding its rim edges. Both constructions lift in the reverse direction. These identities are KNOWN_INPUT and do not prove the minimum-cover restriction.

For exact computation, if S subset X and F=E(L[X\S]), the least H cover containing F has size |F|+tau(H-F). Therefore

    lambda=min {|S| : |F|+tau(H-F)=tau(H)}.

This is another exact state identity, not a compatibility theorem.

## 2. Proved numerical and structural cases

The full proofs are frozen in [B_FROZEN_v1.md](notes/B_FROZEN_v1.md), [addendum1](notes/B_FROZEN_ADDENDUM_1.md), [addendum2](notes/B_FROZEN_ADDENDUM_2.md), and the independent boundary reconstruction [BOUNDARY_CRITIC.md](notes/BOUNDARY_CRITIC.md).

- **Necessary matching budget:** m<=b. For a maximum L matching M, tau(H)-m<=tau(H-M)<=2nu(H-M)<=2p-2m. Aharoni applies because edge deletion preserves the rainbow triangle colouring.
- **Saturated matching:** m=b implies AC. The same inequalities force H-M tight. HNS graphical equality extraction and the prior TUZA-03 exhaustion give literal edge-disjoint K4 blocks covering every residual triangle. Add M to opposite-pair block covers containing each block's at most one link edge. This is a minimum H cover. Every remaining link edge belongs to no H triangle, so its matchings append to every H maximum packing, yielding residual vertex cover at most2a<=b.
- **Tight H:** D=0 implies AC. Equality block faces can in fact avoid ALL L edges simultaneously, giving a>=m and b>=2m.
- **Slack-one H with a packing-essential edge:** D=1 and nu(H-e)=h-1 imply AC. H-e is tight; the chosen minimum cover is e plus compatible block pairs. A matching of the surviving link conflicts with at most one old e-page, and the triangle-free vertex-cover saving gives lambda<=1+2a.
- **First matching frontier:** when m=b-1, J=H-M has nu(J)=p-m and tau(J) in {2nu(J)-1,2nu(J)}. If J is slack one and has a packing-essential edge, AC holds by a tight-block cover plus one star on the surviving old-supported link edges. The packing-edge-stable slack-one branch is not settled by that proof.
- **Tight matching-deletion transfer:** whenever J=H-M is tight, all actual old/apex triangle edge supports split by connected components of L, plus background K4 groups. A block contains at most two X vertices, necessarily in one link component; every restored M-page meets X only in its matching endpoints. Consequently AC may be proved componentwise with exact packing and minimum-cover additivity. Arbitrary outside vertex sharing is allowed; every crossing triangle is accounted for. Components of matching number at most3 are settled this way.

The equality structure is invoked ONLY for an explicitly proved tight rainbow-colourable remainder. No unrestricted tight-graph classification is assumed.

### Budget four and five are completely settled

In a triangle-free graph of matching number m, a maximum matching has, on each edge, an endpoint with no unmatched neighbor. Removing one such endpoint from its endpoint cover gives vc<=2m-1. For m>=3, two chosen safe endpoints can be chosen nonadjacent, giving vc<=2m-2. In particular m=1,2,3 give vc<=1,3,4. Together with saturation, this proves AC for every b<=4, retaining the distinction that the saturation case supplies SOME minimum cover while the smaller-m cases permit EVERY minimum cover.

The coordinator, Track A scout, and fresh critic then proved the unbounded classification

    triangle-free m=4 and vc=6  <=>  two disjoint C5s plus isolates.

The proof uses a fully supplied elementary Gallai matching argument and the elementary nine-vertex triangle-free independent-four-set bound; it is not a finite graph census. If AC failed at b=5, all minimum H covers would avoid all ten cycle edges because deleting any one drops vc from6 to5. Thus tau(H-e)=tau(H) for each link edge. Deleting a four-edge L matching first at zero cover loss and then at most three more forces H-M tight. The component transfer reduces to two matching-two instances, contradiction. Therefore **AC holds for all b<=5**. The subsequent independently checked critical-edge/intersection argument below extends this through b=6.

This proves absence of AC FAILURE at b=5. It does not by itself prove that the raw triple b=5,m=4,vc(L)=6 is unrealizable.

## 3. Ordinary minimum-cover-safe ear reductions

The preferred complete proof is [B_FROZEN_ADDENDUM_5.md](notes/B_FROZEN_ADDENDUM_5.md). [Addendum3](notes/B_FROZEN_ADDENDUM_3.md) contains the exact outside-X lambda identity; [addendum4](notes/B_FROZEN_ADDENDUM_4.md) preserves the earlier valid case-split proof. The final deterministic simplification was supplied by the fresh internal critic.

**K4 ear.** Suppose H contains K4 on {u,v,a,b}, with N(a)={u,v,b} and N(b)={u,v,a}. Let J=H-{a,b}-uv and X0=X intersect V(J). If X meets this K4 in exactly one old endpoint u and one private vertex a, set Y=X0\{u}; otherwise Y=X0. Then

    AC(J,Y) => AC(H,X).

This is a counterexample-preserving reduction to ONE explicitly constructed smaller marked instance. No optimum oracle is needed to select the branch; only X membership matters. Every J minimum cover C_J lifts to the H MINIMUM cover C_J union {uv,ab}, because every H cover normalizes to these two K4 edges and tau(H)=tau(J)+2. In the exceptional marking, adding vertex u covers the one new leaf link edge and all old link edges incident with u, at extra cost one. The two triangles zua and vab append to every smaller-instance packing, paying for that cost and the two cover edges with one unit to spare. Other markings require only one appended K4 face.

When a,b are both outside X, normalization gives the exact identity lambda(H,H[X])=lambda(J,J[X]), as well as the scalar cover offset. This addresses the minimum-cover quantifier directly rather than replacing it with unrestricted cover minimization.

**Degree-two triangle ear.** If N_H(a)={u,v} and uv is an edge, let J=H-a-uv and Y=X\{a}. Then AC(J,Y) implies AC(H,X). Normalize a minimum cover to include uv, giving tau(H)=tau(J)+1; the link changes by at most one leaf edge, while the ear triangle appends to every smaller packing.

Both transfers are **PROVED_ORDINARY**, with no Aharoni/HNS dependency. They strictly reduce graph size. A smallest AC counterexample has neither ear configuration. No theorem guarantees one of these configurations in every eligible remainder, and no arbitrary minimal Tuza counterexample is proved to admit the required apex decomposition. The scalar local-reduction ideas have predecessors; historical originality of the explicit minimum-cover transfers is UNESTABLISHED.

## 4. Failed intermediate mechanisms, kept separate from AC

**Supported-link slack rule:** the stronger assertion that some minimum H cover leaves vertex-cover cost at most D on old-supported link edges is false. H=W5, the cone over C5, has h=2,tau=3,D=1. With X the rim, every L edge is old-supported, but every minimum cover contains at most one rim edge, and lambda=2. The original AC budget includes packing gain and is satisfied. The exact proof is in [A_SLS_RESULT.md](notes/A_SLS_RESULT.md). This does not refute AC.

**Small stable core:** the frozen claim that a rainbow-colourable, packing-edge-stable, triangle-connected slack-one graph must have nu<=2 is false. [B_CORE_LIMITATION.md](notes/B_CORE_LIMITATION.md) gives an8-vertex graph formed from K4s on0123,0145,0267 with nu=3,tau=5. All actual triangles are reconstructed, all edge deletions retain a3-packing, and all minimum covers are listed. A second K4 attachment gives nu=4,tau=7. The proposed forbidden-edge iteration then stops: every edge lies in some minimum cover. No unbounded family or patched constant bound is claimed.

These examples do not include an actual Tuza violation and do not refute conditional claims with the full minimal-counterexample hypothesis. The newly proved ear reduction explains why these larger stable cores can still be simplified for AC, but availability of ears in every stable slack-one core remains unproved.

## 5. Finite work actually performed

All computations reconstruct actual triangles and use exact integer recurrences; no floating-point feasibility verdict is treated as proof. Existing Python3.12.12 only; no solver or package installation. Producer recursion is supplemented by ordinary decisive proofs and, for the core witness, a separate direct subset enumeration of all optimum-cardinality covers.

| Check | Actual result | Scope/limitation |
|---|---|---|
| `b_probe.py` |431 eligible nonempty-link probes across7 structured H seeds PASS; K6 seed ineligible | K4 amalgams and old triangle attachments; no global inference |
| Four-port apex decomposition | Vertices0–3 NOT_APPLICABLE; tips4–7 PASS | Four eligible rows have total minimum-restricted cover cost5 versus2nu(G)=8 |
| `b_c5_probe.py` |3808 completed,321 timeouts UNKNOWN;98.23s |4129 old-supported C5-link attempts; NONE reached intended b<=2 regime; no evidence of hard-case survival |
| `b_stable_core.py` |2304 completed,0 timeouts;1.45s | This crossedge family found no connected stable slack-one core; later explicit attachment refuted SMALL-CORE |
| `b_core_glue.py` |3 exact stages;7 and33 minimum-cover lists rechecked | Ordinary transfer proves optima;0.21s watchdog run |
| `b_k4ear.py` |71 eligible outside-X identity instances PASS | Exact tau/lambda and both packing identities |
| `b_k4ear_allx.py` |223 eligible markings PASS |149 ordinary markings,38 stable-spoke and36 essential-spoke exceptional cases; both realize the final deterministic two-triangle proof |
| `b_petersen.py` |ALL6 perfect matchings and their complements checked | Exact link-only obstruction to universal matching-deletion certification; no H counterexample |

The coordinator’s broken-K2-join odd-cycle probe checked three actual eligible H instances with link lengths5,7,9. Their exact budgets were5,7,9 and lambda=1 in each case; they do not realize the hard link/low-budget combination. Full data are in `evidence/boundary_cycle_attachment.json`.

The separate coordinator random4-partite run and independent critic checks are preserved in their own evidence and reported centrally. Counts above are not a claim of independent random coverage or a comprehensive census. Natural triangle-free-H apex decompositions of the Clebsch cone and VB hub are automatic controls; they do not test AC's hard interaction.

The initial C5 script's two attempted macOS RSS/AS limits failed before searching. Its finalized run used CPU/per-case/wall limits, bounded caches and a measured RSS stop between cases; the later checks used the coordinator's inspected external wall/RSS watchdog. These protection methods and limitations are recorded, rather than claiming an unsupported OS hard limit. No computation from this scout remains running.

## 6. Owner-steered boundary realizability work

The boundary argument now proves AC through b=6. At b=6, the remaining link shapes all have a cover-critical edge belonging to some maximum matching. AC failure would force this edge to occur in no minimum H cover, so deleting a maximum link matching containing it forces a tight remainder. The graph-specific packing argument requires at least four edges to belong to EVERY maximum link matching, while the complete link classification permits at most one. This contradiction settles b=6. The eleven-vertex critical-edge lemma has a complete elementary proof in BOUNDARY_A.md and was independently checked by this scout.

Using Gallai decomposition and the already proved small matching bounds, matching number6 permits vertex-cover number at most9. The first numerical failure stratum left by these arguments is therefore

    b=7, m=6, vc(L)=lambda(H,L)=8.

All vc9 link shapes at b=7 were subsequently settled: 3C5 by the ordinary general frontier certificate, and the13-vertex independence4 alternative using the DECLARED completeness of McKay’s R(3,5) catalogue plus an exact check of its unique13-vertex graph. The local graph check does not reprove catalogue completeness. This extra external finite-classification input is separate from the proof of all b<=6, which does not use it. No full eligible realization at the still-uncovered vc8 stratum is asserted.

This is a CONDITIONAL numerical stratum, not an actual realized H,X or a counterexample. [BOUNDARY_A.md](notes/BOUNDARY_A.md) and [BOUNDARY_CRITIC.md](notes/BOUNDARY_CRITIC.md) classify possible link shapes and separate actual raw-budget controls from hard-link controls. No complete eligible realization of all displayed parameters is asserted at this update.

[ B_BOUNDARY_REALIZABILITY.md ](notes/B_BOUNDARY_REALIZABILITY.md) adds necessary full-instance restrictions. For every maximum H packing P, matching(L-E(P))<=a, while P uses at most h L edges. Hence h>=|E(L)|-rho_a(L), where rho_a is the maximum number of edges in an L subgraph of matching at most a. In particular a=0 forces h>=|E(L)|. A C5 link has b>=3; at saturated budget m=b with a=0 the link has a perfect matching on its nonisolated vertices. Tight matching deletion for2C5 therefore forces b>=6.

A connected literal link at m=5,vc=7 is C11 with differences+/-1,+/-3. It is triangle-free, has an explicit three-vertex-colouring, matching5 and independence4. It alone does NOT realize b=6. At that budget it would require a<=2, and the smallest possible regime has a=2,D=2,h>=14,tau(H)>=26. Small H probes cannot test this exact boundary meaningfully. Disconnected C5+C7 or2C5+K2 need h>=7 orh>=6 respectively in the a=2,D=2 regime, still only necessary conditions.

The new general frontier certificate in [B_FRONTIER_MATCHING_CERTIFICATE.md](notes/B_FRONTIER_MATCHING_CERTIFICATE.md) proves AC when m=b-1, some maximum link matching M leaves vc(L-M)<=b, and fewer than m-1 edges are forced in every maximum link matching. Its proof is unbounded. Disjoint unions of at least two Petersen graphs show that the link-deletion hypothesis is not automatic; those graphs are NOT full budget-realized apex counterexamples.

The stronger raw-link inequality vc(L)<=b is not proved here. Its possible failure is a useful discriminator of realizability, but it must not be silently substituted for AC. The completed link-only helper investigations concerned intermediate statements, not actual H counterexamples. A necessary realizability barrier also excludes H whose entire edge set partitions into K4 blocks: rainbow colour classes then give tau(H)=2k, while block faces avoiding all L edges and an L matching give b>=2m. The proof is recorded in B_BOUNDARY_REALIZABILITY.md. No additional full-instance construction appeared during this scout’s development window.

## 7. Dependencies, unrestricted relevance, and next decision

Ordinary results include the exact state identities, safe ear transfers, stable-core counterexample, matching-cover elementary estimates and footprint bounds. The tight-remainder results explicitly use Aharoni's tripartite inequality and Haxell–Narins–Szabó's equality theorem through the authenticated TUZA-01 extraction/TUZA-03 exhaustion. Source editions and access limitations are in the central dependency ledger. No unrestricted equality classification, general S/E, or hidden published restoration assumption is used.

Even FULL AC would prove only a scoped apex-extension theorem. An arbitrary minimal Tuza counterexample need not have a vertex with a rainbow-colourable remainder and triangle-free induced link. No availability or repeated-decomposition theorem is established. The ear transfers provide concrete safe moves but no proof that an ear must exist after previous reductions. Asking merely that every counterexample have such a move would repackage the unresolved global obstacle.

The supported next work is a separately authorized, bounded test of the first genuinely surviving full-instance boundary or of the precise ear-irreducible stable-slack-one residual mechanism. It needs an actual eligible H with exact packing/cover and all-minimum-cover evidence, or an unbounded structural theorem explaining why the proposed boundary cannot occur. A link graph alone, a finite passing battery, or repeated constant increases is insufficient. No longer unrestricted campaign is recommended solely on the present positive deductions.

Overall AC: UNKNOWN/LIVE_UNPROVED. Independent_final_verification: NOT_RUN. New Lean: NOT_RUN. Historical originality: UNESTABLISHED. No publication or follow-on campaign has been started.
