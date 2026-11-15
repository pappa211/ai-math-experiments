# Private-apex fibres: exact local exchange, insufficient abstract halfset conditions

Status: elementary local lemma reconstructed in TUZA-19; no independent review yet. The corollaries below do not establish a halfset, a type1 cover theorem, or a global reduction. This note closes a specific attempted route at its exact missing compatibility step.

## Intended global implication

For a specified maximum all-type1 packing P, let R be its private bases and U=E(P) minus R. There are p bases and2p nonbase support edges. Every support cover must contain R. The desired type1 PK subtheorem is therefore an edge set D contained in U of size at most p meeting every actual triangle avoiding R. Such a triangle has either two U edges and an outside-support edge, or three U edges. Both kinds must remain in the problem.

A proposed structural approach classifies the pair constraints first and seeks an independent halfset of U that is also triangle-free as a set of actual graph edges. Local private-page couplings suggest grouping owners by their private apex. The exact lemma below applies inside such a fibre even when its apex is packed elsewhere, so it does not assume a globally available common-apex decomposition.

## Definitions and local role separation

Fix a vertex z. Let F_z be any collection of type1 members T_i of a specified maximum packing P such that T_i has a private page on its unique private base with apex z. Write T_i=a_i b_i x_i, where a_i b_i is its private base and x_i its canonical centre. Let A_z be the union of those base endpoints and X_z the set of those centres.

Then A_z and X_z are disjoint. Otherwise x_i is a base endpoint of another member T_j in F_z. Its private page supplies the outside-support edge z x_i. The private page of T_i also supplies outside-support edges z a_i,z b_i. Together with T_i these form a private K4 completion, giving private pages on more than one T_i edge and contradicting type1. Each z x_i is therefore absent from the relevant private-page edge set; in fact it cannot be an actual outside-support edge at all. The vertex z lies outside every T_i by privacy, although it may lie in other packed members not in F_z.

The private bases in F_z form a simple graph H_z on A_z, properly edge-coloured by the canonical centres: base a_i b_i has colour x_i. No two bases have the same endpoints, by edge-disjointness of P; no two bases of the same colour share an endpoint, since the corresponding packed triangles would share a spoke.

Let N_z consist of the actual graph edges between X_z vertices that lie outside the FULL support B=E(P). This is triangle-free, since any triangle entirely outside B could be appended to P.

A residual pair constraint whose two U edges belong to members of F_z must meet at a base vertex a, and has the form a x u with x,u in X_z and xu in N_z. If its two spokes met instead at a shared centre x, its other endpoints a,b would both lie in A_z, so za,zb would be outside B. Its outside-support third edge ab would then form the outside-B triangle abz, contradicting maximality. Consequently the pair-constraint graph inside this fibre is the disjoint union, over a in A_z, of N_z induced on the colours incident with a in H_z.

This description concerns pair constraints internal to F_z. It does not account for all other U constraints.

## Exact 4-for-3 exchange

Suppose H_z contains distinct bases

    e=ab of colour x, f=ac of colour u, g=bd of colour v,

and there are actual residual pair triangles

    Q=a x u, Q'=b x v.

Assume u!=v. Then c=d.

Proof: x,u,v are distinct, since the displayed pair triangles are genuine triangles. If c!=d, simplicity and the distinct bases imply that a,b,c,d are four distinct vertices. The private pages acz and bdz are edge-disjoint because their bases are vertex-disjoint. They are edge-disjoint from Q,Q': the pages use only A_z vertices and z, whereas the pair triangles use A_z--X_z spokes and X_z--X_z edges; the two role sets are disjoint and z lies outside them. The pair triangles are mutually edge-disjoint: they share at most x, because a!=b and u!=v, with no A_z/X_z identification possible.

Thus Q,Q',acz,bdz are four edge-disjoint actual triangles. Their support edges belong only to T_e,T_f,T_g, and their other edges are outside B. Replacing those three packed members by the four displayed triangles enlarges P, a contradiction. Therefore c=d.

