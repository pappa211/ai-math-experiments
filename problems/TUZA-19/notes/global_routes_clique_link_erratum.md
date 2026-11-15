# Scope erratum to the fixed clique-plus-link obstruction

Applies to notes/global_routes_clique_link_polytope_obstruction.md, frozen SHA25658a6165eb965c00ae7c0fc711b9bdaf22a99809c616b2e8e04447bafccb32b07. The original file is preserved unchanged.

Section5 incorrectly says that a2-packing in K5 matches its edge-count upper bound. The edge-count upper bound is floor(10/3)=3. A3-packing would leave one edge; every K5 vertex has even degree, and removing triangles preserves degree parity, so such a leave is impossible. Thus nu(K5)=2, using the displayed2-packing for the lower bound and parity for the upper bound.

Alternatively, maximality is unnecessary for the local polytope certificate: any valid2-packing, uniformly relabelled and mixed with the empty packing at the stated weight, realizes the required1/6 marginals. The checker already verifies the literal valid2-packing and rational mixture, so no certificate or theorem changes.

The wording error was independently flagged by fresh_critic and root during fresh review. This is a correction to one upper-bound justification, not a change of the graph, hypotheses, packing gap, TF, resilience, or amplification arguments. No new computation is required.
