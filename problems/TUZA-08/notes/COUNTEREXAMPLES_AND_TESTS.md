> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Mechanism tests, exact witnesses and negative controls

All labels are integers; `02` denotes the undirected actual edge {0,2}. Every triangle is generated from the FULL edge list, including outside attachments. None of these graphs is a Tuza counterexample. Exact optima below have independent evidence; sample counts do not prove universal statements.

## W7: exact wedge losses and incompatible cover choices coexist

Vertices 0..6; missing base uv=01; a=2,b=3. The edge list is

```
02 03 05 12 13 16 23 24 25 26 34 35 36 45 46
```

The common neighbors of0 and1 are exactly2,3. Set A={02,12}, B={03,13}. The thirteen triangles are generated in `review/independent_experiments.json` (historical record, not included in this public archive); there are exactly seven minimum covers and six maximum packings.

| Graph | ν | τ |
|---|---:|---:|
| H=W7 | 4 | 5 |
| H−A or H−B | 3 | 3 |
| H−{02,03} or H−{12,13} | 3 | 4 |
| H−{02,13} or H−{12,03} | 4 | 4 |
| G=H+01 | 4 | 6 |

The UNIQUE minimum cover containing A is C_A={02,12,24,35,36}; the unique one containing B is C_B={03,13,25,26,34}. No minimum cover meets both A and B. The other five minimum covers avoid BOTH pairs, so the minimum-cover family does not partition into full-A/full-B covers.

Each pair causes the same exact packing-loss-one and cover-drop-two as an A1 wedge. Both pairs block all maximum packings. Individual feasibility plus joint incompatibility therefore has real instances and is not itself contradictory. This graph fails tightness:5<2·4. More specifically, restored G fails two-edge resilience: deleting {02,03} kills both new uv-pages and leaves ν=3<4. The analogous v-endpoint deletion also fails.

For the sharp new switch theorem, D0=∅ and the exterior sets are X={24,35,36}, Y={25,26,34}. Their distance is r=3. Orientation classes are X_u={35}, X_v={36}, X_0={24}; Y_u={25}, Y_v={26}, Y_0={34}. Exactly two neutral edges occur. A mixed cover of size6 exists, while none of size5 does. Thus the thresholds r≤2 and at most one neutral edge cannot be increased without an extra assumption.

Explicit packing lower certificate: {023,126,245,346}. A packing of5 would use all15 edges, impossible because0 and1 have odd degree3 while a triangle decomposition gives every vertex even degree. Minimum-cover upper certificates are C_A and C_B. Independent exhaustive checking of all edge subsets supplies the lower bound and the full optimum-cover family.

## W8: packing-only exchange is false

Vertices0..7, missing01, common neighbors exactly2,3; edges:

```
02 03 06 07 12 13 14 15 23 24 25 26 27 34 35 36 37 45 47 56 57 67
```

Here (ν,τ)=(6,8); deleting A or B gives(5,7), while EVERY cross pair {f,g}, f∈A,g∈B, gives(6,6). Thus the two within-pair blockers and all four cross-avoidance packing choices can coexist. Neither full pair can be included in a minimum cover, since τ(H−A)+2=9>8. This refutes a blanket packing-exchange shortcut; it does not refute the cover-switch theorem.

`review/independent_blockers.json` (historical record, not included in this public archive) gives explicit packings and covers for all seven variants. Packing upper bounds use the independent parity bound

```
ν(J) ≤ floor((|E(J)| − number_of_odd_degree_vertices(J)/2)/3).
```

Unused edges have the same degree parities as J, so at least half the odd-degree count must remain unused. For H this excludes seven triangles; for each pair residual it gives the needed bound. Cover lower bounds enumerate all subsets of size τ−1; upward closure excludes smaller covers as well.

## Positive control and essential common-neighbor hypothesis

A six-vertex positive control has edges

```
02 03 04 05 12 13 23 25 34
```

Its optima are(3,3), witnessed by packing {025,034,123} and cover {02,04,12}. Minimum covers C_A={02,04,12}, C_B={03,05,13} avoid the opposite pair and have exterior distance1. A mixed minimum cover is {02,04,13}. This exercises the local switch on a real graph.

Dropping “exactly two common neighbors” is FALSE, even at exterior distance1. Take H=K5−01 on0..4. Its optima are(2,3), C_A={02,12,34}, C_B={03,13,24}; no minimum cover meets both selected pairs A,B. The extra common neighbor4 is essential. Restoring01 gives K5, not a counterexample. `SMALL_CONTROLS.json` (historical record, not included in this public archive) records all optimum covers for these controls; the independent local-family check also identifies this failure when the common-neighbor filter is removed.

