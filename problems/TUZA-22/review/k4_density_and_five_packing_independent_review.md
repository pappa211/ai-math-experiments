> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Packing-four density interface and near-bipartite five-packing — fresh review

**ACCEPT both frozen proofs.** The elementary statements are ordinary proofs with exact finite-order hypotheses, no enumeration. The resulting restricted combined-CS theorem uses the expressly declared historical M0/M3/SIX/T0 inputs and previously accepted current lemmas. It is not an unrestricted Tuza proof or a new verification of the complete historical T0 package.

## Density reduction reconstructed before reading the packing proof

Mantel's bound is proved correctly in the note: triangle-free endpoint neighborhoods are disjoint; summing endpoint degree sums over edges yields the square-degree sum, and Cauchy gives m<=n²/4. This is valid for disconnected graphs as well.

A nonbipartite triangle-free graph on12 vertices contains a shortest odd cycle of length5,7,9or11. It is induced because any chord would produce a shorter odd cycle. Every outside vertex has at most floor(l/2) neighbors on it, since its neighbors on the cycle are an independent set in that cycle. Applying Mantel to the remaining vertices gives edge bounds31,28,23,16 respectively. Thus32 edges already force bipartiteness at order12. No asymptotic odd-cycle theorem is being imported.

For a graph on at most12 vertices with an eight-edge triangle cover, any subgraph of average degree at least7 must have order at least8. Removing its intersection with the cover leaves a triangle-free graph with at least ceil(7s/2)-8 edges. At s=8,9,10,11 these are20,24,27,31, exceeding16,20,25,30. Consequently the dense subgraph has all12 vertices and at least42 edges, and G itself has at least42.

Deleting a minimum cover C of size8 yields a triangle-free spanning graph H with at least34 edges. It is bipartite by the preceding argument, and its bipartition has sizes6+6 or5+7 since the product of the part sizes is at least34. The missing cross-edge budgets are respectively2 and1. Every C-edge is internal to this partition: if any C-edge crossed the cut, restoring it to H would preserve triangle-freeness, producing a smaller cover. Therefore the eight internal edges are exactly C. This last inference genuinely needs minimum-cover optimality and is explicitly present.

## Independent five-packing check

The cover swap at a vertex is valid even when all-internal triangles exist. Replace its incident internal cover edges by all incident cross edges. A mixed triangle using a removed edge has its cross edge at that vertex selected. An internal triangle through the vertex retains its opposite internal edge. Hence minimum-cover optimality gives internal degree no larger than cross degree.

For five internal bases on one side, every common-neighbor list has size at least4. If the five bases do not form a star, their line graph is not K5: five pairwise-intersecting distinct simple edges must have a common endpoint, since a nonstar intersecting family is contained in a triangle. Any noncomplete graph on five vertices is3-degenerate, because its whole graph has a vertex of degree at most3 and every proper subgraph has at most four vertices. Reverse deletion therefore list-colors from lists of size4. Adjacent bases get different apices, exactly the condition preventing shared cross edges.

If the five bases are a star, its center has at least five cross neighbors by the cover swap. Each of the five leaf lists has size at least4. At most two lists can be proper subsets of the center's cross-neighbor set, since each needs a missing cross edge at a distinct leaf. Thus the full five-list union has size at least5, while every smaller subfamily has union at least4. These are all Hall conditions. Distinct representatives give the five actual triangles. The5+7 interface has an even smaller missing-edge budget. A putative five-star on its size5 side is automatically impossible, but the proof does not need that extra observation.

If both sides have exactly four internal edges, the6+6 case chooses one B-base uv. At least four A-vertices are common neighbors. Since the A-internal degree sum is8, at most two vertices have degree at least3; choose a common neighbor x with degree at most2 and reserve xuv. Only A-bases incident to x can collide with its cross edges. At most two lists need u,v removed, and each retains at least2 choices; give those bases different colors first. Every other list retains at least4 choices and sees at most three earlier colors. The four resulting A-triangles plus the reserved triangle are edge-disjoint.

For5+7, orient A as the size5 side. Its base lists initially have at least6 entries. Reserving any B-base page removes at most two entries per A-list, so all four lists still have size at least4 and admit distinct representatives greedily. This handles the only remaining split of eight internal edges. Extra actual triangles inside either part never affect validity of the displayed packing.

Thus the density theorem is established exactly as stated:

    |V(G)|<=12, tau(G)=8, nu(G)<=4  implies  mad(G)<7.

## Restricted-CS and original-H-D dependency check

To prove CS throughout the class nu<=4, choose a minimum-edge failing graph inside that class. The class is subgraph closed, so every proper edge-subgraph satisfies CS by that chosen minimality. The class-independent M0/M3 local package applies; the authenticated frozen M3 target expressly permits a minimum combined obstruction in any hereditary class. The six-link reductions also use proper-subgraph accounting rather than an assumption that the entire graph is sparse. Previously reviewed restricted CS for nu<=3 leaves nu=4 and tau=8.

The reviewed eight-edge-cover kernel gives at most13 vertices under explicit M3/SIX link hypotheses. A minimum cover consisting of one triangle and five additional edges can meet13 vertices only if the latter form a matching disjoint from the triangle. The reviewed triangle-plus-matching cover theorem excludes that interface in a CS failure, leaving at most12 vertices. The just-reviewed density result then proves mad<7. Only at this point does declared historical T0 apply, at its exact strict mad<7 scope, giving CS and the contradiction.

This establishes restricted CS for nu<=4 relative to those accepted historical inputs. Applying it to an original-H-D tight triangle residual with packing k-1<=4 yields the residual B classification; the separately reviewed one-classified-residual theorem then gives original H-D for k<=5. This is distinct from H-D-CS-min, whose residuals have defect1 after the accepted restoration result. Neither the density argument nor these corollaries settles arbitrary packing number or unrestricted Tuza.

Reviewed `notes/k4_dense_bipartite_interface_v1.md` SHA-256: `80b7c3f19af47af40d95f717039b0fc5f3fcfe2b934b9824bceea521cd8e6e07`.

Reviewed `notes/challenger_near_bipartite_five_packing_v1.md` SHA-256: `7da8f1ee15599ed0eaa215048b123362752c5f303ce25fd03aee945ce60b710e`.

Completed UTC: 2026-11-15T22:46:43.749822+00:00.
