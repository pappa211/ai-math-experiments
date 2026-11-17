> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Interacting private-deficient noncone family

Status: ordinary proof proposed for independent review, plus a literal certificate to be checked. This is a scoped theorem and successful extension mechanism, not a counterexample to any D variant or a global Tuza advance.

## Literal graph and accepted source input

Take two copies G1,G2 of the TUZA-21 Clebsch cone. Identify the endpoints and edge of one rim edge e, and make no other identifications or added edges. The apices remain distinct. The resulting graph G has32 vertices,111 edges and80 actual triangles. Every triangle is wholly in one piece: vertices exclusive to different pieces have no edge between them, and the intersection is the two endpoints of e. Each cone's triangle adjacency graph is connected (its triangles correspond to edges of the connected Clebsch link, and shared spokes implement line-graph adjacency); the two families share the rim edge e. Hence the full triangle family has one shared-edge component. It has no common vertex, and in particular no common apex. This is an interacting edge amalgamation, not a vertex sum of independent triangle components.

Declared input: TUZA-21 PROOFS_AND_OBSTRUCTIONS.md Section1, already copied in sources/tuza21. For the Clebsch link L: |V|=16, alpha=5; every independent five-set is N(v); every vertex outside such a set has at least two neighbors in it. Every minimum triangle cover of the cone is precisely the eleven spokes outside N(v), with16 choices. Every associated private family has packing number5. These facts have ordinary proofs in the accepted source; we do not rerun its census or relabel it as new.

## Exact ordinary and private optima

**tau(G)=22, and all minimum covers.** For any triangle cover D of G, its restrictions Di to Gi are covers. If e is absent from D, |D|=|D1|+|D2|>=22. If e is present, each Di includes a rim edge and therefore is not one of the source-classified minimum covers. Thus |Di|>=12 and |D|=|D1|+|D2|-1>=23. Two eleven-spoke covers combine to a22-edge cover. Therefore every minimum cover excludes e and restricts to a minimum cover in each piece. The256 pairs are distinct and exhaust every minimum cover.

Fix any such cover C, and write Ii=N(vi) for its omitted-spoke set in piece i. Private triangles in each piece correspond exactly to the bipartite cut (Ii,V(Li) minus Ii), and every private packing in that piece has size at most5 because every private triangle uses one of the five Ii spokes.

**Avoiding one prescribed rim edge.** This bipartite graph has degree5 at each of its five I vertices. After deleting one edge, every I vertex has degree at least4. Every nonempty subset of I of size at most4 has at least4 neighbors, hence satisfies Hall. The full set I originally has all11 outside vertices as neighbors: its center v has five neighbors in I and every other outside vertex has two. Deleting one edge leaves at least10 neighbors, again satisfying Hall. Hence there is a matching saturating I that avoids any prescribed rim edge. This use of Hall is a short ordinary matching theorem, not an optimization oracle.

Choose a private five-packing in each piece avoiding e. They combine, so nu(F_C)=10 for every one of the256 minimum covers. Since |C|=22>20, every minimum cover is genuinely private-deficient.

**nu(G)=16.** Each triangle lies in a piece and each piece has packing number8, so nu(G)<=16. In the Clebsch bit-mask definition, for each of the five weight-four differences d, the pairs x,x XOR d form a perfect matching. These five matchings partition the rim edges. Choose a difference other than the difference of e, independently in both copies. The resulting two eight-packings avoid e and combine. This gives nu(G)=16.

## Full extension mechanism for every minimum C and every maximum Q

Let Q be any maximum private packing, so |Q|=10. Its triangles split into Q1,Q2; each Qi has at most5, hence each has exactly5. In piece i these five private apex triangles are a matching that saturates Ii and uses ten link vertices. The six unmatched link vertices Ui therefore lie outside Ii.

**Six-vertex residual fact.** Every six-vertex set U in the Clebsch link induces at least two edges. If it had no edges, alpha>=6. If it had exactly one edge ab, U minus {a} would be an independent five-set I'. The source classification says a has at least two neighbors in I', contradicting that ab is the only edge in U.

The triangles in Gi avoiding Qi correspond to edges of Li[Ui], so there are at least two distinct available rim edges before considering the other piece. The other piece's Q can remove at most e from them; thus each piece still has at least one residual full triangle.

Suppose a full extension contains only one extra triangle R beyond Q. If R uses a nonshared edge support, it cannot meet a residual triangle in the other piece (the only common edge of the pieces is e). If R contains e, Q did not contain e. Consequently, before adding R, the other piece still had at least two distinct available rim edges, and deleting e leaves another available triangle there. In either case Q union {R} is not full maximal. Q itself is also not full maximal. Therefore every inclusion-maximal full packing P extending Q has at least12 triangles.

Thus all three D variants hold on this graph, with a stronger displayed bound:

    |C|=22 < 24 <= 2|P|.

The new point is an explicit interacting noncone family that actually meets the private-deficiency premise and a proof controlling all eligible minimum-cover/private-packing choices. The proof uses one-edge overlap and the residual two-edge fact; it does not extend to arbitrary overlapping pieces.

## Global role and remaining bridge

This removes the earlier empirical omission for this family only. It does not prove D-all on arbitrary graphs. To turn the mechanism into an unrestricted theorem would require an available decomposition or an all-size substitute for the residual multiplicity versus shared-edge obstruction. Neither is supplied here. A larger passing census is not the next action; the next question is whether more complicated overlap can concentrate several residual requirements into one blocking triangle without creating a cheaper minimum cover.
