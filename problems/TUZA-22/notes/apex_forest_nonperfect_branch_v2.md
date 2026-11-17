> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Apex-forest closed links: the nonperfect forest branch

Status: self-contained ordinary proof candidate v2, frozen for fresh reconstruction. This revision proves the needed forest matching facts directly and supplies a direct triangle-free augmentation, removing the Gallai–Edmonds, Konig and Kotzig theorem dependencies from v1. The established M0/codegree/robustness framework is still used. This note does not claim that arbitrary WKE links are excluded.

## Statement and minimality context

Let G be a minimum-edge failure of combined CS in a subgraph-closed class. Use the established class-local M0 consequences, edge codegree at least two, and the authenticated robustness consequence that every closed link component has at least five vertices. Let v be a vertex, L a closed connected component of its induced link, and w in V(L) such that F=L-w is a forest. If F has no perfect matching, this configuration is impossible.

The minimum-degree-two link consequence implies every vertex of F has degree at least one in F; every leaf of F is adjacent to w. All triangles of L contain w, and L contains no K4.

## Elementary forest matching inputs

**Matching-cover equality in a forest.** The minimum vertex-cover size of a forest equals its matching number. This follows by induction: for a leaf x with neighbor y, some minimum cover contains y and omits x (replace x by y if necessary), and some maximum matching contains xy (replace the edge matching y if necessary). Both parameters are therefore one plus the corresponding parameter after deleting x,y. The edgeless base case is zero. We use this elementary special case in place of Konig's theorem.

**Forest alternating-reach decomposition.** Fix a maximum matching M in a forest F. Let D consist of vertices reachable from an M-unmatched vertex by an even alternating path beginning with a nonmatching edge, including the zero-length paths. Let A consist of those reachable by an odd such path, and C of the unreached vertices.

The sets D,A are disjoint. Otherwise there are paths of different parity from two distinct unmatched roots to the same vertex (paths from the same root are unique in a forest). Their common final subpath can be removed; the remaining paths have opposite parity, so their union is an alternating path between two unmatched roots, an augmentation. This is impossible. Every neighbor of a D vertex lies in A: its matching neighbor is the previous vertex on an even alternating path, while a nonmatching edge extends such a path to odd length. Such an extension cannot revisit a prior vertex, as that would create a cycle; the only possible prior adjacent vertex is the predecessor, whose edge is matching. Conversely every A vertex has a predecessor in D. Thus A=N(D), D is independent, and no D-C edge exists.

Every A vertex is matched (otherwise its odd alternating path augments) and its M partner lies in D. Each matched D vertex has its M partner in A. Every C vertex is matched within C, because an unmatched vertex would be a root and all M partners in A or D are already in D or A respectively. Hence

    |M|=|A|+|C|/2.

The set D is EXACTLY the set of vertices missed by some maximum matching. One direction follows by flipping an even alternating path. For the other, compare M with a maximum matching M' missing a vertex z matched by M. In their symmetric difference the component ending at z is a path; it cannot have odd length, since then it augments one of the two maximum matchings. Thus it is an even alternating path from an M-unmatched vertex to z.

Consequently every maximum matching M' saturates A and C. Let x,y,z,t count its edges of types A-A,A-C,A-D,C-C respectively. There are no D-D or D-C edges. Saturation gives2x+y+z=|A| and y+2t=|C|, so

    |M'|=|A|+|C|/2-x-y/2.

Maximal size forces x=y=0. Therefore every maximum matching matches all A vertices to D and uses a perfect matching in C. In particular F[C] has a perfect matching. These are precisely the forest-specialized Gallai–Edmonds facts needed below, proved here rather than imported. No historical-priority claim is made.

## 1. Two elementary forest leaf facts

A nonperfect tree with at least two vertices has at least TWO leaves, each of which is missed by some maximum matching. Fix a maximum matching M and an unmatched vertex u. Explore paths from u that alternate between edges outside M and edges in M, beginning outside M. An odd-distance reached vertex must be matched, since otherwise an augmenting path exists; its matching edge leads forward. Every reached even-distance vertex that is not a tree leaf has a forward nonmatching edge (except the root, where all incident edges are nonmatching). There are no revisits because the graph is a tree. Each exploration branch therefore ends at a tree leaf at even distance. If u is a leaf, it supplies one such leaf and the branch leaving it supplies another; if u is internal, two branches supply two leaves. Flipping the matching on the even alternating path exposes its terminal leaf without changing matching size.

