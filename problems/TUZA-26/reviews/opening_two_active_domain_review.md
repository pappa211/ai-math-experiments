> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: two active triangle-residual components

Verdict: PASS, PROVED_ORDINARY for notes/apex_two_active_triangle_domain_v2.md, SHA-256 cec7298baeddb12cd4e57d41d24d5d966fb7cd0b4dbfdfa84f0f1d9fc138aba0. This is support confinement, not complete exclusion of the two-active branch. No numerical run or Lean verification was needed.

V1 was read and its isolated-vertex wording was corrected by the author in V2. The accepted bound is |V(supp_triangle Q)|<=26. Retained ambient isolated vertices do not satisfy a literal order bound and play no role. All substantive mathematical cases are unchanged.

## Exact hypotheses and paid one-boundary lemma

J=Q-E(T) has exactly two old active triangle supports C1,C2 from frozen C12, no other old triangle components, and arbitrary background. Their summed packing is r, and Q has packing r+1 and cover 2r+1. Two-edge resilience, degree at least four on support, the complete boundary-at-most-two exclusion, and the genuine K5 triangle-leaf exclusion are premises. The one-boundary proof also requires proper-subgraph CS for its explicit retained actual subgraph; this holds in the stated fixed-G minimum-Q application. This is not an unconditional theorem about arbitrary pairs of named models.

For a defect-one region C with complete outside-triangle boundary exactly {f}, let K delete every C edge other than f. Every outside triangle survives and every C triangle disappears. An f-avoiding C maximum and a K maximum combine, while triangle-family partition gives the converse, so nu(Q)=nu(C)+nu(K). Combining covers first forces tau(K)>=2nu(K); proper CS gives equality and B(K). The boundary is nonempty, so f is triangle-supported in K and eligible there. Minimum covers in C and K both containing f save one edge, yielding tau(Q)<=2nu(Q)-2, contradiction. This verifies the actual deletion, background retention, additive packing and cover payment without naming a replacement graph.

For W5 and K5-e, all edges are eligible and single-edge resilience supplies the assumptions. For a fresh named model, a literal leaf clique has complete Q boundary contained in its old attachment edge and the whole model's one outside-used edge, so the previously paid at-most-two theorem applies. Thus no entire active component can have exactly one outside-used edge. Zero outside-used edges would leave it triangle-disconnected from the other component.

## Ordinary domain reconstruction

Universal vertices make each C_i induced in J. Their shared vertices form an independent set in each: a shared adjacent pair would give a shared supported edge and merge the old triangle components. The intersection therefore has at most three vertices, and if it includes the missing pair of a K5-e, it has no third vertex.

Any nonterminal support vertex outside the union of C1,C2 can only be a new ordinary-page apex, so all its neighbors lie in T and its degree is at most three. Such vertices are excluded. Each T base has an ordinary page, since restoring that base alone must already increase packing by one under two-edge resilience.

If two T terminals b,c are outside the old support union, every bc-page is bare and every other page has at most one old supported spoke. Two pages on different bases with distinct apices append over old component maxima, giving r+2. Thus all base families have one common apex, and the entire new family is K4. It meets the old support through at most one edge, so cannot join both old components into connected Q. This also covers three outside terminals.

Now let only c be outside. If a,b have no common active component, they belong exclusively to different components. An ac-page and bc-page with distinct apices append while avoiding at most one old edge per component. Both complete page families consequently have the same singleton apex. Every old c-edge must occur in one of those pages, so c has degree three, contradiction.

If a,b share C1, at least one belongs to C2 or that component would remain untouched. If only a belongs to C2, every C2-attaching page uses an edge ay whose other endpoint y is outside C1; its other old spoke is background. A bc-page has at most one C1 spoke. Distinct apices again append over old maxima, forcing the complete C2 boundary to be one edge ax. The paid one-boundary exclusion applies. Additional shared vertices cannot create an unlisted C2 boundary edge because all actual new triangles have already been included.

It remains that both a,b belong to both components. For an ac-page, its ax spoke is supported in exactly one component and cx is background. If both components augment packing upon insertion of ab, augment the other component, avoid ax in its own component, and append this page, obtaining r+2. This uses only the exact named internal insertion response, not a claim about arbitrary page avoidance in W5.

If exactly one component is K5-e on missing pair ab, augmentation in the other forces every ac/bc-page's old supported spoke into that other component. Hence c has no old neighbor among the K5-e's three other vertices. The intersection is exactly {a,b}. Those three vertices cannot have any other outside background edge: an old background edge must become triangular through a T page, and the only possible external terminal here is c. Inserting ab therefore makes a literal K5 with at least two genuinely private vertices, contradicting the paid triangle-leaf exclusion. This is a proof of freshness, not an inference from abstract component separation.

If both components are K5-e, their intersection is exactly {a,b}. Restoring only ab completes precisely two K5s sharing ab; no other apex can create an ab-page. The packing remains four, contradicting two-edge resilience, which requires r+1=5. This proves that all T terminals lie in the old support union. The earlier support-vertex confinement then gives the claimed support order at most26.

## Internal constraints and residual status

The final additional constraint is valid: augmented packings in different old components on distinct restored bases have disjoint old edges and distinct new edges, giving r+2. When neither component is K5-e, both cannot contain at least two T vertices; if their two-terminal pairs coincide, the third terminal lies in one component and supplies a distinct base there. Since all three terminals are in the union, one component contains two or three terminals and the other just one. This statement permits all independent shared-vertex patterns consistent with those memberships.

For a base with one endpoint outside a component, its supplied page apices inside that component form an independent subset of the internal endpoint's neighborhood. An adjacent pair of apices would make an old outside-endpoint triangle sharing their old component edge, merging that endpoint into the component. The bound of three uses the exact C12 independence property. No full marked-star response or finite amalgam domain has been inferred from this observation.

The proof does not use the separate connected defect-two single-deletion theorem, and no later every-triangle-minimum-cover argument is smuggled into its premises. Its remaining all-inside two-active interface is OPEN. A connected resilient defect-two component is still unnamed. The bound26 alone does not certify a finite enumeration: every independent identification, old cross-triangle condition and permitted background edge would need inclusion.

## Critic guidance for the current predecessor programme

For K=Q-uv, relabeling its page-spoke pair deletion as Q-E(uvx) is exact but is not a new descent: its residual still has defect two and is not named by minimum-Q minimality. Even a smaller connected resilient defect-two graph needs a proved restoration interface before its size is useful.

An actual paid advance would, for example, identify an actual retained subgraph H and prove both a packing extension nu(Q)>=nu(H)+p and a cover extension strong enough to force tau(Q)<=2nu(Q)-2. Under proper CS, a cover cost at most2p-2 suffices; if H is independently known defect one, cost at most2p-1 suffices. Alternatively, producing a smaller connected resilient defect-one support inside fixed G permits naming, but every crossing triangle and restoration payment must still be discharged. A full literal reconstruction of Q as an existing C12 model is another legitimate closure. None follows just from repeating blocker terminology or importing the defect-one blocker response into defect two.

Frozen UTC: 2026-11-16T22:45:26.933935+00:00
