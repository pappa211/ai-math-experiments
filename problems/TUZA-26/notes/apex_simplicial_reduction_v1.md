> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Degree-three simplicial vertices: confined named reconstruction without predecessor completion

Frozen ordinary/finite proof package v1, TUZA-26, 2026-11-16, awaiting independent criticism. All triangles are actual; arbitrary old background and shared vertices are retained until the proof removes that freedom. This is a conditional minimum-Q reduction, not a global classification.

## Universe and scope

Fix the minimum-edge CS failure G and the wider minimum unknown support Q specified in the main proof chain. Thus Q is connected through shared triangle edges, triangle-supported, single-edge resilient, has tau(Q)=2nu(Q)−1, lies in a proper edge-subgraph of G, and is outside frozen C12. It minimizes supported-edge count among such unknown supports inside fixed G. Proper edge-subgraphs satisfy CS. No every-triangle-extension or K4-completion is assumed.

Suppose x has degree three in Q and its neighbors A={a,b,c} form a triangle. Put J=Q−x and p=nu(Q). Every new x-triangle is one of xab,xac,xbc, and at most one can occur in a packing. A J-cover covers at least one A edge, so one additional x-spoke covers the remaining new pages. Hence nu(Q)−nu(J) is zero or one, and tau(Q)<=tau(J)+1.

The conclusion below is conditional on the final P3-plus-edge and three-matching gain-two B-restoration classifications; the R-resilient named-interface branch is discharged here without predecessor K4-completion.

## 1. Positive packing gain is named immediately

If nu(J)=p−1, proper CS and the preceding cover bound force tau(J)=2p−2 and B(J), while tau(Q)=tau(J)+1. The old triangle A belongs to one literal K4/K5 component D. Every new x-triangle shares an old A edge with D and none with another old component. Connected Q support therefore excludes all other old triangle components. Triangle support excludes any additional edges not in D or the three x-spokes.

If D=K4, the resulting support is K5 minus one edge, in C12. If D=K5, its three A edges together with the complementary pair form a minimum four-edge D cover and already cover all x-pages. Then tau(Q)<=tau(J), contradiction. Thus positive gain is impossible in the minimum unknown Q.

## 2. Zero gain and the three possibilities for R=J−ab

Now nu(J)=p. The accepted TUZA25 simplicial degree-three response gives

    tau(J)=2p−2, and every A edge is packing-critical in J.

This response does not assume J's triangles are K4-completed. Let e=ab, f=ac, h=bc and R=J−e. Then nu(R)=p−1 and proper CS/cover extension give tau(R) in {2p−3,2p−2}.

### 2a. R is tight B

If tau(R)=2p−2, then B(R). Criticality of f in J forces every e-page to have apex c. Indeed an e-page abz with z!=c has, in an old clique containing f, at most the spoke az, making the combined forbidden footprint {ac,az} a star of size at most two. Other old cliques receive at most one page spoke. Maximum old clique packings avoid these footprints, so appending abz gives p triangles avoiding f, contradiction. Thus the only J triangle newly created over R is abc.

The only Q triangles newly created over R are consequently the four faces of the literal K4 on A union{x}. Old B components can meet this new family only through f or h; no old clique contains both, since that would contain absent ab. Connected Q support makes every old component one of these at most two pieces. Each piece meets the central K4 exactly in its attachment edge. The two possible pieces already share c, so sharing another vertex would make them share an edge and merge as old triangle components. Their other vertices are therefore fresh and mutually disjoint. All other background is excluded from Q support because it lies in no old or new triangle.

Thus Q is literally a central K4 with one or two fresh K4/K5 leaves on the adjacent edges ac,bc; these are frozen C12 models. (With no old component, the numerical profile already fails.) This branch is impossible for minimum unknown Q.

### 2b. R has defect one but is fragile

If tau(R)=2p−3 and g is packing-critical in R, then L=J−{e,g} has nu=p−2 and tau=2p−4 by proper CS and cover extension; hence B(L).

Retain the two spokes xa,xb BEFORE restoring the missing edges. They are background because x then has only neighbors a,b and ab is absent. Therefore

    L'=L+{xa,xb}=Q−{ab,g,xc}

satisfies B with the same values as L, while Q is a three-edge restoration with packing gain two and cover increase three. The restored edges ab and xc are disjoint; g has no endpoint x. Their shape is P4, P3 plus a disjoint edge, or a three-edge matching. The reviewed P4 theorem excludes that shape. The final P3-plus-edge/matching classification is a separate obligation; it is NOT assumed before review. No six-edge restoration or predecessor completion is required.

