> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: tree and triangle cover components

Verdict: ACCEPT, ordinary inequality at the frozen v1 scope. Reviewed2026-11-16 by source_audit. Source `notes/challenger_tree_triangle_cover_tuza_v1.md`, SHA256 `f71a4371b33c3ca258f11ce96bef348b120841e2d0be0cb8d14d2db8ab839fa1`.

## Local normalization

Minimum-cover optimality gives an assigned triangle-core family cover number three. Its internal core triangle intersects every private page, so any family two-packing is necessarily private. Pairwise intersection would give a book or K4-supported two-cover, impossible. For the three nonempty apex lists, absence of a distinct-representative triple forces either a two-list singleton union (explicit two-cover) or a total union of size two. If one of those apices occurred on only one base, the other two lists would have singleton union; hence both apices occur on two bases and actual endpoint closure makes them full. This verifies the q2/q3 dichotomy at the exact local minimum-cover scope.

Tree availability is supplied by the freshly reviewed existential forest anchor, not the stronger unproved fixed-maximum-packing claim.

## Two different conflict graphs

I checked that the actual external conflict graph has maximum degree two and each nonisolated component involves one fixed pair of selected cover components. An external page can conflict only with the family containing its apex, and each spoke meets at most one triangle of that family's supplied packing. The components are therefore bipartite paths/even cycles. Isolated pages require the explicit empty opposite side used in the proof.

The separate potential graph J only uses q2 cores and their two full-apex slots. Every potential neighbor consumes a different slot, so its maximum degree is two. An odd-cycle component uses both slots of every member, placing every available apex inside that same component. This is actual target closure, not a claim that the current conflict graph itself contains an odd cycle. Resampling pages by the two-full-apices lemma cannot create a conflict outside the reserved component. The lemma's private pages remain assigned to their own cores, and no other core has two vertices inside those cores.

## Coherent orientations and expectation

After removing closed odd-cycle components, J is bipartite. Its fair component signs give each q2 core marginal1/2 while forcing opposite signs on every mutual q2 pair. Every actual conflict between two q2 cores implies a potential J edge, so specifying the retained side from either endpoint is consistent. When only one endpoint is q2, its sign determines the side. When neither is q2, choose either side fairly. Isolated pages follow the same convention. Every external page therefore has marginal1/2, without requiring independence across conflict components.

Both supplied pages of any remaining q2 core are simultaneously kept or omitted, because their choices use that core's single sign even when they lie in different conflict components. When both are omitted, its internal triangle is compatible with every retained member from all other families. All originally supplied internal triangles are likewise compatible with other families. Thus every outcome is a literal packing, not merely an expected conflict-free family.

The expected size I+E/2+t2/2 pays half the remaining cover cost. The reserved odd-cycle cores supply2h pages for cost3h, with strict surplus h/2. This proves the stated inequality and its strictness when h>0. No general equality classification follows from the averaging statement alone.

## Stronger local-cost version, separately reconstructed

The same proof can replace selected-component sizes by their actual assigned-family cover numbers tau_i. For a tree, anchor plus external minmax gives tau_i<=|D|+q<=2|I|+q without global cover minimality. For a triangle with tau_i<=2, select its internal triangle; for tau_i=3, the same q2/q3 classification applies. The coherent-orientation proof gives2nu(G)>=sum_i tau_i, while union of assigned-family optimum covers gives tau(G)<=sum_i tau_i. Therefore existence of ANY tree/K3 selected cover suffices for the inequality. Restriction under graph deletion preserves this existence class because a tree splits into trees and a triangle becomes a triangle or forest. This stronger observation was independently communicated to both producer and coordinator; a separate frozen source is appropriate before using it as an adopted theorem. It still supplies no equality classification or CS premise.

No finite computation, graph-class census, external topological input, or independence assumption between random choices is used.
