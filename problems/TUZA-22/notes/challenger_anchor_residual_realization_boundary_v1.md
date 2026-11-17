> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Extremal anchor residuals can realize every forest-cover triangle family

Status: ORDINARY_PROOF_CANDIDATE / exact guardrail; frozen for fresh review. Coordinator construction, challenger reconstruction, 2026-11-16 UTC. This rejects blanket residual-structure hypotheses, not the budget-relative anchored-cover target.

## 1. General realization

Let R be a connected finite graph with a spanning tree triangle-edge cover C_R. Choose ANY triangle-edge cover D of R disjoint from C_R. Such a D always exists: E(R) minus C_R meets every actual triangle because a tree cannot contain all three triangle edges.

For each e=uv in D, add a fresh vertex b_e adjacent to exactly u and v. Choose either endpoint u and define

    C = C_R union {u b_e : e in D}.

The new selected graph is a spanning tree: each fresh vertex is attached by one selected leaf edge. It covers every old triangle through C_R and each new triangle uvb_e through its selected leaf edge. Since the new vertices have degree two and distinct names, the actual new triangles are exactly those displayed; no crossing triangles are omitted.

Let P consist of all |D| new triangles uvb_e. Their bases are distinct D-edges, and their spokes have distinct fresh endpoints, so they are pairwise edge-disjoint. The set D covers every old triangle by assumption and every new triangle by its base. Thus

    nu(H)=tau(H)=|D|,

where H is the enlarged graph. Every member of P has exactly one selected C-edge, so p1=|D| and p2=0. In particular P is maximum and minimizes p2 among all maximum packings.

Its forced selected set is

    S=C intersect E(P)={u b_e : e in D}.

After deleting S, every b_e has degree one. Therefore H-S consists of the arbitrary original graph R plus pendant triangle-free background, and its actual triangle family is exactly that of R.

This proves that extremal anchor residuals have no automatic triangle-family structure beyond the original forest-cover class. Any connected graph admitting a forest triangle cover admits a spanning tree triangle cover as well: extend the selected forest to a spanning tree using graph edges, preserving the cover. Disconnected examples may be treated componentwise, or connected first by triangle-free bridges.

The construction never violates the anchored budget: tau(R)<=|D|=p1. It shows why further restrictions must compare residual complexity with p1, rather than excluding all odd holes, all non-Koenig residuals, or an arbitrary forest-cover triangle pattern without budget information.

## 2. A nine-vertex odd-hole residual at exact budget

Start with a five-wheel: hub h and rim vertices0,1,2,3,4, with cyclic rim edges01,12,23,34,40 and all five hub spokes. Add fresh vertices x,y,z with exactly these new pages:

    40x, h1y, h3z.

Take

    C_R={h0,h2,h4,01,23},
    D={40,h1,h3},
    C=C_R union {4x,1y,3z},
    P={40x,h1y,h3z}.

C_R is a spanning tree on the wheel's six vertices and meets every wheel triangle. D is a disjoint three-edge cover of the wheel: h1 covers the first two cyclic faces, h3 the next two, and40 the remaining face. The general construction therefore gives a nine-vertex graph H with tau(H)=nu(H)=3, maximum packing P, and p2=0,p1=3.

Deleting S={4x,1y,3z} leaves the wheel plus three pendant edges. The residual triangle intersection graph is the induced cycle C5. Its packing number is2. Its ordinary triangle-cover number is3: each edge meets at most two of the five wheel triangles, while the displayed D attains three. Hence

    nu(H-S)=2, tau(H-S)=3=p1.

This is an explicit counterexample to the claim that EVERY maximum/minimum-p2 anchor packing has a perfect triangle-intersection residual. It does not refute the existence of some better residual choice in the same graph, and it does not refute tau(H-S)<=p1.

## 3. Scope and next obligation

The earlier K4 residual control showed that perfect intersection graphs may still have non-edge-fiber cliques and ordinary triangle cover larger than packing. The present wheel control shows that even intersection-graph perfection itself can fail for an extremal packing. The general realization makes the broader obstruction explicit.

The live target remains budget-relative: find a suitable maximum/minimum-p2 packing, or some other packing, for which the forced selected edges admit a residual cover of size at most p1. The already proved residual packing bound nu(H-S)<=p1 and the p1<=1 anchored theorem remain correct and are not strengthened by this construction.

No computation, asymptotic theorem, or unspecified graph realization is used. Every new vertex has exactly its two declared neighbors, and both optimum certificates are explicit.
