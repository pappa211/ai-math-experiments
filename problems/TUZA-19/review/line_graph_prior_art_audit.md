# Bounded prior-art audit: odd triangle covers of line graphs

Audit completed 2026-11-15, under the original TUZA-19 clock. Scope is attribution and source definitions, not independent verification of the candidate proof. The coordinator's notes/root_line_graph_parity.md was read but not edited. All source storage is private; no author contact, publication, or remote computation occurred.

## Result

Neither an existing publication of ordinary Tuza for every line graph of a finite simple root, nor an existing publication of the stronger odd-cover inequality, was identified in this bounded search. **This is not evidence of novelty or of an open problem. Historical priority remains unresolved.**

There is a material classical antecedent that should be named: exact maximum-cut results for line graphs by Shiraishi (1998), and the polynomial-time line-graph maximum-cut algorithm by Guruswami (1999). The candidate's Eulerian/non-Eulerian coloring discussion lies in this existing area. However, the accessible Shiraishi publisher abstract has missing mathematical displays, and neither original full text was obtained. The exact formulas and proof overlap therefore remain to be checked; they must not be reported as inspected.

The familiar attribution of the triangle-free-root subclass to Tuza (1990) was found in later literature, but the original 1990 full text was unavailable. Its precise theorem, numbering, and simple-versus-multigraph convention remain unverified here. A later source's list of known subclasses does not prove that the unrestricted line-graph case was unpublished.

## Primary sources and exact reading limits

1. Zsolt Tuza, *A conjecture on triangles of graphs*, Graphs and Combinatorics 6 (1990), 373–380, DOI https://doi.org/10.1007/BF01787705. Primary publisher page: https://link.springer.com/article/10.1007/BF01787705. Read title, author, publication details and abstract, which describes results around ordinary edge packing/covering. The PDF endpoint redirected to the subscription preview. No theorem or definition from the article body was read. The publisher HTML is retained; the receipt records a cookie-related redirect parameter but no authentication or purchase was attempted.

2. Shuji Shiraishi, *On the Maximum Cut of Line Graphs*, Combinatorics, Probability and Computing 7(3) (1998), 335–337, DOI https://doi.org/10.1017/S096354839800337X. Primary page: https://www.cambridge.org/core/journals/combinatorics-probability-and-computing/article/abs/on-the-maximum-cut-of-line-graphs/0AB9083FA3CEDBD189291CFF8653E777. The abstract defines the maximum cut of L(G) and distinguishes Eulerian and non-Eulerian roots. Both mathematical displays are represented by the literal placeholder “formula here” in the accessible primary HTML, including its citation_abstract metadata. The citation_pdf_url supplied by the publisher was followed once and redirected to the abstract; no PDF was obtained. Consequently neither the exact displayed formulas, connectivity conventions, simple/multigraph scope, nor proof was inspected. Preserve this as a concrete attribution lead, not a checked theorem import.

3. Venkatesan Guruswami, *Maximum cut on line and total graphs*, Discrete Applied Mathematics 92(2–3) (1999), 217–221, DOI https://doi.org/10.1016/S0166-218X(99)00056-6. Publisher page: https://www.sciencedirect.com/science/article/pii/S0166218X99000566. The primary publisher abstract reports a polynomial-time maximum-cut algorithm on line graphs and hardness on total graphs. It does not state an odd-cover/triangle-packing bound. Full-text opening and direct local retrieval returned 403; the abstract was available in the indexed primary-page result. The author's publication list https://www.cs.cmu.edu/~venkatg/pubs/papers.html independently confirms the citation but provides no hyperlink on this entry. This is not an examination of the full proof.

4. Andrea Munaro, *Triangle Packings and Transversals of Some K4-Free Graphs*, Graphs and Combinatorics 34(4) (2018), 647–668, DOI https://doi.org/10.1007/s00373-018-1903-y. Accepted manuscript: https://pureadmin.qub.ac.uk/ws/portalfiles/portal/186487135/manuscript.pdf. The institutional metadata identifies the accepted-author version. The downloaded PDF has 23 pages including a repository cover, SHA256 3d42787fa5acc76c391348e1249a09fd5ef517972c2affefb84adea017a036e6. Printed page 5 explicitly restricts graphs to finite undirected simple graphs; printed page 6 distinguishes vertex and edge triangle transversals and packings. Printed pages 7–8 define ordinary line graphs and the triangle graph, and explain the triangle-free-root clique-cover/vertex-cover correspondence. Those statements do not imply ordinary Tuza for every line graph. Definitions and pertinent displayed statements were read in extracted text; printed pages 5,6,8 were also visually inspected. No completeness claim about the paper's entire bibliography is made.

