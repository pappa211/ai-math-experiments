# Private-K4 support for every maximum packing with a common vertex

Status: complete ordinary proof, independently reconstructed by root and fresh critic. This is an all-size scoped PK theorem, not a proof that arbitrary graphs admit such a maximum packing. No originality claim is made.

## Exact statement and global scope

Let G be a finite simple graph and let P be a maximum edge-disjoint triangle packing whose members all contain one vertex v. Write k=|P|, let M be the k pairwise vertex-disjoint edges opposite v, let U=V(M), and let B=E(P). A triangle Q other than a member of P is private for T in P if E(Q) intersects B in exactly one edge of T. A private K4 completion of T is an actual K4 on V(T) together with one more vertex, whose three faces other than T are all private for T. Let A(P) be B together with all edges of all such private completions.

**Theorem.** There is a triangle edge cover C of G with C contained in A(P) and |C|<=2k.

This proves PK-all for EVERY specified maximum packing with a common vertex, in an arbitrary ambient graph. The common vertex need not be universal; vertices outside its neighborhood are allowed, as are unmatched neighbors of v. The cover uses the ORIGINAL A(P), and the proof does not replace P by a more favorable maximum packing. In particular the theorem includes private K4 states and allows cost transfer between packed members.

The unrestricted PK-exists conjecture would imply Tuza, but this theorem does not prove existence of a common-vertex maximum packing. Therefore it does not settle unrestricted Tuza. The permitted-edge definition is the one in `notes/apex_private_k4_gate.md`; the proof below is self-contained.

If k=0, maximality of P says G is triangle-free and the empty cover suffices. Hence assume k>0.

## Actual triangles and the exact star-maximum condition

Call a triangle old if it avoids v. Every old triangle contains exactly one M edge: otherwise it misses B and can append to P, while a triangle cannot contain two edges of a matching. Let S be the subset of M consisting of edges in at least one old triangle. Write s=|S|, and call these matching pairs active. Every old triangle is therefore an old page on an active base. Its third vertex may lie in U, in N(v) minus U, or outside N(v).

Put W=N(v) minus U. W is independent, since an edge inside W would give an apex triangle disjoint from P. The graph F=G[U]-M is triangle-free: an F triangle would be an old triangle avoiding M. Write F_S for F induced by the endpoints of active pairs.

For context, the exact maximum-packing condition has a useful equivalent form. Put H=G-v and L=G[N(v)]. For every old triangle packing Q in H, let E(Q) be its edge union. Every triangle packing in G consists of some such Q plus apex triangles whose base edges form a matching of L-E(Q). Consequently

    nu(G)=max_Q ( |Q| + matching_number(L-E(Q)) ).

Thus maximum star P is exactly the assertion that every displayed quantity is at most k. The proof uses only elementary consequences involving at most two old pages and one extra apex triangle. The individual-tight-triangle relaxation fails in `notes/criticality_star_tight_control.md`; no such relaxation is substituted here.

## The two-page exchange and complete pair classification

Take two distinct active pairs i={a,b} and j={c,d}, and old pages Q_i and Q_j on their respective bases. If these pages are edge-disjoint, replace the two packed apex triangles on i and j by Q_i and Q_j. Every other packed member is still disjoint from them, since each old page has exactly one M edge and no edge incident with v. The four apex spokes at a,b,c,d are now free. It follows that every F edge between i and j must belong to Q_i union Q_j: any remaining such edge supplies one more apex triangle and gives k+1 triangles.

Two pages on disjoint matching bases can share an edge only when each page tip is an endpoint of the other's base. Indeed a shared edge cannot be either matching base, so it must join the two page tips, one in each base. In particular, if one page tip lies outside the opposite pair, the two pages are edge-disjoint.

Consider the 2-by-2 bipartite adjacency matrix of F between i and j. The following list is exhaustive.

1. **No edges.** There is no relation to record.
2. **One edge, or two disjoint edges.** These cases are impossible. Neither pair has an endpoint of the other pair as a possible old-page tip, since no such endpoint is adjacent to both base endpoints. Choose any old page on each base. The pages are edge-disjoint and use no interpair edge, contradicting the two-page exchange.
3. **Two adjacent edges.** These form a star from both endpoints of one pair i to a single endpoint c of the other pair j. The old page abc exists. It is the ONLY old page on base ab. To see this, an alternative page on ab has tip outside pair j; every page on cd has tip outside pair i, since neither a nor b is adjacent to both c and d. These two pages are disjoint and leave the displayed star edges unused, a contradiction. Record a directed arc i -> j, with center c in the head pair. Thus the tail's entire old-tip set is the singleton {c}.
4. **Three edges.** Up to labels these are ac,ad,bc, with bd absent. Base ab has the internal tip c and base cd has the internal tip a. Each is its base's ONLY old tip. For example, an alternative page on ab has tip outside {c,d}, so it is disjoint from the page acd; that page uses ac and ad, leaving bc available for an extra apex triangle. The symmetric argument handles cd. Record this pair as a mutual root block.
5. **Four edges.** Both endpoints of each pair are old tips for the opposite base. These are the ENTIRE old-tip sets. If a page on ab had any other tip, it would be disjoint from an internal page on cd; the latter consumes only two of the four interpair edges, leaving an extra apex triangle. The same argument applies in reverse. Record this pair also as a mutual root block.

No enumeration assumption enters this classification: it concerns all actual pages and all actual interpair edges in G.

## Functional components and an independent halfset

