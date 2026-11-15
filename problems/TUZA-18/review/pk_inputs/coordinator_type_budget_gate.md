# No uniform discount from the private-page type alone

Status: ordinary proof candidate, independent review requested. This is a limitation on a proposed numerical step toward PK/Tuza, not a counterexample to either. Originality unestablished.

Fix a maximum triangle packing P. A private page meets its support B in exactly one edge. The elementary replacement/closure argument in `apex_private_k4_gate.md` gives three possibilities for each packed triangle: no private pages (type0); pages only on one packed edge (type1); or the three private faces of a single K4 completion (type3). Write p0,p1,p3 for their counts.

Candidate charging mechanism: prove a universal bound

    tau(G) <= c0 p0 + c1 p1 + c3 p3

with some type supplying a uniform saving below two, to pay for expensive interactions in other types. For every such bound, even if the maximum packing may be chosen strategically, each coefficient must be at least two. Thus no type by itself can supply that uniform discount. This does not refute a bound with all coefficients two, or savings certified by additional interaction structure.

## Type3 and type1 sharp controls

In K4, every maximum packing has one face and its private K4 completion, so p3=1 and the other counts vanish. Every two faces intersect in an edge, and an opposite edge pair covers all four faces; one edge misses its opposite face. Thus nu=1 and tau=2, forcing c3>=2.

In K5, every maximum packing has two faces sharing exactly one vertex. Three edge-disjoint triangles would use nine of ten edges; every vertex has even degree in their union, whereas deleting one edge from K5 makes its endpoints odd, impossible. Two faces attain nu=2. Relabel them oab,ocd. The private pages of the first have base ab and tips c,d, and those of the second have base cd and tips a,b. Every other nonpacked triangle meets two packed spokes. Thus both members are type1 for every maximum P. The ten actual triangles each need a hit, and each edge lies in three, giving tau>=ceil(10/3)=4; {oa,ob,ab,cd} is a four-edge cover. Therefore tau=4, p1=2, forcing c1>=2.

## Type0 is arbitrarily close to ratio two

For every eta>0 there is a finite triangle-free graph H of even order n, with a perfect matching and alpha(H)/n<eta. Here is a self-contained existence argument. Choose 0<delta<min(1/4,3eta/4), let N tend to infinity, and sample a simple graph J with edge probability N^(-2/3). Its expected triangle count is less than N/6, so the probability of more than N/4 triangles is at most2/3. For k=floor(delta N), the probability of an independent k-set is at most

    exp(N log2 - N^(-2/3) binom(k,2)),

which tends to zero. For sufficiently large N some J has at most N/4 triangles and alpha(J)<k. Delete one vertex from each original triangle; the induced triangle-free remainder F has order at least3N/4 and alpha(F)/|F|<4delta/3<eta. The Cartesian product H=F square K2 remains triangle-free, has its vertical perfect matching, and satisfies alpha(H)<=2alpha(F). This establishes the assertion, with all inequalities strict after N is large enough.

Add a universal apex z to H. Every actual triangle is zxy for a rim edge xy. Therefore nu(G)=n/2 and every maximum packing is a perfect rim matching. Its support contains ALL n spokes, so every nonpacked triangle meets the support in exactly its two spokes. Every packed triangle is type0, independently of the chosen maximum matching.

Moreover tau(G)=vc(H)=n-alpha(H). One direction uses spokes at a vertex cover of H. Conversely, replace each selected rim edge of any triangle cover by one of its endpoint spokes; keep any already selected spokes. The union has no greater size and still hits every apex triangle, so its rim endpoints form a vertex cover. Hence

    tau(G)/nu(G)=2(1-alpha(H)/n)>2(1-eta).

Letting eta approach zero forces c0>=2. Each graph still satisfies Tuza by its full spoke cover. This is an unbounded ordinary existence proof, not a finite graph counterexample or an asserted exact small Ramsey witness.

## Decision and remaining role

The proposed automatic type-discount step is refuted. A proof of global PK can still use actual exchanges, mixed-type geometry, or graph-specific slack. It cannot charge a fixed amount less than two to every type0, type1, or type3 member merely because that type occurs. The common-neighbor and internal-private-page interactions being investigated elsewhere are material additional data, not optional refinements.
