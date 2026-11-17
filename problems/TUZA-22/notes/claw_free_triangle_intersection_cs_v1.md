> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Combined CS for claw-free actual triangle-intersection graphs

Frozen ordinary proof candidate, 2026-11-16. Fresh independent review requested. Source_audit construction with coordinator simultaneous reconstruction. No novelty claim and no unrestricted claw-free availability claim.

## Statement and inherited minimality

Let X(G) have one vertex for every actual triangle of the finite simple graph G, with adjacency when the triangles share an actual graph edge. If X(G) has no induced claw K1,3, then tau(G)<=2nu(G), with equality exactly when every nonempty triangle component has literal K4 or K5 support. Arbitrary triangle-free background and graph-vertex sharing are allowed.

The class is edge-subgraph hereditary, since X(H) is induced in X(G) for every graph subgraph H. Therefore suppose G is a smallest combined CS failure in this class. The authenticated class-local M0 package gives triangle support and codegree at least two on every G edge. We also use the independently reviewed `notes/link_vertex_deletion_cyclic_components_v1.md`: for every v and every vertex w of its induced link L=G[N(v)], every component of L-w contains a cycle. This theorem was proved within any edge-subgraph-hereditary CS class. No new finite or external premise enters this assembly.

Call a graph edge high if its actual triangle codegree is at least three, and low otherwise. In G every low edge has codegree exactly two.

## 1. The three apex lists

For an actual triangle abc, let A_ab, A_ac, A_bc be the sets of outside vertices completing its respective edges to triangles. All are nonempty by codegree two. If one chooses three distinct representatives x,y,z from these three lists, the triangles abx,acy,bcz are pairwise edge-disjoint: distinct outside apices prevent any common spoke, while their three bases differ. Their vertices in X(G) are three independent neighbors of abc, an induced claw. Thus the three lists have no distinct representatives.

If two triangle edges are high, their two lists each have size at least two. Every two-list union then has size at least two; Hall's elementary three-set criterion forces the union of all three lists to have size at most two. Both large lists equal {x,y}. Each of x,y is adjacent to all of a,b,c, so actual endpoint closure makes the third list also contain both. The five vertices induce K5 minus possibly xy. The edge xy is NOT forced by this closure.

## 2. Every such K5-minus-edge support is a closed component

Write the core as abc and the two apices as x,y. A page ab z on a core edge with z outside these five vertices would, together with acx and bcy, make three independent neighbors of abc. A page ax z on a spoke edge, with z outside the five vertices, would similarly give three independent neighbors of abx via ab y, ax z, bx c. Relabeling covers all core and spoke edges. Hence no external triangle can share any edge of this K5-e support.

The only additional edge among these five vertices is xy. If present, an external page xy z would make an induced claw around axy using ax b, ay c, xy z. Thus the actual triangle component is exactly K5-e or K5.

These are classified or strict pieces: K5 has (nu,tau)=(2,4), while K5-e has (2,3). For the latter, two pages with different core bases and different apices form a packing. Three are impossible: a core triangle consumes all three base edges, and three noncore pages must have two equal apices and thus share a spoke. The three core edges cover. Two edges do not cover all seven triangles: a spoke meets only two; two core edges each meet three but overlap on the core triangle, covering at most five.

An entire such triangle component can be peeled by triangle-component additivity and proper-subgraph CS. A strict K5-e component makes the union strict; a K5 component preserves only the classified equality case. If it is the whole support, G itself already satisfies CS. Therefore a smallest failure contains no triangle with two high edges.

## 3. Every remaining link component is a cycle or a friendship graph

Fix a vertex a and put L=G[N(a)]. Every L vertex has degree at least two, since deg_L(b) is the actual codegree of ab. A branch vertex is one of degree at least three, equivalently a high edge ab.

Suppose b is a branch vertex and c is an L neighbor. In the actual triangle abc, the other two edges ac,bc are low. Let their unique outside-page apices be x and y respectively. They must coincide. Indeed if x!=y, avoiding a three-distinct-apex claw would force A_ab to be {x,y}; actual closure then makes ac and bc high as well, contrary to the preceding exclusion. Write x=y.

The triangles abc,acx,bcx supply a literal K4 on a,b,c,x. In L, c is adjacent exactly to b,x because ac is low. Also x is adjacent exactly to b,c: if ax were high, the triangle abx would have two high edges; and codegree two already supplies b,c as its link neighbors. Thus every neighbor c of b is paired with a degree-two vertex x, and the pair plus b is a triangle in L. These pairs exhaust the closed component containing b, because their vertices have no other L neighbors. The component is a friendship graph: at least two triangles sharing only b. Its sole branch vertex is b.

A component with no branch vertices is a finite connected graph all of whose degrees are two, hence a cycle. Consequently every L component is either a cycle or one of these friendship graphs.

For a cycle component, delete any one of its vertices: its remaining path is a tree component of L-w. For a friendship component, delete its central branch vertex: every remaining pair is an isolated K2 tree component of L-w. Both contradict the accepted link-deletion theorem. Since G has nonempty triangle support, at least one such nonempty link exists. This finishes the contradiction and proves the statement.

## 4. Equality, heredity, and scope

The class-minimal contradiction establishes combined CS, not just the inequality. Conversely K4 and K5 triangle components satisfy equality by additivity. Their triangle-intersection graphs are respectively K4 and the line graph of K5, both claw-free, so the equality description lies inside the stated class.

This is a different sufficient class from the earlier perfection hypothesis: K5 belongs here whereas its actual triangle-intersection graph is not perfect. No inclusion in the other direction is claimed. The class can also serve as a hereditary CS base for the accepted high-codegree-core localization theorem.

The essential graph-specific steps are the distinct-apex induced claw, literal K5-e/K5 closure, and the forced degree-two pairs in each link. Abstract linear hypergraphs or arbitrary claw-free intersection representations do not automatically have these properties. Every actual triangle, including crossing triangles, is used in the closure and isolation arguments.
