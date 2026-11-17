> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Private three-packing for a triangle-plus-two-matching minimum cover

Status: ORDINARY_PROOF_CANDIDATE; fresh review required. TUZA-22 challenger, 2026-11-15 UTC. The finite discriminator suggested this argument, but the proof below treats arbitrary outside attachments and uses no enumeration.

## Statement

Let C be a minimum triangle-edge cover of a finite simple graph G. Suppose C consists of the three edges of a triangle T=abc and two vertex-disjoint matching edges e1,e2, whose endpoints are also disjoint from T. Suppose G−C is bipartite and there is a bipartition A,B in which every C-edge is internal. Then |C|=5 and the actual triangles meeting C in exactly one edge contain an edge-disjoint packing of size at least3.

The partition hypothesis is explicit: bipartiteness of G−C alone does not assert that a specified bipartition places C internally. For a minimum cover and a bipartite complement such a placement is automatic for every bipartition of G−C: a C-edge crossing it could be restored while preserving bipartiteness, improving C.

## Terminal family and the easy orientations

Every actual triangle belongs to exactly one of the following families: T itself; a page on one of T's edges; a page on e1; or a page on e2. A triangle cannot contain two vertex-disjoint matching bases or one matching base together with a T-edge. Two T-edges force T itself. Every page is therefore private to its displayed C-edge.

The family consisting of T and all its pages requires at least3 cover edges. Otherwise its two-cover together with e1,e2 would improve C. The elementary intersecting-triangle lemma says that a pairwise edge-intersecting actual triangle family is a book or lies in a K4, and hence has a two-cover. Consequently the terminal family has a two-packing. Neither triangle in such a packing can be T, because T meets every terminal page; both are private pages.

T lies in one part, say A. If either matching base also lies in A, any one of its private pages is edge-disjoint from all terminal pages: their A-bases have disjoint endpoints, and their B-apices do not create shared graph edges. Such a page exists because C is inclusion-minimal. Combining it with the terminal private two-packing proves the claim.

Thus only the orientation e1=uv and e2=wx entirely in B remains.

## A proved collapse of all relevant outside attachments

Suppose for contradiction that the private packing number is at most2. Every page of either matching base must have apex in T. Otherwise that page's A-apex is outside T, making both its cross spokes disjoint from every terminal page, so it can be appended to the terminal private two-packing.

Every terminal page must have apex among u,v,w,x. Otherwise it is edge-disjoint from a page on e1 and a page on e2. Those two pages always exist and are always mutually edge-disjoint: their B-bases have disjoint endpoints, so their cross spokes cannot coincide even when their A-apices coincide.

These two conclusions cover all actual triangle families from the initial partition. They do not assume that all graph vertices lie in this seven-vertex support; edges outside it may remain triangle-free and are irrelevant to coverage.

## Each matching endpoint sees at most two terminals

For either matching pair, say uv, let R=N(u) intersection N(v) intersection T be its nonempty set of page apices. If u saw all three vertices of T, select any a0 in R and choose the T-edge on the other two terminals. Its terminal page at u is edge-disjoint from the matching-base page a0uv. Append any page on the other matching base wx; its B-endpoints are disjoint from u,v and its base is also distinct, so no edge is shared. This gives a forbidden private three-packing. Thus each of u,v,w,x has at most two neighbors in T.

## A four-cover contradiction

Consider one matching pair uv. Write U=N(u) intersection T and V=N(v) intersection T. Both have size at most2 and R=U intersection V is nonempty. Its private family has a two-cover:

- If R={a0}, the two cross edges a0u,a0v hit its matching-base page and every terminal page at u orv. Any terminal page at either endpoint includes a0 because that endpoint has at most two T-neighbors.
- If |R|=2, write U=V={a0,b0}; the two edges a0b0 and uv hit all four possible private triangles of this pair.

There is at least one terminal page, since each T-edge is indispensable in C. Choose one, say the page on terminal edge f=a0b0 at u in the first pair uv. After selecting f, the first pair's remaining private family has a one-cover. If V={a0,b0}, select uv. If V is a singleton, select uv again. If V is a different two-set, R is a singleton, say {a0}, and selecting a0v hits both the page at v and the matching-base page. These cases exhaust V because |V|<=2 and U intersection V is nonempty.

Select f, this one additional edge for the first pair, and the two-cover of the second pair. This set has at most4 edges and hits all private pages; f also hits T. By the exact family partition it covers every actual triangle of G, contradicting tau(G)=5. Therefore the private family has a packing of size at least3. QED.

## Evidence boundary

The preliminary scripts/challenger_bipartite_private_bound.py tested exactly all4096 cross graphs on the seven named vertices. Every one had either an explicit private three-packing or an ordinary cover of size at most4. A separate witness-only verifier checked all4096 certificates. Those records are finite evidence only; the arbitrary-attachment collapse and four-cover argument above supply the ordinary all-size theorem.

This is one cover shape. It does not prove the private-cover conjecture for arbitrary bipartite-complement minimum covers, D-some-choice, or unrestricted Tuza/CS.
