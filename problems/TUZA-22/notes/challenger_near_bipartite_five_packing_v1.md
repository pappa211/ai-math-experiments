> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Eight internal cover edges over a nearly complete bipartite graph

Status: ORDINARY_PROOF_CANDIDATE, awaiting fresh review. Author: TUZA-22 challenger. Date: 2026-11-15 UTC. This is an all-input structural lemma at two exact finite interfaces, not a census or a claim about arbitrary graphs.

## Statement

Let G be a finite simple graph on a partition A union B, and let C be precisely the set of all edges of G internal to A or B. Assume |C|=8 and C is a minimum triangle-edge cover of G. Suppose either:

1. |A|=|B|=6 and at most two of the 36 possible cross edges are missing; or
2. {|A|,|B|}={5,7} and at most one of the 35 possible cross edges is missing.

Then G contains five pairwise edge-disjoint actual triangles. Extra triangles entirely inside either part are permitted; the proof does not delete or ignore them when using minimum-cover optimality.

## A local consequence of minimum-cover optimality

For every vertex v,

    d_internal(v) <= d_cross(v).

Indeed, remove from C every internal edge incident to v and add every cross edge incident to v. This remains a triangle cover. A triangle not using one of the removed edges retains its old cover edge. A mixed triangle using a removed edge has its cross edge at v newly covered. An all-internal triangle using v retains the internal edge opposite v. Thus a strict reverse inequality would produce a cover smaller than8.

## Apex lists and packing

For an internal edge xy in A, its page list is L(xy)=N_B(x) intersection N_B(y). Assigning a page z in L(xy) gives the actual triangle xyz. Triangles on different A-internal base edges are edge-disjoint exactly when adjacent base edges receive distinct page vertices. Therefore a proper list edge coloring of chosen A-bases produces the desired packing. The same applies with A and B reversed.

In either interface, every page list has at least four vertices. In the 6+6 interface this follows from six potential pages and at most two missing cross edges in total. For a base in the size7 part of the 5+7 interface, at least four of the five pages remain; for a base in the size5 part, at least six of the seven remain.

## Case I: one part contains at least five internal edges

Choose any five distinct internal edges in that part, say A.

If these five edges are not a star, their line graph is not K5. A graph on five vertices which is not K5 is 3-degenerate: no proper subgraph can have minimum degree4, and the whole graph does not have that degree. Hence it is list-colorable from any lists of size at least4, by deleting a vertex of degree at most3 repeatedly and coloring in reverse order. To justify the star criterion, five pairwise-intersecting edges of a simple graph have a common endpoint: if two are xy,xz and a third misses x, it must be yz; then any fourth meeting all three is one of those same three edges, impossible. Thus the nonstar choice gives five triangles directly.

Suppose instead that the five chosen edges form a star centered at x. Put R=N_B(x). The minimum-cover consequence gives |R|>=d_internal(x)>=5. Each leaf-page list is R minus the cross nonneighbors of that leaf. Each list has size at least4 by the earlier bound. At most two lists are proper subsets of R, because there are at most two missing cross edges in the entire graph; in the 5+7 case there is at most one. Thus the union of all five lists contains R and has size at least5. Any subfamily of at most four lists has union size at least4, and hence at least the size of that subfamily. Hall's marriage theorem supplies five distinct pages, which clearly give an edge-disjoint five-packing.

## Case II: each part contains exactly four internal edges

First take the 6+6 interface. Choose any internal edge uv in B. Its common neighbors in A number at least4. The internal graph on A has four edges and total degree8, so at most two of its vertices have internal degree at least3. Consequently uv has a common neighbor x in A whose internal degree is at most2. Reserve the actual triangle xuv.

For each of A's four internal base edges, start with its original page list, of size at least4. For a base incident to x, delete u and v from its page list; this exactly prevents sharing either reserved cross edge xu or xv. Such a list still has size at least2. There are at most two bases incident to x, so color these first with distinct permitted pages. Then color the remaining bases in any order: each still has a list of size at least4 and at most three previously colored bases, so some page avoiding all previously used colors exists. This is stronger than the required properness condition. The resulting four triangles share no edge with xuv and give five in total.

For the 5+7 interface, orient A as the size5 part and B as the size7 part. Choose any internal B-edge uv and any common neighbor x in A; there are at least four choices. Reserve xuv. Every original page list for an A-base has size at least6. Deleting u,v from lists on bases incident to x leaves all four lists of size at least4. Greedily give the four A-bases distinct permitted pages. The corresponding triangles together with xuv are again edge-disjoint.

These cases exhaust the split of eight internal edges. QED.

## Exact dependency and use boundary

The proof uses elementary Hall matching and greedy list coloring, plus minimum-cover optimality. It does not establish that the complement of an arbitrary minimum cover has either displayed bipartite shape. A separate reduction must prove that interface before applying this lemma. No computation or historical Tuza theorem is used within the lemma.
