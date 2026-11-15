# Independent reconstruction: integral cover from multi-page bases

**Verdict: ACCEPT as an ordinary all-size packing-parameter bound.** The endpoint argument excludes a base-free triply attached triangle whose three owners are multi-page type1. Together with the corrected double-attachment classification, the stated support cover has exact size 3n-2m+2p. No mathematical repair was required. The sufficient inequality m-p>=n/2 is not established as universally available.

The frozen target is `notes/root_multi_private_integral_cover.md`, SHA256 `4791afd96e876088764cf13c37082e9fca23a1ee9a4f2a8ef12d84fcb324176b`. Its snapshot is in `review/multi_private_fresh_inputs/`. The needed corrected classification was read from `notes/root_cksu_order3_repair.md`, snapshotted with SHA256 `a0a8b8a2c8cdf3e0c028661bef9ce51c7586b13ffaed695ea99aa02ffe2c7ab9`. I did not read or import a producer checker. This reconstruction had root's proposed argument in the coordination messages; it is independent reasoning and checking within the active research context, not a claim of a blinded new context, human review, or Lean verification.

## Endpoint reconstruction

Write the central triangle as 012 and its distinct owners as 01a,12b,20c. No a,b,c can be a central vertex, since the corresponding owner would then equal the central triangle and share edges with the other owners. No two can coincide, since the two corresponding owners already share a central vertex and would share its edge to that common outer vertex. Thus all six vertices are distinct.

A type1 owner's base must be one of its two noncentral edges when the central triangle avoids all bases. For base0a, the only allowable old tip is b: tips1,2,c would introduce the packed edges01,02,0c, respectively; the base endpoints are excluded; the third owner vertex is not a private page. The other five rows follow by the same direct test. Importantly, a tip outside the six displayed vertices may still be a vertex of some other packed triangle. The argument requires its page edges outside the packed support, not that its vertex is globally new.

The eight choices are orientations of the three central edges toward the selected base endpoint. Two choices select each central vertex once; the other six have selection counts2,1,0 and form one symmetry class. These are exactly the stated cyclic and noncyclic cases. No base-choice orbit is missing.

Pages from distinct owners cannot share a packed edge, because each is private and their bases are distinct. On disjoint bases, a shared nonpacked edge requires the two tips to be reciprocal endpoints of the other bases. A shared external tip alone produces only a shared vertex, not a shared edge. On two bases sharing one endpoint, valid private pages intersect in an edge exactly when their tips coincide; reciprocal use of the other base endpoints would use another packed base and violate privacy.

For cyclic bases0a,1b,2c, the permitted old tips b,c,a do not allow a reciprocal pair in any direction. Therefore every selection of one private page per owner is already edge-disjoint. The reverse cyclic choice is symmetric.

For noncyclic bases0a,1b,0c, the first and third bases meet, while the middle base is disjoint from both. The middle owner's unique possible old tip is c. Since it has at least two pages, choose a tip other than c, hence outside all six vertices. That page cannot intersect either of the other chosen pages, by the disjoint-base reciprocal-endpoint test. Choose pages on the two meeting bases with distinct tips; two available distinct tips for each owner suffice. They are then edge-disjoint as well. This is equivalent to the note's explicit P-Q, P-R and Q-R collision analysis.

Each chosen page has its only packed edge on its owner's noncentral base, so it avoids the central triangle and all remaining packed edges after the three owners are removed. Adding the central triangle and the three pages gives four edge-disjoint actual triangles in place of three. This contradicts maximum cardinality. The conclusion concerns every specified maximum packing and every actual base-free triple, with arbitrary other graph edges and vertices. Only absence of this augmentation is used locally.

## Double attachments and exceptional pairs

The imported corrected classification was reconstructed at the needed scope. If a doubly attached triangle avoids both type1 bases, the two bases can both use the shared owner vertex, exactly one can use it, or neither can use it. In the first case, failure of a three-for-two augmentation forces the two complete tip sets to coincide as a singleton. In a mixed case, one complete tip set is forced to be a singleton in the residual triangle. In the disjoint-base case, avoiding-page intersections force the reciprocal opposite tips, closing precisely the exceptional K5 and forcing both complete tip sets to have exactly two elements. Thus when both owners are multi-page, the only base-free double-attachment option is the exceptional pair.

Each owner has at most one exceptional partner: its unique base fixes its opposite vertex, and its exact two tips fix the other owner's triangle. The pairs are disjoint as sets of owners. Their vertex sets need not be disjoint, and no such stronger property is needed by the bound.

## Exact cover count and all triangle types

Select all three packed edges from each of the n-m non-multi owners, the base from each of the m multi-page owners, and both nonbase packed edges of one owner from each exceptional pair. Packed edge ownership is disjoint, and no owner occurs in two exceptional pairs. Each added spoke is distinct from every previously selected base and from every edge of a non-multi owner. Therefore the count is exactly

    3(n-m)+m+2p = 3n-2m+2p.

Every actual triangle meets packed support because a maximum packing is maximal. A triangle using a packed edge of a non-multi owner is immediately covered. Otherwise its packed edges all belong to multi-page owners. A single attachment uses its owner's unique base. A double attachment either uses a base or belongs to an exceptional pair; the chosen owner's two spokes meet every residual cross-base triangle of that pair. A triple either is packed or belongs to three distinct owners, and the new lemma rules out avoiding every selected base. These cases exhaust actual graph triangles, including those whose tips coincide with unrelated packed vertices.

Hence tau(G)<=3nu(G)-2m+2p. The condition m-p>=nu/2 gives Tuza. Under the additional hypothesis m=n, owner-pair disjointness gives 2p<=n and the bound n+2p<=2n. The statement that the private bases alone cover everything and tau=nu is correctly scoped to the all-multi case with p=0; it does not follow from p=0 for arbitrary mixed packings. The lower bound tau>=nu follows from edge-disjointness of the packed members.

The frozen concentration control has three singleton-page core owners and twelve multi-page owners in six K5 pairs, so n=15,m=12,p=6. Its value m-p=6 fails the sufficient threshold7.5 even at the specified global concentration maxima, and the new bound is33 rather than its actual optimum29. Thus the proof supplies an exact parameter reduction, not a global availability theorem or an inference from concentration optimization. A full triangle decomposition, such as the stated K7 control, has no private pages at all and likewise need not satisfy the threshold.

## Independent endpoint checks and scope

`review/multi_private_fresh_checker.py` independently constructs the fixed six-vertex packed-owner skeleton. It checks all six old-tip exclusions, all eight base orientations and their symmetry orbits of sizes2 and6, and216 pairwise intersection cases. It also checks the stated selection rule for74,088 local two-tip assignments. Six outside labels suffice for all equality patterns among two selected tips per owner; this is a fixed endpoint-pattern check, not a census of graphs or a search for maximum packings.

Every check passed. The ordinary geometric proof above is complete independently of the computation. No broad graph search, Lean run, external message, or publication was performed.

Checker SHA256: `679e64a3f669e4a317898b607aba355a6746b9a9c95fc71682de15e344d3d4d1`.

Receipt `evidence/multi_private_fresh/endpoint_receipt.json` SHA256: `b44870f6d6af67ea2aab568f2e7fcc6e53a4c53bd2f897a8c7efe72b8bbdc55a`.

Requested model controls were Astra / Ultra; actual serving identity and applied controls are not independently exposed. All computation was local Darwin in the existing pinned environment. The original research cutoff remains 2026-11-15T09:23:58Z. This review makes no novelty claim, does not repair uninspected source statements, and does not establish unrestricted Tuza.
