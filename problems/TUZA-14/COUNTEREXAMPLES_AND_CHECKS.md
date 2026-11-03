# TUZA-14 exact auxiliary obstructions and reproduction

**No counterexample to S, E or Tuza was found.** Every refutation below names its precise auxiliary claim. Packings always use graph-edge disjointness, allowing shared vertices. Triangle lists are regenerated from literal graph edges; minimum cover claims are exact, not inclusion-minimality claims.

## A3: forcing a unique witness can reduce the maximum

The graph is the union of K5 on {1,2,3,4,7}, K4 on {0,5,7,8}, and the edges of triangles246,468,478. Its full edge list is

    05,07,08,12,13,14,17,23,24,26,27,34,37,46,47,48,57,58,68,78.

Its complete triangle family is the ten K5 faces, the four K4 faces, and exactly246,468,478. Take C={05,13,24,27,46,47,78}. The sole private witness of red46 is Q=468. Eligible packing five is attained by {478,246,134,237,058}. Any packing containing Q excludes both other outside triangles and has at most2+1+1=4 members. The recorded four-packing attains this bound. Every packing has at most2+1+2=5 members. The disjoint edge supports of K5,K4,Q need respectively4,2,1 cover edges; C attains seven.

Literal witness: `witnesses/track_a_unique_prepacking.json`. Independently regenerated triangles, all rejected smaller-cover checks, packing optima and color classes: `evidence/independent_auxiliary.json`, A3. This refutes maximum-preserving prepacking; four still reaches the half-cover threshold for this example.

## A4: two private witnesses per red edge still do not suffice

Original construction: take an independent set I of six vertices and15 other base vertices indexed by unordered pairs of I. Join each pair-vertex to its two I endpoints. Among pair-vertices, use a triangle-free30-edge subgraph Q of the disjoint-pair graph KG(6,2). The literal Q was found by deleting one edge from each of its15 edge-disjoint triangles, using seeded directed choices (seed140602), stopping at the first witness after36,426 trials in about2.72seconds. This was a targeted test of A4, not a graph census or a search for S failure.

For the resulting21-vertex base H, alpha(H)=6. An independent vertex include/exclude recursion verifies this; a fresh reviewer additionally rejects every one of the116,280 seven-subsets as independent. The original cone has tau15, private packing6 and eligible/full packing10.

Delete pair-vertices6 and7 of that original base, retain all six I vertices, relabel, and cone again. The reduced base has19vertices and alpha6: an induced restriction cannot increase alpha, and retained I attains six. A fresh exhaustive test rejects all50,388 seven-subsets too. The reduced cone has20vertices,67edges,48triangles, tau13, private packing6, eligible/full packing9. Its13 red edges are the spokes to pair-vertices; each has exactly two actual private witnesses. Every private triangle uses one of the six I spokes, bounding private packing by six. Displayed packings attain six and nine. Full packing is base matching, bounded by floor(19/2)=9. Cone cover equals base vertex cover, so tau=19-6=13.

Original and reduced complete edge/cover/packing descriptions: `witnesses/track_a_private_multiplicity_two.json` and `witnesses/track_a_private_multiplicity_two_reduced.json`. Actual triangles, red/blue classes, independent alpha calculations and direct packing checks: `evidence/independent_auxiliary.json`, A4/A4_reduced. The deletion map is literal; no globally smallest-order claim is made. Coordinator proposed construction and reduction; Track A implemented the search and discovery checks.

## B1/B5/B8: cover selection needs its exact hypotheses

* **K7:** every optimum C is the two internal cliques of a3+4partition, size9. The complement has12blue edges; eligible triangles need two each, so k<=6. Explicit six-packings work for all35 partitions, while a seven-packing decomposes K7. Complete proof and literals: independent critic, `independent_auxiliary.json` B1_K7.
* **Star-only optimality:** all edges of K5, red C={01,12,23,34,04}. Each one-star replacement has minimum cost2, but |C|=5, eligible k2, true tau4. Delete reds01,23 and add blue03 to improve globally. This is NOT an optimum-cover counterexample. `evidence/track_b_small.json` B5; independent check B5_star_optimal.
* **Migration cycle:** start K4 on0123, attach two private page tips to each apex edge30,31,32. Exactly three minimum covers are {30,31,32} plus one edge of triangle012. Their one-edge exchanges form a cycle, all with tau=k4 and one all-red triangle. Every maximum packing intersects that all-red triangle; the maximum avoiding it is only one. Hence the example refutes unconditional strict progress, not a free-triangle augmentation statement. Full literals and all covers: `evidence/track_b_small.json` B8; independently checked by the fresh reviewer.

## B9: unique private under one optimum, all-red under another

Reuse the prior TUZA-13 graph with edges

    01,02,03,04,07,08,12,13,14,15,23,25,26,28,36,37,38,45,47,56,68

and complete triangles

    012,013,014,023,028,037,038,047,123,125,145,236,238,256,268,368.

Its minimum cover size is7. D={03,04,12,15,25,28,36} contains Q=125 all-red. The set F={02,07,13,14,26,38} covers every triangle other than Q and misses Q. Consequently C=F union {12} is another optimum, with Q the unique actual private triangle of red12. Deleting E(Q) leaves the four-cover {03,04,28,36}; the extension lower bound is7-3=4. Thus the proposed maximum loss of two is false: the loss is three. C still has eligible packing six, safely above target four.

The discovery check directly rejects all54,264 six-edge full covers and all816 three-edge residual covers. It also records a residual four-packing. Full literals, both colorings and exact witnesses: `evidence/track_b_unique_deletion_refutation.json`; independent certification in `evidence/independent_auxiliary.json`, B9_unique_deletion. This is a new interpretation of an old graph, explicitly attributed to TUZA-13. The earlier fixed-control ledger (129 unique-witness instances, five residual graphs) survives only as historical finite evidence before this refutation.

## Directed tests and commands

The public command below rechecks independent auxiliary witnesses and the exact
exchange-characterization controls, with writers isolated in fresh output copies.
Historical directed discovery domains described afterwards retain their original
scope; the command does not rerun every discovery script. Optional discovery
writers must be run only in a separate scratch copy with public sibling inputs.
From the repository root:

```sh
python3 tools/check_tuza_11_15.py --output ../tuza-11-15-replay
```

`checks/track_a_controls.py` tests the fixed eight-graph/all264-optimum domain; `track_a_threshold_audit.py` repeats only a stored-record comparison. The smaller exchange-characterization domain uses eight designated covers and3,308 red subsets to reconstruct all246 global optima. These domains overlap and must not be added as unique graph counts. `track_a_multiplicity_two.py`, `track_a_freeze_witnesses.py`, and `track_a_reduce_cone.py` reproduce the seeded construction and deterministic witnesses in that order. No broad TUZA-13 census is rerun. Exact per-script scope, timing and outcomes are recorded alongside scripts; no new mission computation timed out.

The main discovery code reuses the authenticated TUZA-13 `checks/core.py` read-only. The structural critic's newly authored independent checker imports no discovery mathematics. The fresh review uses direct finite subset checks after reading existing evidence and does not claim blind code independence. All share the pinned Mac Python runtime. No SAT service, floating-point optimization, installation, remote computation or Lean campaign was used.
