> Curated source from TUZA-02/adversarial/FAMILY_CLASSIFICATION.md. Original SHA-256: `90bbc757238436fceb1e68a9b5734ee42dfc22c41f833487224d7eb5bfa47887`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Single-restoration family: exact small-packing classification


Let `a,b,c` be an independent set in a finite simple graph H. Restore the triangle `abc`, and let F consist of its new triangles. For each base edge `e ∈ {ab,bc,ca}`, let `N_e` be the vertices outside `{a,b,c}` adjacent in H to both endpoints. Apart from `abc`, F consists exactly of pages `e+x`, for `x ∈ N_e`.

**Lemma.** If `tau(F)=3` and `nu(F)≤2`, then there are exactly two vertices `x,y` meeting at least two vertices of `{a,b,c}`, and both x,y are adjacent to all three. Thus F is precisely the base triangle and the six pages of K_{3,2}. Conversely this family has `tau(F)=3`, `nu(F)=2`.

**Proof.** A page packing is exactly a matching of the bipartite graph with left side `{ab,bc,ca}`, right side the page apices, and adjacency `e~x` when `x∈N_e`. Indeed distinct pages using the same base edge intersect, and distinct base edges meet in one base vertex, so their pages intersect in an old edge exactly when their apices agree. The base triangle intersects every page, hence `nu(F)=max(1, matching number)`.

If a book `N_e` is empty, the other two base edges cover F, contradicting tau=3. If two books have union of size one, both consist of a common apex x; their two base edges meet at a vertex v, and the remaining base edge together with vx covers F, another contradiction. Hall's theorem and matching number at most two now imply that the union of all three books has size at most two. It must have size exactly two, say x,y.

For a graph-realizable apex, its incidence degree among the three books is either one (it has exactly two neighbors among a,b,c) or three (it has all three). Degree two cannot occur. Since every book is nonempty, at least one of x,y has incidence degree three. If the other has degree one, the other two books are both singleton at the first apex, already excluded. Therefore both have degree three, proving the classification.

Conversely, this family has a two-page packing and cannot have three pages with distinct apices. A cover must meet the base triangle. Two base edges leave a page on the third uncovered. One base edge and one old edge cannot cover both two-page books on the other two base edges. Thus tau=3. ∎

**Corollary (bowtie at h=1).** Let T1=vab and T2=vcd be edge-disjoint triangles, H=G minus their six edges, and suppose `nu(H)=tau(H)=1`, `nu(G)=3`. Then at least one individual restoration family Fi has tau at most two. No tripartiteness assumption is needed for this statement.

**Proof.** A packing in H+E(Ti) can be augmented by Tj, so nu(Fi)≤2. If both tau(Fi)=3, apply the lemma. Their apex pairs X1 and X2 lie outside S={v,a,b,c,d}, since H has no edge from v to any other member of S. Pick distinct y∈X1 and z∈X2, possible because each pair has size two. Let x be the other member of X1 and w the other member of X2. The four pages `abx, vay, cdw, vcz` are pairwise edge-disjoint: the only possible common edge between a page from each family is an edge incident to v and a shared apex, and the pages using v have distinct apices y,z. This contradicts nu(G)=3. ∎

This proves the proposed individual-family assertion only at h=1 in the bowtie case. It does not settle the general near-equality case, and is not a counterexample search certificate for all graphs.
