# Connected-chain archive audit and ordinary reconstruction

Status: PASS for the frozen connected-chain proof, with a source-location qualification. This is TUZA-19 AI continuation review, not Lean verification, human review, or an originality finding. It was written after reading the frozen theorem, dependency, prior review, and earlier checker. It is not a fresh-context reconstruction. Parent requested `gpt-6-astra` with `ultra`; the child has no separately exposed model-serving metadata and makes no runtime-identity assertion.

## User clarification after the bounded search

The user subsequently confirmed that the November 15 package is the common-vertex replay at commit `57708a8`, and that no separate connected-chain reconstruction archive path is confirmed. The user explicitly authorized continuation from the frozen TUZA-18 chain proof and recorded N=3 check on the original mission clock. The search history below is retained as provenance; no unanswered clarification request or missing required input now blocks the work.

## Observed source identities and replay scope

The canonical discovery archive is `https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-18`. Read-only Git inspection resolves annotated tag `tuza18-final-checkpoint` to commit `57708a8413929012d9ca8d15b0f925b3ef6b51e8`; tag object `f321778765a10f2bd4cf100b85988abca0e9c275`. The tag records checkpoint verification at `2026-11-14T21:03:18.207978+00:00`. The archive had a clean worktree and zero remotes before and after this audit. Twelve selected files were checked against both the commit bytes and the frozen SHA-256 manifest and copied into this mission's evidence directory.

The named later replay directory `https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-18-replay` exists but is not a Git repository, so it has no distinct replay commit. Its `REPLAY_RECEIPT.md` positively identifies its scope as the COMMON-VERTEX theorem and local exchange corollary, not the connected chain. It states that a separate replay attachment was unavailable and the common-vertex bundle was selected from the reproduction guide. Its source commit is the same frozen TUZA-18 commit. Its execution record gives `2026-11-15T01:43:47.465818+00:00` through `01:43:49.308537+00:00`, exit zero, Python 3.12.12, and reports 41,984 fixed-star graph cases plus ten targeted runs. Its 19 checksum-inventory files all match. This audit checked their byte integrity and receipt; it did not rerun that star checker.

A bounded filename/content search under the canonical math-research root, the initial `PRIVATE_LOCAL_PATH Proof 2` workspace, and the local legacy mirror did not locate a newer separate connected-chain replay receipt. This is a source gap relative to the mission's description of the updated archive, not a claim that no such package exists anywhere. The chain reconstruction and N=3 replay ARE present inside frozen TUZA-18:

| Frozen item | SHA-256 |
|---|---|
| `notes/late_star_connected_pivot_obstruction.md` | `0a5491534d7c85fb7206e4f0ffddafaf1c179f2b40ad0c198135f229e124f4cd` |
| `notes/late_star_gluing_obstruction.md` | `6ded16c3c61ef3029e86d7c9399bac6e3090ff80e204fd50023ce0f8fc6fee0b` |
| `review/chain_review.md` | `e4584143f39969ff20ffa48a6dbc56b2d45d1ca32f0b4df4168f5007e7fa10f4` |
| `checks/chain_literal_check.py` | `c299bb410a266acaf3c780e4bc8c1dbc5f162b70d83bd52d7599b3ec2aebd904` |
| `evidence/chain_literal_check.json` | `a1d485655dfa34029a1cfbe20036549df05f86b25579741052e2f3f7c61bf7a2` |

The old independent continuation check reports PASS at `2026-11-14T20:00:57.343492+00:00`. Its eight-file transfer manifest was created at `20:03:50.854373+00:00`; the canonical import receipt at `20:04:43.546727+00:00` records all eight hashes matched. Its N=3 result is 17 vertices, 49 edges, 48 actual triangles, one shared-edge triangle component, packing number 12, minimum SUPPORT cover size 24, 729 minimum support covers, 560 compatible states, and exact minimum symmetric difference four. This historical check and its transfer are not a newly located November 15 chain replay.

Evidence index: `evidence/source_audit/source_inventory.json`, `evidence/source_audit/frozen/`, and the source-copy script `evidence/source_audit/audit_sources.py`.

## Exact theorem reconstructed

For every integer N at least two, a finite simple graph G_N has 5N+2 vertices, 16N+1 edges, and 16N actual triangles, all in one component under shared-edge triangle adjacency. There is a specified maximum edge-disjoint triangle packing P of size 4N, all of whose members have exactly one support edge carrying private triangles. There are no private K4 completions, hence its permitted edge set A(P) is exactly the packing support B.

There is a minimum B-contained triangle cover C with 8N edges and Hall deficiency one. Here packed members are light, balanced, or heavy according as C selects one, two, or three of their edges; Hall deficiency is the number of heavy members minus the largest matching from heavy to intersecting light members. Every minimum B-contained cover of deficiency zero differs from C in at least 2 ceil(N/2) edges, and this bound is attained. Equivalently at least ceil(N/2) selected edges must be replaced. Thus every fixed radius of immediate strict deficiency improvement fails for some graph in this family.

The theorem quantifies over minimum covers within B, not unrestricted minimum graph-edge covers. It fixes the displayed P. It does not refute existential star grouping, PK, or Tuza; the displayed 8N-edge cover already certifies tau(G_N) at most 2 nu(G_N).

