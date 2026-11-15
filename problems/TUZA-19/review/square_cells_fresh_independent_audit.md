# Fresh independent audit: square K4 cells with arbitrary boundary multiplicity

**Verdict: PASS.** I find no material gap in the frozen proof of ordinary Tuza for the exact stated graph class. The matching identity, endpoint exclusions, barrier refinement, singleton accounting and expected cover bound all reconstruct. This is an ordinary mathematical AI review, not formal verification, a finite census, or an originality assessment.

Input: `notes/global_routes_square_cells_matching.md`, SHA256 `1c59c9c58a0ba5b0ad9c5d90d3f0d1f3794b4300f7b28a06524da0f71ee39c2c`.

Review began 2026-11-15T06:51:42Z under the original TUZA19 clock. Research cutoff remains 09:23:58Z; hard deadline 09:53:58Z. I read the frozen proof and independently inspected the matching theorem's primary source. I did not read the producer's implementation, root's developmental audit, another review, or a finite-search output. The input itself reports prior root review; that assertion was not used as evidence. Requested controls remain Astra/Ultra; exact serving model/effort metadata were not independently exposed.

## 1. Exact theorem and graph domain

G is a finite simple graph with c literal K4 subgraphs called cells. Every actual G-triangle lies in exactly one cell. Each cell's four designated boundary edges form a C4, and its two remaining edges are private diagonals. A diagonal belongs to no other cell and is never a boundary edge. Boundary edges can have arbitrary positive multiplicity among cells. No bound on vertex degrees or cell intersections at a vertex is imposed. The conclusion is `tau(G)<=2nu(G)` for ordinary edge covering and edge-disjoint triangle packing.

After discarding edges in no triangle, the edge set is the disjoint union of the global boundary set H and the 2c diagonals. In particular, every actual triangle has exactly two H-edges and exactly one diagonal. Two useful consequences of the hypotheses are:

- H contains no actual graph triangle.
- The union of all diagonals contains no actual graph triangle.

Also, distinct cells cannot share three vertices: those three vertices would form a triangle owned twice. This observation is a consistency check, not an additional assumption.

For one labelled boundary cycle 1-2-3-4-1, its opposite pairs are `{12,34}` and `{23,41}`. The four cross choices close respectively with diagonals 13 or 24, and are precisely the four K4 triangles. Thus the auxiliary construction encodes all local triangles. If c=0, G is triangle-free and the theorem is immediate. Isolated graph vertices are harmless.

## 2. Exact matching correspondence

The auxiliary graph has one terminal per distinct H-edge and, for each cell i, two internal vertices joined by a base edge. Each internal has exactly its two opposite-pair terminals as its other neighbors. Terminals have no mutual edges and the internal induced graph is precisely c disjoint edges.

A triangle packing takes at most one triangle per cell. For each selected cell use the two auxiliary edges to its two boundary terminals; for every other cell use the base edge. Different packed triangles cannot use the same boundary terminal. This gives a matching of size `c+nu(G)`.

For the reverse direction start with a maximum auxiliary matching. At a given cell:

- With neither internal terminal-matched, its base edge must be present: otherwise both internals are unmatched and adding that edge increases the matching.
- With exactly one internal terminal-matched, replace that edge by the base edge. The other internal was unmatched; this is a valid size-preserving operation and releases a terminal.
- With both internals terminal-matched, retain both edges.

Performing these replacements cannot disturb another cell's internal matching and preserves maximal cardinality throughout. The resulting matching has size c plus the number of double-terminal cells. Those cells give actual graph triangles. They share no boundary edge by terminal disjointness, and no diagonal by privacy. Hence they form a packing.

Consequently `mu(A)=c+nu(G)` and, since `|V(A)|=h+2c`,

`def(A)=h-2nu(G)`.

This correspondence is integral. It makes no assumption that the auxiliary graph is bipartite or that a fractional packing is integral.

## 3. Auxiliary odd cycles: endpoint exclusions are sufficient

Consider a simple auxiliary cycle. Between consecutive terminals there are one or two internals, since internals induce a matching. A one-internal transition joins two opposite C4 edges of G, hence disjoint original edges. A two-internal transition uses a base edge and joins adjacent original edges. If the cycle has t terminals and s base-edge transitions, its length is `2t+s`. An odd cycle therefore has odd s.

The t=0 case is impossible because a matching contains no cycle. For t<=3:

- t=1 forces the same terminal to neighbor both internals of one cell, contrary to the disjoint opposite pairs.
- t=2 forces one adjacent and one disjoint transition between the same original edges. Incidence in a fixed simple graph cannot satisfy both.
- t=3 and s=1: label the adjacent resources xy,yz and the third resource uv. The remaining transitions force uv disjoint from both xy and yz. All five vertices x,y,z,u,v are distinct. The two opposite-pair transitions require K4 cells on `{x,y,u,v}` and `{y,z,u,v}`. They are distinct and both contain the actual triangle yuv, violating ownership.
- t=3 and s=3: three distinct original edges are pairwise incident. They either form a triangle, impossible inside H, or form a three-edge star `xa,xb,xc`. For each pair of star edges the base-edge transition makes its closing edge a private diagonal. Thus ab,bc,ca are three diagonal edges forming an actual triangle, also impossible.

The last case does not merely assume that closing edges exist: crossing the base edge means the chosen boundary resources are adjacent on that particular C4, so the edge between their non-common endpoints is one of that cell's designated diagonals. Privacy makes it globally outside H. These cases exhaust odd s for t<=3, so every auxiliary odd cycle has at least four terminals.

