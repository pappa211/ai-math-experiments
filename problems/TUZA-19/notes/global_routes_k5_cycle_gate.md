# K5-incidence canonical cycle closure: precise gate remains open

Status: bounded structural pass frozen without an all-size closure theorem or counterexample. Two fixed positive controls are retained. No expanded incidence census, generic Eulerian assertion, or H-O2 envelope is claimed.

## Exact proposed statements and why they matter

Let H be a union of literal K5 blocks, distinct blocks meeting in at most one vertex, with every actual H-triangle owned by a block. For U subset V(H), let m(U) be the maximum number of selected rim edges F avoiding U, admitting a proper two-edge-coloring, such that every block's selected edges are contained in some C4 of that block. Equivalently, each block has at least one vertex unused by its selected local edges. This is the resource definition in notes/global_routes_two_apex_k5_states.md; vertices in U remain available to old rim-triangle packings.

The proposed strong cycle-closure gate is:

    For EVERY such H, SOME maximum canonical F has only even-cycle
    components and isolated vertices, with no nontrivial path component.

The weaker sufficient gate is:

    Either m(empty)=|V(H)|, or SOME maximum canonical F has an isolated vertex.

The strong gate implies the weaker one. Both remain unproved in this pass. They are not being asserted merely because H is Eulerian; an unconstrained odd cycle is already a counterexample to that generic Eulerian implication. The K5 state constraint is essential to any proposed argument.

The previously proved identity for J=K2 join H, with apex edge ab and b_H blocks, is

    nu(J)=2b_H+m(empty)+epsilon,

where epsilon=1 exactly when a maximum canonical F can isolate a rim vertex. If epsilon=1, deleting ab lowers nu by1. If m(empty)=n, every maximum canonical F is a spanning union of even cycles, epsilon=0, and nu(J)=2b_H+n; deleting one cross edge leaves at most2n-1 cross edges and therefore at most n-1 non-rim packed triangles, again lowering nu. Thus the weaker gate would show that NO graph in this proposed K2/K5-incidence envelope family is two-edge packing resilient.

This would close one precise H-O2 counterconstruction family. It would not prove Tuza, classify all resilient graphs, or provide an unrestricted availability theorem.

## One tempting inference that is not valid

The condition epsilon=0 says m({v})<=m(empty)-1 for every v. It does NOT itself contradict two-spoke resilience: after deleting av and bv, a packing may use abw for a different w. Canonicalization gives the exact profile

    nu(J-{av,bv})
      =2b_H+max(m({v}), 1+max_(w!=v) m({v,w})).

The old2b_H baseline is unaffected because no rim edge has been deleted. Therefore, if epsilon=0 and J were resilient, for every v some w!=v would need m({v,w})=m(empty)-1. This is a necessary simultaneous-state condition, not a contradiction or sufficiency proof.

Similarly, deleting ab and av requires a maximum canonical colored F with the a-color absent at v. Under epsilon=0, that v must be an endpoint in some maximum F. These conditions retain the global exchange problem; no claim of resolving it is made.

## Targeted actual-graph controls

For a connected triangle-free cubic graph B, add two fresh leaf edges at every B-vertex, and take the line graph H of the augmented root. Each original B-vertex now gives a K5 block. Shared rim vertices correspond to original B-edges; private rim vertices correspond to the leaf edges. Two blocks intersect in at most one vertex. Since B is triangle-free and leaves create no triangles, every actual H-triangle lies in one star-clique. The literal checker verifies this ownership directly for the retained controls, without importing a line-graph characterization.

Only two mechanism-driven controls were used:

1. B=K_(3,3), testing an initial cyclic-incidence obstruction. H has21 vertices,60 edges and60 actual triangles in six K5 blocks. A canonical20-edge state is the disjoint union of cycles of lengths12,4,4 and one isolated private vertex.
2. B=Petersen, testing whether the root's odd-cycle transition obstruction defeats cycle closure. H has35 vertices,100 edges and100 actual triangles in ten K5 blocks. A canonical34-edge state is the disjoint union of cycles of lengths14,4,4,4,4,4 and one isolated private vertex.

The root edge lists, all H edges and actual triangles, block membership, two-edge-colorings, components and isolated vertices are retained in evidence/global_routes/k5_cycle_controls.json. The exact optimality upper bound is elementary in both cases: a two-edge-colorable graph on odd n has at most n-1 edges, since n edges would force a spanning union of even cycles. The displayed states attain that bound. Thus m=20 and34 respectively; neither is a counterexample to either gate.

Discovery used only positive local SAT calls with the already retained CNF interface. For K_(3,3), the all-state, isolated-shared, isolated-private and cycle-only20-edge requests were all SAT; the cycle-only witness makes the first three unnecessary for the mathematical conclusion. For Petersen, the single34-edge cycle-only request was SAT in about0.20seconds. No UNSAT inference is used. The standalone checker checks literal witnesses and all actual triangles, imports no producer optimization code, and proves the needed finite conclusions without rerunning a solver:

    source LOCAL_ENVIRONMENT
    python3 checks/global_routes_k5_cycle_controls.py

Its output is PASS for both controls. No larger root or parameter census follows.

## Why the attempted exchange has not closed

The natural operation is to close an even-length path by routing its endpoints through a third vertex in the K5 containing their missing edge. This adds two edges. Freeing that third vertex costs at most two selected edges, so a naive attachment that tries to protect that vertex cannot force a strict value loss just by degree capacity. However, removing its old incident edges can open an even cycle elsewhere into a new path. The operation transfers the path defect rather than proving that the process ends with an isolated vertex or only cycles.

Simple cut-vertex compositions and the two tested incidence roots allow the defect to concentrate, but no invariant was found that forces this for arbitrary multiple block incidences. The remaining step would need a valid global alternating-path or blossom argument preserving the unused-vertex constraint in EVERY visited K5. No such argument is supplied here. Rephrasing the objective as two ordinary matchings does not remove that coupling.

A bounded primary-literature check read Mkrtchyan–Vardanyan, arXiv1107.4879v1, *On spanning maximum k-edge-colorable subgraphs*, Theorem4 and Corollary1, with the current v3 abstract/version metadata also inspected. Primary links: https://arxiv.org/pdf/1107.4879v1 and https://arxiv.org/abs/1107.4879 . Those results concern existence of a maximum two-edge-colorable subgraph with no isolated vertices under matching or claw-free hypotheses. They neither enforce the local K5/C4 constraint nor replace paths by even cycles. Their desired spanning conclusion is also different from the isolated-vertex alternative needed here. No theorem from that source is imported into this gate.

## Decision and retained unknown

The two decisive structural controls survive, but finite survival supplies no all-size evidence theorem. The strong cycle-only gate and the weaker isolated-vertex gate both remain OPEN. Consequently the K2 join of an arbitrary triangle-local K5 rim has not been proved nonresilient, and no resilient example or H-O2 counterexample has been found.

Freeze this pass at the exact missing global exchange rather than enlarging the census. All computations were local on Darwin. There were no long-running jobs, UNSAT optimum claims, or Lean processes. Original cutoff09:23:58Z and hard deadline09:53:58Z on2026-11-15 remain unchanged.
