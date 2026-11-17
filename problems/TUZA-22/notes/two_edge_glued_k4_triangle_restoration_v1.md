> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Strict triangle restoration from two K4s sharing one edge

Frozen ordinary theorem, 2026-11-16. Source_audit. This resolves a specific defect-one restoration state identified by the H-D book decomposition. It makes no assertion that arbitrary near-tight residuals have this form.

## Statement

Let H be a finite simple graph whose nonempty actual triangle components are arbitrary literal K4/K5 blocks, together with exactly ONE component D formed by two literal K4s sharing precisely one edge. Every actual crossing triangle is included in this assumption. Background edges and shared vertices between different triangle components are unrestricted.

Let T=t1 t2 t3 have all three edges absent from H, and set G=H+E(T). Then

    tau(G) <= 2nu(G)-1.                                  (1)

Thus this restoration is always strict. In particular, a tight graph obtained by restoring one triangle cannot have this specified defect-one residual.

Write the two D petals as {x,y,a,a'} and {x,y,b,b'}, sharing xy. Then

    nu(D)=2, tau(D)=3,

with minimum cover {xy,aa',bb'}. The six-vertex component has independence number two. Its induced H graph contains no extra cross-petal edge: such an edge would create another triangle through x or y and change the specified actual component.

## 1. Tightness forces the exact K5-minus-edge new family

Let the old B-block union have packing number m and cover number 2m. The restored T is disjoint from H, so

    nu(G)>=m+3,   tau(G)<=2m+6.

If nu(G)>=m+4, (1) is immediate. Suppose equality in the only remaining upper bound were possible:

    nu(G)=m+3, tau(G)=2m+6.                              (2)

Let N be the ENTIRE new triangle family. It consists of T and every ordinary page on its three bases. A cover of N of size at most two would contradict (2), using an old H cover of size 2m+3.

The base-apex incidence graph of the new pages has matching number at most two. Otherwise three pages on distinct bases with distinct apices form an edge-disjoint three-packing. In every old K4/K5 block their whole old footprint is a star of at most two edges: the independent terminal triple meets each old clique in at most one vertex, and each terminal belongs to only two selected bases. Standard clique avoidance appends those three pages to a maximum m-packing of the old B union. In addition choose ONE of the two D petals and a triangle avoiding its star footprint. This appends another triangle disjoint from that B packing and from all three new pages, giving m+4, contrary to (2).

Apply the already independently reviewed ordinary page-incidence classification from two_triangle_restoration_v1.md: when its matching number is at most two, the whole new family has a cover of size two unless it is exactly the seven-triangle K5-minus-edge family on T and two full apices u,v. The cover-two case has been excluded. Thus N has exactly these seven triangles. For each terminal ti, the three edges

    {the opposite T base, ti u, ti v}

cover N; in particular every old N spoke belongs to a three-edge N cover.

## 2. Separate the old B blocks without omitting attachments

No N spoke lies in an old B triangle block. If a spoke e did, choose an old B minimum cover containing e, add the three-edge minimum cover of D, and add a three-edge N cover containing e. The overlap gives at most 2m+5 edges, contradicting (2).

Consequently all N triangles have edge support disjoint from every old B block. The restored bases were absent from H, so they cause no exception. Let J be the literal edge-support subgraph of D together with all N triangles. Its actual triangle family is exactly D union N: every G triangle was already an H triangle or belongs to N, and no old B triangle has an edge in this support. Therefore component additivity gives

    nu(J)=3, tau(J)=6.                                  (3)

We now contradict (3) by direct ordinary packing/cover constructions. No small-packing-number census or finite CS premise is used.

## 3. The two full apices are nonadjacent in H

If uv belonged to H, all three triangles uv ti would be old H triangles sharing uv. Their single actual triangle component would contain all three terminals. But the terminals are independent in H, while an old B clique contains at most one independent terminal and D has independence number two. This is impossible. Hence uv is absent.

At least one T terminal lies outside V(D), again because the three terminals are independent and D has independence number two.

We also use this elementary fact: D has a two-packing avoiding ANY specified one of its edges. Choose a triangle in a petal containing that edge which avoids it; in the other petal choose a triangle avoiding the shared edge xy. These are edge-disjoint. If the specified edge is xy, choose both petals' triangles avoiding xy. The same fact is trivial when no edge is prescribed.

## 4. At most one full apex lies in D

If neither apex lies in D, choose any two N pages on distinct bases and different full apices. They are edge-disjoint and use no D edge, so a D two-packing appends and gives four triangles in J.

If exactly one full apex u lies in D, choose an outside-D terminal ti and another terminal tj, and take the N page ti tj u. It uses at most ONE D edge: its base is newly restored, and its spoke incident with ti is not a D edge. Choose a page on a different T base with the other full apex v, which lies outside D. The two pages are edge-disjoint; the second has no D edge. Append a D two-packing avoiding the possible single old footprint edge. Again nu(J)>=4, contradicting (3).

All page edges and the possible footprint are actual edges; pages may share vertices, which is harmless.

## 5. Both full apices lie in D

Their nonadjacency forces them to be exclusive vertices in different D petals; rename them a and b in the displayed D notation. Their only common neighbors within D are x,y. At most one terminal lies in D, because x and y are adjacent.

If no terminal lies in D, N has no D edge and the previous four-packing applies. Otherwise let the unique D terminal be x. The only N spokes lying in D are xa and xb. There is a four-edge D cover containing both:

    {xa, ya', xb, yb'}.

Each pair is an opposite-edge minimum cover of its respective K4, so their union covers the entire D component. The three-edge N cover

    {t2 t3, xa, xb},

where t2,t3 are the other terminals, overlaps this D cover in two edges. Their union has size five and covers J. Thus tau(J)<=5, contradicting (3).

This exhausts all possibilities for the full apices. Equality (2) is impossible, proving the strict bound (1).

## H-D consequence and exact boundary

In the strict original H-D q=k-2 book state with exactly one repeated unused opposite, deleting the two singleton triangles leaves B plus precisely the D component above. Restoring either singleton would have the forbidden tight parameters nu=q+1, tau=2q+2. Hence that repeated-opposite alternative is excluded ordinarily.

The one-bad-book alternative in hd_wang_book_defect_count_v1.md remains open; it can contain arbitrary extra pages on its bad spine. The theorem does not classify other defect-one components, prove unrestricted restoration, or solve original H-D.

Dependencies are the accepted ordinary new-page incidence lemma, literal clique cover/packing avoidance, and actual component additivity. No GE, Kotzig, finite certificate, large census, or claimed all-size formalization is a premise.