Make a directed graph D on the s active pairs. Each two-edge star gives its directed arc as above. Each mutual root block gives the two opposite directed arcs between its members. Every vertex has outdegree at most one. A star tail has one unique old tip in its head pair and so cannot have another outgoing relation. A member of a mutual block has all its old tips in the opposite member, so it has no other outgoing relation. These facts also prevent overlapping mutual blocks.

Every weak component of this finite directed graph is therefore either a tree directed into a single sink, or consists of a directed cycle with trees directed into it. A directed 2-cycle is a mutual block; longer cycles consist entirely of star arcs. This elementary description follows by repeatedly following the unique outgoing arc: a walk ends at a sink or enters a cycle, and an edge cannot join two different eventual sinks or cycles because its tail points to its head.

There is an independent set in F_S of size at least the number of active pairs. More precisely, a component directed into a sink can receive one additional vertex if both endpoints of its sink pair are requested initially. Here is a constructive proof that will also give the additional vertices needed for unmatched neighbors.

First remove the incoming tree pairs, starting at pairs of indegree zero and retaining the terminal sink or cycle. Every removed pair {a,b} has, in the graph remaining at its removal, exactly the two edges from a,b to the single center c of its parent pair. There is no edge ab in F_S. All its other interpair neighbors were previously removed.

On the remaining terminal object choose an independent set as follows:

- For a singleton sink pair choose one endpoint, or both endpoints when one extra vertex is requested.
- For a mutual root block choose both endpoints of one of its two pairs. This gives two vertices for two pairs, whether its interpair graph is P4 or C4.
- For a directed cycle of length at least three, in each pair choose the endpoint different from the center of its incoming cycle arc. Every cycle edge is incident with an excluded incoming center, so this gives an independent set with one vertex per pair.

Reinsert removed pairs in reverse order. At the insertion of a pair {a,b}, the only possible neighbors of a or b already present are the parent center c. If c is absent from the current independent set, add one of a,b. If c is present, remove c and add BOTH a,b. In either case the independent set increases by exactly one and remains independent. This exchange permits different incoming stars at a parent to have different centers; no simultaneous one-endpoint-per-pair condition is imposed. It preserves any initial surplus of the terminal object.

## Unmatched neighbors are payable private-K4 sink states

Suppose an active pair {a,b} has a neighbor w in W incident with a. The triangle vaw is private for vab. For any old page abx, if x is not w, the triangles vaw and abx are edge-disjoint and avoid every packed member other than vab. Replacing vab by both contradicts maximum cardinality of P. Therefore every old-page tip on ab equals w. In particular bw is present, the old page is abw, and the four vertices v,a,b,w induce an actual K4.

Its other three faces abw,avw,bvw each meet B in precisely ab,av,bv respectively: w is unmatched, so vw,aw,bw are outside B. This is a private K4 completion of the ORIGINAL packed triangle vab, and its edge vw belongs to A(P). The same argument with any further unmatched neighbor shows that w is the unique W-neighbor of either endpoint of this active pair.

Since its unique old tip is outside U, this active pair has no outgoing relation in D. It is a sink, and hence it is the unique sink in its weak component. Call such a pair terminal. Let r be the number of terminal pairs, and let W_0 be the set of their unmatched tips. Different terminal pairs may have the same tip; this causes no difficulty and gives |W_0|<=r. Distinct terminal pairs lie in distinct components of D.

In the independent-set construction, request both endpoints for every terminal sink pair and use the ordinary choices in all other components. The resulting independent set I in F_S satisfies

    |I| >= s+r.

Later leaf exchanges can remove terminal endpoints from I, but they preserve the cardinality surplus. The cover verification needs only this surplus and the selected spokes at all terminal tips; it does not require terminal endpoints to remain in I.

## Cover extraction and every actual triangle

Define

    C = S  union  {vx : x in U minus I}  union  {vw : w in W_0}.

The first two sets lie in B, and the last set consists of the allowed private-K4 edges proved above. Thus C is contained in the ORIGINAL A(P). Since the sets have distinct forms,

    |C| = s + 2k - |I| + |W_0|
        <= s + 2k - (s+r) + r = 2k.

Every actual triangle is covered:

- An old triangle has its unique matching base in S.
- An apex triangle with both other vertices in U either has its base in S, has its base in an inactive matching pair (both its spokes are selected because I uses only active vertices), or has its base in F. In the last case independence of I in F_S, together with selection of every inactive endpoint's spoke, ensures at least one selected spoke.
- An apex triangle with one other vertex in W has its other vertex in U because W is independent. If that matched endpoint is inactive, its spoke is selected. If it is active, the preceding private-K4 argument places the unmatched endpoint in W_0, so its spoke is selected.
- There is no apex triangle with both other vertices in W.

These cases exhaust all triangles in the arbitrary graph G, regardless of vertices outside N(v). This proves the theorem.

## Interpretation and provenance

The decisive additional input beyond individually matching-tight old triangles is the simultaneous two-old-page exchange. It forces the active-pair matrix classification, and that classification makes the remaining independent-set construction elementary. The 16-vertex tight-cut control from `criticality_star_tight_control.md` fails this two-page condition and therefore does not contradict the theorem.

The argument was developed in this private workspace with independent reconstruction by root and fresh critic. The unmatched-root surplus repair was independently supplied by both root and fresh critic. It imports no matching-structure theorem, fractional rounding theorem, finite census, or unverified source lemma. The private-page and private-K4 terminology follows the workspace PK gate. The conclusion remains a scoped theorem: no reduction of arbitrary maximum packings to a common-vertex packing has been established.
