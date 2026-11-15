# Stable slack-one core: a failed small-core candidate and an exact attachment

The independently checkable candidate SMALL-CORE was frozen in B_INITIAL.md before testing: every rainbow-triangle-edge-3-colourable J with tau(J)=2nu(J)-1, all-edge packing stability nu(J-e)=nu(J), and one nonempty shared-edge triangle component has nu(J)<=2. This is **REFUTED**. It is not AC and does not refute a genuine critical-counterexample claim.

## Exact K4 attachment transfer

Let J be any finite simple graph, e=uv an actual J edge, and add two fresh vertices a,b with exactly the five new edges ua,ub,va,vb,ab, so {u,v,a,b} induces a K4. Call the result J'. Every new triangle is one of the four faces of this K4; there are no other new triangles, since each new vertex's old neighbors are exactly u,v.

**Packing.** nu(J')=nu(J)+1. A packing contains at most one new K4 face (any two faces share an edge), and at most nu(J) old triangles. Conversely any J packing appends the new face uab, which avoids the sole old K4 edge e. This equality does not require packing stability.

**Cover states.** Let t_+(e) and t_-(e) be the least sizes of J triangle covers respectively containing and avoiding e. Then

    tau(J')=min(t_+(e)+1, t_-(e)+2).

If a cover includes e, it restricts to an old cover containing e and needs at least one private K4 edge; adding ab realizes the one-edge supplement. If it avoids e, the four K4 faces need at least two of the private edges, and either opposite pair {ua,vb} or {ub,va} achieves this. Restricting to old edges proves the matching lower bounds. These alternatives exhaust all covers; no minimum-cover exchange assumption is used.

In particular, if e belongs to NO minimum J cover, then t_-(e)=tau(J) and t_+(e)=tau(J)+1: the latter lower bound is by the hypothesis and integrality, and the upper bound adds e to a minimum cover. Thus

    tau(J')=tau(J)+2,  D(J')=D(J).

**Packing-edge stability.** If J is packing-edge-stable, so is J'. For an old deleted edge f, take a maximum J-f packing and append a new K4 face avoiding e; this still works when f=e. For a private deleted edge f, take a maximum J packing avoiding e, available by stability, and append any surviving face of K4-f. Such a face exists. The packing has nu(J)+1 triangles; the equality above gives optimality. Therefore every edge deletion preserves nu(J').

**Colour and connectivity.** A rainbow triangle edge-colouring extends: color ab as e, and assign the other two colors to the two opposite spoke pairs. All four K4 triangles are rainbow and old triangles are unchanged. If J has one nonempty shared-edge triangle component and e belongs to an old triangle, the new faces join it through e, so J' remains triangle-connected. These are actual graph-triangle assertions, not abstract hypergraph arithmetic.

## Eight-vertex counterexample to SMALL-CORE

Start with K4 blocks on {0,1,2,3} and {0,1,4,5}, sharing edge01. All eight actual triangles are the two K4 face families. Its packing number is2: one triangle per block is an upper bound and triangles023,145 attain it. Every edge is avoided by a maximum packing: choose a face avoiding it in its own block and a face avoiding the shared edge01 in the other block. Its minimum cover is uniquely

    {01,23,45}.

Each K4 needs two cover edges; a size-three cover must reuse the sole shared edge01, and then must choose the opposite edge of each block. Hence tau=3 and edge02 is in no minimum cover.

Attach a fresh K4 along02, using new vertices6,7. The complete edge list is

    01,02,03,04,05,06,07,12,13,14,15,23,26,27,45,67.

The full triangle family is exactly the faces of the three displayed K4 blocks:

    {0,1,2,3}, {0,1,4,5}, {0,2,6,7}.

The transfer proves nu=3, tau=5, all-edge packing stability, rainbow triangle edge-colourability, and one nonempty shared-edge triangle component. Therefore SMALL-CORE is false at its literal scope. Every one of these hypotheses is independently checkable and does not include a Tuza violation. The graph itself satisfies Tuza strictly.

## Iteration limit, explicitly not an unbounded claim

Exact minimum-cover enumeration gives seven minimum covers of the eight-vertex graph; edge03 is its sole edge excluded from every minimum cover. A second attachment along03 gives a ten-vertex graph with nu=4, tau=7,33 minimum covers and the same stability/connectivity/colourability. However every edge of that ten-vertex graph lies in SOME minimum cover. The proposed forbidden-edge iteration therefore stops on this branch. No unbounded stable slack-one connected family is proved by this experiment, and no patched bound nu<=4 is promoted as a theorem.

The exact evidence is `evidence/b_core_glue.json`: complete edges/triangles/colorings, every minimum cover, and a maximum packing avoiding each edge at all three stages. `checks/b_core_glue.py` reconstructs actual triangles, computes exact integer optima, and separately enumerates all cover subsets of the claimed optimum cardinality to check the complete minimum-cover lists. The ordinary transfer proof supplies the lower bound on cover optima and the upper bound on packing optima. Root's wall/RSS watchdog bounded the0.21second replay by20seconds/512MiB.

The earlier targeted crossedge-attachment batch completed2304 graphs with no timeouts and found no connected stable slack-one graph in that particular family. Those passing probes did not support SMALL-CORE; the subsequent explicit edge-gluing witness refutes it. Both runs are preserved. No heavy job remains from this scout.

## Meaning for AC and unrestricted Tuza

A first-frontier AC analysis can produce a packing-edge-stable slack-one remainder J=H-M. The example shows that one cannot simply replace that case by a two-packing core. The exact attachment could serve as a state-aware simplification only after proving compatible cover/packing transfer in the surrounding apex instance; the scalar identities above do not give that transfer automatically. Its global availability is also unproved.

Status: attachment lemma PROVED_ORDINARY; SMALL-CORE REFUTED by an exact graph witness; finite lists FINITE_CHECKED; historical originality UNESTABLISHED; unbounded iteration NOT_ESTABLISHED; independent_final_verification NOT_RUN; Lean NOT_RUN.
