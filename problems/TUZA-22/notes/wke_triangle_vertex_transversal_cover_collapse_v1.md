> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# WKE equality versus a triangle vertex transversal

Frozen ordinary generalization, 2026-11-16. No finite computation, Kotzig theorem or Gallai-Edmonds input is used.

## General criterion

Let L be a closed link component at h in a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class. Let S be ANY vertex set such that F=L-S is triangle-free. Suppose P,Q are WKE: P is a matching of size r and Q covers L-P with |Q|<=r.

Let Z be the vertices OUTSIDE S that are matched by P to vertices of S. Then

    r <= |S|+|Z| <= 2|S|.                       (1)

Thus any supplied WKE tuple with r>|S|+|Z| is impossible. The sharper |Z| term matters when P leaves some S vertices unmatched or matches pairs inside S.

This statement concerns the SIZE OF THE SUPPLIED WKE MATCHING. For |S|>=2, no unrestricted conclusion about the maximum matching number of L is inferred: larger hub matchings may have more complicated residual-clique footprints.

## Proof with simultaneous minimum covers

Delete all h-spokes to L and P, obtaining K. Standard class-local accounting gives immediate strictness or B(K), nu(K)=nu(G)-r and tau(G)=2nu(G). Assume the balanced case.

Take an edge e=xy of F-P with neither endpoint in Z. Codegree at least two gives a page xyt other than hxy. Its apex t cannot lie in F because F is triangle-free. If t lies in S, neither page spoke is in P: a deleted spoke from t to an outside-S vertex would make that endpoint a member of Z. If t lies outside L, both spokes survive because every P endpoint lies in L. An apex in another h-link component is impossible by closedness. Thus every such e is triangle-supported in K.

Every old literal K4/K5 block contains at most two F vertices, so it contains at most ONE F edge. Therefore all supported edges of F-P can be placed SIMULTANEOUSLY in a minimum K cover D, choosing a minimum block cover through its single prescribed F edge wherever needed. This is legitimate even with shared vertices between old blocks, because triangle-edge supports are disjoint.

In (L-P)-D, every remaining edge either meets S or is an unsupported F edge, which must meet Z. Hence S union Z is a vertex cover of that graph. The actual edge set

    D union P union {hx:x in S union Z}

covers every G triangle: P covers every lost page on a deleted matching edge, D covers all remaining old triangles and supported rims, and the selected hub spokes cover all uncovered hub rims. Consequently

    tau(G)<=2nu(K)+r+|S|+|Z|.

Equality tau(G)=2nu(K)+2r gives (1). The inequality |Z|<=|S| follows because P is a matching.

## Ordinary triangle-free WKE exclusion, with no Kotzig input

Set S empty. Then Z is empty and (1) says r<=0. A nonempty minimum-degree-two link cannot have a WKE tuple with r=0, since its required empty Q would cover no edges. Thus EVERY nonempty triangle-free WKE closed link is excluded in minimum CS.

Equivalently, in that case all edges of L-P are supported and lie in distinct residual blocks, so one minimum K cover D already covers ALL L-P; D union P covers G at cost 2nu(K)+r<2nu(G).

This is a new ordinary proof of the earlier triangle-free WKE CS transfer. The earlier `triangle_free_wke_link_exclusion_v1.md` remains preserved with its declared Kotzig dependency; this new argument removes that dependency from any theorem explicitly repinned to the present proof. It does not prove that every triangle-free graph is WKE. Historical finite WKE availability inputs retain their own finite labels.

## Near-bipartite and unicyclic consequences

With S={w}, (1) reproduces the preceding near-bipartite collapse: r<=2 if w is matched and r<=1 if w is unmatched. This is the mechanism used by the new ordinary triangle-free unicyclic assembly.

For a general connected nonperfect unicyclic F0=L-w, choose a maximum F0 matching exposing an original leaf and add its w-spoke, obtaining the ordinary WKE tuple of size nu_match(F0)+1. If F0's unique cycle is a triangle, choose one cycle vertex a and set S={w,a}; then L-S is triangle-free. The criterion shows

    nu_match(F0)+1 <= 4,

so nu_match(F0)<=3 in any surviving such link. If a can be exposed in the chosen matching as well, the sharper Z count lowers the bound further. This is an exact structural bound from the new general criterion, not an extrapolated census. The small-matching triangular-cycle interface is still open.

Dependencies are only authenticated class-local M0/codegree and elementary minimum K4/K5 covers through one prescribed edge. Every outside page and complete residual-cover prescription is audited above.
