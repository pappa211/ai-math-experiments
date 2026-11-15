# Independent multi-cones are never triangle-full

Status: complete all-size ordinary proof; root reconstruction requested. This excludes the entire class from the strengthened minimal-counterexample gate TF. It does not prove the original criticality-plus-two-edge-resilience parity gate for this class. No novelty, Lean or human-verification claim is made.

Original TUZA-19 clock: start 2026-11-15 01:53:58 UTC, research cutoff 09:23:58 UTC, hard deadline 09:53:58 UTC. Work was local on the owner's Darwin host. Requested configuration Astra/Ultra; exact serving model and effort are not exposed and are not asserted.

## 1. Class and exact triangle ownership

Let R be a finite triangle-free graph, let A be an independent set of s>=1 fresh vertices, and let G=A join R. Insert every spoke av with a in A and v in V(R), retaining R's edges and no edges inside A. Connectivity of R is not needed for the exclusion theorem. Assume E(R) is nonempty when asserting failure of TF.

Every actual triangle is exactly a uv, with a in A and uv in E(R). There are no triangles inside either part, and no triangle has two vertices in A. Thus the entire cover problem is determined by these spoke-plus-rim constraints.

For an edge cover C of these triangles, write

- F=C intersect E(R), its selected rim edges;
- S_a={v:av belongs to C}, its selected spoke vertices at apex a.

Then C covers all actual triangles if and only if each S_a is a vertex cover of R-F. There is no further constraint from old rim triangles, because R is triangle-free.

## 2. Rigid structure of every minimum ordinary cover

**Lemma.** If C is a minimum triangle cover of G, then:

1. Every S_a is a minimum vertex cover of R-F, and all have the same cardinality.
2. No selected rim edge has an endpoint in any S_a.
3. For every a, `F=E(R[V(R) minus S_a])`.

**Proof.** If some S_a were not minimum for R-F, replacing only that apex's selected spokes by a smaller vertex cover would reduce C. This proves (1).

For (2), suppose uv is in F and at least one of u,v lies in S_a for some apex a. Replace the selected spoke set at EVERY apex by the same set S_a. By (1), the total number of selected spokes is unchanged. The resulting set still covers every triangle: all rim edges outside F meet S_a, and every edge in F is selected. Now remove the selected rim edge uv. Its triangles at every apex remain covered by the copied endpoint spoke, while all other triangles are unaffected. This gives a cover smaller than C, a contradiction.

Every edge whose endpoints both lie outside S_a must lie in F, because otherwise its apex-a triangle is uncovered. Conversely, (2) says every F-edge has both endpoints outside S_a. This proves (3). QED.

The replication step is valid even when distinct apices initially use different minimum vertex covers. Equal cardinality is sufficient; agreement of their vertex sets is not assumed. The old-rim triangle-free hypothesis is essential when discarding uv.

## 3. All-size TF exclusion

**Theorem.** No minimum triangle cover of G contains all three edges of any actual triangle. More precisely, every triangle meets every minimum cover in either one or two edges, never three.

**Proof.** For T=a uv, if uv belongs to F, Lemma 2(2) excludes both spoke endpoints from S_a. Thus T has exactly one selected edge. If uv does not belong to F, S_a covers uv, so T has one or two selected spokes. These cases exhaust every actual triangle. QED.

Recall TF is the assertion that for every actual triangle T,

`tau(G-E(T))=tau(G)-3`,

equivalently that SOME minimum triangle cover contains all three edges of T. The equivalence is immediate by deleting E(T) from a containing minimum cover, or adjoining E(T) to a minimum cover of the deleted graph. Therefore any nontrivial independent multi-cone over a triangle-free rim fails TF for EVERY triangle. Indeed the strict integer bound is

`tau(G-E(T))>=tau(G)-2` for every actual triangle T.

No cover-criticality or packing-resilience premise is used. Thus the entire class is unavailable as a minimal Tuza counterexample under root's separately proved TF necessity. This is the structural closure reached in this lane; the original H-O2 question without TF is left open.

The theorem also does not assert that a minimum odd cover exists. Since three selected edges are impossible in a minimum cover, a minimum cover is odd precisely when it meets every triangle exactly once. Cone examples with a genuine pi-tau gap remain compatible with this exclusion.

## 4. Exact optimization formulas and their scopes

For completeness, the formulas motivating the lane can be derived directly.

A triangle packing is equivalent to assigning each selected rim edge to an apex, with each apex's assigned edges a matching. Distinct apex matchings must be edge-disjoint, because two triangles on the same rim edge conflict. Thus, writing nu_s(R) for the maximum size of a properly s-edge-colorable subgraph,

`nu(G)=nu_s(R)`.

For ordinary covers, fixing F gives cost `|F|+s*vc(R-F)`. Equivalently,

`tau(G)=min_(S subset V(R)) [s|S|+e(R[V(R) minus S])]`.

One direction uses S at every apex and selects all rim edges outside S. For the other, replicate a smallest apex spoke set of an arbitrary cover at all apices, then discard every selected rim edge incident with that set. The cost cannot increase. Lemma 2 gives the stronger structure for EVERY minimum cover.

