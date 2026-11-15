# Fresh audit: four-branch WKE and high-codegree five-core localization

**Verdict: PASS for the four-branch theorem, the complete finite reduction, and the stated defect-localization inequality.** I independently reconstructed every reduction before reading the full note, regenerated the finite domain, and verified every supplied literal witness without reading or importing the producer's search code. There is one terminology clarification in a secondary corollary, recorded below. No unresolved mathematical objection affects the main results.

This is ordinary AI mathematical reconstruction plus independent exhaustive certificate verification. It is not an all-size Lean theorem, a human review, an originality judgment, or an unrestricted Tuza proof. No Lean process was run in this lane.

## Frozen inputs and independence

The full proof input was `notes/root_four_branch_wke.md`, SHA-256

`67011b7544cd8d8c516a738572c10f5d828b5631c3d8ce491fcd08ae3f71ce99`.

The literal finite certificate was `evidence/four_branch_wke/canonical_witnesses.json`, SHA-256

`e69818bb2599b6b934dd945f3b6cd0305f6718c3d2fe165ea9f7f6d1bfe17cc1`.

Its unchanged snapshot is `evidence/four_branch_wke_fresh/canonical_witnesses_input.json`. The producer's status/count fields and optimization routine are not trusted: the fresh checker reconstructs the entire domain from the mathematical five-state rule and checks each M,Q directly. It reads no producer code.


## Exact property and theorem

A WKE witness for L consists of a matching M and a vertex set Q such that every edge outside M has an endpoint in Q and `|Q|<=|M|`. Q may contain endpoints of M; no disjointness between these objects is required.

The theorem is that every finite SIMPLE L with at most four vertices of degree at least three has such a witness, without a bound on the degrees of those vertices or on the number of degree-two vertices. The finite kernels alone would not establish this assertion: the reduction and lifting proof is essential.

## Local extension principles

Witnesses on vertex-disjoint components combine by union. More generally, if a removed vertex set S has a local witness whose Q contains every S-vertex adjacent to the remainder, it can be combined with a witness on L-S. Boundary-crossing edges are covered by the selected boundary vertices, and the matching parts use disjoint vertex sets.

An isolated vertex contributes nothing. For a leaf x with neighbour v, delete both and add matching edge vx and cover vertex v to a witness of the remainder. All other edges touching the deleted set meet v. Both sizes increase by one. Vertex deletion never increases the number of vertices of degree at least three.

### Subdividing an edge by two fresh vertices

Replace uv by u-a-b-v.

- If uv belongs to M, replace it in M by ua,bv and add a to Q. The only new nonmatching edge is ab, which a covers. The matching size and cover size each increase by one.
- If uv does not belong to M, at least one endpoint belongs to Q. Keep the old matching and add ab. If u is selected, add b; otherwise v is selected and add a. All three path edges are then covered or matched, and both sizes increase by one.

Every old Q membership is preserved. This is the precise condition needed when a local cycle/path witness has marked branch endpoints that must remain selected. The fresh checker's slightly stronger version omits the redundant new Q vertex when BOTH endpoints already belong to Q; adding it as in the frozen proof remains within the same budget and is valid.

## Suppression and deletion completeness

After isolates and leaves are removed, assume the current connected graph has minimum degree two. With no branch vertex it is a cycle. Otherwise following a branch edge through degree-two vertices must reach a branch again, possibly the original one. A degree-two interior cannot have an external contact, and interiors of different maximal paths are disjoint. Hence the graph is exactly a subdivision of a multigraph on its branch vertices, where loops represent returning paths. This is only a structural representation: the finite certificates still concern simple expanded graphs.

### Returning path

A loop is an actual simple cycle containing just one branch v. Its length is at least three. An odd cycle is obtained from a triangle by repeated two-vertex subdivisions, and an even cycle from C4. Each base has a witness with v selected: for C3 use the opposite edge as M and `{v}` as Q; for C4 `v-a-b-c-v`, use `M={va,bc}`, `Q={v,b}`. Subdivision retains v in Q.

