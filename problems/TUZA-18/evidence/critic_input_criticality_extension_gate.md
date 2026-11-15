# Bounded prescribed-packing extension has no automatic global upgrade

Status: ordinary proof draft; independent review pending; originality unestablished. This is a negative control of a proposed induction step, not a Tuza counterexample.

## Exact unbounded control

For every nonnegative integer b and positive integer q there is a finite simple graph G such that:

- every prescribed packing of at most b actual triangles extends to a maximum triangle packing;
- some prescribed packing does not extend;
- every actual graph edge has triangle codegree at least q;
- G has one nonempty shared-edge triangle component and satisfies tau(G)=nu(G).

The graph fails actual criticality: deleting a suitable single spoke lowers nu. Thus the theorem kills only a bounded-extension-to-all-extension inference, including an inference based on any fixed codegree threshold; it does not kill a theorem retaining actual criticality.

## Construction and maximum packing

Choose n>=max(b+2q,q+1,3). Let F be K_(n,n) with a perfect matching removed. Add an independent set of q new apex vertices, each adjacent to every vertex of F. Call this G. Since F and the apex set are triangle-free, every actual G triangle consists of one apex and one F edge.

A triangle packing is exactly a family M_1,...,M_q of pairwise edge-disjoint ordinary F matchings, one for each apex. Its size is at most qn. There exist q disjoint perfect matchings in F: label both sides by Z/nZ and use shifts j=1,...,q, omitting shift zero. Therefore nu(G)=qn.

All spokes from the q apices to one fixed side of F form a triangle cover of size qn. Every cover has at least nu(G) edges, so tau(G)=nu(G)=qn.

Every rim edge has exactly q common apex neighbors and therefore triangle codegree q. Every spoke has exactly n-1 triangle choices, at least q by the choice of n. F is connected for n>=3; the triangle incidence component at each apex is connected along adjacent F edges, and different apices are connected through triangles sharing any fixed rim edge. Hence G has one nonempty shared-edge triangle component.

## Extending every prescribed packing through b

A prescribed packing of p<=b triangles specifies pairwise disjoint rim matchings P_i for the q apices. Complete them successively to disjoint perfect matchings M_i. At stage i, remove the endpoints already matched by P_i, leaving equal bipartition sizes r=n-|P_i|>=n-b>=2q.

Forbid the original removed perfect matching, every previously chosen complete matching M_j, and every later prescribed matching P_j. Their union has maximum degree at most

    1+(i-1)+(q-i)=q.

The prescribed edges of P_i are compatible with those forbidden edges because the original prescriptions were an edge-disjoint triangle packing and the earlier choices avoided all later prescriptions. On the remaining balanced bipartite vertex sets, every vertex therefore has degree at least r-q>=r/2.

Such a bipartite graph has a perfect matching. For completeness, Hall's condition follows directly: a subset A of at most r/2 vertices has at least r/2 neighbors if nonempty; if |A|>r/2 and some vertex on the other side had no A-neighbor, its degree would be at most r-|A|<r/2, impossible. Thus N(A) is all the other side in that case. Complete P_i and continue. The final union is a qn-packing containing the prescribed triangles.

## A nonextendable packing and failure of actual criticality

Choose one forbidden pair (u_0,v_0) from the removed perfect matching. On the remaining n-1 vertices of each side, choose a perfect matching avoiding the remaining removed pairs; a cyclic shift provides one because n-1>=2. Use its n-1 rim edges as triangles at apex 1. These triangles cannot be extended to n triangles at that same apex: the only unused endpoints are u_0,v_0 and their edge is absent. A maximum qn-packing must have exactly n triangles at every apex, so this prescribed packing is nonextendable.

Every maximum qn-packing uses all 2qn spokes, because each triangle uses two spokes. Deleting one spoke therefore leaves at most floor((2qn-1)/2)=qn-1 packed triangles. This violates the one-edge packing resilience of an actual minimal Tuza violation. It also displays full apex capacity, which the prior genuine-critical nonsaturation lemma excludes.

## Application to the proposed three-triangle route

In a genuine actual critical G, a nonextendable prescribed three-packing P forces, by the existing criticality arithmetic,

    nu(G-E(P))=nu(G)-4,
    tau(G-E(P))=2nu(G)-8,
    tau(G)-tau(G-E(P))=9.

Thus all nine prescribed edges lie in some minimum G cover. This exact state is useful only with a further graph-specific exchange theorem. It cannot itself be sampled as a relaxed graph control: together with the displayed tight residual and packing gain four, the cover gain nine already says tau(G)=2nu(G)+1.

Even proving that this three-packing failure cannot occur would not by itself establish that all prescribed packings extend. The construction above proves that a separate all-size induction or availability theorem is indispensable; no fixed extension bound gives that step automatically.
