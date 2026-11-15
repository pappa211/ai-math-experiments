# Track A initial proposals and changes of scope

Scout context: inherited coordinator context; not a blind independent agent. Start of mission is 2026-11-04T00:45:12Z; original hard deadline 02:45:12Z. All work is local to the authorized private workspace. Historical sources are read-only.

## Literal adversarial target A1

For fixed r and fixed lower triangle-codegree threshold k, can minimum triangle codegree k rescue the prescribed within-part colour deletion budget? Test G=I_q join B[t], B connected, triangle-free, chi(B)>r, t-clones independent. Freeze the objective as the minimum number of monochromatic **rim** edges, over all r-colourings of every clone individually. Do not assume uniform clone colours.

Initial result (before computation): this rescue is false. Exact rim cost is t^2 m_r(B), m_r(B) the minimum monochromatic edge count in an r-colouring of B. Every triangle has one apex. Codegrees are q on rim edges and t deg_B(v) on spokes. The spoke bound gives 2nu(G)<=q|B|t. A random representative of each clone class proves the exact t^2 scaling lower bound, and a uniform lift attains it. Hence fixed codegree does not repair the budget.

## Mechanism 1: small vertex separators

Exact proposed transfer: if G is a union of triangle-separated pieces sharing only a set B of at most two actual edges, and Tuza holds for each piece and its B-deletion, then Tuza holds for G. This would exclude vertex separators of order at most two in an actual edge-minimal counterexample. Operation: solve each proper piece and glue packing/cover states. Existence: a separator supplies the pieces; no theorem yet forces a separator. Obstruction: dense high-connectivity graphs. Cheap test: two K4s sharing one edge, with all actual triangles reconstructed.

Source check immediately identifies this as already proved in TUZA-11 FLAT_GLUING_AND_KERNEL.md. Krivelevich 1995, Lemma 5, already supplies the two-vertex separator special case. This is KNOWN_INPUT, not a TUZA-17 advance.

## Mechanism 2: shared-triangle separator

Precise next lemma, stated before deriving its proof: G is a triangle-separated union of pieces whose pairwise edge intersections lie in the same actual triangle B, each piece contains B, and every B-edge deletion of each piece satisfies Tuza. Then G satisfies Tuza. Operation: allocate singleton boundary packing gains; if two pieces gain on disjoint boundary masks, combine them, otherwise localize every singleton gain to one dominant piece and use the boundary edge chosen by its cover. The first unproved step at proposal time was whether dominant-piece cover and complementary inactive states always fit. Existence of the operation is supplied by an actual triangle separator, not by minimality. Likely obstruction to global use: graphs with no small separator. A cheap decisive check is three K4s sharing a common K3.

A complete proof was obtained and sent to root. It proves no vertex separator of order <=3 in an edge-minimal counterexample. Root then found prior art: Freitas 2014 thesis explicitly states 4-connectivity of a minimum Tuza counterexample. The result is therefore a reconstructed structural consequence with originality UNESTABLISHED/known conclusion, not a new global advance. Exact proof retained in A_RESULTS.md.

## Materially different follow-up from the failures

Freeze a stronger limitation target, rather than increasing a codegree threshold: construct one family simultaneously satisfying arbitrary fixed minimum triangle codegree, arbitrary fixed vertex connectivity, one shared-edge triangle component, and extension of EVERY prescribed one/two-triangle packing to a maximum packing, while still defeating prescribed r-colour deletion. Also identify a specific critical identity it fails.

Use B=B0 Cartesian-product K2, where B0 is connected triangle-free with chi(B0)>r; G=I_q join B[t]. The layer matching gives q disjoint rim perfect matchings for t>=q. Thus nu(G)=q|B|t/2. Every spoke deletion then lowers nu exactly by one, explicitly failing the true critical deletion-resilience condition. A fresh matching-completion argument should establish prescribed one/two-triangle extension for t>=2q+8. This is not a claim that G is critical, and no actual Tuza violation is required or sought in the tests.

The stronger limitation is now the primary Track A development task. A common-triangle interface proof is retained as a control on scope, not promoted beyond the prior conclusion.
