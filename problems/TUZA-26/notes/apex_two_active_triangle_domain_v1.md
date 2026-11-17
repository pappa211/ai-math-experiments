> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two active triangle residuals: all terminals are internal

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-16. Independent review required. This is a bounded supporting step for the defect-two triangle-residual frontier, not a complete exclusion of two active components.

## Exact modular setting

Let Q be finite simple, triangle-supported and connected through edge-sharing triangles. Let T=abc be an actual triangle and put J=Q-E(T). Suppose the complete triangle support of J consists of exactly two edge-disjoint connected supports C1,C2 from the frozen C12 family, with arbitrary retained background. Put r_i=nu(C_i) and r=r_1+r_2. Assume

    nu(Q)=r+1, tau(Q)=2r+1,
    nu(Q-D)=nu(Q) for every edge set D of size at most two.

Thus J has defect two, with tau(J)=2r-2, and restoration costs exactly one packing unit and three cover edges. Assume also the already supplied minimum-Q paid constraints: minimum support degree at least four; no literal K4/K5 with complete outside-triangle boundary of size at most two; and no genuine fresh K5 triangle leaf. Proper-subgraph CS is used only in the one-boundary payment lemma below, on an explicitly retained actual subgraph of Q.

Then EVERY T vertex lies in V(C1) union V(C2). Consequently every Q support vertex lies in this same union, and |V(Q)|<=26. The two C supports may share an independent vertex set of size up to three; no fresh-gluing assumption is made. The remaining all-inside interface is OPEN and has not been enumerated.

In the conditional minimum Q, these hypotheses arise only when J is resilient with two defect-one components. Tight components have already been excluded by the complete small-boundary lemma. The separate Q minimum names each active component. This note neither proves that this residual branch occurs nor classifies a connected defect-two component.

## Named facts and actual-background confinement

The following already reviewed facts concern exactly frozen C12. Each support has a universal vertex, is single-edge packing-resilient, and has independence number at most three. Every fresh edge-glued model has a literal leaf K4/K5 whose complete boundary INSIDE that model is a single attachment edge. W5 and K5-e are the two remaining models; all their edges are cover-eligible.

If u,v are nonadjacent vertices of a named C, then restoring uv increases nu(C) unless C=K5-e and uv is its unique missing edge. For the ten fresh models, append a uv-page at a universal vertex to a maximum packing avoiding its independent two-spoke star (archived independent-star avoidance). For W5, a rim chord 02 admits the three triangles 012,h23,h40. K5-e completes to K5 with unchanged packing two. These are full internal graph responses, not a claim that an arbitrary prescribed page appends in W5.

Each C_i is induced on its vertex set in J: an extra J edge between its vertices would make an old triangle through a universal vertex and join its triangle component. Therefore V(C1) intersection V(C2) is independent in both supports. In particular, if it contains the two nonadjacent peripheral vertices of a K5-e, it contains no third vertex.

Every actual J background edge must become triangular through T restoration, because Q is triangle-supported. Every new triangle is T or an ordinary page on one T base; a triangle cannot contain exactly two edges of T. A vertex outside V(C1) union V(C2) union V(T) is an apex of such pages and has neighbors only in V(T). It has degree at most three, contrary to the minimum-degree premise. Hence

    V(Q) is contained in V(C1) union V(C2) union V(T).

Also every T base has an ordinary page: after deleting the other two T edges, Q still has packing r+1, whereas J has packing r.

## A paid lemma for a named one-edge boundary

Let C be an actual connected defect-one triangle-support region in Q, with nu(C)=s and tau(C)=2s-1. Suppose its COMPLETE outside-triangle boundary is a single edge f, C has a maximum packing avoiding f, and f is in a minimum C cover. Delete all C edges except f, retaining all other vertices/edges, to obtain K.

All K triangles are precisely the Q triangles outside C. No C triangle survives on one retained edge; every outside triangle uses at most that edge from C. Packing therefore satisfies

    nu(Q)=s+nu(K),

