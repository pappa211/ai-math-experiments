> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Independent short-proof and formal-statement review

Reviewer: separate AI `review` agent; not the author of the credited manuscript or new Lean implementation. This is ordinary mathematical and statement-fidelity review. No compilation was performed by this reviewer for this pass, because the lead serializes all Lean builds on the resource-limited server.

Reviewed at UTC 2026-10-30T17:29:14.288263+00:00. Source hashes at this pass:

- `manuscript/SHORT_CREDITED_INEQUALITY_PROOF.md`: `4936336b55677dc63019938c1a868fbd858cac76308c75553ac292c12b3d0e2a`
- `manuscript/THEOREMS_AND_PROOFS_REVISED.md`: `c71b8563fb03fe8b8d0e0424c36ac2ca64019b22f8d9eee281d8adf7ed58a2d8`
- `lean/Tuza06/Statement.lean`: `e4267fd52afb33cf18f56cccdbd275188195574e67c82ed34665c13d3d2515a7`
- `sources/literature/puleo-source.tex`: `ed983d631ce520128a00a4b2145824acd0ac37de8a7e2143b8108f6564132c50`
- `sources/literature/botler-fernandes-gutierrez-source.tex`: `ec9bc94e6c9fc17db42de8472def07b14ff38997b22af29a5061acbff2cfd58f`

## Short credited inequality proof

Verdict: the short deduction is mathematically sound on the stated published inputs. It proves the inequality, and does not prove the equality characterization by itself. I checked the actual retained primary TeX sources rather than treating attribution text or an earlier review as a premise.

Puleo's Definition 2.1 exactly requires a nonempty vertex set, an edge-disjoint triangle set Y, an edge set X with |X|<=2|Y| hitting every triangle at that vertex set, and containment in X of all Y-edges whose endpoints are outside it. Lemma 2.2 then applies to G'=(G-X)-V0. The short proof's reduction accounting matches this definition, and permits balance rather than requiring strictness.

Puleo's Lemma 2.6 applies to a minimal counterexample to the inequality. Choosing a graph with all proper subgraphs satisfying the inequality is sufficient, and the hereditary 5-degenerate class provides that condition. Isolated vertices have already been discarded, which is needed when inferring minimum degree at least five from robustness. Lemma 2.7(a),(b) assumes robustness and no reducible set; it imposes no maximum-average-degree hypothesis. Its complement notation matters: for a degree-five link, complement maximum degree at most one means a matching, of size at most two, and the size-two possibility is excluded. Hence exactly K5 and K5 minus one edge remain. Part (b) excludes all adjacencies between vertices of degree at most six, yielding the required degree-at-least-seven neighbor restriction after the minimum-degree normalization. The main theorem's maximum-average-degree assumption is not being substituted for degeneracy.

The retained Botler–Fernandes–Gutierrez TeX states Lemma 3.3 for an irreducible robust graph with two vertices of degree at most six and neighborhood union of size at most seven. It concludes both degrees five, common neighborhood size three, and both links K5. For two distinct degree-five vertices with at least three common neighbors, the neighborhood union has size 10-|intersection|<=7; thus the short proof's specialized overlap assertion is justified. No treewidth assumption is present in this local lemma. Its enclosing treewidth theorem is not used as a degeneracy theorem.

The peeling counts are correct: u is chosen with at most five neighbors in G-L, has original degree at least six, hence has a low neighbor and original degree at least seven. The subsets A_v have size at least three and pairwise intersection at most one, by the overlap lemma and the four-subsets-of-five count when both links are cliques. Any pair of these subsets is necessarily two triples meeting in one point and exhausting the five-element A. A third triple would require at least three total incidences with their union while the intersection bounds allow at most two. Therefore there are exactly two low neighbors, u has degree seven, and the stated exact neighborhoods follow. The distinctness of p,q follows from the overlap lemma because the two links are near-cliques.

