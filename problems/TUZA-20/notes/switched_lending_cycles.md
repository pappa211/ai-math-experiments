> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fully switched lending cycles can have unbounded length

Status: ordinary proof for a specific all-size family, pending independent reconstruction. This is a diagnostic for possible structural lemmas, not a proof of Candidate 02, a new global cover theorem, or an assertion of historical novelty.

## Literal family

Let r>=4. Indices below are modulo r. Take core vertices x_0,...,x_{r-1}, whose induced graph is the square of the cycle: x_i x_j is an edge precisely when their cyclic distance is 1 or 2. For each i add a fresh vertex a_i adjacent exactly to x_{i-1},x_i,x_{i+1}. There are no edges between a vertices. Specify

    T_i={x_{i-1},x_i,a_i},
    b_i=x_{i-1}a_i,
    Q_i={x_{i-1},x_{i+1},a_i}.

The T_i are pairwise edge-disjoint. Their support consists of all cycle edges x_{i-1}x_i and the two edges a_i x_{i-1},a_i x_i at each a_i. The gain of T_i is g_i=x_i x_{i+1}, owned by T_{i+1}. Its canonical centre is x_i and its private apex x_{i+1}; thus the centre switches on every lending step.

## Exact triangle structure for r=4 and r>=7

For r>=7, the core triangles are exactly the consecutive triples

    K_i={x_{i-1},x_i,x_{i+1}}.

Proof: if a core triangle contains x_0, its other vertices lie in {x_{-2},x_{-1},x_1,x_2}. The adjacent pairs in this four-vertex set are {-2,-1}, {-1,1}, {1,2}, giving exactly the three consecutive triples containing x_0. For r>=7, no extra wraparound adjacency occurs between the other pairs. This proves the claim at every vertex. The r triples are distinct.

For r=4, the core is K4 and its four triples are also exactly the four distinct K_i.

Every noncore triangle contains one a_i, and its other two vertices lie in K_i. There are exactly three such triangles at each a_i: T_i, Q_i and U_i={x_i,x_{i+1},a_i}. This accounts for every actual triangle. The family has 4r triangles, 2r vertices, and 5r edges for r>=7. At r=4 it has 8 vertices, 18 edges, 16 triangles.

## Maximum packing proof

Consider any packing, with q core triangles. Each such core triangle is a distinct K_i. It excludes every triangle through a_i, because every a_i triangle contains one of the three core edges of K_i. Moreover at most one triangle through any given a_i can lie in a packing: two choices of two neighbors among its three neighbors share a neighbor, hence share the edge from that neighbor to a_i.

Thus at most r-q noncore triangles can be selected. The packing has size at most q+(r-q)=r. The displayed P={T_i} has r members, so nu(G)=r. This argument handles all crossings and arbitrary choices of core/noncore triangles; it is not merely local maximality.

## Singleton privacy and the actual forced-gain cover

Q_i meets support only in b_i, since its core edge x_{i-1}x_{i+1} is a distance-two chord and the edge a_i x_{i+1} is outside support. U_i meets both T_i at a_i x_i and T_{i+1} at g_i. Every core K_j meets two packed cycle edges. There are no other triangles. Therefore each T_i has exactly the one private page Q_i, on b_i, so P is all-type-one and every owner is a singleton lender.

The gains are r distinct packed spokes. No gain is a private base. Candidate 02's forced set F is exactly the cycle-edge set, of size k=r. There is no additional spoke budget. Nevertheless the r bases together with F form a cover of size 2r: every Q_i meets its base, T_i and U_i meet a cycle edge, and every core triangle contains two cycle edges. Thus the forced-gain conjecture passes this family exactly at its nominal budget.

This family refutes a proposed auxiliary assertion that every closed lending cycle must have a common canonical centre or bounded length. It does not show that the cover is minimum, that all closed lending components are cycles of this form, or that arbitrary outside attachments preserve maximum cardinality or the stated cover.

## The exceptional lengths five and six fail maximum cardinality

At r=5 the core is K5. The displayed five-packing is not maximum. A six-packing consists of the core triangle {x_0,x_1,x_3} and these five triangles:

    {a_0,x_1,x_4}, {a_1,x_1,x_2}, {a_2,x_2,x_3},
    {a_3,x_3,x_4}, {a_4,x_0,x_4}.

The five noncore triangles use distinct core edges 14,12,23,34,04, none used by core triangle 013. Edges at distinct a_i are distinct. All are actual because their core endpoints lie in the respective consecutive neighborhoods. This verifies the six-packing directly.

At r=6, the core triangle {x_0,x_2,x_4} uses only distance-two chords, all outside B(P), so it can be appended to the six-packing P. The analogous odd triple is another actual core triangle. This is already a 0-to-1 maximality failure.

Lengths five and six must therefore be excluded from any claim that the displayed family satisfies the maximum-packing premise; they are deliberate negative controls.

## Boundary obligation

The proof uses the exact triangle family and does not license arbitrary outside attachments. An extra core triangle not equal to some K_i destroys the counting map and can create augmentation, as r=5,6 demonstrate. An extra noncore edge can create new triangles or private pages. Any generalization must preserve or replace those obligations explicitly.
