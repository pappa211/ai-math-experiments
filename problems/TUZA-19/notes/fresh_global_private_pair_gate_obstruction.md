# Intersecting private pages do not justify the pair-overcover 2SAT gate

Status: ordinary exact counterexample to an auxiliary gate, supported by a standalone literal check of one fixed core and its six vertex-sum attachments. The all-type1 Tuza problem remains open. No minimal-counterexample, TF, two-edge resilience, novelty, independent AI-review, or Lean claim is made for this graph. This lane is stopped at the already identified need to coordinate singleton lending and unequal owner allocations.

## Exact proposed gate and outcome

For a specified all-type1 maximum triangle packing P, every support cover must contain each private base. Each owner has two remaining packed edges, called its spokes. An actual triangle avoiding all bases supplies either a two-spoke or a three-spoke clause. The stronger singleton-pair lemma says that a three-owner, base-free triangle has two singleton-page owners whose private pages intersect outside the packed support.

The proposed simplification was: retain all actual two-spoke clauses; replace each three-spoke clause by the two literals supplied by such an intersecting singleton pair; select exactly one spoke per remaining owner, after separately handling exceptional K5 owner pairs by their allowed 3/1 cover allocation. The resulting clauses are 2SAT clauses on binary owner choices. Satisfiability would yield a cover within twice the packing size in this setting.

This simplification is false. The graph below has an all-type1 maximum packing for which the unique possible replacement of a triple clause makes the formula inconsistent. In a fixed padded version, EVERY maximum packing globally maximizing F(P)=sum_v d_P(v)^2 has this failure. In fact every maximum packing of that padded graph is all-type1, so maximizing the type3 count first does not change the example.

This does not refute the original three-literal system, a support cover of size at most 2|P|, or a global scheme allowing two spokes from one singleton owner and none from another. Those alternatives succeed explicitly here. Nor does it rule out a different packing objective. The gate is sufficient rather than equivalent: the replacement discards a real covering option.

## Fixed eight-vertex core and all actual triangles

Let a=3, b=4, c=5, w=6, t=7. Take K5 on {0,1,2,b,c}; add a adjacent to 0,1; and add w,t each adjacent exactly to 0,a. There are no other edges. Every actual triangle is either one of the ten K5 faces or one of

    01a, 0aw, 0at.

There are therefore 8 vertices, 16 edges, and 13 actual triangles. The three outside triangles all contain edge 0a. K5 has packing number two: three disjoint triangles would leave exactly one edge, impossible because both K5 and a union of edge-disjoint triangles have even vertex degrees. Two disjoint triangles exist. Thus every core packing has size at most three, attained by

    A=01a, Q=12b, R=02c.

Thus nu=3. Every cover needs at least four K5 edges: its ten triangles cannot be met by three edges, each lying in only three triangles. It also needs at least one edge in the edge-disjoint outside triangle 0aw. The set

    {0a, 1b, 0c, 12, 2b}

covers every triangle, so tau=5. The K5 part of that set is the complement of the cut with sides {0,c} and {1,2,b}.

Relative to the displayed maximum packing, the full private-page sets are

    A: base 0a, pages 0aw, 0at;
    Q: base 1b, page 1bc;
    R: base 0c, page 0bc.

There are no other private pages, as is also immediate from the complete thirteen-triangle list. All three owners are type1, and Q,R are singleton owners. There is no exceptional two-multi-page K5 owner pair in this core state.

## Exact clause contradiction and incidence reversal

After selecting the three bases, the complete remaining list of actual triangle constraints is

    012:  01 OR 12 OR 02;
    02b:  02 OR 2b;
    12c:  12 OR 2c;
    2bc:  2b OR 2c.

Let q mean that Q selects spoke 2b rather than 12, and let r mean that R selects 2c rather than 02. The three double clauses are

    (not r OR q), (not q OR r), (q OR r).

The first two force q=r, and the last forces q=r=true. The central triangle has exactly one eligible intersecting singleton pair, namely Q,R: their private pages share bc. Replacing its three-literal clause by its Q,R literals adds

    12 OR 02, equivalently (not q OR not r),

which is inconsistent with the three double clauses. Choices in A cannot affect that contradiction.

The resource incidence is important. The private page of Q is the resource edge between the two nonpacked graph edges 1c and bc; its packed spokes 12 and 2b correspond respectively to these two base-endpoint incidences. The private page of R joins the resource vertices 0b and bc; its packed spokes 02 and 2c correspond respectively to those incidences. Thus the SHARED resource vertex bc corresponds to spokes 2b,2c. The central triangle 012 instead uses the OPPOSITE spokes 12,02. Intersecting private pages do not make the central triangle's pair literals the incidences at their common resource vertex.

Keeping the actual third literal repairs the formula: choose spokes 01,2b,2c, giving a six-edge cover together with the bases. Alternatively the five-cover above selects BOTH Q spokes and NEITHER R spoke (and no A spoke). It has owner loads (1,3,1). This is an allowed budget transfer in the full cover problem, but lies outside the one-spoke binary model. The transfer is between singleton owners, not an exceptional multi-page K5 pair.

The K4 completions explain the return to the old barrier: Q's canonical centre is 2 and its private apex is c, so its lending edge 2c belongs to R; R's analogous edge 2b belongs to Q. The two singleton owners form a reciprocal lending cycle. Its actual faces are already in the full clause list. Treating only shared-private-page pair constraints cannot remove this cycle or pay its unequal allocations.

