# Fresh adversarial audit of the common-vertex PK theorem

**Verdict: PASS as an ordinary mathematical argument under the stated hypotheses.** I reconstructed the proof from its definitions and found no logical gap or missing hypothesis. The separate small-exchange dichotomy also follows with its stated quantifiers. This verdict is for these two frozen statements only; it is not a formal verification, an originality assessment, an external peer review, or an unrestricted Tuza result.

## Identity, scope, and independence

- Reviewer identity exposed by the collaboration interface: `/root/star_fresh_audit`.
- Requested serving configuration: Astra / Ultra. The reviewer interface does not expose an independently verifiable runtime model ID, reasoning-effort receipt, or routing receipt. I therefore do not certify the requested serving configuration as actual metadata.
- Review started at the observed local-tool time **2026-11-14 19:52:19 UTC**. Requested review deadline: 20:25 UTC; campaign hard cutoff: 21:00:10 UTC.
- Mathematical inputs read: exactly the frozen theorem and its separate corollary listed below. No earlier review, census, producer code, cited workspace note, or external mathematical source was read or used as evidence. The theorem's own approval/status prose was not treated as evidence.
- Operational prerequisites read: the canonical `AGENTS.md`, `migration/MAC_MATH_PROOF_HANDOFF.md`, and `migration/MIGRATION_REPORT.md`.
- All supporting execution was local, using the prescribed environment and Python 3.12.12. No installation, remote run, external message, publication, archive modification, or broad search occurred.

Frozen input identities were independently hashed before review:

| Input | SHA-256 |
|---|---|
| `notes/criticality_star_pk_theorem.md` | `f08cc442241eef4b790bc4b5228c958045593f97ebf56c1259a6f6b1ffe5488b` |
| `notes/criticality_star_local_dichotomy.md` | `ef9e1a69c6722a648eb35549295e80d18b2e062ee6b2d6421bf91dbbcf8c7575` |

The theorem quantifies over an arbitrary finite simple graph G **and every specified maximum edge-disjoint triangle packing P whose members share a vertex v**. The vertex v need not be universal. P is never replaced when defining the permitted set A(P), and no existence of a common-vertex maximum packing in an arbitrary graph is asserted. These scope restrictions are both necessary to the argument and explicit in the frozen statement.

## Reconstruction from definitions

### 1. Matching structure and all old triangles

Write the members of P as triangles v a_i b_i. Distinct packed triangles cannot have a common non-v vertex, since that would repeat its edge to v. Thus the opposite edges a_i b_i form a matching M, U has exactly 2k vertices, and B is the disjoint union of M and the 2k spokes from v to U.

An old triangle avoids v, so its intersection with B consists exactly of its M edges. It cannot contain two matching edges, because those would require four vertices. If it contains none, it is edge-disjoint from every member of P and can be appended. Maximum cardinality therefore forces exactly one M edge in every old triangle. This reasoning applies even when the third vertex is outside N(v), and places every old triangle on an active base in S.

If w,z are distinct unmatched neighbors of v and wz is an edge, then vwz avoids B, again allowing an append. Hence W=N(v)\U is independent. Similarly, a triangle in G[U]-M would be an old triangle without an M edge, so F is triangle-free. No condition on vertices or edges outside N(v) was silently introduced.

For k=0, any actual triangle is an append certificate. Thus a maximum empty P means G is triangle-free and the empty cover is valid.

### 2. The exact packing formula is correct

For any triangle packing in G, its triangles avoiding v form an old packing Q in G-v. The remaining triangles all contain v. Their base edges must form a matching in G[N(v)], because repeating an endpoint would repeat a spoke. They must also avoid E(Q). Conversely, an old packing Q together with any matching in G[N(v)]-E(Q) gives an edge-disjoint triangle packing by adding v to each matching edge: spokes are all distinct, and old triangles contain no spokes. Taking maxima proves the stated formula exactly. Deleting E(Q) from the neighborhood graph means deleting its intersection with that graph's edge set. The formula is contextual and is not used to smuggle a stronger hypothesis into the later proof.

### 3. The two-page exchange checks actual edges

Let Q_i and Q_j be old triangles on two distinct matching bases i and j. Each meets B only in its own base, so both avoid every other packed member. If they are edge-disjoint, deleting T_i,T_j and inserting Q_i,Q_j frees all four spokes at their base endpoints.

For any interpair F edge e unused by both pages, the triangle v+e uses two freed spokes and that unused edge. It is disjoint from both old pages and every retained packed triangle. This is an actual augmentation from k to k+1; no induced-subgraph approximation or individual matching-tightness assumption is involved.

