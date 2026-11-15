# Exact control proofs and evidence boundaries

These reconstruct the requested negative controls; they are not new routes to Tuza. Full edge lists, independently enumerated actual triangles and explicit witnesses are in evidence/controls.json. Computation uses newly authored checks/controls.py, not historical executables. Independent certificate verification is a separate closeout obligation.

## The 27-vertex vertex-balance obstruction
Let J have vertices Z/13Z and differences ±1,±5; let H=J[2] be the independent two-twin blow-up, and G the cone with apex z.

J has 26 edges and is triangle-free: the sum of any two elements of {1,5,8,12} is never in that set modulo13 unless the two-step walk returns to its start, which is not a triangle. The set {0,2,4,6} is independent. To exclude an independent five-set, list its five positive cyclic gaps. Each is >=2 and they sum13, so the extra amounts above2 partition3. The possible gap multisets are {5,2,2,2,2}, {4,3,2,2,2}, {3,3,3,2,2}. The first has a forbidden difference5. In the second the unique3 must be next to a2 on at least one side, again giving difference5. In the third some adjacent pair is3,2, also forbidden. Thus alpha(J)=4. Every independent set of H projects to an independent set of J, and both twins of each selected vertex can be taken, so alpha(H)=8.

H is triangle-free, with26 vertices and104 edges. G therefore has27 vertices,130 edges and exactly104 triangles, each zxy for xy in E(H). The13 edges joining (i,0) to (i+1 mod13,1) form a perfect matching in H. Their cone triangles give a13-packing. Every triangle uses two of26 spokes, so nu(G)=13. All maximum packings thus have13 triangles through z.

For any triangle-free base H of order n, a minimum cone cover is specified by its unselected-spoke set U: its rim edges are exactly E(H[U]), since any other rim edge is redundant. Hence its size is n-|U|+e(H[U]). Deleting at most one endpoint per induced edge yields an independent set, proving |U|-e(H[U])<=alpha(H); equality is attained at a maximum independent set. Thus tau(cone(H))=n-alpha(H), here18.

For this double-twin H, every optimal U is independent. Indeed, if two edges of H[U] share a vertex, deleting their common endpoint and one endpoint for every remaining edge leaves an independent set larger than |U|-e(H[U])=alpha(H). Thus H[U] is a matching plus isolated vertices. Choose one endpoint of every matching edge and all its isolated vertices to obtain a maximum independent set I. If there is a matching edge xy, the selected endpoint x cannot have its twin in U (otherwise y has two neighbors in H[U]); but that twin has precisely x's neighbors and can be added to I, contradiction. Therefore e(H[U])=0. Every minimum cover consists of18 spokes, and all have apex incidence18. This proves the VB contradiction 18>52/3 for arbitrary distributions over the optimal objects; the correct minimum-over-covers dual quantifier does not rescue it.

The exact enumeration of all3^13 occupancy patterns independently supplements this proof: cost26-sum(u_i)+sum_{ij in E(J)}u_i u_j, minimum18,39 optimal patterns, every u_i in {0,2}. The count39 is FINITE_CHECKED, while optimum values and all-spokes classification have the ordinary argument above. No arbitrary130-edge exponential search is used.

## K10 and K11: precise payment failure
For K10 each packing uses at most four triangles at each vertex, so3nu<=40 and nu<=13. The retained13-packing attains this. For K11 the edge count gives nu<=18;18 triangles would leave exactly one edge. K11 has all degrees10, and edges used by a triangle packing have even degrees, so the leave must have even degrees everywhere. A single edge is impossible. The retained17-packing attains the resulting bound.

For each nonempty F supported on at most five vertices, the witness certificate gives a packing in Kn-F of size at least nu(Kn)-ceil(|F|/2)+1. Consequently

2[nu(Kn)-nu(Kn-F)] <= 2ceil(|F|/2)-2 < |F|.

This disproves payment for every such F. The33 representatives come from the installed NetworkX atlas, with isolated vertices removed from the support and n<=5. Independent verification must check class completeness without relying on the same atlas. Full triangles, baseline upper-bound arguments, residual packing witnesses and search status are retained. No residual optimum is claimed from a lower-bound witness. No conclusion concerns support6 or larger, other n, residual slack, or a statement restricted to minimal Tuza counterexamples. Other n in the supplied table remain REPORTED_NOT_REPLAYED.

## Literal blocks and Cartesian product
K4 has nu1 because any two faces share an edge, and tau2 (one edge cannot meet all four faces; a disjoint pair does). K5 has nu2 by the six-edge packing witness and impossibility of three edge-disjoint triangles: nine used edges would leave one edge, impossible as the full degrees4 and used degrees are even. Tau4: a triangle-free graph on five vertices has at most6 edges by the elementary Mantel bound, and a K2,3 attains6. Thus deleting4 edges suffices and is necessary. The standard short bound is e<=floor(n^2/4) for triangle-free graphs: for each edge uv, d(u)+d(v)<=n; summing gives sum d(v)^2<=ne, and Cauchy yields4e^2/n<=ne.

In K4 square K5 adjacency means exactly one coordinate agrees. A triangle containing an edge with fixed first coordinate must keep that coordinate at its third vertex, unless that third vertex simultaneously equals both distinct second coordinates, impossible. The analogous fact holds for a fixed second coordinate. Hence all triangles lie wholly in the four K5 rows or five K4 columns. Their edge sets are disjoint. Both optima add, giving nu=4*2+5*1=13 and tau=4*4+5*2=26. This reasoning would fail if diagonal or arbitrary cross edges were added; none are present. The shared-single-vertex block family is checked by the same full triangle decomposition, giving (7,14).

## Exact archived obstruction controls
The Clebsch cone is exactly the Cayley base on F2^4 with differences {1,2,4,8,15}, plus apex16; it is not a substituted graph. The pinned complete proof is sources/public/problems/TUZA-11/arguments/CLEBSCH_PRIVATE_OBSTRUCTION.md. The new enumeration reconstructs all65536 unselected-spoke subsets and confirms16 minimum covers, tau11, explicit matching/packing8, and private packing5 for every minimum cover. The displayed private5-matchings have a5-spoke transversal upper bound. This refutes the private-only bridge, not Tuza.

The four-port graph is exactly the pinned edge set in sources/public/problems/TUZA-12/notes/FOUR_PORT_RESTORATION_COUNTEREXAMPLE.md. Its17 edges and11 triangles are reconstructed. Deleting02,13 yields7 triangles. Four disjoint pages and an explicit4-cover prove (nu,tau)=(4,4) after deletion. Before deletion six odd-degree vertices forbid a5-packing (a two-edge leave has at most four odd vertices); K4 needs two core-cover edges and three pairwise edge-disjoint external triangles need three additional edges. Together with a5-cover this proves (4,5). It refutes zero-cost neutral restoration only.

The abstract Fano plane has seven3-sets, any two intersect, and transversal number3: one or two points cannot hit every line (two points hit at most5 lines), while a line hits every line. Thus nu1,tau3. This is not the triangle hypergraph of a finite simple graph and is never counted as a graph counterexample. It identifies the need for substantive graphic structure.

No certified finite Baron–Kahn instance was located in the selected pinned inventory. Status NOT_AVAILABLE; arbitrary clique blow-ups are not substituted.
