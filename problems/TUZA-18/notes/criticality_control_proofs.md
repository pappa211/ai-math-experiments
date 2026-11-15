# Ordinary certificates for the criticality controls

These are controls of declared surrogate claims. They are not Tuza counterexamples. No finite surviving search is treated as proof of a universal implication.

## K5 and two K5s sharing an edge

K5 has nu=2 (floor(10/3) is three, but three edge-disjoint triangles would leave one edge and hence an odd-degree residual, whereas K5 and any triangle union have even degrees). Two disjoint triangles exist, e.g. 012 and 034. Mantel's five-vertex bound gives tau>=10-6=4, attained by internal edges of a 2+3 partition.

Deleting two incident edges 01,02 leaves the packing 034,123. Deleting two disjoint edges 01,23 leaves 024,134. These are all two-edge types up to symmetry. One-edge packing stability follows. Tau(K5-e)=3 and tau(K5-{e,f})=2: Mantel supplies lower bounds, while put the removed edge(s) inside the two parts of a balanced 2+3 partition to attain them. For incident e,f put their three endpoints in the three-part; for disjoint e,f put one in each part. This also means a minimum cover of K5-e can be chosen to contain any remaining specified edge f.

For two copies sharing just edge e, triangles lie in one copy. Four triangles can be packed, independently avoiding e in each copy. No packing has more than four because each copy packs at most two. Triangle covers require at least four edges in each copy, and the overlap is at most e, giving tau>=7. Minimum covers containing e attain seven. Delete any two graph edges: each copy loses at most two edges and still packs two, with the two local packings chosen to avoid e if it survives only when necessary. More explicitly, if neither deleted edge is e and both lie in one copy, choose that copy's two-packing; if it uses e, choose an e-avoiding two-packing in the untouched copy. If one edge is deleted in each copy, one must choose a two-packing avoiding its own deletion and e, which exists by the two-edge result, and the other chooses any two-packing avoiding its own deletion. If e is deleted, both local packings automatically avoid it. This corrects the need to check compatibility at the shared edge rather than merely adding arbitrary local packings.

Deleting e gives two K5-e covers of three each, total six. For a noncommon deleted edge f, select a three-cover of its copy minus f containing e, and a four-cover of the other copy containing e; their union has six edges. Since deleting one edge can lower tau by at most one, both cases have tau=6. Thus the glued graph is edge-cover-critical and two-edge-packing-resilient, but has (nu,tau)=(4,7).

## K2 join C5

Let the rim cycle be 0,1,2,3,4,0 and the adjacent universal hubs be 5,6. There are sixteen edges. Its actual triangles are exactly the ten rim-plus-hub triangles and the five hub-edge triangles 56i.

A cover containing 56 needs at least five additional edges: the ten rim-plus-hub triangles remain, and each rim/spoke edge hits at most two of them. Taking all five rim edges and 56 attains six.

A cover avoiding 56 needs at least one of i5,i6 for each i. If it has at most five edges, it consists of exactly one spoke at each rim vertex. To cover both hub triangles at each rim edge, the endpoint spoke choices must differ. This would two-color C5, impossible. Thus every cover has at least six edges and tau=6.

There are two triangle types up to automorphisms. For triangle 015, the six-cover

    {01,05,15,26,35,46}

contains it. For triangle 056, the six-cover

    {05,06,12,23,34,56}

contains it. Each set visibly meets all fifteen actual triangles. Hence every triangle lies in a minimum cover, proving Q. Every edge lies in a triangle, so Q also implies each edge lies in a minimum cover and is cover-critical.

The four triangles 045,126,235,346 are edge-disjoint. Five edge-disjoint triangles would use fifteen of sixteen edges, leaving a single edge. All G degrees are even (rim vertices have degree four; hubs degree six), and a triangle union has all degrees even; their difference cannot be a single edge. Thus nu=4.

Delete rim edges 01 and 23. The four vertices 0,1,2,3 now have odd degree. If four triangles were packed, the unused two edges would have odd-degree vertex set exactly {0,1,2,3}, so would be a perfect matching on those four vertices. Among them the remaining rim graph has only edge 12, so such a matching does not exist. Thus the packing number is at most three. Triangles 045,126,356 show equality. This is a concrete two-edge blocker. Every rim edge originally has triangle codegree exactly two.

## Fano plane minus one line (hypergraph-only diagnostic)

Use points 0,...,6 and lines

    012,034,056,135,146,236,245.

Delete line 012. The remaining six triples are pairwise intersecting, so nu=1 and each remaining triple is a transversal, giving tau<=3. Every pair of points meets at most five full Fano lines, and after removing only one line at least one remaining line avoids the pair. Thus tau>=3. The vertices 0,1,2 have degree two; the others degree three. Deletion of any two points leaves at least one line and preserves nu=1. Every remaining triple is a minimum transversal, so the analogue of Q holds.

This incidence object is not a graph-triangle family. A pairwise edge-intersecting family of triangles in a simple graph either shares one edge or consists of faces of a K4. To see this, start with abc and abd sharing ab. A triangle that meets both without using ab must be acd or bcd. Once such a third triangle is present, any triangle meeting all three is one of the four K4 faces. If no such third triangle exists, every triangle shares ab. The six Fano-minus-line triples have no common point and exceed four. Therefore graph geometry is essential to any codegree-two exclusion.
