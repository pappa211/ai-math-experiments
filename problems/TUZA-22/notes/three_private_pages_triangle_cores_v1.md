> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three private pages per disjoint triangle core give strictness

Status: ORDINARY_PROOF_CANDIDATE; frozen for fresh independent review. This is a supplied-configuration compatibility theorem. It makes no minimum-cover availability claim.

## Statement

Let T1,...,Tt be pairwise VERTEX-DISJOINT actual triangles in a finite simple graph G. For each i suppose there are three pairwise edge-disjoint pages, one on each of the three edges of Ti, with apices outside V(Ti). The apices may belong to other core triangles or may be shared across different cores. Then, for t>0,

    nu(G) > 3t/2.

Every selected page is private relative to C0=the union of the core triangle edge sets. No privacy relative to a larger unspecified cover is asserted. In particular, if C0 is a triangle cover (whether minimum or not), then tau(G)<=3t<2nu(G).

The three local apices are necessarily distinct: two different edges of a triangle meet, so their pages at a common apex would share a spoke. Conversely, one page per base and three distinct apices give a local edge-disjoint triple.

## Exact conflict geometry

Form a graph J on the core indices, joining i,j precisely when one of the three chosen pages at i shares an edge with one at j.

A base edge at one core cannot equal a base edge or a spoke from another core: core vertex sets are disjoint. A shared edge between pages at distinct cores must therefore be a shared spoke. This occurs only reciprocally: the apex of the first page belongs to the second core, and the apex of the second belongs to the first core. A given page can thus conflict only with pages at the ONE other core containing its apex, if any. Since each core has three pages, J has maximum degree at most3.

A core's own triangle shares no edge with any page based at another core. This remains true when that page's apex lies in the core: its spokes have one endpoint in each of two distinct cores. Thus internal core triangles can always be used at cores where no local pages are selected.

For any independent set I of J, take all three pages at cores in I and the internal triangle at every other core. The exact conflict list proves this is an actual packing of size

    t + 2|I|.                                                (1)

Configurations belonging to distinct connected components of J can be combined, because there is no cross-component page conflict and internal triangles never introduce one.

## An elementary independence bound

Every graph of maximum degree3 has an independent set of size at least n/4, by greedily selecting a vertex and deleting its closed neighborhood of size at most4.

If a connected such graph H is not K4, then in fact alpha(H)>n/4. If H has a vertex of degree at most2, select it and apply the greedy bound to the remaining at least n-3 vertices:

    alpha(H) >= 1+(n-3)/4 > n/4.

Otherwise H is cubic. If every vertex has a clique neighborhood, any vertex and its three neighbors form an entire K4 component, contrary to the hypothesis. Hence some vertex has two nonadjacent neighbors u,w. Their closed neighborhoods each have size4 and share that vertex, so their union has size at most7. Select u,w and apply the greedy bound outside that union:

    alpha(H) >= 2+(n-7)/4 > n/4.

This proves the needed strict inequality without invoking Brooks's theorem.

By (1), every connected component H of J other than K4 supplies a packing of more than3|V(H)|/2 triangles within its core/page configuration.

## The K4 interaction component

Suppose four core indices form a K4 component of J. Each has three distinct neighbors and only three pages. Therefore exactly one page at each core has its apex in each neighboring core. For each of the six core pairs there is exactly one possible conflicting page pair, and it really conflicts by definition of J. Every page belongs to exactly one such pair. Thus the twelve pages have a conflict graph consisting of six disjoint edges.

Choose one core i to receive no selected pages. For each of its three incident core pairs, select the page at the other endpoint. For each of the other three core pairs, select either of its two pages. This selects six distinct mutually edge-disjoint pages: exactly one from each conflicting pair. Add the internal triangle Ti. It conflicts with none of the six pages, since none is based at i. We have obtained seven triangles, strictly more than3*4/2=6.

Combining this construction on K4 components with the independent-core construction on every other component proves the stated strict inequality. QED.

## Scope and proposed role

The argument permits arbitrary edges and actual triangles elsewhere in G; those cannot invalidate the exhibited packing. It does not use a closed induced graph, a bounded number of cores, minimum-cover optimality, or an abstract hypergraph substituted for actual page intersections.

The minimum-cover normalization route can sometimes supply three private pages on literal triangle cover components. This lemma resolves compatibility when ALL relevant cover components are such cores and carry the supplied triples. A normalization that creates other cover components cannot simply discard them or apply this result to claim the full graph is covered. Mixed two-page/three-page configurations and larger cover components remain separate obligations. This result does not establish unrestricted Tuza or CS.