Delete all vertices of the returning cycle, including v. Only v can have edges to the remainder, and it is selected. The rest has strictly fewer vertices and at most three branches, so induction applies. There is no omitted outside edge at a cycle interior.

### Parallel paths with both endpoints selected

The following bases have the required `Q={u,v}`:

| Path lengths | Base paths | M |
|---|---|---|
| 2 and 2 | u-x-v, u-y-v | ux,vy |
| 2 and 3 | u-x-v, u-y-z-v | ux,yz |
| 3 and 3 | u-x-y-v, u-z-w-v | xy,zw |
| 1 and 3 | uv, u-x-y-v | uv,xy |

Each M is a two-edge matching, and every remaining edge meets u or v. These cover all parities of two nondirect paths, and the direct-plus-odd case. Repeated two-vertex subdivisions restore arbitrary corresponding lengths and preserve both marked endpoints.

Delete u,v and the chosen path interiors. Every boundary edge meets u or v. Other parallel paths may remain as paths whose endpoints were removed; they belong to the remainder and cause no conflict. If a direct edge was not part of the chosen two nondirect paths, it also meets selected u,v and is covered. The remainder has fewer vertices and at most two branches. Combining with induction is valid.

Simplicity permits at most one direct uv edge. Thus three or more parallel paths include at least two nondirect ones and are reducible. With two paths, the only retained pattern is direct plus EVEN nondirect. Its minimal form is a triangle with adjacent marked vertices u,v, for which a local witness requiring both selected is impossible: a matching has size at most one but Q would have size at least two. Keeping this state is necessary, not an omission.

## Exhaustiveness of the five-state finite domain

After the reductions, no loop remains. For each pair of the at most four branches, the possibilities are exactly:

`0, D, E2, O3, D+E2`.

There is at most one nondirect path per pair. An odd nondirect path is shortened to length three and an even one to length two; shortening removes pairs of interior vertices, so lifting back uses only the established subdivision operation. Each internal vertex in a canonical path is fresh and has degree two. The original branch degrees are preserved: D,E2,O3 contribute one at each endpoint, D+E2 contributes two. Thus every branch has degree at least three in the canonical graph.

Conversely every unreduced graph determines one of these state vectors with the degree condition, and is recovered by the stated even subdivisions. No bound on original branch degree is assumed: a high degree forces one of the already removable loops or parallel configurations, or reduces to degree at most six in the finite domain.

The fresh verifier independently enumerated

`5^0+5^1+5^3+5^6=15,756`

raw vectors on one through four labelled branches. The degree condition gives no one- or two-branch vectors, ten three-branch vectors, and 5,365 four-branch vectors. All 5,375 keys occur exactly once in the supplied certificate and no extra key occurs. Their reconstructed edge lists and vertex counts agree exactly. Maximum order is sixteen and maximum edge count eighteen.

For EVERY certificate, the fresh verifier checked:

- M is a subset of the reconstructed edges and its edges have disjoint endpoints;
- Q consists of reconstructed vertices;
- every reconstructed edge outside M meets Q;
- `|Q|<=|M|`.

The witness slack `|M|-|Q|` is zero for 2,451 kernels, one for 2,190 and two for 734. No optimization result or SAT return value is needed once these literal conditions hold.

The checker also validates all six marked local bases (odd/even loop, the three nondirect parity bases, and direct-plus-odd), twenty iterated subdivisions for each, and the subdivision rule on every edge of every finite witness. All checks passed.

Strong induction on the graph's number of vertices, the local deletion principles, this complete domain, and lifting prove the all-size theorem.

## Global defect localization reconstructed directly

Let v be a vertex of the current graph G and `L=G[N(v)]`. For u in N(v), its degree in L equals the number of actual triangles containing edge vu. Thus at most four incident graph edges of triangle codegree at least three means that L has at most four branches, regardless of its size or maximum degree.

