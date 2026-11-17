> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh reconstruction of the GE leaf facts and full triangle-free remainder exclusion

Coordinator, 2026-11-16 UTC. ACCEPT as PROOF_USING_DECLARED_INPUT. Frozen sources: `notes/unicyclic_exposable_leaf_matching_v1.md` SHAe4a7700009250e5710a0c9036d2d61492d48a08edea140bcc2252b18d460e04b and `notes/apex_unicyclic_triangle_free_remainder_exclusion_v1.md` SHA17eee459bee823b13d4c49995bf05bc31ba9ccaf3e3a1169f858c18bc1d4e7a8.

## Declared input and leaf counts

I read the archived author-manuscript page9 statement of Busch et al., theorem3.6, including the definitions of exposability, factor-criticality and the source-to-mission notation conversion. The statement supplies precisely the general Gallai-Edmonds structure used here; its historical proof remains declared. This does not change the independently self-contained status of the earlier forest-only argument.

The leaf counts follow from incidence edge counts. A factor-critical tree is a singleton; a nontrivial factor-critical unicyclic component is a bare odd cycle. In the contracted odd-cycle case, connectedness gives at least one attachment unless the whole graph is that bare cycle, and the count ell>=d-2+h+c>=d is correct. D-side leaves counted in the incidence graph are genuine original leaves, because singleton D vertices have no neighbors outside A.

Fact A retains an allowed edge ab by deleting both endpoints. Contracting the remaining components together with ab gives exactly one attachment per component, with at most one extra attachment if the unique cycle was destroyed. Singleton components and the bare odd-cycle exception are handled separately. If no original leaf could be exposed, the total remaining deficiency would be at most1, contradicting d>=2.

For Fact B, deleting a cycle edge gives a tree with at least d+1 exposed leaves, at most two newly created. Deleting a bridge gives one tree and one unicyclic component. The last singleton-tree/deficiency-one-unicycle exception is correctly eliminated: matching preservation makes the attachment vertex nonexposable, so another permitted exposed leaf exists. These facts do not claim arbitrary edges are allowed.

## Full TF remainder proof

The tuple and augmentation audits retain arbitrary outside pages. Because F is triangle-free, L has no K4, so each residual clique meets L in at most three vertices. A matching contributes at most one residual edge per block. For a removed internal triangle, its remaining edge and that matching edge cannot be disjoint. For an outside page on a safe edge, disjoint matching/page contributions would make an L triangle through a supposedly safe endpoint. Thus the claimed whole footprints are avoidable stars.

For every maximum F matching, a complement cover of size<r would give a size-r balanced reduction but an available size-(r+1) link matching, contradiction. For an exposed-leaf matching, if the complement matching number were<r, removing one of its cycle edges yields a forest cover of size<=r-1. That supported edge gives the strict residual-cover substitution. Hence the complement has an r-matching, and Fact A shows every allowed edge is avoidable. Fact B then makes every allowed triangular rim edge augmentable.

In GE, any leaf in a perfect C-region would force a global maximum-matching edge, already excluded; hence that region is empty or a bare even cycle. Every A-D edge is allowed by exposing its D endpoint and exchanging A's matching partner. Each A has at least two distinct D-component neighbors. Internal odd-D-cycle and even-C-cycle edges are allowed. Therefore remaining triangular edges are only A-A or A-C.

I separately checked the incidence-component selection in Section5. For A-C, the even C-cycle consumes the unique cycle, so all A-D components are trees with singleton D. For A-A inside one incidence component, that component cannot already contain an actual or contracted cycle, because the added A-A edge supplies another cycle. For endpoints in different incidence components, at most one component can carry the unique cycle, so the other is a singleton-D tree. A D leaf there is an original F leaf. The odd A-to-D path has w-neighbor endpoints and no11 edge; it must contain00, yielding an allowed edge whose endpoints lie in no L triangle. Facts A/B and the already audited outside-page augmentation finish the contradiction.

The assembled theorem excludes ALL connected triangle-free unicyclic remainders F=L-w, including arbitrary triangles through w. It does not exclude nonperfect remainders whose unique cycle is a triangle, supply arbitrary one-cycle cover availability, or prove unrestricted CS. No finite census or Kotzig input is used.
