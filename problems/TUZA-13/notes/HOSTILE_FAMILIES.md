# Hostile families: cone controls and directed mutations

TUZA-13 subtask; all new files are confined to the new private workspace. This note records a separately implemented specialized reduction, not an independent blind review of prior Clebsch mathematics. The author read TUZA-11's Clebsch argument and its old checker, then wrote a standard-library cone checker without importing the old code or coordinator's exact engine. Requested current Astra model/reasoning selection was inherited without override; actual serving metadata is unavailable.

## A useful exclusion, proved ordinarily

Let H be triangle-free and G its cone with apex a. Every base edge uv occurs in exactly one actual triangle, auv. If a triangle cover C is inclusion-minimal, it cannot contain uv together with either au or av: removing uv would still cover every triangle. Thus **every triangle has at most two C-edges**. In particular, for every minimum C, T3(C) is empty and the eligible family equals the full triangle family.

For completeness, this entire cone class satisfies the frozen two-red inequality. Triangle packings of G are precisely matchings of H. A vertex cover of H gives a triangle cover made of the corresponding spokes. Conversely, from a triangle cover, retain its chosen spoke vertices and replace each chosen base edge by one of its endpoints; the resulting vertex cover of H has size at most the triangle cover. Therefore tau(G)=vc(H), while nu(G)=matching(H). Endpoints of any maximum matching cover every base edge, so vc(H)<=2 matching(H). This proves the two-red target for every minimum cover of every triangle-free cone. It does not prove the unrestricted target.

Consequently, a pure triangle-free cone cannot be a falsifier. Mutation must introduce base triangles or more apex structure if it is to make all-red triangles relevant. This motivated the supplied clique-apex, independent-apex, missing-spoke, filled-triple and base-edge-addition candidates.

## All-cover classification and exhaustive finite checks

Let S be the vertices whose spokes are chosen, and U=V(H)\S. In a minimum cover, the chosen base edges are exactly E(H[U]); every such edge must be chosen, and other base edges would be redundant. Cover cost is n-|U|+e(H[U]). Since deleting one endpoint per induced edge leaves an independent set, |U|-e(H[U])<=alpha(H); equality is achieved by a maximum independent set. Thus tau(G)=n-alpha(H), and every minimum cover corresponds bijectively to an U satisfying |U|-e(H[U])=alpha(H). This is a completeness argument for enumerating all 2^n U, not merely one optimizer's cover.

The checker enumerates every U by an integer recurrence for induced edge counts; re-enumerates all triangles from literal actual graph edges; and solves base maximum matchings by a separate vertex-subset recursion. Every optimum cover and private/eligible packing is retained. W7 means a 6-cycle plus apex, and W8 means a 7-cycle plus apex.

| Graph | Vertices | tau | eligible nu | target | margin | All optimum covers | Base subsets examined |
|---|---:|---:|---:|---:|---:|---:|---:|
| C5 cone | 6 | 3 | 2 | 2 | 0 | 10 | 32 |
| W7 | 7 | 3 | 3 | 2 | 1 | 2 | 64 |
| W8 | 8 | 4 | 3 | 2 | 1 | 14 | 128 |
| Petersen cone | 11 | 6 | 5 | 3 | 2 | 5 | 1,024 |
| Clebsch cone | 17 | 11 | 8 | 6 | 2 | 16 | 65,536 |

The Clebsch base is F2^4 with x~y iff x xor y is in {1,2,4,8,15}. Every one of the sixteen minimum covers has private packing number five, confirming the known private-only failure. Every such cover has eligible packing number eight: permitting the two-red triangles repairs the deficit, with margin two above the target six. For this graph no all-red triangle is present for any optimum cover.

Outputs: `witnesses/hostile_C5_cone.json`, `hostile_W7_cycle6.json`, `hostile_W8_cycle7.json`, `hostile_Petersen_cone.json`, `hostile_Clebsch_cone.json`; summary `evidence/hostile_cone_summary.json`. These five tests completed without timeout. The Clebsch subset census alone is 65,536 subsets, not 65,536 distinct graphs. Total covers across these five distinct named graphs: 47.

