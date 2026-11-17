> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two-apex forest links have forest matching number at most three

Status: ORDINARY_PROOF_CANDIDATE_USING_DECLARED_CLASS_LOCAL_INPUTS, frozen for fresh adversarial review. Challenger,2026-11-16 UTC. No finite enumeration or external matching-structure theorem is used.

## Theorem

Let L be a nonempty closed link component at h in a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class. If distinct vertices a,b satisfy F=L-{a,b} is a forest, then

    nu_match(F)<=3.

This does not exclude all two-apex-forest links. In particular no claim is made that every such link is WKE. The proof constructs a forbidden tuple when r=nu_match(F)>=4.

We use the accepted general simultaneous-cover lemma in coordinator_triangle_deletion_set_WKE_collapse_v1.md. If (P,Q) is WKE in L and z(P) is the number of F vertices matched by P to {a,b}, then minimum-CS equality requires

    |P|<=2+z(P).                                      (C)

A strict WKE tuple |Q|<|P| is already impossible. The authenticated codegree condition gives delta(L)>=2.

## 1. Perfect F

Let M be a perfect F matching, |M|=r. If F has c>=2 nonempty components, F-M has r-c<=r-2 edges and therefore a vertex cover of size at most r-2. If F is one tree, F-M has r-1 edges; unless those edges form a matching, two adjacent edges can be covered together, again giving a cover of size at most r-2. If F-M is a matching, every vertex has at most one M edge and one other edge, so the connected tree F is a single even path.

In all cases except that single path, take P=M and Q={a,b} plus the displayed cover. Then |Q|<=r=|P| and z(P)=0, violating(C) because r>=4.

Now write the even path F as1,2,...,2r. If ab is an edge, take P=M+ab and Q={a,b} plus one endpoint of each of the r-1 edges of F-M. This is WKE of size r+1 with z(P)=0, again impossible.

Assume ab absent. An apex pair ai,bj extends to a matching of size r+1 exactly when deleting i,j leaves a perfect path matching: the smaller position is odd and the larger is even. Such a pair exists. Indeed rename so a1 is present. If b(2r) exists, use the endpoints. Otherwise a(2r) exists by delta(L)>=2 at the endpoint2r. The vertex b has a path neighbor t because ab is absent and delta(L)>=2; if t is even use a1,bt, and if t is odd use bt,a(2r).

Suppose an extending pair uses positions other than the pair{1,2r}. Let M0 be the perfect matching of F-{i,j}, of size r-1. The graph F-M0 has r edges and is not a matching: if it were, it would be the unique perfect matching{12,34,...,(2r-1)(2r)} of F, forcing M0={23,45,...,(2r-2)(2r-1)} and its two exposed positions to be exactly1,2r. Hence F-M0 has a cover of size at most r-1. With P={ai,bj}+M0 and Q={a,b} plus this cover, we obtain WKE of size r+1 and z(P)=2. Since r>=4, r+1>4 violates(C).

It remains that every extending apex pair uses the two endpoints. Rename so a1 and b(2r) exist. If a also sees2r, any internal neighbor of b would form a forbidden non-endpoint extending pair with one of a's two endpoint edges. Thus b sees only the two endpoints; its degree at least two forces both. The same argument then forces a to see only the endpoints. The symmetric case is identical. Here take

    P={a1,b(2r)} union {23,45,...,(2r-2)(2r-1)}.

The surviving path edges are the r odd-position matching edges. Choose Q to contain1 and2r and one endpoint of each of the other r-2 such edges. Then |Q|=r<r+1=|P|, and Q also covers the two remaining apex edges a(2r),b1. This is a strict tuple.

Otherwise the endpoints are exclusive: a sees1 but not2r, and b sees2r but not1. Every internal a-neighbor is even, every internal b-neighbor is odd, and every a-even neighbor precedes every b-odd neighbor. Each violation would give a non-endpoint extending pair. Consequently no odd-position path edge has BOTH an a-even endpoint and a b-odd endpoint. Use the same P as above and select one endpoint of each surviving odd-position edge so that Q contains every remaining apex neighbor. Such a selection exists by the preceding condition, has size r, and covers L-P. Again the tuple is strict. This completes the perfect case.

