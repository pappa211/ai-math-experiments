> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Degree-four diamond: positive gain and opposite residual resilience

Frozen ordinary proof candidate, TUZA-26. This is an actual minimum-Q reduction. It does not name a defect-two graph or assume a global K4-completion property. The neutral resilient named reconstruction is the separate matching26_diamond_neutral_named_reconstruction_v1.md.

## Paid setting and notation

Work in the accepted conditional minimum-Q setting. Write k=nu(Q), tau(Q)=2k-1. We use: proper-subgraph CS and its zero-defect B conclusion; every Q edge has triangle codegree at least two; minimum support degree at least four; Q is two-edge packing resilient; each Q triangle is contained in a minimum Q cover; and the accepted exclusion of a literal old K4/K5 with complete outside-Q-triangle boundary at most one edge (or at most two adjacent edges). Smaller resilient defect-one supports are named by the fixed C12 list. Isolated ambient vertices are irrelevant throughout.

Let c have exactly the four neighbors A={x,y,u,z}. Their induced graph is the diamond with hub edge xy and missing peripheral edge uz. Set J=Q-c. The five old A edges are xy,xu,yu,xz,yz. Cover all c-triangles by cx,cy, so tau(J)>=2k-3. At most two edge-disjoint c-triangles occur. If nu(J)<=k-2, proper CS and the two-edge cover extension give tau(Q)<=2k-2. Hence nu(J) is k-1 or k.

## 1. The positive packing gain is impossible

Suppose p=nu(J)=k-1. Let K=Q-cu. The previously proved single-edge profile makes K packing-resilient. A packing in K uses at most one c-triangle, because c now has only the three neighbors x,y,z. For every edge f of J, nu(K-f)=k therefore implies nu(J-f)>=k-1=p. Thus J is resilient. Its defect is zero or one because 2p-1<=tau(J)<=2p.

J is not B: its two triangles xyu,xyz share xy but uz is absent, whereas their B component would have to be a clique. Consequently J has defect one. The old diamond is one triangle component, every new c-triangle touches it, and no other J edge can be background and become supported by adding c, since all possible old page edges already belong to the diamond. Triangle connectivity of Q therefore makes all J support one active C12 model C. Apply the following exhaustive named cases.

* W5: an induced diamond has x the wheel hub and y a rim vertex, up to interchanging x,y; u,z are its two rim neighbors. A minimum wheel cover consists of three hub spokes and can contain xu,xz. Add cy. This gives a Q cover of size four, whereas k=3 requires five.
* K5-e: u,z are its nonadjacent peripheral vertices. Let w be its third universal vertex. The four triangles cxu,cyz,wxz,wyu are pairwise edge-disjoint, contradicting the proposed packing gain one.
* A fresh central-K4 star model, or two K5s sharing an edge: the two diamond triangles lie in different clique pieces meeting on xy. In each of these two pieces choose a full packing avoiding xy and its selected adjacent spoke, xu on one side and yz on the other. A K4 or K5 admits such adjacent-pair avoidance. All other leaf pieces use full packings avoiding their attachment edge; thus the choices compose with the central piece without conflicts. They give a full C packing avoiding xu,yz. Appending cxu,cyz contradicts packing gain one.

This covers the frozen C12 family. Thus nu(J)=k.

## 2. Exact neutral profile and cover restrictions

Every A edge is packing-critical in J: a maximum avoiding it could be augmented by its c-page. Each of the two opposite matchings {xu,yz} and {yu,xz} drops nu by exactly two, since its two disjoint c-pages append over the deletion.

Choose a minimum Q cover containing the entire triangle cxu. It contains exactly two c-spokes: three would leave a J cover of size at most 2k-4, contradicting tau(J)>=2k-3. Since the two present spokes are cx,cu, the cover must also contain yz. Its old part has size 2k-3 and contains xu,yz. Therefore

    nu(J)=k, tau(J)=2k-3;
    M={xu,yz};
    R=J-M has nu(R)=k-2, tau(R)=2k-5, delta(R)=1.

The other opposite matching is identical by reflection. No minimum J cover contains either pair {xu,xz} or {yu,yz}: adding respectively cy or cx would cover Q too cheaply. Nor can one contain all of xyu or xyz: add respectively cz or cu.

## 3. Suppose R is fragile

Let f be critical in R and S=R-f. Proper CS and the cover lower bound force

    nu(S)=k-3=m, tau(S)=2m;
    S is B;
    J=S+{xu,yz,f}, nu(J)=m+3, tau(J)=2m+3.

All background edges are retained. Every maximum J packing consists of m old S triangles plus three ordinary pages, one on each of xu,yz,f. A triangle using two restored edges cannot occur in such a packing. Each restored base has a B-bare ordinary page, meaning both old spokes are background in S. Otherwise, in every old clique choose a minimum cover through the entire footprint of that base, which is at most one edge per clique; add the other two restored bases, obtaining a cover of size 2m+2. This is the accepted whole-one-base footprint argument, with no restriction on shared old vertices.

