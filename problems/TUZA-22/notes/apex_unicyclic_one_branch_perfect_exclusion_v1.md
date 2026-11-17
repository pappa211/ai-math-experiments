> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Perfect unicyclic remainder with one branch vertex: full CS exclusion

Frozen ordinary proof candidate, 2026-11-16. The apex may see arbitrarily many cycle/path vertices. All outside pages are retained.

## Statement and shared local audit

In a minimum combined-CS failure G, globally or within an edge-subgraph-hereditary class, no closed link component L at h has a vertex w such that F=L-w is a cycle with one pendant path and F has a perfect matching.

Write a for the cycle attachment vertex. This is exactly the one-degree-three-vertex case of the accepted perfect-unicyclic morphology. If the cycle is a triangle, the pendant path is odd and the accepted `apex_triangle_odd_pendant_link_exclusion_v1.md` applies. Below the cycle has length at least four, so L is K4-free.

For any perfect matching M of F, write |M|=r. The graph F-M has r edges and its only vertex of degree two is a; all other degrees are at most one. Hence it is one P3 plus isolated edges, with a cover Q0 of size r-1. Then P=M and Q=Q0 union {w} form a balanced WKE tuple on L. Deleting all h-spokes and P yields B(K), nu(K)=nu(G)-r.

We repeatedly use two explicit audits. A residual block contains at most three L vertices, because L is K4-free. If an actual rim triangle T meets P and Z is an r-matching of L-E(T), then Z contributes at most one old edge per block and T at most one (two T edges in a clique would force the deleted P edge). Disjoint contributions would require four L vertices. Thus the full footprint is a two-edge star and the hub triangles on Z plus T augment.

Alternatively, if f in P has endpoints lying in NO L triangle, codegree gives an outside page on f; its apex is outside N(h). If Z is an r-matching avoiding f, each block contains at most one Z edge and at most one page spoke. Disjoint contributions would create an L triangle through the page endpoint. Again the full footprint is a two-edge star and gives an augmentation. These are the same literal audits used in the corrected apex-cycle proof; arbitrary other pages on P remain covered by their bases.

## 1. Even cycle and even pendant path

If the cycle has length 2s, the pendant path has even length 2t, t>=1, since |V(F)| is even. Every perfect F matching consists of an alternating perfect cycle matching and the consecutive interior path matching. Both alternating cycle choices are available.

Let S_C=N_L(w) intersect V(C). If S_C contains adjacent cycle vertices u,v, choose the initial perfect F matching M to include uv and let Z use the other alternating cycle matching, with the same path matching. Then Z has size r and avoids the entire triangle T=wuv: it avoids uv and uses no w-edge. The rim audit excludes the case.

If S_C is independent in the cycle, choose a cycle matching edge f not incident with a; one exists even on C4. Neither endpoint lies in an L triangle: the only possible triangles involving a nonattachment cycle vertex are w-triangles on consecutive S_C vertices, which do not exist. The other alternating perfect F matching avoids f. The external-page audit excludes this case.

This exhausts every apex-neighbor pattern in the even-cycle branch, including arbitrary triangles along the pendant path.

## 2. Odd cycle and odd pendant path: setup

Let the cycle have length 2s+1>=5, and write the odd pendant path

    a=x0,x1,...,x_(2t+1)=z,   t>=0.

Its leaf z sees w by minimum degree two. Put r=s+t+1. Let M_u denote the unique perfect matching of the even cycle path C-u. The initial perfect F matching is

    M0=M_a union {ax1,x2x3,...,x_(2t)x_(2t+1)}.

The shared setup supplies a balanced tuple P=M0,Q with w in Q.

For ANY cycle vertex c, the set

    Z_c={wz,x1x2,x3x4,...,x_(2t-1)x_(2t)} union M_c

is an L matching of size r. It uses the leaf edge wz, matches all other pendant-path interior vertices, and uses the cycle near-perfect matching M_c. This matching is available regardless of all other w-adjacencies.

If S_C is independent, take any f in M_a. Its endpoints are nonattachment cycle vertices and belong to no L triangle. Choose c to be an endpoint of f, so Z_c avoids f. The external-page audit excludes this case.

## 3. Odd cycle: a triangle on a matched cycle edge

Suppose u,v are adjacent vertices of S_C and uv belongs to M_a. The triangle T=wuv meets the initial P=M0. Choose c to be an endpoint of uv. Then Z_c avoids uv, and its only w-edge is wz, whose leaf endpoint is not on the cycle. Thus Z_c lies in L-E(T), and the rim audit excludes the case.

## 4. Odd cycle: a triangle on an unmatched cycle edge

It remains to consider adjacent u,v in S_C with uv not in M_a. Choose an endpoint u such that either u=a or u is not adjacent to a on the cycle. Such an endpoint exists on every cycle of length at least five: for an edge incident with a use a; for any other cycle edge its two endpoints cannot both be the two neighbors of a.

Use the matching

    P_u={wu} union M_u union {x1x2,x3x4,...,x_(2t-1)x_(2t)}.

It has size r. The F part has r-1 edges, so its complement in F has r+1 edges. If u=a, that complement has a three-edge star centered at a and otherwise isolated edges. If u is nonadjacent to a, it has two disjoint P3 components centered at a and u and otherwise isolated edges. To see disjointness, these are its only degree-two vertices, they are nonadjacent, and every other vertex has degree at most one. In either case the complement has a vertex cover Q0 of size r-1, saving two from its r+1 edges.

Consequently Q=Q0 union {w} has size r and covers L-P_u. This is a new balanced tuple, with its own B residual. The triangle T=wuv meets P_u in wu. The ORIGINAL perfect F matching M0 has size r and avoids E(T), because uv was assumed absent from M_a and M0 uses no w-edges. The rim audit applies to this balanced residual and gives a contradiction.

Every odd-cycle case is exhausted. Together with Section1 and the already accepted triangle-cycle case, this proves the theorem.

## Exact progress within the unicyclic program

The bare cycle remainder is excluded by `apex_cycle_link_exclusion_full_v2.md`. The present theorem excludes the perfect remainder with exactly one degree-three vertex. The accepted triangular-cycle assembly excludes the three-branch case and all perfect cases with a triangular cycle. Therefore the remaining perfect unicyclic remainder has EXACTLY TWO degree-three vertices, cycle length at least four, and the two branch vertices are adjacent by an edge contained in no perfect matching. The nonperfect remainder remains a separate open branch.

This is a necessary local conclusion in the actual minimum-CS object. It is not a global availability theorem for one-cycle covers or a complete apex-unicyclic classification.

Dependencies: authenticated class-local M0/codegree and literal clique avoidance; the accepted one-odd-path triangle-cycle case (SHA b2e77ded7379826a436aa0c1a69f81c1e0facaec66553477d6facd66fb591f23). The general morphology and other unicyclic notes are used only for the final progress statement. No finite enumeration or Kotzig input enters the new proof.
