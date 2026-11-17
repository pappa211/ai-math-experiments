> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Small-order density bridge: literature scope rejection

Date: 2026-11-15 UTC. Status: SOURCE_SCOPE_BOUNDARY, not a packing theorem.

The proposed bridge needs: if nu(G)<=4 and |V(G)|<=12, then mad(G)<7. One possible sufficient input would guarantee five edge-disjoint triangles in every n-vertex graph with floor(n^2/4)+5 edges for 8<=n<=12. Indeed ceil(7n/2)>=floor(n^2/4)+5 on those five orders. No such input is accepted here.

Balogh and Wigal, *Packing edge disjoint cliques in graphs*, Combinatorica 45:56 (2025), section4, cites Gyori's small-surplus exact result with odd/even linear bounds. Primary source: https://link.springer.com/article/10.1007/s00493-025-00184-w . Its compressed statement omits a size qualification present in the original source.

Gyori, *Edge Disjoint Cliques in Graphs*, Colloquia Mathematica Societatis Janos Bolyai60 (1992), pp357-363, Theorem9 on printed p361, explicitly imposes sufficiently large n. The stated bounds are m<=2n-10 for odd n and m<=1.5n-5 for even n. Remark2 corrects the odd-order bound in the 1988 predecessor. Primary scanned source, opened and text inspected: https://korandi.org/docs/misc/setsgraphsnumbers/setsgraphsnumbers22.pdf . Therefore this theorem does not establish the proposed orders8 through12.

The missing qualification is substantive. K6 minus two adjacent edges has13= floor(6^2/4)+4 edges and four odd-degree vertices. Four edge-disjoint triangles would leave one edge, but deleting triangles preserves degree parity and a one-edge graph has only two odd vertices. Likewise, K4,4 with a K4 added inside one part and one edge inside the other has23= floor(8^2/4)+7 edges and six odd vertices. Seven edge-disjoint triangles would leave two edges, which cannot have six odd vertices. These examples disprove a literal all-order interpretation of the quoted even endpoint. They do not disprove the desired surplus-five bridge.

The K4-free surplus theorem of Gyori-Keszegh has a different hypothesis and cannot replace this input for arbitrary graphs. Asymptotic decompositions likewise do not certify these small orders. A separate ordinary proof, an applicable exact historical theorem, or a fully scoped finite verification remains needed.
