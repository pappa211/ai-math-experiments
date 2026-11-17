> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Full-packing-extension counterexample — independent verification

**Verdict: the displayed graph, minimum cover C and maximum private packing Q refute D-all and D-some-extension.** The same graph and the same C admit a different maximum private packing extending to a maximum full packing, so D-some-choice is explicitly satisfied on this witness. Unrestricted Tuza and CS are not refuted.

This review reconstructed the graph, optimization reduction and checks from the literal edge list, apex labels, C and Q **before reading any producer algorithm or accepting its tables/optima**. The independent implementation imports no producer or historical optimization code. The final frozen literal input omits all producer optima/tables. Evidence is a retained finite certificate checked by a separate exact enumerator plus ordinary proofs of its reductions; it is not Lean verification.

## Frozen inputs, implementation and receipts

- `evidence/d_extension_literal_input.json`: n, complete literal edges/triangles, four local maps used only to identify the apices, candidate Q and the candidate cover originally labelled `original_spoke_cover`. Its provenance retains the hash of the producer JSON actually inspected.
- `scripts/d_extension_independent_validator.py`: independent validator, identity `TUZA22-independent-D-extension-validator-v2`.
- `evidence/d_extension_independent_verification.json`: all recomputed actual triangles, local conditional tables and witnesses, all256 shared-edge pattern costs, a computed minimum cover, displayed C/Q, private-cover upper certificate, empty residual family, maximum full packing and successful alternative maximum private packing.
- `operations/d_extension_independent_frozen.json` and `.log`: final frozen-input execution. Wall0.119 s; internal mathematical checks0.084 s; sampled tree RSS4.172 MiB under the120 s /2200 MiB guard. Coarse RSS sampling is not an exact OS peak.

The chosen C is the `original_spoke_cover` of size44, not the other displayed minimum cover in the producer data. This distinction is essential because privateness depends on C. The independent optimization proves this original cover is in fact minimum.

## Literal graph and component checks

The validator rebuilds all triangles from52 vertices and216 actual graph edges and finds exactly160 triangles, agreeing with the frozen list. The four distinct apices are12,25,38,51. Every actual triangle contains exactly one of these apices; each apex has16 rim neighbors and40 rim edges, with triangle-free rim. These facts are checked from literal adjacency, not assumed from the name “Clebsch cone.”

The four cone edge sets cover the entire graph. Exactly eight rim edges belong to two pieces; every other graph edge belongs to one piece. Each piece has four shared boundary edges. No edge belongs to three pieces. Every actual triangle belongs to exactly one piece, determined by its apex, so there are no omitted crossing triangles. The full160-triangle family has one shared-edge-connected component, and the intersection of all triangle vertex sets is empty. The graph is therefore genuinely interacting and has no common apex.

## Exact cover optimum: independent reduction

Fix the subset S of the eight shared rim edges selected by a global cover. In a single cone piece, let W be the set of rim vertices whose apex spokes are omitted. The cover uses16-|W| spoke edges. Every rim edge with both endpoints in W is forced into the cover. A shared forced edge must belong to S; all forced nonshared rim edges are paid locally. There are no rim triangles, so these conditions are sufficient as well as necessary.

If B_i is the piece's four boundary edges, its exact nonshared conditional cost is therefore

    h_i(S intersect B_i)
      = min over W with E_i[W] intersect B_i subset S
        [16-|W| + |E_i[W] minus B_i|].

The independent program enumerates **all65,536 subsets W per piece**, computes induced rim-edge and boundary masks by a bit recurrence, and minimizes the resulting exact costs. It then enumerates **all256 global shared-edge subsets S** and computes

    |S| + sum_i h_i(S intersect B_i).

The shared edges are counted once and all nonshared resources are disjoint, so this expression is exactly tau(G). There are no search caps, failed instances or optimizer timeouts in this finite check.

For each piece, ordered by the sorted boundary edges retained in the evidence, the16-entry table is

    [11,11,11,10, 11,11,11,10, 11,11,11,10, 10,10,10,10].