For a missing cross edge ce, M={vc,we,ab} is a matching in the link of u. Outside Q={a,b,d}, the link has only vc,we. The three triangles uvc,uwe,uab are edge-disjoint. X={vc,we,ab,ua,ub,ud} consists of six distinct actual edges and hits every triangle at u; it contains all noncentral edges of those three triangles. Thus {u} is reducible. No residual equality classification is needed for this inequality contradiction.

When all cross edges exist, the seven displayed triangles in B are mutually edge-disjoint. For U={u,v,w}, the fourteen edges E(A) union {uv,uw,vp,wq} hit every U-triangle, including all triangles involving the arbitrary outside graph because the neighborhoods of u,v,w are exact. Every selected triangle edge outside U is an A-edge. This is exactly a balanced seven/fourteen reducing tuple, so it contradicts irreducibility even without a thirteen-edge saving. The independent fixed-core checker also verifies this seven-packing, but the exhaustive arbitrary-outside-triangle coverage is established symbolically by the exact neighborhood descriptions.

The full manuscript correctly distinguishes this argument from a minimal failure of the combined statement. In the latter setting balanced reductions force residual equality; they do not directly contradict the obstruction. The additional block-avoidance, outside-page augmentation, and cover-saving arguments reviewed in ORDINARY_PROOF_REVIEW.md remain necessary in the submitted equality proof.

## Statement.lean fidelity

Verdict: the `CombinedStatement` proposition is faithful to the requested complete theorem. It is explicitly a definition of the destination rather than a proof of that destination.

The vertex type is arbitrary with Fintype and decidable equality; neither imposes an order bound or nonemptiness assumption. `Degenerate G 5` asks every nonempty finite vertex subset to contain a vertex with at most five neighbors in that induced subgraph. This is mathematically equivalent to every nonempty subgraph having a degree-at-most-five vertex: induced subgraphs are subgraphs, and an arbitrary subgraph has degrees no greater than the induced graph on its vertices. Original maximum degree is unrestricted. `degenerate_mono` proves edge-subgraph monotonicity directly.

`Tuza.triangles` is all graph three-cliques, not a chosen triangle subfamily. `Tuza.nu` is the actual maximum packing of vertex triples whose two-element edge sets are disjoint. `Tuza.tau` is the actual minimum edge-set cover size; `graph_min_cover` from the reused source proves a minimum cover can be chosen among actual graph edges. Thus allowing extraneous sets in the raw Covers definition does not change the graph optimum.

`TriangleAdjacent` uses shared edges via non-disjoint edge sets and explicitly requires both nodes to be graph triangles. `TriangleConnected` is its reflexive transitive closure. The base triangle is required to be in the graph by `ComponentCliques`; the component is filtered through the graph's full triangle family. A self-loop or reflexive path does not join unrelated triangles. Symmetry of shared-edge adjacency makes this the usual triangle edge-component relation, even though the reflexive transitive closure is used directly rather than a quotient.

The characterization is the literal equality `support (triangleComponent G t) = edges k` with k of cardinality four or five. This gives exact edge support K4/K5; it does not require vertex-disjoint blocks or cover ordinary connected components. Each edge of `edges k` is consequently an actual graph edge by equality with a triangle support. Empty and triangle-free graphs make the component condition vacuous, as required; no background triangle-free edges are excluded. Both directions of the equality biconditional are in the target.

`CliqueDecomposition` is separately introduced as an intermediate representation. Its documentation explicitly leaves equivalence to ComponentCliques as an obligation. No such equivalence is assumed in the target statement. Any future theorem transferring results through that representation must prove the equivalence before claiming the complete component characterization.

This review does not certify the global theorem: at this pass the exact target has been stated, and Transport/Blocks development remains partial. No acceptable axiom list for a conditional lemma can discharge its explicit or implicit mathematical hypotheses. A final pass must inspect exact final types, source hashes, and the transitive dependency closure of every claimed completed declaration.
