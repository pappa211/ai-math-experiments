# Five-edge flat-piece gluing corollary

**FIVE_EDGE_GLUING_PROVED_ORDINARY**, using Liu v1.0.2 with the auditor-documented Table1 class9 erratum378→389. The released correct certificate and exhaustive classification restore the intended external proof; see CLASS9_TABLE_ERRATUM.md. The gluing argument below is unchanged from the frozen critic-reviewed mathematical draft. The prior TUZA-11 verification atfrozen-packet-11v is used as a frozen ordinary proof, not rerun or amended here.

## Exact statement

Let G be a finite simple graph expressed as the union of actual subgraphs G₁,…,G_m. Every full triangle of G must be contained in some G_i. Every G_i is flat: each of its edges belongs to at most two triangles of G_i. Let B⊆E(G) be an actual edge set with |B|≤5, and suppose E(G_i)∩E(G_j)⊆B for i≠j. Pieces need not be induced; vertices may be shared arbitrarily; triangle-free background edges and isolated vertices are allowed. Then τ(G)≤2ν(G).

This is a decomposition theorem. The hypotheses cannot be replaced here by arbitrary addition of five edges to an arbitrary flat graph, or only a bound on global nonboundary triangle degree.

## Dependencies and their roles

|Input|Use|
|---|---|
|Verified TUZA-11 decomposition and piece argument|Global triangle degree outside B, additive old packing, crucial r=0 cover|
|Haxell–Kostochka–Thomassé, Theorem2 and its equality proof|Flat K4-free τ≤3ν/2; equality atν4 gives two five-wheel triangle supports|
|Elementary triangle-family and odd-wheel reservation lemmas|Two-edge cover of intersecting new triangles; resolves the equality case|
|Parker, graph ν≤3 corollary|Small reduced packing cases|
|Liu2026, Theorem1.2|Only the residual reduced ν(F)=4 case|

Dependency flow: piece separation → saturated K4 removal → K4-free residual and slack bound → r=0 piece covers / direct inequality / small-packing Parker / two-wheel reservation / residual Liu → K4 add-back. Liu supplies neither piece separation nor the arbitrary-large-packing argument.

## 1. Global degree and isolated K4 additivity

An edge e outside B has a unique piece owner. Every full G-triangle using e must lie in that piece by triangle separation and unique ownership. Thus its **global** triangle degree is≤2. H=G−B is flat. Its triangles have unique piece owners, and different B-deleted pieces share no edges, so both triangle packing and cover optima add over those pieces.

In any K4 support in H, each of its six edges is in two old triangles and is therefore globally saturated. No further G-triangle uses one of those edges. The four faces are a full isolated component of the triangle family, even if vertices or triangle-free background edges touch elsewhere. Distinct such supports share no edges unless identical. Remove all h supports by deleting their edges, leaving F, and put H₀=F−B. Both G and H lose exactly h packing units and2h cover units. B is retained and disjoint from the removed supports. Restrict every G_i to remaining edges: flatness, private ownership and full triangle separation persist. H₀ is K4-free and flat.

Let b=|B|, k=ν(H₀), s=2k−τ(H₀), r=ν(F)−k. They are nonnegative integers: HKT gives τ(H₀)≤3k/2, hence s≥k/2 and k≤2s. Covering H₀ and then all of B gives

τ(F)≤b+2k−s,  ν(F)=k+r.                         (1)

Every triangle either avoids B and is old, or is hit by B; this cover bound includes boundary-only triangles.

## 2. The r=0 case uses the pieces

For restricted pieces F_i set k_i=ν(F_i−B). Additivity gives Σk_i=k. If ν(F_j)>k_j, combine a larger packing in F_j with maximum B-free packings in all other F_i−B. Different private owners cannot conflict, and the other packings avoid B; this yields≥k+1 triangles, contradicting r=0. Thus ν(F_i)=k_i for every i.

Every flat F_i satisfies Tuza: its K4 triangle supports are isolated within it, each contributes(1,2), and its remaining K4-free flat graph obeys HKT. Choose covers in each F_i of size≤2k_i. Their union covers every F-triangle by separation, costs≤2Σk_i=2k=2ν(F), and shared B edges can only lower cost. This argument allows triangle-free pieces and boundary-only triangles; a boundary-only triangle forcing gain would already contradict r=0.