Two old pages on disjoint bases can share an edge only if each tip lies in the other base. Indeed, a shared edge cannot be either matching base. If it is a side of both triangles, its endpoints must consist of one endpoint of each base, forcing each of these endpoints to be the other triangle's tip. Sharing an outside tip does not make the two pages share an edge. This distinction was checked explicitly because an incorrect vertex-disjointness requirement would break the argument.

### 4. Every 2-by-2 interpair matrix is accounted for

All possible edge subsets between two two-vertex pairs have one of the following forms, up to relabeling:

| Shape | Reconstructed consequence |
|---|---|
| Empty | No relation. |
| One edge | Neither base has an internal tip in the other pair. Any old page on each base is disjoint from the other and uses no interpair edge; the displayed edge gives the extra apex triangle. Impossible. |
| Two disjoint edges | Exactly the same argument applies to either displayed edge. Impossible. |
| Two adjacent edges | If the edges are ac,bc, the page abc exists. Any different tip on ab lies outside {c,d}; every page on cd has its tip outside {a,b}. Those pages are disjoint and leave both star edges unused. Therefore c is the entire old-tip set of ab, and i points to j. |
| Three edges | For ac,ad,bc, the internal tips are c for ab and a for cd. An alternative tip x for ab lies outside {c,d}; abx and acd are disjoint and leave bc unused. This rules out every alternative, and the symmetric argument rules out every alternative for cd. |
| Four edges | Both opposite endpoints are tips. An additional tip on one base is outside the opposite pair and gives a page disjoint from any internal page on that opposite base. The internal page consumes only two of the four crossing edges, so an unused crossing edge remains. Thus there are no additional tips. |

The nonempty-tip condition needed in these arguments follows from activity. The conclusions concern **all actual old tips in G**, including outside U and outside N(v), rather than a selected page per pair. This global locking is what makes the directed argument valid.

### 5. Functional components do follow

For every star arc i to j, the entire nonempty tip set of i is a singleton in j. For a member i of a three- or four-edge mutual block with j, its entire nonempty tip set lies in j. Different matching pairs have disjoint vertex sets. Thus i cannot have outgoing relations to two different pairs. This also prevents a vertex from belonging to two mutual blocks. Incoming relations may be numerous and may use different endpoints of the head pair as their centers; the proof correctly allows this.

Every nonzero interpair F_S block creates a relation in D, because the only omitted nonempty shapes have already been excluded. Consequently, different weak components of D have no F_S edges between them. Following the unique outgoing arc in a finite component ends either at a sink or at a directed cycle. Along any arc, its tail and head have the same eventual sink/cycle, so a weak component cannot contain two different terminal objects. Mutual blocks are the directed two-cycles; longer directed cycles consist of star arcs.

Repeatedly deleting nonterminal vertices of indegree zero leaves exactly the sink or cycle. A deleted pair has one parent and its parent relation is a star, not a mutual block. In the graph still present at deletion its only interpair edges are the two edges to the parent center. These facts justify the removal order used in the proof.

### 6. The independent-set construction survives all leaf interactions

There is no within-pair edge in F_S; the matching M was removed in defining F. Thus either endpoint or both endpoints of a sink pair can be selected. For a mutual block, selecting both endpoints of one pair is independent and provides two vertices for two pairs. For a directed cycle of length at least three, exclude from each pair the center of its incoming cycle arc and choose the other endpoint. Every crossing edge along an arc meets the excluded center in the head pair, so no chosen vertices are adjacent. This gives one chosen vertex per cycle pair.

Now reinsert removed pairs in reverse order. At the moment {a,b} is reinserted, all its children remain absent; its only possible selected neighbor is its parent center c. If c is absent, adding one of a,b preserves independence and adds one vertex. If c is present, removing c and adding both a,b also preserves independence and adds one net vertex. Neither a nor b was already present, and ab is not an F edge.

The operation does not assume one selected endpoint per pair and need not preserve previously selected root endpoints. In particular, several children with different parent centers cause no difficulty. The cardinality surplus supplied by choosing both endpoints of a sink is invariant through all later insertions. Summing components yields s selected vertices ordinarily, or s+r when r distinct components receive one extra vertex initially. This is an all-size combinatorial argument; the bounded checks below are not used in its proof.

### 7. Unmatched neighbors produce ORIGINAL private K4 completions

Let ab be active and suppose a is adjacent to w in W. The triangle vaw is actual and meets B only in va. For any old page abx with x different from w, the two triangles vaw and abx are edge-disjoint: the only nonspoke edge of vaw is aw, and it is not an edge of abx. Both triangles avoid every packed member except vab. Replacing vab by them is a one-member augmentation. Thus every old tip equals w. Activity ensures there is an old tip, so bw is present and v,a,b,w form an actual K4.

