> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: paid crossings in a compatible marked strip

Verdict: PASS, PROVED_ORDINARY for notes/apex_strip_crossing_repair_v1.md, SHA-256 2d3f3b85240e1e309ef35d8e104dfb648f78407a1672e66c2d2c9b13dbfb034f. All four stated sufficient crossing regimes are accepted. These are actual generalized packing operations, not a strip-availability theorem. No numerical run or Lean verification was needed.

## Exact replacement and odd-length bonus

The marked setup gives nu(Q)=nu(K)=k and a maximum packing M of L, of size k-1, after deleting the four endpoint spokes. Let D be the literal length-l strip, l>=3, and m=l-2. Write i for selected triangles wholly in D and c for selected outside triangles meeting private D edges I. After deleting these i+c triangles, all retained triangles avoid I and the endpoint spokes; they may use xy, which the new rim packing avoids. Thus all l alternating rim triangles append literally.

When l is odd, the first and last rim triangles use the same hub. The other hub's two endpoint spokes are unused, and the corresponding uv-page appends as one more triangle in Q. Neither M nor the retained triangles use uv because they lie in K. This proves the exact sufficient conflict budgets: i+c<=m for either parity, or i+c<=m+1 for odd length. The resulting packing has at least k+1 triangles in K or Q respectively. All outside edges and vertices are retained; only explicitly counted packed triangles are replaced.

This is the general witness-specific criterion independently noted in opening_marked_strip_review.md, strengthened by the odd extra page. Both alternating rim choices still use every private edge I, so changing phase alone does not remove private-edge conflicts.

## 1. Arbitrary internal rim crossings

For a maximum L packing, let S be the set of permitted internal rim edges used by its outside crossing triangles, and r=|S|. Edge-disjointness and at least one such edge per crossing triangle give c<=r, even if a crossing triangle uses several permitted edges. Internal rim triangles can use at most m-r remaining path slots. Without xy, this gives i+c<=m. With xy, at most one internal spine triangle contributes an extra unit, giving i+c<=m+1. The accepted respective regimes are all lengths with no hub edge and odd lengths with a hub edge. There is no bound on the full outside triangle family, only the exact complete crossing-location condition.

## 2. Pure spoke crossings with independent charges

At an allowed internal vertex w of degree two in the internal path, an outside-used hub spoke prevents internal rim triangles from using both incident path edges: both would need the other hub spoke and would collide. Two outside-used spokes at w prevent both incident rim edges. Since allowed vertices are pairwise nonadjacent, their two-edge incident sets are disjoint. Thus s distinct outside-used permitted spokes force at least s unused rim slots. With c<=s, the same bounds i+c<=m or m+1 follow.

This proof counts actual packing conflicts, not just edge incidence. It tolerates crossing triangles using several allowed spokes because those only improve c<=s. The stated pure-spoke restriction matters: rim and spoke charges cannot be combined without proving that their charged unused slots are disjoint.

## 3. Even length with a nonisolating rim boundary

A matching F of internal rim edges which avoids the internal path's first and last edges has the required hereditary nonisolation property: after any subset S is removed, endpoint vertices keep their only incident rim edge and every other vertex loses at most one of its two edges. If an internal spine triangle is selected, its apex therefore has at least one still-available incident rim edge, which the spine's two spokes prevent using. The spine replaces a remaining rim slot instead of adding one above them. Consequently i<=m-r and i+c<=m, closing the even-length, hub-present case under this explicit boundary placement.

## 4. One crossing book and local criticality

If all outside private-edge crossings share one fixed private edge g, at most one belongs to M. More generally, the same c<=1 holds whenever the complete crossing family's packing number is at most one. Since i<=m, odd length pays this crossing using the extra uv-page, even when g is an endpoint rim edge or an end-near spoke.

For even length, if the shared edge g is critical in the internal strip D', then c=1 forces all selected internal triangles to avoid g, so i<=m-1. If c=0, the original i<=m bound suffices. Thus the same replacement works without assuming that g is critical in K or L.

The stated local critical-edge examples with xy present are correct. A maximum m-packing in hub-edge-joined path D' either uses all m rim slots, alternating hubs, or contains one endpoint spine triangle and all m-1 remaining rim slots. An interior spine consumes both incident rim slots and cannot attain m. Therefore every non-endpoint internal rim edge occurs in every maximum packing. A spoke at a vertex at distance at least two from both endpoints also occurs in every maximum packing: the vertex remains interior even after an endpoint spine deletes its incident rim slot, and the adjacent alternating rim triangles use both spokes. Deleting any such edge loses exactly one packing unit, by the general one-edge deletion bound. These statements are vacuous where the short internal path has no such deep edge or vertex.

## Availability and the next precise obstruction

The new result genuinely weakens the clean-boundary requirement and pays for selected outside triangles. It needs only the stated marked packing profile and each explicit full crossing-location condition. It does not use defect-two naming, cover eligibility or predecessor resilience to discard crossings.

The remaining obstacle is quantitatively narrower: force a marked literal strip and a maximum L packing whose total private-edge conflicts fit the appropriate budget, or force one of these sufficient boundary regimes. Mixed spoke/rim crossings may consume the same internal slot, and even-length end-near crossings may leave an uncharged spine unit. The existence of a directed cover-exchange route does not yet rule out those configurations, original-vertex repetitions or repeated third edges.

No known relaxed-scope control refutes availability under every full minimum-Q hypothesis, and no structural impossibility of that availability has been proved. Conversely, merely exhibiting an outside crossing is no longer enough to defeat the strip operation: it must exceed the explicit paid conflict budget after all available internal losses are counted. This is a concrete local extraction/repair target rather than additional profile renaming.

Frozen UTC: 2026-11-16T23:30:52.706688+00:00
