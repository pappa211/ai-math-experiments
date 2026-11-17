> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Safe clique-patch peeling and attachment guardrails — fresh review

**ACCEPT all three notes at their stated scopes.** These are ordinary proofs from literal clique facts and proper-subgraph combined CS. The fresh-gluing hypotheses and whole-boundary avoidance conditions are substantive; no availability assertion is added.

## Generic patch and K4/K5 boundaries

For a nonempty B patch P, A is defined using all actual triangles not wholly in P. Every G triangle is therefore either a P triangle or an actual A triangle. The packing upper bound follows by this classification, even if A itself happens to contain additional P triangles. The lower bound uses the assumed maximum P packing avoiding its entire intersection with A; it is genuinely edge-disjoint from every A packing. Thus exact additivity is valid without an unproved induced-subgraph or triangle-family claim.

The combined cover upper bound is immediate. Under tightness and CS(A), A is B. Every shared boundary edge is supported by a triangle in both P and A, because both edge sets are defined as triangle supports. Minimum covers through that edge exist in both B graphs, so their union saves one edge. Hence tightness forces empty boundary. Exact accounting then gives B(G). Since the avoided maximum P packing is nonempty and wholly outside A, A is a proper edge-subgraph for the minimum-obstruction application.

For K4 the complement of any maximum packing face is a three-edge star, so whole-boundary avoidance is equivalent to star containment. In this case the active graph actually has exactly the outside triangle family: its intersection with K4 is triangle-free. The opposite face gives the required packing directly.

For K5 two edge-disjoint triangles share exactly one vertex. Their complement consists of the four edges between the other two vertex pairs, a C4. Conversely deleting such a C4 leaves those two triangles. Thus the stated criterion D contained in some C4 is necessary and sufficient. Every pair of edges extends to a C4. The four isomorphism types of three-edge subsets of K5 are exactly triangle, three-star, P4 and P3+K2; only P4 is contained in a C4. The other three types are actual failures of maximum-packing avoidance. This correctly blocks an unsupported transfer of the K4 star argument to K5.

For a K4 leaf in a triangle residual H, at most one restored terminal lies in the clique because the terminals are independent in H. Every new page edge in that clique is incident to that terminal. If the terminal is absent or lies on the old one-edge boundary, the whole restored boundary stays in a star and peeling contradicts minimality. Therefore a terminal must occur off the attachment edge. The at-most-three-leaves consequence is valid only when those off-attachment vertices are private to their leaf bags, as guaranteed by the explicitly stated fresh-gluing/running-intersection model. General residual descriptions need not have this property.

## Fresh edge-gluing equations and resilience

For a genuinely fresh K4/K5 attached along uv, every actual triangle is contained in an old or new piece; there are no unaccounted crossing edges. A maximum new clique packing can avoid uv, giving exact additive packing number. Cover restrictions to both pieces must each cover their triangle families. If a global cover contains uv, its size is the two restriction sizes minus one; if it omits uv they add. A minimum new-clique cover can contain or omit uv. When uv is old-cover-ineligible, a smallest old cover through uv has size tau(F)+1, since adding it to a minimum cover attains that value. These facts prove both displayed cover formulas, including their lower bounds.

Packing-edge resilience is preserved in all three deletion cases. For an old edge other than uv use the same fresh-gluing packing argument in the deleted old graph. Deleting uv separates edge supports, and both pieces preserve their packing number. For a new edge, take an old maximum packing avoiding uv, possible by old resilience, and a new maximum packing avoiding the deleted edge. No intersection remains.

A neutral gluing uses an old-cover-ineligible edge. Combining an old minimum cover, which omits that edge, with any new minimum clique cover produces an optimal global cover. Hence every new edge and every previously eligible old edge remain eligible; the glued edge itself becomes eligible. Neutral gluings consume at least one existing ineligible edge and create none. The proof does not infer that infinitely many such gluings are available.

## Exact construction scopes

Two K4s sharing one edge have unique minimum cover consisting of that edge and the two opposite edges. The other eight edges are ineligible. Their two-packing survives every edge deletion by choosing one triangle in each appropriate diamond/clique, with the other side avoiding the shared edge when needed. Attaching K4 or K5 at one of these ineligible spokes gives the stated connected defect-one resilient examples of packing3 or4.

In a literal tree of fresh clique edge gluings, the first attachment raises defect from0 to1. Every later attachment must be neutral if final defect is1. After the first gluing a K4 contributes four ineligible spokes; a K5 contributes none, because through a prescribed K5 edge there is a minimum cover containing any second prescribed edge. Thus the initial ineligible budgets are8,4,0 for K4/K4, K4/K5, K5/K5. At most that many subsequent neutral attachments occur, each adding at most2 to packing. The upper bounds18,11,4 follow. They are deliberately coarse and confined to this exact construction class, not all connected near-tight graphs.

The separate book-plus-clique family is genuinely unbounded and its actual triangles are exactly the listed K4 triangles and common-base book pages. The bare page attains the additive packing upper bound and forces one cover edge beyond the2m required by pairwise edge-disjoint K4 supports. Deleting the book base removes all pages and leaves the m clique components, reducing packing by one. Therefore it is correctly excluded by the new triangle-residual resilience theorem; it is not an unbounded family satisfying that resilience restriction.

Reviewed `notes/k4_star_boundary_peeling_v1.md` SHA-256: `26c998ac69fa3a8225fabb96830bf25ecc66f922614186075c7a9370e83039dc`.

Reviewed `notes/safe_clique_patch_peeling_v1.md` SHA-256: `e562b8e2e9ea82e50dcd310b4fc5d68b406e5a9b5df53c810a8e9bbc5b2a6b83`.

Reviewed `notes/near_tight_attachment_guardrails_v1.md` SHA-256: `53d09cc7c55a5c496cf2c77ec48c025f6dc066dd1bdd0095e14071b48d5816bf`.

Completed UTC: 2026-11-15T23:00:44.507915+00:00.
