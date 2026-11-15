# Four-branch WKE lemma and unrestricted high-codegree-core localization

Status: ordinary proof with a complete finite certificate domain; fresh independent review pending. The all-size assertion depends on the explicit reductions below plus all5375 finite certificates, not on a census of small graphs. No Lean or human verification, originality claim, or proof of unrestricted Tuza is made.

A WKE witness for a finite simple graph L is a matching M and a vertex set Q covering every edge of L outside M, with |Q|<=|M|. The name and link reduction are the established weak König–Egervary framework of Puleo. The current route was prompted by the bounded branch-degree domain in AppendixC of Tsujimura arXiv:2611.11128v2, https://arxiv.org/html/2611.11128v2. That source uses two-vertex subdivision lifting and additional restrictions on branch degrees. We independently check the unrestricted four-branch statement below. Its finite tables are newly generated here, not imported from that paper; no claim is made to have replayed its supplement or density proof.

## Candidate theorem

Every finite simple graph L with at most FOUR vertices of degree at least3 has a WKE witness. There is no bound on its order or maximum degree.

Call vertices of degree at least3 branches. We prove the theorem by induction on |V(L)|, using the complete finite domain at the end for the remaining canonical graphs. Components combine by taking unions of their disjoint witnesses, so a nontrivial induction step may assume L connected.

### Isolates, leaves and cycles

An isolate can be removed. If x is a leaf with neighbor v, apply induction to L-{v,x}; add vx to M and v to Q. All newly relevant edges have endpoint v, except vx itself, and |M|,|Q| both increase by1. Removing vertices cannot increase the branch count.

We may therefore assume minimum degree at least2. If there is no branch, connected L is a cycle. For a specified cycle vertex v, a WKE witness may be chosen with v in Q. Write its cyclic order as v,x1,... . For an odd cycle of length2r+1, use matching x1x2,x3x4,...,x_(2r-1)x_(2r) and Q={v,x2,x4,...,x_(2r-2)}. Both sets have size r. For an even cycle of length2r, use matching vx1,x2x3,...,x_(2r-2)x_(2r-1) and Q={v,x1,x3,...,x_(2r-3)}. Both sizes are r. Direct inspection covers every nonmatching cycle edge.

### Two-vertex subdivision lift

If uv is replaced by ua,ab,bv, with a,b fresh, a WKE witness lifts as follows. If uv is in M, replace it by ua,bv and add a to Q. If uv is outside M, an endpoint lies in Q; add ab to M and add b to Q when u is in Q, otherwise add a. Existing Q vertices stay selected, every nonmatching edge is covered, and both sizes increase by1. Iterating lifts any even number of additional internal path vertices. In particular prescribed branch vertices already in Q remain in Q.

### A path returning to the same branch

With minimum degree2 and at least one branch, every maximal path with only degree-two internal vertices has branch endpoints, possibly equal. It has no internal contacts elsewhere. A path returning to a branch v is a cycle containing no other branch. Use the preceding cycle witness with v in Q and combine it with an inductive witness on the graph obtained by deleting all vertices of that cycle. All edges leaving the removed cycle have endpoint v and are covered by v. Matchings are disjoint. The remaining graph has at most three branches. Hence such a loop is reducible, regardless of its length.

### Reducible parallel paths

Consider two internally disjoint branch-to-branch paths between distinct branches u,v. An original edge uv is called direct; every other path is nondirect. An even nondirect path reduces to length2 by deleting pairs of internal vertices; an odd nondirect path reduces to length3. The following canonical unions have WKE witnesses containing BOTH u,v in Q:

| Paths | Matching M | Q |
|---|---|---|
| u-x-v and u-y-v | {ux,vy} | {u,v} |
| u-x-y-v and u-z-v | {xy,uz} | {u,v} |
| u-x-y-v and u-z-w-v | {xy,zw} | {u,v} |
| direct uv and u-x-y-v | {uv,xy} | {u,v} |

Each row has |M|=|Q|=2; all unmatched edges meet Q. Lifting restores the original path lengths while retaining u,v in Q. Remove the two branches and all internal vertices of these two paths, apply induction to the remaining graph, and combine the witnesses. Every edge leaving this removed set has endpoint u or v, hence is covered. This is valid even if other paths join u,v; their surviving interiors simply belong to the remaining graph.

