# Fresh ordinary audit: universal-join saturation

Verdict: **ACCEPT the frozen statement and proof.** No mathematical repair is required. The construction refutes a guarantee over ALL sufficiently high-ratio incidence amplifications for each fixed q; it does not refute the existential possibility of deliberately choosing a different amplification. A separate strengthening below shows that the constructed join even has every individual cross edge packing-essential.

## Frozen input and scope

Input: `notes/global_routes_universal_join_saturation.md`, SHA256 `52a9dd5bcb6a43a5fc5f39fec6aa6792d70024c09e119f9a3bb8d861f8faffbb`. The hash was checked before reconstruction and its exact bytes copied to `review/universal_join_saturation_fresh_inputs/global_routes_universal_join_saturation.md`.

I reconstructed the translation system, planted matchings, full triangle ownership, exact packing identity, deletion bound, and quantified application directly from that frozen note. No producer checker, computational receipt, solver, Lean job, or new graph search was used. No outside theorem is needed for these steps. This is ordinary AI proof review, not human or formal verification. Requested controls were Astra / Ultra; actual serving identity and applied effort are not independently exposed. The original research cutoff remains 2026-11-15T09:23:58Z.

## Independent reconstruction

Fix G on r>=3 vertices, an edge e0 with nu(G-e0)=nu(G), q>=1, and D>0. The finite family count F can be chosen with F>=qr and F>2rD. Each family uses exactly r distinct part labels out of 2r. The rF incidence exponents are globally distinct; this remains possible even when several families use the same set of parts. After all choices, assign their powers of ten and choose any integer M>6Amax. There is no hidden prime, parity, or divisibility condition on M. The eventual vertex count n=2rM is even automatically.

Within one family, equality of the translated coordinate in any part forces equality of the translate parameter. Its M distinct translates are therefore vertex-disjoint. Across two distinct families, intersection in two parts would give a signed sum of four distinct powers of ten equal to zero modulo M. The largest term is greater than the sum of the absolute values of the remaining three terms, so the integer sum is nonzero. Its absolute value is less than 4Amax<M; hence it cannot vanish modulo M. This proves linearity, including distinctness of the resulting r-sets.

For a Berge triangle, the three hyperedges must have three distinct family labels: distinct translates of one family are disjoint. The three intersection vertices must occupy three different parts, since each hyperedge has only one vertex in each part and any two of the three intersections share a hyperedge. The six entries in the summed coordinate equations are then genuinely distinct family-part incidences. Their signed powers cannot cancel, and the absolute sum is less than 6Amax<M. This excludes all Berge triangles. The argument is not merely an assertion that generic translations should avoid short cycles; its finite integer and modular checks cover the full translate set.

Each marked family for (j,k) maps the two endpoints of e0 to the designated part pair k. Across its M translates, those images form a perfect matching between the two parts: t maps bijectively to each endpoint coordinate. For fixed j, the r disjoint part pairs cover all 2rM ambient vertices, so their union M_j is perfect. Different marked families are different copy owners. Linearity makes their graph edge sets disjoint, so the q matchings M_j are edge-disjoint and, crucially, their union uses at most one edge in any copy. Every ambient vertex is an endpoint of a marked edge; thus isolated seed vertices do not create unused ambient vertices or change n.

All actual H triangles are accounted for. Every graph edge has one copy owner. If two triangle edges share an owner, that owner's r-set contains all three vertices, and linearity forces the third edge's owner to agree. If all three owners differ, the three triangle vertices form a Berge triangle of the underlying incidence system. Hence every triangle belongs to exactly one copy, and both tau(H)=b tau(G) and nu(H)=b nu(G) follow by edge-resource factorization. The ratio is exactly b/n=FM/(2rM)=F/(2r)>D.

In each marked copy choose a maximum seed packing avoiding its image of e0; in every other copy choose any maximum packing. Because the entire matching union uses only those designated roots, these b nu(G) old triangles avoid all M_j simultaneously. For each apex a_j append the n/2 triangles a_jxy for xy in M_j. Within an apex, the perfect matching prevents spoke conflicts; between apices, the spoke sets differ and the rim bases belong to disjoint matchings. No clique edge is used. A maximum K_q packing can consequently be appended independently. This gives

    b nu(G)+qn/2+nu(K_q).

