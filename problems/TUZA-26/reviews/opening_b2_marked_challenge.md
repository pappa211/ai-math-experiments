> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Prescribed B-plus-two controls and independent challenge

Status: ordinary checked control calculations and necessary constraints, no numerical run. These were reconstructed in response to the coordinator's two prescribed examples; no graph search was performed.

## Three-triangle chain

W with actual triangles 012,123,234 has edge set {01,02,12,13,23,24,34}. Its unique maximum packing is {012,234}, so nu=2 and the critical graph is those two triangles sharing vertex2. The cover {12,23} proves tau=2. Every critical edge is eligible by pairing an edge from one end triangle with the shared edge of the other. Thus this is an exact defect-two countercontrol to a forest assertion.

The actual edge13, which is omitted by that critical graph, is decisive. It lies in only one W triangle and is not critical. In the supplied Q interface, any such edge must be xy: Q codegree at least two requires an endpoint page, whose rim is critical unless it is xy. Therefore both endpoint neighbor sets contain1,3. Vertex2 cannot lie in both sets, or the marked edge would have three common neighbors. A set omitting2 cannot contain either exclusive vertex0 or4, because either needs its two critical neighbors including2. It is then just {1,3}, contradicting the required endpoint-neighborhood size. This exact chain is excluded by actual W edges, not by a false critical-forest claim.

## Corrected two-K4 control

Let B consist of K4s tacp and tbdq sharing t, and add bases ab,cd. The maximum four-packing is uniquely {abt,cdt,acp,bdq}; thus all W edges except tp,tq are critical. HOWEVER the cover {ta,cp,td,bq} has size four and covers both old cliques and both new pages. Hence nu(W)=tau(W)=4, delta(W)=4, and restoration gains are (2,0), NOT (2,2). The restored bases are ineligible since the old B cover lower bound already consumes all four cover edges.

The suggested endpoint-set obstruction alone also fails on this prescribed relaxed control. Add endpoints u,v with uv and neighborhoods

    N(u)-{v}={a,c,p,d},
    N(v)-{u}={a,b,d,q}.

Their intersection is exactly {a,d}. The induced rims are triangle acp plus cd on one side and triangle bdq plus ab on the other; all are critical W edges. Every exclusive vertex has at least two induced rims. Both endpoint degrees are five.

Every Q edge has codegree at least two. All old K4 edges already have two W triangles; new bases ab,cd each gain its endpoint page. Endpoint-spoke codegrees are 3,3,2,2 for ua,uc,up,ud and 2,3,3,2 for va,vb,vd,vq; uv has exactly the two common apices a,d. The actual triangle family is connected: the two old K4 families are joined by abt and cdt, and each endpoint page joins through its W rim, with the uv-pages joining those fans.

This is still NOT a full-Q control: p,q have degree four, with diamond links, and W has defect four with critical ineligible bases. No Q optimum is claimed or needed. It demonstrates that the critical-envelope and stated induced-rim neighbor-set conditions alone are insufficient, even with connected triangle support and all Q edge codegrees at least two.

## Additional exact bare-page pressure

At gains(2,2), each base has a B-bare ordinary page by the whole-footprint cover saving. Any W edge occurring in exactly one W triangle, other than xy, must be critical by the endpoint-rim argument; its sole triangle is then compulsory in every maximum W packing.

For disjoint restored bases, a bare page with apex outside their four endpoints has unique-W spokes, so is compulsory. There can be at most one such external bare page per base, because two would share the base. For adjacent bases ab,ac, a bare abp page has unique-W spoke bp and is compulsory unless bp=xy. The two base families cannot both realize that exception: equality bp=cq would require the forbidden terminal apices. Thus at least one compulsory bare page exists, and each adjacent-base bare family has at most two pages. These are genuine finite-interface restrictions, not a critical-graph forest or two-hub conclusion.

The subsequent separately frozen full bare-page proof pays the exact B+two-edge branch directly. The relaxed examples above remain useful scope controls and should not be silently deleted after that proof.
