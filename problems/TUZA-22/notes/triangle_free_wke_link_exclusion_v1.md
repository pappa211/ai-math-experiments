> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-free WKE link components: strict combined-obstruction exclusion

TUZA-22 restoration role, frozen2026-11-15 UTC. PROOF_CANDIDATE_USING_DECLARED_INPUT pending independent review. This lifts a precise WKE condition to combined CS minimality; it does not assume all triangle-free graphs are WKE.

## Exact statement and published input

A graph L is weak Konig-Egervary (WKE) if it has a matching M and a vertex cover Q of L-M with |Q|<=|M|. This is Puleo's definition in *Tuza's Conjecture for Graphs of Maximum Average Degree Less Than7*, [published article](https://doi.org/10.1016/j.ejc.2015.03.006), Section4. The WKE reduction alone is an inequality mechanism; the equality contradiction below is supplied explicitly.

**Claim.** In a minimum-edge failure of CS, no closed component of any hub link is both triangle-free and WKE. Graph order, hub degree, other link components, and outside attachments are unrestricted.

External declared input used only for the unique-matching branch: Kotzig's theorem says a connected graph with a unique perfect matching has a bridge belonging to that matching. Inspected primary proof: Gleb Nenashev, *A short proof of Kotzig's theorem*, arXiv:1402.0949v1,5February2014, Theorem1 and its proof on pages1–2. [Primary PDF](https://arxiv.org/pdf/1402.0949). The local copy is `literature/Nenashev_1402.0949.pdf`, SHA256 `207d4fdf17085c1452b1881040b131a012f175a0ba4404e8559f29fcb315ad08`. Kotzig's original1959 paper is cited by that source; the original was not separately inspected. No novelty claim for the elementary consequence below is made.

## Lemma: deleting a unique perfect matching leaves a strict vertex-cover bound

If X is a nonempty graph with a unique perfect matching M of size r, then

    alpha(X-M)>=r+1,

so X-M has a vertex cover of size at most r-1.

Proof by induction on r, using Kotzig. The assertion is immediate for r=1. If X is disconnected, each component has a unique perfect matching. Induction applied to the nonempty components gives an independent set in X-M of size at least r plus the number of components, hence at least r+1.

Now suppose X connected. Kotzig supplies a matching bridge uv. Its removal splits X into odd vertex sets A,B with u in A,v in B. The induced graphs X[A-u] and X[B-v] have unique perfect matchings M_A,M_B: a different matching in either would combine with uv and the unchanged other side to contradict uniqueness in X. Write r_A=|M_A|,r_B=|M_B|, so r=r_A+r_B+1.

If A-u is nonempty, induction gives an independent set of size at least r_A+1 in (X[A-u])-M_A, also independent in (X-M)[A]. If A-u is empty, use the singleton {u}, again of size r_A+1. Do the same on B. No edge joins A to B in X-M, because uv was a bridge and is deleted. The two independent sets combine to size r_A+r_B+2=r+1. QED.

## Main proof

Let G be a minimum CS failure with k=nu(G), and let L be a triangle-free closed link component at hub v. The accepted class-independent codegree lemma gives delta(L)>=2. Let M,Q witness WKE and put r=|M|.

Form K by deleting all v-spokes to V(L) and all M rim edges. The r hub triangles on M use only deleted edges. X=M union {vq:q in Q} meets every lost triangle: all triangles through deleted spokes correspond to L edges by closedness, and each such rim edge is in M or has an endpoint in Q; every other lost triangle directly uses M. Thus |X|<=2r is a valid reduction tuple.

If |Q|<r, it is strict, contradicting M0 accounting. Therefore |Q|=r and balanced accounting gives

    B(K), nu(K)=k-r.

Each residual clique block contains at most two L vertices because L is triangle-free. Consequently it contains at most one surviving L edge. A maximum K-packing can avoid **all** surviving L edges simultaneously, choosing a maximum in each block avoiding that one edge. If L had a matching larger than r, its hub triangles could append and exceed k. Therefore M is a maximum matching of L.

Suppose there is another maximum matching M'. Choose f=ab in M-M'. By codegree>=2, f has an actual triangle abx other than vab. The apex x lies outside V(L), since L is triangle-free. The r hub triangles on M' and the page abx are pairwise edge-disjoint: M' avoids f, all its rim endpoints lie in L, and x is outside L.

Their full surviving K footprint consists of the surviving M' rim edges and page spokes ax,bx. Each residual block contains at most one M' edge (it contains at most two L vertices) and at most one page spoke (ab is deleted). If it contains both, they share an L endpoint, or else the block would contain three L vertices. Thus the footprint is a star of at most two edges, avoidable by a maximum K4/K5 packing. Appending these r+1 triangles gives k+1, contradiction.

It remains that M is the unique maximum matching of L. It must be perfect. Otherwise an unmatched vertex w has a neighbor u by delta(L)>=2. Maximality makes u matched, say to z; replacing uz by wu gives a different maximum matching of the same size, contradiction. (Minimum degree1 would already suffice for this step.)

Apply the lemma to the unique perfect matching M of L. There is a vertex cover Q' of L-M of size at most r-1. Reuse the same deleted graph K and initial r hub triangles, but the lost-triangle cover M union vQ' has at most2r-1 edges. This is a strict tuple, again contradicting M0.

Every branch contradicts a minimum CS failure. QED.

## Exact significance and limitations

This excludes an all-size class of triangle-free link components under an explicit matching/cover certificate. It contains the direct odd-cycle theorem and the earlier bipartite mechanism as special cases. It supplies the missing equality restoration at this local interface, rather than citing an inequality-only WKE reduction as sufficient.

No claim is made that every triangle-free graph is WKE; that would be a different and much stronger statement. The remaining global obligation is to show that some available link/reduction in every possible minimum obstruction belongs to an excluded class, or to find a different contradiction. Arbitrary dense triangle-free links outside WKE are not addressed.