by partitioning and by appending an f-avoiding C maximum. The union of a C cover and a K cover gives tau(Q)<=tau(C)+tau(K). Since Q has defect one, this implies tau(K)>=2nu(K). Proper-subgraph CS forces equality and B(K). The boundary definition ensures f is triangle-supported in K. Every tight B edge is cover-eligible, so choose minimum C and K covers BOTH containing f. Their union saves one edge and gives

    tau(Q)<=tau(C)+tau(K)-1=2nu(Q)-2,

contradiction. This is a complete actual-region payment: the retained boundary is f, background/shared vertices remain literal, and proper CS is applied only to the actual edge deletion K. No naming or replacement graph is needed.

As a consequence, no entire named C12 component of a triangle residual can have just one outside-used edge in Q. For W5/K5-e apply this paid lemma using single-edge resilience and eligibility. For a fresh model, any literal leaf clique has outside boundary contained in its one old attachment edge together with the one edge through which Q leaves the whole model; that is at most two and is already forbidden. Boundary zero is incompatible with Q's triangle connectivity when another active component exists.

## At least two T vertices are in the old support union

Suppose first that at least two T vertices, say b,c, are outside the old support union. Every bc-page is bare: both old spokes are background. Every ab- or ac-page has at most one old supported spoke, the one from a to its apex. If a is also outside, those pages are bare too.

A bc-page with apex x and an ab- or ac-page with a different apex y are edge-disjoint. Combine them with independent maximum C1,C2 packings avoiding the at most one supported spoke; resilience permits this. The result has r+2 triangles, contradiction.

Fix a bc-page. The nonempty other two base families must therefore have its same apex x. Comparing back shows every bc-page also has apex x. Thus the COMPLETE new family is the K4 on {a,b,c,x}. It can meet old triangle support through at most the one edge ax, belonging to at most one old component. It cannot join both C1 and C2 into Q's connected triangle family. Contradiction. Hence at most one T vertex is outside.

## Excluding one outside terminal

Suppose c is outside V(C1) union V(C2), while a,b are inside. Every c-neighbor other than a,b is an old page apex in the support union, by the confinement above. Its old c-spoke is background.

### a,b have no common active component

Then a lies only in C1 and b only in C2, after relabeling. An ac-page at x has at most one supported spoke, in C1; a bc-page at y has at most one, in C2. If x differs from y, the two pages append over maximum old packings avoiding their separate single spokes and give r+2. Consequently both entire nonempty page families have one common singleton apex x.

Every old c-edge must belong to one of these ac/bc pages, because those are the only new triangles using c apart from T. Thus N_Q(c)={a,b,x}, contradicting degree at least four. Therefore a,b share an active component, say C1.

### Only one of a,b also belongs to C2

At least one must: otherwise no new triangle can contain any C2 edge, so Q cannot connect its two old triangle components. Relabel so that a belongs to C2 but b does not.

Any new page meeting a C2 edge has that edge of the form ay, and is an ab- or ac-page at y. Its other old spoke is background, since b,c are outside C2. Moreover y is not in C1: otherwise a,y would be shared vertices with a shared old edge ay, impossible. A bc-page at x has at most one supported spoke, in C1. If x differs from y, these two pages are edge-disjoint and append over independent old packings avoiding one edge in each component, giving r+2.

It follows that every C2-attaching page has the same apex x as EVERY bc-page. The COMPLETE outside-triangle boundary of C2 in Q is therefore the single edge ax. It is nonempty by triangle connectivity. The paid one-boundary conclusion above excludes this. This argument does not assume that C1 and C2 share only a; all other shared vertices are retained and cannot change the complete edge boundary.

### Both a,b belong to both active components

The pair a,b is nonadjacent in J. An ac-page exists and has apex x in the old support union. Its spoke cx is background; its spoke ax belongs to exactly one old component. Indeed a belongs to both C_i, so if x lies in C_i and ax exists, inducedness puts ax in C_i; an actual shared edge would merge the components.