These five cone computations are historical completed results. The default
[public suite](../REPRODUCTION.md) rechecks selected independent controls; it does
not regenerate this whole cone table or the structured census below. To repeat
this cone generator, use `python3 checks/hostile_families.py` only from a fresh
scratch copy of `problems/TUZA-13`; it overwrites named witness/summary files.
It uses only the standard library.

## Generated mutation bank, not a search claim

`generate_hostile()` in `checks/hostile_families.py` deterministically generates 333 distinct labelled edge-list candidates. `hostile_graphs(max_n=None)` yields `(name,n,edges)` for the coordinator. The generator performs exact labelled deduplication only; it does not claim to quotient graph isomorphism. Candidate types are:

- C5, Petersen and Clebsch bases with one, two or three independent apices, or two/three pairwise adjacent apices;
- single missing base-edge additions to each cone;
- two independent full apices followed by deletion of one spoke from the second apex;
- fill each of the first min(60,n*n) lexicographic base triples into a triangle;
- clique supports of sizes (4,4), (4,5), (5,5), (5,6), (6,6) overlapping in one, two or three vertices, plus one of the first five lexicographic cross edges where available.

`evidence/hostile_candidates.json` retains every literal graph edge list and generator rule. Generating these graphs is **not** a claim that any optimum cover or packing was computed on them. The coordinator's search ledger must supply tested subsets, bounds, cover quantifiers and timeouts separately. No random seeds occur in this deterministic bank.

## Source binding and scope

TUZA-11 discovery HEAD `frozen-packet-11d` and independent verification HEAD `frozen-packet-11v` were clean when inspected. The actual read-file hashes and paths are in `evidence/hostile_source_binding.json`. Only the discovery Clebsch argument/script and applicable AGENTS files were read as mathematical historical input; the independent verification tree was not reread as a source of new conclusions. The migration Mac handoff and report were consulted; no historical remote instructions were executed. No network, installs or source edits were performed.

Auxiliary cone theorem above: **PROVED_ORDINARY**, subject to the mission's independent critic review. Five finite tests: **SURVIVED_TESTED_DOMAIN**, all optima per graph. Frozen universal two-red conjecture remains unproved by this subtask.

## Stronger exclusion for uniform independent apices

Let H be triangle-free, let A be an independent set of r>=1 apices, and join every apex to every vertex of H. For every **globally minimum** triangle cover C, T3(C) is empty. More strongly, no selected base edge shares a triangle with any selected spoke.

Write F=C intersect E(H), J=H-F, and let S_i be the base vertices whose spokes at apex i belong to C. Each S_i covers every edge of J. Moreover each S_i is a minimum vertex cover of J, or replacing it by a smaller one lowers |C| without affecting other apices. Suppose some e in F meets any minimum vertex cover S of J. Replace all S_i by S, preserving the total cover size. Then every triangle on e is already covered by a spoke, so removing e leaves a smaller triangle cover, a contradiction. Hence every e in F avoids every minimum vertex cover of J, in particular all actual S_i.

The independent-checker agent challenged and accepted this argument. Its essential hypotheses are triangle-free base, independent apices, identical full neighborhoods, r>=1 and global minimum cardinality. Unequal neighborhoods prevent synchronizing all S_i; base triangles can prevent removing e. This is a structural exclusion, not by itself a proof of Tuza for all these joins.

An independently authored specialized census tested C5 and Petersen bases with r=2,3,4. It enumerates every F subset E(H), computes alpha(H-F) via an exact subset maximum transform, and checks every resulting minimum cover. Formula:

    tau(G)=min_F (|F| + r vc(H-F)).

For each optimal F all minimum vertex covers of H-F are enumerated and independently chosen at the apices. Choices are quotiented only by permutation of the equal apices, with orbit multiplicities checked against the full product count. The eligible packing is solved as r edge-disjoint matchings in the base, one per apex, with per-apex eligibility restrictions: an exact dynamic program over unused base-edge masks. This uses edge-disjointness, allowing different apex triangles to share base vertices when their spoke edges differ.

