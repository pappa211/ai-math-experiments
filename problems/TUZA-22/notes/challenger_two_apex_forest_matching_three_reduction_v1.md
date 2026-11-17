> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Matching-three two-apex forest links reduce to one even path

Status: ORDINARY_PROOF_CANDIDATE_USING_DECLARED_CLASS_LOCAL_INPUTS, frozen for fresh review. This sharpens challenger_two_apex_forest_large_matching_exclusion_v1.md by closing its nonperfect matching-three boundary.

## Statement

In a minimum-CS closed link L, suppose F=L-{a,b} is a forest with nu_match(F)=3. Then F must be the single path P6, ab is absent, and L has eight vertices. No claim is made here that this final P6 interface occurs or survives further reductions.

## 1. Cases already strict at r=3

In the accepted large-matching proof, every perfect-F case except a single even path gives a WKE matching P of size3 avoiding the apices, contradicting the general collapse3>2. The edge ab, if present in the single even-path case, gives a WKE matching of size4 with no crossing and is likewise excluded. Thus perfect F is P6 with ab absent.

For nonperfect F, inspect the explicit inequalities of that proof at r3. Nonempty Z, exactly one active apex, a simultaneous two-apex augmentation, an apex edge ab, a non-path suppressed subdivision tree, an internal-U apex neighbor, and a one-endpoint-only apex all remain strictly excluded. The Hall reduction therefore leaves only

    F=u0-v1-u1-v2-u2-v3-u3,
    ab absent,
    N(a) intersect U = N(b) intersect U = {u0,u3},

where U={u0,u1,u2,u3}. The only unspecified edges of L are a/b to v1,v2,v3. The only actual L triangles are those on the two end bases u0v1 and v3u3, with apex a or b. Optional a/b-v2 edges create no triangle because neither apex sees u1 or u2 and ab is absent.

The explicit odd-path constructions5a/5b in the prior note still give some WKE tuple of size4 at r3. They are no longer strict under the coarse two-apex bound, but supply the starting tuple below when needed.

## 2. An apex missing an end-parent neighbor is impossible

If an apex b sees neither v1 nor v3, then L-a is triangle-free. Apply the general one-vertex collapse to the supplied size4 WKE tuple: its right side is at most2, contradiction.

If b sees exactly one end parent, reverse the path if necessary so bv3 exists and bv1 is absent. Use

    P={a u3,b v3,u0 v1,v2 u2},
    Q={a,b,u1,v3},
    S={a,u3}.

These are actual edges. The Q vertices cover all remaining path edges v1u1,u1v2,u2v3,v3u3, and both apex stars. Every triangle of L-S would have to use b on the left end base, but bv1 is absent. Thus L-S is triangle-free. The matching P matches S internally through a u3, so its outside-S mate set Z is empty. The general collapse gives the impossible4<=2.

The argument applies symmetrically to either apex. Therefore both a and b must see both v1 and v3. Their optional v2 adjacencies remain arbitrary.

## 3. A full ordinary rim augmentation excludes the last shape

Take

    P={a v1,b u0,u1 v2,v3 u3},
    Q={a,b,v1,u2}.

The set Q covers every edge of L-P. The four actual end triangles are all destroyed: the left a-triangle loses a v1, the left b-triangle loses b u0, and both right triangles lose v3u3. There are no other L triangles. Hence R=L-P is triangle-free, including when either optional v2 adjacency is present.

Balanced deletion of the hub spokes and P produces a B residual K with nu(K)=nu(G)-4. Take the actual rim triangle

    T={a,u0,v1}

and the actual matching

    M={a u3,b v1,u1 v2,u2 v3}.

The matching has four edges and avoids every edge of T. Its four hub triangles and T form an edge-disjoint packing of size5. Every old K4/K5 block contains at most two L vertices, since its L intersection is a clique in the triangle-free R. Consequently the ENTIRE surviving rim footprint of these five triangles in any old block contains at most one edge. A maximum block packing can avoid that edge. Choosing all old packings simultaneously and appending the five displayed triangles contradicts nu(K)=nu(G)-4.

This audits arbitrary outside attachments: no outside page is assumed absent, and all old footprints are controlled by their complete actual link intersections. The nonperfect r3 case is excluded, proving the statement.

## Dependencies and remaining scope

Inputs are the accepted ordinary large-matching proof, the general triangle-free deletion-set collapse, authenticated balanced accounting, and elementary old-clique packing avoidance of one edge. No new finite computation or external theorem is used.

For a Hamiltonian-cycle cover, F is a union of paths and isolates. This reduction leaves either the single P6 at matching number3, or matching number at most2. Those cases remain separate; no complete one-cycle-cover CS theorem is claimed here.
