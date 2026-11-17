> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: higher-overlap leaf profiles

**PASS for the ordinary profile identities, full-gain descent, and K4-completion lemma.** The two explicit descent counterexamples also pass independent finite checking. The larger targeted enumeration and its aggregate counts were not independently reproduced by this review.

Reviewed `notes/mixed_residual_bridge_frozen.md`. The initial wording about deleting a new piece's edges was clarified during review: delete precisely E(K_s) minus E(A), retaining the old separator clique and every background edge. The clarified frozen hash is `04aa26fb4d3ecd86d9a511d4e100c01e4d820aa4f554a00ca6657921e9ee00de`. This was a resolved wording ambiguity, not a changed mathematical claim. The no-crossing-triangle hypothesis is essential for treating the added clique as the complete new triangle family.

## Exact profiles

For K4 attached on triangle A, two new pages always share a new spoke, so at most one can be packed. A chosen page uses exactly its old base f. This proves the stated maximum of p and 1+nu(H-f). A cover with no new spoke must contain every edge of A, at exact cost 3+tau(H-E(A)). Any other cover costs at least tau(H)+1, and one new spoke suffices when an H cover already contains an A edge. Thus the cover formula is exact.

For K5 attached on triangle A, a page xya uses no old edge and appends to every H packing. At most two new triangles fit: without an xy-page there is at most one x-page and one y-page; with xya selected, the only remaining x-page and y-page would both use the opposite old base bc and therefore conflict. Every two-packing uses at least one old base, while xya together with xbc realizes a pair using just any prescribed base bc. This gives precisely max(p+1,2+max_f nu(H-f)).

If an old cover contains all A edges, the additional xy edge covers the remaining new triangles, giving 4+tau(H-E(A)). Otherwise some base is absent from the cover. Its x-page and y-page require two new spokes; selecting xy adds a third edge. If xy is not selected, the three xy-pages have disjoint spoke pairs and also require at least three new edges. Three suffice whenever the old cover contains ab: select xc,yc,xy. The stated minimum of the two cover costs follows.

For K5 attached on K4 A, new pages consume two of four spokes. A pair is disjoint exactly when its old bases form a perfect matching. This proves the three packing alternatives. If Z is the selected spoke set, all old edges in A minus Z must be forced into the old cover. The exact cost is |Z|+|E(A minus Z)|+tau(H-E(A minus Z)). The sixteen choices reduce as stated: |Z|=0 gives the six-edge term, |Z|=1 gives the triangle terms, and the minimum over |Z|=2 is 2+tau(H), since some edge of A belongs to a minimum H cover. Cases |Z|>=3 are dominated. Thus the cover increase is at most two.

These identities describe a specified actual leaf region. They do not prove that an arbitrary graph or response table has such a region, and they do not erase background edges needed for future restoration.

## Resilience and defect accounting

If at most b new triangles fit and nu(G)=nu(H)+b, then resilience of G at any old edge f gives

    nu(H)+b = nu(G-f) <= nu(H-f)+b <= nu(H)+b.

Hence every inequality is equality and H is resilient. Full packing gain is necessary for this argument; final resilience alone does not imply it.

The K4-completion lemma is valid. For a critical edge f in defect-one H, CS on H-f and cover extension force H-f to be tight B. Since f is critical it lies in a triangle, and by hypothesis that triangle belongs to a literal K4 containing f. Removing f leaves the two opposite triangles sharing an edge. Their common triangle component contains all four K4 vertices. A literal K4 or K5 support on that component would contain every pair of those vertices, including the missing edge f. Contradiction. Thus no edge is critical. This proof requires CS on H-f explicitly; it is not an unconditional theorem about arbitrary K4-covered graphs.

The subsequent defect arithmetic checks. Writing gain g=nu(G)-nu(H) and cover increment c=tau(G)-tau(H),

    d(H)=1-2g+c

for a final defect-one child. The three cover bounds give c<=1,3,2 respectively. The packing formulas identify critical separator edges in each low-gain branch. Proper-subgraph CS excludes negative predecessor defect; tight predecessors are B and therefore resilient; for a frozen-F predecessor, the K4-completion lemma excludes defect-one predecessors with a critical edge. These are exactly the premises needed for the stated defect-two critical-triangle branch and the remaining K4-separator cases. No unjustified descent of resilience appears.

The K5-on-K4 full-gain-two branch would increase defect by at least two, so it is impossible in a final defect-one graph when the predecessor satisfies Tuza. The gain-zero and gain-one branches retain the limitations stated in the frozen note; they are not a classification or replacement theorem.

## Explicit failure controls and unreproduced scope

`reviews/critic_bridge_check.py` independently constructs the two stated graphs, enumerates all actual triangles, computes exact packing and cover optima, and checks every single-edge deletion of predecessor and child. It imports no discovery code.

The first transition has predecessor (nu,tau)=(3,4), including packing loss after deleting edge 23, and a seven-vertex resilient child with (4,5). The second has a nonresilient seven-vertex predecessor with (4,5) and an eight-vertex resilient child with (4,6). Thus unconditional resilience descent fails at child defects three and two. Neither witness has child defect one, so neither refutes defect-one descent.

The receipt is `reviews/critic_bridge_check.json`. The claims of 3,380 distinct child graphs, 17,014 presentations, other aggregate coverage counts, and smallest-found status were not independently replayed here. They remain the worker's reported execution results rather than results of this fresh checker. Likewise this review does not independently reproduce all 36 stated profile controls; the profile formulas were checked by ordinary proof.

No unrestricted Tuza/CS proof, universal leaf availability, historical priority, or Lean verification is asserted. No mathematical discrepancy remains in the reviewed ordinary statements or the two explicit witnesses.
