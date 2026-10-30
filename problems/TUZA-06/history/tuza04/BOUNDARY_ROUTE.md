> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# TUZA-04 boundary route — working proof audit

Status as of 30 October 2026: independent ordinary reconstruction of selected prior unverified drafts, plus a cover-switching consequence. No Lean check was run. A later targeted numerical probe is recorded in the final sections below. These are not claimed as historical novelties.

## Sources and boundary

Frozen manuscript `reference/papers/tuza-triangle-restoration/main.md`, Sections 8, 10, 11, 12, and proof coverage/Lean verification/scope records were inspected. Baseline revision is `97e913008e466de14f61437d8dae774946d92e8f`.

Read-only private drafts actually inspected (not inferred from inventory):
- `[private-workspace-path]`
- `[private-workspace-path]`
- `[private-workspace-path]`
- `[private-workspace-path]`
- `[private-workspace-path]`
- `[private-workspace-path]`
- `[private-workspace-path]`
- `[private-workspace-path]`

Their inventory status was unverified and is not silently promoted to frozen-baseline acceptance. This route reconstructs the deletion classification below. The availability and coloring notes remain prior candidate mechanisms with their stated gaps.

## Audited deduction: when cover-preserving deletion destroys edge stability

**Statement.** Let D(H) be 3-partite, nu(H)=h, tau(H)=2h-1, and nu(H-g)=h for every graph edge g. Suppose tau(H-e)=tau(H), and H-e has a packing-essential edge f. Then the unique slack-one triangle component of H is exactly a central K4 with one or two leaf K4s attached on distinct spokes at a common central vertex, each leaf using two fresh vertices. All other triangle components are isolated K4 face families. Triangle-free background edges are permitted.

**Evidence status:** complete ordinary deduction reconstructed in this route, using the frozen graphical equality consequence, exhaustion, and closed-boundary theorem. No new Lean verification. The mathematical statement/proof already existed as an unverified TUZA-03 private draft.

**Proof.** Put K=H-{e,f}. Essentiality of f in H-e gives nu(K)=h-1. Since a single deletion lowers tau by at most one, tau(K)>=2h-2; Aharoni forces equality. Let k=h-1. The full triangle family of K is exhausted by k edge-disjoint K4 face families.

Write f=xy. A K4 block contains at most one old spoke among all new xy-pages collectively. It cannot contain both x and y. If it contained xt1 and xt2, then yt1,yt2 and t1t2 make a K-triangle outside the block sharing its edge t1t2, contradicting exhaustion. Thus if every f-page met a block support, choose in each touched block the opposite-pair cover containing its unique touched spoke; the resulting 2k-cover would cover K+f=H-e, contrary to tau(H-e)=2k+1. Hence there is a free f-page Qf=xyz whose two old spokes lie in no K4 support.

Stability of f in H forces some e-page Qe in H-f. Every such e-page intersects Qf; otherwise choose one face of each K4 avoiding its possible single intersection with Qe and append Qe,Qf, obtaining k+2>h.

If e and f are adjacent, there are two cases. If their other endpoints are nonadjacent, their two-edge set is a closed boundary with independent singleton U equal to the shared center and independent P equal to its two leaves. The local uniqueness condition is automatic because U is a singleton. Frozen Theorem 11.1, applied to equality K, forces an H-essential edge, contradicting stability. This directly replaces the private draft's reference to a separate star-deletion lemma. If e=xy and f=xz close a wedge with old edge yz, a free f-page xzw has w!=y. Its only possible intersection with an e-page in H-f forces that page to be xyw. Then yzw is a K-triangle using the free spoke zw, contradiction.

Thus e,f are disjoint. Retain f=xy and Qf=xyz. Intersection of an e-page with Qf forces e=zw (w outside x,y,z), and its apex is x or y. Choose Qe=xzw. Its only old edge that can lie in a K4 support is xw, because xz is free. No f-page xyt with t outside {z,w} exists: it is disjoint from Qe, and every old block has a face avoiding their combined edges. The only possible nonavoidance would be opposite block edges xw and yt, which would put x,y together in a block and require missing f. Edges xw and xt are adjacent and admit an avoiding face. Thus such a page would yield k+2 triangles.

