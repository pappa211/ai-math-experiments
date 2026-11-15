# Fresh independent audit: odd triangle covers of ordinary line graphs

**Verdict: the stated all-size theorem is correct.** For every finite simple graph H, the proof constructs an odd triangle cover C of L(H) and an edge-disjoint triangle packing P with `|C|<=2|P|`. Consequently `pi(L(H))<=2nu(L(H))`. I found no mathematical gap or counterexample. This is an ordinary proof with an independent AI reconstruction and finite constructive checks, not a formal or human verification claim. No originality judgment is made.

## Frozen input and independence

The sole mathematical input was `notes/root_line_graph_parity.md`, SHA-256 `65f65ed45fb9920b39c72491243eccc7ba880add1a1f1256b4e86c65d1ebd0f1`, matching the declared input manifest. An unchanged snapshot is preserved at `evidence/line_graph_parity_fresh/input_statement.md`. No producer checker, result, research log, or favorable review was read. The proof declares only Euler tours, elementary parity and its explicit local clique construction as dependencies; the reconstruction below verifies their uses directly.

All computation ran on the owner's local Darwin arm64 host with the pinned Python 3.12.12 environment, using only Python's standard library. The mission retains start 2026-11-15 01:53:58 UTC, research cutoff 09:23:58 UTC and hard deadline 09:53:58 UTC. This review began approximately 03:21:45 UTC. The requested configuration was Astra/Ultra; exact serving metadata is not exposed and is not asserted. No Lean or remote computation was used.

## Exact statement and what the construction must establish

An odd triangle cover is a subset of line-graph edges intersecting each actual triangle in one or three edges. Producing a cover and packing with `|C|<=2|P|` suffices: P need not be maximum, because `|P|<=nu`. This is what the proof actually does. It does not compute either optimum exactly and does not assume criticality, resilience, a common vertex, or any restriction on H beyond finite simplicity.

The ordinary line-graph definition is essential. A line-graph vertex is an edge of H. Two line vertices are adjacent exactly when their distinct H-edges share an endpoint. Simplicity ensures that two distinct H-edges have at most one common endpoint. Therefore every line-graph edge belongs to exactly one star-clique indexed by a vertex of H. Local packed triangles may share line vertices, which is allowed; they cannot share line edges across distinct star-cliques.

## Complete reconstruction of the clique packing lemma

Put `q(d)=choose(floor(d/2),2)+choose(ceil(d/2),2)`.

For `d=2t`, partition the clique vertices as `A_i,B_i` indexed modulo t, and choose `A_i A_j B_(i+j)` for every unordered pair `i!=j`. No A-A edge repeats. If the cross edge `A_i B_k` occurs, its other A-index must be `j=k-i`, which is unique. No B-B edge occurs. Thus these are `t(t-1)/2=q(2t)/2` edge-disjoint triangles. For any prescribed edge and `d>=4`, placing its endpoints in B makes the whole packing avoid it. The case `d=2` uses the empty packing and also avoids its sole edge. For `d=0`, there is no prescribed edge and the claim is vacuous. No modulo-zero expression must be evaluated in the empty case.

For `d=2t+1`, take that packing and a fresh vertex w. The cross edge `A_i B_(2i)` was unused: in the even construction it would require the excluded choice `j=i`. A new triangle `w A_i B_(2i)` therefore cannot conflict with the old packing. The new w-A edges are distinct. The new w-B edges are distinct exactly when the selected residues `2i` are distinct.

If t is odd, multiplication by two is invertible modulo t, so all t new triangles are disjoint. The packing has `t(t+1)/2` members and twice that count is `t^2+t>=q(2t+1)=t^2`. If t is positive and even, indices `0,...,t/2-1` have distinct doubled residues `0,2,...,t-2`. The total is `t(t-1)/2+t/2=t^2/2`, giving equality with q after doubling. The case `d=1` is empty. Thus every local bound, including the small-degree cases, holds exactly as needed.

This lemma deliberately does not assert the exact complete-graph packing number. Its possibly nonoptimal local packing is sufficient.

## All actual triangles of L(H)

Take three pairwise incident distinct H-edges. If they have a common endpoint, their line triangle is in its star-clique. Otherwise choose two as `ab,ac`. Their third edge must meet each, and, to avoid the shared endpoint a, it must be `bc`. Hence the three root edges form an actual triangle of H. These cases are exclusive and exhaustive for simple H.

In particular, star triangles are the only line triangles when H is triangle-free. When H has triangles, their cycle triangles cannot be ignored; the proof handles them either by a single global coloring or by the extra packing argument below.

## Euler alternation, including the starting-vertex defect

Any two-coloring of E(H) is a vertex coloring of L(H). Selecting monochromatic line edges gives one selected edge in a triangle colored two-versus-one, or all three in a monochromatic triangle. Thus it always gives an odd cover of every actual line triangle, including cycle triangles. Its size is

`sum_v [choose(r_v,2)+choose(b_v,2)]`,

because each line edge belongs to one star-clique.

