> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Book-defect triangle restoration — independent review

Source: `notes/book_residual_triangle_restoration_v1.md`; frozen hash and completion timestamp below. **Verdict: ACCEPT as an ordinary all-size proof at the stated component-class scope.** No unresolved mathematical objection found. The proof does not classify arbitrary defect-one graphs, and its use of the independently reviewed nu<=2 CS theorem is acyclic.

Let the old K4/K5 components contribute packing m and cover2m, and let b nonempty book components contribute packing b and cover b. Restoring the independent terminal triangle adds a packing triangle and at most three cover edges. The b>=2 case is therefore strict, the b=0 case is R1, and b=1 gives the inequality directly. Under equality in the latter case, nu(G)=m+2 and tau(G)=2m+4.

The following equality argument reconstructs the nontrivial step. Three independent new pages would append to a maximum packing of the old **clique components only**, whose size is m. The relevant old footprints in those components remain stars of at most two edges because the terminal triple is independent in H. The old book is deliberately omitted from this packing, so there is no unsupported assertion that its spine or spokes can be avoided. Three new pages would contradict nu(G)=m+2. Thus the new-family page matching number is at most two.

A cover of the entire new family by two edges would combine with a minimum H-cover of size2m+1 and contradict equality. The previously proved page classification therefore forces the exact seven-triangle K5-e new family on terminal triple abc and two full apices x,y. It is crucial that this describes the entire new family, including all crossing pages; no bounded-core inference is made.

Every old spoke belongs to a three-edge cover of this family. If any spoke lies in an old K4/K5 component, choose a minimum clique-component cover containing it and add the book spine. This is a minimum H-cover containing the spoke; the new-family three-cover then adds at most two edges, again contradicting equality. Hence all new-family edges are disjoint from old clique-component support.

Old book support was already disjoint from old clique support by the actual triangle-component hypothesis. Therefore the union J of the old book's support and all new-family edges is separated in triangle support from every old K4/K5 component. Every actual triangle of this literal subgraph J is either an old book triangle or one of the new triangles: it is an actual G-triangle, and an old clique triangle cannot have its edges in the disjoint support. This justifies the additivity step nu(J)=2,tau(J)=4 without assuming ordinary vertex/block separation.

The independently reviewed CS theorem for nu<=2 yields B(J). The seven new triangles are shared-edge connected and span five vertices, so they belong to a literal K5 component on exactly abcxy. Hence xy is an actual old edge. The old triangles axy,bxy,cxy all exist and lie in the one old book. Their only common edge is xy, forcing its spine to be xy. Any additional old page would attach a sixth vertex to the same component of J, contradicting its literal K5 support. Thus the book had exactly the three pages a,b,c, and the restored terminal triangle completes it to K5. Old clique components remain unchanged.

Checks covered: background edges; shared vertices between components; empty/nonempty books; omission of the old book from the three-page packing; complete new-family quantification; literal support of J and all its actual triangles; the five-vertex component-size inference; and the precise dependency on the already reviewed two-triangle restoration theorem. None supplies an arbitrary defect-one classification.

The exact global consequence is exclusion of minimum-CS triangle residuals whose components are all K4/K5/books. Since such residuals have defect one, exactly one book would occur, and this theorem restores CS. Defect-one components such as K5-e and other nonbook configurations remain outside its scope. Original H-D and the global two-edge blocker retain their separate open status.

Reviewed source SHA-256: `c5fe34c7f5ead292eadf99a6f028d9dbdab56a9ed15c6ba03b23b64b11cba4d8`.
Review completed UTC: 2026-11-15T22:19:25.229133+00:00.
