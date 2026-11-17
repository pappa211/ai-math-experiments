> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# All-size four-branch CS link exclusion: exact finite bridge and assembly

Status: PROOF_CANDIDATE_USING_FINITE_CERTIFICATES_AND_DECLARED_INPUTS. The ordinary reductions and all-size lifting are supplied below; the new363-record domain requires independent regeneration and literal witness verification, requested from the coordinator. The historical triangle-free inputs retain their own finite/source dependencies. This is not an all-size Lean proof or an unrestricted Tuza proof.

## Theorem

In a minimum-edge failure of combined CS, globally or within an edge-subgraph-hereditary class, every nonempty closed link component has at least FIVE vertices of link degree at least three.

The local framework is the authenticated class-local M0, codegree and robustness package, together with the accepted R2 consequences and the new ordinary link restrictions. All proofs count every actual triangle and allow arbitrary outside attachments.

## 1. Already removed all-size cases

Let L be a closed link component with at most four branch vertices.

- At most three branches are excluded ordinarily by `three_branch_cs_link_exclusion_v1.md`.
- A triangle-free L is WKE by the authenticated historical all-size four-branch WKE theorem, and is excluded by `triangle_free_wke_link_exclusion_v1.md`. This retains the historical complete finite WKE domain and the declared Kotzig input of that exclusion.
- A triangle-bearing subcubic L is excluded ordinarily by `subcubic_four_branch_triangleful_link_v1.md`.
- An L containing K4 is excluded ordinarily by `four_branch_k4_link_exclusion_v1.md`.
- In the remaining K4-free triangle-bearing case, at least four even nondirect paths are excluded ordinarily by `four_branch_many_even_threads_v1.md`.

The remaining component is therefore K4-free and triangle-bearing, with exactly four branches, some branch degree at least four, and at most three even nondirect paths.

The accepted link-deletion theorem excludes returning paths. The parallel-thread theorem excludes two nondirect paths on one branch pair and a direct edge with an odd nondirect path. The accepted link-excess inequality gives

    mu(L)=|E(L)|-|V(L)|+1 >= Delta(L).

These facts are used only at their proved scopes.

## 2. The exact remaining canonical domain

Label the four branches0,1,2,3. For each of their six unordered pairs, in lexicographic order01,02,03,12,13,23, use one of these six states:

| state | actual paths retained in the canonical graph |
|---|---|
|0|none|
|D|one direct edge|
|E2|one even nondirect path, reduced to length2|
|O3|one odd nondirect path, reduced to length3|
|DE2|one direct edge and an ACTUAL length-two path|
|DE4|one direct edge and an even path of actual length at least4, reduced to length4|

Every retained path has fresh, pairwise disjoint internal vertices. A D,E2,O3 pair contributes one to each branch degree; DE2,DE4 contributes two. Let p be the sum of these path multiplicities. The cycle rank is p-3.

Retain exactly the state vectors satisfying:

1. at most three states from E2,DE2,DE4;
2. all four branch degrees are at least three and some is greater than three;
3. p-3 is at least the maximum branch degree;
4. not all six pairs contain a direct edge (otherwise the branches induce K4);
5. the literal expanded graph has at least one actual triangle.

Keep one lexicographically smallest state vector under the24 branch permutations. No additional pruning or optimization property defines the domain. The new producer reports363 representatives, with maximum order19 and maximum edge count24. The coordinator's independent checker must regenerate this domain and check exact set equality; a matching count alone is insufficient.

### Why every remaining link is covered

Suppressing degree-two interiors gives exactly the states above. All branch degrees and the cycle rank are unchanged when an even number of interior vertices is removed from a path. Every original remaining link therefore yields a retained state vector, and a branch permutation yields its canonical representative.

The DE2/DE4 distinction is essential. An actual short ear is never lengthened in the reconstruction from its canonical state. A long doubled path is shortened only to length4, so the canonical graph does NOT invent an ear triangle that would disappear on lifting. A single E2 path has no direct endpoint edge, and an O3 path has no parallel direct edge; neither can produce an interior triangle. Consequently the complete triangle set of each canonical graph consists exactly of direct branch triangles and DE2 ear triangles, and every one of these remains an actual unchanged triangle in the original link.

The original graph is obtained from its canonical graph by repeated two-vertex subdivisions of E2, O3 and DE4 paths. No edge of any canonical actual triangle is subdivided. This fact is the bridge needed by the fixed-rim certificates below.

## 3. Literal certificate formats

For each canonical graph the new JSON stores actual edge lists, actual triangles, and one of these witness types. The only trusted assertions are the directly checked ones:

- **STRICT:** P is a graph matching, Q is a vertex set covering all edges outside P, and |Q|<|P|.
- **LARGER:** P,Q are WKE with |Q|<=|P|, and Z is an actual matching with |Z|>|P|.
- **RIM:** P,Q are WKE, T is an actual triangle with at least one edge in P, and Z is an actual matching in L-E(T) with |Z|>=|P|.

No optimum calculation is needed. The producer's nu_matching fields, matching-search routine, timestamps and status labels are not proof premises. The363 saved certificates comprise170 STRICT and193 RIM; no LARGER certificate was needed in this remaining domain.

## 4. Simultaneous lifting preserves each certificate

Replace a path edge uv by u-x-y-v. If uv is in P, replace it by ux,yv and add x to Q. Otherwise an endpoint, say u, is in Q; keep P, add xy, and add y to Q. Both sizes increase by one and Q covers all new nonmatching edges. Existing edges of fixed triangle T are untouched by Section2.

