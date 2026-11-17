> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Source intake audit — frozen v1

Status: actual equality source located and inspected; tiny original-source controls reproduced and independently cross-checked. Full equality census **REPORTED_UNVERIFIED** because its inputs, input-generation commands, build/run receipts and completeness evidence were not supplied. Actual `pk.c` remains **SOURCE_UNAVAILABLE**; its reported census is **REPORTED_UNVERIFIED**. This is not an unrestricted mathematical result.

## Located materials and identity

Owner location: `PRIVATE_PATH_REMOVED outputs/`.

- `eq.c`, 6,969 bytes, SHA-256 `897b7dd264554bd1db901537a6a544276834005a753c0b82be49fa845198c34c`.
- `PK_RESULTS.txt`, 1,127 bytes, SHA-256 `c6c4450ee025816fd73117acb4b39312c00373e5c91a7340b5f552e913e14f26`.

Coordinator copied these to `sources/claude/` before execution. Originals were never modified. The only additional locations inspected for relevant filenames were Mac research, Downloads, attachments, and mission-input locations. No `pk.c`, graph6 census file, rotation checker, generation command, or accompanying original run receipt was found. Generic Downloads ZIP member-name listings (`files.zip`, `archive.zip`, `archive (1).zip`) contained no matching checker/graph6/Tuza names; unrelated contents were not read. Neither `geng` nor `nauty-geng` was on the command path. This is scoped discovery, not a claim of exhaustive filesystem absence.

## What eq.c actually runs

Despite the opening PK comment, the actual `main` (lines 153–178) performs equality classification. PK routines remain as dead code; `enum_rec` is not called and its cap/state are not initialized by this main. Compilation warns that `enum_rec` will not be emitted. It would be inaccurate to call execution of this file a replay of the missing `pk.c`.

For each input graph, main rebuilds every actual triangle, computes the maximum packing number `k`, checks existence of an ordinary edge cover of size `2k`, and then tests size `2k-1`. It only classifies B when equality is established by these decisions. The final summary also counts defect exactly one by testing `2k-2`.

**Count correction:** line 158 skips triangle-free inputs before incrementing `tight`. Consequently `tight=5756`, if reproduced from these exact bytes, means 5,756 **triangleful** tight input records. Triangle-free graphs also satisfy tau=2nu=0 and B vacuously, but are omitted from this counter. The reported text calls these “tight graphs” without this qualification. `graphs` counts all nonempty input lines (including triangle-free graphs); it counts neither isomorphism classes nor labelled graphs intrinsically. Duplicates, isolates, disconnected inputs and filters are entirely the input generator's responsibility. No source/input evidence presently authenticates what the historical 12,005,168 stream represents.

`TUZA_FAIL` is printed to stdout, but is not included in the final summary's `bad` count; `bad` counts tight non-B exceptions only. Both stdout and stderr must be retained. All return codes are zero on mathematical failures, so exit status alone is inadequate. Original code has no wall-time guard, emitted optimum certificate, or failure checkpoint.

## Algorithm audit under valid-input assumptions

Assume a well-formed short graph6 line with 0<=n<=16, enough encoded characters, no header, and no trailing non-record data.

1. **Triangles:** the nested `a<b<c` loops test all three actual edges and produce each triangle once. Mask bits represent actual graph edges, so vertices may be shared by a packing and no crossing triangle is discarded.
2. **Maximum packing:** `used` contains picked and forbidden edges; `undecided` contains the remaining viable edge slots. Dropping an undecided edge with no triangle disjoint from `used` is safe: subsequent states only enlarge `used`, so that edge never becomes viable. Every remaining free triangle is contained in `undecided`. At the least viable edge, any feasible packing either uses exactly one of its free incident triangles or avoids it. These mutually exhaustive branches establish exactness by induction. `cur+floor(popcount(undecided)/3)` is a sound upper bound, and `<=best` pruning is legitimate for computing the optimum.
3. **Cover decisions:** every uncovered triangle must contribute some permitted edge; branching on every permitted edge of the first uncovered triangle is exhaustive. The greedy lower bound chooses pairwise disjoint sets of permitted edges of uncovered triangles, so each requires a distinct additional choice. If an uncovered triangle has no permitted edge, no cover is feasible. In main, all actual edges are permitted. The recursion stops before exceeding its nonnegative budget; success means every actual triangle is hit. Thus the feasibility comparisons certify equality/defect in an ordinary algorithmic sense.
4. **B test:** union-find joins exactly triangles sharing a graph edge. Within a component, four distinct triangles on four vertices necessarily contain all four triples and hence literal K4 support; ten triangles on five vertices likewise force all triples and literal K5. The test therefore recognizes actual triangle components, not ordinary graph blocks. Triangle-free background edges are harmless.
5. **Dead PK routines:** conditional on valid initialization, their least-edge recursion partitions maximum packings without duplication and uses strict `<k_nu` pruning to preserve all optima. `sp & B == 0` for a K4 completion is equivalent to all three other faces having exactly their packed-base edge in B. The permitted set includes all packed edges and precisely those completion spokes. The memo key A is sufficient within one graph and one fixed k. These observations audit fragments; they do not authenticate the missing pk.c entrypoint, its cap handling, census, or K10 count. The dead cap code increments `npack` before testing `npack>pack_limit`; a cap-hit summary would need to distinguish visited/tested counts.