If xzw were the only e-page, then xyw could not be an f-page because it would also create yzw. All new triangles would be xyz and xzw, sharing xz; deleting xz leaves at most k packed old faces, contradicting H-stability. Hence both xzw,yzw exist, as do xyz,xyw, and these four K4 faces are the entire new family.

The new K4 can meet old block supports only on xw and yw. They belong to different blocks if both occur, because a block containing both would contain missing xy. At least one occurs, since otherwise H is an equality union of isolated K4s. An attached block has two vertices outside the central four: containing y or z would require a missing edge. Two attached blocks cannot share a further private vertex t, as they would share wt. Therefore the only nontrivial triangle component is the asserted one- or two-leaf fresh spoke star. QED.

## Audited lifting observation

A tau-preserving edge deletion cannot first arrive at a five-wheel, K5 minus an edge, or a fresh one-/two-/three-leaf spoke-star defect (plus isolated equality blocks). Reason: every newly recovered triangle Q must meet the stable defect R in at least two old edges; otherwise maximum packings in R and each isolated block can avoid Q and Q augments. Thus Q lies within R. Every missing internal edge in a spoke-star closes a hub triangle disjoint from the packing of opposite base faces; every missing rim chord in W5 produces a three-packing; completing K5 minus an edge raises tau from 3 to 4. Each contradicts preservation of nu or tau. This is also a reconstruction of an existing private draft, not a new claim of novelty.

Consequently, in an unresolved stable slack-one instance outside these settled defects, any deletion sequence whose total deletion is known to preserve tau preserves nu and edge stability at every intermediate stage and cannot first enter a settled defect. Individual cover-preserving deletions CANNOT be unioned without proving total preservation.

## Exact two-apex cover switching

Assume the precise Corollary 11.3 configuration: independent U={a,b,c}, independent P={p,q}, exactly the seven new triangles abc and six universal-apex pages, stable H with (nu,tau)=(h,2h-1), restored J with (nu,tau)=(h+1,2h+2).

1. Every one of the six spokes is in no minimum H-cover. For example, if C contains ap, adding bc and aq covers every new triangle, contradicting actual cover gain three. Equivalently each individual spoke deletion preserves tau(H).
2. Deleting an entire row R_u={up,uq} preserves tau(H), because R_u plus the opposite base is a three-edge cover of all new triangles and all old triangles lost by deletion. Aharoni and monotonicity give nu(H-R_u)=h.
3. In H-R_u, each of the two opposite spoke pairs among the remaining two rows is contained jointly in a minimum cover. Indeed their deletion completes a compatible four-spoke path; Corollary 11.3 gives tau=2h-3 and nu=h-1. Adding the opposite pair to a minimum descendant cover yields a minimum H-R_u cover containing that pair.
4. Thus removal of any row leaves the numerical optima unchanged but switches all other four spokes from excluded from EVERY minimum cover to included in SOME minimum covers, with either opposite pair jointly included. Combining the audited deletion/lifting deduction also preserves edge stability at H-R_u outside settled cores.

This exact switching is a necessary configuration, not an impossibility proof. It uses full actual cover gain, not merely tau of the new family. Its value is to expose the simultaneous-cover constraint missing from the older availability formulation.

## Obstacles and routes not to repeat

- The four-spoke descent changes the new family; it cannot be iterated as if the original seven-triangle family survived.
- Existing availability formula maximizes over ALL packings of H minus the six spokes. Restricting to maximum packings may miss a smaller packing with more available rows.
- A nonmonochromatic apex recoloring exchanges into the unresolved new-family packing-three branch; it is not a solution of that branch.
- Kempe locking statements are conditional on eliminating that packing-three branch and concern different deleted graphs; their component partitions cannot be unioned.
- Cover-excluded edges need not be triangle-free or absent in stable slack-one graphs. The two-K4 shared-edge core provides active excluded edges.
- No proof here rules out an invisible K2,3 whose two parts are independent, or the exact two-apex cover-switching configuration.

## Stronger new deduction: all six spokes are active

This was developed during TUZA-04 from the accepted Corollary 11.3 and the elementary zero-cost row deletion, independently checked by this route. It improves the qualified five-active-spoke premise to all six in the precise critical configuration.

**Theorem.** Under the exact Corollary 11.3 hypotheses (stable tripartite slack-one H; independent terminal triple; exactly two nonadjacent universal apices; actual restored parameters nu(J)=h+1 and tau(J)=2h+2), every one of the six spokes belongs to an old H-triangle.

