# K4-incidence cones: a Gallai barrier closes the resilient-envelope attempt

Status: complete ordinary derivation, conditional only on the classical Gallai A-path min-max theorem stated explicitly below. No new unrestricted Tuza theorem or novelty claim. This closes the proposed envelope construction, rather than asserting a general classification of resilient graphs. No search, SAT, or Lean computation is used.

## Exact construction and purpose

Let R be a finite simple graph whose edge set is partitioned into b literal K4 blocks. Assume that distinct blocks share at most one vertex and EVERY actual R-triangle belongs to one of these blocks. For example, the clique expansion of a linear four-uniform hypergraph with no Berge triangle has these properties. Retain n=|V(R)|, including any isolated vertices. Let B=cone(R), with apex a.

The purpose was to retain a large global cut-complement cost in an incidence rim while allowing old rim triangles to compensate for losses among apex triangles. Unlike a triangle-free cone, its packing optimization is initially a rainbow-matching problem. A dense non-balanceable incidence system could have a cut-complement cost exceeding the desired twice-packing budget.

For a direct H-O2 construction, attach a private K5 along every apex spoke av and call the result W. The K4 rim R is an induced edge-cover-critical core. Selective K5 decoration therefore makes W edge-cover-critical, and cancels all spoke weights in its odd-cover objective. The only missing property would be two-edge packing resilience. The following argument shows that this property forces a packing saturation that already makes the odd-cover bound cheap.

## Exact packing profile

Let rho_U be the largest matching of R-U that uses at most one edge from each K4 block. Then for EVERY set U of rim vertices,

    nu(B - {av:v in U}) = b + rho_U.                       (1)

Indeed the apex triangles of any packing give an ordinary rim matching M avoiding U. It uses zero, one, or two edges in a given K4. Two such edges are opposite and destroy all four old rim triangles. Zero or one selected edge leaves a rim triangle available. Thus the largest extension of M by rim triangles has size

    b + |M| - number of blocks containing two M-edges.

Deleting one selected edge from every double-used block leaves a matching with at most one edge per block and exactly the same score above b. Conversely every rainbow matching extends by one rim triangle in each block avoiding its selected edge. The blocks have disjoint edge sets, so those choices coexist. All actual triangles have been accounted for by the hypothesis on R.

## A-path model and the precise imported theorem

Make the bipartite incidence graph Q with one terminal vertex for every vertex of R and one nonterminal vertex for every K4 block, adjacent precisely to that block's four vertices. Let A be the terminal set. An A-path has distinct endpoints in A and no internal vertex in A. Since the other bipartition is independent, every A-path in Q has exactly two edges. Therefore vertex-disjoint A-paths are exactly the rainbow matchings counted by rho_empty. Deleting terminal vertices U gives rho_U.

Gallai's A-path min-max theorem states

    rho_empty = min over X subset V(Q) of
        |X| + sum over components C of Q-X floor(|A intersect C|/2).  (2)

The exact statement and definition were read in Tomas Kaiser, *Disjoint T-paths in tough graphs*, primary author/institution preprint https://iti.mff.cuni.cz/series/2005/270.pdf , Theorem2, pages1-2. Kaiser attributes it to Gallai. This note imports that classical theorem, not Kaiser's later toughness or prescribed-edge conclusions. The theorem's full original proof was not replayed here.

There is also a useful exact ordinary-matching model: replace each block node by two adjacent clones, each adjacent to its four terminals. A matching using two terminal-clone edges at a block gains one edge over its internal clone edge; a block using only one terminal-clone edge can be replaced by the internal edge without loss. Hence the matching number of this auxiliary graph is b+rho_empty, and the same identity holds after terminal deletions. This observation is not needed to replace the explicit min-max dependency.

## Two-spoke resilience forces every block to be selected

Assume merely that deleting ANY set of at most two apex spokes preserves nu(B). No resilience for rim-edge deletions is assumed. By (1), rho_U=rho_empty for every |U|<=2.

Choose a set X attaining (2).

If some terminal v belongs to X, then X-{v} is a permissible barrier for Q-v. Its remaining components are unchanged, and its value drops by one. Thus rho_{v}<=rho_empty-1, a contradiction. Consequently X contains only block nodes.

If a component C of Q-X contains two distinct terminals u,v, use the SAME barrier X in Q-{u,v}. Deleting these vertices may split C. If the resulting components contain terminal counts t_1,...,t_j, then

    sum floor(t_i/2) <= floor((|A intersect C|-2)/2)
                     = floor(|A intersect C|/2)-1.

All other components retain their old bound. Again rho_{u,v}<=rho_empty-1, a contradiction. Consequently every component of Q-X contains at most one terminal.

An undeleted block node has all four of its terminal neighbors still present, since X has no terminals. It would therefore lie in a component containing at least four terminals. There can be no such node. Thus X consists of ALL b block nodes, and (2) gives

    rho_empty=b,       nu(B)=2b.                           (3)

Contrapositively, if rho_empty<b, some one- or two-spoke deletion necessarily lowers nu(B). A minimum Gallai barrier explicitly identifies a blocker. This includes the unsaturated ordinary-matching cases; no near-perfect matching assumption is involved.

## Why the decorated odd-cover construction cannot work

Every private K5 attached along a spoke contributes at most two triangles and can contribute two while avoiding its root. Thus

    nu(W)=nu(B)+2n.

If a set S of one or two original spokes lowers nu(B), the same S lowers nu(W): every W-S packing contains at most nu(B-S) old triangles and at most two triangles per attachment. Therefore W being two-edge resilient implies the two-spoke resilience used above, and hence nu(W)=2b+2n.

Every odd cover of B is the complement of a vertex cut, because its apex triangle equations determine each rim edge from its two endpoint spoke values. For each attached K5, either root state occurs in a minimum odd four-cover. Its four-unit cost cancels the selected root edge's contribution. Consequently

    pi(W)=4n + beta(R),

where beta(R) is the minimum number of uncut rim edges over all vertex bipartitions. There are exactly6b rim edges. A uniformly random bipartition gives

    beta(R)<=3b,
    pi(W)<=4n+3b<=4n+4b=2nu(W).                            (4)

The edge-cover-criticality claim follows from the already proved selective decoration lemma with induced core R: tau(R)=2b and every edge can belong to a minimum two-cover of its own K4. Criticality is not used in the obstruction proof.

Thus either W has an explicit one- or two-spoke blocker furnished by a Gallai barrier, or W satisfies the desired odd-cover inequality with room to spare. The entire proposed K4-incidence rim plus spoke-decoration route is closed, for arbitrary incidence density and arbitrary global cut frustration. This does not address general rims, non-K4 triangle components, different attachment operations, or the unresolved universal H-O2 gate.
