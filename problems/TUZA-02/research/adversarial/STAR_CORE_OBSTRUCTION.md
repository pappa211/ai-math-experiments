> Curated source from TUZA-02/adversarial/STAR_CORE_OBSTRUCTION.md. Original SHA-256: `bec98cc819ab5e71ee966fed970475ca3950334c8b0c5e942defd117c64c55a8`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Packing-edge-stable slack-one cores beyond the smallest examples


For r∈{1,2,3}, start with the central K4 on vertices a,b,c,d. For i=1,...,r attach a K4 along one of the distinct star edges ab,ac,ad, using two fresh vertices xi,yi for each attached K4. Add no other edges. Denote this graph Rr. Its order is 4+2r.

**Proposition.** Rr is four-colorable, has

`nu(Rr)=r+1`, `tau(Rr)=2r+1=2nu(Rr)-1`,

and deleting any one edge leaves its packing number unchanged. Its full triangle hypergraph has one component under edge-intersection. For r=2,3 this component is larger than W5, K5 minus an edge, or two K4s sharing one edge.

**Proof.** Every triangle is a face of one of the r+1 specified K4s. Their triangle families are disjoint, although neighboring blocks share one graph edge. At most one face from each K4 belongs to a packing, so nu≤r+1. The central face bcd, together with one face a xi yi from every leaf, forms a packing of r+1.

For covering, let A be the r shared star edges. A cover must include an edge of the central face bcd, and for each leaf block must include two of its edges. If its shared edge is included, it needs at least one further edge exclusive to that leaf; otherwise it needs at least two exclusive edges. Thus every cover has size at least 2r+1: counting the r leaf contributions, the shared-edge selections cancel their one-unit savings, while the edge of bcd is additional. Conversely select all r shared edges, one opposite private edge xi yi in each leaf, and an edge of bcd chosen to meet any central face not already covered (for r=1 use the central edge opposite the shared edge; for r=2,3 choose the edge between the two leaves not both covered as appropriate). This gives 2r+1. More directly: for r=1 choose ab,cd,x1y1; for r=2 choose ab,ac,bc,x1y1,x2y2; for r=3 choose ab,ac,ad,bc and all three xi yi.

For edge stability, if the deleted edge is central, choose a central face avoiding it and choose each leaf face avoiding its shared edge. If the deleted edge lies in one leaf, then choose that leaf's face avoiding the deleted edge. If it uses its shared edge, choose a central face avoiding that shared edge; every other leaf face can avoid its shared edge. These choices are pairwise edge-disjoint and have size r+1. Each K4 extends a proper four-coloring of its shared edge, so Rr is four-colorable. ∎

## Focused exact restoration tests

`star_core_search.py` independently computes packing and cover optima and tests all pairs of independent triples already present in Rr, restricted to pairs with at most one common vertex and with both individual restoration families requiring three cover edges.

- r=1: no independent triple in the six-vertex core.
- r=2: four independent triples; two admissible pairs with both tau(Fi)=3; both restoration packing increments equal three.
- r=3: twenty independent triples, twelve with tau(Fi)=3; fifty-four admissible pairs with both tau(Fi)=3; every restoration packing increment equals three.

This is a finite test on the specified cores only. It does not cover arbitrary triangle-free attachments, arbitrary added vertices, or all near-equality graphs. The exact data and four-color/rainbow witnesses are in `star_core_results.json`.
