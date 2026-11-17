> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Mandatory singleton gains can exceed the fixed support budget

Status: complete ordinary argument submitted for independent reconstruction, with independent literal checker results to be cited by the coordinator. This refutes Candidate 02, not PK-all, PK-exists, or Tuza. No priority or Lean claim.

## Graph, packing, and exact claim

Take K5 on vertices {0,1,2,4,5}. Add the triangles

    013, 036, 167, 678, 189, {8,9,10}, {1,10,11}, {3,10,11},

and no other edges. The notation ijk denotes the triangle on those three vertices; braces remove ambiguity for two-digit labels. Let

    A=013, Q=124, R=025, D=167, E=189, H={1,10,11},
    P={A,Q,R,D,E,H}.

The graph has 12 vertices and 29 edges. Its full triangle family has 26 members as proved below. The packing P has six pairwise edge-disjoint members and is maximum.

Every owner is singleton type one. Their bases and unique private pages are:

| Owner | Base | Unique private page | Gain |
|---|---|---|---|
| A=013 | 03 | 036 | 16 |
| Q=124 | 14 | 145 | 25 |
| R=025 | 05 | 045 | 24 |
| D=167 | 67 | 678 | 18 |
| E=189 | 89 | {8,9,10} | {1,10} |
| H={1,10,11} | {10,11} | {3,10,11} | 13 |

Thus all six gains are distinct packed spokes, none is a base. Put

    B0={03,14,05,67,89,{10,11}},
    F={16,25,24,18,{1,10},13}.

Candidate 02 requires a cover containing the six bases and all six gains, with total size at most 12. That uniquely forces B0 union F, which misses the actual triangle 012. The minimum cover inside B(P) that also contains F is exactly 13, while c_G(P)=12. This is a counterexample to simultaneous compulsory gain selection at the exact 2k threshold.

## Complete triangle ownership

Let S be the star block on vertices {0,1,3,6,7,8,9,10,11}, consisting of the eight added triangles. Its apex is 1. Its link H0 has exactly the edges of the four triangles

    L_A=036, L_D=678, L_E={8,9,10}, L_H={3,10,11}.

These four triangles are edge-disjoint. They form a cycle under vertex intersection: their shared vertices, in order, are 6,8,10,3. The vertices 0,7,9,11 each lie in only their own link triangle. The shared-vertex cycle 3-6-8-10-3 is chordless. Consequently the only triangles of H0 are the four displayed L triangles. Each of its 12 edges gives one apex triangle with vertex 1. Thus S has exactly 16 triangles and 20 edges.

The star block S and the K5 block intersect exactly in vertices {0,1} and their edge 01. No edge joins an exclusive vertex of one block to an exclusive vertex of the other. Every triangle therefore belongs to exactly one block. The full graph has 16+10=26 triangles and 20+10-1=29 edges. This also accounts for all crossing obligations: there are no additional triangles spanning exclusive vertices of both blocks.

## Exact maximum-packing proof

The star block's sixteen triangles are partitioned among four literal K4s:

    {0,1,3,6}, {1,6,7,8}, {1,8,9,10}, {1,3,10,11}.

Each has four faces. Adjacent K4s share only their indicated apex edge; nonadjacent ones share only apex1. Thus no triangle belongs to two of them. The complete triangle classification above confirms that no other star-block triangle exists.

Any two triangles of a K4 share an edge, so a packing takes at most one triangle from each of those four blocks. Also nu(K5)=2: three edge-disjoint triangles would use nine of ten K5 edges, leaving one edge; but K5 has even degree at every vertex, as does a union of edge-disjoint triangles, whereas a single edge has odd degree at its endpoints. Two edge-disjoint K5 triangles are explicitly Q,R.

Every full-graph triangle belongs uniquely to the K5 or one of the four K4s. Therefore any packing has at most2+4=6 members. This upper bound does not require disjoint block edge sets: overlap can only impose additional restrictions. The displayed P has six edge-disjoint members, so nu(G)=6.

This simpler ordinary certificate was independently supplied by the verifier; it replaces a valid but longer matching analysis of the star ring.

## Singleton privacy in the original packing

Within S, the support of A,D,E,H consists of all apex spokes from 1 to its eight neighbors, together with bases 03,67,89,{10,11}. Every nonpacked apex triangle therefore contains two packed spokes, and cannot be private. Each of the four link triangles contains its one designated base and two outside-support edges; it is private on that base. These are the only non-apex triangles.

The K5 triangles which use 01 are 012,014,015. They have respectively other support edges from Q,R, from Q, and from R, so they do not create any new private page for A. Other star owners meet no K5 edge.

For Q=124 and R=025, enumerate the ten K5 faces: their unique private pages are 145 on base14 and 045 on base05. All other nonpacked faces meeting their support have another support edge in A,Q,R. No star triangle meets a Q or R edge. This establishes precisely the table, and hence all-type-one with no private K4 completion: A(P)=B(P).

## Forced-gain lower and upper bounds

Every support-contained triangle cover must contain all six bases, since each unique private page has exactly that one support edge. All six forced gains are distinct and disjoint from the bases. Their union is a 12-edge set and misses 012. Therefore a support cover containing F needs at least 13 edges.

