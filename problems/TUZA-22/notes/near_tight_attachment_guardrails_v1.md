> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Defect-one attachment guardrails

Status: ordinary proof candidate. This note distinguishes an unbounded family with a packing-critical edge from larger edge-resilient examples. It does not assert a bounded classification of all connected defect-one graphs.

Write delta(X)=2nu(X)-tau(X). An edge is cover-eligible if it belongs to at least one minimum triangle cover.

## 1. Exact fresh-clique edge gluing

Let F be any graph with an edge uv. Attach a fresh K_s, s in {4,5}, along uv: its other s-2 vertices are new, with no neighbors outside this clique. Thus every actual triangle belongs to F or the new clique, and the supports intersect exactly in uv. Put r=nu(K_s), so r=1 or2 and tau(K_s)=2r.

Then

    nu(F')=nu(F)+r.

The upper bound partitions any packing by the two triangle families. For the lower bound, append a maximum new-clique packing avoiding uv to any F maximum packing.

The exact cover equation is

    tau(F')=tau(F)+2r-1  if uv is cover-eligible in F;
    tau(F')=tau(F)+2r    otherwise.

If a cover contains uv, its restriction to each side is a cover and their sizes add minus one. If it omits uv, the two cover restrictions have disjoint edge sets and add without a saving. A minimum clique cover exists both through uv and without uv. If uv is not cover-eligible, a smallest F cover through uv has size tau(F)+1, obtained by adjoining uv to any minimum cover. These observations give both bounds and the displayed equality.

If every edge deletion of F preserves nu(F), the same is true of F'. For an old edge f different from uv, apply the packing formula to F-f. For f=uv, the residual graphs have disjoint edge supports and the new K_s-uv still packs r triangles. For a new edge f, choose a maximum F packing avoiding uv; append a maximum new K_s packing avoiding f. These are disjoint even if that clique packing uses uv.

A gluing that leaves delta unchanged must use a cover-ineligible edge. Such a gluing introduces NO new cover-ineligible edges and does not make any formerly eligible old edge ineligible. Indeed, any minimum F cover omits uv; combining it with any minimum clique cover uses exactly tau(F)+2r edges, which is optimal. Each new edge can occur in a minimum clique cover, and every formerly eligible old edge occurs in an appropriate minimum F cover. The glued edge uv itself becomes eligible. Thus this operation consumes at least one old ineligible edge.

## 2. Larger connected, edge-resilient defect-one examples

Start with two K4s on {a,b,x,y} and {a,b,u,v}, sharing precisely ab. There are no other edges. Their packing number is two and cover number three. Their unique minimum cover is {ab,xy,uv}: a size-three cover must share ab between two minimum K4 covers, and each minimum K4 cover through ab is its opposite pair. Consequently all eight other edges are cover-ineligible.

The graph is packing-edge-resilient. Delete the common edge: each remaining diamond has a triangle and the two supports are disjoint. Delete any other edge: take a triangle of its K4 avoiding that edge and a triangle of the other K4 avoiding ab. These give a two-packing.

Attach a fresh K4 along ax. The preceding formulas give a connected shared-edge triangle support with

    nu=3, tau=5, delta=1,

and every single-edge deletion preserves nu. Replacing this attached K4 by a K5 gives nu=4,tau=7 with the same properties. These are legitimate near-tight connected residual models, not CS counterexamples.

These examples do NOT justify an unbounded family by blind iteration. Each subsequent defect-preserving clique attachment consumes old cover-ineligible edges and creates none.

## 3. A bounded statement for the exact iterated edge-gluing class

Consider graphs constructed from ONE K4 or K5 by finitely many fresh K4/K5 edge gluings of Section1, with no additional edges or identifications. If the resulting graph has delta=1, then its packing number is at most18.

The initial clique has delta0 and all edges are eligible, so the first gluing necessarily raises delta to1. Every later gluing must preserve delta, because each gluing changes delta by zero or one. Immediately after the first gluing, a K4 side has precisely four ineligible spokes and a K5 side has none: through any prescribed edge of K5 there is a minimum cover containing any second prescribed edge (put adjacent edges into the three-part, or disjoint edges into the two-part and three-part, respectively).

If the first two blocks are both K4, their packing sum is2 and there are eight ineligible edges, permitting at most eight subsequent neutral gluings. Each adds at most2 to nu, so nu<=18. For K4+K5 the corresponding bound is3+2*4=11. For K5+K5 there are no ineligible edges and nu=4. These give the stated uniform bound. It is deliberately a crude upper bound, not an asserted attained maximum.

This conclusion is only for the literal fresh edge-gluing construction. It is not a bound for arbitrary triangle-connected defect-one graphs, for general clique-sums with additional incidences, or for residuals with unrestricted background edges.

## 4. An unbounded family excluded by packing-edge resilience

For arbitrary m>=1, take vertices a,b,z and m fresh triples x_i,y_i,w_i. Include the m K4s on {a,x_i,y_i,w_i}, the edge ab, the page edges b x_i for all i, and az,bz. Include no other edges. The actual triangles are exactly the K4 triangles and the pages abx_i,abz. In particular all triangle supports are in one shared-edge component: each page abx_i links its K4 to the common book base ab.

Every packing has at most one book page and at most one triangle from each K4, so nu<=m+1. Use the bare page abz and one triangle from each K4 to attain equality. The cover consisting of ab and minimum covers of the m K4s has size2m+1. Conversely the K4 supports require at least2m distinct selected edges, and the bare triangle abz has none of those edges, requiring another one. Thus

    nu=m+1, tau=2m+1, delta=1.

Deleting ab leaves exactly the m K4 triangle components, hence lowers nu to m. The base ab is packing-critical. Therefore this unbounded near-tight family is excluded from every minimum-CS triangle residual by `triangle_and_edge_restoration_v1.md`.

Dependencies: elementary clique packing/cover facts and literal all-triangle audits in the constructions. No external theorem or computation is used.
