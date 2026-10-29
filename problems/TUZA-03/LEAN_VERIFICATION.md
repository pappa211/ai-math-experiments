# Lean verification

## Actual checked boundary

| Result | Completed Lean declaration | Explicit external inputs |
|---|---|---|
| Full exact-equality restoration, including bowties | `Tuza.two_triangle_exact_equality` | `HNSInput` |
| Full essential-edge restoration, no slack premise | `Tuza.two_triangle_essential_edge_restoration` | `AharoniInput`, `HNSInput` |
| Stronger individual-family cover saving in the critical branch | `Tuza.two_triangle_essential_family_saving` | `AharoniInput`, `HNSInput` |
| Closed-boundary equality deletion, arbitrary A | `Tuza.closed_boundary_equality_deletion` | `AharoniInput`, `HNSInput`, `BipartiteKonigInput (Finset V)` |
| Stable boundary packing loss at most floor(|A|/2) | `Tuza.closed_boundary_packing_loss` | Same as equality deletion |
| General companion stability criterion | `Tuza.closed_boundary_stability` | `AharoniInput`, `HNSInput` |

`AharoniInput` states the tripartite full-graph triangle bound tau<=2nu. The frozen `HNSInput` states that a tripartite equality graph has nu edge-disjoint actual K4s; this interface includes the published home-base extraction and the ordinary graphical loose-cycle conversion inherited from TUZA-01. Those deep inputs and the conversion inside that frozen interface remain assumed in Lean. New equality exhaustion, face compatibility, mixed-family covers, Hall classification, free-page and apex arguments are proved.

`BipartiteKonigInput` is classical finite bipartite matching/vertex-cover equality, stated using an edge family of pairs between two disjoint vertex sides. It contains no triangle, boundary, or restoration conclusion. The conversion of the full lost triangle family to spoke pairs, injectivity, matching-to-triangle-packing compatibility including shared rim edges, and cover conversion are all proved in Lean.

All these declarations quantify over an actual finite `SimpleGraph V` and use `triangles G = G.cliqueFinset 3`. The extremal functions are actual packing/cover optima. The only transitive axioms reported are drawn from `propext`, `Classical.choice`, and `Quot.sound`. These axiom reports do not discharge the explicit published-input parameters.

Flat restoration, the mixed/shared-apex exact-two-apex bowtie theorem, compression, and the separate stable-four-spoke application are **not Lean-formalized** here. Their ordinary proof statuses are recorded separately. There is no Lean theorem for unrestricted restoration, OCT-five, or fixed c<3 density extension.

## Files and implementation

- `lean/Tuza/BowtieEquality.lean`: full exact-equality theorem and mixed-bowtie family cover. Uses `TwoTriangle.lean` and `IntersectingStructure.lean`.
- `lean/Tuza/Equality.lean`: new graphical K4 exhaustion; no opaque exhaustion premise.
- `lean/Tuza/EssentialRestoration.lean`: full essential-edge theorem and critical individual-family saving. Uses `Essential.lean`, `EssentialPages.lean`, and `EssentialFourPages.lean` for free-page geometry, finite Hall, and compatible pages.
- `lean/Tuza/Boundary.lean`: exact graph edge deletion, ClosedBoundary, simultaneous compatible faces, general stability criterion.
- `lean/Tuza/BoundaryIntegral.lean`: narrow classical König input, proved lost-family conversion, full equality deletion and floor loss.
- Frozen TUZA-01 source is unchanged in the original and in its snapshot; its original one-triangle/OCT-four declarations were rebuilt too.

The slack-one equation is represented as tau+1=2nu, and a packing drop of d as nu(K)+d=nu(H), to avoid truncated-natural subtraction. D2 has no slack-one premise on H. Both original U/P independence assumptions and the uniqueness restriction only at actual P-to-outside edges are retained. The full lost family includes triangles using the later deleted edge. A and B allow arbitrary edge-disjoint triangles, including a shared vertex; no no-mixed premise is imposed.

## Exact environment and commands

Lean 4.33.1, compiler commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`; Mathlib revision `0df444a360eaa60ab8c11dca51a86af692955474`. The toolchain and complete Lake manifest are byte-identical to frozen public TUZA-01. All nine dependency revisions match, with clean tracked sources.

Executed from the mission workspace, with Lean/Lake on PATH:

```sh
python3 scripts/reproduce_lean.py --source lean --output clean-reproduction-final --packages <dependency-cache> --kernel-replay
```

The command was serialized with the mission compute lock and a 1200-second outer timeout. The script creates a new project, copies sources and pins, and symlinks the existing dependency packages. Each project module is built as `lake env lean -j 1 -o <output.olean> <source.lean>`, followed by a generated declaration/axiom audit. Each module containing declarations is separately replayed with `lake env leanchecker -v <module>`; the imports-only `Tuza` prefix is skipped to avoid concurrent replay of all descendants.

This is a fresh project-source reproduction using existing pinned compiled dependencies. It is **not** a cold Mathlib rebuild. Leanchecker replays declarations through Lean's own kernel against imported dependencies; it is not an external independent prover and does not rebuild/replay all Mathlib from an empty environment.

## Executed evidence

Final full reproduction: **PASS**, completed 2026-10-29T09:54:21.479749+00:00. 152 project theorem declarations have complete printed type and transitive-axiom reports. All recorded commands exited zero; module-by-module serial kernel replay completed. Counts describe audit coverage, not mathematical significance.


- `clean-reproduction-final/reproduction-output/verification.json`: exact commands, outcomes, dependency revisions, source hashes, build order, per-theorem axiom sets.
- `clean-reproduction-final/reproduction-output/declarations-and-axioms.txt`: raw compiler output, including explicit input definitions and theorem types.
- `clean-reproduction-final/reproduction-output/build.log`: complete successful build/replay log.
- `audit/LEAN_STATEMENT_FIDELITY.md`: reviewer independent of the proof implementers; exact reviewed hashes.
- `audit/INDEPENDENT_REPRODUCTION.md`: separate A+D clean reproduction and independent evidence review.
- `audit/RESTORATION_FORMALIZATION.md` and `audit/ESSENTIAL_RESTORATION_FORMALIZATION.md`: detailed A/B implementation maps.
- `provenance/FINAL_SOURCE_INTEGRITY.json`: original/snapshot preservation checks.

The first independent A+D script run compiled successfully but stopped in the axiom parser because `pp.universes` printed universe suffixes on standard axiom names. Its evidence is retained. The parser was corrected to remove only display universe suffixes while preserving raw output, and a new clean A+D run passed. No theorem or input was weakened to fix that validation issue. Earlier unsuccessful Lean elaboration attempts remain in private development logs; only fully compiled sources and successful reproduction evidence are staged for publication.

Source scans reject proof placeholders, custom axiom declarations, unsafe declarations, and native-decision shortcuts. Every transitive axiom report is checked against the exact standard allowlist. Source-level and semantic statement audits complement these checks.

## Remaining formalization

C, E, and F have complete audited ordinary proofs but no formal theorem here. Formalizing them would require the full HKT-based flat/wheel argument; the mixed bowtie case system and C9/SPGT bridge; and the graph compression construction with simultaneous optimum preservation, respectively. These are optional further formalization tasks, not missing assumptions hidden in the completed A/B/D declarations. The supplied frozen deep theorem inputs remain undischarged, as explicitly permitted for this mission.