**Proof.** Suppose ap lies in no H-triangle. Choose the compatible pages abp and bcq. Their four-spoke path is

    A={ap,bp,bq,cq}.

The row {bp,bq} is cover-preserving: adding bp,bq,ac to any cover of H-{bp,bq} covers every J-triangle, so actual gain three forces tau(H-{bp,bq})=tau(H). Deleting ap changes no old triangle, including after that row deletion. Deleting the final edge cq decreases tau by at most one. Therefore

    tau(H-A) >= tau(H)-1 = 2h-2.

But accepted Corollary 11.3 applies to this compatible page pair and gives tau(H-A)=2h-3, contradiction. Relabeling treats every spoke. QED.

The proof does not require the private two-edge-deletion classifications, the prior five-active footprint argument, or a five-active premise. The four-spoke value used here is the unconditional first conclusion of accepted Corollary 11.3, whose stability conclusion alone was qualified by activity. Thus this is not circular.

Because every spoke is excluded from every minimum H-cover, none can belong to an isolated equality K4 component. Hence all six lie in the unique defective triangle component. In particular all five boundary vertices belong to that defect.

Moreover every compatible four-spoke deletion has an active deleted spoke in each terminal row. Exactness makes different rows have disjoint old lost-triangle supports, supplying a three-packing. The accepted companion stability theorem (d=1) therefore shows that **every** compatible four-spoke descendant is packing-edge-stable, not merely some chosen descendant.

**Implication and limit.** This removes the activity qualification within the exact two-apex critical subclass and gives six stable descendants (one for each compatible four-spoke path). It still does not provide an intact expensive family in those descendants, so iteration to contradiction remains unproved.

## Failed six-spoke cover shortcut (caught in review)

Deleting all six spokes S does not give tau(H-S)>=tau(J)-6 merely because S covers all pages: S misses the restored triangle abc. The unconditional cover bound uses S plus one restored base, hence seven edges, leaving nu(H-S) in {h-2,h-1}. A six-edge bound is available if an inactive spoke can be omitted and a base added, but the theorem above now rules out such inactive spokes in the critical stable configuration. Do not reuse the invalid generic six-edge bound.

## Further consequence: defective packing number at least five

For a terminal u, let L_u be all old triangles using up or uq. Exactness makes L_u a bipartite matching family between {p,q} and the outside neighbors of u. Different rows have disjoint edge supports. All six spokes are active by the new theorem, so each row matching number is either one or two.

**Elementary exclusion of two rank-one rows.** Suppose rows b,c each have matching number one. Because both spokes are active, each row consists precisely of two triangles with one common outside neighbor: bpx_b,bqx_b and cpx_c,cqx_c. Exactness ensures x_b!=x_c. The row spines bx_b,cx_c cover their respective old row families.

Deleting row {ap,aq} preserves tau(H). Let

    O=H-{ap,aq,bx_b,cx_c,qx_b,px_c}.

The final four edge deletions cost at most four, so tau(O)>=2h-5. Aharoni gives nu(O)>=h-2. Every surviving S-edge is triangle-free in O: row a was deleted, while both other rows lost their sole spines. Consequently every O-packing is compatible with the four pairwise edge-disjoint J-triangles

    abp, acq, bqx_b, cpx_c.

Their bases are new, their spines/rims were deleted, and their S-spokes are absent or triangle-free in O. Appending these four triangles gives h+2, contradiction. Thus at most one row has matching number one, and

    nu(L_a)+nu(L_b)+nu(L_c) >= 1+2+2 = 5.

Every S-edge belongs to the unique defective triangle component R (it is active and is excluded from all minimum covers, whereas every edge of an isolated K4 belongs to some minimum global cover). Hence all L-triangles lie in R and

    nu(R)>=5.

The two-rank-one-row exclusion was already in the private unverified draft `proof/TWO_FULL_SINGLETON_ROWS_EXCLUSION.md`; its entire proof is reconstructed above using accepted Aharoni only. Its combination with the new unconditional all-six-active conclusion is the new strengthening here: it excludes defective packing number four as well as the smaller cases, for the exact critical two-apex setting. The source hash is recorded immediately below after the shell audit.