Take a WKE witness M,Q for L, and let `G'=G-v-M`, ignoring isolated vertices. The apex triangles `{vxy:xy in M}` are edge-disjoint and avoid every edge of G', so

`nu(G)>=nu(G')+|M|`.

Given a cover of G', add M and the spokes `{vq:q in Q}`. An old triangle using an M-edge is covered by that edge. An apex triangle has its base in M, or its base lies in L-M and hence meets Q. All other triangles remain in G'. Therefore

`tau(G)<=tau(G')+|M|+|Q|<=tau(G')+2|M|`.

Subtracting yields exactly

`tau(G)-2nu(G)<=tau(G')-2nu(G')`.

This is a valid inequality for the constructed residual graph; it does not assume monotonicity of the defect under arbitrary edge deletion.

Let H3 be the ORIGINAL graph of edges of triangle codegree at least three, and let K be the vertex set of its ordinary five-core. Repeatedly apply the reduction where available. Codegrees never increase under its vertex/edge deletions. In a nonempty terminal residual graph, each vertex has at least five incident current edges of codegree at least three. Those edges belong to original H3, giving an original-H3 subgraph of minimum degree at least five. Therefore every terminal vertex lies in K, and the actual residual R is a subgraph of G[K]. It need not be induced and may have additional matching edges removed. In particular lower-codegree edges between surviving vertices are not discarded merely because they were outside H3.

Consequently an empty original five-core proves Tuza constructively. A genuine minimal counterexample must have at least five incident codegree-at-least-three edges at every vertex. The theorem does not resolve a nonempty residual core.

### A further componentwise consequence

A WKE COMPONENT of a link can also be removed on its own. Delete only the spokes from v to that component and its matching edges. No link edge joins that component to another, so the same cover extension and packing extension prove the defect inequality. Hence in an edge-reduction-free graph, every nontrivial link component must itself have at least five vertices of link degree at least three. An isolated link vertex gives a triangle-free spoke that can be deleted at zero cost. This is a separately audited consequence; it is not required for the frozen theorem.

## Preserved clarification and limits

The frozen note says that any “hereditary Tuza-sufficient condition” on G[K] suffices. This should say **subgraph-closed**, explicitly including edge deletion, or assume Tuza for every subgraph of G[K]. The word hereditary often means only induced-subgraph-closed, which would not suffice: the residual R need not be induced. This terminology issue does not affect the stated R-subgraph inequality, the empty-five-core corollary, or the necessary condition for minimal counterexamples.

The threshold four is sharp for the WKE statement itself: K5 has five branch vertices and no WKE witness. Any matching has at most two edges, while deleting a matching from K5 leaves a graph of vertex-cover number at least three. This control does not address the more structured links of hypothetical Tuza violations.

No other objection was found. Source attribution or originality relative to Puleo/Tsujimura was not audited here; the mathematical reduction was reconstructed without importing a source theorem. The finite verifier proves the fixed kernel obligations, while the all-size scope rests on the ordinary reduction proof. Any separate formal finite-domain result must retain that distinction.

## Reproduction and provenance

Run locally in the TUZA-19 workspace:

```sh
source LOCAL_ENVIRONMENT
python3 review/four_branch_wke_fresh_verify.py
```

Evidence is under `evidence/four_branch_wke_fresh/`, including unchanged proof/certificate snapshots, the complete independent result receipt, provenance and manifest. The first run of the fresh verifier passed. No producer search code, external optimizer, remote computation or Lean was used.

The original clock remains start 2026-11-15 01:53:58 UTC, research cutoff 09:23:58 UTC, hard deadline 09:53:58 UTC. Requested controls Astra/Ultra; exact serving metadata is not exposed and is not asserted. All computation was local Darwin. This is AI review and finite verification, not human or full formal verification.