Conversely, a packing has at most b nu(G) triangles wholly in H and at most nu(K_q) wholly in the universal clique. Every other triangle uses exactly two cross edges, whether it contains one apex or two. At most qn/2 mixed triangles are therefore possible. There is no missing fourth type or compatibility assumption in this upper bound. Equality follows from the preceding explicit lower construction.

Deleting any two distinct cross edges leaves qn-2 such edges, so the same classification lowers the upper bound by one. This applies to every relative position of the deleted edges; adjacency and whether they use the same apex are irrelevant. It proves exactly the stated failure of two-edge resilience.

If G is two-edge resilient, deleting at most two edges in H affects each copy in at most two edge resources. Choosing a resilient maximum packing in each affected copy and an arbitrary maximum elsewhere proves that H retains b nu(G). No cross-copy triangle can appear after a deletion. Thus this extra assertion has the correct quantifiers and does not assume that the join inherits resilience.

## Positive-defect application and quantifier audit

For an edge-minimal hypothetical Tuza violation, deletion of one or two edges cannot lower nu: otherwise the Tuza bound on the proper edge-deleted graph, plus at most two reinserted cover edges, contradicts the violation. Hence any e0 satisfies the required seed hypothesis. This implication uses edge minimality only for the seed, not for H or J.

Write delta= tau(G)-2nu(G)>0. The construction gives

    delta(J)>=M(F delta-2rq)-2nu(K_q).

Choose F sufficiently large that F>=qr, F>2rD, and F delta>2rq. The exponents and Amax are then fixed; M can subsequently be chosen arbitrarily large subject to M>6Amax. The displayed bound becomes positive. Thus the order of choices is valid, including the fixed clique overhead and the shift size.

The result is: for every admissible seed, every fixed q and every requested ratio D, there exists a BAD amplification with a nonresilient join. It does not show that every amplification is bad, that no specially engineered amplification works, or that one fixed H defeats every q selected later. It supplies no actual positive-defect graph without a hypothetical positive-defect seed. These distinctions are explicit and correct in the frozen note.

## Separate strengthening: every single cross edge is essential

The frozen two-edge claim is conservative. Since n is even, qn is even. After deleting one cross edge e, the mixed-triangle bound is

    floor((qn-1)/2)=qn/2-1,

so nu(J-e)<=nu(J)-1. In the explicit saturating packing constructed above, every cross edge appears exactly once: each apex's planted matching covers every old vertex. Removing the unique packed mixed triangle using e leaves a packing of size nu(J)-1 in J-e. Therefore

    nu(J-e)=nu(J)-1

for EVERY cross edge e. This is a separate reviewer observation, not a change to the frozen source or its hash. It further confirms that these joins are far from packing-resilient, even when their rims are resilient.

## Objections tested and disposition

- Coincident part sets across distinct families do not cause cancellation: exponents are distinct by the full family-part incidence, not just by the part label.
- Same-part intersections in a putative Berge triangle are impossible because the intersection vertices are required to be distinct and each hyperedge contains only one vertex per part.
- Modular wraparound cannot create an unexamined short cycle: the relevant nonzero integer sums have absolute value below M.
- The q planted perfect matchings do not demand avoiding q seed edges in one copy: exactly one marked root is used in each marked copy.
- Two-apex triangles do not evade the cross-edge budget: they also use exactly two cross edges.
- Possible seed isolates do not invalidate the stated ambient vertex count: marked matchings cover every part and every coordinate.
- The positive-defect choice of M does not change the density ratio or invalidate the exponent assignment: F is chosen first, and increasing M preserves all arguments.
- The construction does not settle the existential amplification gate; interpreting it that way would be a quantifier error.

All objections are resolved within the frozen proof. No repair, new computational claim, or outstanding mathematical gap was found. Exact input and audit hashes, timestamp and verification scope are retained in `review/universal_join_saturation_fresh_manifest.json`.