The intersections of its three other faces with ORIGINAL B are exactly:

- E(abw) intersect B = {ab};
- E(vaw) intersect B = {va};
- E(vbw) intersect B = {vb}.

The reason vw,aw,bw are outside B is w not in U. In particular, another packed triangle cannot use vw. This is precisely the frozen definition of a private K4 completion of the original member vab, so vw belongs to the original A(P). No packing replacement is used to establish permission.

Applying the same argument to another W-neighbor of either endpoint would force the same nonempty old-tip set to be a different singleton. Hence w is the unique such neighbor. Since the entire old-tip set is outside U, this pair has no outgoing D relation and is a sink. Distinct such pairs lie in distinct weak components. They can share their unmatched tip without invalidating the argument; that only decreases the number of additional spokes that must be paid for.

Choosing both endpoints at every such sink therefore produces |I| at least s+r, where r counts the terminal pairs. Subsequent leaf exchanges may remove one or both of those endpoints, but preserve this surplus. The final cover uses only the surplus and the tips W_0, not persistence of terminal endpoints.

### 8. Cover permission and cost are exact

The proposed set is C = S union {vx : x in U\I} union {vw : w in W_0}.

The bases in S and the selected U spokes lie in original B. Every additional W_0 spoke lies in an original private K4 proved above. Thus C is contained in ORIGINAL A(P), including in graphs with many possible unrelated private completions.

The three edge sets are disjoint: S consists of non-v matching edges; the other two consist of v-spokes with endpoints in disjoint sets U and W. Therefore

    |C| = s + (2k-|I|) + |W_0|
        <= s + 2k - (s+r) + r
        = 2k.

There is no charge per endpoint, and no assumption that terminal tips are distinct. If some coincide, |W_0| is smaller than r and the inequality improves.

### 9. The triangle-cover verification is exhaustive in arbitrary G

Every triangle avoiding v has its unique matching base in S, so it is covered even if its third vertex lies outside N(v).

Any triangle containing v has both other vertices in N(v)=U disjoint-union W. If they are both in U and form an active matching pair, the matching base is selected. If they form an inactive matching pair, neither endpoint belongs to I, so both spokes are selected. If they form a nonmatching pair and an endpoint is inactive, that endpoint's spoke is selected. In the remaining case both endpoints are active, and independence of I in F_S prevents both spokes from being omitted.

For an apex triangle with one endpoint w in W, its other endpoint must be in U because W is independent. If that matched endpoint is inactive, its spoke is selected. If it is active, the unmatched-neighbor argument puts w in W_0, so vw is selected. There are no triangles with both apex neighbors in W. A vertex outside N(v) cannot occur in a triangle containing v. These cases cover every actual triangle; there is no discarded ambient region.

### 10. The separate local dichotomy uses no hidden maximum hypothesis

Assume no first-alternative certificate exists. For j=0, a triangle avoiding B would itself be a forbidden certificate. This recovers the old-triangle classification, W independence, and F triangle-freeness, including k=0. For j=2, the two old pages plus a free interpair apex triangle are exactly three disjoint actual triangles avoiding all retained packed members, so every matrix argument remains valid. For j=1, the unmatched-neighbor triangle and a differently tipped old page are exactly the required two-triangle certificate. These are all uses of optimality in the proof.

The matching M, directed components, independent-set exchanges, private-completion checks, cost count, and final cover verification need no further maximum-cardinality premise. Thus failure of alternative 1 gives alternative 2 under the stated local stability condition. Conversely, any displayed certificate can be united with P\R: all inserted triangles are pairwise edge-disjoint and avoid all retained packed triangles, giving exactly (k-j)+(j+1)=k+1 triangles. The alternatives need not be exclusive. Augmenting can destroy the common-vertex property, so the corollary supplies no iteration to unrestricted Tuza.

## Adversarial pressure points and outcome

I specifically tried to invalidate the proof by allowing arbitrary outside tips, shared outside tips, inactive pairs with crossing edges, unmatched neighbors, repeated terminal tips, a mutual block with incoming trees, longer directed cycles, and incoming leaves centered at different endpoints of a terminal root. The global page classification or the cover checks handle each case. The most vulnerable-looking step was the loss of terminal endpoints during leaf insertion; it is harmless because the only invariant needed is the independent-set cardinality surplus. The frozen proof explicitly states this invariant.