## Classical controls and the first stronger deletion failure

Independent certificates confirm K4=(1,2), K5=(2,4), K6=(4,6). K4 fails two-edge resilience: deleting an opposite-edge minimum cover destroys all triangles. All25 prescribed one/two-triangle packings in K5 extend to a maximum packing. All175 K5 edge-deletion subsets of sizes1,2,3 satisfy the A1 numerical resilience bound, but the four-edge minimum cover {01,02,12,34} destroys all triangles: loss2 exceeds floor((4−1)/2)=1. Thus small extension/resilience tests are not distinctive enough.

## Exact census domain, samples and targeted repair attempts

`cover_profiles.py` (historical record, not included in this public archive) uses two exact recursions: covering branches over the three edges of an uncovered triangle, and packing branches on including/excluding a triangle with all conflicts removed in the include branch. Both take complete finite triangle families. Domain: fixed01 absent, fixed spokes02,12,03,13, and no other common neighbor of0 and1. Every extra vertex has three possible contacts with{0,1}; all edges among extra vertices and from them to{2,3}, and edge23, are freely enumerated. Counts therefore equal 3^(n−4)·2^[1+2(n−4)+binomial(n−4,2)].

| n | Exhaustively enumerated labeled graphs in this domain | Both full pairs individually minimum-cover feasible | Incompatible among those |
|---|---:|---:|---:|
| 4 | 2 | 0 | 0 |
| 5 | 24 | 0 | 0 |
| 6 | 576 | 8 | 0 |
| 7 | 27,648 | 600 | 6 |

Total28,250. This is exhaustive for the specified labelled missing-edge geometry, not an unrestricted census or a test of hypothetical counterexamples. No graph in these domains had both within-pair packing blockers AND all four cross deletions preserving ν. The latter observation is disproved as a universal claim by W8.

`sample_blockers.py` (historical record, not included in this public archive) then tested exactly3,000 seeded graphs at each of n=8,9,10 (seed8082026), with precisely documented contact/density generation. These9,000 cases are samples, NOT exhaustive. They contained respectively5,1,6 examples of the W8 packing pattern and0,3,1 cover-incompatibility examples. No universal claim follows from the other counts.

`repair_control.py` (historical record, not included in this public archive) tested exactly576 specified one-vertex/old-edge extensions of W7: optional04 or14 or neither; optional56; a new vertex7 contacting at most one of0,1 and any subset of2..6. Sixteen retain exact wedge losses and cover incompatibility, but none repairs all four cross-packing deletions. This failed repair search does not prove repair impossible. No broad or unbounded sweep was run.

The local proof author also enumerated7,336 valid small triangle-subfamily configurations for the distance-one switch and1,068 feasible endpoint assignments for the oriented distance-two switch. These are safe local overapproximations, not counts of all graphs. The reviewer independently regenerated and validated all7,336 distance-one certificates. The final arbitrary-distance theorem has an ordinary proof; these bounded checks are supporting evidence, not proof of the unbounded claim.

## Independent validation and failure transparency

A separate internal AI reviewer wrote independent subset/parity validators without importing the discovery recursion. Across the W7 cases it enumerated157,296 edge subsets and46,373 triangle subsets; across W8 variants and named clique controls it checked313,209 cover subsets at the critical lower-bound size, with explicit packing/parity certificates. See `review/EXPERIMENT_VALIDATION.md` (historical record, not included in this public archive) for exact scopes.

An extra assertion that every W7 minimum cover belonged to the full-A/full-B classes failed. This was an incorrect proposed partition, not an optimum-solver failure. It was removed, the five counterexample covers were preserved, and `review/independent_initial_failure.json` (historical record, not included in this public archive) records the failure. Initial unfiltered local switch testing also retained failures with extra common neighbors; those motivated retaining the essential exact-neighborhood hypothesis. No failed run was relabelled PASS.

## Public reproduction and historical scope

The experiment counts above describe the preserved discovery run. Its full enumeration and sampling scripts are not distributed in this curated public archive, and those historical sweeps are not claimed freshly reproduced here. The unusable machine-specific command block has been omitted.

From the public repository root, run the independent fixed-example checker:

```bash
python3 tools/check_tuza_examples.py --output /tmp/tuza-examples.json
```

This standard-library checker tests the explicitly named examples and finite domains stated in its JSON receipt. It does not rerun the historical graph sweeps or prove an unrestricted statement. The retained [sampled blocker certificates](../certificates/SAMPLED_BLOCKERS.json) are historical supporting data. Other discovery outputs named above are identified as historical records outside this public archive.
