> Curated source from TUZA-02/adversarial/FULL_FAMILY_DEFINITION_COUNTEREXAMPLE.md. Original SHA-256: `a63e40379124fca46e5c5caf8085ce82e22ca85c410e5f94610f2fc3f069ee3c`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# A six-vertex warning about the restoration-family definition

Let G consist of a K5 on vertices 0,1,2,3,4, together with edges 15 and 35. Choose the bowtie T1=012, T2=034.

After deleting the six bowtie edges, H has edges
`13,14,15,23,24,35` and exactly one triangle, 135. Thus nu(H)=tau(H)=1, delta(H)=1, and its triangle hypergraph is 3-partite. A packing of G consists of 034,124,135. Since only one triangle lies outside the K5, and K5 packs at most two triangles, nu(G)=3=nu(H)+2.

If a family is defined as **all triangles of G meeting E(Ti)**, each such family has tau=3 and nu=2: relative to T1 its two full apices are 3 and 4, and relative to T2 its two full apices are 1 and 2. Each is exactly a triangular base plus the six pages of K3,2. This disproves the individual-family assertion under the full-G definition, even in the bowtie case with G-S bipartite (G-S has only vertex 5).

It does **not** disprove the intended lemma. Under the intended definition Fi=triangles(H+E(Ti)) minus triangles(H), mixed triangles are excluded. Then F1={012,123,124} is covered by edge12, and F2={034,134,234} is covered by edge34. Both intended tau(Fi) values equal one.

The full new family is precisely the ten triangles of the K5, so tau(F)=4 rather than six. In fact tau(G)=4, witnessed by {01,03,24,13}; the K5 subgraph supplies the lower bound four. Thus the full restoration theorem holds comfortably in this example.

The first record of `n6_bowtie.jsonl` gives the graph, triangle lists, exact packing and cover certificates, and a rainbow witness for H. This example is a definition diagnostic, not a discovery counterexample to the user's proposed sufficient lemma as recovered from the prior discussion.