| Base | Apices | Vertices | tau | eligible nu | All minimum covers | Margin | Max T3 |
|---|---:|---:|---:|---:|---:|---:|---:|
| C5 | 2 | 7 | 5 | 4 | 11 | 1 | 0 |
| C5 | 3 | 8 | 5 | 5 | 1 | 2 | 0 |
| C5 | 4 | 9 | 5 | 5 | 1 | 2 | 0 |
| Petersen | 2 | 12 | 11 | 9 | 5 | 3 | 0 |
| Petersen | 3 | 13 | 15 | 13 | 76 | 5 | 0 |
| Petersen | 4 | 14 | 15 | 15 | 1 | 7 | 0 |

These six graphs contribute 95 minimum covers before deduplication against other mission batches. For each C5 graph all 32 base-edge subsets were considered; for each Petersen graph all 32,768 were considered. All jobs completed without timeout. Files: `checks/hostile_multiapex.py`, `evidence/hostile_multiapex_classification.json`, `evidence/hostile_multiapex_results.json`.

## Unequal-apex falsification census

The synchronization exclusion was deliberately broken by giving independent apices arbitrary distinct neighborhoods. For fixed triangle-free H and neighborhood N_i, every cover has a base part F and a spoke vertex cover S_i of H[N_i]-F. Therefore

    tau(G)=min_F (|F| + sum_i vc(H[N_i]-F)).

Every global optimum uses a minimum S_i in its residual. Conversely every optimum F with arbitrary choices of such S_i gives a minimum cover. Enumerating all F and all maximum independent complements U_i therefore checks **all minimum covers**, not one preferred optimizer. A selected F edge can now be all-red at one apex and necessary at another.

Initial complete run: fixed C5 with three independent apices whose neighborhoods range over every multiset of three of the 32 base subsets. There are binomial(34,3)=5,984 such multisets, representing all neighborhood assignments up to permutation of apex labels. The checker tested every one of the 40,923 minimum covers in these representatives, explicitly re-enumerating every actual triangle from each literal edge list. No failure occurred; minimum margin was zero. Exactly 295 graph representatives have some minimum cover with T3 nonempty (maximum one all-red triangle). No tested cover lost full packing number on deleting T3. This family is genuinely different from the uniform-apex controls. Runtime was 0.35 seconds, without timeout; no broad graph-atlas completeness is claimed.

Files: `checks/hostile_unequal_c5.py`, `evidence/hostile_unequal_c5_apices3.json`. The JSON retains complete literal edge/triangle lists, all optimum-cover parameterizations and a worst cover with exact eligible packing per graph. The larger bounded extensions use `checks/hostile_unequal_cycles.py` and stream a compact full edge-list manifest; their own summaries state actual completed counts and any timeout.

The bounded unequal-cycle extensions all finished without timeouts:

| Base and apices | Graph representatives | All minimum covers tested | Graphs with some T3 | Maximum T3 | Minimum margin | Compute seconds |
|---|---:|---:|---:|---:|---:|---:|
| C5 + 3 | 5,984 | 40,923 | 295 | 1 | 0 | 0.35 |
| C5 + 4 | 52,360 | 441,844 | 3,030 | 1 | 0 | 2.68 |
| C7 + 2 | 8,256 | 60,734 | 287 | 1 | 0 | 0.52 |
| C7 + 3 | 357,760 | 5,006,158 | 22,435 | 2 | 0 | 30.82 |

Total across these four separately parameterized domains: **424,360 graph representatives and 5,549,659 minimum-cover checks**. These are raw domain counts: graphs can be isomorphic across domains, and the statements do not claim globally distinct isomorphism classes. Within each fixed base/apex-number domain, every neighborhood multiset is generated exactly once. An arbitrary ordered tuple of neighborhoods is carried to its sorted tuple by a permutation of apex labels; this graph isomorphism transports every minimum cover and packing. The whole assignment domain is therefore represented, while the stated counts remain orbit-representative counts rather than all labelled tuples.

