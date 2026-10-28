# Conditional Lean project

The seven `Tuza/*.lean` modules and `Tuza.lean` preserve the Validation V1 source exactly. Compiler: Lean **4.33.1**, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`. Mathlib: `0df444a360eaa60ab8c11dca51a86af692955474` (v4.33.1). All nine dependencies are pinned in `lake-manifest.json`.

From this directory, after installing the pinned toolchain:

```sh
lake exe cache get
./build.sh
./check.sh Tuza.lean
```

`build.sh` runs the portable Python verifier. It checks the compiler, every dependency revision and tracked source state, and prohibited proof tokens; compiles project modules sequentially with one Lean worker per invocation and a 120-second timeout; and checks eight transitive axiom reports. It writes only ignored outputs. It needs Python 3, Git, Bash, Lake/Lean and pinned dependency sources/compiled imports. `check.sh` delegates to `lake env lean -j 1`, without server paths or GNU `timeout`.

The exact conditional declarations are `Tuza.triangle_deletion` and `Tuza.oct_four`. Their external hypotheses are:

- `AharoniInput`: every graph over the given finite vertex type whose triangle hypergraph is 3-partite has `tau ≤ 2 * nu`.
- `HNSInput`: every such graph with `tau = 2 * nu` has `nu` pairwise edge-disjoint four-cliques. This is the graphical HNS consequence; the [manuscript](../manuscript/README.md) derives it from Theorem 1.1, Definitions 7.1–7.4 and Proposition 7.5 of the 18 March 2018 author manuscript, including the loose-cycle conversion.

These are theorem parameters, not declared axioms. A report containing only `propext`, `Classical.choice`, and `Quot.sound` does not supply those parameters. Aharoni/HNS and the density argument are not formalized. The [complete reproduction guide](../reproduction/README.md) gives the actual executed environment and limits.