All256 global costs lie between44 and48, and seven shared-edge patterns achieve44. The program reconstructs a44-edge cover from its minimizing W choices and verifies it against all160 actual triangles. It separately verifies the displayed C has44 edges and covers all160 triangles. Thus tau(G)=44 and the displayed C is minimum.

There is also a concise ordinary lower-bound cross-check from the independently verified local table. For every local boundary subset B,

    h_i(B) + |B|/2 >= 11.

Indeed the minimum h-values by |B|=0,1,2,3,4 are11,11,10,10,10. Each selected shared edge appears in exactly two piece boundaries; summing these inequalities yields

    |S| + sum_i h_i(S intersect B_i) >= 44.

The displayed all-spoke C attains44, independently checking the global minimization arithmetic. The local table still rests on the explicit exhaustive16-vertex finite check; this is not mislabeled a symbolic proof for arbitrary cones.

## Maximum private packing and failed extensions

For the fixed displayed C, exactly100 of the actual triangles meet C in exactly one edge. C consists entirely of apex spokes and omits five spokes in each piece, twenty in total. The validator checks that these twenty omitted spokes meet every private triangle. Thus any edge-disjoint private packing has size at most20.

The supplied Q consists of twenty actual private triangles. Its sixty graph edges are all distinct, so Q is a private packing of size20 and therefore is **maximum**, not merely maximal. The validator then deletes all sixty Q edges and rebuilds the residual triangle family: it is empty. Consequently Q itself is a full inclusion-maximal triangle packing, and every full extension of Q equals Q. Its maximum possible extension size is exactly20.

The required inequality fails:

    |C| = 44 > 2|Q| = 40.

Hence this single minimum C and maximum private Q defeats D-all. Since even its maximum extension has size20, it also defeats D-some-extension. These are precisely the universal-over-C,Q variants; no arbitrary greedy packing or nonminimum cover is being substituted.

## Ordinary packing optimum and surviving existential choice

Every actual triangle uses exactly two of the64 distinct apex-spoke edges. Therefore any full packing has size at most32. For each cone, the independent validator constructs a perfect matching on its16 rim vertices avoiding every shared rim edge, by a separate elementary exhaustive matching recursion. The four matchings produce32 actual triangles. They cannot conflict between pieces on a rim edge because shared rim edges were excluded, and their spokes have distinct apices. Their96 graph edges are checked distinct. Hence nu(G)=32.

Thus this graph satisfies Tuza strictly: tau=44<64=2nu. Its failure is confined to the proposed extension rules.

The constructed full packing P_good of size32 contains exactly twenty private triangles for the **same displayed minimum cover C**. Call those Q_good. They form another maximum private packing, because the same twenty-edge private-cover upper bound applies. Q_good extends to P_good, so

    |C|=44 <= 2|P_good|=64.

This positively witnesses D-some-choice on this graph. Globally that variant remains open. The exact diagnosis is that an arbitrary maximum private packing can consume the shared rim resources and block every augmentation; choosing another maximum private packing can avoid that obstruction even without changing C.

## Adversarial scope checks

- Both cover and private-packing optimality are independently established; no producer optimum was used as a lower bound.
- All one-, two- and three-C-edge triangles are retained in the actual family. Private selection occurs only after complete triangle reconstruction.
- Full maximality is checked by the absence of every residual triangle, not absence of a small augmentation.
- The cover DP includes shared-edge costs exactly once and retains every boundary pattern. No disconnected-piece additivity shortcut is used for tau.
- The witness is not a cone, not an independent sum of clique components, and not an unrestricted Tuza counterexample.
- Original H-D, H-D-CS, PK, CS, R1 andR2 receive no refutation from this construction.
- The earlier three-shared-edge cycle with cover42 is a different construction and is not used in this certificate.

Status: **REFUTED auxiliary statements D-all and D-some-extension, supported by retained finite certificate and independent validator; D-some-choice OPEN globally and satisfied on this particular graph.**