For every cover in these domains, the eligible packing attained the full triangle packing number. This is an observation in the stated finite domains, not a general preservation theorem. A fresh generic checker independently matched 26 selected literal records across C5r3, C5r4 and C7r2, totaling 615 minimum covers and nine selected graphs with T3 nonempty; 14 C5r3 records also had their complete parameterized cover sets independently expanded and compared. The critic's scope is a sample check, not an independent replay of the entire census. See `evidence/independent_unequal_audit.json`.

Large manifests retain every actual edge list using lossless gzip; raw and compressed SHA-256 hashes are recorded in each summary. The three streamed manifests total about 3.4 MB compressed (about 128 MB before compression). C5r3's separate full graph/triangle/all-cover-parameterization result is about 4.1 MB. No inputs were discarded by compression. The default release driver does
**not** regenerate these streamed hostile manifests or millions of cover checks.
It replays selected small independent controls; the optional ratio recount
reads the retained corpus without optimization. Historical domain regeneration
is a separate optional operation, using the following relative commands only
from a new scratch copy of `problems/TUZA-13` (standard library only):

```sh
python3 checks/hostile_unequal_c5.py --apices 3 --seconds 180
python3 checks/hostile_unequal_cycles.py --cycle 5 --apices 4 --seconds 60
python3 checks/hostile_unequal_cycles.py --cycle 7 --apices 2 --seconds 60
python3 checks/hostile_unequal_cycles.py --cycle 7 --apices 3 --seconds 120
```

These commands overwrite the scratch copy's named outputs. A new timeout or
incomplete prefix remains UNKNOWN and does not redefine the retained completed
domain. The historical original results below are not fresh publication runs.

`hostile_unequal_cycles.py` produces `evidence/hostile_C*_apices*_summary.json`, full actual edge lists in `..._graphs.jsonl.gz`, and literal nearest witnesses in `witnesses/..._nearest.json`. A timeout would be recorded as a pending neighborhood multiset, never counted as a passing graph. None occurred in these runs. The C5r4 elapsed wall time included a 27-second wait for the shared compute lock; its computation itself took 2.68 seconds.

## Failed rooted-gadget branch

A suggested falsifier construction was to use low-slack rooted gadgets H, with root edge e in no minimum cover, and force an all-red central triangle on three such roots without permitting an eligible packing gain. To make the root block a full maximum packing, one would need nu(H-e)=nu(H)-1.

There is a simple obstruction to this particular strengthened request. If e belongs to no minimum triangle cover of H, then tau(H-e)=tau(H). Indeed tau(H-e)<=tau(H), while a cover of H-e of size tau(H)-1, together with e, would give a minimum cover of H containing e. Values smaller by more than one are impossible because adding e always yields a cover of H. Therefore, if tau(H)>=2nu(H)-1 and nu(H-e)=nu(H)-1, then

    tau(H-e)=tau(H)>=2nu(H)-1>2nu(H-e).

Thus H-e would already violate ordinary Tuza. This rules out treating that full-packing-mandatory, low-slack root condition as an easy route around Tuza. It does not rule out a more delicate **cover-dependent eligible-packing** root constraint; that is a different unproved requirement and was not pursued here.

A bounded exact diagnostic checked 3,815 graph edge lists, all with complete minimum-cover enumeration: NetworkX atlas inputs with at least three vertices, K4/K5/K6 with one fresh page on each of one to four chosen distinct clique edges, and the supplied hostile bank restricted to at most twelve vertices, with exact labelled-edge deduplication. It found 862 low-slack root incidences whose edge belongs to no minimum cover, and **zero** whose removal lowers full packing number. The run completed in 1.33 seconds, with no graph/campaign timeout. The script imports the coordinator's exact engine for this branch; this is not an independent solver check and is not counted as a two-red census because it did not evaluate every eligible family. Literal graph lists, root incidences and complete-cover counts are retained in `evidence/hostile_rooted_results.json`; script `checks/hostile_rooted.py` reproduces the domain with a 120-second cap. No proposed counterexample arose.

All subtask computation jobs have terminated. No further broad extensions were launched after the coordinator's stop instruction. Remaining operations are notes and integrity/receipt checks only.