5. Aparna Lakshmanan S, Csilla Bujtas and Zsolt Tuza, *Induced cycles in triangle graphs*, https://arxiv.org/pdf/1410.8807v3, v3 dated 18 October 2015. Relevant primary pages were already retained and inspected in evidence/triangle_graph_routes/. Theorem 18 concerns G whose triangle-intersection graph T(G) is perfect; this is a different class from all graphs G=L(H). Its known-class statement cannot be substituted for the requested line-graph theorem.

6. Andreae, Schughart and Tuza, *Clique-transversal sets of line graphs and complements of line graphs*, Discrete Mathematics 88(1) (1991), 11–20, DOI https://doi.org/10.1016/0012-365X(91)90055-7. Primary publisher abstract: https://www.sciencedirect.com/science/article/pii/0012365X91900557. It defines a vertex set meeting every maximal clique. Its weak coloring is a vertex coloring avoiding monochromatic maximal cliques. These are not edge sets meeting each actual triangle oddly, and this source was not found to settle the candidate. Only the primary abstract was inspected.

Later primary research on vertex triangle transversals in line graphs of subcubic triangle-free graphs was likewise excluded from the requested edge-packing statement. No result was imported merely because its title used both “line graphs” and “transversals.”

## Secondary lead retained without elevating it to a primary theorem check

Juan Gabriel Gutierrez Alva's thesis introduction, printed page 4, https://teses.usp.br/teses/disponiveis/45/45134/tde-10012020-200714/publico/Tese_JuanGabrielGutierrezAlva.pdf, attributes the triangle-free-root line-graph case to Tuza 1990. This was used solely to locate the original source. The original remains inaccessible in this audit. Neither this historical sentence nor the absence of a larger class in later introductions establishes that all line graphs were untreated.

## Comparison formula for later primary-text inspection

For a connected finite simple H, the candidate's Euler coloring implies the exact comparison target

    maxcut(L(H)) = sum_v floor(d_H(v)^2/4) - epsilon(H),

where epsilon(H)=1 if H has every degree even and an odd number of edges, and is zero otherwise. This formula is reconstructed from the candidate argument, **not transcribed from the inaccessible Shiraishi displays**. The local clique upper bound gives the sum. In the exceptional case, equality would require red degree d(v)/2 everywhere; its sum would be |E(H)|, odd, whereas the sum of red degrees is twice the number of red edges. At least one local unit must be lost. The Euler construction supplies exactly that loss. Disconnected graphs require summing the component defects.

Even a verified maximum-cut formula would not alone settle the candidate odd-cover inequality: it supplies a cover by monochromatic line-graph edges, while the triangle-packing comparison and the exceptional triangle-free-root construction still require their stated arguments. In the triangle-free Eulerian odd-edge case, an odd triangle cover may be smaller than a cut complement; C5 as root already separates these notions because L(C5) has no triangles.

## Multigraph scope warning for attribution

The frozen candidate explicitly assumes a simple root H. Its decomposition of E(L(H)) into edge-disjoint star-cliques uses this assumption: two parallel root edges have two common endpoints. Accordingly, a source allowing multigraph roots must be compared under its exact line-graph convention. For example, three parallel edges between two vertices have ordinary simple line graph K3; summing the two vertex star-clique contributions counts the same line-graph edges twice. No extension to multigraph roots, and no claim about the older papers' conventions, is inferred from their abstracts.

## Search and stop rule

The bounded search used combinations of Tuza/triangle packing/triangle covering with line graph(s), odd cover, odd transversal, parity, cut, Euler, and multigraph, and exact-title searches for Tuza1990, Shiraishi1998 and Guruswami1999. Publisher, institutional and author-hosted sources were preferred. An author-hosted spectral paper surfaced from “maximum cut” keywords but did not contain the needed Shiraishi/Guruswami result and was not used as evidence. No broad literature census, paid access, external contact, or inferred novelty claim was attempted.

Recommended private description: “A self-contained odd-cover theorem for line graphs was reconstructed and reviewed in TUZA-19. Its historical status is unresolved. The Euler coloring/max-cut component has clear classical antecedents; the unrestricted odd-cover/packing statement requires a focused later attribution check with the original full texts.”

Stored retrieval receipts, primary HTML and the accepted manuscript are under sources/line_graph_prior_art/. This audit does not change the independent mathematical-review status of notes/root_line_graph_parity.md.
