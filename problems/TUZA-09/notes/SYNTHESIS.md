> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Synthesis: what the proposed bridge must actually add

## Existence of a splittable budgeted multicover is equivalent to Tuza

PROVED_ORDINARY. Fix a finite simple graph G. The following are equivalent:

1. tau(G)<=2nu(G).
2. There exists an integer two-fold edge multicover m of total at most4nu(G) whose copies can be divided into two ordinary triangle covers.

For (1)=>(2), take a minimum ordinary cover C and set m=2 on C, zero elsewhere. For (2)=>(1), at least one of the two covers has size at most half the total, hence at most2nu. This equivalence is elementary bookkeeping, not a simplifying theorem. Demanding that an unspecified budgeted multicover be rearrangeable into a splittable one has not reduced the problem unless a separate structural invariant or construction is supplied.

Likewise, merely postulating some budgeted multicover for which an ordinary cover costs at most half its total is equivalent to Tuza. Fixing a specific constructive output can give a stronger, independently falsifiable claim; the K6 trace refutes universal *splitting* of CKSU's output, but does not refute the existence of one sufficiently cheap ordinary cover for that output.

## Exact finite facts and the gap between them

The K5 witness simultaneously has optimal multicover total8 and saturated budget4nu=8, yet does not split. It nevertheless contains an ordinary four-edge cover. K6 supplies the same splitting obstruction in the published construction. Two disjoint C5 cones instead refute half-cost rounding itself: M2=10 and tau=6, even allowing an arbitrary ordinary graph-edge cover. Its4nu budget is16, so the latter example leaves unused budget and does not refute Tuza.

The Petersen cone has p=0,q=1. The prism-cone family makes p=0,q/nu tend to1. Together with K4 and disjoint unions, this shows that a sharp proof must accommodate the entire line of normalized gap pairs between(1,0) and(0,1). These are exact constructions or consequences of credited prior-art ingredients; they do not prove the inequality p+q<=nu for all graphs.

## A distinct restricted target with explicit missing hypotheses

The zero/half support translation in [LP_GEOMETRY.md](LP_GEOMETRY.md) retains full graph triangles and zero-edge color identities. Its desired support cover theorem vc(J)<=2nu_rainbow(J) is stronger than ordinary Tuza on that restricted class. The reduction is an ordinary proof; the inequality is OPEN IN THIS MISSION.

It does not reduce arbitrary Tuza to this class. Optimal fractional covers need not be half-integral, and the positive support need not be triangle-free. Bipartite J is already covered by Konig plus Krivelevich; unique colors are covered by ordinary matching endpoints. The unresolved interaction therefore involves nonbipartite J and repeated colors with the additional graph-realization and fractional-saturation hypotheses. An investigation that discards those hypotheses is a different and potentially false problem.

The bounded census tests this stronger support-only statement, not just ordinary Tuza on known small graphs. All1253 graph-atlas representatives with at most7vertices were inspected;2192 eligible optimal supports in505graphs passed. One maximizing support from each eligible graph was subsequently inspected:7 had both nonbipartite J and repeated colors. This is modest falsification evidence, not an arbitrary-graph proof or a GO threshold. No claimed exhaustive graph census beyond7vertices, no universal half-integrality, and no historical novelty follows.

## Decision

REDIRECT. Preserve the exact obstruction package. Do not authorize a longer campaign to halve arbitrary multicovers, split every published-construction output, derive a uniform strict gap saving from packing integrality, or merely recombine existing constant-bound inequalities. If later work is separately requested, its genuinely different object should be the graph-realizable colored support system, with a precise first task to either prove its support-cover inequality or find a counterexample respecting optimality. This is a restricted feasibility question and currently has no demonstrated route to all finite simple graphs. No next campaign mandate is issued.
