> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: simplicial degree-four positive gain and neutral accounting

Verdict: PASS, PROVED_ORDINARY for notes/apex_simplicial_degree_four_v1.md, SHA-256 ede56a2355489d0708f31bb44a2f1fe5d56d0ca54c6b0b0a32c437204d242930. The positive-gain branch is completely excluded at the fixed-G minimum-Q scope. This source's neutral branch is an exact frontier, not yet a complete restoration theorem. No computation or Lean verification was needed.

## Exact deletion interface

Let c have degree four with literal K4 neighborhood A, and J=Q-c. A packing can use zero, one or two c-triangles. In the two-triangle case their A bases are an opposite matching; conversely every packing avoiding the indicated base(s) accepts those c-pages. This gives the source's exact maximum response, including arbitrary outside triangles.

Every J cover hits an A edge. Adding the two c-spokes to the other two A vertices then covers every c-page, so tau(Q)<=tau(J)+2. Proper CS gives nu(J)>=k-1, leaving only gains one and zero. Every old edge stays supported: an old edge in a c-page is an A edge already in old K4 triangles, and every other old edge retains its original supporting triangle. No new background is silently discarded.

## Paid positive gain

For nu(J)=p=k-1, covering and proper CS leave tau(J)=2p-1 or2p. If J is B, its entire A lies in one literal K4/K5 component. A K4 upgrades to K5, making Q B; a K5 together with c forms K6 minus the missing edge to its fifth vertex and admits four disjoint triangles cab,cde,zad,zbe. This raises local packing by two and contradicts the presumed gain one. Therefore J has defect one.

If f were critical in J, J-f would be B. When f is in A, the surviving K4-f diamond forces the missing edge inside a literal tight clique. When f is outside A, the intact A lies in a tight K4/K5 component Z. For Z=K4, adjoining c raises that tight graph's packing by one and makes nu(Q-f)=p, contrary to Q resilience. For Z=K5, the local K6-e has a five-edge cover (take a three-plus-three partition with the missing edge internal to one part), replacing the old four-cover at cost one. Restoring f costs at most another one and forces tau(Q)<=2p, contrary to2p+1. Hence J is resilient. This is the accepted special K4-to-K5 vertex argument with its exact premises proved here, not a general critical-edge resilience assertion.

The deletion therefore has exact payment nu1/tau2 and leaves a smaller resilient defect-one graph. Every new c-page uses an A edge in one old triangle component; it cannot connect any other old component. Q's triangle connectivity and J's full support imply J is entirely that one component, so explicit fixed-G minimum-Q naming applies to J itself.

W5 has no K4. In K5-e, any K4 neighborhood omits one peripheral degree-three vertex, whose degree remains three in Q. In a fresh named model, a K4 clique is contained in one literal piece: a private leaf vertex has no neighbors outside its piece, and a clique without private vertices lies in the root. If A is a whole K4 piece, adding c upgrades it to K5 with all attachments unchanged. The already accepted exact fresh-clique classification, together with Q's given defect one, places Q in C12.

If A is inside a K5 piece, that piece is a leaf or one side of double K5. Its outside has a maximum packing avoiding the attachment edge: choose the root triangle avoiding that edge and all other leaves avoiding their own attachments, or the other K5 maximum avoiding the shared edge. The local K6-e four-packing combines with that outside packing, raising nu by at least two. Thus every named possibility contradicts the gain-one premise or Q outside C12. The positive branch is completely paid and excluded without predecessor-wide K4 completion.

## Neutral branch and exact residuals

For nu(J)=k, the packing response forces every one of the six A edges critical and every opposite matching to reduce packing by exactly two. Cover transfer gives tau(J)>=2k-3. A minimum Q cover containing cab uses ca,cb,ab. It cannot have a third c-spoke, since removing all its c-spokes would give a J cover below that lower bound. Thus it has exactly ca,cb, and the remaining c-page on the opposite edge de forces de into its old part. This yields tau(J)=2k-3 and a minimum J cover containing the chosen opposite pair. Repeating with each c-page supplies all three opposite pairs.

For every opposite M, actual deletion gives nu(J-M)=k-2 and tau(J-M)=2k-5, hence defect one. The cover equality uses both directions: remove M from a minimum cover containing it, and extend any residual cover by M. A resilient residual may have its smaller active support named, but full restoration remains a separate obligation. If it is fragile at f, proper CS leaves S=J-(M union{f}) in B, with nu(S)=k-3=m and tau(S)=2m. J restores three edges with gainnu3/cover3; Q further restores c, with gainnu3/cover5 over S. This is not the previously accepted gainnu2/cover3 three-edge theorem.

For each of those three restored bases, an S-bare ordinary page is necessary. Otherwise every ordinary page on that base has at least one supported old spoke. The whole-one-base lemma gives at most one specified footprint edge per tight S clique; choose a minimum cover in each clique containing that edge. Their union hits every ordinary page on that base. Adding the other two restored bases covers all other new triangles, including mixed ones, at total cost2m+2, contradicting tau(J)=2m+3. This argument retains all actual outside pages and uses complete family footprints, not a selected representative page.

## Additional checked cover constraint and remaining scope

No minimum J cover can contain an entire A triangle. Such a cover plus the c-spoke to the fourth A vertex would cover Q at cost tau(J)+1=2k-2. In a fragile opposite-pair residual, every minimum S cover plus M and f is a minimum J cover and must respect this prohibition.

When f is outside A, the surviving four A-cycle edges belong to S. Adjacent ones cannot lie in the same tight clique because that would force their absent opposite-pair chord. If both were supported in different components, independently choosing their eligible edges in minimum S covers would complete an A triangle with an edge of M, contradicting the prohibition. Thus supported A-cycle edges form a matching. This is an independently checked supporting observation; the forthcoming fragility closure must still supply its own full packing/restoration proof.

This review does not promote that later closure, any resilient opposite-pair restoration, or a universal degree-four exclusion. The proof order uses accepted minimum-Q constraints and the previously accepted fresh-clique classification only. No defect-two graph is named, no parent residual condition is inherited without proof, and no unrestricted Tuza conclusion is asserted.

Frozen UTC: 2026-11-17T00:01:23.270620+00:00