No additional assumptions such as an induced star, a universal v, one old page per active pair chosen in advance, pairwise vertex-disjoint old pages, a root endpoint remaining selected, distinct unmatched tips, or a favorable replacement of P are needed. I found no correction required in either frozen statement. Ordinary limitations remain: this is a human-readable proof audit by an AI reviewer, without Lean/kernel verification or an independent external specialist.

## Bounded semantic supporting checks

I wrote `star_fresh_verify.py` from scratch, with no producer imports. The checker lists all actual triangles from each graph's edge set. It exhaustively searches the first-alternative certificates for j=0,1,2. If none exists, it implements the displayed construction and directly checks the resulting set against every actual triangle. Crucially, it computes A(P) independently by enumerating all actual K4 vertex sets and checking each of their three nonpacked faces against ORIGINAL B; it does not merely assume the private-K4 argument has granted permission.

For a fixed star P of size k on vertices 0 through 2k, all optional graph edges were independently varied in these complete bounded universes:

| n | k | Graphs | Cover verified | First certificate j=0 | First certificate j=1 | First certificate j=2 |
|---:|---:|---:|---:|---:|---:|---:|
| 5 | 0 | 1,024 | 388 | 636 | 0 | 0 |
| 6 | 1 | 4,096 | 1,147 | 2,561 | 388 | 0 |
| 7 | 2 | 32,768 | 5,087 | 23,470 | 3,241 | 970 |
| 7 | 3 | 4,096 | 1,090 | 2,397 | 0 | 609 |
| **Total** | | **41,984** | **7,712** | **29,064** | **3,629** | **1,579** |

All passed. The first three universes include arbitrary vertices outside the packed endpoints, with unrestricted adjacency to v and all other vertices. Ten additional targeted runs cover directed four- and five-cycles; a terminal sink whose two endpoints are both removed by leaves with different centers; two terminal pairs sharing one unmatched tip; outside-neighborhood old tips combined with an inactive unmatched neighbor; multiple outside tips on one base; both mutual-block shapes; and explicit negative controls for the forbidden one-edge matrix and the differently tipped unmatched-neighbor state. Eight yield verified covers and two yield the intended j=2 and j=1 augmentation certificates.

Across all 41,994 runs, 7,720 covers and 34,274 augmentation certificates passed direct semantic checks. The final recorded run completed in about 1.73 seconds under local Python 3.12.12. Assertions also check every pair classification, locked-tip conclusion, outdegree restriction, independent-set condition, surplus, private-completion membership, cover cost, and original permitted-edge containment. These are bounded supporting checks only; they neither replace nor prove the arbitrary-size argument.

### A direct check that local stability need not mean global maximum

The n=7, k=3 universe contained 72 locally stable but nonmaximum examples. One representative is simple enough to reconstruct independently:

- v=0; P={012,034,056}; all six spokes 01 through 06 are present.
- Nonapex edges: 12,13,14,16,24,34,35,56.
- A larger packing is {016,024,035,134}; its twelve edges are pairwise distinct.
- The construction gives C={03,04,05,06,12,34}, contained in B, with size 6.

Here the only old triangles are 124 and 134. To rule out every two-member exchange, retain one packed triangle:

- Retaining 012 leaves the eligible old triangle 134. Without it, the apex bases on {3,4,5,6} are 34,35,56, with matching number two. With 134 selected, the remaining eligible apex bases are 35,56, with matching number one. Thus there are at most two eligible disjoint triangles.
- Retaining 034 leaves the eligible old triangle 124. The available apex bases on {1,2,5,6} are 12,16,56, again with matching number two; after selecting 124 they are 16,56, with matching number one.
- Retaining 056 allows both old triangles but they share edge 14. With neither, the apex graph on {1,2,3,4} has matching number two. After 124, the available edges are 13,34, sharing 3; after 134, they are 12,24, sharing 2. Again at most two eligible triangles exist.

A j=0 or j=1 augmentation could be extended to a j=2 augmentation by also removing and reinserting additional members of P, so those are excluded as well. This verifies the strict distinction directly and checks that the corollary is not accidentally relying on global maximum cardinality. It is evidence about the corollary's stated scope, not an alteration to the frozen statement.

## Files and preservation

Supporting files use dedicated `star_fresh` names. The checker source, its JSON result, and the final manifest accompany this review. If the sandbox prevents canonical evidence placement, the source and result are staged as `SCRATCH_OUTPUT/tuza18_star_fresh_verify.py` and `SCRATCH_OUTPUT/tuza18_star_fresh_verifier.json`, with their hashes supplied to the authorized parent for transfer.

Neither frozen proof file was edited. The completed review supports the all-size theorem for a **specified common-vertex maximum packing** and its separate **two-member local certificate dichotomy**. It establishes no reduction of arbitrary maximum packings to that setting.