### 2c. R is resilient defect one

Component additivity and proper CS give exactly one active connected defect-one support C and otherwise literal tight K4/K5 components. Resilience passes to C. It has strictly fewer supported edges than Q, belongs to the same fixed-G universe, and is therefore in C12 by the explicit Q minimum, not by CS alone.

The remainder of this note discharges this branch.

## 3. Critical pages are confined to C

Every C12 support has a universal support vertex. Consequently every old R edge between two C vertices is already a C support edge: the universal vertex completes an old triangle (or the edge is itself a universal spoke). Also an old tight component cannot share two vertices with C; its edge between them would then belong to C, merging triangle components.

Consider an e-page abz of J with z!=c. Let X={az,bz} intersect E(C). Since f=ac is critical in J, a maximum C packing cannot avoid D_f=X union({f} intersect E(C)). Otherwise combine it with old tight-component maximum packings avoiding f and the page footprint, then append abz. A tight component containing f receives at most the incident spoke az; all other old tight components receive at most one page spoke. The combined packing would have size p while avoiding f, contradiction.

Single-edge resilience of C therefore gives |D_f|>=2. The same argument with h=bc gives |D_h|>=2. Thus X cannot be empty. If X had exactly one edge, both f,h would have to lie in C. Then a,b,c and z are C vertices, and the other old page spoke is also an edge between C vertices, hence lies in C. This contradicts |X|=1. Therefore

    z!=c and abz a J triangle  =>  az,bz both lie in C.

In particular every e-page OTHER than abc forces a,b,z into C. This is the missing all-page/background confinement; no K4 completion was used.

## 4. The case of a sole e-page is a fresh neutral K4 leaf

Suppose abc is the only e-page. Then the new Q family over R is exactly the central K4 on A union{x}. Since tau(J)=tau(R)+1, neither f nor h belongs to any minimum R cover: such a cover would already cover the sole new J triangle. In particular neither edge can be in an old tight K4/K5 component, whose every edge is minimum-cover eligible.

Connected Q support implies at least one of f,h belongs to C, and there are no other old components. If both belong to C, then a,b,c are C vertices and the finite internal case in Section5 applies. If exactly one belongs to C, the other A vertex is outside C by the universal-vertex observation. Hence Q is literally C with a fresh K4 attached along that one old edge. The attachment edge is ineligible in C. W5 and K5-e have all edges eligible, so C is one of the ten fresh-edge-glued models. The resulting Q is in the exact fresh K4/K5 edge-gluing class, and its given defect one invokes the archived all-size classification, placing Q in C12. This is a literal fresh construction proved here, not an inference from a one-edge triangle boundary alone.

For completeness, W5 eligibility follows by a three-spoke cover through any specified spoke and a specified rim edge plus two spokes covering the remaining P5. In K5-e, the triangle on its three universal vertices is a minimum cover; a peripheral edge i3 belongs to the minimum cover {i3,i4,jk}, where i,j,k are the three universal vertices and 34 is missing. Thus every edge in these two exceptions is eligible.

## 5. All three A vertices in C: complete finite internal interface

Suppose a,b,c are C vertices. Every e-page is inside C by Section3, including the page abc. Every old edge of a new Q triangle is consequently a C edge. No old tight component meets the new family; connected Q support therefore excludes every old tight component. All remaining Q edges occur in old C triangles or the explicitly listed new triangles. Thus, up to irrelevant isolated vertices,

    J=C+ab,
    Q=(C+ab)+ a fresh vertex x adjacent exactly to a,b,c.

The complete domain is precisely one of the 12 frozen labelled C12 supports, a nonedge ab of that support, and a common neighbor c of a,b. There are326 such labelled presentations over210 nonedges. No outside vertex, background page, or hidden old component remains.

The required J profile is

    nu(J)=nu(C)+1,
    tau(J)=2nu(J)−2,
    ab,ac,bc all packing-critical in J.

The complete TUZA25 210-insertion certificate already reports that only four inserted presentations have the required defect-two value, and in each ONLY the inserted edge is critical. It was independently audited this mission. A separately authored current checker, scripts/apex_simplicial_internal_checks.py, directly enumerates all326 common-neighbor interfaces and recomputes exact packing, cover, and the three A-edge deletion optima. Eight presentations have the required numerical profile (two c choices in each of those four inserted graphs); NONE has all three A edges critical. No timeout/UNKNOWN occurred. Therefore the internal case is impossible.