## 2. Ordinary forest decomposition for nonperfect F

Fix a maximum matching N. Let U be the vertices reached at even alternating distance from N-exposed vertices, A the odd-distance vertices, and Z the unreached vertices. The elementary forest proof in challenger_forest_anchored_cover_v1.md Section2 gives:

- U is independent, A=N_F(U), and there is no U-Z edge;
- N matches every A vertex to U and matches Z perfectly;
- r=|A|+|Z|/2;
- every u in U can be exposed by a maximum F matching, by flipping its even alternating path, without changing the matching inside Z.

An alternating path starting from an exposed vertex can be continued until it exposes an ORIGINAL leaf of its nonperfect forest component; an isolated vertex is already exposed. This is the previously proved elementary original-leaf lemma. Minimum degree2 in L therefore forces at least one of a,b to have a neighbor in U. Equivalently one may choose N initially to expose that leaf.

We will also use strict Hall expansion:

    |N_F(Y) intersect U|>=|Y|+1 for every nonempty Y subset A.    (H)

To see this, choose u in N_F(Y) intersect U and expose u by a maximum matching obtained by an alternating flip. All A vertices remain matched into U, so Y is matched into its U-neighborhood excluding u. This proves(H); in particular each A vertex has at least two U-neighbors.

## 3. Easy nonperfect cases

If Z is nonempty, F[Z]-N_Z has a vertex cover D_Z of size at most |Z|/2-1 by forest edge count. Choose a maximum matching N' exposing a U-neighbor u of, say, a; its Z matching is unchanged. Then

    P=N'+au,
    Q={a,b} union A union D_Z

is WKE of size r+1 with z(P)=1. Every F edge outside Z touches A, and both apex stars are covered. The cover size is at most r+1, whereas r+1>3 violates(C).

Hence assume Z empty, so r=|A| and A covers F. If only a has U-neighbors, choose N' exposing one such u and take P=N'+au,Q=A+{a}. This covers also every b-edge, since its F neighbors lie in A and ab touches a. It is WKE of size r+1 with one crossing, impossible by(C).

Suppose both apices have U-neighbors. Form the bipartite graph with left part A union {a,b}, right part U, and all actual cross edges. If it has a matching saturating its left part, that matching P has size r+2, while Q=A union {a,b} covers all of L. Here z(P)=2 and r+2>4, again impossible.

## 4. Hall failure forces one subdivision tree

Assume the bipartite matching in Section3 does not exist. Each one-apex left part A union {a} or A union {b} CAN be saturated, by exposing a suitable U-neighbor in F and adding its apex edge. Therefore a deficient Hall set must have the form

    X=A0 union {a,b}, U0=N(X), |U0|=|A0|+1.

The equality follows because deleting either apex from X leaves a Hall-satisfying set. All U-neighbors of A0 and of both apices belong to U0.

By(H), every A0 vertex has at least two U0-neighbors. Thus the forest on A0 union U0 has at least2|A0| bipartite edges and only2|A0|+1 vertices. It follows that it is a connected tree with exactly those2|A0| edges and every A0 vertex has U-degree2. There are no further internal edges among these vertices, since any would create a cycle. This also includes the case A0 empty, when the core is one U0 vertex.

In fact this core is ALL of F. Every F leaf belongs to U, because every A vertex has at least two U-neighbors. By delta(L)>=2 every such leaf, and every isolated F vertex, has an apex neighbor and therefore lies in U0. A finite forest properly extending the connected core, or having a separate component, would have a leaf or isolate outside that core. This is impossible. Hence

    A=A0, U=U0, F is connected, |U|=r+1,
    every A vertex has degree2, and F has no A-A edge.

Suppress the degree-two A vertices. The result is a tree T on U with r edges; F subdivides each edge of T once.

For any chosen root u in U, match each subdividing A vertex to the child endpoint of its T edge. This is an r-matching M_u exposing precisely u. The remaining F edges join each A vertex to its parent U vertex. If some rooted T vertex has at least two children, F-M_u contains adjacent edges and hence has a vertex cover of size at most r-1.

If ab exists, choose any internal T vertex as root, take P=M_u+ab, and Q={a,b} plus that residual cover. This is WKE of size r+1 with z(P)=0, forbidden by(C).