For a connected H with odd-degree vertices, their number is positive and even. Add a new vertex joined once to each of them. All augmented degrees are even, and the augmentation remains connected, so an Euler tour exists. Start the tour at the new vertex and alternate colors along its edge sequence. At every original vertex, its arriving and departing edges are paired consecutively in the sequence and have opposite colors. This holds whether the augmented edge count is even or odd. If it is odd, the only exceptional first/last pair occurs at the dummy start vertex. Deleting the added edge at each originally odd vertex leaves color-count difference one; all originally even vertices remain balanced. The cover size is exactly `sum_v q(d(v))`.

For a connected Eulerian H with an even number of edges, first and last tour edges have opposite colors, so all vertices are balanced and the same formula holds.

For a connected Eulerian H with an odd number of edges, first and last edges have the same color. At the chosen start vertex of degree `2t`, the split is `t+1,t-1`; all other vertices are balanced. The local difference from the balanced cost is

`choose(t+1,2)+choose(t-1,2)-2*choose(t,2)=1`.

Thus the monochromatic-edge cover has exactly `sum_v q(d(v))+1` edges. This is the sole deficit that requires a further argument.

In the first two branches, union the clique packings proved above. Their edge-disjointness gives a packing P with `2|P|>=sum_v q(d(v))`, immediately paying the odd cover. The augmented coloring does not constrain which local packings are used.

## The odd Eulerian branch

Every root degree is even, so each local packing can be chosen to have exactly `q(d(v))/2` members. These quantities are integers because `q(2t)=t(t-1)` is even. Let their total be p.

If H contains an actual triangle abc, its three root edges define a cycle triangle Q in L(H). Q uses exactly one line edge in each of the star-cliques at a,b,c. At each such vertex choose the even-clique packing avoiding that one prescribed line edge. If its degree is two, the empty local packing already avoids it; if its degree is at least four, place the prescribed endpoints in B. These are independent choices because the star-clique edge sets are disjoint. All local packing sizes remain unchanged. Q is therefore edge-disjoint from their entire union, yielding a packing of `p+1` triangles. The global Euler coloring produces an odd cover of size `2p+1<=2(p+1)<=2nu`.

If H is triangle-free, every actual line triangle lies in one star-clique. Choose a balanced bipartition separately in each star-clique and select that clique's monochromatic edges. These choices need not agree on colors of shared line vertices; only the selected line edges matter, and those belong to unique cliques. Every actual triangle remains oddly covered inside its own clique. The union has exactly `sum_v q(d(v))=2p` edges. This is a valid odd cover even when no globally balanced two-coloring of root edges exists.

There is no missing third case. The distinction is whether H has any actual triangle, not whether it is bipartite, whether it has an odd cycle of greater length, or whether every root edge is in a triangle.

## Components and scope

Disconnected H is handled independently on each component. No line triangle crosses components; cover sizes and packing sizes add. Isolated root vertices contribute nothing, and isolated root edges produce isolated line vertices with no triangle constraints. The construction therefore covers every finite simple H, including empty graphs.

The result closes ordinary line graphs as counterexamples to the odd-cover inequality under investigation. It does not prove that an arbitrary graph, a minimal Tuza violation, or a triangle-intersection graph has this form. It supplies no transfer to line graphs and no unrestricted Tuza result. The proof also does not address line graphs of multigraphs, where the uniqueness of the star-clique owning a line edge can fail.

## Independent finite reconstruction

`review/line_graph_parity_fresh_verify.py` constructs the local clique packings, an Euler tour when required, the odd cover, and the additional cycle triangle when required. It then validates the output against literal line-graph edges and all actual line triangles, independently of the construction rationale. It checks every proposed packed triangle, all pairwise packing-edge exclusions, odd intersection with every actual triangle, and the cardinality inequality.

The completed run passed:

- All 33,868 labelled simple root graphs on zero through six vertices.
- 300 seeded random larger roots on seven through sixteen vertices.
- Complete roots K3, K7, K11 and K15, targeting odd Eulerian roots with cycle triangles.
- Odd cycles of lengths 5,7,9,15,31, targeting the triangle-free local-coloring branch.
- 599 separate clique-packing/avoidance cases covering all degrees zero through 100, with all prescribed edges tested for even degrees through sixteen and selected prescribed edges at larger degrees.

In total, 34,177 root graphs and 366,557 literal line triangles were checked. All four nontrivial structural branches were exercised. These are finite construction checks, not exact pi/nu computations and not a graph census establishing the all-size theorem by itself. The all-size conclusion rests on the reconstructed proof above.

## Objections and provenance

No mathematical objection remains, and no failing mathematical case was found. Two potential failure points were explicitly challenged and resolved: an odd augmented Euler tour is harmless only because it starts at the dummy vertex; independent local star colorings are valid only in the triangle-free-root branch. The proof satisfies both conditions. The prescribed-edge avoidance at degree two and disjointness of the new w-edges were also checked explicitly.

The independent verifier passed on its first full run. No producer data was used as an expected answer. The only fixed input assertion is the frozen proof hash.

Reproduce on the owner Mac from the TUZA-19 workspace:

```sh
source LOCAL_ENVIRONMENT
python3 review/line_graph_parity_fresh_verify.py
```

Evidence is in `evidence/line_graph_parity_fresh/verification.json`, with representative literal certificates, counts, source and verifier hashes, Python and host metadata. `provenance.json` records input isolation and the mission clock. `manifest.json` hashes the preserved audit files.
