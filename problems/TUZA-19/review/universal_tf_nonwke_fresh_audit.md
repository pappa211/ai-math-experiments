# Fresh audit: universal vertex, TF, and non-WKE link components

Verdict: PASS as an ordinary conditional equivalence. No material mathematical objection remains. The proof does not establish Tuza on this class, construct a counterexample without assuming one, preserve two-edge packing resilience, or claim formal/human verification or originality.

## Frozen input and review boundary

Main input: `notes/global_routes_universal_tf_nonwke_addendum.md`, SHA256
`58dbcfc87ef9683801a666f8e159fd367e01376aa7c7bb79d1bf2296c3b020b4`.

Declared dependencies read:

* `notes/global_routes_universal_clique_reduction.md`, SHA256 `83d9549aae898656b2d09871c5f87c481d6b36116f7ac37d23f534df92f527a1`. Its elementary incidence lemma and exact tau/nu additivity were independently reconstructed in this lane's preceding fresh audit. Here the additional link-inheritance consequence is reconstructed anew.
* `notes/global_routes_k11_control.md`, SHA256 `d0188d752680979e7e44e36002dd8af38a3083b2c6b7b1d020386bea0500df1b`, for the literal 17-packing. Its producer checker and search evidence were not read.

The main input hash was checked before reconstruction. No producer implementation or prior favorable audit of this addendum was read. A new, standalone standard-library checker validates only the 17 literal K11 triangles; it performs no census or optimization. The main proof remains ordinary mathematics.

All work was local on Darwin. Original start 2026-11-15T01:53:58Z, research cutoff 2026-11-15T09:23:58Z, hard deadline 2026-11-15T09:53:58Z. Requested Astra/Ultra; actual serving identity and effort are not exposed.

## 1. Minimal seed and the componentwise WKE reduction

The TF and triangle-cover-criticality conclusions for an edge-minimal counterexample G are valid. Every proper edge-deleted subgraph satisfies Tuza. If k=nu(G), then for any actual triangle T,

    2k+1<=tau(G)<=tau(G-E(T))+3<=2nu(G-E(T))+3<=2k+1.

This forces tau(G)=2k+1 and a minimum cover containing T. Every edge lies in a triangle, since a triangle-free edge could be deleted without changing tau or nu. Thus each edge belongs to some minimum cover as well. Removing isolated vertices causes no loss.

I separately reconstructed the WKE-component argument because it is essential to the new normalization. For a link component L at v, suppose matching M and vertex cover Q of L-M satisfy |Q|<=|M|. Delete all spokes from v to V(L), together with M. The triangles vxy for xy in M are an edge-disjoint packing supported entirely on the deleted edges. Thus they can extend any residual packing.

The set M together with the spokes vq for q in Q covers every removed triangle. A triangle using a removed spoke vu has its second link endpoint in the same component L; its link edge is either in M or incident to Q. Any other removed triangle uses an edge of M, which is already selected. Therefore the cover increment is at most 2|M| and the packing increment at least |M|. This contradicts minimality. The deletion is proper even for a singleton isolated link vertex, when M=Q=empty. Consequently EVERY component of EVERY seed link is non-WKE, in the full quantifier sense: for every matching M, every cover of L-M has size at least |M|+1.

No assertion that criticalization preserves a universal vertex is needed: criticalization occurs before amplification and decoration.

## 2. Link inheritance under incidence amplification

The accepted incidence construction provides b edge-disjoint induced copies of G on n vertices, with b/n arbitrarily large and every actual H-triangle owned by one copy. The ratio can exceed any fixed constant; no quadratic-density conclusion is used.

Fix v in H. Every neighbor of v belongs to the unique copy owning its incident edge. Two different copies containing v intersect only at v, so these neighbor sets are disjoint. An edge between two such sets would form a triangle at v whose two spokes have different owners, contradicting triangle ownership. Within one set, inducedness of the copied graph gives precisely its original G-link.

Thus H[N_H(v)] is the disjoint union of the corresponding seed links, and its connected components are non-WKE. This uses the same global incidence geometry that excludes extra triangles; edge-additivity alone would not imply it. Arbitrary H cannot be substituted without verifying this property.

The exact identities tau(H)=b tau(G), nu(H)=b nu(G), and the inheritance of TF and cover-criticality remain valid because triangle ownership and disjoint graph edges allow independent optimal local covers. H need not be connected. Unused incidence vertices are discarded, and no retained H vertex is isolated.

## 3. Local K11 facts and all actual triangles

The local facts are correct. A triangle-free graph on 11 vertices has at most 30 edges: for each edge xy, d(x)+d(y)<=11, hence sum d(x)^2<=11m. Cauchy gives 4m^2/11<=11m, so integer m<=30. A balanced K5,6 attains 30. Therefore tau(K11)=55-30=25. The 25 edges within the parts of a balanced 5+6 partition give a minimum cover, and any prescribed triangle or edge can be put wholly inside one part.

