# TF and non-WKE link components do not force the odd-cover bound

Status: independently reconstructed ordinary counterconstruction. The proposed gate “TF plus no WKE link component implies pi<=2nu” is false. This is a structural consequence of the earlier probabilistic K5-incidence existence lemma, not a new large-graph search or a retained literal large finite witness. The local K11 facts have explicit finite certificates. No novelty, Lean or human-verification claim is made.

## Exact theorem and construction

Take the connected K5-incidence graph H supplied by the existing existence lemma with L=6. Write n=|V(H)|, b for its number of K5 blocks, and mu=mu(H). The needed properties are:

- Block edge sets are disjoint; every actual triangle lies in one K5 block.
- Distinct blocks meet in at most one vertex, and no cross-block triangle occurs.
- H has TF, tau(H)=4b and nu(H)=2b.
- Every vertex coloring of H has more than `4b+12n` monochromatic edges, so `tau_B(H)>4b+12n`.

This finite H exists by the already reconstructed probabilistic incidence lemma. Its frozen source is `evidence/binary_tf/cut_obstruction_input.md`; the full existence proof and its limits are in `notes/binary_tf_cone_decoration_obstruction.md`. No new incidence search is used here.

Add a cone apex a adjacent to every H-vertex. On each spoke av attach a fresh K11 with that edge as root, adding nine fresh vertices. Fresh sets are disjoint, and no additional edges are inserted. Call the result W.

Then W has TF, EVERY vertex link is connected and non-WKE, and

`|V(W)|=10n+1`, `|E(W)|=10b+55n`, `triangles(W)=20b+165n`,

`nu(W)=17n+2b+mu`,

`tau(W)=25n+4b`,

`pi(W)=25n+tau_B(H)>37n+4b`.

Since `2mu<=n`,

`pi(W)-2nu(W)>3n-2mu>=2n>0`.

Thus the proposed global gate fails, even though ordinary Tuza holds with slack `2nu(W)-tau(W)=9n+2mu`. The original two-spoke packing blocker survives, so this is NOT a counterexample to the gate that additionally requires two-edge packing resilience.

## 1. Complete triangle ownership

Every actual W-triangle is exactly one of:

1. An H-triangle (there are 10b).
2. A cone triangle auv for an H-edge uv (there are 10b).
3. A triangle wholly inside one attached K11 (there are 165 per block).

A fresh vertex has neighbours only in its block, so it creates no further interface triangle. Each block has only two old vertices a,v; hence all 165 of its triangles are new. The edge sets E(H) and the n full K11 edge sets partition E(W). These statements also prove the displayed vertex, edge and triangle counts.

## 2. Exact local K11 certificates

A K11 has 55 edges and even degree ten at each vertex. Eighteen edge-disjoint triangles would leave one edge, impossible because an edge-disjoint triangle union has even degree everywhere. Thus its packing number is at most seventeen.

The following seventeen triangles give equality, with labels 0 through 10:

`012, 036, 048, 057, 138, 156, 237, 246,`

`349, 35(10), 259, 28(10), 689, 67(10), 179, 14(10), 09(10)`.

Parenthesized 10 is one vertex, not two digits. The certificate JSON retains unambiguous integer triples. Their uncovered edges are exactly `45,47,58,78`, a four-cycle. Relabeling any specified root edge onto 45 supplies a seventeen-packing avoiding that root. Therefore local maximum packings avoiding roots exist without any two-edge-resilience assumption on K11.

A triangle-free graph on eleven vertices has at most thirty edges. For completeness, on each edge xy, triangle-freeness gives `deg(x)+deg(y)<=11`; summing and applying Cauchy yields `m<=121/4`, hence integer m<=30. Thus a triangle cover of K11 needs at least `55-30=25` edges. A 5+6 vertex partition attains twenty-five by selecting its internal edges. Every triangle meets this cover in one or three edges, so the same optimum holds for odd covers.

Both values of a prescribed root edge occur among these balanced-partition covers. Any specified triangle can be placed wholly in one part, giving a minimum cover containing it. The root value of that chosen containing cover is whatever the partition dictates; the TF argument below tolerates either value.

`checks/tf_nonwke_link_k11.py` checks the seventeen triangles directly, root-avoidance for all fifty-five possible roots, all 462 balanced covers, and a containing minimum cover for every one of the 165 triangles.

## 3. Exact cover identities and TF

The edge partition gives `tau(W)>=tau(H)+25n`. For equality choose a minimum H-cover and a minimum root-containing cover in every K11. The selected spokes cover all cone triangles. Hence

`tau(W)=25n+4b`.

To contain an old H-triangle, choose its containing minimum H-cover. To contain a cone triangle auv, choose a minimum H-cover containing uv (available by TF because uv lies in an H-triangle), and select all roots. To contain a local K11 triangle, use a local minimum cover containing it, select every other root, and use any minimum H-cover. If the special root av is unselected, every cone triangle avw still meets its other selected spoke aw. Each resulting cover has exactly `25n+4b` edges. These cases exhaust all actual triangles, so W has TF.

For an odd cover of cone(H), let x_v indicate spoke av. The triangle auv forces

`c_uv=1+x_u+x_v` over F2.