Thus either two nondirect parallel paths, or a direct edge together with an odd nondirect path, admit a reduction. Simplicity permits at most one direct edge. If three or more paths join a branch pair, at least two are nondirect and the first rule applies.

The sole irreducible double-path pattern is therefore one direct edge and one even nondirect path. It reduces to a triangle u-v-x-u. We do not claim a witness for that triangle with both u,v in Q; this is precisely why it stays in the finite domain.

## Complete remaining finite domain

After these reductions, the suppressed graph has no loop, at most four labeled branches, and for each unordered branch pair exactly one of five states:

0. No path.
1. One direct edge D.
2. One even nondirect path E, retained at length2.
3. One odd nondirect path O, retained at length3.
4. D plus E, with the E path retained at length2.

Different retained nondirect paths have fresh, disjoint internal vertices. A state D,E,O contributes1 to both endpoint branch degrees; D+E contributes2. Retain every vector with each branch degree at least3. Connectedness is deliberately not required in the finite checker, enlarging the domain harmlessly.

Every actual unreduced connected L determines one such labeled state vector, and is obtained from its canonical graph solely by two-vertex subdivisions. There are 15756 raw vectors for one through four branches:1+5+125+15625. The minimum-degree test leaves no one- or two-branch vectors,10 three-branch vectors, and5365 four-branch vectors. Thus there are exactly5375 graphs to certify. Their maximum order is16 and maximum edge count18.

The full literal edge lists, state vectors and witnesses are in evidence/four_branch_wke/canonical_witnesses.json. Every retained graph has a valid matching M and cover Q of L-M with |Q|<=|M|. The producer checks/root_four_branch_wke.py generated the whole fixed domain and verified those conditions. Its search for a witness is not trusted for the mathematical result: only completeness of the displayed finite domain and validity of each saved witness are needed. A separate checker can reconstruct every state and verify all witnesses without invoking any optimization routine.

The reductions, finite certificates and subdivision lift establish the candidate theorem, subject to the stated independent review boundary.

## Global consequence: unrestricted five-core localization

For an arbitrary finite simple graph G, put H={e in E(G): e belongs to at least3 actual triangles}, retaining all vertices, and let K be the vertex set of the ordinary5-core of H. The claim is that a sequence of standard WKE link reductions and isolated-vertex deletions yields a graph R contained in G[K], with

    tau(G)-2nu(G) <= tau(R)-2nu(R).

No maximum codegree, degree-four-edge condition, vertex-degree bound or density condition is imposed.

Indeed, in the current graph choose a vertex v incident with at most4 edges of triangle codegree at least3. Its link L=G[N(v)] has at most4 vertices of degree at least3, because d_L(u) is exactly the codegree of vu. The four-branch theorem supplies M,Q. The packing S={vxy:xy in M}, and the edge set X=M union {vq:q in Q}, cover all triangles touching the spokes at v, and |X|<=2|S|. Deleting all v-spokes together with X leaves a graph whose packings extend by S and whose covers extend by X. Therefore the displayed defect does not decrease. Vertices not incident with an edge can be discarded.

Repeat until no such vertex remains. Codegrees never increase under these edge deletions. If the survivor is nonempty, every surviving vertex has at least5 incident current edges of codegree at least3. Those edges belong to the ORIGINAL H. Their surviving spanning subgraph has minimum degree at least5, so every survivor vertex belongs to the original5-core K. This proves R is a subgraph of G[K]. It need not equal G[K]. No unsupported inequality comparing the defect of G directly to that of the full induced core is asserted.

Consequently, if the initial high-codegree subgraph H is4-degenerate (equivalently K is empty), Tuza holds by this constructive reduction. More generally any hereditary Tuza-sufficient condition on G[K] suffices. A genuine irreducible minimal counterexample must have at least five incident edges of codegree at least three at every vertex. The lemma gives a forced global structural restriction, but says nothing further about a nonempty core; it does not prove the unrestricted conjecture.

## Review and reproduction status

Reproduce the complete finite domain in the native pinned environment with `python checks/root_four_branch_wke.py`. All work is local Darwin and shares the original research cutoff09:23:58Z. Fresh reduction/completeness review has been requested. This note must not be labeled Lean-verified, independently accepted or historically new before the corresponding evidence exists.