If K=H-S has nu(K)=h-2, the standard seven-edge cover bound and closed-boundary equality exclusion force tau(K)=2h-5. Since the full lost family L has packing at least five, accepted companion stability (d=2, threshold d+2=4) shows K is packing-edge-stable. This stability conclusion improves the earlier availability note's boundary, but still does not preserve an expensive restored family after deletion.

Private singleton-row source SHA-256: `a10260418f3a7d4c9f2176e8421c95a446108c3cd1743e225457ef45469d480f`.

## Exact cover-profile interface for the restored graph

Let S be the six spokes, K=H-S, and F the seven-triangle bipyramid family. For **any** edge cover C of all K-triangles with C subset E(K), define R(C) subset S by putting ur in R(C) exactly when some old H-triangle on ur is not met by C. These are required spokes if the rest of the cover is chosen within S. The optimization ranges over ALL K-covers, not merely minimum or inclusion-minimal ones; triangle-free K-edges may help cover lost triangles and cannot be discarded in advance.

For R subset S, define b(R) as the smallest size of D union B where R subset D subset S, B subset E(abc), and D union B covers F. Then

    tau(H) = min_C ( |C| + |R(C)| ),
    tau(J) = min_C ( |C| + b(R(C)) ).

**Proof.** Given C, adding its required spokes covers every old triangle, proving the first upper bound. Any old cover partitions into its K-edges C and its S-edges D; each old triangle missed by C forces its unique S-spoke into D, proving the reverse. For J the same partition includes restored bases B. All old triangles force R(C) subset D, and the remaining requirement is exactly that D union B cover F. This proves both equalities. No minimax interchange or fractional rounding is involved.

**Explicit table.** The value of b(R) is:

| Required set R | b(R) |
|---|---:|
| empty | 3 |
| one spoke | 3 |
| two spokes in one terminal row | 3 |
| any other two spokes | 4 |
| three spokes forming a full apex column | 5 |
| any other three spokes | 4 |
| four, five, or six spokes | cardinality(R)+1 |

For a selected superset D, write M_p,M_q for its missing terminal indices in each column. A restored base uv is mandatory precisely when it belongs to binom(M_p,2) union binom(M_q,2), since one of its pages then lacks a selected spoke. At least one restored base is required in all cases to cover abc. Thus the exact cost for D is

    cardinality(D) + max(1, cardinality(binom(M_p,2) union binom(M_q,2))).

Minimizing this elementary expression over D superset R proves the table. Explicitly, a single required spoke can be completed by its row mate and the opposite base; a required row pair needs that base only; a nonrow pair needs total four; a mixed three-set leaves at most one mandatory base; a full column of three needs either all three bases or one opposite-column spoke and one base, the latter giving five; at least four spokes leave at most one mandatory base and always require one base. None of the smaller table values is possible because the displayed mandatory-base expression accounts for all uncovered pages and abc.

**Independent finite check.** The parent route independently evaluated all 512 subsets of the nine boundary/restored edges against all 64 required-spoke profiles on the verification server, using `check_boundary_profiles.py`; recorded result `boundary_profiles.json` / associated log PASS, reported at 10:13:47 UTC. This only checks the finite table; the interface identities above have ordinary proofs and concern arbitrary old graphs.

**Critical profile restrictions.** Write t=tau(H)=2h-1 and d=t-tau(K). The seven-edge cover and four-spoke descendants give d in {2,3,4}. Actual cover gain three implies for every K-cover C

    cardinality(C)+b(R(C)) >= t+3.

For every minimum K-cover this yields:
- d=4: R(C) is ALL SIX spokes;
- d=3: at least five spokes are required;
- d=2: at least four are required, or exactly the three spokes in a full apex column.

More generally, when d=4, every K-cover of size tau(K)+1 still requires at least five spokes. Every old-optimal extension has R empty: b(R)-cardinality(R) is three only at the empty set, and at most two otherwise.

**Difference from prior drafts.** `CLOSED_BOUNDARY_PACKING_COVER_INTERFACE.md` already supplied general row-matching formulas for old H, and `EXACT_TWO_APEX_AVAILABILITY_CRITERION.md` supplied the restored packing formula. The table above explicitly includes the restored triangle's base-cover requirement and ranges over every old cover profile, giving exact whole-graph gain conditions. It is a new local formulation in this inspected project record, not a novelty certificate. It does not solve the simultaneous packing/cover obstruction.

## Full-boundary loss-two branch: sharper local pattern

