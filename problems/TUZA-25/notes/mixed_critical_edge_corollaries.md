> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two support exclusions after the defect-two critical-edge reduction

Ordinary coordinated-track deductions, pending independent review. Dependencies: the critical-edge addendum gives R=J-e with connected nonempty triangle support, resilient defect one when J has connected triangle support, every triangle of J lies in K4, defect two, and the proper-CS premises. All background edges are retained.

## Diamond confinement

Any literal K4 of J containing the new edge e becomes a K4-e diamond in R. Every edge of that diamond is triangular in R, so all four vertices and all five old edges lie in the one triangle-support component of R. Consequently every new J triangle, when completed to a K4, has all its vertices in that old support. This rules out hidden new pages through background-only vertices under the K4-completion hypothesis.

## R cannot have W5 support

R has no K4. Hence any K4 in J must contain e, and the preceding confinement places its four vertices in the old wheel. Diamonds in W5 consist of two consecutive hub triangles: their missing edge joins two rim vertices at distance two. Thus e would be a rim diagonal. The two endpoints of one C5 diagonal have exactly two common neighbours in the wheel, the hub and the intermediate rim vertex. It follows that adding e creates exactly one K4. That K4 contains only two of the five old wheel triangles. The other three remain uncompleted, contradicting the hypothesis that every triangle of J lies in a K4.

This reasoning includes arbitrary background edges: an additional K4 or e-page through a background-only vertex would leave old diamond triangles outside the wheel support, contradicting the support assumption.

## R cannot have literal K5-minus-an-edge support

A new J triangle exists because e is critical. Complete it to a K4. Its old diamond puts both endpoints of e inside the five support vertices of R. Their only missing graph edge is precisely the missing K5 pair, so e completes that K5. Diamond confinement excludes all new pages through any outside vertex. Therefore J has literal K5 triangle support, with only nontriangular background elsewhere, and has defect zero. This contradicts the defect-two hypothesis on J.

Thus when the broad frozen rigidity conjecture is invoked on the smaller R, neither W5 nor the K5-e core can discharge this critical-edge branch. A remaining clique-assembly case must use its actual decomposition, and its size is strictly smaller than J. These exclusions do not prove the rigidity conjecture or eliminate every possible clique assembly.