A comparison matching Z also increases by one: replace uv by ux,yv if selected, and otherwise add xy. Thus strict slack persists; a larger-matching advantage persists; and a matching in L-E(T) of size at least|P| stays such a matching after the lift. This is a proved simultaneous witness lift, not an appeal to WKE inequality alone.

Branch permutations and reversal of a path merely transport the literal witnesses. Hence every verified canonical certificate gives a certificate of the same sufficient type on the entire original unbounded link.

## 5. Each lifted certificate excludes equality with arbitrary attachments

Let h be the hub, s=|P|, and delete all h-spokes to L together with P, obtaining K. The s hub triangles on P append to any K-packing. The set P plus the h-spokes to Q covers every triangle lost in this deletion, including every outside page on a deleted rim edge. Closedness of the link accounts for all removed h-spokes.

A strict tuple contradicts tau(G)=2nu(G) immediately. Otherwise minimum-CS accounting gives B(K) and nu(K)=nu(G)-s.

Since L is K4-free, each residual K4/K5 block contains at most THREE link vertices. Thus any matching Z contributes at most one surviving edge per block. In the LARGER case choose maximum old block packings avoiding those edges and append its hub triangles, contradiction.

In the RIM case append the hub triangles on Z and the actual rim triangle T. They are pairwise edge-disjoint because Z avoids E(T). The rim triangle contributes at most one surviving edge per old block: two of its edges in one clique would force its deleted P-edge to be present. The matching contributes at most one. If these two footprint edges were disjoint, their four endpoints would be four link vertices in one block, impossible. Hence the ENTIRE footprint is a star of at most two edges, avoidable in K4 and K5. Appending at least s+1 triangles contradicts nu(G).

This proof audits complete selected footprints in all residual blocks. It makes no restriction on the number or placement of outside pages, no fixed-core completeness assumption about G, and no promotion of a finite order census to an all-size theorem.

Together with Section1, verified canonical completeness and witness validity prove the theorem.

## 6. Scope of the hereditary consequence

Define H3(G) to be the edge-subgraph consisting of edges lying in at least three actual G triangles. The class of graphs for which H3(G) is4-degenerate is closed under arbitrary edge deletion: codegrees only decrease, and degeneracy is preserved by subgraphs.

If this class had a minimum CS failure, the theorem would give at least five branch vertices in every nonempty link component. Their spokes are incident edges of codegree at least three. Thus every graph vertex has at least five incident H3 edges, contradicting4-degeneracy. Therefore, once the theorem's finite/source premises are accepted, full CS holds throughout this hereditary class.

This upgrades the historical empty-heavy-five-core INEQUALITY class to combined CS with the exact B equality conclusion. It does not show that an arbitrary graph has empty heavy five-core, or settle the unrestricted conjecture.

## 7. Frozen evidence, receipts and dependencies

New evidence:

- `evidence/four_branch_cs_interface_probe.json`, SHA-256 `748b36eea4e6d1d503395cd4531dc80d4697006164369fa243f8ec3d3da5b77c`;
- producer `scripts/four_branch_cs_interface_probe.py`, SHA-256 `3a8827ef973f2dfbd7555026b2088feb059072d02f0162f93e35250d67593f85`;
- external monitor receipt `operations/four_branch_cs_interface_probe.json`, SHA-256 `4eecf2e796f4d07c5932dc50c6838da5f38ad1c859cd57e0ca5b8e35bfb0141f`.

The coordinator authorized at most60 seconds and2200MiB. Actual elapsed time was2.996 seconds, peak sampled process-tree RSS26.92MiB, return code0, with no UNKNOWN profiles and no surviving worker. All work was local Darwin under the existing math-research environment. The diagnostic was designed to stop at the first unresolved profile; it happened to certify the entire fixed domain. That observation is not substituted for the independent completeness check.

Ordinary current-note dependencies:

- `three_branch_cs_link_exclusion_v1.md`, SHA `dd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4`;
- `subcubic_four_branch_triangleful_link_v1.md`, SHA `24e94f0d47b46d86d5339ce373e46b2bc3ab197449d2a8905e7433613a8a9c9a`;
- `four_branch_k4_link_exclusion_v1.md`, SHA `80e48be8de314cc6b5ee8cdfefebd8862ab36a302eb34d3e7ef4d6955eb35992`;
- `four_branch_many_even_threads_v1.md`, SHA `85ee58a58525eac621e79c8e3063c72b49c99f2b67b314766fa555dc06b623c9`;
- `parallel_thread_link_exclusion_v1.md`, SHA `6eec22bff2400c5a3c07a43d41649a7b8e0d6e08f31d23c8e6e020c6f82718c4`;
- `link_excess_and_one_cycle_leaf_v1.md`, SHA `46d361c2beabf6459cf97be797f65dfa90df419959173c844af24552c11b393b`.

Declared triangle-free inputs:

- TUZA-19 `notes/root_four_branch_wke.md`, SHA `67011b7544cd8d8c516a738572c10f5d828b5631c3d8ce491fcd08ae3f71ce99`, with its complete5375-record finite WKE family and fresh audit; historical source path is `problems/TUZA-19/`;
- current `notes/triangle_free_wke_link_exclusion_v1.md`, SHA `32a847bf9d8514b514d7f7f3cee7e193a8387528137ad678697d5a4238763a65`, including its explicitly authenticated Kotzig matching-bridge input.

The new363-record certificate family is FINITE_CERTIFICATE evidence. The resulting all-size theorem is a proof using the stated ordinary reductions, finite certificates, and declared triangle-free input. No new all-size formalization, human review, or historical-priority claim is made.
