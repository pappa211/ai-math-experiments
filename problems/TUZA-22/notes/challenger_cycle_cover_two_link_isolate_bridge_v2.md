> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A certified global internal-path-vertex exclusion for cycle covers

Status: PROOF_USING_FINITE_CERTIFICATES. The transport argument itself is ordinary and independently reviewed; the local isolate exclusion now has its own independent finite validation. The conditional v1 remains preserved.

Let G be a minimum combined-CS failure in the hereditary class of graphs admitting ANY triangle-edge cover of total cycle rank at most one. The accepted reductions make a selected cover C a Hamiltonian cycle and G K5-free. The full link at every vertex is connected; deleting its two selected cycle neighbors leaves a path forest of matching number at most two and at most one isolate. These statements are derived in challenger_cycle_cover_residual_domain_v1.md, with the matching-two bound's finite P6 premise explicit.

Let L_h be the full actual link at h, with F_h obtained by deleting h's two selected neighbors. Suppose v is an INTERNAL vertex of an F_h path and

    deg_(F_h)(v)=deg_(L_h)(v)=2.

Its two neighbors u,w in F_h are its two selected cycle neighbors, and uw is absent because F_h is an actual path forest. The FULL common-neighbor identity gives

    N_(L_v)(h)=N_G(v) intersect N_G(h)={u,w}.

Hence h is an isolate in F_v=L_v-{u,w}, and its two apices u,w are nonadjacent. The ordinary domain transfer puts this full neighboring link into the exact one-isolate/no-apex-edge domain excluded by challenger_cycle_cover_isolate_exclusion_v1.md. If no nontrivial path remained, robustness would already exclude the three-vertex link. This contradiction proves:

    No such internal F_h vertex of full-link degree two exists.

The corresponding finite-checkable GLOBAL_CYCLE_COVER_INTERNAL_VERTEX certificate supplies v and its two F-neighbors and verifies deg_F(v)=deg_L(v)=2. It is valid ONLY in this Hamiltonian-cycle-cover minimum-failure context. It is not a theorem that every isolated literal link with that pattern is locally WKE or independently reducible.

In particular it excludes the genuinely non-WKE P5 boundary whose middle vertex2 has only neighbors1,3 in L_h: the contradiction occurs in the FULL neighboring link at2, where the original hub h is the isolate. All codegree-forced outside vertices/pages are included in that neighboring link rather than discarded.

There is no circular finite dependence. The P6 matching-bound interface and the one-isolate interface use only ordinary local certificate rules; neither invokes this global certificate or a completed original fourteen-shape theorem. They are validated before this global rule is introduced. No original-domain rerun is a premise of the rule.

Inputs: challenger_cycle_cover_residual_domain_v1.md SHA4f7f701df00dcaca4efb5a8bcce71c042f1644774483f7ab4f67728ae62add94; challenger_cycle_cover_isolate_exclusion_v1.md and its frozen producer/independent-validation files; ordinary conditional reconstruction review/cycle_cover_two_link_isolate_bridge_independent_review.md SHA988b02de391e268a6d74c40d8fb100a9d111e7560f85757761ba20e7adfb00e7. No universal cover-availability or unrestricted-CS conclusion is drawn.
