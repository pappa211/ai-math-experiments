# Exact formal theorem and definitions

The proved target is `CombinedStatement G` for every finite vertex type and every finite simple graph `G`. [FiveDegenerate.lean](lean/Tuza06/FiveDegenerate.lean) proves it by `five_degenerate_statement`, and expands its conclusion in `five_degenerate_combined`:

```lean
@Tuza06.five_degenerate_combined :
  ∀ {V : Type u_1} [Fintype V] [DecidableEq V] {G : SimpleGraph V},
    Tuza06.Degenerate G 5 →
      Tuza.tau (Tuza.triangles G) ≤ 2 * Tuza.nu (Tuza.triangles G) ∧
      (Tuza.tau (Tuza.triangles G) = 2 * Tuza.nu (Tuza.triangles G) ↔
        Tuza06.ComponentCliques G)
```

The only substantive hypothesis is five-degeneracy. There is no bound on graph order or maximum degree; no planarity, coloring, maximum-average-degree, local classification, residual equality or outside-page premise remains. `Fintype` and `DecidableEq` provide the finite representation. The main theorem has no additional unproved external mathematical input. Any unrelated conditional interfaces in reused foundations are not its premises.

The exact [definition source](lean/Tuza06/Statement.lean) is preserved byte for byte. It was frozen before implementation; its comments describing an unproved target or separate equivalence obligation are **historical**, superseded by the completed theorem and [final verification status](PROOF_STATUS.md).

- `triangles G` is the full `G.cliqueFinset 3`. `nu` maximizes cardinality over edge-disjoint triangle subfamilies. `tau` is minimum edge-cover cardinality for those triangles; `Tuza.graph_min_cover` proves attainment with actual graph edges. Nonedges and arbitrary unused sets in the ambient cover type cannot lower the graph-edge optimum.
- `Degenerate G d` says every nonempty vertex subset contains a vertex with at most `d` neighbors inside it. This is the usual induced-subgraph formulation, equivalent to the every-nonempty-subgraph definition because edge deletion cannot increase degree. `degenerate_mono` proves edge-deletion monotonicity. This condition places no bound on original maximum degree and is distinct from maximum average degree below seven.
- `TriangleAdjacent`, `TriangleConnected` and `triangleComponent` use full graph triangles and connectivity through a shared **graph edge**, with reflexive transitive closure. These components differ from ordinary connected components.
- `ComponentCliques G` says that for every graph triangle, the entire edge support of its triangle component is exactly the two-element-subset edge set of a four- or five-vertex set. It is a statement about **literal component supports**, not a supplied decomposition.
- `CliqueDecomposition G K` describes a finite family of actual four/five-vertex cliques, pairwise edge-disjoint, containing every graph triangle. Blocks may share vertices. `componentCliques_iff_decomposition` proves equivalence with the literal component condition; [Components.lean](lean/Tuza06/Components.lean) proves that each component is the full clique triangle family and a shared-edge path cannot leave its block.

`componentCliques_equality` proves the equality converse for arbitrary finite simple graphs. `five_degenerate_equality_decomposition` exposes the equivalent block characterization under five-degeneracy. Empty and triangle-free graphs are included: the component condition is vacuous and both extrema are zero. Triangle-free background edges and isolated vertices are unconstrained.

The [complete ordinary paper](../../papers/tuza-five-degenerate/main.md) gives definitions, full proofs and a declaration coverage table. [Printed theorem types and transitive axioms](reproduction/publication-evidence/MAIN_THEOREM_TYPES.log) and [portable reproduction](REPRODUCTION.md) state the exact verification boundary. The successful main theorem uses only `propext`, `Classical.choice` and `Quot.sound`; this is standard Lean kernel checking with pinned compiled dependencies, not a cold Mathlib rebuild or a separate kernel implementation.