## Reconstructed proof

The block is K7 on labels 0,1,2,3,4,5,7 with edges 05,57,13,24 deleted. Its packing is (237,012,147,345). It has seventeen edges, sixteen triangles, and six odd-degree vertices. Five edge-disjoint triangles would leave only two unused edges. Removing triangle unions preserves all vertex-degree parities, but two edges cannot carry six odd-degree vertices. A six-packing would use more than seventeen edges. The displayed four-packing is therefore maximum.

Relative to its twelve support edges, the forced private bases are R={37,12,47,34}. Their private pages force them into every support cover. After selecting R, the uncovered triangle constraints form the two paths 17--01--14--45 and 27--02--23--35 on support edges. Each has exactly three minimum vertex covers of size two. This proves the support optimum eight and enumerates all nine local minimum states. C0=R union {01,02,14,23} has selected counts (2,3,2,1); its heavy triangle 012 and light triangle 345 are vertex-disjoint.

Glue outgoing edge 07 of block i to incoming edge 51 of block i+1, identifying 0_i=5_(i+1) and 7_i=1_(i+1). Both ports are outside support and have disjoint endpoints within each block. Hence no equivalence class touches nonadjacent blocks and no block folds onto itself. Each attachment is a clique sum along an edge. A triangle crossing its exclusive sides would need an absent edge between those sides, while the two-vertex interface contains no triangle. Every actual triangle consequently has unique block ownership. Counts follow by subtracting two vertices and one edge per join. Both overlap edges lie in local triangles, joining the already connected local triangle families into one triangle component.

Assign every triangle of an arbitrary packing to its unique block. Each block contributes at most four, and the specified packing attains 4N because its support avoids all overlap edges. No triangle acquires another block's support edge, so every private-base classification persists. A private K4 completion would require private pages on all three edges of a packed triangle; type one excludes it. A support cover must cover each block using that block's disjoint support, giving exact optimum 8N and the full product of nine-state choices.

In the initial product C, the heavy/light incidence graph consists exactly of edges H_i--L_(i+1), for i<N. They form a matching of size N−1, proving deficiency one. Every minimum local state has four packed members and eight selected edges. If h,l,b count its heavy, light, balanced members, then h+l+b=4 and 3h+l+2b=8, so h=l in EACH block.

For a compatible minimum cover, a heavy-saturating matching therefore saturates all light members too. Across any prefix cut, matching edges must cross equally often in both directions by the equal heavy/light counts in the prefix. If adjacent blocks i and i+1 both stay at C0, their cut has only the one possible edge H_i--L_(i+1), so balance forbids its use. But that unchanged L_(i+1) has no other heavy neighbor: it is disjoint from its local heavy member, only sees H_i at its incoming port, and misses its outgoing port. Likewise unchanged L_1 is isolated regardless of later states. Thus changed blocks contain block one and meet every edge of the index path. There must be at least ceil(N/2) changed blocks; disjoint support and equal local cardinalities force at least two symmetric-difference edges per changed block.

For attainment, pivot 23 to 35 in each odd block. Its unique light member changes from 345 to 237; the heavy member remains 012. Pair an odd block's heavy with the following even block's old light at the first port, and pair the even heavy with the preceding odd light at the second port. If N is odd, pair its final heavy and new light internally at vertex 2. This is a saturating matching after exactly ceil(N/2) selected-edge replacements.

No gap was found in these steps. The decisive checks are unique triangle ownership, disjoint support, LOCAL heavy/light balance, and restricting the one-direction cut assertion to two UNCHANGED adjacent blocks. Unrestricted cover numbers need not add across an edge sum, and the proof correctly avoids that claim.

## Current finite check and remaining escape

The newly written local checker `evidence/source_audit/chain_reconstruction_check.py` imports no old checker. It was authored after this continuation source review, so it is not independent fresh-context verification. It reconstructs the graph through union-find identifications, enumerates all local support minima and their 729 N=3 products, and computes the heavy/light matchings. Its result matches the frozen N=3 conclusions: 560 compatible states, 164 deficiency-one states, five deficiency-two states, and exact distance four. It also checks the left-to-right odd-block plateau sequence for N=2 through ten. The receipt is `evidence/source_audit/chain_reconstruction_check.json`. Computation ran locally on Darwin under pinned Python 3.12.12 and took about 0.055 seconds. The all-N theorem remains an ordinary proof, not an enumeration conclusion.

A concrete escape is stronger than merely saying plateau moves remain possible: these chains admit an OPTIMAL-LENGTH sequence of one-edge pivots with deficiency never increasing, equal to one until the final move, then zero. The separate ordinary corollary is proved in `review/chain_plateau_control.md`. Consequently this family is a control against strict descent, not evidence against a search or proof using nonincreasing augmenting sequences. An unrestricted nonincreasing-sequence theorem has not been supplied. A different escape retains the actual two-vertex clique separators and richer boundary matching states; being one triangle component does not remove those separators. Changes of packing and nonlocal choices also remain available, but this audit provides no global existence theorem for them.