Finite status: VERIFIED_FINITE at this explicit complete interface, not a new all-graph census. The ordinary contribution is the preceding confinement proving this is the entire remaining internal domain. Runtime28.56 seconds, peak RSS145,850,368 bytes. Evidence: evidence/apex_simplicial_internal_checks.json. The arbitrary-source numerical oracle is not imported; literal seeds are read from the frozen C12 definition file.

## 6. a,b in C but c outside: an ordinary edge-gluing reconstruction

If there is an e-page other than abc, Section3 puts a,b in C. The remaining noninternal case has c outside C. Old tight components meet the new family only through f=ac or h=bc: all other e-page spokes lie inside C, and x has no old edges. At most one old component uses each of f,h, and no component uses both because ab is absent in R. Connected Q support excludes every other old component.

Each such clique meets C only at a or b respectively, by the universal-vertex observation. The two possible cliques already share c, so sharing another vertex would merge them through their common edge. Hence their other vertices are fresh, mutually disjoint, and outside C union{c,x}. This proves a literal attachment description. All other background edges would belong to no old triangle, internal e-page or x-page and are excluded by Q's triangle support.

Put D=C+ab, and let r_B be the sum of the old tight pieces' packing numbers. Their one-edge boundaries ac/bc allow maximum packings avoiding those boundaries. All triangles partition into the old piece families and the exact central family, so packing is additive across these genuine fresh edge attachments. For J the central family is D plus the single fresh triangle abc on edge ab; for Q it is D plus the fresh K4 on {a,b,c,x}. Therefore

    nu(J)=r_B+max(nu(D),1+nu(C)),
    nu(Q)=r_B+nu(D)+1.

The assumed zero gain forces nu(D)=nu(C). Adding ab to C is triangle-bearing because C has a universal vertex. The accepted named neutral-packing-insertion lemma (main eligibility_saturation proof, Lemma3) then forces C=K5-e and D=K5. Consequently Q is literally a K5 with a fresh K4 attached along ab and zero, one or two further fresh K4/K5 pieces on ac/bc. It belongs to the exact fresh edge-gluing class. Its given defect one invokes the archived all-size classification and yields Q in C12, contradiction.

Notice that this argument uses preservation of packing, not an unsupported assumption that tau(D)=tau(C). In fact the K5-e exception raises its cover by one, exactly as the named insertion lemma states.

## Final implication and remaining availability

The R-resilient branch is now excluded using ordinary confinement, the COMPLETE named internal interface, and literal fresh-edge reconstruction. Predecessor K4-completion has not been assumed anywhere. Together with Sections1 and2a, the only remaining simplicial degree-three branch at this freeze is the fragile R three-edge restoration of shapes P3-plus-edge or matching; those are handled by the separate main geometry track if and when its frozen proof passes review.

If those shape theorems classify the gain-two/cover-three support as C12, no conditional minimum unknown Q has a degree-three simplicial vertex. Combined with the wedge reduction, this would rule out every degree-three vertex in Q: in a triangle-supported graph a degree-three vertex has neighbor graph either a path or a triangle, since no neighbor may be isolated in that neighbor graph. This leaves the precise minimum-degree-at-least-four unknown-core availability obligation; it does not solve it.

Status chain: conditional minimum-CS framework -> Q is CONDITIONAL on archived profile/restoration. Named C choice is PROVED by explicit fixed-G Q minimality once R is resilient defect one. Sections3,4,6 are ordinary proof candidates awaiting critic. Section5's exact domain is ordinary confinement plus VERIFIED_FINITE optima; independent review required. Fragile P3-plus-edge/matching completion is OPEN at this freeze. General availability in the surviving higher-degree class is OPEN. Universal CS -> unrestricted Tuza is PROVED logically.

Source attribution: TUZA25 critical_adjacent_edges_frozen.md supplies the initial responses; TUZA22 defect_one_fresh_clique_tree_classification_v1.md supplies the exact fresh-edge classification; TUZA25 residual_edge_exchange.py/evidence provides the frozen C12 seed universe and complete210 interface; this mission's eligibility_saturation_v1.md supplies the named neutral insertion theorem. No historical originality or Lean verification is claimed.
