# Arbitrary graph geometry survives a unique half-integral optimum

Frozen candidate statement and ordinary proof, TUZA-19. Root reconstructed the construction before this file was written and found no immediate defect; final review status must be recorded separately. No historical originality, human review, or Lean verification is claimed. All graphs are finite and simple, and all actual triangles are included.

## Gate and intended role

A proposed fractional-to-integral route first chooses an optimal half-integral triangle edge cover and then rounds its half-weight core by exploiting simple graph structure. The specific structural gate tested here is:

> Every graph has an optimal half-integral triangle cover whose half-weight support is triangle-free, or belongs to a fixed bounded-chromatic graph class.

Such a gate would remove or constrain the three-half-edge triangle conditions, leaving the tight two-half-edge constraints as a graph covering problem with edge-capacity information. Even a positive gate would still need a packing-sensitive rounding theorem; that missing implication was not assumed. The theorem below refutes the structural gate directly, including every possible choice of optimal cover. It also shows that a simple graph of tight constraints does not control the actual triangles that rounding must cover.

## Theorem

Let J be any finite simple graph with m edges. There is a finite simple graph W(J), with |V(J)|+4m vertices, 10m edges, and 5m+t(J) actual triangles, such that:

1. The unique optimal fractional triangle cover assigns weight one-half to a set H of 5m edges and zero to all remaining edges. Thus the optimum is 5m/2, and it is also the unique optimum among half-integral covers.
2. The subgraph with edge set H induces exactly J on the original vertices. Its remaining vertices are leaves of H. Therefore arbitrary core graph geometry, including unbounded chromatic number and treewidth, survives in the half-weight support.
3. The graph whose vertices are half-weight edges and whose edges are tight triangle constraints containing two half-weight edges and one zero-weight edge is the disjoint union of m five-cycles. The actual triangles consisting of three half-weight edges are exactly the triangles of J; their fractional inequalities have slack one-half.
4. The exact integral parameters are

       nu(W(J)) = 2m + nu(J),       tau(W(J)) = 3m.

The formulas include m=0, where there are no graph edges or triangles and the fractional vector is empty. These graphs satisfy Tuza with substantial slack. The result is an obstruction to the proposed simplification, not a counterexample to Tuza or to all packing-sensitive rounding arguments.

## Construction and all actual triangles

Orient each core edge e=uv arbitrarily as u to v. Add four fresh vertices a_e,b_e,c_e,d_e. Use u as the apex of a five-wheel whose rim, in cyclic order, is

    v, a_e, b_e, c_e, d_e.

Insert the five spokes from u to the rim and the five rim-cycle edges. The spoke uv is the original core edge. There are no other new edges. Different wheels use disjoint sets of fresh vertices, and each contains exactly its own core edge, so their graph-edge sets partition E(W(J)). They may share original vertices, which causes no edge identification.

A fresh vertex has all its neighbors inside its own wheel. The only original vertices of that wheel are its two marked endpoints u and v. Any triangle containing a fresh vertex therefore lies in that wheel; its five-wheel has exactly the five triangles formed by the apex and a rim edge. A triangle containing only original vertices is precisely a triangle of J. The two families are disjoint. This proves the exact triangle count, including every possible closure triangle. It also proves the vertex and edge counts.

## Fractional optimum, uniqueness, and tight components

Let x give one-half to every spoke and zero to every rim edge. Each local wheel triangle contains two spokes, so its x-load is exactly one. Every core triangle contains three marked spokes and has x-load three-halves. Thus x is feasible with total value 5m/2.

For a dual fractional packing y, give weight one-half to each local wheel triangle and zero to each core triangle. Every spoke is used by two local triangles and receives total load one; every rim edge is used by one local triangle and receives load one-half. The wheel edge sets are disjoint, so no load from a different wheel is added. This is a feasible dual solution of value 5m/2, proving optimality by the elementary weak-duality inequality.

For uniqueness one does not need to assume an algorithm or a nondegenerate LP basis. Let z be any optimal fractional cover. In the equality chain

    sum_e z_e >= sum_e z_e load_y(e)
              = sum_T y_T sum_(e in T) z_e
              >= sum_T y_T,

