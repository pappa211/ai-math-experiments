> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Degree-four cap: an actual defect-one descent and named reconstruction

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-17. Independent review required. This operates on the compulsory cap triangle supplied by the accepted local-cap theorem. It does not name a defect-two graph. All cover bounds below are explicitly restricted to a CODEGREE-TWO base edge uv.

## Setting and precise conclusion

Let Q be the conditional minimum unknown support inside fixed minimum-CS G, with the accepted constraints: triangle-supported and triangle-connected, minimum support degree at least four, every edge in at least two triangles, two-edge packing resilience, every actual triangle contained in some minimum Q cover, and no literal K4/K5 with complete outside-triangle boundary at most two. Write nu(Q)=k,tau(Q)=2k-1.

Let uv have exactly the two common neighbors x,y. Put K=Q-uv and

    L=K-{ux,vx,uy,vy}.

The accepted marked profile gives nu(L)=k-1 and tau(L) in {2k-5,2k-4}; thus delta(L) is THREE or TWO, respectively. At arbitrary codegree only the weaker lower bound2k-6 is automatic, and the theorem is not being applied there.

Suppose c is a cap at endpoint u in the sense of notes/matching26_local_cap_augmentation_v1.md, and c has Q degree four. The cap theorem forces every maximum L packing to contain the exact triangle xyc. In particular xy,xc,yc are all critical in L.

Write N_Q(c)={u,x,y,z}. The fourth vertex z differs from v: otherwise uc and vc would make c a third common neighbor of u,v. The cap edge uc belongs to no L triangle, so uz is absent. Since cz belongs to at least two actual Q triangles and its only possible other neighbors are u,x,y, both xz and yz must be present. Thus cxyz is a literal K4 in L, and uc is retained background.

The conclusion proved below is:

    delta(L)=2 is impossible;
    delta(L)=3 with xy cover-ineligible in L is also impossible.

Accordingly any surviving degree-four cap has delta(L)=3 and xy cover-eligible in L. Deleting xy then leaves a defect-two graph, which remains UNNAMED. This does not assert that all three spine edges are eligible: deleting an ineligible spoke xc/yc has a different interface and is not covered by a hub-edge symmetry claim.

## 1. When R=L-xy has defect one, it is resilient

Put p=nu(L)=k-1 and R=L-xy. Criticality gives nu(R)=p-1. If delta(L)=2, cover extension and proper CS allow tau(R) in {2p-3,2p-2}. The upper value would make R tight B, impossible: the actual triangles xcz and ycz share cz, so one literal B clique would force the absent xy. Therefore R has defect one.

If delta(L)=3 and xy is ineligible, deleting xy preserves tau(L)=2p-3, so again R has defect one. These are exactly the two branches covered here.

Suppose an R edge f were critical. Proper CS and cover extension force S=R-f to be tight B. Let D0 be the K4 cxyz in L.

- If f is outside E(D0), both diamond triangles xcz,ycz survive in S and force absent xy inside one B clique, contradiction.
- Fix any maximum L packing M. It contains xyc. No triangle of M can use cz: with c's specified four neighbors, every actual L triangle through cz is cxz or cyz, each conflicting with xyc; uc is background and uz is absent. Thus M-xyc is a maximum R packing avoiding xc,yc,cz. None of those three edges can be f.
- The only remaining possibilities are f=xz or f=yz. For f=xz, S still has triangle cyz, while c has only the two supported neighbors y,z: xc and uc are background after xy,xz are absent. Such a triangle cannot lie in a literal K4/K5 component. The other case is symmetric.

Every possibility fails. Hence R is single-edge packing-resilient. This is an actual boundary-preserving descent through deletion of the hub edge, not an assumed generic resilience descent.

## 2. The named active component is forced to be W5

Proper CS decomposes R into one active resilient defect-one component C and tight B components. C is strictly smaller than Q in the same fixed-G universe, so the explicit Q minimum places C in frozen C12.

The surviving diamond xcz,ycz lies in C, since it cannot lie in a tight clique while xy is absent. The support degree of c in R is exactly three, with neighbors x,z,y forming a two-edge path and xy absent. Among the EXACT frozen C12 supports, the only degree-three vertex with a nonclique neighborhood is a W5 rim vertex. Every degree-three vertex in a fresh K4/K5 edge-glued model is a simplicial private/root-K4 vertex, and the degree-three peripheral vertices of K5-e are also simplicial. Therefore

    C=W5, c is a rim vertex, and z is its hub.

Relabel C as rim0-1-2-3-4-0 with hub5, taking x=0,c=1,y=2,z=5. This is an ordinary finite-family structural observation, not a claim about arbitrary defect-one graphs.

Every restored xy-page of L has its apex in C. If a page xyw had w outside C, neither old spoke xw,yw could be a C edge. Choose a maximum C packing avoiding critical edge xc, using C resilience; in every old tight component choose a maximum packing avoiding the page's at most one old spoke. Append xyw. This gives a maximum L packing avoiding xc, contradicting its criticality. Since C is induced on its vertices in R (by its universal hub), pages with an apex inside C use only C edges.