The requirement u!=v is material. If the two centres coincide, Q and Q' share their closing outside-support edge xu, so this exchange is unavailable. The frozen TUZA-18 private-packed-tip proof automatically had u!=v because all centres were distinct; this fibre formulation states the exact retained condition when centres may repeat.

## Consequences for the internal pair graph

Pair the two nonbase edges ax,bx belonging to the packed member with base ab and centre x; call them mates. Let A and B be the sets of centre colours joined to x by internal pair constraints at a and b respectively.

For every u in A and v in B with u!=v, the corresponding bases at a and b must meet at their other endpoint, by the exchange lemma. Fix v in B. Distinct base edges at a cannot have the same other endpoint, so |A minus {v}|<=1. Consequently:

1. If one mate has internal pair-degree at least3, the other is isolated.
2. If both mates have internal pair-degree at least2, both degrees equal2 and A=B.
3. Two adjacent internal pair-graph vertices of degree2 cannot BOTH have mates of degree2.

For the last statement, let the adjacent pair vertices at a have colours x,u and correspond to bases ab,ac. If both mates have degree2, write their common neighbour sets as {u,v} for colour x and {x,w} for colour u. The exchange lemma applied across ab forces base bc to have colour v; applied across ac it forces the same base bc to have colour w. Hence v=w. But N_z then contains the triangle on x,u,v, since xu,xv,uv all occur. This is impossible.

These are exact graph-realized constraints. None is claimed to characterize realizable fibre graphs or all consequences of maximum packing.

## Decisive abstraction failure

The three degree/mate consequences by themselves do NOT imply an independent set of half the vertices. Take the ABSTRACT graph D equal to two disjoint5-cycles and five disjoint single edges. It has20 vertices and independence number2+2+5=9. Pair its10 cycle vertices bijectively with its10 matching-edge endpoints, forming10 nonadjacent mate pairs. Every degree2 vertex has a degree1 mate; every degree1 vertex has a degree2 mate. Thus all three displayed consequences hold, but alpha(D)=9<10.

This is NOT an actual graph-triangle packing example. No realization as H_z,N_z with the full endpoint constraints and maximum-packing hypothesis is asserted. Its role is to prevent an invalid inference from the degree corollaries alone. A further proof must retain the full coloured base geometry or a stronger augmentation theorem.

## Cross-fibre and three-edge gap

If a private page is unique, an additional pair triangle can create a two-spoke lending relation from its owner to the packed owner of the edge joining its canonical centre to its private apex. The recipient, when it exists, is unique because the gain edge has one owner in P. Such relations leave the private-apex fibre and can consume its local cover budget. Rigid K5 configurations also occur: both adjacent type1 members can have two private pages. They must not be discarded by a singleton-page classification.

A full type1 theorem must simultaneously handle these interfaces and all actual triangles consisting of three U edges. The frozen arbitrary-core embedding demonstrates that those three-edge constraints can contain arbitrary graph triangle geometry even when the pair graph is empty. No implication from a pair-only halfset to a full triangle cover is assumed here.

The next required lemma would be an integral, boundary-compatible halfset theorem for the realized coloured fibres and their lending/rigid interfaces, while also excluding every all-U triangle. No available premise currently forces the boundary conditions needed for such a theorem, and the abstract corollaries already fail. This restricted halfset pursuit is stopped rather than extended by a graph-order census.

## Source qualification

The standard private-page0/1/3 taxonomy and the singleton-page lending idea occur in Chalermsook--Khuller--Sukprasert--Uniyal, arXiv:2001.00257v2. A direct primary-source check found that Proposition13 as PRINTED omits the K5 two-private-page configuration; the independent audit in ../review/cksu_prop13_independent_audit.md confirms the exact omission. Its separately defined Lemma18 recipient-uniqueness argument remains valid when the stated unique-private-page premise is retained. No conclusion about the paper's existential main theorem is inferred from that local defect. The exchange lemma above was reconstructed directly and does not import Proposition13.
