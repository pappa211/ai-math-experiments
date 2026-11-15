# Square K4 cells with arbitrary boundary multiplicity

Status: complete ordinary proof candidate, using the classical Tutte–Berge formula. Root independently reconstructed the endpoint and expectation arguments during development; this is ordinary AI review, not a fresh independent audit or Lean verification. No originality claim. The theorem extends the previously frozen multiplicity-two square-cell model; it does NOT assert that an arbitrary graph with triangle-free heavy-edge subgraph has such a cell decomposition.

## Theorem and exact hypotheses

Let G be a finite simple graph with a family of c literal K4 cells such that:

1. EVERY actual triangle of G belongs to exactly one cell.
2. Each cell has a designated boundary C4 and its two diagonals.
3. Every diagonal belongs only to its own cell and is not a boundary edge of any cell.

Boundary edges may belong to ANY positive number of cells. There is no upper multiplicity bound, no TF assumption, and no packing-resilience assumption. Edges occurring in no triangle can be discarded without affecting the theorem. Let H be the set of all boundary edges and h=|H|.

Then

    tau(G) <= 2nu(G).

No odd-cover bound is asserted by this proof.

## 1. Auxiliary graph and exact packing identity

For each resource e in H create one terminal vertex t_e. For each cell i create two internal vertices l_i,r_i with the edge l_i r_i. The opposite boundary pairs of the cell are denoted A_i and B_i, each of size two. Join l_i to the two terminals in A_i and r_i to the two terminals in B_i. There are no other auxiliary edges. Write A for this auxiliary graph and mu(A) for its ordinary matching number.

Each cross pair consisting of one boundary edge from A_i and one from B_i is adjacent on the cell's C4 and, together with its unique closing private diagonal, forms one cell triangle. Every cell triangle arises this way.

A graph triangle packing uses at most one triangle per cell, because any two K4 triangles share an edge. It therefore gives an auxiliary matching: use the two corresponding terminal-internal edges at selected cells, and the base edge l_i r_i at every unselected cell. Its size is c plus the triangle packing size.

Conversely, canonicalize a maximum auxiliary matching cell by cell. If neither internal vertex is terminal-matched, use its base edge (which must already be possible in a maximum matching). If exactly one is terminal-matched, replace that edge by the base edge; this preserves size and frees a terminal. If both are terminal-matched, keep them. The resulting matching has c base units plus one extra for each double-terminal-matched cell. Such a cell chooses one A_i and one B_i resource and hence a triangle. Terminal disjointness prevents boundary-edge conflicts, and private diagonals prevent all other conflicts. Thus

    mu(A)=c+nu(G),
    def(A):=|V(A)|-2mu(A)=h-2nu(G).                       (1)

All four actual cell triangles, not a selected subfamily, are represented.

## 2. Actual graph endpoints exclude small-terminal odd cycles

Claim: every odd cycle of A contains at least FOUR terminal vertices.

The terminals are independent, and the internal vertices induce a matching. Thus between consecutive terminals on an auxiliary cycle there are either one or two internal vertices. A one-internal transition joins opposite boundary edges of one cell, which are DISJOINT edges of the original graph G. A two-internal transition traverses a cell base edge and joins boundary edges from different opposite pairs, which are ADJACENT edges of G.

If an auxiliary cycle has t terminals and s two-internal transitions, its length is 2t+s. Oddness means s is odd.

* With one terminal, an odd cycle would be a triangle requiring the same resource to be in both A_i and B_i, impossible.
* With two terminals, an odd cycle has one transition of each kind. The same two graph edges would be both adjacent and disjoint, impossible.
* With three terminals and one two-internal transition, label the adjacent graph edges xy and yz; the third resource uv is disjoint from both. The two opposite-pair cells have vertex sets {x,y,u,v} and {y,z,u,v}. These are distinct K4 cells containing the SAME actual triangle yuv, contrary to unique ownership.
* With three terminals and three two-internal transitions, the three original graph edges are pairwise adjacent. Three distinct pairwise adjacent edges either form a graph triangle or share one common endpoint. A triangle of boundary edges is impossible: every actual triangle belongs to a cell and contains a private diagonal. In the common-endpoint case write the edges xa,xb,xc. The cells witnessing adjacent pairs contain the private closing diagonals ab,bc,ca. Those three diagonals form an actual triangle consisting entirely of private edges, again impossible because every cell triangle has two boundary edges.

These exhaust t<=3. The two last exclusions genuinely use actual endpoint consistency and the full triangle family. They are not conclusions for arbitrary abstract resource incidence systems.

## 3. A factor-critical optimal Tutte barrier

The only imported matching theorem is the classical Tutte–Berge formula

    def(A)=max over X subset V(A) [odd(A-X)-|X|].         (2)