The independently written `review/universal_tf_nonwke_fresh_local.py` checked all 17 supplied triples, their 51 distinct edges, and the exact four unused edges 03,09,34,49. They form a C4. Eighteen edge-disjoint triangles would leave a single edge of K11, contradicting parity of every residual vertex degree; more than 18 are excluded by edge count. Thus nu(K11)=17. Relabeling one unused edge to any prescribed root proves that a 17-packing can avoid that root. This is a positive literal certificate plus an elementary upper bound, not a solver optimum.

In W, each fresh vertex has neighbors only in its own K11. Hence every triangle with a fresh vertex lies wholly in that attachment. The other triangles are exactly H-triangles and old apex triangles auv with uv in H. There is no uncounted triangle crossing two attachment interiors.

The edge sets of H and the complete attached K11s partition E(W), although old apex triangles use edges from multiple parts of this partition. Restriction of a cover gives the lower bound tau(H)+25n; a minimum H-cover and root-containing minimum attachment covers attain it, including on all those crossing triangles. Similarly a packing has at most nu(B) old triangles and 17 per attachment, while an optimal B-packing extends by root-avoiding local 17-packings. Thus

    tau(W)=tau(H)+25n,
    nu(W)=nu(B)+17n.

The shared apex remains adjacent to every old and every fresh vertex, so it is universal.

## 4. TF compatibility is complete

For an H-triangle, choose a containing minimum H-cover. For auv, choose a minimum H-cover containing uv. In both cases choose all attachment roots in local minimum covers. These choices give global minimum covers containing the prescribed triangle.

For a triangle inside one attachment at av, choose a local minimum 25-cover containing it and choose root-containing covers in every OTHER attachment. The special cover may omit av; this is allowed. Any old apex triangle through av is auv for a different old vertex u, so its other root au is selected. No triangle involves the missing root and a fresh vertex of another attachment. Thus any minimum H-cover suffices in this third case, and the resulting global cover has the exact minimum size.

The three cases exhaust all actual triangles. No simultaneous local requirement that both a full triangle and its root lie in one minimum cover is being assumed.

## 5. All link components and all matching/cover quantifiers

For every matching M0 of K10, an independent set in K10-M0 has at most two vertices, because a matching cannot delete all three edges on a triple. Consequently every cover of K10-M0 has size at least eight. This is valid for arbitrary matchings, not merely maximum ones.

At a fresh vertex the entire link is K10, whose matching size is at most five, so the link is non-WKE.

At a, the link contains n pairwise vertex-disjoint K10 blocks, one on each old vertex and its nine fresh vertices. Edges between blocks are exactly the H edges between old vertices. Each connected component is a union of t whole blocks. A matching in it, including cross-block edges, has size at most 5t by vertex count. Restricting a residual cover to each block gives at least 8t cover vertices. Therefore EVERY component is non-WKE, whether or not H is connected.

At an old vertex v, the link is a K10 on a and its nine private vertices, together with L=H[N_H(v)], and a is joined to every vertex of L. There are no other edges between these parts. This link is connected. Let L1,...,Ls be the inherited components. For any full-link matching M, write Mi for its internal restriction to Li, M0 for its K10 restriction, and epsilon for its number of crossing edges. All crossing edges use a, so epsilon<=1. If epsilon=1, at most four internal K10 matching edges remain; if epsilon=0, at most five. Hence

    |M|=|M0|+epsilon+sum |Mi|<=5+sum |Mi|.

For ANY vertex cover Q of the full link minus M, its restriction to K10 covers K10-M0, and its restriction to Li covers Li-Mi. The previously proved componentwise non-WKE property gives

    |Q|>=8+sum (|Mi|+1)>5+sum |Mi|>=|M|.

Matching a vertex of Li across to a does not invalidate this argument: no additional internal Li edge is removed, so the restriction is still a cover of Li-Mi. The strict inequality also holds when L is empty. These three vertex types exhaust W.

This is the new step that makes the equivalence stronger than the earlier arbitrary-input decoration obstruction. It genuinely uses the minimal seed's inherited link components; it is not an arbitrary-input claim.

## 6. Defect budget and conclusion

Every new triangle of cone(H) uses two spokes, so nu(B)<=nu(H)+n/2. Therefore

    delta(W)=tau(H)-2nu(B)-9n
            >=b delta(G)-10n.

The seed has positive delta (indeed delta=1), and the incidence lemma permits b/n>10/delta. Thus positive defect survives while all three target properties hold simultaneously.

The forward implication from unrestricted Tuza is immediate, and the construction proves the reverse implication by contraposition. No material proof objection remains. The precise unresolved task is still to establish Tuza within the normalized class. The proof makes no assertion about two-edge packing resilience, preserved edge-minimality, larger universal cliques, or arbitrary inputs. The small literal check verifies only the cited local K11 witness; all-size validity rests on the ordinary arguments reconstructed above.
