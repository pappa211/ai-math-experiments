> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# An admissible colored Petersen graph with no half-integral certificate

This is an exact obstruction to replacing the fractional certificate in R by a half-integral certificate. It is **not** a counterexample to R: the ordinary vertex-cover number is 6 and the rainbow-matching number is 4.

Let the Petersen graph have vertices 0,...,9, outer edges i(i+1), inner edges (5+i)(5+i+2), and spokes i(5+i), with indices modulo 5. Its five color classes are

| Color | Three edges |
|---|---|
| 0 | 01, 23, 49 |
| 1 | 04, 12, 38 |
| 2 | 05, 16, 79 |
| 3 | 27, 58, 69 |
| 4 | 34, 57, 68 |

Each class is a matching. The graph is simple, cubic, and triangle-free. Giving every edge weight 1/3 saturates every vertex and every color. Thus it satisfies all hypotheses of R.

For any feasible certificate x, write V_i for the sum of x on the three edges at vertex i, and C_j for the sum on color j. Summing the ten vertex equations gives total edge weight 5. There are exactly five color classes, each of weight at most 1, so every C_j is 1. Direct cancellation of edge terms gives

    V_0 + V_1 - V_2 - V_4 - V_5 - V_6 + C_0 + C_3 + C_4 = 3 x_01.

The left side is 1+1-1-1-1-1+1+1+1=1. Consequently every feasible certificate has x_01=1/3. In particular no feasible certificate is half-integral. This is an ordinary exact proof, independent of the computational feasibility search.

For completeness, the entire feasible polytope is the line segment below, where t=x_79 and 0<=t<=2/3:

| Edge | Weight | Edge | Weight | Edge | Weight |
|---|---:|---|---:|---|---:|
| 01 | 1/3 | 04 | t | 05 | 2/3-t |
| 12 | 1/3 | 16 | 1/3 | 23 | t |
| 27 | 2/3-t | 34 | 1/3 | 38 | 2/3-t |
| 49 | 2/3-t | 57 | 1/3 | 58 | t |
| 68 | 1/3 | 69 | 1/3 | 79 | t |

Exact rational row reduction of the ten vertex and five color equalities has rank 14 and gives this parameterization. Direct substitution checks every equation; nonnegativity is equivalent to 0<=t<=2/3. The endpoints t=0 and t=2/3 both retain edges of weight 1/3.

The exact values vc=6 and rho=4 also have short certificates. Both the outer and inner 5-cycles contribute at most two vertices to an independent set, so alpha<=4. The set {0,2,8,9} is independent; its complementary cover is {1,3,4,5,6,7}. Hence vc=6.

The edges {12,34,58,79} form a rainbow matching of size four, with colors {1,4,3,2}. A matching of size five would be a perfect matching. There are precisely six perfect matchings: a perfect matching has an odd number of spokes; three spokes are impossible because the two remaining outer vertices must be at cyclic distance 1 while the corresponding inner vertices must be at distance 2. Five spokes give one matching, and each choice of a sole spoke gives one matching. All six repeat a color:

| Perfect matching | Color multiset |
|---|---|
| 01,23,49,57,68 | 0,0,0,4,4 |
| 01,27,34,58,69 | 0,3,4,3,3 |
| 04,12,38,57,69 | 1,1,1,4,3 |
| 04,16,23,58,79 | 1,2,0,3,2 |
| 05,12,34,68,79 | 2,1,4,4,2 |
| 05,16,27,38,49 | 2,2,3,1,0 |

Thus rho=4, and R reads 6<=8 here.

Computational evidence: [half_integral_exact_identity.json](../certificates/half_integral_exact_identity.json) contains the checked integer row identity, rank, affine coefficients, and endpoints. [independent_half_integral_audit.json](../certificates/independent_half_integral_audit.json) independently enumerates all 32,768 possible half-weight edge subsets, then all perfect matchings on the remaining vertices. Exactly 27 assignments saturate all vertices with weights in {0,1/2,1}; each exceeds capacity on a color. The primary CSP and this independent enumeration use different search methods. No Lean verification is claimed.
