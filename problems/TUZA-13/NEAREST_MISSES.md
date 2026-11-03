# Exact near misses and failed auxiliary claims

**Central status: SURVIVED_TESTED_DOMAIN.** Margin means eligible packing minus ceil(tau/2). No row is a central counterexample. All graph edges, complete triangles, specified optimum covers and actual packing witnesses are in the linked JSON records.

| Graph | Vertices | tau | Full nu | Eligible nu | Margin | Optimum-cover scope |
|---|---:|---:|---:|---:|---:|---|
| K4 | 4 | 2 | 1 | 1 | 0 | all 3 |
| K5 | 5 | 4 | 2 | 2 | 0 | all 10 |
| C5 cone | 6 | 3 | 2 | 2 | 0 | all 10 |
| Triangle of K4 blocks | 9 | 6 | 4 | 3 | 0 | all 19; displayed cover attains minimum eligible value |
| Second normalized tight example | 9 | 7 | 5 | 4 | 0 | all 36; displayed cover attains minimum eligible value |
| Third normalized tight example | 10 | 9 | 6 | 5 | 0 | all 126; displayed cover attains minimum eligible value |
| K7 | 7 | 9 | 7 | 6 | 1 | all 35 |
| TUZA-12 restoration graph | 8 | 5 | 4 | 4 | 1 | all 10 |
| Clebsch cone | 17 | 11 | 8 | 8 | 2 | all 16 |
| Auxiliary cover-drop witness | 9 | 7 | 6 | 6 | 2 | one specified optimum independently certified |

The first three and K7/restoration controls appear in `evidence/independent_controls.json` and `witnesses/hostile_C5_cone.json`. The three normalized tight examples are `witnesses/independent_nearest_9_normalized.json`, `independent_nearest_3_normalized.json`, and `independent_nearest_0_normalized.json`, with independently recomputed full certificates in `evidence/independent_normalized_nearest_*.json`. Original graph lists, isolated-vertex deletions, label maps and original hashes are retained. These are bounded simplifications, not claims of global smallest order.

## A short proof of the cleanest tight example

In the normalized nine-vertex graph the K4 supports are {0,1,7,8}, {0,2,3,6}, and {2,4,5,8}. They are edge-disjoint and meet pairwise at 0,2,8. The only triangle outside their twelve faces is 028. Take

    C={02,08,17,28,36,45}.

Each K4 needs two covering edges, so tau>=6; the displayed C covers all triangles, so tau=6. Triangle 028 is all-red. Each remaining triangle lies in one K4, and two faces of a K4 share an edge. Thus eligible nu<=3, and one face per block attains three. The four triangles {028,178,236,458} are pairwise edge-disjoint. There are only three block contributions plus the single cross triangle, so full nu=4. All-red triangles can therefore be essential for the unrestricted maximum even at an otherwise tight half-cover certificate; they are not essential to reach its threshold three.

## Two-red triangles really are needed in a control

For every checked Clebsch-cone optimum, the private-only maximum is five, below the threshold six, while the eligible maximum is eight. `witnesses/clebsch_two_red_required.json` supplies one literal optimum and a six-triangle qualifying packing with red counts [1,2,2,1,1,1]. A qualifying packing must contain a two-red triangle because five is the exact private-only maximum. All sixteen optimum covers were enumerated through all 65,536 base-vertex subsets. The independent generic checker also certified a displayed cover. This repairs the old private-only failure; it does not approach a central falsification as closely as the margin-zero examples.

## Two tempting auxiliary lemmas failed

1. **Cover preservation after discarding all-red triangles is false.** The nine-vertex witness in `witnesses/theory_tau_drop.json` has tau(G)=7 but both covering and packing numbers of its eligible family are six. The independently checked forcing proof is in `notes/STRUCTURAL_ATTACK.md`; all 54,264 six-edge candidate full covers were separately rejected. The central target is only four. All 64 K4-bud attachments of this witness passed for all 4,864 minimum covers; the smallest resulting margin was one.
2. **Every maximal eligible packing already reaches the threshold is false.** The six-vertex graph in `witnesses/theory_maximal_packing.json` has minimum cover size three, an inclusion-maximal eligible packing of size one, and a maximum packing of size three. A repair mechanism must allow exchanges of previously packed triangles.

No all-red triangle was necessary at the half-cover threshold in any completed exact domain. This is a finite observation; the untested graphs and timed-out jobs remain outside it.