Write r=nu_match(F), n=|V(F)| and d=n-2r>0. The forest has no isolated vertices here.

**Fact A (retain an allowed edge).** If an edge ab belongs to some maximum F matching, there is a maximum F matching containing ab and missing an ORIGINAL leaf of F. Indeed, F-{a,b} has matching number r-1 and still has deficiency d>0. Every component of this deletion has at most one vertex whose degree has changed: two attachments to the adjacent deleted pair would create a cycle in F. A nonperfect component of order at least two has two exposable leaves, at most one of which is new. A singleton component has original degree one (a second neighbor in {a,b} would create a triangle), so is itself an original leaf. Choose maximum matchings of the components exposing such an original leaf, and add ab.

**Fact B (avoid an edge and its endpoints as exposed-leaf choices).** Suppose nu_match(F-ab)=r and d>=2. Then F-ab has a maximum matching missing an original F leaf x outside {a,b}. Cutting one edge creates at most one new leaf per component. Any nonperfect component of order at least two therefore has an exposable original leaf; an endpoint of ab that was already an original leaf becomes isolated, so it cannot be this chosen leaf. If all nonperfect components were singletons, at most one could occur: an isolated endpoint is an original leaf, and two isolated endpoints would mean ab was a K2 component, whose deletion lowers matching number. Their total deficiency would then be at most one, contradicting d>=2. Thus the required nonsingleton component exists, and the component matchings combine as claimed.

The first leaf fact also gives a maximum F matching exposing an original leaf, and adjoining its w-spoke shows

    nu_match(L)=r+1.

The opposite bound follows by discarding the at-most-one matching edge incident with w.

## 2. The balanced link interface with residual B

A WKE tuple (P,Q) means P is a matching of L, Q covers L-P, and |Q|<=|P|=s. Remove all spokes from v to V(L), together with the rim edges P, to obtain K. The s hub triangles on P append to any K packing. The set P together with the v-spokes to Q covers every triangle removed by this operation, including all outside pages on a deleted rim edge because that edge itself is selected. Closedness of L accounts for every triangle using a removed v-spoke.

Proper-subgraph CS and tau(G)=2nu(G) force equality throughout this reduction: |Q|=s, nu(K)=nu(G)-s, tau(K)=2nu(K), and B(K). If |Q|<s there is already a contradiction.

Every residual K4/K5 block contains at most three L vertices, since L has no K4. A matching of L consequently contributes at most one surviving edge in each block. Hence, if nu_match(L)>s, a larger hub matching appends to a maximum K packing after avoiding that one edge in each block, contradiction.

We will also use two augmentation forms at s=r+1.

**Internal triangle form.** Suppose ab is in P and wab is a triangle of L. If L-E(wab) has an s-matching Z, take its s hub triangles and the rim triangle wab. These are pairwise edge-disjoint. In a residual block, the rim triangle contributes at most one surviving edge, because ab was deleted and a clique containing both other edges would also contain ab. The matching Z contributes at most one edge. If these two edges were disjoint they would require four L vertices in the block, impossible. Thus the entire footprint is a star of at most two edges, avoidable by a maximum K4 or K5 packing. Appending all s+1 triangles contradicts maximality of nu(G).

**Safe external page form.** Suppose ab is in P, neither a nor b belongs to ANY triangle of L, and L-ab has an s-matching Z. In particular ab is in no triangle of L. Codegree at least two in G supplies a page abz other than vab, and z lies outside L. The s hub triangles on Z and this page are edge-disjoint. A residual block contains at most one page spoke because ab is absent. A block containing a page endpoint a cannot contain three L vertices: any three L vertices of a clique form a triangle of L, whereas a belongs to no L triangle. The matching edge and page spoke in a block therefore cannot be disjoint. Again the entire footprint is a star of at most two edges, and the same augmentation contradicts nu(G).

These two statements audit ALL selected triangle edges against every residual block. No bounded-core test or assumption about outside apices is used.

## 3. Reduce the forest to its remaining matching structure

If some maximum F matching M has nu_match(F-M)<=r-1, The elementary forest matching-cover equality supplies a cover C of F-M of size at most r-1. Then P=M and Q={w} union C give a WKE tuple of size s=r, while nu_match(L)=r+1. Section2 excludes it.

We may therefore assume, for EVERY maximum F matching M,

    nu_match(F-M)=r.