If both C_i differ from K5-e, each admits a packing augmentation after inserting ab. Choose the augmentation in the component OTHER than the one containing ax, keep a maximum packing avoiding ax in the latter, and append the ac-page. The resulting packing has r+2 triangles: the augmented component uses only its own old edges and ab, while the page uses ac,ax,cx. Contradiction.

If exactly one component, say C2, is K5-e, its missing pair must be a,b. The other component admits the ab augmentation. Therefore every ac- or bc-page must have its supported spoke in C1, since a page with its spoke in C2 would append to that C1 augmentation and a C2 packing avoiding the spoke. In particular c has no old neighbor among C2's three nonperipheral vertices.

The intersection of C2 with C1 is exactly {a,b}, by independence and the K5-e structure. Its three other vertices have no old supported edges outside C2. Nor can they have old background edges outside it: in Q such an edge must occur in a new page, and the only external terminal is c, whose incidence to these vertices was just excluded. Restoring ab turns C2 into a literal K5 with all three other vertices having no outside neighbors. Choose any two of them; they form a genuine fresh K5 triangle leaf, forbidden by hypothesis.

Finally, if both components are K5-e, their intersection is exactly {a,b}. After restoring only ab, every new page has its apex in the old support union and merely completes one of these two K5-e supports to K5. No other apex exists: c cannot be an ab-page apex because ac,bc are still absent, and all nonterminal outside apices were excluded by degree. The intermediate graph's triangle support is exactly two K5s sharing ab. Its packing number is four, equal to r, rather than r+1: the upper bound partitions between the two clique families, and the lower bound chooses maximum clique packings avoiding ab. This contradicts two-edge resilience of Q after deleting ac,bc.

All one-outside cases fail. Hence every T terminal and every Q support vertex lies in the old support union, as claimed.

## A further internal constraint, not a completed internal classification

For the remaining all-inside case, call a T base internally augmentable in C_i if both endpoints belong to C_i and C_i is not K5-e. Two DISTINCT bases cannot be internally augmentable in different components: take the respective augmented packings; their old edges are disjoint and their restored bases differ, so their union has r+2 triangles.

In particular, if neither C_i is K5-e, at most one component can contain two or more T terminals. Otherwise its terminal pair bases differ, or one component contains all three and supplies a base different from the other's pair. Since all three terminals lie in their union, the remaining membership patterns have one component containing two or three terminals and the other containing just one. This is a concrete restriction on actual internal interfaces. It does not yet control all cross-component/background pages or give a cover/packing contradiction.

A useful next local obligation is the complete marked-star response when one base endpoint lies in C_i and the other outside. Its page apices in C_i form an independent subset of that endpoint's neighborhood: two adjacent apices and the old spokes from the outside endpoint would create an old triangle and bring that endpoint into C_i. Thus the whole supplied star has size at most three. A small marked-boundary calculation may be meaningful AFTER this ordinary domain is reviewed, but no such calculation or amalgam census is claimed here.

## Scope and dependency chain

This proof uses only the stated exact triangle-restoration profile, two-edge resilience, the frozen named facts, complete paid boundary constraints, and actual proper-subgraph CS at the one-boundary deletion. It does not use the coordinator's separate single-deletion connected-defect-two theorem and is therefore not circular with it.

The earlier apex triangle-plus-edge B exclusion is independently accepted in reviews/opening_triangle_edge_B_review.md. It establishes resilience of defect-one triangle residuals, but it does not imply the present two-active defect-two branch has been excluded. The entire all-inside two-active case remains OPEN, as do a single connected resilient defect-two residual and the critical defect-two frontier. No unrestricted Tuza conclusion or C12 enlargement follows.

No numerical search was run for this step. The at-most26-vertex universe is an all-size consequence for this specific branch, not permission for a large amalgam census. A complete domain would need to retain every independent vertex identification, all actual old cross-triangle constraints, and every permitted background edge before any finite exclusion could be asserted.