Adding 01 gives a 13-edge cover. On S, its four bases together with its four gains {13,16,18,{1,10}} cover every triangle: a link triangle meets its base; an apex triangle either uses a base as its link edge or has a selected apex spoke at one of {3,6,8,10}. On K5, the set {01,14,05,24,25} meets all ten faces. The complete triangle-ownership argument then proves full coverage. Thus the forced-gain optimum is exactly 13.

## A 12-edge permitted cover, by releasing one gain

Replace gain25 by spoke12:

    C = B0 union (F minus {25}) union {12}.

It has 12 edges and lies in the original B(P). Its star-block portion is unchanged and covers S. Its K5 portion is {14,05,12,24}, the edges inside the vertex parts {1,2,4} and {0,5}; every K5 triangle has two vertices in one part and is hit. Therefore C covers every actual triangle.

This repair gives Q both spokes12 and24, while R gets neither spoke. Their loads are 3 and1, respectively; all other owners have load2. No extra gain is added and no saving is used twice. The actual residual clauses are retained throughout. This is a literal permitted cover, not a shortened 2-SAT argument.

## The support optimum is exactly 12

All six bases are mandatory. The six actual triangles

    016, 178, {1,9,10}, {1,3,11}, 024, 125

give the respective residual clauses

    {01,16}, {17,18}, {19,{1,10}}, {{1,11},13}, {02,24}, {12,25}.

The third edge of each triangle lies outside B(P), and none of these triangles contains a private base. The twelve physical spoke edges in these six pair clauses are pairwise distinct. Hence every support-contained cover needs at least one spoke for each clause, for at least six spokes in addition to the six bases. This proves c_G(P)>=12. The displayed twelve-cover attains equality.

The six-clause lower-bound certificate was independently supplied by the verifier. It is used only as a lower bound. The full twenty-six actual triangles, including three-support triangle012, remain necessary for validating the upper-bound cover.

## Meaning and remaining global obligation

The failure survives full global reuse of all cardinality savings: there are no repeated gains and no gain already paid as a base, so all six units are consumed. The repair must be allowed to retract a previously selected gain. The graph has a four-cycle of singleton lending at centre1 and a reciprocal pair at centre2; a shared-edge boundary triangle012 couples them. The star block contributes the packed edge01 to the K5 block. Relative to the full packing, that boundary edge removes one private page from each of Q and R, turning the usual multi-page K5 pair into singleton lenders. The compulsory gain choices then miss012, whose third support edge belongs to owner A in the star block. Thus the example concerns full-packing privacy and an actual triangle across the owner groups; it is not a union of valid separate covers which somehow fails to cover their union.

The explicit local repair does not prove a universal repair rule. For arbitrary outside attachments, deleting gain25 could uncover additional clauses, and selecting12 could trigger other obligations. A continuation therefore needs an all-clause, globally budget-preserving gain-release operation with valid availability and termination, or a different direct cover method. The original all-type-one problem, mixed-state extension, PK-all, PK-exists, and unrestricted Tuza remain open.

## Literal full triangle list

Using integer vertex labels, the complete list is

    [0,1,2], [0,1,4], [0,1,5], [0,2,4], [0,2,5],
    [0,4,5], [1,2,4], [1,2,5], [1,4,5], [2,4,5],
    [0,1,3], [0,1,6], [1,3,6],
    [1,6,7], [1,6,8], [1,7,8],
    [1,8,9], [1,8,10], [1,9,10],
    [1,3,10], [1,3,11], [1,10,11],
    [0,3,6], [6,7,8], [8,9,10], [3,10,11].

The edge list is exactly the union of these triangles' edges; the retained independent literal certificate should also record it explicitly.

## Provenance and focused continuation assessment

The construction was developed jointly within this mission. The mathematical collaborator proposed closing the formerly free owner in the archived private-pair core into a common-centre three-cycle. That first attempt was rejected immediately because its private pages create the outside-support triangle368, augmenting the packing. The coordinator and collaborator then independently identified a four-cycle replacement; the coordinator ran exact optimization and the collaborator supplied the all-size star-ring matching bound and explicit gain-release cover. The independent verifier reconstructed the literal graph and optima separately, and supplied the simpler five-block maximum certificate and six-disjoint-clause cover lower bound now used above. Its exact check reports 891 maximum packings, c_G(P)=12, forced-gain optimum13, and unrestricted tau(G)=10; the unrestricted tau claim is finite certificate scope, not needed by this ordinary refutation proof. The archival ingredients are the private-pair core and common-centre support-cover mechanism; this note claims only the exact new forced-gain obstruction, without historical priority.

The witness supports optional gain release, but that is not a sufficiently precise new global theorem to continue by itself. Its repair is exactly the already recognized singleton 3/1 transfer, now shown indispensable even after all repeated/base-gain savings are globally available. A universal release theorem would have to control every clause affected by the removed edge, including arbitrary outside attachments, repeated owners and completion states. No new availability or termination argument is supplied. Weakening Candidate02 to 'some optional gains can be chosen' simply returns to the original all-type-one support-cover problem.

Recommendation: after independent certificate checking and adversarial proof review, stop early with main outcome REFUTED_CANDIDATE. No unrestricted global obligation has been discharged. Do not launch a third candidate merely to restate PK-all or spend the remaining time on a larger census. A later continuation requires a genuinely new boundary-compatible release lemma, not only this local successful substitution.
