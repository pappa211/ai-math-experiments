> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A general strictness mechanism for a nearly complete bipartite complement

Status: ORDINARY_PROOF_CANDIDATE; fresh review required. TUZA-22 challenger, 2026-11-15 UTC. This generalizes the proof of the two packing-four interfaces. It is not an unrestricted Tuza or CS proof.

## Theorem

Let k>=4 and 0<=r<=k be integers. Let G be a finite simple graph with a partition A union B such that:

- C, the set of all internal edges in the two parts, is a minimum triangle-edge cover of G;
- |C|=2k;
- at most r possible cross edges are absent; and
- min(|A|,|B|)>=k+r.

Then nu(G)>=k+1, so tau(G)=2k<2nu(G).

## Proof

For each vertex v, minimum-cover optimality gives d_internal(v)<=d_cross(v): replace all C-edges incident to v by all cross edges incident to v. Mixed triangles using removed edges are hit by their new cross edge at v, and an all-internal triangle through v retains the edge opposite v. Thus a strict reverse inequality would improve C.

An internal edge xy in A can be extended to a triangle using any page z in L(xy)=N_B(x) intersection N_B(y). All such lists have size at least |B|−r>=k. A proper list edge coloring of internal bases assigns these pages so that triangles on different bases share no cross edge. Use the symmetric definition in B.

If A contains at least k+1 internal edges, choose that many. Unless they form a star, their line graph is not K_(k+1): a pairwise-intersecting edge family in a simple graph with at least4 edges has a common endpoint. A graph on k+1 vertices other than K_(k+1) is (k−1)-degenerate, so its lists of size at least k admit a proper coloring by reverse greedy elimination. These triangles form a (k+1)-packing.

If the chosen edges are a star centered at x, let R=N_B(x). The degree inequality gives |R|>=k+1. Each page list has size at least k. At most r<=k leaf lists are proper subsets of R, because each proper subset requires a missing cross edge at its leaf. Hence some list is all of R, and the union of all k+1 lists has size at least k+1. Every subfamily of at most k lists has union of size at least k. Hall supplies distinct pages for the k+1 bases. This also gives the required packing. The same argument handles B if it contains at least k+1 internal edges.

The only remaining case is exactly k internal edges in each part. Choose an internal B-edge uv. It has at least |A|−r>=k common neighbors in A. The internal A-graph has total degree2k. At most floor(2k/(k−1))=2 of its vertices have internal degree at least k−1, because k>=4. Since k>=4, one common neighbor x has internal degree d<=k−2. Reserve triangle xuv.

For each of A's k bases incident to x, delete u and v from its page list. At most d bases are affected, and their lists retain at least k−2>=d colors. Assign distinct permitted colors to these d bases greedily. Then color every remaining A-base in any order, avoiding all previously used colors: its unchanged list has at least k entries and there are at most k−1 prior bases. Thus the k resulting triangles are pairwise edge-disjoint and avoid both reserved cross edges xu,xv. Their bases are in A, so none uses the reserved internal B-edge uv. Together with xuv they give k+1 triangles. QED.

## Scope and application

The theorem allows arbitrary all-internal triangles; they are included when invoking cover minimality. It supplies a concrete packing mechanism once the displayed partition is proved. It does not show that an arbitrary minimum cover has such a complement.

The finite interfaces of notes/challenger_near_bipartite_five_packing_v1.md are k=4,r=2 with parts6+6 and k=4,r=1 with parts5+7. This generalization does not modify that frozen source or its review record.
