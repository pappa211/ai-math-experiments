> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Additional structure of a one-cycle cover in a minimum CS failure

Status: ordinary corollaries, corrected v2 frozen for fresh review. The v1 wording omitted the explicit isolate convention; isolated vertices are now discarded, as in the minimum-CS framework. The one-cycle-cover inequality is already proved separately; the remaining equality case is not resolved here.

Let G be a global or hereditary-class minimum combined-CS failure, with isolated vertices discarded and with the authenticated M0/codegree/robustness conclusions. Let C be any triangle edge cover having exactly one selected cycle Z.

## 1. A selected leaf forces the cycle to be induced in G

If C has a leaf v, the accepted leaf-cycle corollary says that v is adjacent to every vertex of Z and its sole selected neighbor lies outside Z. For any actual edge ab between cycle vertices, the triangle vab has neither spoke selected, so ab must belong to C. The only selected edges among cycle vertices are those of Z: a selected chord would create a second cycle. Hence

    G[V(Z)] = Z.

For a three-cycle this asserts the expected literal triangle. For larger cycles it excludes every chord in the full graph, not merely in the selected cover.

## 2. No vertex can have selected degree zero

Suppose x is incident with no selected edge. Since G has no isolated vertices, its link is nonempty: an incident edge has codegree at least two. Every rim edge of its link L=G[N_G(x)] belongs to C, since all triangles through x require their rim edge to be selected. Every vertex of L has degree at least two by the codegree conclusion. A subgraph of a graph with exactly one cycle can have minimum degree at least two only when it is exactly that cycle: trees cannot survive, and any attached finite tree would have a leaf. Therefore

    L=Z, and N_G(x)=V(Z).

A cycle of order three or four is excluded by closed-link robustness. A cycle of order at least five is an apex-forest link (delete any rim vertex), so the accepted self-contained apex-forest exclusions apply directly. Thus no such x exists.

Before this last exclusion, the intermediate description also shows that any two selected-degree-zero vertices would be independent twins, with common neighborhood exactly V(Z), and that the cycle would be induced in G. There is no assumption that vertices outside the selected support are triangle-free background: M0 removes such background edges in the minimum failure, and the link argument accounts for every actual incident edge.

## 3. Structural alternatives

Consequently every vertex of a minimum failure is incident with a selected edge of C. If C is connected and has no leaves, its selected graph is exactly a Hamiltonian cycle of G. Otherwise C has leaves (possibly in separate tree components), and Section1 forces its unique cycle to be induced in G. In the connected unicyclic case those leaves are independent in G by the accepted leaf-cycle corollary. In the disconnected case adjacency between leaves is confined to selected isolated K2 components.

These alternatives do not classify the remaining graph. In particular, an induced cycle together with attached selected trees can have unrestricted unselected edges subject to triangle coverage. No claim that every apex-unicyclic link is WKE is used: the five-vertex wheel (an apex joined to a four-cycle) is already a counterexample to that assertion. Its matching number is two and every set of three vertices induces a vertex of degree at least two, so deleting any matching leaves no independent triple and therefore no vertex cover of size two.

## Dependencies and role

- `notes/cover_leaf_cycle_corollary_v1.md`, SHA-256 `4e2dc4572615de4074508588bfc4d4290e448cb577f5aa6b844b9b14466874a5`, freshly accepted;
- the authenticated class-local closed-link codegree and robustness inputs;
- the self-contained perfect/nonperfect apex-forest link exclusions, applied to a cycle by deleting any rim vertex.

The exact inequality for all one-cycle covers is in `notes/one_cycle_cover_tuza_v1.md`. These additional restrictions address only a hypothetical non-B equality obstruction and supply no global cover-availability theorem. No computation is a premise.
