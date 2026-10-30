> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Unique-triangle-edge reduction

Completed on the external verification server at 2026-10-30T18:10:47.061056+00:00.
Frozen source: `lean/Tuza06/UniqueEdge.lean`, SHA-256 `fc9c77bc94e2af03aaadc2f83128232a7fe161cea7f28ff24d5f20465c11cb88`.
Successful compiler/type/axiom log: `logs/compile-180950-Tuza06.UniqueEdge.log`.
Every compile used only the shared serialized build helper, Lean `-j 1`, 1900 MiB memory limit, and 240-second timeout. The completed source compiles in approximately 3.5 seconds; no heavy numerical computation was needed.

## Exact completed results

`minimal_no_unique_triangle_edge` proves Section 3 of the ordinary manuscript for arbitrary finite simple graphs: a `MinimalObstruction G` cannot have an actual graph edge A belonging to exactly one full graph triangle. Its only mathematical hypotheses are the exact minimal combined-obstruction definition, `G.IsNClique 2 A`, and the displayed uniqueness assertion over **all** `triangles G`.

The source also proves:

- `two_triangle_augmentation`: for arbitrary H≤G with clique components and an independent terminal set A in H, two edge-disjoint full graph triangles in G having bases in A can be appended to suitably chosen maximum H block packings. No ambient order bound or list of outside attachments is assumed.
- `k4_second_triangle`: an actual graph K4 containing a triangle T supplies a distinct full graph triangle on every edge of T.
- `minimal_edge_two_triangles`: every actual edge of a minimal combined obstruction lies in two distinct full graph triangles.
- `minimal_edge_codegree`: the corresponding full graph-triangle filter has cardinality at least two.

The last successful compiler log prints complete theorem types with all implicit parameters using `#check @...`. Both `minimal_no_unique_triangle_edge` and `minimal_edge_codegree` have exactly the standard transitive axioms `propext`, `Classical.choice`, and `Quot.sound`. There are no placeholders, custom axioms, unsafe/native shortcuts, or hidden mathematical input parameters. These local results do not prove nonexistence of a 5-degenerate minimal obstruction, so the full global theorem remains a separate obligation.

## Argument and fidelity

Let T be the supposed unique triangle on A. Use H=`deleteTriangle G T`, which deletes all three edges of T. This differs representationally from the ordinary manuscript's deletion of the other two edges: the extra deleted A is harmless for triangle families because its only triangle was T. The proof does not assume that equivalence; it directly checks all lost triangles in H.

The two edges X=`(edges T).erase A` cover every lost triangle. If a lost triangle uses A, uniqueness makes it T, which is hit by X. If it uses another deleted edge, that edge is in X. X has exactly two edges. The singleton packing {T} appends to every H packing, so balanced one/two accounting, the minimal-obstruction failure bound, and H's inductive inequality force exact equality of H and packing number nu(G)=nu(H)+1. Only then does H's inductive equality classification produce clique blocks.

Every lost triangle has a base edge in T. Since T is independent in H, two disjoint lost triangles would combine with compatible maximum H block packings to give nu(H)+2, contradicting exact accounting. Thus the lost family is intersecting. If its cover number exceeded one, the inherited proved `Tuza.intersecting_k4_structure` theorem would place it in an actual graph K4 containing T. `k4_second_triangle` constructs a second full graph triangle on A, contradicting uniqueness. Hence the lost family has a cover of at most one edge; extending a minimum H-cover gives a strict improvement over the required two-edge increment.

## Development corrections

The first compiler attempt found two routine local-definition normalization issues: `rw [X]` attempted to use a local value as a rewrite equality, and omega did not identify an opaque local H with `deleteTriangle G T`. These were repaired with explicit definitional `change` steps. The mathematical statement and proof did not change. Failed and successful compiler logs are retained.

The current proof status records the subsequent exact-source review and reproduction.