Thus restoring xy changes only C to W5 plus rim chord02; every old tight component and every background edge is retained unchanged. This six-vertex chord graph has nu=3 and tau=3. A three-packing is

    012, 523, 540,

and the three-edge cover {01,25,45} hits every actual triangle. The lower cover bound3 follows from its W5 subgraph, and the packing upper bound3 follows from its11 edges. Hence its defect is three. Component additivity now forces delta(L)=3.

This already excludes the delta(L)=2 branch, without invoking the210 insertion table.

## 3. The remaining hub-ineligible branch has no old tight pieces

Continue with delta(L)=3 and xy ineligible. Relative to R, Q restores exactly the six edges of the K4 on {u,v,0,2}. These four terminals are independent in R, so every old tight clique contains at most one of them.

No ordinary uv-page relative to R exists: the only Q common neighbors of u,v are0,2, and all four spokes to them were deleted. Every ordinary02-page has just been confined to C. For each of the other four restored bases u0,u2,v0,v2, the whole-one-base footprint in a fixed old tight clique has at most one edge, as in the accepted B page lemma. A clique contains at most one of the four terminals, which is incident with at most two of these four bases. Thus its COMPLETE outside-triangle boundary in Q has at most two edges.

Triangles using two restored edges have all three vertices among the four terminals and use a third restored edge, so they contribute no old clique boundary. Every actual crossing triangle has therefore been included. The accepted small-boundary exclusion removes ALL old tight components.

Consequently R has exactly the W5 support C, while L has exactly C+02 support, with arbitrary background still retained at this point. In particular nu(L)=3, so the marked profile requires nu(Q)=4.

## 4. Complete actual vertex and background confinement

The endpoint u is outside C. Otherwise the old universal hub5 would be adjacent to u, contrary to u5 being absent. The endpoint v is also outside C: every C vertex has an old neighbor among0,2, whereas v0,v2 are absent in L; v is distinct from the two hubs by the marked setup.

Any Q support vertex w outside C union{u,v} lies in no old L triangle. It can occur in a new Q triangle only as the apex of a restored ordinary page. Therefore all its neighbors lie among {u,v,0,2}. It cannot be adjacent to BOTH u and v, since that would give a third common neighbor of uv. Its degree is at most three, contrary to the minimum-degree premise. Hence every Q support vertex lies in the eight-vertex set C union{u,v}. Isolated ambient vertices are irrelevant and are not bounded.

All old u-neighbors in C form an independent set in C+02, since an adjacent pair would make an old L triangle through u. They include1 and exclude5. The spokes to0,2 were deleted. Thus u may have at most one additional old neighbor among3,4, which are adjacent.

Similarly, v1 is absent by codegree two because u1 is present. Its old C neighbors form an independent subset of {3,4,5}; that set induces a triangle in C, so at most one is possible. There are no other old/background possibilities after the vertex confinement.

Both rim vertices3 and4 have old degree three. To reach Q degree at least four, each needs an extra neighbor among u,v. Since u can take at most one of them and v can take at most one old neighbor total, they must take different ones. Up to reflection of the W5, assume u3 and v4 are present.

Now Q contains FIVE pairwise edge-disjoint actual triangles:

    u01, u23, v02, 512, 534.

Their graph edges are directly disjoint. They contradict the required nu(Q)=4. This is an explicit final packing operation after an all-size descent and complete boundary/background confinement. No eight-vertex graph census is used.

## 5. Truthful sharp local control and the broader finite question

The broad claim that no named C12 insertion has a wholly critical inserted triangle at defect three is FALSE. The already frozen exact326 common-neighbor rows over210 insertions contain105 such presentations (100 distinct inserted graphs), all at defect three. Filtering the critical triangle's common-neighbor apex to degree three leaves exactly the five symmetric W5 rim-chord presentations above.

The smallest relevant control is C=W5 and L0=C+02. Besides (nu,tau)=(3,3), its triangle012 is compulsory in every maximum packing: all triangles other than012 use the hub5, whose five spokes allow at most two edge-disjoint hub triangles. Every three-packing must therefore include012. Thus02,01,12 are all critical. Vertex1 has support degree three and lies in the literal K4 on0125. This is a valid LOCAL descendant and explains why a blanket defect-three exclusion would be wrong.

The proof above does not deny that control. It excludes its ACTUAL minimum-Q restoration using the degree-four cap boundary, codegree two, all-size tight-piece removal, minimum degree and the final explicit five-packing. The table is preserved as evidence rather than used to enlarge C12 or replace the ordinary reconstruction.

## Exact remaining branch

A surviving degree-four cap, if one exists, has delta(L)=3 and eligible hub edge xy. Then R=L-xy has nu=p-1,tau=2p-4, hence defect TWO. That graph remains unnamed; the present minimum-Q comparison does not classify it. An ineligible cap spoke with eligible hub edge is a separate deletion interface and has not been silently covered by relabeling.

Cap availability itself also remains OPEN. The result is a concrete paid descent and reconstruction for the stated two branches of an available degree-four cap, with actual subgraphs throughout. No unrestricted Tuza conclusion, historical priority assertion, or Lean verification is claimed.
