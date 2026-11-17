> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A crown gives classified residuals, but leaves a simultaneous footprint problem

Frozen ordinary proof candidate, 2026-11-16. This records a different interface for minimum CS, not a general crown exclusion or unrestricted theorem.

## Definition and primary-source provenance

A crown consists of distinct actual graph edges e_1,...,e_r,f_1,...,f_r, r>=3, with actual triangles T_i={e_i,f_i,e_(i+1)}, indices cyclic. Each e_i lies in exactly the two displayed triangles. Other triangles may contain the f_i. The definition and alternating reduction are classical: see Nomoto and van der Pol, Tuza's conjecture for binary geometries, arXiv:2112.06385v2 (23 May 2022), Section3, Claim7.5, which credits Tuza's 1990 crown method. Their all-size theorem is cographic; it is not an unrestricted graphic result. The primary PDF and hash are retained in literature/nomoto_vanderpol_2112.06385v2/receipt.json.

## Independent unweighted reconstruction for minimum combined CS

Let G be a minimum CS failure and suppose it contains a crown. Put q=floor(r/2). Choose q pairwise nonconsecutive crown triangles, for example T_1,T_3,...,T_(2q-1), and call this packing P. Delete all e_i and the q corresponding f_i to form K.

There is a cover X of every lost triangle with 2q edges. Include the q selected f_i; they cover every lost triangle not among the crown triangles, since the e_i occur nowhere else. The unselected crown triangles form isolated vertices of the cycle if r is even; choose one e-edge in each of these q triangles. If r is odd, the unselected triangles consist of q-1 isolated vertices and one adjacent pair; use the common e-edge for that pair and one e-edge for each isolated triangle. In both parities q further e-edges cover all unselected crown triangles. Hence |X|=2q.

The q selected triangles are disjoint from K. Writing k=nu(G), minimum-CS accounting gives

    2k-2q <= tau(K) <= 2nu(K) <= 2k-2q.

Thus K is tight, nu(K)=k-q, and proper-subgraph CS gives B(K). This holds for every maximum independent choice of crown triangles, not only the displayed indexing. All lost triangles and arbitrary outside pages on f_i are covered by the same accounting.

For r=4, the deleted edge set is exactly the union of two edge-disjoint missing triangles. The established two-triangle restoration theorem therefore excludes such a crown in a minimum CS failure. For larger even crowns, the same interface is B plus q edge-disjoint missing triangles; the accepted q<=2 equality restoration does not extend automatically. The odd case additionally deletes one e-edge unused by P.

## Why a simultaneous avoidance step is still missing

The unselected f_i remain in K and may lie together in a literal clique block. Avoidance of one edge per block cannot therefore be asserted. A concrete geometric control is the six-crown in the square of C6: the six consecutive-vertex triangles form the crown, the e_i are cycle edges, and the f_i are distance-two chords. Each parity of f_i forms a triangle. Attach a fresh vertex to one parity triangle to make it a K4. Deleting the opposite parity crown packing leaves that K4, so three surviving boundary f-edges are its triangle face. Every K4 triangle meets that face; a maximum K4 packing cannot avoid all three edges simultaneously. This is a footprint counterexample, not a CS counterexample or a proof of minimum-CS availability.

A successful extension must use different crown selections, a coordinated cover replacement, or a packing that absorbs the clique's boundary. The cographic theorem's availability of crowns does not transfer to arbitrary graphs. The current statement is only the exact balanced-residual identity above.