Suppose nu(K)=h-2 and write k=h-2. Then tau(K)=2k-1 and K is stable, as proved above. Let R_u be a complete terminal row of two S-spokes. For any distinct rows u,v, K+R_u+R_v is H with the third row deleted, hence has tau=t=tau(K)+4. Consequently, for EVERY subset A of those four spokes,

    tau(K+A)=tau(K)+cardinality(A).

The lower bound follows by adding the remaining 4-cardinality(A) spokes; the upper bound is the elementary deletion/addition bound. In particular every pair of spokes has cover gain two over K, and every three-spoke set using at most two rows has gain three.

For an opposite-column/different-row pair A, critical restored packing implies nu(K+A)=k+1: a larger packing would have to consist of k K-triangles plus one available old triangle on each of the two spokes, which the prior restored availability formula forbids. Aharoni gives the lower bound from tau=2k+1.

For a three-spoke set A using at most two rows, nu(K+A)=k+2. Indeed tau=2k+2 forces nu>=k+1. Equality at nu=k+1 would give k+1 edge-disjoint K4 blocks. Since U and P remain independent, each block contains at most one S-edge, so selecting a face avoiding that edge in each block gives k+1 triangles already in K, contradiction. Monotonicity in H gives the upper bound k+2.

Each single-spoke addition also raises nu from k to k+1. Otherwise it has tau=2k and nu=k, hence is an equality union of K4 blocks. Removing its sole added spoke leaves one damaged K4 (a diamond), whose common remaining edge is essential in K; all other blocks are intact. This contradicts K-stability. These are necessary exact local rank patterns, not an impossibility proof.

## A separate unproved independent-vertex avoidance target

In K all five boundary vertices W=U union {p,q} are independent. Every edge of every L-triangle touches W. Since nu(L)>=5, a packing of K-W of size at least k-2 would combine with five L-triangles to give h+1 old H-triangles, contradiction. Thus the full-boundary loss-two branch necessarily has

    nu(K-W)<=nu(K)-3.

This suggests the precise next target:

> If D(K) is 3-partite, K is packing-edge-stable, tau(K)=2nu(K)-1, and W is an independent vertex set of size at most five, must nu(K-W)>=nu(K)-2?

This is an **unproved conjecture**, not a consequence of HNS equality or of the finite test below. The constant two would be sharp: deleting the hub of the five-wheel removes all its triangles, giving loss two. A conjectured loss-one bound is false. The actual restoration boundary has the additional property that N_K(a),N_K(b),N_K(c) are pairwise disjoint, which may permit a narrower target if the unrestricted independent-set conjecture fails.

A proof of this target would eliminate the nu(K)=h-2 branch only. The nu(K)=h-1 branch remains and cannot be silently discarded. No published theorem supporting this target was found by the literature route's targeted primary-source checks; negative searching is not a novelty certificate.

## Narrow independent-set computation

    timeout 120s env PYTHONDONTWRITEBYTECODE=1 python3 -u boundary_independent_loss_probe.py > boundary_independent_loss_probe.log 2>&1

Two runs completed, each about 0.28 seconds; the second removed a harmless dead source line and is the final reproducible checkpoint, completed 2026-10-30T10:30:26Z. The script read existing TUZA-03 JSON files without modifying them and imported the inspected exact recurrence solver `exact_core.py` with bytecode generation disabled. It retained saved slack-one candidates from the 16 bridge-deletion survivors, 3 gluing cores, and 39 five-block seeds, deduplicated by exact labelled edge sets, and added W5 and K5-minus-edge as named calibrations.

For each eligible graph it recomputed exact nu and tau, checked packing-edge stability, and validated a saved full-triangle rainbow labeling or found one by exhaustive three-color backtracking. It then checked every independent subset of nonisolated vertices of size at most five, computing the exact remaining packing number from the full triangle family. Isolated vertices cannot increase deletion loss.

Completed coverage: **13 distinct eligible graphs, 2,162 independent sets**. No loss above two occurred. W5 hub deletion attained loss two; the other listed examples attained at most one. The output includes exact source hashes and graph hashes in `boundary_independent_loss_probe.json`.

This is a small, selected, largely known-core-derived corpus, not an order census and not strong evidence for an unbounded theorem. No new graph generator, solver package, or Lean build was used. No claim is made that the original TUZA-03 searches were rerun.