When R is connected, the odd-cover formula is

`pi(G)=min_(S subset V(R)) [s*min(|S|,n-|S|)+e(R[S])+e(R[V(R) minus S])]`.

To see this, let x_a(v) be spoke indicators. A triangle forces its rim indicator to be `1+x_a(u)+x_a(v)` over F2. For any apices a,b, the difference x_a+x_b is constant along every rim edge, hence constant on connected R. Their spoke patterns therefore agree or are complements. Fixing one pattern S fixes precisely the same-side rim edges, and each apex may independently choose the cheaper of S and its complement. This gives both directions. For disconnected R, this reasoning applies separately to each rim component rather than requiring one global complement choice.

These exact formulas do not bypass the TF exclusion: optimizing the parity cost and proving two-edge resilience in an unsaturated matching instance would still produce a graph outside TF.

## 5. Strong necessary identities for TWO apices

The following observations were obtained before the TF exclusion and are retained because they sharpen the unsaturated-capacity condition. Let s=2, name the apices a,b, and suppose G is two-edge packing-resilient. Put `k=nu_2(R)`.

**Proposition A (every vertex is avoidable).** For every v in V(R),

`nu_2(R-v)=k`.

Delete the two spokes av,bv. All surviving triangles correspond exactly to two disjoint matchings in R-v; rim edges incident with v then lie in no triangle. Resilience gives equality.

**Proposition B (every rim edge can stand alone).** For every uv in E(R),

`nu_2(R-{u,v})=k-1`.

Moreover, some maximum two-edge-colored subgraph has uv as an isolated K2 component.

Delete spokes au,av and take a surviving maximum packing, represented by matchings M_a,M_b. M_a avoids both endpoints. If uv were absent from M_b, adding uv to M_a would augment the original packing, contradicting maximal cardinality k. Thus uv belongs to M_b. Matching disjointness makes it the only selected edge at either u or v. Removing it leaves k-1 edges in R-{u,v}. Conversely any two-colored subgraph there can be augmented by uv in one color, so its size is at most k-1. This proves both statements.

**Proposition C (every rim edge closes an odd alternating cycle).** For every uv in E(R), some maximum two-edge-colored subgraph has u,v as the endpoints of one even-length alternating path, and does not select uv. Adding uv to that path forms an odd cycle. In particular every rim edge belongs to an odd cycle; if R is triangle-free, that cycle has length at least five.

Delete spokes au,bv and take a surviving maximum packing M_a,M_b. The edge uv cannot occur in either matching. At u, M_a is absent, and at v, M_b is absent. If u also lacked M_b, then uv could be added to M_b; if v lacked M_a, it could be added to M_a. Hence both vertices have degree one in the selected subgraph, with different colors on their incident edges.

If they were in distinct components, swap the two colors on u's path component. Both endpoints would then lack the same color, so adding uv would augment the packing. Therefore they are the two endpoints of the same alternating path. Different endpoint-edge colors make its length even. Adding uv creates an odd cycle, as claimed.

**Consequences.** With two apices, any rim edge outside all odd cycles yields a two-spoke blocker. In particular no nonempty bipartite rim gives a two-edge-resilient independent double-cone. For even n, Proposition A also yields `k<=n-2`; for odd n, Proposition B yields `k<=n-2`, using `nu_2(Q)<=2*floor(|V(Q)|/2)` in the relevant deleted graph. These strengthen the global saturation obstruction but do not classify all resilient double-cones.

The analogous easy necessary statement for arbitrary s is: for every rim edge uv and every chosen apex/color i, resilience gives a maximum s-colored subgraph in which u and v both miss color i and uv occurs in another color. Otherwise uv could be added in color i. Thus both endpoints have selected degree at most s-1 in such a maximum state. For s=1 this is impossible, recovering the ordinary cone blocker.

## 6. Decision and provenance

The initial task was to prove the parity inequality for every two-edge-resilient independent multi-cone, or find a genuine unsaturated-capacity counterexample. Neither was obtained. No general claim is made about the compatibility of Propositions A-C, and the difficult unsaturated matching/edge-coloring problem is not declared solved.

The TF exclusion supplies the relevant all-size closure for the stronger minimal-counterexample gate and ends this lane. No broad graph census was run. A proposed additional Kalbfleisch s=7,8 computation was cancelled before execution after root observed it was unnecessary: three explicit Hamiltonian distance cycles already supply enough matchings for the simple all-rim parity cover to establish the inequality at larger s, while small s saturates the matching bound. No new finite Kalbfleisch certificate is claimed here.

Mathematical sources consulted were the current scoped notes `parity_gadget_constraints.md`, `global_routes_nonsaturation_addendum.md`, `global_routes_parity_gate.md`, and `root_triangle_full_criticality.md`, together with explicit coordination messages from root/global_routes. The proofs in Sections 1-5 above are elementary reconstructions and import no external theorem. Source hashes and this note's hash are preserved in `evidence/independent_multicone/provenance.json`.
