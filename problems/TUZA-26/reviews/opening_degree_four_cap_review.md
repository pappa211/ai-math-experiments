> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: degree-four cap descent and restoration

Verdict: PASS, PROVED_ORDINARY for notes/apex_degree_four_cap_descent_v1.md, SHA-256 e1e0a0f4d04d9daa54c8fd19db0c3e04a7fdfa78c608095a1a3d14ed8ea4f969. Exact scope: codegree-two base uv, a cap vertex c of Q degree four, and either delta(L)=2 or delta(L)=3 with the HUB xy cover-ineligible. No arbitrary defect-two support is named. No numerical replay or Lean verification was needed for acceptance.

## Actual local structure and defect-one descent

Write N_Q(c)={u,x,y,z}. Codegree two excludes z=v, since uc and vc would create a third uv common neighbor. Because uc is triangle-free in L, uz is absent. Edge cz lies in at least two Q triangles, and c's only possible third vertices are u,x,y. The first is unavailable, so xz and yz are both present. The cap's compulsory spine gives xy, and hence cxyz is a literal K4 in L; uc remains background.

Let p=nu(L)=k-1 and R=L-xy. Criticality of xy gives nu(R)=p-1. For delta(L)=2, its cover number permits only defect zero or one in R. Defect zero/B is impossible because the surviving triangles xcz,ycz share cz and would force the absent xy inside one literal clique. Thus R has defect one. For delta(L)=3 with ineligible xy, tau(R)=tau(L)=2p-3, again giving defect one. These two routes are distinct and exhaustive only for the stated branches.

If f were critical in R, proper CS and cover extension would make R-f tight B. An edge outside the local K4 leaves the diamond intact, impossible. A maximum L packing contains xyc and cannot use cz: its only possible L triangles are cxz,cyz, both intersecting that compulsory triangle; uz is absent. Removing xyc therefore supplies a maximum R packing avoiding xc,yc,cz, so none of those is critical. The remaining possibilities f=xz or yz leave a triangle through c but only two supported neighbors at c; all other incident c edges are background. Such a triangle cannot lie in a literal K4/K5 support. Hence every case fails and R is single-edge resilient.

This is a proved special resilience descent, not the unsupported inference that deleting a critical edge always preserves resilience.

## Naming, page confinement and the sharp local control

Proper CS and additivity give one resilient defect-one active component C plus tight components. The diamond belongs to C rather than a tight component, and c has support degree three with a nonclique, two-edge-path neighborhood. The smaller connected active support lies inside the same fixed G, so explicit minimum-Q choice names it C12. Among those literal models only a W5 rim vertex has the required degree-three wedge: degree-three vertices in the fresh clique models and K5-e are simplicial. Therefore C=W5, with c on its rim and z its hub.

Label the rim0-1-2-3-4-0 and hub5, with x=0,c=1,y=2,z=5. Any restored02-page with an apex outside C has no C spoke. In each old tight component its footprint has at most one edge. Choose a maximum C packing avoiding the critical edge01, avoid the page's old edges independently in all tight components, and append that page. This would give a maximum L packing avoiding01, contradicting its criticality. Thus every02-page is internal to C. Universal-vertex inducedness makes its spokes C edges; no old background or tight component changes under insertion.

The resulting active support W5+02 has exact nu3,tau3. Triangles012,523,540 form a three-packing;11 total edges give the upper bound. Cover{01,25,45} hits every actual triangle; the old W5 gives the matching cover lower bound3. Thus delta(L)=3 by component additivity, excluding the delta(L)=2 branch already.

This W5 chord is a genuine local compulsory-triangle control. Every triangle other than012 uses two of the five hub spokes, allowing at most two such packed triangles. Every maximum three-packing therefore contains012, so all its edges are critical. A blanket prohibition of critical triangles at defect three is false. The ordinary argument preserves this control and does not enlarge C12.

## Complete old-piece boundary and all-size confinement

For the remaining ineligible-hub branch, Q restores exactly all six edges on terminal set{u,v,0,2} relative to R. The terminals are independent in R, so each old tight clique contains at most one. Ordinary uv-pages do not exist relative to R because codegree two confines their apices to0,2 and all four spokes were removed. Ordinary02-pages are confined to C. For each of the other four bases, the whole ordinary-page footprint in a tight clique is at most one edge. A clique's possible terminal is incident with only two of those bases, giving complete boundary at most two. A triangle with two restored edges has all three vertices among the terminals and its third edge is also restored, so it contributes no old boundary. Old R triangles outside a tight component share no edge with it. This accounts for every actual crossing triangle, and the accepted boundary theorem removes every old tight piece.

Consequently R has just W5 support, L has just W5+02 support, and nu(L)=3 forces nu(Q)=4. Background has not yet been discarded.

Endpoint u is outside C because u5 is absent, whereas C's hub5 is adjacent to every other C vertex. Endpoint v is outside C because each eligible C vertex has an old neighbor among0,2, while v0,v2 were deleted; the marked setup and codegree condition already exclude v=0,1,2,5. A support vertex outside C union{u,v} has no old L triangle and can occur only as the apex of an ordinary restored page. All its neighbors lie among{u,v,0,2}; it cannot meet both u,v, so degree is at most three. Minimum degree four excludes it. This bounds the support to eight vertices, without bounding retained ambient isolates.

Old u-neighbors in C are independent in C+02, include1 and exclude5; therefore u may add at most one of3,4. Old v-neighbors exclude1 by codegree two and lie in the clique{3,4,5}, so at most one is possible. No other background vertices or internal C edges remain available. Both rim vertices3,4 have old degree three and need an additional neighbor. These capacities force u and v to take different ones. Reflecting the rim if necessary gives u3,v4.

Now u01,u23,v02,512,534 are five actual triangles with disjoint graph-edge sets. The first two use distinct u spokes and rim edges01,23; the third uses v0,v2,02; the last two use disjoint hub-spoke pairs and rim edges12,34. They contradict nu(Q)=4. This is a literal packing certificate derived after an all-size argument, not an eight-vertex census.

## Finite data and scope kept separate

The author control script and receipt were inspected. They project105 critical presentations/100 inserted graphs from earlier stored critical-edge metadata; that metadata was not independently replayed in this review and is not a premise of the ordinary proof. These aggregate counts remain author-reported finite data here. The W5 control, its compulsory triangle, exact optima, and the final five-packing were reconstructed ordinarily. The fact that the degree-three nonclique-apex cases are precisely the five symmetric W5 rim chords also follows directly from the literal C12 structures and is not dependent on the aggregate projection.

The accepted conclusion is exactly: a surviving degree-four cap must have delta(L)=3 and eligible hub edge xy. Deleting that hub then leaves defect TWO, not a named defect-one graph. An ineligible spoke xc or yc when the hub is eligible has a different residual interface and is not covered by relabeling this proof. Neither cap availability nor payment of the surviving eligible-hub branch has been proved.

All cover accounting here is explicitly codegree two, as required by the earlier cap review's scope guard. At arbitrary codegree, the additional possible defect-four residual was not silently removed. The proper-CS and fixed-G minimum-Q framework remain conditional foundations; no unrestricted Tuza conclusion is claimed.

Frozen UTC: 2026-11-16T23:46:55.288376+00:00