The old H-edge indicators are therefore exactly the monochromatic-edge indicators of a vertex coloring of H; all old H-triangle equations are then automatic. A K11 block with fixed root indicator x_v needs twenty-five total odd-cover edges and can attain that value. Its NEW edges cost `25-x_v`. Adding all block costs cancels the spoke objective:

`sum_H c_uv + sum_v x_v + sum_v(25-x_v) = 25n+sum_H c_uv`.

All local states extend independently by the complete triangle classification. Both lower and upper bounds follow, yielding

`pi(W)=25n+tau_B(H)`.

## 4. Exact packing identity and explicit failure of two-edge resilience

For any matching M in H, at most two of its edges lie in one K5 block. K5 retains a two-triangle packing after any two edge deletions: deleted adjacent 01,02 permit 034 and 123; deleted disjoint 01,23 permit 024 and 134. Therefore each H-block can pack two triangles avoiding its M-edges. Adding apex triangles on a maximum H-matching gives

`nu(cone(H))=2b+mu(H)`;

the opposite bound follows by splitting any packing into old H-triangles and apex triangles.

Each K11 contributes at most seventeen local triangles. Conversely its root-avoiding seventeen-packing can be combined with any cone packing. Hence

`nu(W)=17n+2b+mu(H)`.

The same root-avoidance argument works after deleting original cone edges. For any H-edge uv, deleting spokes au,av gives

`nu(W-{au,av})=17n+2b+mu(H-{u,v})`.

A matching of H-{u,v} can be adjoined to uv, so `mu(H-{u,v})<=mu(H)-1`. Thus this explicit two-edge set lowers nu(W). Decoration does not repair that blocker.

## 5. Every link is connected and non-WKE

Recall WKE means there exists a matching M and a vertex cover Q of the link minus M with `|Q|<=|M|`.

For any complete subgraph K_k, deleting the edges of a matching leaves independence number at most two: three vertices cannot have all three mutual edges deleted by a matching. Consequently any cover Q of a larger link minus M must include at least `k-2` vertices from that clique, irrespective of matching edges leaving the clique. Vertex-disjoint cliques give additive lower bounds on |Q|.

### Fresh vertex

A fresh vertex has exactly the other ten vertices of its K11 as neighbours. Its link is K10, connected. For any matching M, `|M|<=5`, while any Q covering the link minus M has `|Q|>=8`. It is non-WKE.

### Original H-vertex v

Suppose v lies in r K5 blocks of H. Their four-vertex neighbour sets are pairwise disjoint, and each induces a K4. There are no edges between different such sets in the link, because such an edge would create a cross-block H-triangle.

The W-link at v has the following vertex-disjoint pieces:

- K10 on a and the nine fresh vertices attached to av;
- r copies of K4 on the four other vertices of each H-block through v.

The apex a is adjacent in the link to every H-neighbour of v, so these pieces form a connected link. There are exactly `10+4r` link vertices. For ANY matching and remaining-edge cover,

`|Q|>=8+2r`, while `|M|<=floor((10+4r)/2)=5+2r`.

Thus this link is non-WKE with a gap of at least three in the required budget.

### Cone apex a

Its link has n vertex-disjoint K10s, one on each old vertex v together with the nine fresh vertices in its spoke block. The old H-edges join their anchor vertices, so the link is connected because H is connected. It has exactly 10n vertices. Every matching/cover pair satisfies

`|Q|>=8n`, while `|M|<=5n`.

It is non-WKE.

These are all vertex types. Because every link is connected, there is no overlooked smaller WKE CONNECTED COMPONENT inside a non-WKE whole link. Thus W meets exactly the proposed “no WKE link component” premise.

## 6. What this refutes and what remains open

The construction refutes the exact candidate

`TF + no WKE link component => pi<=2nu`.

It also shows that the four-branch/five-core necessary structure cannot substitute for two-edge packing resilience in the parity gate. All W-edges lie in triangles, so TF also implies ordinary edge-cover-criticality here. Nevertheless the original two-spoke blocker remains.

No unrestricted Tuza counterexample is claimed. No assertion is made that this W satisfies all conditions of an actual minimal Tuza violation, or that it blocks every conceivable reduction. The stronger TF-plus-two-edge-resilience parity gate is not refuted.

The large graph is a probabilistic EXISTENCE construction depending on the established H lemma. No actual large incidence hypergraph or literal full W edge list was generated. Only the local K11 and clique-link facts were finitely verified. No additional large search was needed once the exact symbolic proof settled the proposed gate.

## Evidence and execution boundary

- `checks/tf_nonwke_link_k11.py`: independent standard-library local verifier.
- `evidence/tf_nonwke_link/k11_local_certificate.json`: explicit seventeen-packing, all root-avoiding copies, balanced-cover checks, and exact K4/K10 matching-deletion cover tables.
- `evidence/tf_nonwke_link/manifest.json`: this note, local artifacts, and existence-source hashes.
- `evidence/tf_nonwke_link/provenance.json`: scope and clock.

All work was local Darwin under the original TUZA-19 clock: start 2026-11-15 01:53:58 UTC, research cutoff 09:23:58 UTC, hard deadline 09:53:58 UTC. Requested controls Astra/Ultra; exact serving model and effort are not exposed and are not asserted. No new huge-graph search, remote execution, Lean, human review or publication occurred.