## 3. All positive-gain cases

If b−s≤2r, (1) gives τ(F)≤2(k+r). For b≤5 this settles every row below labelled direct. The table exhausts all r≥1 and s≥0, using k≤2s.

|Case|Conclusion|
|---|---|
|r≥3|Direct, 5−s≤6≤2r|
|r=2,s≥1|Direct, 5−s≤4|
|r=2,s=0|k=0, soν(F)=2; Parker|
|r=1,s≥3|Direct, 5−s≤2|
|r=1,s≤1|k≤2, soν(F)≤3; Parker|
|r=1,s=2,k≤2|ν(F)≤3; Parker|
|r=1,s=2,k=4|Two-five-wheel reservation below|
|r=1,s=2,k=3|ν(F)=4; apply Liu below|

The nominal k=0 entries cause no gap. For b≤4 the existing four-edge proof already settles everything. A genuinely unresolved old numerical entry required b=5.

## 4. Equality case: r=1,s=2,k=4

Here τ(H₀)=6=3ν(H₀)/2. HKT’s equality proof gives two edge-disjoint full five-wheel triangle components (background edges/shared vertices do not matter). This equality statement is used solely here, not extrapolated to all slack-two graphs.

For an odd wheel W with rim length2a+1≥5, every spoke lies in two old triangles and is globally saturated, so no new triangle uses a spoke. A new triangle cannot use two rim edges of one wheel: they would be consecutive, and the third edge would be a rim diagonal; with the hub it creates an additional triangle on saturated spokes. Full graph triangle closure is essential. Thus each new triangle uses at most one rim edge from each wheel.

An old maximum wheel packing has a triangles and is an independent set in the cycle of its2a+1 triangles. To avoid any two designated rim edges, delete their at most two corresponding cycle vertices. The residual paths have at least2a−1 vertices; the sum of their independence numbers is at least a. So a maximum old packing can avoid those rims. If two new triangles were edge-disjoint, choose simultaneous maximum old wheel packings avoiding their rim footprints and append both; no other old edge is used by the new triangles. This gives gain≥2, contradicting r=1.

The new triangle family is therefore pairwise edge-intersecting. Any such family has a two-edge cover: pick abc,abd if no common edge exists; a member avoiding ab must be acd or bcd. Once acd exists, any further member lies among the K4 faces, and opposite edges ab,cd cover them. If all share an edge, use that edge; the empty family costs zero. Hence τ(F)≤τ(H₀)+2=8≤2ν(F)=10. The same reservation reasoning covers the previously resolved old-wheel-only cases; no equality assertion is needed for those.

## 5. The only former gap: r=1,s=2,k=3

Now ν(F)=4. Form T(F), the 3-uniform hypergraph of all vertex triples inducing triangles. Pair-packings are exactly edge-disjoint triangle packings. Any selected covering pair lying in a triangle is an actual F-edge; unused pairs may be discarded. Thus ν₂(T(F))=4 and τ₂(T(F))=τ(F). Liu’s Theorem1.2 gives τ(F)≤8=2ν(F). It is valid without further flatness, vertex-count or decomposition assumptions on F.

This is precisely the missing conclusion in the frozen five-edge reduction. We do not need the46-triangle kernel to invoke Liu; that kernel remains a valid independent structural result preserving ordinary ν,τ,B and the old labeled triangle family, with no preservation claim for arbitrary forced states.

## 6. Restore removed components and scope

All cases give τ(F)≤2ν(F). Restore h globally isolated K4 triangle supports: τ(G)=τ(F)+2h≤2ν(F)+2h=2ν(G). The original ν(G)=ν(F)+h can be arbitrarily large, so the bounded-packing theorem does not alone subsume this gluing result. Its essential role is the final ν(F)=4 core. The analytic TUZA-11 reduction, r=0 proof and wheel argument supply the rest.

This is an ordinary proof using HKT, Parker and an external computer-assisted theorem by Liu. There is no new Lean statement. Liu’s dated October6 manuscript precedes TUZA-11; the new contribution recorded here is the correctly attributed post-closeout corollary and status update, not priority for the ν=4 theorem. Historical UNPROVED labels remain truthful records of the earlier closeout.