## All maximum core packings and the global F objective

Every maximum core packing consists of two K5 triangles and one of 01a,0aw,0at. A two-triangle K5 packing has one common vertex and partitions the other four vertices into two pairs; there are 5 times 3 = 15 such packings.

If the outside member is 01a, the K5 packing must avoid 01. Its common vertex is one of 2,b,c; for each choice, exactly two pairings place 0 and 1 in different pairs. There are six such core states. They are equivalent under permutations of {2,b,c}, and each has exactly the clause obstruction above. Each has F0=15 and total incidence H=9 on S={0,1,2,a,b,c}.

If the outside member is 0aw or 0at, any of the fifteen K5 packings is allowed, giving thirty further states. These have H=8; their F0 is 15 when the K5 common vertex is 0, and 13 otherwise. Thus there are exactly thirty-six maximum core packings, all with F0<=15.

All thirty-six are type1. In an outside-01a state, the K5 owners lose precisely the private page using 01 and retain the one opposite page; A has its two book pages. In an outside-book state, the K5 owners retain their two usual opposite-base pages. The outside owner has the other book page on base 0a, possibly also 01a if 01 is outside the K5 support, and cannot have a private page on another edge because its fresh vertex has degree two.

## Six fixed vertex attachments force every F-maximizer into the failure

At each v in S attach a fresh K5 identifying only one vertex with v. Its other four vertices are new, distinct across all six attachments. There are no additional cross edges. Call the resulting graph W.

Every actual triangle belongs uniquely to the core or one attached K5: any triangle spanning exclusive sides of a vertex sum would need a missing cross edge. Consequently

    |V(W)|=32, |E(W)|=76, triangle count=73,
    nu(W)=3+6*2=15, tau(W)=5+6*4=29.

Every maximum packing factors into a maximum core packing and a maximum packing in each attached K5. The cover parameters also add, since the triangle blocks have disjoint edge sets. Every local maximum packing is type1, so every maximum packing of W is all-type1.

For a core state Q write d(v)=d_Q(v). Every v in S has d(v)>0. An attached K5 packing has incidence pattern (2,1,1,1,1). If its common vertex is the attachment v, its contribution to the full square sum, beyond the core square sum, is 4d(v)+8. Otherwise the contribution is 2d(v)+8. Therefore every global F-maximizer must centre each pad at its attachment: doing so strictly increases F by 2d(v) whenever it was not centred there.

After that normalization,

    F(W)=F0(Q)+4H(Q)+48.

The six outside-01a states give 15+36+48=99. The outside-book states give at most 15+32+48=95 (or 93). Thus every global F-maximizer has one of exactly those six obstructed core states. Each centred attached K5 has three possible pair partitions, so there are exactly 6*3^6=4374 global F-maximizers.

In each of them the six attachments contribute six independent exceptional K5 owner pairs. Allowing any covers or 3/1 choices inside those pairs cannot cover a core edge, since their edge sets are disjoint from the core. The core contradiction is unchanged. The full graph nevertheless has an explicit support cover of size 29: take the five-edge core cover above and a four-edge support cover in each pad.

This is the same vertex-sum concentration device already used in `packing_routes_concentration_obstruction.md`, applied here only to the fixed new clause obstruction. No larger family or census is pursued. For reference, the multi-private counts at the displayed F-maximizer are m=13 and p=6; the general bound 3nu-2m+2p gives 31, whereas the explicit cover has 29.

## Evidence, controls, and decision

The standalone checker `checks/fresh_global_private_pair_gate.py` uses only the Python standard library and imports no producer checker. It rebuilds every actual triangle, enumerates the thirty-six maximum core packings and fifteen local K5 maximum packings, verifies all private-page types, and checks all eight binary assignments in each of the six obstructed core states. It also checks the complete 32-vertex edge/triangle lists, the displayed 15-packing and 29-cover, and all 36*2^6=2304 exhaustive local concentration profiles. These profiles exhaust the attachment contribution because the choice of which private vertex is the K5 common vertex only permutes otherwise private coordinates.

Three semantic controls are retained: restoring the third triangle literal makes the binary formula satisfiable; permitting the 2/0 singleton allocation yields the five-cover; deleting a required edge from the explicit cover makes it fail. Exact graph data, clauses, private pages, cover/packing certificates, profiles and counts are in `evidence/fresh_global_private_pair_gate/literal_receipt.json`. Ordinary block factorization, not an enumeration of every full packing, justifies the claims about all full maximum packings and all F-maximizers.

The result closes the proposed pair-overcover 2SAT route. It gives no new universal exchange/debt theorem: the missing step is still a globally compatible payment for unequal singleton allocations and lending cycles, as already isolated in `packing_routes_private_fibre_gate.md` and `packing_routes_page_rotation.md`. This lane stops here instead of extending the padding or a graph census.

Requested model controls were Astra / Ultra; the actual serving identity and applied effort are not independently exposed. All computation ran on the local Darwin host with pinned Python 3.12.12. No Lean or remote computation was used. The original research cutoff remains 2026-11-15T09:23:58Z. Exact input/output hashes and the reproduction command are recorded in `review/fresh_global_private_pair_gate_manifest.json`.