Here odd counts components of odd vertex order. Exact source inspected: Chudnovsky, Geelen, Gerards, Goddyn, Lohman and Seymour, *Packing non-zero A-paths in group-labelled graphs*, Combinatorica26(2006),521-532, Section3, Theorem3.1 and its proof, primary author PDF https://www.math.uwaterloo.ca/~jfgeelen/Publications/paths.pdf . Their group-labelled path theorem is NOT imported. The formula is classical, not a result of this mission.

Choose an optimizer X of (2) with maximum cardinality. Every odd component C of A-X is factor-critical, meaning that C-v has a perfect matching for every v in C. Here is the standard short derivation, included to avoid adding an unspoken barrier-structure hypothesis.

If C-v has no perfect matching, its even order implies def(C-v)>=2. Apply (2) to C-v and obtain Y subset V(C)-{v} with odd(C-v-Y)-|Y|>=2. Replacing X by X union Y union {v} removes one old odd component, adds at least |Y|+2 odd components, and adds |Y|+1 barrier vertices. Its deficiency value is at least the old optimum while its cardinality is larger, a contradiction.

A nontrivial connected factor-critical graph cannot be bipartite: deleting a vertex from one or the other side would require contradictory side sizes for a perfect matching. It therefore contains an odd cycle. By Section2, every NONTRIVIAL odd component of A-X contains at least four terminals.

An odd component with no terminal is necessarily a single internal vertex. Indeed, the subgraph induced by all internal vertices is just the disjoint union of cell base edges.

Write

    X_H = terminal vertices of X,
    X_I = internal vertices of X,
    o   = number of odd components of A-X,
    o_0 = number of its odd components with no terminal.

## 4. Random free terminals give the required cover saving

In every odd component containing terminals choose ONE terminal uniformly at random; choices can be independent. Call these o-o_0 chosen resources free. Select ALL OTHER boundary edges as cover edges. In particular every boundary resource whose terminal is in X is selected, as is every resource in an even component.

The boundary contribution to the cover size is deterministically

    h-(o-o_0)=h-o+o_0.                                   (3)

For every cell having an uncovered triangle after this boundary selection, add BOTH of its private diagonals. This always covers all four triangles in that cell. Private diagonals are distinct across cells. It remains to bound the expected private cost.

There are three cell types according to which internal vertices belong to X.

### Neither internal vertex is removed

The two internals are joined by their base edge, so they and all terminal neighbors outside X lie in one component of A-X. At most one such terminal is free. A cell triangle needs two distinct boundary edges, so no cell triangle is uncovered. Its private cost is zero.

### Both internal vertices are removed

The private cost is at most two, exactly the number of its internal vertices in X. No probability estimate is needed.

### Exactly one internal vertex is removed

Suppose l_i is removed and r_i survives, in component C. An uncovered cell triangle requires a free terminal in B_i, the side adjacent to r_i. If C is even, none is free and the cost is zero.

If C is an odd nontrivial component, let t=|V(C) intersect H| be its terminal count. Section3 gives t>=4. At most two terminals in B_i lie in C, and exactly one terminal of C is chosen uniformly. Thus

    P(B_i contains a free terminal) <= 2/t <= 1/2.

We add at most two private edges on that event and none otherwise, so the expected private cost is at most one, the number of this cell's internal vertices in X. No independence between the cell's opposite sides is assumed or needed.

The remaining case is that C consists of the single internal vertex r_i. Both its B_i terminal neighbors must then lie in X and are selected, so the cell's private cost is ZERO. Such cells are in one-to-one correspondence with the o_0 terminal-free odd components: each isolated internal vertex has its unique cell partner in X, and each such cell has just one surviving internal vertex. Relative to the usual one-unit allowance, these cells save exactly the o_0 units needed below.

Summing the three types gives

    E[private cost] <= |X_I|-o_0.                        (4)

Combine (3) and (4):

    E[cover size] <= h-o+|X_I|
                  <= h-o+|X|
                   = h-def(A)
                   = 2nu(G),                            (5)

using (2) and (1). Since the sample space is finite, some outcome gives an actual triangle edge cover of size at most 2nu(G). In fact the displayed expectation bound is 2nu(G)-|X_H|, but no further structural conclusion is needed.

This proves the theorem.

## 5. Scope and remaining global link

The multiplicity-two transition-circuit proof already handled cells whose boundary resources each have two owners. The present matching/barrier proof permits every positive boundary multiplicity and also permits boundary resources private to a cell. It does not require uniform degrees or a bound on the number of cells meeting a vertex or edge.

The proof gives an ordinary cover. Its randomly chosen boundary set need not satisfy the even boundary parity required by an odd triangle cover, so pi(G)<=2nu(G) is NOT concluded.

For the broader triangle-free-heavy-edge gate, the remaining availability issue is substantial: general codegree-two light edges produce two-page diamonds, and these need not complete to K4 cells with BOTH private diagonals. Triangles with zero or one heavy edge are also possible in that broader gate. Nothing here supplies the missing global decomposition or eliminates these families.

No finite census or Lean verification was used. Root's ordinary reconstruction and any subsequent fresh review should be recorded separately rather than folded into an unsupported formal-verification claim.
