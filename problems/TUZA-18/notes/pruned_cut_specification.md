# Pruned packing-guided cut repair

Exact universal candidate PC: every finite simple graph G has a maximum triangle packing P, cut s, and a set R of selected packed edges such that C(P,s) minus R is still a triangle cover and has size at most 2|P|. C is precisely defined in global_cut_gate.md. Outside-support selected edges cannot be removed. Stronger PC-all asks this for every maximum P. Either assertion implies unrestricted Tuza directly.

The earlier cone obstruction is repaired: use the monochromatic cut, so C=E(P), then delete the rim matching, retaining all spokes. The first decisive test is exhaustive cuts and maximum packings in the standard atlas through seven vertices; a certified PC failure kills the mechanism, while a PC-all failure requires choosing P strategically. Finite survival will not be counted as a global existence argument or justify merely increasing graph order.

The exact tester reconstructs all actual triangles. It holds selected outside-support edges fixed, deletes triangles hit by them, and minimizes the remaining cover among selected packed edges by exhaustive triangle branching. Every maximum packing is enumerated by include/exclude recurrence, using the exact optimum to prune impossible branches. Cuts are enumerated up to complementation. Each graph has a 0.5-second wall limit and incomplete graphs are UNKNOWN. No external solver or floating optimization is used.

After this discriminator the next structural question is whether a minimum compatible cover's outside-support edges impose an inconsistent cut (or an unavoidable cost) for every maximum packing. Without such a proof/obstruction, this route will be marked unresolved rather than advertised as an architecture.
