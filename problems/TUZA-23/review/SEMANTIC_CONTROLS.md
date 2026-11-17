> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Semantic controls — exact scopes

The accepted control entry is `Tuza23.Controls`. It imports three small source modules to stay under the unchanged 2,200 MiB process-tree RSS ceiling. These are fixed witness checks, not a new graph census, and do not replace the all-size R2 proof.

| Declaration | What is established |
|---|---|
| `triangles_complete` | Actual triangles of a complete graph are exactly all vertex triples, for arbitrary finite vertex type. |
| `k4_actual_parameters`, `k5_actual_parameters` | Exact packing/cover parameters for actual complete graphs, through the checked arbitrary-label clique transport. |
| `empty_vertex_cs` | CS holds for the graph on the empty vertex type; no nonempty-type convention is hidden. |
| `shared_vertex_actual_triangles`, `shared_vertex_packing`, `shared_vertex_witness` | A literal five-vertex graph has exactly triangles 012 and 034, and both form an accepted packing despite their shared vertex 0. |
| `shared_edge_packing_rejected` | Triangles 012 and 013 in actual K4 cannot be a packing because they share edge 01. This is an accepted negation theorem. |
| `empty_cover_rejected` | The empty edge family fails to cover actual K4. This is an accepted negation theorem, not a failed assertion. |
| `shared_blocks_actual_triangles`, `shared_blocks_decomposition`, `shared_blocks_B`, `shared_blocks_vertex_overlap` | Two actual K4s on 0123 and 0456 share exactly vertex 0, include every actual triangle in their exhaustive decomposition, and satisfy B. The finite actual-triangle check ranges over the 128 vertex subsets of this one seven-vertex graph, not graph families. |
| `cycle4_triangle_free`, `cycle4_B` | The old four-cycle has background edges and no triangles, with B vacuous. |
| `disjoint_insertion_is_k4`, `disjoint_insertion_R2` | Inserting the two absent diagonals produces actual K4 and satisfies the exact R2 application with checked nonedge/cardinality/tightness hypotheses. |
| `old_star_triangle_free`, `adjacent_actual_triangles`, `adjacent_insertion_strict` | An old three-edge star plus adjacent nonedges 01,02 has exactly triangles 013 and 023. Their common old edge covers both, and the result is strictly below equality. |
| `exact_r2_type` | The exported theorem is assignable at the specified all-size type: Nonedges, at most two inserted edges, old B and augmented tightness, concluding augmented B. |

The separately excluded `exploratory/control_guard_missing_B.lean` deliberately tries to pass tightness where the old-B hypothesis is required. The compiler returned exit 1 with that exact type mismatch. `operations/control_guard_acceptance.json` records the checked diagnostic. This is an API regression guard, not a proof that the mathematical result without old B is false or independent. The fixture contributes no theorem to accepted imports.

All finite controls use kernel `decide` or proved symbolic interfaces. No native_decide, external solver verdict, project axiom or admitted result is used. Final theorem-level axiom reports and the clean-source build remain independent acceptance requirements.

Resource history is retained honestly: the first monolithic control compile was terminated by the external monitor at 2,307,014,656 sampled process-tree RSS bytes after 8.513 seconds. No memory limit was raised. Splitting and narrowing imports resolved it: basic controls used 1,656,012,800 bytes; shared-block controls used 2,111,881,216 bytes; restoration controls used 1,606,615,040 bytes; the import-only entry used 1,562,558,464 bytes. A subsequent one-line `not_mem_empty` identifier error was replaced by the standard empty-membership simplification; it changed no claim.
