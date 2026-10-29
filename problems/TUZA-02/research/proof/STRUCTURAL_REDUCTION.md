> Curated source from TUZA-02/proof/STRUCTURAL_REDUCTION.md. Original SHA-256: `7302c4c58806b6540e4932f75113ffd93e4d44dc9e96d5dccd95b35f8545f90f`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Every slack-one remainder has one defective triangle component


## Proposition

Let H be a finite simple graph whose triangle hypergraph is 3-partite and suppose

\[
\tau(H)=2\nu(H)-1.
\]

Form the triangle-intersection graph I(H): its vertices are the triangles of H, and two are adjacent exactly when they share a graph edge. Then exactly one connected component C of I(H) has slack one. Every other connected component consists precisely of the four faces of a K4.

Equivalently, the triangle family of H is an edge-disjoint union of isolated K4 face families and the full triangle family of one graph R with

\[
\tau(R)=2\nu(R)-1
\]

whose triangle-intersection graph is connected. Edges of H belonging to no triangle can be present arbitrarily; they do not affect this decomposition.

**Proof.** For each component C_j of I(H), let E_j be the union of its triangle edge sets, and let H_j have edge set E_j. The E_j are pairwise disjoint. The triangles of H_j are exactly C_j: any triangle using edges of E_j is an H-triangle sharing an edge with a member of C_j, hence lies in that same component. Consequently

\[
\nu(H)=\sum_j\nu(H_j),\qquad
\tau(H)=\sum_j\tau(H_j).
\]

The 3-partition of the triangle hypergraph restricts to each H_j, so Aharoni gives nonnegative integer slacks

\[
\delta_j=2\nu(H_j)-\tau(H_j)\ge0.
\]

Their sum is one, so exactly one component has delta_j=1 and every other has delta_j=0. By the graphical equality decomposition, an equality component consists of edge-disjoint K4 face families. Distinct such families have no common graph edge and therefore are disconnected in I(H). Since C_j is connected and nonempty, it is exactly one K4 face family. ∎

## Consequence of the new restoration theorem

The packing-essential-edge theorem settles the two-triangle restoration problem whenever some edge of H is essential to its packing number. Any unresolved slack-one case must therefore have

\[
\nu(R-e)=\nu(R)\quad\text{for every edge }e\in E(R)
\]

in its unique defective component R. The same is already true inside every equality K4 component.

The flat-remainder theorem and the K4-star arguments settle several explicit possibilities for R. They do not classify all possibilities.

In particular, the proposition does **not** say that R has bounded order, that only a finite list of cores can occur, or that the external K4 components can always be discarded when restoring triangles. The restored families may interact with arbitrarily many K4 components and with old triangle-free edges. Those interactions require the compatibility arguments in the individual proofs.
