> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A closed link cannot have an independent set of all its branch vertices

Frozen ordinary proof candidate, 2026-11-16. Fresh independent review requested. This is an all-size link restriction with arbitrary branch count. It is independent of the new finite four-branch interface and is not needed by the simpler claw-free-intersection proof.

## Statement and suppressed shape

In a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class, every nonempty closed link component contains an edge joining two vertices of link degree at least three.

Suppose a closed link component L at hub h has independent branch vertices (degree at least three). Link minimum degree is two. With no branches L is a cycle, already excluded by link-vertex deletion. Returning degree-two threads are excluded by the same theorem. Between distinct branches, any two nondirect paths are excluded by the parallel-thread theorem; direct branch edges are absent by the independence assumption. Thus L is a subdivision of a loopless simple connected core on b branch vertices, each of core degree at least three, and EVERY core edge is replaced by a path of length at least two.

In particular L is triangle-free: a triangle with no branch is a closed three-cycle; one with a single branch is a returning thread; and a triangle with two branches would contain a direct branch edge. All these are absent. We will build a strict reduction unless every thread has even length, then give an explicit balanced augmentation.

Let o be the number of odd threads, each of length at least three, and e the number of even threads. Form the bipartite incidence graph between branch vertices and even threads, with adjacency at either endpoint. Let a be the size of a largest matching in this incidence graph; this assigns a distinct even thread to each of a distinct branch vertices.

## 1. Incidence assignment bound

For any nonempty set S of branch vertices, write N(S) for its incident even threads. Counting degrees in the suppressed core gives

    3|S| <= 2|N(S)|+2o,
    |S|-|N(S)| <= o-ceil(|S|/2).

If o>=1, this is at most o-1. Adding o-1 universal dummy thread vertices makes Hall's condition true, so a>=b-(o-1); a negative lower bound is harmless. If o=0, Hall directly saturates all b branches, so a=b. This is the ordinary bipartite Hall theorem, not a matching-matroid claim.

## 2. Literal matching/cover tuple on arbitrary path lengths

Initially put every branch vertex into Q. For an odd thread of length2r+1, match its2r interior vertices consecutively, giving r edges in P. Its nonmatching internal edges form a matching of size r-1; add one endpoint of each to Q. Its two endpoint legs are already covered by branch vertices.

For an even thread of length2r that is NOT assigned, match r-1 consecutive interior pairs, leaving one end interior vertex unmatched; either end can be chosen by reversing the construction. The r-1 remaining nonmatching internal edges are pairwise disjoint; cover them by adding one endpoint each to Q. Boundary legs are covered by branch vertices.

For an even thread assigned to endpoint u, match u to its adjacent interior vertex and match the remaining interior vertices consecutively. This uses r edges in P and requires r-1 additional interior vertices in Q to cover the nonmatching internal edges. The far boundary leg is covered by its branch endpoint.

The assignments use each branch at most once, so the union P is a matching. Thread interiors are all disjoint, and every edge of L-P is covered. Let B0 be the sum of the r-1 interior contributions over all threads. Then

    |Q|=b+B0,   |P|=o+a+B0.

If o>=1, Section1 gives |P|>=|Q|+1. Delete all hub spokes and P. The hub triangles on P form a packing, while P plus the spokes to Q cover all removed triangles, including all arbitrary pages on P. This strict tuple contradicts minimum-CS accounting.

## 3. All-even threads: explicit alternate matching and outside page

Now o=0. The incidence matching saturates all b branches, so |P|=|Q|=b+B0. The core has at least3b/2 edges, strictly more than b, so an unassigned even thread exists. Choose one endpoint u of such a thread and orient its unmatched interior vertex to be the one adjacent to u. The branch u is matched in P to the first interior vertex x of its assigned thread. Write f=ux.

Swap f for the edge joining u to the exposed interior vertex of the unassigned thread. This gives another matching P' of the SAME size, avoiding f. All other selected thread edges remain unchanged.

Delete all hub spokes to L and P, giving K. Balanced accounting gives B(K) and nu(K)=nu(G)-|P|. Codegree at least two supplies a page uxz other than hux. Since L is triangle-free and closed, z is outside the entire N(h): inside L it would complete a forbidden triangle on ux, and in another link component it would connect that component to L.

Append the hub triangles on P' and the page uxz. They are edge-disjoint, since P' avoids f and z is outside L. Each residual clique block contains at most two L vertices, since L is triangle-free; therefore it contains at most one surviving P' edge. It contains at most one surviving page spoke, since f was deleted. If these two edges were disjoint, that block would contain three L vertices, impossible. Thus their entire footprint is at most a two-edge star in every old K4/K5 block. Choose maximum old block packings avoiding those stars and append |P|+1 triangles, contradiction.

This excludes all-even threads and proves the theorem. No Kotzig theorem, general WKE availability claim, finite matching census or subdivision oracle is used.

## Consequence and boundary

At every vertex v of a minimum CS failure, some two neighbors x,y have xy in G and both vx,vy in the high-codegree graph J(G). In fact this holds in each closed link component. The conclusion does not say xy is high, nor that J(G) itself contains a triangle.

As a hereditary class consequence, if every actual triangle in G contains at most one edge of triangle-codegree at least three, then G satisfies CS. The class is hereditary because edge deletion cannot increase codegree or create triangles. A smallest failure would violate the proved link conclusion. Its equality components are K4 only, since K5 has three high edges in each triangle.

Global availability is not asserted: arbitrary graphs may have many triangles with two or three high edges. Dependencies are the authenticated class-local M0/codegree and clique-avoidance facts, and the accepted ordinary link-deletion and parallel-thread exclusions.
