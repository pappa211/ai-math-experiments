> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Route B: gain-one extension theorem and four-edge corollary

Status: PROVED by ordinary argument, accepted in independent internal AI review during TUZA-07. This is not human peer review. No Lean verification. Historical novelty unassessed. Written 2026-10-31 during TUZA-07.

Independent review: saved critic reconstruction (historical source reference).

## Exact hypotheses

H and G are finite simple graphs on a common vertex set, with E(H) subset E(G). Adding isolated vertices to H permits arbitrary new vertices. Every nonempty triangle component of H, where triangles are joined through shared graph edges, has literal edge support a complete K4 or K5. All H edges not in these supports are allowed; they lie in no H triangle. Let h=nu(H), and let N be the family of G triangles that are not H triangles. Thus tau(H)=2h. No degeneracy or degree assumption is made on G or its triangle-free background.

### Theorem B1 (packing-gain-one cover completion)

If nu(G)=h+1, then tau(G)<=2h+2.

More sharply, if N contains a triangle with two old edges in H triangle-block supports, then tau(G)<=2h+1. If there are no new triangles, both optima are unchanged. If there is any new triangle, nu(G)>=h+1.

### Corollary B2 (four additions)

If |E(G) minus E(H)|<=4, then tau(G)<=2nu(G).

Consequently the first edge-addition frontier left by B1 is FIVE additions with packing gain exactly two; this does not claim that five additions fail.

## Local facts and proofs

1. Each new triangle Q uses at most one old edge in any one H block. Indeed two edges of a triangle share a vertex and contain all its vertices. If two belong to one clique block, its third edge also belongs to that block and hence H, contradicting Q being new.

2. In K4 a maximum triangle packing has size one. It can avoid any one edge. It can avoid two distinct edges exactly when those edges are incident; if they are opposite, removing them leaves a 4-cycle. Every opposite pair is a minimum triangle cover of size two.

3. In K5 a maximum packing has size two and a minimum cover has size four. Every prescribed edge belongs to some minimum cover: partition the vertices into sizes 2 and 3 with the edge inside a part, and delete the internal edges. A maximum packing can avoid any set of at most two edges. Up to symmetry for two removed adjacent edges 12,13, the triangles 145 and 234 are edge-disjoint and avoid them. For two removed disjoint edges 12,34, triangles 135 and 245 do so. A singleton can be extended to a pair for this conclusion.

4. Block supports are edge-disjoint, every old triangle belongs to one block, and old triangle-free edges do not affect old optima. Thus maximum block packings and minimum block covers unite independently. Components may share vertices and arbitrary triangle-free attachments are retained.

## Compatible pair principle

Two new triangles P,Q can be appended simultaneously to some maximum H packing provided (a) they are edge-disjoint and (b) there is no K4 block in which their respective old edges form an opposite pair. Each uses at most one edge per old block by Fact 1. In a K5 block the two old edges can be avoided by Fact 3; in K4 the allowed pair can be avoided by Fact 2. Taking a maximum packing in each block avoiding their old edges then appending P,Q proves nu(G)>=h+2.

This is only a sufficient statement for a two-triangle augmentation, not an assertion that every maximum G packing has this form.

## Proof of B1

First, any individual new triangle can be appended to a maximum H packing because it uses at most one old edge per block. Hence any nonempty N raises nu by at least one.

Suppose nu(G)=h+1, so no pair satisfying the compatible pair principle exists.

Case I: some new triangle P has at least one edge in an old H block. For each block touched by P, choose a minimum block cover as follows: in K4 choose the opposite pair containing its P edge; in K5 choose a minimum cover containing its P edge. This is possible independently because P uses at most one edge per block. In every untouched block choose any minimum cover. Let C be their union, so |C|=2h. Put D=E(P) minus the union of all H block supports. Then |D|<=2 (and <=1 if P touches two block supports).

We claim C union D covers every G triangle. It covers H triangles because C does. If a new triangle Q avoids C union D, it is edge-disjoint from P, because every edge of P belongs to C union D. Further, Q cannot use the edge opposite the edge of P in any touched K4 block, because that opposite edge is included in C. Thus P,Q satisfy the compatible pair principle, yielding h+2 packed triangles, a contradiction. Therefore tau(G)<=|C|+|D|<=2h+2, and the sharpened <=2h+1 holds when P has two old block edges.

Case II: no new triangle uses an old block-support edge. Every maximum H packing is then edge-disjoint from every member of N. As nu(G)=h+1, N has no two edge-disjoint members. A pairwise edge-intersecting family of graph triangles has an edge transversal of size at most two, as shown below. Unite such a transversal with any minimum H cover, obtaining a G cover of size at most 2h+2.

This proves B1 in both cases, including arbitrary outside attachments.

## Elementary pairwise-intersecting triangle-family lemma

Let F be any nonempty family of graph triangles with no edge-disjoint pair. If all triangles share one edge, that edge covers F. Otherwise choose two distinct triangles abc and abd, c!=d, sharing ab. Some R avoids ab and intersects both. Its meeting edges cannot be disjoint, so R is acd or bcd; exchange a,b to take R=acd. Any triangle meeting all three abc,abd,acd must lie on {a,b,c,d}: a triangle using an outside vertex cannot contain two different edges of the displayed triangle family, since any two such incident edges already contain three of a,b,c,d; a single such edge common to all three does not exist. Hence F is contained in the four faces of this K4. Any opposite edge pair covers it. Thus an edge cover of size at most two exists.

## Proof of B2

If N is empty, both optima equal those of H and Tuza holds. Otherwise q=nu(G)-h>=1. If q=1, apply B1. If q>=2, any minimum H cover together with all at most four added edges covers G, so tau(G)<=2h+4<=2(h+q)=2nu(G). No assertion about general Tuza is used.

## Audit cautions / correction of an earlier sketch

An earlier third-addition sketch attempted to include every old spoke of a selected new triangle in a minimum H cover. That is FALSE for triangle-free old spokes: including them costs an extra edge. This proof explicitly pays for all edges outside old block supports through D, whose size is at most two in Case I. Case II handles the entirely unsupported family separately. The earlier sketch is retracted, not treated as evidence.

K5 avoidance is only used for at most TWO removed edges. The proof does not assume a K5 maximum packing avoids three edges, including the known three-edge-star obstruction.

## Scope and remaining frontier

B1 controls an arbitrary number of added edges when the net packing gain is one, and B2 is a consequence. It gives a degree-independent extension criterion, but does not alone provide reductions for every potential minimal counterexample. For five added edges, the uncovered case has q=2 and possible cover upper bound 2h+5, requiring one unit of structural cover saving or additional packing. Generalizing selected-triangle completion to two selected new triangles must cope with multiple reservations within the same K4/K5 block and the K5 three-star obstruction.