## Unsafe input scope

There is no validation of n, graph6 length, character range, header or extended order encoding. `MAXN=16`, `MAXE=120`, `MAXT=560` and 128-bit edge masks are adequate for n<=16. Each edge belongs to at most 14 triangles, fitting `tri_of_edge[][16]`. A short line, `>>graph6<<` header, extended order record, or n>16 can invoke undefined behavior. The opening comment's n<=11 is stale relative to array capacity, but capacity is not an unrestricted supported-input guarantee. All replay inputs here were independently generated, prevalidated short graph6 of order at most eight. Original was deliberately **not** run on K4 Cartesian K5 (20 vertices).

## Tiny controls and independent implementation

`python scripts/source_audit_controls.py` (after sourcing the existing `migration/env.sh`) compiles the unchanged copied source with existing `/usr/bin/clang -O2 -Wall -Wextra`. It runs 11 explicit original-source control records, with per-process external deadlines, process-tree RSS samples and a 2,200 MiB ceiling. A separately written Python triangle-family branching algorithm computes optima and literal support, then asserts the original per-record classifications agree. Final retained run subprocess wall total: about 0.421 seconds; sampled peak process-tree RSS: 54,336 KiB. Sampling is not an exact OS peak measurement. The earlier development run was replaced by the retained assertion-complete run; no census was run.

Retained data: `evidence/source_audit/controls.json`, including literal graph edges, component packings/covers, all original subprocess commands/output, source/binary hashes and limits. Independent code identity: `TUZA22-independent-tiny-source-controls-v1`. This is **finite computation with retained witnesses and ordinary correctness reasoning**, not Lean verification or serialized exhaustive proof trees.

| Control | nu | tau | B |
|---|---:|---:|---|
| Empty, isolates, path6 | 0 | 0 | yes |
| K3 | 1 | 1 | no |
| K4 | 1 | 2 | yes |
| K5 | 2 | 4 | yes |
| K6 | 4 | 6 | no |
| Disjoint K4+K4 | 2 | 4 | yes |
| Vertex-shared K4+K5 | 3 | 6 | yes |
| K4 plus triangle-free edge | 1 | 2 | yes |
| Two K4 sharing one edge | 2 | 3 | no |
| K4 Cartesian K5, independent only | 13 | 26 | yes |

Independent PK controls enumerate all four maximum K4 packings and all fifteen maximum K5 packings. Every packing passes budget 2nu and fails budget 2nu-1. These are new independent tiny checks, **not Claude's PK replay**.

## The twenty-vertex distinction, ordinary explanation

Represent a vertex of K4 Cartesian K5 by (i,j), with adjacency when exactly one coordinate differs. A triangle cannot change both coordinates: if two vertices differ in their first coordinate, their second coordinates agree, and a third vertex adjacent to both must share that second coordinate. Thus every triangle lies in one literal factor clique. There are five edge-disjoint K4 column components and four edge-disjoint K5 row components; row/column cliques share vertices but not edges. Hence nu=5*1+4*2=13 and tau=5*2+4*4=26.

The ordinary graph is 2-connected and is not a clique. After deleting any one vertex, row/column paths can avoid it: for different rows and columns, one of the two intermediate corners survives; within one row or column, adjacent surviving vertices are joined directly. Thus its sole ordinary nontrivial block is a nonclique, while B holds. The independent code rebuilds all 60 actual triangles and confirms the nine literal triangle components.

## Remaining evidence requests and limits

A full reproduction needs the actual pk.c, original compile commands/options, graph generator source/version/command, the graph6 stream or reproducible generation receipt, stdout/stderr, cap/timeout handling, and the separate uncapped K10 receipt. Equality needs the corresponding complete input-generation evidence even though its source is present. Random capped checks remain separate from complete censuses. Missing optional finite evidence does not block the research campaign and has not been substituted by an easy large new census.
