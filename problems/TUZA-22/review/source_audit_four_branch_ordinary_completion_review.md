> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: ordinary four-branch completion

2026-11-16, reconstructed before the 05:10:41 UTC research cutoff. Source_audit. ACCEPT at the stated ordinary assembly scope.

Frozen source: notes/coordinator_four_branch_ordinary_completion_v1.md, SHA256 a67ee9350b06917ad3b77b098244e35c160d7ef8074b0679a891090c0920a81b.

I independently checked the new two-disjoint-doubles/no-extra-even construction. The two alternating even-thread matchings use two distinct branch endpoints; a direct cross pair f can be made to join exactly the two free endpoints. Internal odd-thread matchings are disjoint from all branches. The Q counts are therefore |P0|+2-q and, after adding f, |P|+1-q. The q>=2 and q0 dispositions are valid.

For q1, choosing f opposite the sole odd pair e leaves complementary endpoints. The residual branch core is exactly K4 minus e,f, a four-cycle. Complementary matchings on both even paths cover the f endpoints, while the full alternating matching of the odd e path covers its two endpoints. These residual matchings are disjoint, have total size |P|, and lie entirely outside P. All residual path pieces outside the core are pendant paths/edges or isolated edges, so the residual is triangle-free. The accepted ordinary equal-matching TF-residual theorem applies exactly.

I read the many-even Section1 construction separately. At least four even pairs on four branches supply a connected spanning unicyclic assignment, saturating each branch once. Its P,Q count is independent of triangle presence. Thus for triangle-free L the paid-triangle collapse with S empty really has t=0 and contradicts |P|>0; no finite WKE-existence assertion is being smuggled into that branch.

I also reconstructed the apex-pseudoforest three-branch-triple multiplicity deduction and the complete 2K2/K3/P4 case split. With at most three even paths, the number of doubles is at most three. Two doubles must be disjoint; three cannot form a star; each surviving shape forces every underlying pair present. The displayed K3/P4 tuple counts and residual-diamond contradictions are correct. In the 2K2 plus one even single case I checked the near-perfect matching and its residual coloring: the remaining ac path is compatible with equal colors at a,c, and the branch core lies in the indicated C4. Ordinary bipartite matching-cover equality then supplies the asserted WKE tuple.

The earlier ordinary K4-bearing, three-branch, thread, apex-pseudoforest and general WKE/collapse theorems are named proof inputs; this fresh review checks their stated interfaces and the new assembly, not a new line-by-line audit of every transitive predecessor. In particular the apex-pseudoforest source explicitly uses its ordinary boundary/full-C4/bouquet chain. The historical363 and5375 finite domains are not premises of this replacement. No unrestricted-CS conclusion follows: the theorem only forces at least five branch vertices in each nonempty closed link of a minimum CS failure.