For every minimum S cover, adjoining {xu,yz,f} gives a minimum J cover. It follows from the forbidden adjacent pairs that f is neither xz nor yu and that xz,yu are background in S: if either were supported, choose an old minimum cover through it. Since all A edges are critical in J, every maximum J packing must use both these background edges.

If f=xy, neither M page can have an internal A apex, because that would use two restored bases. The f page cannot have apex u or z for the same reason. Thus a maximum leaves both background edges xz,yu unused, impossible.

If f is disjoint from A, its ordinary page uses neither xz nor yu. The only M pages that can use those edges are xuy and yzx, and these intersect on xy. A maximum again leaves one critical background edge unused. Hence f has exactly one endpoint in A. By the reflection x<->y,u<->z, only f=uw and f=xw need be treated, where w is outside A.

## 4. Codegree forces the bare pages to be internal

An ordinary bare M page with apex p outside A union {w} has a background spoke whose endpoints avoid both endpoints of f. That spoke belongs to no old S triangle; its only possible restored-base triangle is the specified M page. It cannot occur with the other, disjoint M base, with f, or with c, which has no neighbor p. It would have Q triangle codegree one. This is impossible.

In particular the M base incident with f's A endpoint has its bare ordinary apex inside A: apex w would make a mixed page using f. Its only internal ordinary apex gives xuy in both representative cases. Thus xy is also background. All three old P4 edges yu,xy,xz are now background in S.

Every bare ordinary f-page also has its apex in A. Indeed an apex p outside A makes the background spoke wp have no Q triangle other than the f-page: neither endpoint is an M endpoint, and c is adjacent to neither w nor p. For f=uw the unique possible bare apex is y. For f=xw it is y or z.

## 5. Peripheral endpoint: f=uw

Fix a bare f-page uwy, so wy is background. A maximum J packing must use all three critical background P4 edges. To use xz it must contain the internal M page yzx. The other M page cannot then be xuy because of their common edge xy, so to use yu the f-page must be uwy. Therefore the third new page is an ordinary external page uxp, with p outside A union {w}.

The spoke xp must be supported in S. If it were background, its endpoints avoid f and the other M base, so it would again have Q codegree one. Let D be its old literal clique. D contains x,p but not u (xu is absent in S), nor y,z (xy,xz are background). It cannot contain w either: then xw is an old D edge, and the old triangle xyw, using xy and the bare spoke yw, would contradict their being background.

Now count the COMPLETE outside-Q-triangle boundary of D. Only the restored base xu has an endpoint in D, and its whole ordinary footprint is xp. The other two bases have neither endpoint in D. No c-page contributes a D edge because D contains only x from A. A triangle using two restored bases has its remaining old edge among A union {w}; D contains only x from that set. Thus every actual outside triangle touches D only through xp. The accepted one-edge boundary exclusion is a contradiction.

## 6. Hub endpoint: f=xw

The bare M page is xuy. Fix a bare f-page xwh, where h is y or z; hence wh is background. Any maximum J packing must use yu, which forces its xu page to be xuy. Its yz page cannot then be yzx. To use xz, its f-page must therefore be xwz. Its remaining new page is an ordinary external page yzp. Here p is outside A and p!=w, since the latter would intersect xwz on wz.

Both yp and zp must be supported in S: otherwise such a background spoke has endpoints avoiding f and the other M base, and has Q codegree one. Choose the old clique D containing hp. It excludes w because hw is bare, x because xh is background, the other endpoint of yz because yz is absent, and u because yu is background if h=y, while uz is absent if h=z.

Consequently D contains exactly the one vertex h from A union {w}. Its only possible restored-base footprint is the whole yz footprint hp. No c-page or triangle using multiple restored bases adds a hidden old boundary edge. Its complete Q boundary is therefore at most {hp}, again excluded.

Both one-endpoint cases fail. R is resilient. Reflection gives the same conclusion for J-{yu,xz}.

## Conclusion and remaining composition

For a degree-four diamond vertex in the conditional minimum Q, positive packing gain is impossible; in the neutral branch both opposite two-edge deletions have resilient defect one. The ordinary named reconstruction in matching26_diamond_neutral_named_reconstruction_v1.md is a separate obligation. Combining independently accepted versions of both would exclude the entire diamond degree-four case, and hence, together with the accepted C4 and K4 neighbor-link cases, give minimum support degree at least five. That final composition is not claimed here before review.

All old background and every multi-restored-edge triangle were included. No graph census or numerical computation was used. Dependencies are the accepted core profile, minimum-Q one-edge boundary exclusion, fixed C12 naming, whole-one-base B footprint, and elementary clique packing/cover properties. The positive-gain and final bare-page/codegree deductions were proposed by root and independently reconstructed here.