The argument uses literal graph endpoints and completeness of the actual triangle family. It is not valid for an arbitrary abstract four-choice incidence system lacking those constraints.

## 4. Matching theorem and the factor-critical barrier

The sole imported theorem is Tutte–Berge:

`def(A)=max_X (odd(A-X)-|X|)`.

I independently retrieved [Chudnovsky et al., Combinatorica 26 (2006), 521–532](https://www.math.uwaterloo.ca/~jfgeelen/Publications/paths.pdf). Section 3, Theorem 3.1, printed p.525/PDF index4, states exactly this formula with the same definitions; it was visually checked. Its proof follows on p.526. The group's path-packing theorem is not imported. This audit does not claim to reprove the classical matching theorem or all source results.

Among the finitely many optimizing X choose one of maximum cardinality. Let C be an odd component of A-X and v any vertex of C. If C-v has no perfect matching, its even order forces deficiency at least two. Tutte–Berge on C-v gives Y with `odd(C-v-Y)-|Y|>=2`. Define `X'=X union {v} union Y`. Other components of A-X are unaffected, and

`odd(A-X')-|X'| = odd(A-X)-|X| + odd(C-v-Y)-|Y|-2 >= def(A)`.

Thus X' also optimizes (strict improvement is impossible), but is strictly larger. This contradiction proves every odd component factor-critical. No claim about even components is needed.

A connected factor-critical graph with more than one vertex cannot be bipartite: both bipartition sides are nonempty, and deletion from the two different sides would demand incompatible equalities of their sizes. It contains an odd cycle, hence at least four terminals by Section 3. The only possible terminal-free odd component is a singleton internal vertex, because internal-only components have at most two vertices.

## 5. Cover construction and expectation

For every odd component containing terminals choose exactly one of its terminals uniformly; leave its corresponding boundary edge unselected. Select every other boundary edge. An isolated terminal is allowed and is selected as the free representative with probability one. Terminals in X or in even components are always selected.

With o odd components and o0 terminal-free odd components, exactly o-o0 distinct boundary edges are free. Initial boundary cost is therefore `h-o+o0`, independent of the choices. Repair each cell that still has an uncovered triangle by selecting both its diagonals. Every actual triangle belongs to a cell, so this produces a cover for every outcome. Private diagonals guarantee that this cost can be counted cell by cell.

Classify a cell by the number of its internals in X:

| Internals in X | Repair-cost bound | Reason |
|---|---:|---|
| 0 | 0 | Both internals and all surviving terminal neighbors lie in one component; at most one boundary resource of this cell can be free. |
| 2 | 2 | Selecting the two diagonals always suffices. |
| 1, survivor in an even component | 0 | Its terminal neighbors outside X are not free. |
| 1, survivor in a nontrivial odd component | Expected cost <=1 | The component has at least four terminals; at most two belong to the survivor's opposite pair. |
| 1, survivor a singleton internal | 0 | Both its terminal neighbors lie in X, hence their boundary edges are selected. |

For the probability row, an uncovered triangle requires a free terminal on **both** opposite-pair sides. It is enough to use only the necessary condition on the surviving internal's side. If that component has t terminals, the probability of this necessary event is at most `2/t<=1/2`. Repair costs at most two. Therefore the expected cost is at most one, regardless of how free choices on the other side are correlated. Independence is not being used to multiply probabilities. The survivor cannot lie in an isolated-terminal component because the survivor is an internal vertex.

The singleton-internal accounting is exact. Every terminal-free odd component is one surviving internal whose base-edge partner lies in X. Its two terminal neighbors also lie in X. Distinct such singleton components belong to distinct cells: two surviving internals of the same cell would remain adjacent. Conversely each cell of this orphan type produces exactly one terminal-free odd component. Hence there are exactly o0 one-internal-removed cells with zero cost in place of the usual one-unit allowance.

Summing gives `E[repair cost]<=|X_I|-o0`. The total is

`E[cover size] <= h-o+|X_I| = h-(o-|X|)-|X_H| = 2nu(G)-|X_H| <= 2nu(G)`.

The sample space is finite and every sample produces a valid cover. Some sample therefore has cost at most the expectation, proving the required integer covering inequality. Neither connectivity of A nor a bound on terminal degrees is needed.

## 6. Scope, verification level, and decision

No amendment of the frozen mathematical statement is required. The proof supports the stated arbitrary positive boundary multiplicities, including boundary edges belonging to only one cell. The private-diagonal and unique-triangle-ownership hypotheses are essential to the present argument and cannot be dropped based on this audit.

The output is an ordinary cover, with no asserted odd-cover parity. It supplies no theorem that all graphs, all TF graphs, all resilient graphs, or all graphs with triangle-free high-codegree edge subgraph admit this K4-cell decomposition. In particular, a general two-page diamond need not have the extra edge required to become a full K4 with two private opposite diagonals. Triangles outside the full-cell pattern remain an availability issue. This is a proved restricted class, not an unrestricted Tuza proof.

Evidence here consists of the frozen input, this ordinary reconstruction, independently retrieved primary matching source, exact hashes, and the inspection receipt. No finite census, numerical optimum computation, producer checker, Lean proof, or model-serving attestation is claimed. The only initial extraction issue was that automatic matching of a PDF text string found no pages; extraction was repeated by the verified page indices before inspection. No mathematical result depends on that extraction automation.

The frozen input and all source/evidence files are under `evidence/square_cells_fresh_audit/`; the receipt records the final review hash and original clock. No producer or archive file was modified.
