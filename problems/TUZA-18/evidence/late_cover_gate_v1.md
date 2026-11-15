# Genuine triangle-preserving covers cannot supply universal colourable reduction

Status: ordinary proof; literal finite certificate planned. This refutes an auxiliary transformation-existence claim, not Tuza, and not a claim restricted to actual minimal Tuza violations. Historical originality is unestablished. This route was developed in the late global track; the coordinator independently supplied the same cone obstruction.

## Exact proposed route and first decisive gate

A finite r-sheet graph covering pi:X->G is a graph homomorphism whose restriction N_X(x)->N_G(pi(x)) is a bijection for every x, and whose vertex fibres all have size r. Require additionally that every base triangle lifts closed from every vertex over one of its vertices: equivalently for uvw a triangle of G and x over u, the unique neighbours y,z of x over v,w are adjacent. Thus each actual base triangle has r actual triangle lifts, and every actual X triangle projects to one of G.

Candidate TC asked that for every finite simple G there exist such a cover X and r>=1 with

  tau(X)>=r tau(G),  nu(X)<=r nu(G),

and every triangle-bearing component of X either rainbow triangle-edge 3-colourable or a K5 block (or a graph assembled from such pieces with additive triangle parameters). Here rainbow means that every actual triangle uses all three edge colours. The known colourable-class theorem and the elementary K5 bound would give tau(X)<=2nu(X), hence r tau(G)<=2r nu(G), proving unrestricted Tuza. Both transfer inequalities and the existence of a cover meeting the target class were new obligations, not assumed facts.

The first decisive test is the existence step on graphs whose every triangle-preserving cover is a disjoint union of unchanged sheets. This precedes and is independent of integrality transfer or dense amplification. It already refutes TC.

## Elementary sheet-splitting theorem

Let H be any finite simple graph, let z be a new universal vertex, and put G=z*H. Every finite graph cover pi:X->G in which all base triangles lift closed is a disjoint union of r copies of G.

For each lift a of z and each v in V(H), local bijectivity supplies a unique neighbour v_a of a projecting to v. Define S_a={a} union {v_a:v in V(H)}. The sets S_a are disjoint: each lift of v has exactly one neighbour projecting to z, so it belongs to exactly one S_a. They exhaust all X vertices by the same fact.

For each uv in E(H), closed lifting of triangle zuv forces u_a v_a to be an X edge. Local bijectivity then exhausts all neighbours of u_a: its neighbours must project to z and to N_H(u), and those are precisely a and {v_a:v in N_H(u)}. Therefore no X edge crosses sheets. The induced map on S_a is an isomorphism to G. This proves the claim without invoking covering-space topology.

## K4-free obstruction: a cone over a four-chromatic triangle-free rim

Let H be the Mycielski graph of the five-cycle. Its vertices are v_i,u_i for i in Z/5Z and w. Its edges are v_i v_(i+1), u_i v_(i-1), u_i v_(i+1), and w u_i. There are 11 vertices and 20 edges. Form G=z*H; it has 12 vertices and 31 edges.

H is triangle-free. No triangle contains w because the u_i are independent. A triangle with u_i would require an edge between v_(i-1) and v_(i+1), which is absent in C5. A triangle of only v vertices is absent in C5. Thus every actual G triangle is exactly zxy for xy in E(H), and G is K4-free.

H is not 3-colourable. Suppose otherwise and rename colours so w has colour 3. Every u_i then has colour 1 or 2. Recolour each v_i originally of colour 3 by the colour of u_i, retaining all other v colours. This is a proper 2-colouring of C5: on an edge v_i v_j, at most one endpoint originally had colour 3; if v_i did, its new colour is that of u_i, which differs from v_j because u_i v_j is an edge. This contradicts the odd cycle. H is 4-colourable by a proper 3-colouring of C5, giving each u_i the corresponding v_i colour and w a fourth colour.

If G had a rainbow triangle-edge 3-colouring, assign to each x in V(H) the colour of spoke zx. Every rim edge xy lies in triangle zxy, so its two endpoint spoke colours differ. This would give a proper 3-colouring of H, impossible. G has a single nonempty shared-edge triangle component: H is connected, and rim edges in consecutive positions along an H edge-walk give apex triangles sharing a spoke. It is neither K4 nor K5 and has no decomposition into smaller triangle components of the proposed kinds.

By the sheet-splitting theorem, every permitted cover X is r unchanged copies of this non-colourable triangle-connected G. Therefore no such X belongs to the target class. This kills the universal existence step even after allowing K5 equality blocks and even on K4-free graphs.

G itself satisfies Tuza. Its triangle packings are exactly matchings of H, so nu(G)=mu(H)=5 (a displayed matching attains the floor(11/2) bound). Its triangle cover number is vc(H)=6: every rim edge selected in a triangle cover can be replaced by one endpoint spoke without increasing the size, so a minimum cover can be taken to consist of spokes; the literal verifier supplies a six-vertex rim cover and exhaustively confirms that no five vertices cover H. Hence tau(G)=6<=10=2nu(G). These exact values are a scope control; they are not used to refute TC's existence assertion.

## Distinction from prior failures and next decision

TUZA16's dense copy theorem addresses growth of fractional packings and consequent loss of an integral deficit when many base copies occupy quadratic density. The present obstruction uses no dense limit, no fractional theorem and no integral approximation: a genuine graph covering with all triangle lifts closed cannot change this cone at all. K5 alone would already obstruct the target colourability, but the K4-free cone rules out an attempted repair that merely exempts clique equality pieces.

This does not exclude graph homomorphisms that are not local bijections, branched covers, vertex/edge replacements, transformations deleting or adding triangles, nor special transformations available only on genuine minimal counterexamples. Any such repair needs a new exact operation and both cover/packing transfer arguments. No such repaired operation was asserted in this track; this route is abandoned immediately after its existence gate fails.

Sources read for comparison only: frozen TUZA16 sources/tuza16/ROUTES.md and REPORT.md, and current notes/global_cut_gate.md. The sheet proof, Mycielski argument and scope certificate are self-contained; no theorem about topological covering spaces is imported.