both inequalities must be equalities. Since load_y(e)=one-half on every rim edge, each rim z_e is zero. Since y_T=one-half on every local wheel triangle, every one of those triangle constraints is tight. Writing z_i for the five spoke values around one wheel gives z_i+z_(i+1)=1 cyclically. Alternating these equations around an odd cycle forces every z_i=one-half. The wheel edges partition the graph, so every coordinate is uniquely determined.

The half-weight graph consists of J together with four new leaves adjacent to the chosen source endpoint of each edge. The tight pair constraints join consecutive spokes around each wheel, giving exactly m disjoint C5 components. The original J triangles are additional, genuinely slack three-half-edge constraints; omitting them is not a valid replacement of the covering problem.

## Exact integral packing and cover parameters

A five-wheel packing is a matching in its rim C5: two local apex triangles share an edge exactly when their rim edges share an endpoint. Its maximum packing size is two. Consequently, any packing in W(J) contains at most two local triangles per wheel and at most nu(J) core triangles, giving the upper bound 2m+nu(J).

Each wheel has a local two-packing avoiding its marked spoke uv: choose triangles u a_e b_e and u c_e d_e. Their edges are disjoint, no marked edge is used, and different wheels have disjoint edge sets. These 2m triangles can be joined to any maximum packing of J, proving equality.

A local wheel triangle cover has size at least three. One elementary proof replaces each chosen rim edge by either incident spoke; this cannot increase the cardinality and cannot uncover a local triangle. The resulting selected spokes correspond to a vertex cover of C5, whose minimum is three. Since wheel edge sets are disjoint and every local wheel triangle only uses its own wheel edges, every cover of W(J) therefore has at least 3m edges.

In each wheel select spokes to rim vertices v,b_e,d_e. These three rim vertices cover the cycle and include the marked vertex v, so the selected edges cover all local triangles and contain every original edge of J. The union thus covers all core triangles as well, with exactly 3m edges. This proves tau(W(J))=3m.

## Implications and limits

Taking J=K3 refutes triangle-free half-weight support even for a unique optimal fractional cover. Taking J=K_r for arbitrary r refutes every fixed chromatic bound, despite the tight-constraint graph being only disjoint five-cycles. Taking arbitrary J proves the induced embedding statement, not merely a growing collection of examples.

A rounding rule that solves the tight components independently can fail if it ignores the slack core triangles. Each C5 has a minimum three-vertex cover avoiding its marked rim vertex v (choose a_e,c_e,d_e); hence selecting those local cover states in every wheel omits every core edge and leaves every core triangle uncovered. This disproves the EVERY-local-optimum choice rule. Compatible local minima do exist: the three-spoke choices used in the cover proof select all marked edges. Thus an existential compatibility theorem is not refuted.

The construction has unused packing budget: 2nu−tau=m+2nu(J). It therefore does not refute a structural gate restricted to actual minimal Tuza violations or a rounding proof that pays for the core through this slack. No theorem making such a restriction applicable has been supplied here. Without a new packing-sensitive invariant, this route is closed after preserving this obstacle; simply expanding the finite test range would not advance the global implication.

## Relation to frozen work and primary literature

TUZA-16 `PROOFS_AND_OBSTRUCTIONS.md` Sections 3–4 already block dense replication that tries to preserve the integral packing scale. TUZA-14B's published eligible fractional bound keeps the all-red mass loss and fractional-to-integral matching loss separate. TUZA-09 `problems/TUZA-09/notes/MULTICOVER.md` already proves that optimal multicovers need not split or admit half-cost rounding; its residual formulation explicitly retains pair AND triple constraints. Those results were read before freezing this gate.

[Chalermsook, Khuller, Sukprasert, and Uniyal, arXiv:2001.00257v2](https://arxiv.org/pdf/2001.00257) Theorem 2 supplies denominator-k covers of cost at most 2nu for every k at least two; Proposition 6 gives a factor-three-halves rounding bound from the normalized third-integral optimum. Only the relevant statement/discussion passages were inspected here, not the complete 69-page proof. [Chapuy et al., arXiv:1012.0372v2](https://arxiv.org/pdf/1012.0372) Theorem 1.10 rules out a universal fixed denominator for fractional optima. These primary checks prevent treating such denominator existence as a new gate. Neither published theorem is needed for the elementary construction above.

The embedding strengthens the diagnostic point relevant here: arbitrary slack triangle geometry persists under a UNIQUE half-integral optimum whose entire tight constraint graph is especially simple. Historical originality remains unassessed.
