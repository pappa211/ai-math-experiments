> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Hamiltonian WKE family and explicit non-WKE boundaries — fresh review

**ACCEPT** the three stated mathematical claims. They are ordinary proofs using elementary matching/cover facts; the Hamiltonian family's CS corollary separately inherits the declared Kotzig input from the reviewed general triangle-free WKE exclusion. No finite census is needed here.

## Hamiltonian subcubic family

Fix the Hamiltonian cycle C. Degree at most3 ensures its complement D is a matching, including when some vertices have degree2. At even order, deleting an alternating perfect cycle matching leaves two matchings. Every cycle in their union alternates and has even length; all other components are paths or isolates. Thus the graph is bipartite, and a vertex cover of size at most half the order follows from the bipartite matching/cover theorem.

At odd order2r+1, D leaves some vertex w unmatched. Choose a cycle neighbor z and the perfect matching of the even path C-z. Its size is r. On deleting this matching and z, the graph is again a union of two matchings; importantly w is isolated, since its only remaining cycle edge before deleting z goes to z and it has no chord. The remaining2r-vertex graph therefore has maximum matching at most r-1. Its corresponding vertex cover, together with z, has size at most r. This works for the3-cycle endpoint as well as larger cycles. There is no hidden Hamiltonian-path extension assumption.

The WKE conclusion itself allows triangles. The scoped CS consequence requires the actual closed link component to be triangle-free, as already stated. The argument does not cover non-Hamiltonian cubic graphs; the Petersen boundary below demonstrates why that extension cannot be assumed.

## Nine-vertex C5 blowup

The part sizes(2,2,1,2,2) give9 vertices and16 edges. The four vertices in the second/fourth parts have degree3 and the other five have degree4. Actual triangle-freeness follows because a triangle would require three pairwise adjacent parts on C5, and there are no within-part edges. The displayed four matching edges have distinct endpoints, proving matching number4 by the order upper bound.

An independent set meets at most two nonconsecutive parts, hence has size at most4; the first and fourth parts attain4. If a set induces maximum degree at most1 and contains an edge between consecutive parts, each endpoint part contributes exactly one vertex. The two other parts adjacent to those endpoint parts must be empty. Only the fifth part can contribute further vertices, at most2. Thus every such set has size at most4, and an independent4-set shows this bound is attained.

For any WKE witness, its matching has size at most4 and hence its cover has size at most4. The at least5 omitted vertices induce only matching edges, contradicting the preceding bound. This is a complete elementary non-WKE proof, not a failed witness search. It refutes the auxiliary assertion that triangle-free graphs of matching number at most4 must be WKE.

In the cone, all triangles use the hub because the link is triangle-free; packings correspond to link matchings, so nu=4. A link vertex cover gives a spoke cover of the same size. Conversely, take any cone triangle cover, retain the selected spokes' endpoints, and replace every selected rim edge by one endpoint. The resulting link vertex cover has size no larger. Therefore cone tau equals link vertex-cover number, which is9-4=5. This graph is strict for Tuza, not a combined-CS counterexample. Its degree profile is correctly outside the independently validated Tsujimura family.

## Petersen control

The cubic count e(S)=15-3|Q|+e(Q) is exact. Matching size at most3 forces at least6 edges inside S, impossible for a matching on10 vertices. Matching size4 forces |Q|=4, e(Q)=0 and three induced matching edges saturating the six vertices of S; then no fourth matching edge can exist. For matching size5, parity forces1,3or5 spokes. Three spokes are impossible because the remaining two indices cannot be adjacent in both outer and inner5-cycles. The one-spoke matching is forced, and its two displayed complementary5-cycles are correct. The five-spoke matching also leaves two5-cycles. Hence every perfect matching leaves vertex-cover number6, excluding WKE.

For an independent check of the cone orientation without importing the Kneser representation: the set {u0,u2,v3,v4} is independent, so alpha>=4. Cubic regularity bounds alpha<=5; an independent5-set would use all15 edges across its cut, making Petersen bipartite, contrary to its outer5-cycle. Thus alpha=4, and the same cone-cover argument gives tau=6, nu=5. One sentence in the producer note should be read with its packing context: ten apex spokes give an upper bound of5 on the number of edge-disjoint triangles, since each uses two spokes. It does not assert a5-edge cover.

These counterexamples guard the exact WKE quantifier. They do not undermine the proved implication from a WKE certificate to exclusion of a minimum combined-CS obstruction.

Reviewed `notes/subcubic_hamiltonian_wke_v1.md` SHA-256: `61d82d174ec1c49cf344b95853bf06efdd90d8b41ca8a293edcc575dd998382b`.

Reviewed `notes/c5_blowup_wke_boundary_v1.md` SHA-256: `d55c19f4590c2f39b5d40e3b30e7e042e18d9f79418f71d911c55314a4d227ef`.

Reviewed `notes/petersen_wke_boundary_v1.md` SHA-256: `30aebd6e9fe0ae772a08a57a0dd661918efae2f7999ee8eadd6bd20a18b21730`.

Completed UTC: 2026-11-15T22:43:37.094828+00:00.
