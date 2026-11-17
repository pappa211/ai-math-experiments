> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: deficit-one triangle-restoration alternative

Reviewer: restoration. Frozen 2026-11-16. Verdict: ACCEPT, ordinary necessary alternative for arbitrary finite H at the exact stated near-tight ratio.

Reviewed source: `notes/coordinator_defect_one_triangle_restoration_alternative_v1.md`, SHA-256 `7a017a956bd731242b2b578fa1447ec93b029fc37ea2153d1fd113ae5177d71c`.

I independently reconstructed the page-incidence argument. The three added edges form a triangle on an old independent triple, so every new triangle is that triangle or a one-base page. An outside apex sees either one occupied base or all three, and pages on distinct bases and distinct apices are edge-disjoint. A three-edge incidence matching therefore has exactly six distinct old spokes forming the asserted literal C6. Its whole footprint is exactly those spokes, so an old packing of size p-1 avoiding them combines with three pages, contradicting the forced nu(G)=p+1. Chords do not affect this footprint argument.

If incidence matching number is at most two, two full apices exclude any additional apex; one full apex permits singleton pages on at most one base; with no full apex at most two bases are occupied. The latter two cases have the displayed two-edge covers. Thus non-strict restoration forces the exact seven-triangle new family with two full apices. This is a family assertion and does not incorrectly demand that the full graph induced on the five vertices omit the old edge between the apices.

Every old spoke belongs to a three-edge new-family cover. If that spoke belongs to any old minimum cover, the union has size at most2p+1. Thus all six spokes are cover-ineligible, including any background spokes. Their simultaneous deletion must lower old packing, because otherwise two new pages append to an old maximum packing. If every supported old edge is eligible, all spokes would be background and hence avoidable by every old packing, excluding this branch.

The initial accounting is exact: nu(G)>=p+1 and tau(G)<=2p+2 imply Tuza for G; failure of strictness forces equality in both. It needs no CS induction, resilience or connectedness. The three-page book becoming K5 validates the ineligible-spoke branch. No blanket C6 robustness, global eligibility, or restoration availability is inferred. No gap found.