If T is not a path, any root leaves a vertex with at least two children. Choose an apex U-neighbor u, take P=M_u+au and the same Q. This gives size r+1 and one crossing, forbidden by(C). The same argument works if T is a path but some apex sees an internal T vertex.

## 5. The remaining odd path

We may assume ab absent and

    F=u0-v1-u1-v2-...-vr-ur,

where U={u0,...,ur}, A={v1,...,vr}, and apex U-neighbors belong only to{u0,ur}. Both apices have U-neighbors, and minimum degree forces both endpoints to have an apex neighbor.

If one apex, say a, sees only u0 among U, take

    P={a u0} union {v_i u_i:1<=i<=r},
    Q={b,v1,...,vr}.

Every remaining a-edge ends in A, all b-edges meet b, and A covers F. Thus this is WKE of size r+1 with one crossing, impossible by(C). The right-end version is symmetric.

It remains that BOTH apices see BOTH endpoints. There are two exhaustive explicit constructions.

**Case5a: a v1 is an edge.** Let

    M0={u1 v2} union {v_i u_i:3<=i<=r},
    P={a v1,b u0} union M0.

Then |P|=r+1. The residual F-M0 has two disjoint P3s with centers v1 and u2, followed by the isolated edges u_i v_(i+1) for3<=i<=r-1. Its r+1 edges therefore have a cover

    D={v1,u2} union {v4,...,vr}, |D|=r-1.

Take Q={a,b} union D. This is WKE with z(P)=2, and r+1>4 contradicts(C).

**Case5b: a v1 is absent.** Let

    M0={v1 u1} union {u_i v_(i+1):2<=i<=r-1},
    P={b u0,a ur} union M0,
    Q={b,u0,v2,v3,...,vr}.

Here |P|=|Q|=r+1. The residual F-M0 consists of u0v1, the P3 u1-v2-u2, and edges v_i u_i for3<=i<=r, all covered by Q. Every b-edge meets b. The remaining a-edges go to u0 or to v2,...,vr: a ur was removed, a v1 is absent, and a has no internal U-neighbor. Thus Q covers all of L-P. Again z(P)=2 and r+1>4 violates(C).

All cases contradict the assumption r>=4. This proves the theorem.

## 6. Precise consequence for a pure cycle cover

If C is a selected cycle covering all G triangles and v has selected neighbors a,b, every link edge avoiding a,b belongs to C. Each closed link component containing at most one of a,b is an apex-forest link (or a forest) and is already excluded by the accepted ordinary apex-forest theorem. Therefore in a minimum-CS graph the whole link at v is connected, contains both a,b, and F=L-{a,b} is a disjoint union of paths and isolates.

The theorem gives nu_match(F)<=3. There can be at most one isolated F vertex: two such vertices would each have exactly the two L-neighbors a,b, yielding two nondirect length-two parallel threads, excluded by the accepted ordinary parallel-thread theorem. Every nontrivial path has at most three times its matching number vertices, so |V(F)|<=3*3+1=10. Consequently every vertex of such a hypothetical minimum-CS graph has degree at most12.

This is only a necessary maximum-degree bound for the remaining Hamiltonian-cycle-cover equality case. It is not a complete CS proof for that class, a proof of global cover availability, or a license to replace the remaining symbolic obligation by a large census.

## Dependencies and duplicate boundary

Primary collapse input: notes/coordinator_triangle_deletion_set_WKE_collapse_v1.md, SHA7c5e3ef8b7027f1d19e2de67a2edafe337c48fcb7883cf84539df27ff08a4f6c. The general-S argument independently reconstructed in challenger_triangle_free_deletion_cover_collapse_v1.md is a DUPLICATE, not an additional theorem; only its perfect-forest observation is incorporated here.

Elementary forest decomposition and original-leaf arguments are the previously reviewed ordinary ones in challenger_forest_anchored_cover_v1.md and apex_forest_nonperfect_branch_v2.md. Hall's finite bipartite matching theorem is used at its standard exact scope. The theorem itself needs only the authenticated minimum-link-degree conclusion and the accepted general cover collapse. Section6 additionally invokes the ordinary apex-forest and parallel-thread exclusions. No finite, GE, Kotzig, or all-size formalization premise enters.