In particular every edge of F is avoidable by a maximum F matching: use M itself if it omits the edge, or a maximum matching of F-M otherwise. No tree component of F can have a perfect matching, because a perfect matching of a tree is unique and each of its edges would be essential in every maximum F matching.

We also have d>=2. If d=1, the absence of perfect components means F is a single tree on2r+1 vertices. It has2r edges, and F-M has exactly r edges and matching number r, so F is the union of two matchings. Thus F is the path P_(2r+1). If r>=2, choose its maximum matching exposing vertex3 in the order1,...,2r+1: edges12,45,67,...,(2r)(2r+1). Its complement contains the adjacent edges23,34 and has only r edges, so its matching number is at most r-1, contradiction. If r=1 then F=P3 and L has four vertices, excluded by robustness. Thus d>=2 as asserted.

By Fact B, for every edge ab of F there is an (r+1)-matching of L avoiding all edges of any rim triangle wab: choose a maximum F-ab matching exposing an original leaf outside {a,b}, and add that leaf's w-spoke.

## 4. A triangle with an allowed forest edge is excluded

Suppose L has a triangle wab such that ab belongs to some maximum F matching. By Fact A choose such a maximum matching M containing ab and exposing an original leaf x. Put

    P=M union {wx}.

This has size r+1. A minimum cover C of F-M has size at most r, so Q={w} union C covers L-P and has size at most r+1. Section2 either gives immediate strictness or a balanced B residual. Fact B supplies the matching of L-E(wab) of size r+1, and the internal triangle augmentation excludes this branch.

If L has no triangle at all, choose any maximum F matching M exposing an original leaf, put P=M together with that leaf's w-spoke, and use Q={w} union cover(F-M). Select any f in M (r>=1). Fact B supplies an (r+1)-matching of L-f. Both endpoints of f belong to no L triangle, so the safe external page augmentation applies directly. Thus no triangle-free WKE or Kotzig theorem is needed here. It remains to treat the case that L has triangles, but EVERY triangular forest edge is in NO maximum F matching.

## 5. Find a safe edge in the remaining case

Apply the proved forest alternating-reach decomposition. The set D is independent. If C were nonempty, its perfect forest matching would be unique (the symmetric difference of two distinct perfect matchings contains a cycle); the decomposition shows that all its edges occur in every maximum F matching. This contradicts Section3. Therefore C is empty, and every maximum F matching saturates A by edges to D. In particular r=|A|.

Every A-D edge ad belongs to some maximum F matching. Choose a maximum matching missing d (by the definition of D); it matches a to some other D vertex, and swapping that edge to ad preserves size. The same argument shows that every a in A has at least two D neighbors. All remaining F edges lie within A and are in no maximum matching.

Take a triangle wab of L. Its forest edge ab is unallowed by the remaining-case assumption, so a,b belong to A and both are adjacent to w. In the bipartite forest consisting of the A-D edges, every A vertex has degree at least two, so a's component has a D leaf x. Since D has no other kinds of neighbors, x is an ORIGINAL F leaf and is adjacent to w. The unique A-D path from a to x has odd length. Mark its vertices1 when adjacent to w and0 otherwise. Its endpoints are1. No edge has labels11, because every A-D edge is allowed and a11 edge would be a triangular allowed forest edge, already excluded. If there were no00 edge either, the labels would alternate, contradicting the odd path length and equal endpoint labels. Hence the path contains an allowed edge f=yz whose endpoints are both not adjacent to w.

Since all triangles of L contain w, neither endpoint of f belongs to a triangle of L. Use Fact A to choose a maximum F matching M containing f and exposing an original leaf x'. The tuple P=M union {wx'}, Q={w} union cover(F-M) is WKE of size r+1. Fact B supplies an (r+1)-matching of L-f. The safe external page augmentation of Section2 now contradicts minimality.

This completes the nonperfect forest branch.

## Scope

The perfect-forest branch is proved separately by the coordinator. Together, the two branches exclude an apex-forest CLOSED link component in a class-minimum CS failure once all stated inputs are authenticated. The needed forest matching structure and matching-cover equality are proved above, and the triangle-free branch has a direct augmentation. Thus v2 has no Gallai–Edmonds, Konig or Kotzig theorem dependency. It still uses the stated established class-local minimality, codegree and robustness lemmas, and it does not exclude arbitrary WKE link components.
