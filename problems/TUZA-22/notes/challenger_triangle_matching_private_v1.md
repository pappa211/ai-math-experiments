> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Private packing for triangle-plus-matching minimum covers with bipartite complement

Status: ORDINARY_PROOF_CANDIDATE; fresh review required. TUZA-22 challenger, 2026-11-16 local date. This all-size theorem strengthens the scoped ordinary triangle-plus-matching cover result by producing enough PRIVATE triangles. It does not assert availability of this cover shape in an arbitrary minimum CS obstruction.

## Theorem

Let C be a minimum triangle-edge cover of a finite simple graph G. Suppose C consists of a triangle T and a matching M vertex-disjoint from T, and suppose G−C is bipartite. Write q for the maximum packing number of actual triangles meeting C exactly once. Then

    |C| <= 2q.

Consequently every maximum private packing for this C already has the size needed in D-all, and so does every full extension. This is a scoped statement; the unrestricted D-all refutation is unaffected.

## Partition and exact triangle families

Choose a bipartition A,B of G−C. Every C-edge is internal to this partition: restoring a crossing C-edge would preserve bipartiteness and triangle-freeness, improving the cover. Thus T lies entirely in one part, say A. Let s matching edges of M lie in A and t lie in B, so |C|=s+t+3.

Every actual triangle is either T, a page on one of its three edges, or a page on exactly one matching base. Indeed two vertex-disjoint matching bases require four vertices, as does one matching base together with a T-edge; two T-edges force T. All pages in this partition are private. Every C-edge has at least one private page, since C is inclusion-minimal.

The terminal family formed by T and all its pages has a packing of size at least2. Otherwise it would be pairwise edge-intersecting, and the elementary book-or-K4 lemma would give a two-cover. Together with M this would improve C. Neither triangle in a terminal two-packing can be T, because T meets every terminal page, so the two triangles are private.

## Immediate packings and the sole unresolved balance

Choose one page from each A-matching base and append the terminal private two-packing. These s+2 triangles are mutually edge-disjoint because their A-base endpoints are pairwise disjoint outside T, and all their page apices lie in B. Also choosing one page from each B-matching base gives t mutually edge-disjoint private triangles. Therefore

    q >= max(s+2,t).

If t<=s+1, the first bound yields 2q>=s+t+3. If t>=s+3, the second does. Only t=s+2 remains, where we must find t+1 private triangles.

## A graph-specific one-to-two augmentation

Assume t=s+2 and q<=t. For each B-matching base i=u_i v_i, let R_i be the nonempty set of A-apices of its private pages. Any choices of one page from each B-base form a private t-packing.

Every page on an A-base f must have apex at an endpoint of one of the B-bases. Otherwise it is edge-disjoint from any such t-packing and can be appended. Call that B-base its owner. Only the owner's triangle can intersect the A-page: other B-bases have disjoint B-endpoints.

For every A-base f having a page owned by i, we must have R_i contained in the two endpoints of f. If some x in R_i missed f, choosing the owner's triangle x u_i v_i would avoid the A-page. It could then be appended to one chosen page from every B-base, contradicting q<=t.

We claim one B-base cannot own pages on two distinct A-bases f,g. If those pages have different apices u_i,v_i, they are edge-disjoint: their A-bases differ, and their cross spokes have different B-endpoints. Replace the owner's chosen triangle by these two and retain all other B-book choices, obtaining a private(t+1)-packing.

If the two pages have the same apex, say u_i, then the nonempty R_i is contained in f intersection g. Thus f,g share a vertex a. Because C[A] is the vertex-disjoint union of T and a matching, they must be two T-edges ab,ac. Literal triangle closure gives the third T-edge bc, and the assumed two pages give the actual spokes b u_i,c u_i. Hence b c u_i is another private page. Moreover R_i={a}, so a u_i v_i is an actual owner page. These two triangles share no edge. Again replace one owner triangle by these two while keeping the other B-book triangles, obtaining t+1.

Thus each B-base owns pages on at most one A-base. Every A-base has a private page and hence an owner. There are s+3 A-bases but only t=s+2 B-bases, a contradiction. This proves q>=t+1 and finishes all cases. QED.

## Dependencies and limits

The proof uses minimum-cover optimality, the elementary pairwise-intersecting actual-triangle book/K4 lemma, and literal endpoint closure of T. It uses no enumeration, solver, asymptotic input, or historical Tuza theorem. All outside apices are handled by the appendability argument before ownership is counted.

The earlier finite3+4 discriminator and the ordinary two-matching note are supporting special cases, not proof inputs. The no-two-C-edge-triangle geometry follows here from the bipartite-complement minimum cover. This geometry is absent in the unrestricted private-cover conjecture and in the Clebsch-derived D counterexample.
