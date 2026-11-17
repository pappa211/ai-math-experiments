> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh restoration-role review: residual-cover invariance

Reviewed source: `notes/coordinator_wke_residual_cover_invariance_v1.md`, frozen SHA-256 `aafae631369cb67c7c13074efa850ce673fd47e161286fd7fae35d1ad76d8cfc`.

Verdict: ACCEPT at the exact stated balanced hypotheses. This is an ordinary necessary equality interface, not a universal WKE-to-CS theorem.

I reconstructed the covering argument directly from the deleted edges. Every lost triangle either contains an M edge, retained in the proposed cover, or contains a deleted hub spoke. In the latter case its other hub neighbor lies in the same closed link component and its rim is in L; an M rim is already covered, a D rim is already covered, and any other rim is covered by the selected vertex cover of F_D. These cases exhaust all actual lost triangles, including outside pages on M and arbitrary other hub-link components.

The cardinality inequality then gives vc(F_D)>=r-s for any H cover of size 2nu(H)+s. For a minimum cover, the original Q provides the reverse bound <=r, so exact equality r holds for every such cover. Componentwise cover choices are legitimate because literal B components have disjoint triangle-edge supports even when they share vertices.

The supported-edge consequence is valid: every supported edge can be included in a minimum K4/K5 cover, and F_D is a subgraph of F-f. No claim that every F edge is supported is used.

I separately checked the clique restrictions. One deleted matching edge in K4 leaves two triangles sharing the opposite edge; their single literal B component would force the missing edge. Two deleted matching edges are necessarily opposite and are not ruled out. In K5 with two deleted edges ab,cd, the four triangles acx,adx,bcx,bdx form one shared-edge-connected family containing all five vertices, forcing the missing edges back. The one-edge K5 case contains the already forbidden K4 diamond. Thus the zero-or-two K4 and zero-only K5 intersections are exact.

The paid-triangle corollary is consistent: an old triangle can be included in a residual cover with cost at most one above minimum, so a link-cover drop of at least two contradicts equality. This matches the separately developed apex-unicyclic application without adding any matching or footprint assumption.

No outside source, finite computation, clique-support availability beyond the explicit B(H) hypothesis, or general WKE equality classification is required. No objection remains.
